Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C6298897
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 09:40:04 +0100 (CET)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWy2t-0008T4-Jj
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 04:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxb-0003Gu-Sg
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:34:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46956
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxa-0005xy-2K
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:34:35 -0400
Received: from host86-148-103-79.range86-148.btcentralplus.com
 ([86.148.103.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxg-00082O-9i; Mon, 26 Oct 2020 08:34:42 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com,
	samuel.thibault@ens-lyon.org
Date: Mon, 26 Oct 2020 08:33:55 +0000
Message-Id: <20201026083401.13231-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
References: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/9] dev-serial: convert from DPRINTF to trace-events
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/usb/dev-serial.c | 28 ++++++++++++++--------------
 hw/usb/trace-events |  8 ++++++++
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 77ce89d38b..abc316c7bf 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -20,15 +20,8 @@
 #include "chardev/char-serial.h"
 #include "chardev/char-fe.h"
 #include "qom/object.h"
+#include "trace.h"
 
-//#define DEBUG_Serial
-
-#ifdef DEBUG_Serial
-#define DPRINTF(fmt, ...) \
-do { printf("usb-serial: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
 
 #define RECV_BUF (512 - (2 * 8))
 
@@ -205,8 +198,9 @@ static void usb_serial_reset(USBSerialState *s)
 static void usb_serial_handle_reset(USBDevice *dev)
 {
     USBSerialState *s = USB_SERIAL(dev);
+    USBBus *bus = usb_bus_from_device(dev);
 
-    DPRINTF("Reset\n");
+    trace_usb_serial_reset(bus->busnr, dev->addr);
 
     usb_serial_reset(s);
     /* TODO: Reset char device, send BREAK? */
@@ -244,9 +238,11 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
                                       int length, uint8_t *data)
 {
     USBSerialState *s = USB_SERIAL(dev);
+    USBBus *bus = usb_bus_from_device(dev);
     int ret;
 
-    DPRINTF("got control %x, value %x\n", request, value);
+    trace_usb_serial_handle_control(bus->busnr, dev->addr, request, value);
+
     ret = usb_desc_handle_control(dev, p, request, value, index, length, data);
     if (ret >= 0) {
         return;
@@ -326,7 +322,8 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
             s->params.parity = 'E';
             break;
         default:
-            DPRINTF("unsupported parity %d\n", value & FTDI_PARITY);
+            trace_usb_serial_unsupported_parity(bus->busnr, dev->addr,
+                                                value & FTDI_PARITY);
             goto fail;
         }
 
@@ -338,7 +335,8 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
             s->params.stop_bits = 2;
             break;
         default:
-            DPRINTF("unsupported stop bits %d\n", value & FTDI_STOP);
+            trace_usb_serial_unsupported_stopbits(bus->busnr, dev->addr,
+                                                  value & FTDI_STOP);
             goto fail;
         }
 
@@ -367,7 +365,8 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
         break;
     default:
     fail:
-        DPRINTF("got unsupported/bogus control %x, value %x\n", request, value);
+        trace_usb_serial_unsupported_control(bus->busnr, dev->addr, request,
+                                             value);
         p->status = USB_RET_STALL;
         break;
     }
@@ -431,6 +430,7 @@ static void usb_serial_token_in(USBSerialState *s, USBPacket *p)
 static void usb_serial_handle_data(USBDevice *dev, USBPacket *p)
 {
     USBSerialState *s = USB_SERIAL(dev);
+    USBBus *bus = usb_bus_from_device(dev);
     uint8_t devep = p->ep->nr;
     struct iovec *iov;
     int i;
@@ -459,7 +459,7 @@ static void usb_serial_handle_data(USBDevice *dev, USBPacket *p)
         break;
 
     default:
-        DPRINTF("Bad token\n");
+        trace_usb_serial_bad_token(bus->busnr, dev->addr);
     fail:
         p->status = USB_RET_STALL;
         break;
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 72e4298780..e5871cbbbc 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -320,3 +320,11 @@ usb_host_parse_interface(int bus, int addr, int num, int alt, int active) "dev %
 usb_host_parse_endpoint(int bus, int addr, int ep, const char *dir, const char *type, int active) "dev %d:%d, ep %d, %s, %s, active %d"
 usb_host_parse_error(int bus, int addr, const char *errmsg) "dev %d:%d, msg %s"
 usb_host_remote_wakeup_removed(int bus, int addr) "dev %d:%d"
+
+# dev-serial.c
+usb_serial_reset(int bus, int addr) "dev %d:%d reset"
+usb_serial_handle_control(int bus, int addr, int request, int value) "dev %d:%d got control 0x%x, value 0x%x"
+usb_serial_unsupported_parity(int bus, int addr, int value) "dev %d:%d unsupported parity %d"
+usb_serial_unsupported_stopbits(int bus, int addr, int value) "dev %d:%d unsupported stop bits %d"
+usb_serial_unsupported_control(int bus, int addr, int request, int value) "dev %d:%d got unsupported/bogus control 0x%x, value 0x%x"
+usb_serial_bad_token(int bus, int addr) "dev %d:%d bad token"
-- 
2.20.1


