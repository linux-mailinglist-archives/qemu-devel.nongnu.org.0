Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303432427D3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 11:45:08 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5nJj-0005eb-6w
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 05:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=nna4=bw=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1k5nHK-0001tG-9P
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 05:42:38 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:40856
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=nna4=bw=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1k5nHI-0006jq-Fq
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 05:42:38 -0400
Received: from MattGorko-Laptop.localdomain (unknown [78.194.154.81])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 9582041503;
 Wed, 12 Aug 2020 11:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1597225354; bh=WDA0oI2Z69R2zXIfx2G23h1o+q5997g9l9qIdMw94RQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f8t0XvZvW8Sm12f/UNbW9tKYHufmZkuoeLnJeOPQtmLUka6TyIAaDfz54lt7UpLMB
 MWgkiOq7iRR1RuWpf3k8jHG10Ym9YF8gUjZdi7n8D6ek/dcrhBWHtoPEOyypG4xynx
 mPqJSgn8138DNQemMhuAgFb1N3WUuWIeG/moRBfU=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] hw/usb: Regroup USB HID protocol values
Date: Wed, 12 Aug 2020 11:41:23 +0200
Message-Id: <20200812094135.20550-2-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812094135.20550-1-cesar.belley@lse.epita.fr>
References: <20200812094135.20550-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=nna4=bw=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 05:42:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Group some HID values that are used pretty much everywhere when
dealing with HID devices.

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 hw/usb/dev-hid.c     | 26 +++++++-------------------
 hw/usb/dev-wacom.c   | 12 +++---------
 include/hw/usb/hid.h | 17 +++++++++++++++++
 3 files changed, 27 insertions(+), 28 deletions(-)
 create mode 100644 include/hw/usb/hid.h

diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 89f63b698b..c73f7b2fe2 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -32,21 +32,9 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/input/hid.h"
+#include "hw/usb/hid.h"
 #include "hw/qdev-properties.h"
 
-/* HID interface requests */
-#define GET_REPORT   0xa101
-#define GET_IDLE     0xa102
-#define GET_PROTOCOL 0xa103
-#define SET_REPORT   0x2109
-#define SET_IDLE     0x210a
-#define SET_PROTOCOL 0x210b
-
-/* HID descriptor types */
-#define USB_DT_HID    0x21
-#define USB_DT_REPORT 0x22
-#define USB_DT_PHY    0x23
-
 typedef struct USBHIDState {
     USBDevice dev;
     USBEndpoint *intr;
@@ -618,38 +606,38 @@ static void usb_hid_handle_control(USBDevice *dev, USBPacket *p,
             goto fail;
         }
         break;
-    case GET_REPORT:
+    case HID_GET_REPORT:
         if (hs->kind == HID_MOUSE || hs->kind == HID_TABLET) {
             p->actual_length = hid_pointer_poll(hs, data, length);
         } else if (hs->kind == HID_KEYBOARD) {
             p->actual_length = hid_keyboard_poll(hs, data, length);
         }
         break;
-    case SET_REPORT:
+    case HID_SET_REPORT:
         if (hs->kind == HID_KEYBOARD) {
             p->actual_length = hid_keyboard_write(hs, data, length);
         } else {
             goto fail;
         }
         break;
-    case GET_PROTOCOL:
+    case HID_GET_PROTOCOL:
         if (hs->kind != HID_KEYBOARD && hs->kind != HID_MOUSE) {
             goto fail;
         }
         data[0] = hs->protocol;
         p->actual_length = 1;
         break;
-    case SET_PROTOCOL:
+    case HID_SET_PROTOCOL:
         if (hs->kind != HID_KEYBOARD && hs->kind != HID_MOUSE) {
             goto fail;
         }
         hs->protocol = value;
         break;
-    case GET_IDLE:
+    case HID_GET_IDLE:
         data[0] = hs->idle;
         p->actual_length = 1;
         break;
-    case SET_IDLE:
+    case HID_SET_IDLE:
         hs->idle = (uint8_t) (value >> 8);
         hid_set_next_idle(hs);
         if (hs->kind == HID_MOUSE || hs->kind == HID_TABLET) {
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 8aba44b8bc..76fc5a5dab 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -29,6 +29,7 @@
 #include "qemu/osdep.h"
 #include "ui/console.h"
 #include "hw/usb.h"
+#include "hw/usb/hid.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "desc.h"
@@ -37,13 +38,6 @@
 #define WACOM_GET_REPORT	0x2101
 #define WACOM_SET_REPORT	0x2109
 
-/* HID interface requests */
-#define HID_GET_REPORT		0xa101
-#define HID_GET_IDLE		0xa102
-#define HID_GET_PROTOCOL	0xa103
-#define HID_SET_IDLE		0x210a
-#define HID_SET_PROTOCOL	0x210b
-
 typedef struct USBWacomState {
     USBDevice dev;
     USBEndpoint *intr;
@@ -86,11 +80,11 @@ static const USBDescIface desc_iface_wacom = {
             /* HID descriptor */
             .data = (uint8_t[]) {
                 0x09,          /*  u8  bLength */
-                0x21,          /*  u8  bDescriptorType */
+                USB_DT_HID,    /*  u8  bDescriptorType */
                 0x01, 0x10,    /*  u16 HID_class */
                 0x00,          /*  u8  country_code */
                 0x01,          /*  u8  num_descriptors */
-                0x22,          /*  u8  type: Report */
+                USB_DT_REPORT, /*  u8  type: Report */
                 0x6e, 0,       /*  u16 len */
             },
         },
diff --git a/include/hw/usb/hid.h b/include/hw/usb/hid.h
new file mode 100644
index 0000000000..1c142584ff
--- /dev/null
+++ b/include/hw/usb/hid.h
@@ -0,0 +1,17 @@
+#ifndef HW_USB_HID_H
+#define HW_USB_HID_H
+
+/* HID interface requests */
+#define HID_GET_REPORT   0xa101
+#define HID_GET_IDLE     0xa102
+#define HID_GET_PROTOCOL 0xa103
+#define HID_SET_REPORT   0x2109
+#define HID_SET_IDLE     0x210a
+#define HID_SET_PROTOCOL 0x210b
+
+/* HID descriptor types */
+#define USB_DT_HID    0x21
+#define USB_DT_REPORT 0x22
+#define USB_DT_PHY    0x23
+
+#endif
-- 
2.28.0


