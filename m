Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59693416D33
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:55:53 +0200 (CEST)
Received: from localhost ([::1]:50104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTg3k-0000Df-Dn
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfn2-0001cn-Fo
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:38:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50214
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfn0-0003os-Qf
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:38:36 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfmq-0002uw-Ag; Fri, 24 Sep 2021 08:38:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri, 24 Sep 2021 08:37:52 +0100
Message-Id: <20210924073808.1041-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v6 04/20] nubus: use bitmap to manage available slots
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

Convert nubus_device_realize() to use a bitmap to manage available slots to allow
for future Nubus devices to be plugged into arbitrary slots from the command line
using a new qdev "slot" parameter for nubus devices.

Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on Macintosh machines
as documented in "Designing Cards and Drivers for the Macintosh Family".

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/mac-nubus-bridge.c         |  4 ++++
 hw/nubus/nubus-bus.c                |  5 +++--
 hw/nubus/nubus-device.c             | 29 ++++++++++++++++++++++++-----
 include/hw/nubus/mac-nubus-bridge.h |  4 ++++
 include/hw/nubus/nubus.h            | 13 ++++++-------
 5 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 7c329300b8..3f075789e9 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -18,6 +18,10 @@ static void mac_nubus_bridge_init(Object *obj)
 
     s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
 
+    /* Macintosh only has slots 0x9 to 0xe available */
+    s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
+                                                  MAC_NUBUS_SLOT_NB);
+
     sysbus_init_mmio(sbd, &s->bus->super_slot_io);
     sysbus_init_mmio(sbd, &s->bus->slot_io);
 }
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index f4410803ff..3cd7534864 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -86,13 +86,14 @@ static void nubus_init(Object *obj)
 
     memory_region_init_io(&nubus->super_slot_io, obj, &nubus_super_slot_ops,
                           nubus, "nubus-super-slots",
-                          NUBUS_SUPER_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
+                          (NUBUS_SUPER_SLOT_NB + 1) * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
                           nubus, "nubus-slots",
                           NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
 
-    nubus->current_slot = NUBUS_FIRST_SLOT;
+    nubus->slot_available_mask = MAKE_64BIT_MASK(NUBUS_FIRST_SLOT,
+                                                 NUBUS_SLOT_NB);
 }
 
 static void nubus_class_init(ObjectClass *oc, void *data)
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 4e23df1280..2e96d6b4fc 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -161,13 +161,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     char *name;
     hwaddr slot_offset;
 
-    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
-            nubus->current_slot > NUBUS_LAST_SLOT) {
-        error_setg(errp, "Cannot register nubus card, not enough slots");
-        return;
+    if (nd->slot == -1) {
+        /* No slot specified, find first available free slot */
+        int s = ctz32(nubus->slot_available_mask);
+        if (s != 32) {
+            nd->slot = s;
+        } else {
+            error_setg(errp, "Cannot register nubus card, no free slot "
+                             "available");
+            return;
+        }
+    } else {
+        /* Slot specified, make sure the slot is available */
+        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
+            error_setg(errp, "Cannot register nubus card, slot %d is "
+                             "unavailable or already occupied", nd->slot);
+            return;
+        }
     }
 
-    nd->slot = nubus->current_slot++;
+    nubus->slot_available_mask &= ~BIT(nd->slot);
 
     /* Super */
     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
@@ -191,12 +204,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     nubus_register_format_block(nd);
 }
 
+static Property nubus_device_properties[] = {
+    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void nubus_device_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = nubus_device_realize;
     dc->bus_type = TYPE_NUBUS_BUS;
+    device_class_set_props(dc, nubus_device_properties);
 }
 
 static const TypeInfo nubus_device_type_info = {
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 36aa098dd4..118d67267d 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -12,6 +12,10 @@
 #include "hw/nubus/nubus.h"
 #include "qom/object.h"
 
+#define MAC_NUBUS_FIRST_SLOT 0x9
+#define MAC_NUBUS_LAST_SLOT  0xe
+#define MAC_NUBUS_SLOT_NB    (MAC_NUBUS_LAST_SLOT - MAC_NUBUS_FIRST_SLOT + 1)
+
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
 OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
 
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 89b0976aaa..3eea2952d5 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -14,13 +14,12 @@
 #include "qom/object.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
-#define NUBUS_SUPER_SLOT_NB   0x9
+#define NUBUS_SUPER_SLOT_NB   0xe
 
 #define NUBUS_SLOT_SIZE       0x01000000
-#define NUBUS_SLOT_NB         0xF
-
-#define NUBUS_FIRST_SLOT      0x9
-#define NUBUS_LAST_SLOT       0xF
+#define NUBUS_FIRST_SLOT      0x0
+#define NUBUS_LAST_SLOT       0xf
+#define NUBUS_SLOT_NB         (NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1)
 
 #define TYPE_NUBUS_DEVICE "nubus-device"
 OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
@@ -36,13 +35,13 @@ struct NubusBus {
     MemoryRegion super_slot_io;
     MemoryRegion slot_io;
 
-    int current_slot;
+    uint16_t slot_available_mask;
 };
 
 struct NubusDevice {
     DeviceState qdev;
 
-    int slot;
+    int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
 
-- 
2.20.1


