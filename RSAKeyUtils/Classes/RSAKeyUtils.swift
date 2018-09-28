import Foundation
import Security
import UIKit

@available(iOS 10.0, *)
public class RSAKeyUtils {
    
    @objc public static func getKeyFromKeychain(_ tagName: String) -> SecKey? {
        return RSAUtils.getRSAKeyFromKeychain(tagName);
    }
    
    @objc public static func importPublicKeyFromPEM(_ pemString: String, tagName: String) -> SecKey? {
        do {
            return try RSAUtils.addRSAPublicKey(pemString, tagName: tagName)
        }
        catch {
            return nil;
        }
    }
    
    @objc public static func importPrivateKeyFromPEM(_ pemString: String, tagName: String) -> SecKey? {
        do {
            return try RSAUtils.addRSAPrivateKey(pemString, tagName: tagName)
        }
        catch {
            return nil;
        }
    }
    
    @objc public static func removeKeyFromKeychain(_ tagName: String) {
        RSAUtils.deleteRSAKeyFromKeychain(tagName)
    }
    
    @objc public static func exportPublicKeyToPEM(_ pubKey: SecKey) -> String? {
        return CryptoExportImportManager.exportPublicKeyToPEM(pubKey);
    }
    
    @objc public static func exportPrivateKeyToPEM(_ privKey: SecKey) -> String? {
         return CryptoExportImportManager.exportPrivateKeyToPEM(privKey);
    }
    
    
    
}
