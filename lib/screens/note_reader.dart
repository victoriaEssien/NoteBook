import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
   NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
   QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black38),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Edit"),
                onTap: () {
                  print("Run this function...");
                },
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Delete"),
                onTap: () {
                  print("Run that function...");
                },
              ),
            ],
            offset: Offset(0, 100),
            color: Colors.white,
            elevation: 2,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.doc["note_title"], style: AppStyle.mainTitle,),
            const SizedBox(height: 4.0),
            Text(widget.doc["creation_date"], style: AppStyle.dateTitle,),
            const SizedBox(height: 30.0),
            Text(widget.doc["note_content"], style: AppStyle.mainContent, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
