Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11554416CF1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:40:51 +0200 (CEST)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfpC-00043m-2F
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfn5-0001gk-TD
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:38:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50220
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfn4-0003rw-FC
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:38:39 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfmu-0002uw-4k; Fri, 24 Sep 2021 08:38:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri, 24 Sep 2021 08:37:53 +0100
Message-Id: <20210924073808.1041-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v6 05/20] nubus: move slot bitmap checks from NubusDevice
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bus.c    | 29 +++++++++++++++++++++++++++++
 hw/nubus/nubus-device.c | 21 ---------------------
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 3cd7534864..96ef027bad 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -96,11 +96,40 @@ static void nubus_init(Object *obj)
                                                  NUBUS_SLOT_NB);
 }
 
+static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
+{
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    NubusBus *nubus = NUBUS_BUS(bus);
+
+    if (nd->slot == -1) {
+        /* No slot specified, find first available free slot */
+        int s = ctz32(nubus->slot_available_mask);
+        if (s != 32) {
+            nd->slot = s;
+        } else {
+            error_setg(errp, "Cannot register nubus card, no free slot "
+                             "available");
+            return false;
+        }
+    } else {
+        /* Slot specified, make sure the slot is available */
+        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
+            error_setg(errp, "Cannot register nubus card, slot %d is "
+                             "unavailable or already occupied", nd->slot);
+            return false;
+        }
+    }
+
+    nubus->slot_available_mask &= ~BIT(nd->slot);
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
index 2e96d6b4fc..516b13d2d5 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -161,27 +161,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     char *name;
     hwaddr slot_offset;
 
-    if (nd->slot == -1) {
-        /* No slot specified, find first available free slot */
-        int s = ctz32(nubus->slot_available_mask);
-        if (s != 32) {
-            nd->slot = s;
-        } else {
-            error_setg(errp, "Cannot register nubus card, no free slot "
-                             "available");
-            return;
-        }
-    } else {
-        /* Slot specified, make sure the slot is available */
-        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
-            error_setg(errp, "Cannot register nubus card, slot %d is "
-                             "unavailable or already occupied", nd->slot);
-            return;
-        }
-    }
-
-    nubus->slot_available_mask &= ~BIT(nd->slot);
-
     /* Super */
     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
 
-- 
2.20.1


