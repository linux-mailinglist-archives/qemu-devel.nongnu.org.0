Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061220611E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 22:59:44 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnq19-0003JK-8x
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 16:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnptN-0005yJ-0z; Tue, 23 Jun 2020 16:51:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56504
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnptL-0002Jk-5n; Tue, 23 Jun 2020 16:51:40 -0400
Received: from host86-158-109-79.range86-158.btcentralplus.com
 ([86.158.109.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jnptG-0007T1-Tk; Tue, 23 Jun 2020 21:51:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Tue, 23 Jun 2020 21:49:35 +0100
Message-Id: <20200623204936.24064-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
References: <20200623204936.24064-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 21/22] adb: use adb_device prefix for ADB device trace
 events
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

This is to allow us to distinguish between ADB device events and ADB
bus events separately.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/input/adb-kbd.c    | 12 ++++++------
 hw/input/adb-mouse.c  | 12 ++++++------
 hw/input/trace-events | 20 ++++++++++----------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 23760ecf7b..3cfb6a7a20 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -243,7 +243,7 @@ static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
     olen = 0;
     switch (cmd) {
     case ADB_WRITEREG:
-        trace_adb_kbd_writereg(reg, buf[1]);
+        trace_adb_device_kbd_writereg(reg, buf[1]);
         switch (reg) {
         case 2:
             /* LED status */
@@ -256,7 +256,7 @@ static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
             case ADB_CMD_CHANGE_ID_AND_ACT:
             case ADB_CMD_CHANGE_ID_AND_ENABLE:
                 d->devaddr = buf[1] & 0xf;
-                trace_adb_kbd_request_change_addr(d->devaddr);
+                trace_adb_device_kbd_request_change_addr(d->devaddr);
                 break;
             default:
                 d->devaddr = buf[1] & 0xf;
@@ -270,8 +270,8 @@ static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
                     d->handler = buf[2];
                 }
 
-                trace_adb_kbd_request_change_addr_and_handler(d->devaddr,
-                                                              d->handler);
+                trace_adb_device_kbd_request_change_addr_and_handler(
+                    d->devaddr, d->handler);
                 break;
             }
         }
@@ -294,7 +294,7 @@ static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
             olen = 2;
             break;
         }
-        trace_adb_kbd_readreg(reg, obuf[0], obuf[1]);
+        trace_adb_device_kbd_readreg(reg, obuf[0], obuf[1]);
         break;
     }
     return olen;
@@ -321,7 +321,7 @@ static void adb_keyboard_event(DeviceState *dev, QemuConsole *src,
     /* FIXME: take handler into account when translating qcode */
     keycode = qcode_to_adb_keycode[qcode];
     if (keycode == NO_KEY) {  /* We don't want to send this to the guest */
-        trace_adb_kbd_no_key();
+        trace_adb_device_kbd_no_key();
         return;
     }
     if (evt->u.key.data->down == false) { /* if key release event */
diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
index e2359fd74d..577a38ff2e 100644
--- a/hw/input/adb-mouse.c
+++ b/hw/input/adb-mouse.c
@@ -121,7 +121,7 @@ static int adb_mouse_request(ADBDevice *d, uint8_t *obuf,
         s->dx = 0;
         s->dy = 0;
         s->dz = 0;
-        trace_adb_mouse_flush();
+        trace_adb_device_mouse_flush();
         return 0;
     }
 
@@ -130,7 +130,7 @@ static int adb_mouse_request(ADBDevice *d, uint8_t *obuf,
     olen = 0;
     switch (cmd) {
     case ADB_WRITEREG:
-        trace_adb_mouse_writereg(reg, buf[1]);
+        trace_adb_device_mouse_writereg(reg, buf[1]);
         switch (reg) {
         case 2:
             break;
@@ -152,7 +152,7 @@ static int adb_mouse_request(ADBDevice *d, uint8_t *obuf,
             case ADB_CMD_CHANGE_ID_AND_ACT:
             case ADB_CMD_CHANGE_ID_AND_ENABLE:
                 d->devaddr = buf[1] & 0xf;
-                trace_adb_mouse_request_change_addr(d->devaddr);
+                trace_adb_device_mouse_request_change_addr(d->devaddr);
                 break;
             default:
                 d->devaddr = buf[1] & 0xf;
@@ -172,8 +172,8 @@ static int adb_mouse_request(ADBDevice *d, uint8_t *obuf,
                     d->handler = buf[2];
                 }
 
-                trace_adb_mouse_request_change_addr_and_handler(d->devaddr,
-                                                                d->handler);
+                trace_adb_device_mouse_request_change_addr_and_handler(
+                    d->devaddr, d->handler);
                 break;
             }
         }
@@ -191,7 +191,7 @@ static int adb_mouse_request(ADBDevice *d, uint8_t *obuf,
             olen = 2;
             break;
         }
-        trace_adb_mouse_readreg(reg, obuf[0], obuf[1]);
+        trace_adb_device_mouse_readreg(reg, obuf[0], obuf[1]);
         break;
     }
     return olen;
diff --git a/hw/input/trace-events b/hw/input/trace-events
index a2888fd10c..6f0d78241c 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -1,18 +1,18 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
 # adb-kbd.c
-adb_kbd_no_key(void) "Ignoring NO_KEY"
-adb_kbd_writereg(int reg, uint8_t val) "reg %d val 0x%2.2x"
-adb_kbd_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%2.2x obuf[1] 0x%2.2x"
-adb_kbd_request_change_addr(int devaddr) "change addr to 0x%x"
-adb_kbd_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
+adb_device_kbd_no_key(void) "Ignoring NO_KEY"
+adb_device_kbd_writereg(int reg, uint8_t val) "reg %d val 0x%2.2x"
+adb_device_kbd_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%2.2x obuf[1] 0x%2.2x"
+adb_device_kbd_request_change_addr(int devaddr) "change addr to 0x%x"
+adb_device_kbd_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
 
 # adb-mouse.c
-adb_mouse_flush(void) "flush"
-adb_mouse_writereg(int reg, uint8_t val) "reg %d val 0x%2.2x"
-adb_mouse_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%2.2x obuf[1] 0x%2.2x"
-adb_mouse_request_change_addr(int devaddr) "change addr to 0x%x"
-adb_mouse_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
+adb_device_mouse_flush(void) "flush"
+adb_device_mouse_writereg(int reg, uint8_t val) "reg %d val 0x%2.2x"
+adb_device_mouse_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%2.2x obuf[1] 0x%2.2x"
+adb_device_mouse_request_change_addr(int devaddr) "change addr to 0x%x"
+adb_device_mouse_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
 
 # pckbd.c
 pckbd_kbd_read_data(uint32_t val) "0x%02x"
-- 
2.20.1


