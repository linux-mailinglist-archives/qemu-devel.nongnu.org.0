Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EA2E8710
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:30:29 +0100 (CET)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvf75-0004sB-Qz
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:30:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kverC-00013D-DV
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:14:02 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kver2-00079e-T6
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:14:02 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 16182747611;
 Sat,  2 Jan 2021 12:13:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 37A82747637; Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Message-Id: <cfccd714fac97e6645f7441193d72261ad82b667.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 22/24] vt82c686: QOM-ify superio related functionality
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Collect superio functionality and its controlling config registers
handling in an abstract VIA_SUPERIO class that is a subclass of
ISA_SUPERIO and put vt82c686b specific parts in a subclass of this
abstract class.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 240 ++++++++++++++++++++++++--------------
 include/hw/isa/vt82c686.h |   1 -
 2 files changed, 150 insertions(+), 91 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 26db1a18e2..a755896b8e 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -249,12 +249,21 @@ static const TypeInfo vt8231_pm_info = {
 };
 
 
-typedef struct SuperIOConfig {
+#define TYPE_VIA_SUPERIO "via-superio"
+OBJECT_DECLARE_SIMPLE_TYPE(ViaSuperIOState, VIA_SUPERIO)
+
+struct ViaSuperIOState {
+    ISASuperIODevice superio;
     uint8_t regs[0x100];
+    const MemoryRegionOps *io_ops;
     MemoryRegion io;
-    ISASuperIODevice *superio;
     MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
-} SuperIOConfig;
+};
+
+static inline void via_superio_io_enable(ViaSuperIOState *s, bool enable)
+{
+    memory_region_set_enabled(&s->io, enable);
+}
 
 static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
                                     int offs)
@@ -270,10 +279,76 @@ static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
     return mr;
 }
 
