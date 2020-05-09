import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home> {

  //creating controllers for text fields
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  //creating variables for receiving user inputs
  String age, height, weight;

  //variables for displaying weight and status
  String calculatedWeight = "", weightStatus = "";
  double _BMI = 0.0;

  void calculateBMI(){
    setState(() {
      age = _ageController.text;
      height = _heightController.text;
      weight = _weightController.text;

      if(age.isEmpty || height.isEmpty || weight.isEmpty){

      } else{
        _BMI = doCalculation(weight, height);
      }

    });
  }

  double doCalculation(String weight, String height){
    return (703*double.parse(weight)) / ((double.parse(height)*12) * (double.parse(height))*12);
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI App"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: new Container(
        child: new ListView(

          children: <Widget>[

            new Padding(padding: new EdgeInsets.all(10.0)),

            //adding the BMI logo
            new Image.asset(
              "images/logo.png",
              height: 100.0,
              width: 150.0,
            ),

            //creating container for the text fields
            new Container(
              padding: new EdgeInsets.all(15.0),
              margin: new EdgeInsets.all(10.0),
              color: Colors.grey.shade300,
              height: 350.0,
              width: 380.0,

              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.only(top: 15.0)),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Height in feet",
                      icon: new Icon(Icons.accessibility)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.only(top: 15.0)),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight in lb",
                      icon: new Icon(Icons.line_weight)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.only(top: 25.0)),

                  //creating raised button container
                  new Center(
                    child: new RaisedButton(
                        onPressed: calculateBMI,
                    child: new Text("Calculate",
                      style: new TextStyle(color: Colors.white),),
                      color: Colors.pink,
                    ),
                  )

                ],
              ),
            ),

            //creating text views
            new Container(
              child: new Center(
                child: new Column(
                  children: <Widget>[

                    new Text("$_BMI",
                      style: new TextStyle(color: Colors.black54,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic
                      ),
                    ),

                    new Padding(padding: new EdgeInsets.all(7.5)),

                    new Text(_BMI > 28.5 ? "Overwieghed!" : "All Good!",
                    style: new TextStyle(
                      fontSize: 19.2,
                      color: _BMI > 28.5 ? Colors.red : Colors.green,
                    ),)

                  ],
                ),
              ),
            )

          ],

        ),
      ),
    );
  }
}