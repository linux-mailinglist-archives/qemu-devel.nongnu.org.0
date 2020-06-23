Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E120611D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 22:58:46 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnq0D-0000uF-Fz
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 16:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsW-0004jS-Ie; Tue, 23 Jun 2020 16:50:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56418
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsU-0001pj-0a; Tue, 23 Jun 2020 16:50:48 -0400
Received: from host86-158-109-79.range86-158.btcentralplus.com
 ([86.158.109.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnpsO-0007T1-6J; Tue, 23 Jun 2020 21:50:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Tue, 23 Jun 2020 21:49:25 +0100
Message-Id: <20200623204936.24064-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
References: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 11/22] adb: introduce new ADBDeviceHasData method to
 ADBDeviceClass
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is required later to allow devices to assert a service request (SRQ)
signal to indicate that it has data to send, without having to consume it.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/input/adb-kbd.c     | 8 ++++++++
 hw/input/adb-mouse.c   | 9 +++++++++
 include/hw/input/adb.h | 3 +++
 3 files changed, 20 insertions(+)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 027dd3e531..23760ecf7b 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -300,6 +300,13 @@ static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
     return olen;
 }
 
+static bool adb_kbd_has_data(ADBDevice *d)
+{
+    KBDState *s = ADB_KEYBOARD(d);
+
+    return s->count > 0;
+}
+
 /* This is where keyboard events enter this file */
 static void adb_keyboard_event(DeviceState *dev, QemuConsole *src,
                                InputEvent *evt)
@@ -382,6 +389,7 @@ static void adb_kbd_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 
     adc->devreq = adb_kbd_request;
+    adc->devhasdata = adb_kbd_has_data;
     dc->reset = adb_kbd_reset;
     dc->vmsd = &vmstate_adb_kbd;
 }
diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
index 78b6f5030c..e2359fd74d 100644
--- a/hw/input/adb-mouse.c
+++ b/hw/input/adb-mouse.c
@@ -197,6 +197,14 @@ static int adb_mouse_request(ADBDevice *d, uint8_t *obuf,
     return olen;
 }
 
+static bool adb_mouse_has_data(ADBDevice *d)
+{
+    MouseState *s = ADB_MOUSE(d);
+
+    return !(s->last_buttons_state == s->buttons_state &&
+             s->dx == 0 && s->dy == 0);
+}
+
 static void adb_mouse_reset(DeviceState *dev)
 {
     ADBDevice *d = ADB_DEVICE(dev);
@@ -252,6 +260,7 @@ static void adb_mouse_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 
     adc->devreq = adb_mouse_request;
+    adc->devhasdata = adb_mouse_has_data;
     dc->reset = adb_mouse_reset;
     dc->vmsd = &vmstate_adb_mouse;
 }
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index 15b1874a3d..9b80204e43 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -39,6 +39,8 @@ typedef struct ADBDevice ADBDevice;
 typedef int ADBDeviceRequest(ADBDevice *d, uint8_t *buf_out,
                               const uint8_t *buf, int len);
 
+typedef bool ADBDeviceHasData(ADBDevice *d);
+
 #define TYPE_ADB_DEVICE "adb-device"
 #define ADB_DEVICE(obj) OBJECT_CHECK(ADBDevice, (obj), TYPE_ADB_DEVICE)
 
@@ -62,6 +64,7 @@ typedef struct ADBDeviceClass {
     /*< public >*/
 
     ADBDeviceRequest *devreq;
+    ADBDeviceHasData *devhasdata;
 } ADBDeviceClass;
 
 #define TYPE_ADB_BUS "apple-desktop-bus"
-- 
2.20.1


