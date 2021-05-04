Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2E3725C7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:22:56 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoSN-0003An-E8
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo08-0005KW-Fw; Tue, 04 May 2021 01:53:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44361 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo04-0004o7-JW; Tue, 04 May 2021 01:53:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK73jGz9sXV; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=SsKlfI6yrduwGMnjRDoeM7J1/IlBU2XdXbbenbXefC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PWGZHYa0ysxtJKm5AcUcl6LZKm5I5Gn/qPTc0ecisuoURXBIDlRjpBWwOjTZeu4j4
 aFZALAYDQW8lxxFwv1eO0DXkHMo4f/FKkw8xOg5/z+Qdqh29kOXaELB69Mw0/kKKii
 Fo3FCOSVKvmf2b0r3O9j+HEhqO0TzaVxuZNY7bK0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 20/46] vt82c686: QOM-ify superio related functionality
Date: Tue,  4 May 2021 15:52:46 +1000
Message-Id: <20210504055312.306823-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Collect superio functionality and its controlling config registers
handling in an abstract VIA_SUPERIO class that is a subclass of
ISA_SUPERIO and put vt82c686b specific parts in a subclass of this
abstract class.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <fbcc8cc8baf83f327612a1ef1c14bcbcdb0e7edb.1616680239.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/isa/vt82c686.c         | 196 +++++++++++++++++++++++++-------------
 include/hw/isa/vt82c686.h |   1 -
 2 files changed, 132 insertions(+), 65 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 98325bb32b..ea55117724 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -265,15 +265,80 @@ static const TypeInfo vt8231_pm_info = {
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
-} SuperIOConfig;
+};
+
+static inline void via_superio_io_enable(ViaSuperIOState *s, bool enable)
+{
+    memory_region_set_enabled(&s->io, enable);
+}
+
+static void via_superio_realize(DeviceState *d, Error **errp)
+{
+    ViaSuperIOState *s = VIA_SUPERIO(d);
+    ISASuperIOClass *ic = ISA_SUPERIO_GET_CLASS(s);
+    Error *local_err = NULL;
+
+    assert(s->io_ops);
+    ic->parent_realize(d, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
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
 
-static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
-                              unsigned size)
+static void vt82c686b_superio_cfg_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
 {
-    SuperIOConfig *sc = opaque;
+    ViaSuperIOState *sc = opaque;
     uint8_t idx = sc->regs[0];
 
     if (addr == 0) { /* config index register */
@@ -304,25 +369,9 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
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
@@ -330,13 +379,66 @@ static const MemoryRegionOps superio_cfg_ops = {
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
+    /* Floppy ctrl base addr 0x3f0-7 */
+    vt82c686b_superio_cfg_write(s, 0, 0xe3, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xfc, 1);
+    /* Parallel port base addr 0x378-f */
+    vt82c686b_superio_cfg_write(s, 0, 0xe6, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xde, 1);
+    /* Serial port 1 base addr 0x3f8-f */
+    vt82c686b_superio_cfg_write(s, 0, 0xe7, 1);
+    vt82c686b_superio_cfg_write(s, 1, 0xfe, 1);
+    /* Serial port 2 base addr 0x2f8-f */
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
@@ -354,7 +456,7 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x85) {
         /* BIT(1): enable or disable superio config io ports */
-        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
+        via_superio_io_enable(s->via_sio, val & BIT(1));
     }
 }
 
@@ -386,13 +488,6 @@ static void vt82c686b_isa_reset(DeviceState *dev)
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
@@ -410,7 +505,8 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
+                                               TYPE_VT82C686B_SUPERIO));
     mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
@@ -418,16 +514,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
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
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
@@ -463,32 +549,14 @@ static const TypeInfo via_info = {
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
2.31.1


