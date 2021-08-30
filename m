Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34053FB3EA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:30:59 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeZ3-0005rM-Iq
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU7-0005ne-GL
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53334
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeU4-0007Tx-4P
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:47 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTb-0003D2-H7; Mon, 30 Aug 2021 11:25:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:44 +0100
Message-Id: <20210830102447.10806-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/12] mac_via: remove mac_via device
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

Remove the mac_via device and wire up both q800 VIA1 and VIA2 directly for the
m68k q800 machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c            | 34 +++++++++--------
 hw/misc/mac_via.c         | 78 +++++++--------------------------------
 include/hw/misc/mac_via.h | 21 +++--------
 3 files changed, 36 insertions(+), 97 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index e14f68f19b..ec28e69802 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -225,7 +225,7 @@ static void q800_init(MachineState *machine)
     hwaddr parameters_base;
     CPUState *cs;
     DeviceState *dev;
-    DeviceState *via_dev, *via1_dev;
+    DeviceState *via1_dev, *via2_dev;
     DeviceState *escc_orgate;
     SysBusESPState *sysbus_esp;
     ESPState *esp;
@@ -270,28 +270,30 @@ static void q800_init(MachineState *machine)
     object_property_set_link(OBJECT(glue), "cpu", OBJECT(cpu), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(glue), &error_fatal);
 
-    /* VIA */
-
-    via_dev = qdev_new(TYPE_MAC_VIA);
+    /* VIA 1 */
+    via1_dev = qdev_new(TYPE_MOS6522_Q800_VIA1);
     dinfo = drive_get(IF_MTD, 0, 0);
     if (dinfo) {
-        qdev_prop_set_drive(via_dev, "drive", blk_by_legacy_dinfo(dinfo));
+        qdev_prop_set_drive(via1_dev, "drive", blk_by_legacy_dinfo(dinfo));
     }
-    sysbus = SYS_BUS_DEVICE(via_dev);
+    sysbus = SYS_BUS_DEVICE(via1_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_mmio_map(sysbus, 0, VIA_BASE);
-    qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 0,
-                                qdev_get_gpio_in(glue, 0));
-    qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
-                                qdev_get_gpio_in(glue, 1));
-
-    via1_dev = DEVICE(MOS6522_Q800_VIA1(&MAC_VIA(via_dev)->mos6522_via1));
-    adb_bus = qdev_get_child_bus(DEVICE(via1_dev), "adb.0");
+    sysbus_mmio_map(sysbus, 1, VIA_BASE);
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 0));
+
+    adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
     qdev_realize_and_unref(dev, adb_bus, &error_fatal);
     dev = qdev_new(TYPE_ADB_MOUSE);
     qdev_realize_and_unref(dev, adb_bus, &error_fatal);
 