-static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
-                              unsigned size)
+static void via_superio_realize(DeviceState *d, Error **errp)
+{
+    ViaSuperIOState *s = VIA_SUPERIO(d);
+    ISASuperIOClass *ic = ISA_SUPERIO_GET_CLASS(s);
+    int i;
+
+    assert(s->io_ops);
+    ic->parent_realize(d, errp);
+    if (*errp) {
+        return;
+    }
+    /* Grab io regions of serial devices so we can control them */
+    for (i = 0; i < ic->serial.count; i++) {
+        ISADevice *sd = s->superio.serial[i];
+        MemoryRegion *io = isa_address_space_io(sd);
+        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
+        if (!mr) {
+            error_setg(errp, "Could not get io region for serial %d", i);
+            return;
+        }
+        s->serial_io[i] = mr;
+    }
+
+    memory_region_init_io(&s->io, OBJECT(d), s->io_ops, s, "via-superio", 2);
+    memory_region_set_enabled(&s->io, false);
+    /* The floppy also uses 0x3f0 and 0x3f1 but this seems to work anyway */
+    memory_region_add_subregion(isa_address_space_io(ISA_DEVICE(s)), 0x3f0,
+                                &s->io);
+}
+
+static uint64_t via_superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ViaSuperIOState *sc = opaque;
+    uint8_t idx = sc->regs[0];
+    uint8_t val = sc->regs[idx];
+
+    if (addr == 0) {
+        return idx;
+    }
+    if (addr == 1 && idx == 0) {
+        val = 0; /* reading reg 0 where we store index value */
+    }
+    trace_via_superio_read(idx, val);
+    return val;
+}
+
+static void via_superio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
+
+    sc->parent_realize = dc->realize;
+    dc->realize = via_superio_realize;
+}
+
+static const TypeInfo via_superio_info = {
+    .name          = TYPE_VIA_SUPERIO,
+    .parent        = TYPE_ISA_SUPERIO,
+    .instance_size = sizeof(ViaSuperIOState),
+    .class_size    = sizeof(ISASuperIOClass),
+    .class_init    = via_superio_class_init,
+    .abstract      = true,
+};
+
+#define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
+
+static void vt82c686b_superio_cfg_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
 {
-    SuperIOConfig *sc = opaque;
+    ViaSuperIOState *sc = opaque;
     uint8_t idx = sc->regs[0];
 
     if (addr == 0) { /* config index register */
@@ -295,29 +370,29 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     case 0xfd ... 0xff:
         /* ignore write to read only registers */
         return;
-    case 0xe2:
+    case 0xe2: /* Function select */
     {
         data &= 0x1f;
         if (data & BIT(2)) { /* Serial port 1 enable */
-            ISADevice *dev = sc->superio->serial[0];
+            ISADevice *dev = sc->superio.serial[0];
             if (!memory_region_is_mapped(sc->serial_io[0])) {
                 memory_region_add_subregion(isa_address_space_io(dev),
                                             dev->ioport_id, sc->serial_io[0]);
             }
         } else {
-            MemoryRegion *io = isa_address_space_io(sc->superio->serial[0]);
+            MemoryRegion *io = isa_address_space_io(sc->superio.serial[0]);
             if (memory_region_is_mapped(sc->serial_io[0])) {
                 memory_region_del_subregion(io, sc->serial_io[0]);
             }
         }
         if (data & BIT(3)) { /* Serial port 2 enable */
-            ISADevice *dev = sc->superio->serial[1];
+            ISADevice *dev = sc->superio.serial[1];
             if (!memory_region_is_mapped(sc->serial_io[1])) {
                 memory_region_add_subregion(isa_address_space_io(dev),
                                             dev->ioport_id, sc->serial_io[1]);
             }
         } else {
-            MemoryRegion *io = isa_address_space_io(sc->superio->serial[1]);
+            MemoryRegion *io = isa_address_space_io(sc->superio.serial[1]);
             if (memory_region_is_mapped(sc->serial_io[1])) {
                 memory_region_del_subregion(io, sc->serial_io[1]);
             }
@@ -327,7 +402,7 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     case 0xe7: /* Serial port 1 io base address */
     {
         data &= 0xfe;
-        sc->superio->serial[0]->ioport_id = data << 2;
+        sc->superio.serial[0]->ioport_id = data << 2;
         if (memory_region_is_mapped(sc->serial_io[0])) {
             memory_region_set_address(sc->serial_io[0], data << 2);
         }
@@ -336,7 +411,7 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     case 0xe8: /* Serial port 2 io base address */
     {
         data &= 0xfe;
-        sc->superio->serial[1]->ioport_id = data << 2;
+        sc->superio.serial[1]->ioport_id = data << 2;
         if (memory_region_is_mapped(sc->serial_io[1])) {
             memory_region_set_address(sc->serial_io[1], data << 2);
         }
@@ -350,25 +425,9 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     sc->regs[idx] = data;
 }
 
-static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
-{
-    SuperIOConfig *sc = opaque;
-    uint8_t idx = sc->regs[0];
-    uint8_t val = sc->regs[idx];
-
-    if (addr == 0) {
-        return idx;
-    }
-    if (addr == 1 && idx == 0) {
-        val = 0; /* reading reg 0 where we store index value */
-    }
-    trace_via_superio_read(idx, val);
-    return val;
-}
-
-static const MemoryRegionOps superio_cfg_ops = {
-    .read = superio_cfg_read,
-    .write = superio_cfg_write,
+static const MemoryRegionOps vt82c686b_superio_cfg_ops = {
+    .read = via_superio_cfg_read,
+    .write = vt82c686b_superio_cfg_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -376,13 +435,66 @@ static const MemoryRegionOps superio_cfg_ops = {
     },
 };
 
+static void vt82c686b_superio_reset(DeviceState *dev)
+{
+    ViaSuperIOState *s = VIA_SUPERIO(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    /* Device ID */
+    vt82c686b_superio_cfg_write(s, 0, 0xe0, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0x3c, 1);
+    /* Function select - all disabled */
+    vt82c686b_superio_cfg_write(s, 0, 0xe2, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0x03, 1);
+    /* Floppy ctrl base addr */
+    vt82c686b_superio_cfg_write(s, 0, 0xe3, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xfc, 1);
+    /* Parallel port base addr */
+    vt82c686b_superio_cfg_write(s, 0, 0xe6, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xde, 1);
+    /* Serial port 1 base addr */
+    vt82c686b_superio_cfg_write(s, 0, 0xe7, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xfe, 1);
+    /* Serial port 2 base addr */
+    vt82c686b_superio_cfg_write(s, 0, 0xe8, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xbe, 1);
+
+    vt82c686b_superio_cfg_write(s, 0, 0, 1);
+}
+
+static void vt82c686b_superio_init(Object *obj)
+{
+    VIA_SUPERIO(obj)->io_ops = &vt82c686b_superio_cfg_ops;
+}
+
+static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
+
+    dc->reset = vt82c686b_superio_reset;
+    sc->serial.count = 2;
+    sc->parallel.count = 1;
+    sc->ide.count = 0; /* emulated by via-ide */
+    sc->floppy.count = 1;
+}
+
+static const TypeInfo vt82c686b_superio_info = {
+    .name          = TYPE_VT82C686B_SUPERIO,
+    .parent        = TYPE_VIA_SUPERIO,
+    .instance_size = sizeof(ViaSuperIOState),
+    .instance_init = vt82c686b_superio_init,
+    .class_size    = sizeof(ISASuperIOClass),
+    .class_init    = vt82c686b_superio_class_init,
+};
+
 
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 struct VT82C686BISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
-    SuperIOConfig superio_cfg;
+    ViaSuperIOState *via_sio;
 };
 
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
@@ -400,7 +512,7 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x85) {
         /* BIT(1): enable or disable superio config io ports */
-        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
+        via_superio_io_enable(s->via_sio, val & BIT(1));
     }
 }
 
@@ -432,13 +544,6 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x5a] = 0x04; /* KBC/RTC Control*/
     pci_conf[0x5f] = 0x04;
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
-
-    s->superio_cfg.regs[0xe0] = 0x3c; /* Device ID */
-    s->superio_cfg.regs[0xe2] = 0x03; /* Function select */
-    s->superio_cfg.regs[0xe3] = 0xfc; /* Floppy ctrl base addr */
-    s->superio_cfg.regs[0xe6] = 0xde; /* Parallel port base addr */
-    s->superio_cfg.regs[0xe7] = 0xfe; /* Serial port 1 base addr */
-    s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
 }
 
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
@@ -447,7 +552,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
     qemu_irq *isa_irq;
-    ISASuperIOClass *ic;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
@@ -457,9 +561,8 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-    s->superio_cfg.superio = ISA_SUPERIO(isa_create_simple(isa_bus,
-                                                      TYPE_VT82C686B_SUPERIO));
-    ic = ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
+                                               TYPE_VT82C686B_SUPERIO));
     mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
