Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AFE40C3A5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:31:26 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSCL-0003xi-R3
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRt2-0003mT-El
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39070
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsz-00033f-7u
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:27 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsq-00059W-Cd; Wed, 15 Sep 2021 11:11:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:18 +0100
Message-Id: <20210915101026.25174-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 12/20] nubus: move nubus to its own 32-bit address space
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
 hw/m68k/q800.c                      |  8 +++-----
 hw/nubus/mac-nubus-bridge.c         | 15 +++++++++++++--
 hw/nubus/nubus-bus.c                | 18 ++++++++++++++++++
 hw/nubus/nubus-device.c             |  2 +-
 include/hw/nubus/mac-nubus-bridge.h |  2 ++
 include/hw/nubus/nubus.h            | 10 +++++++---
 6 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 5ba87f789c..0a0051a296 100644
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
@@ -396,8 +393,9 @@ static void q800_init(MachineState *machine)
 
     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, NUBUS_SUPER_SLOT_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
+                                            9 * NUBUS_SLOT_SIZE);
 
     nubus = MAC_NUBUS_BRIDGE(dev)->bus;
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index c1d77e2bc7..574bc7831e 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -21,8 +21,19 @@ static void mac_nubus_bridge_init(Object *obj)
     /* Macintosh only has slots 0x9 to 0xe available */
     s->bus->slot_available_mask = MAKE_64BIT_MASK(9, 6);
 
-    sysbus_init_mmio(sbd, &s->bus->super_slot_io);
-    sysbus_init_mmio(sbd, &s->bus->slot_io);
+    /* Aliases for slots 0x9 to 0xe */
+    memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
+                             &s->bus->nubus_mr,
+                             9 * NUBUS_SUPER_SLOT_SIZE,
+                             6 * NUBUS_SUPER_SLOT_SIZE);
+
+    memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
+                             &s->bus->nubus_mr,
+                             NUBUS_SLOT_BASE + 9 * NUBUS_SLOT_SIZE,
+                             6 * NUBUS_SLOT_SIZE);
+
+    sysbus_init_mmio(sbd, &s->super_slot_alias);
+    sysbus_init_mmio(sbd, &s->slot_alias);
 }
 
 static void mac_nubus_bridge_class_init(ObjectClass *klass, void *data)
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index ebaf683273..9b5b2485de 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -70,25 +70,42 @@ static const MemoryRegionOps nubus_super_slot_ops = {
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
                           NUBUS_SUPER_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->nubus_mr, 0x0, &nubus->super_slot_io);
 
     memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
                           nubus, "nubus-slots",
                           NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->nubus_mr,
+                                NUBUS_SUPER_SLOT_NB * NUBUS_SUPER_SLOT_SIZE,
+                                &nubus->slot_io);
 
     nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);
 }
@@ -149,6 +166,7 @@ static void nubus_class_init(ObjectClass *oc, void *data)
     BusClass *bc = BUS_CLASS(oc);
 
     bc->realize = nubus_realize;
+    bc->unrealize = nubus_unrealize;
     bc->check_address = nubus_check_address;
     bc->get_dev_path = nubus_get_dev_path;
 }
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index dbb3bb7efd..bb574f970a 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -26,7 +26,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     int ret;
 
     /* Super */
-    slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
+    slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
 
     name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
     memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 36aa098dd4..650fd24eab 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -19,6 +19,8 @@ struct MacNubusState {
     SysBusDevice sysbus_dev;
 
     NubusBus *bus;
+    MemoryRegion super_slot_alias;
+    MemoryRegion slot_alias;
 };
 
 #endif
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 0c9f50c32e..0b9f74d4ac 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -15,13 +15,14 @@
 #include "qemu/units.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
-#define NUBUS_SUPER_SLOT_NB   0x9
+#define NUBUS_SUPER_SLOT_NB   0xf
 
+#define NUBUS_SLOT_BASE       (NUBUS_SUPER_SLOT_SIZE * NUBUS_SUPER_SLOT_NB)
 #define NUBUS_SLOT_SIZE       0x01000000
-#define NUBUS_SLOT_NB         0xF
+#define NUBUS_SLOT_NB         0xf
 
 #define NUBUS_FIRST_SLOT      0x0
-#define NUBUS_LAST_SLOT       0xF
+#define NUBUS_LAST_SLOT       0xf
 
 #define TYPE_NUBUS_DEVICE "nubus-device"
 OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
@@ -34,6 +35,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(NubusBus, NUBUS_BUS)
 struct NubusBus {
     BusState qbus;
 
+    AddressSpace nubus_as;
+    MemoryRegion nubus_mr;
+
     MemoryRegion super_slot_io;
     MemoryRegion slot_io;
 
-- 
2.20.1