+    /* VIA 2 */
+    via2_dev = qdev_new(TYPE_MOS6522_Q800_VIA2);
+    sysbus = SYS_BUS_DEVICE(via2_dev);
+    sysbus_realize_and_unref(sysbus, &error_fatal);
+    sysbus_mmio_map(sysbus, 1, VIA_BASE + VIA_SIZE);
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 1));
+
     /* MACSONIC */
 
     if (nb_nics > 1) {
@@ -375,11 +377,11 @@ static void q800_init(MachineState *machine)
 
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in_named(via_dev,
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in_named(via2_dev,
                                                          "via2-irq",
                                                          VIA2_IRQ_SCSI_BIT));
     sysbus_connect_irq(sysbus, 1,
-                       qdev_get_gpio_in_named(via_dev, "via2-irq",
+                       qdev_get_gpio_in_named(via2_dev, "via2-irq",
                                               VIA2_IRQ_SCSI_DATA_BIT));
     sysbus_mmio_map(sysbus, 0, ESP_BASE);
     sysbus_mmio_map(sysbus, 1, ESP_PDMA);
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index bb8d682ce9..7b9f067e71 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -34,11 +34,9 @@
 #include "qemu/log.h"
 
 /*
- * VIAs: There are two in every machine,
+ * VIAs: There are two in every machine
  */
 
-#define VIA_SIZE (0x2000)
-
 /*
  * Not all of these are true post MacII I think.
  * CSA: probably the ones CHRP marks as 'unused' change purposes
@@ -945,52 +943,6 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
     },
 };
 
-static void mac_via_realize(DeviceState *dev, Error **errp)
-{
-    MacVIAState *m = MAC_VIA(dev);
-    MOS6522State *ms;
-
-    /* Pass through mos6522 output IRQs */
-    ms = MOS6522(&m->mos6522_via1);
-    object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
-                              SYSBUS_DEVICE_GPIO_IRQ "[0]");
-    ms = MOS6522(&m->mos6522_via2);
-    object_property_add_alias(OBJECT(dev), "irq[1]", OBJECT(ms),
-                              SYSBUS_DEVICE_GPIO_IRQ "[0]");
-
-    sysbus_realize(SYS_BUS_DEVICE(&m->mos6522_via1), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&m->mos6522_via2), &error_abort);
-
-    /* Pass through mos6522 input IRQs */
-    qdev_pass_gpios(DEVICE(&m->mos6522_via1), dev, "via1-irq");
-    qdev_pass_gpios(DEVICE(&m->mos6522_via2), dev, "via2-irq");
-}
-
-static void mac_via_init(Object *obj)
-{
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    MacVIAState *m = MAC_VIA(obj);
-
-    /* MMIO */
-    memory_region_init(&m->mmio, obj, "mac-via", 2 * VIA_SIZE);
-    sysbus_init_mmio(sbd, &m->mmio);
-
-    memory_region_init_io(&m->via1mem, obj, &mos6522_q800_via1_ops,
-                          &m->mos6522_via1, "via1", VIA_SIZE);
-    memory_region_add_subregion(&m->mmio, 0x0, &m->via1mem);
-
-    memory_region_init_io(&m->via2mem, obj, &mos6522_q800_via2_ops,
-                          &m->mos6522_via2, "via2", VIA_SIZE);
-    memory_region_add_subregion(&m->mmio, VIA_SIZE, &m->via2mem);
-
-    /* Init VIAs 1 and 2 */
-    object_initialize_child(obj, "via1", &m->mos6522_via1,
-                            TYPE_MOS6522_Q800_VIA1);
-
-    object_initialize_child(obj, "via2", &m->mos6522_via2,
-                            TYPE_MOS6522_Q800_VIA2);
-}
-
 static void via1_postload_update_cb(void *opaque, bool running, RunState state)
 {
     MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(opaque);
@@ -1013,21 +965,6 @@ static int via1_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static void mac_via_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = mac_via_realize;
-}
-
-static TypeInfo mac_via_info = {
-    .name = TYPE_MAC_VIA,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MacVIAState),
-    .instance_init = mac_via_init,
-    .class_init = mac_via_class_init,
-};
-
 /* VIA 1 */
 static void mos6522_q800_via1_reset(DeviceState *dev)
 {
@@ -1095,6 +1032,11 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
 static void mos6522_q800_via1_init(Object *obj)
 {
     MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(v1s);
+
+    memory_region_init_io(&v1s->via_mem, obj, &mos6522_q800_via1_ops, v1s,
+                          "via1", VIA_SIZE);
+    sysbus_init_mmio(sbd, &v1s->via_mem);
 
     /* ADB */
     qbus_create_inplace((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
@@ -1187,6 +1129,13 @@ static void mos6522_q800_via2_reset(DeviceState *dev)
 
 static void mos6522_q800_via2_init(Object *obj)
 {
+    MOS6522Q800VIA2State *v2s = MOS6522_Q800_VIA2(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(v2s);
+
+    memory_region_init_io(&v2s->via_mem, obj, &mos6522_q800_via2_ops, v2s,
+                          "via2", VIA_SIZE);
+    sysbus_init_mmio(sbd, &v2s->via_mem);
+
     qdev_init_gpio_in_named(DEVICE(obj), via2_irq_request, "via2-irq",
                             VIA2_IRQ_NB);
 }
@@ -1224,7 +1173,6 @@ static void mac_via_register_types(void)
 {
     type_register_static(&mos6522_q800_via1_type_info);
     type_register_static(&mos6522_q800_via2_type_info);
-    type_register_static(&mac_via_info);
 }
 
 type_init(mac_via_register_types);
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 182dcb7422..9a8bca056e 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -15,6 +15,8 @@
 #include "qom/object.h"
 
 
+#define VIA_SIZE   0x2000
+
 /* VIA 1 */
 #define VIA1_IRQ_ONE_SECOND_BIT 0
 #define VIA1_IRQ_60HZ_BIT       1
@@ -38,6 +40,8 @@ struct MOS6522Q800VIA1State {
     /*< private >*/
     MOS6522State parent_obj;
 
+    MemoryRegion via_mem;
+
     qemu_irq irqs[VIA1_IRQ_NB];
     uint8_t last_b;
 
@@ -95,23 +99,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA2State, MOS6522_Q800_VIA2)
 struct MOS6522Q800VIA2State {
     /*< private >*/
     MOS6522State parent_obj;
-};
-
-
-#define TYPE_MAC_VIA "mac_via"
-OBJECT_DECLARE_SIMPLE_TYPE(MacVIAState, MAC_VIA)
-
-struct MacVIAState {
-    SysBusDevice busdev;
-
-    /* MMIO */
-    MemoryRegion mmio;
-    MemoryRegion via1mem;
-    MemoryRegion via2mem;
 
-    /* VIAs */
-    MOS6522Q800VIA1State mos6522_via1;
-    MOS6522Q800VIA2State mos6522_via2;
+    MemoryRegion via_mem;
 };
 
 #endif
-- 
2.20.1