@@ -467,31 +570,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
             d->wmask[i] = 0;
         }
     }
-
-    memory_region_init_io(&s->superio_cfg.io, OBJECT(d), &superio_cfg_ops,
-                          &s->superio_cfg, "superio_cfg", 2);
-    memory_region_set_enabled(&s->superio_cfg.io, false);
-    /*
-     * The floppy also uses 0x3f0 and 0x3f1.
-     * But we do not emulate a floppy, so just set it here.
-     */
-    memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
-                                &s->superio_cfg.io);
-
-    /* Grab io regions of serial devices so we can control them */
-    for (i = 0; i < ic->serial.count; i++) {
-        ISADevice *sd = s->superio_cfg.superio->serial[i];
-        MemoryRegion *io = isa_address_space_io(sd);
-        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
-        if (!mr) {
-            error_setg(errp, "Could not get io region for serial %d", i);
-            return;
-        }
-        s->superio_cfg.serial_io[i] = mr;
-        if (memory_region_is_mapped(mr)) {
-            memory_region_del_subregion(io, mr);
-        }
-    }
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
@@ -527,32 +605,14 @@ static const TypeInfo via_info = {
 };
 
 
-static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
-{
-    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
-
-    sc->serial.count = 2;
-    sc->parallel.count = 1;
-    sc->ide.count = 0;
-    sc->floppy.count = 1;
-}
-
-static const TypeInfo via_superio_info = {
-    .name          = TYPE_VT82C686B_SUPERIO,
-    .parent        = TYPE_ISA_SUPERIO,
-    .instance_size = sizeof(ISASuperIODevice),
-    .class_size    = sizeof(ISASuperIOClass),
-    .class_init    = vt82c686b_superio_class_init,
-};
-
-
 static void vt82c686b_register_types(void)
 {
     type_register_static(&via_pm_info);
     type_register_static(&vt82c686b_pm_info);
     type_register_static(&vt8231_pm_info);
-    type_register_static(&via_info);
     type_register_static(&via_superio_info);
+    type_register_static(&vt82c686b_superio_info);
+    type_register_static(&via_info);
 }
 
 type_init(vt82c686b_register_types)
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 9b6d610e83..0692b9a527 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -2,7 +2,6 @@
 #define HW_VT82C686_H
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
-#define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
-- 
2.21.3


