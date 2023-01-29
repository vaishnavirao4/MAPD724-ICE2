

import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth:CGFloat?
var screenHeight:CGFloat?

class GameScene: SKScene {
    
    var ocean1:Ocean?
    var ocean2:Ocean?
    var island:Island?
    var clouds:[Cloud] = []

    var plane:Player?
    
    override func sceneDidLoad() {
        
        screenWidth = frame.width
        screenHeight = frame.height

        name = "GAME"
    

        //add ocean
        ocean1 = Ocean()
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean1!)
        addChild(ocean2!)

        //add plan
        plane = Player()
        addChild(plane!)
        
        //add island
        island = Island()
        addChild(island!)
        
        
        //add cloud
        for _ in 0...2 {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }


    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       print("Touch Down")
        plane!.touchesMove(point: pos)

    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("Touch Moved")
        plane!.touchesMove(point: pos)

    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Touch Up")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean1?.update()
        ocean2?.update()
        plane?.update()
        island?.update()
        //cloud update
        for cloud in clouds {
            cloud.update()
           
        }

    }
}


