Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E38415AF2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:28:26 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTL1l-0003CB-Gj
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKo0-0002S5-23
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:14:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48674
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKnx-0007sC-V2
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:14:11 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKnm-0003vl-5F; Thu, 23 Sep 2021 10:14:02 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 23 Sep 2021 10:13:00 +0100
Message-Id: <20210923091308.13832-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v5 12/20] nubus: move nubus to its own 32-bit address space
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

According to "Designing Cards and Drivers for the Macintosh Family" the Nubus
has its own 32-bit address space based upon physical slot addressing.

Move Nubus to its own 32-bit address space and then use memory region aliases
to map available slot and super slot ranges into the q800 system address
space via the Macintosh Nubus bridge.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c                      |  9 ++++-----
 hw/nubus/mac-nubus-bridge.c         | 16 ++++++++++++++--
 hw/nubus/nubus-bus.c                | 18 ++++++++++++++++++
 include/hw/nubus/mac-nubus-bridge.h |  2 ++
 include/hw/nubus/nubus.h            |  6 ++++++
 5 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 5ba87f789c..a07912b87c 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -67,9 +67,6 @@
 #define ASC_BASE              (IO_BASE + 0x14000)
 #define SWIM_BASE             (IO_BASE + 0x1E000)
 
-#define NUBUS_SUPER_SLOT_BASE 0x60000000
-#define NUBUS_SLOT_BASE       0xf0000000
-
 #define SONIC_PROM_SIZE       0x1000
 
 /*
@@ -396,8 +393,10 @@ static void q800_init(MachineState *machine)
 
     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, NUBUS_SUPER_SLOT_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                    MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
+                    MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
     nubus = MAC_NUBUS_BRIDGE(dev)->bus;
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 3f075789e9..3af4f5d396 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -22,8 +22,20 @@ static void mac_nubus_bridge_init(Object *obj)
     s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
                                                   MAC_NUBUS_SLOT_NB);
 
-    sysbus_init_mmio(sbd, &s->bus->super_slot_io);
-    sysbus_init_mmio(sbd, &s->bus->slot_io);
+    /* Aliases for slots 0x9 to 0xe */
+    memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
+                             &s->bus->nubus_mr,
+                             MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE,
+                             MAC_NUBUS_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
+
+    memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
+                             &s->bus->nubus_mr,
+                             NUBUS_SLOT_BASE +
+                             MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE,
+                             MAC_NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
+
+    sysbus_init_mmio(sbd, &s->super_slot_alias);
+    sysbus_init_mmio(sbd, &s->slot_alias);
 }
 
 static void mac_nubus_bridge_class_init(ObjectClass *klass, void *data)
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 3db8272524..40d9068c59 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -78,25 +78,42 @@ static const MemoryRegionOps nubus_super_slot_ops = {
     },
 };
 
+static void nubus_unrealize(BusState *bus)
+{
+    NubusBus *nubus = NUBUS_BUS(bus);
+
+    address_space_destroy(&nubus->nubus_as);
+}
+
 static void nubus_realize(BusState *bus, Error **errp)
 {
+    NubusBus *nubus = NUBUS_BUS(bus);
+
     if (!nubus_find()) {
         error_setg(errp, "at most one %s device is permitted", TYPE_NUBUS_BUS);
         return;
     }
+
+    address_space_init(&nubus->nubus_as, &nubus->nubus_mr, "nubus");
 }
 
 static void nubus_init(Object *obj)
 {
     NubusBus *nubus = NUBUS_BUS(obj);
 
+    memory_region_init(&nubus->nubus_mr, obj, "nubus", 0x100000000);
+
     memory_region_init_io(&nubus->super_slot_io, obj, &nubus_super_slot_ops,
                           nubus, "nubus-super-slots",
                           (NUBUS_SUPER_SLOT_NB + 1) * NUBUS_SUPER_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->nubus_mr, 0x0, &nubus->super_slot_io);
 
     memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
                           nubus, "nubus-slots",
                           NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->nubus_mr,
+                                (NUBUS_SUPER_SLOT_NB + 1) *
+                                NUBUS_SUPER_SLOT_SIZE, &nubus->slot_io);
 
     nubus->slot_available_mask = MAKE_64BIT_MASK(NUBUS_FIRST_SLOT,
                                                  NUBUS_SLOT_NB);
@@ -151,6 +168,7 @@ static void nubus_class_init(ObjectClass *oc, void *data)
     BusClass *bc = BUS_CLASS(oc);
 
     bc->realize = nubus_realize;
+    bc->unrealize = nubus_unrealize;
     bc->check_address = nubus_check_address;
     bc->get_dev_path = nubus_get_dev_path;
 }
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 118d67267d..04451d357c 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -23,6 +23,8 @@ struct MacNubusState {
     SysBusDevice sysbus_dev;
 
     NubusBus *bus;
+    MemoryRegion super_slot_alias;
+    MemoryRegion slot_alias;
 };
 
 #endif
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 73a9d8cb7f..f2c8c22c05 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -17,6 +17,9 @@
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
 #define NUBUS_SUPER_SLOT_NB   0xe
 
+#define NUBUS_SLOT_BASE       (NUBUS_SUPER_SLOT_SIZE * \
+                               (NUBUS_SUPER_SLOT_NB + 1))
+
 #define NUBUS_SLOT_SIZE       0x01000000
 #define NUBUS_FIRST_SLOT      0x0
 #define NUBUS_LAST_SLOT       0xf
@@ -33,6 +36,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(NubusBus, NUBUS_BUS)
 struct NubusBus {
     BusState qbus;
 
+    AddressSpace nubus_as;
+    MemoryRegion nubus_mr;
+
     MemoryRegion super_slot_io;
     MemoryRegion slot_io;
 
-- 
2.20.1


