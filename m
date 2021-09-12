Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DD407C4F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 09:58:09 +0200 (CEST)
Received: from localhost ([::1]:49476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKNM-0008Bj-7x
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 03:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFB-0002Vo-3G
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:49:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35012
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKF8-0002Tn-64
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:49:40 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKF4-00034U-VY; Sun, 12 Sep 2021 08:49:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:48:59 +0100
Message-Id: <20210912074914.22048-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

Allow Nubus to manage the slot allocations itself using the BusClass check_address()
virtual function rather than managing this during NubusDevice realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/nubus/nubus-bus.c    | 37 +++++++++++++++++++++++++++++++++++++
 hw/nubus/nubus-device.c | 29 -----------------------------
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index f6d3655f51..c59867632d 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -87,11 +87,48 @@ static void nubus_init(Object *obj)
     nubus->slot_available_mask = 0xffff;
 }
 
+static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
+{
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    NubusBus *nubus = NUBUS_BUS(bus);
+    uint16_t s;
+
+    if (nd->slot == -1) {
+        /* No slot specified, find first available free slot */
+        s = ctz32(nubus->slot_available_mask);
+        if (s != 32) {
+            nd->slot = s;
+        } else {
+            error_setg(errp, "Cannot register nubus card, no free slot "
+                             "available");
+            return false;
+        }
+    } else {
+        /* Slot specified, make sure the slot is available */
+        if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
+            error_setg(errp, "Cannot register nubus card, slot must be "
+                             "between %d and %d", NUBUS_FIRST_SLOT,
+                             NUBUS_LAST_SLOT);
+            return false;
+        }
+
+        if (!(nubus->slot_available_mask & (1UL << nd->slot))) {
+            error_setg(errp, "Cannot register nubus card, slot %d is "
+                             "unavailable or already occupied", nd->slot);
+            return false;
+        }
+    }
+
+    nubus->slot_available_mask &= ~(1UL << nd->slot);
+    return true;
+}
+
 static void nubus_class_init(ObjectClass *oc, void *data)
 {
     BusClass *bc = BUS_CLASS(oc);
 
     bc->realize = nubus_realize;
+    bc->check_address = nubus_check_address;
 }
 
 static const TypeInfo nubus_bus_info = {
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index f9f614cc01..7a32c8c95b 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -160,35 +160,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     NubusDevice *nd = NUBUS_DEVICE(dev);
     char *name;
     hwaddr slot_offset;
-    uint16_t s;
-
-    if (nd->slot == -1) {
-        /* No slot specified, find first available free slot */
-        s = ctz32(nubus->slot_available_mask);
-        if (s != 32) {
-            nd->slot = s;
-        } else {
-            error_setg(errp, "Cannot register nubus card, no free slot "
-                             "available");
-            return;
-        }
-    } else {
-        /* Slot specified, make sure the slot is available */
-        if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
-            error_setg(errp, "Cannot register nubus card, slot must be "
-                             "between %d and %d", NUBUS_FIRST_SLOT,
-                             NUBUS_LAST_SLOT);
-            return;
-        }
-
-        if (!(nubus->slot_available_mask & (1UL << nd->slot))) {
-            error_setg(errp, "Cannot register nubus card, slot %d is "
-                             "unavailable or already occupied", nd->slot);
-            return;
-        }
-    }
-
-    nubus->slot_available_mask &= ~(1UL << nd->slot);
 
     /* Super */
     slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
-- 
2.20.1


