Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694032572B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:58:51 +0100 (CET)
Received: from localhost ([::1]:36124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMmg-0002GP-AT
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lFMk6-0000Gi-Ed; Thu, 25 Feb 2021 14:56:10 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lFMk1-0000XE-IF; Thu, 25 Feb 2021 14:56:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7E11A746395;
 Thu, 25 Feb 2021 20:56:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 26653746342; Thu, 25 Feb 2021 20:56:00 +0100 (CET)
Message-Id: <57311c2585d09ce5485524f5a6b57fa2eafebc93.1614282456.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1614282456.git.balaton@eik.bme.hu>
References: <cover.1614282456.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 4/6] vt82c686: Add emulation of VT8231 south bridge
Date: Thu, 25 Feb 2021 20:47:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add emulation of VT8231 south bridge ISA part based on the similar
VT82C686B but implemented in a separate subclass that holds the
differences while reusing parts that can be shared.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 154 ++++++++++++++++++++++++++++++--------
 include/hw/isa/vt82c686.h |   1 +
 include/hw/pci/pci_ids.h  |   3 +-
 3 files changed, 126 insertions(+), 32 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 72234bc4d1..e0f2f2a5ce 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -8,6 +8,9 @@
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
  * GNU GPL, version 2 or (at your option) any later version.
+ *
+ * VT8231 south bridge support and general clean up to allow it
+ * Copyright (c) 2018-2020 BALATON Zoltan
  */
 
 #include "qemu/osdep.h"
@@ -609,24 +612,48 @@ static const TypeInfo vt8231_superio_info = {
 };
 
 
-OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
+#define TYPE_VIA_ISA "via-isa"
+OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 
-struct VT82C686BISAState {
+struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     ViaSuperIOState *via_sio;
 };
 
+static const VMStateDescription vmstate_via = {
+    .name = "via-isa",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(dev, ViaISAState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const TypeInfo via_isa_info = {
+    .name          = TYPE_VIA_ISA,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(ViaISAState),
+    .abstract      = true,
+    .interfaces    = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
 {
-    VT82C686BISAState *s = opaque;
+    ViaISAState *s = opaque;
     qemu_set_irq(s->cpu_intr, level);
 }
 
+/* TYPE_VT82C686B_ISA */
+
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
-    VT82C686BISAState *s = VT82C686B_ISA(d);
+    ViaISAState *s = VIA_ISA(d);
 
     trace_via_isa_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
@@ -636,19 +663,9 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     }
 }
 
-static const VMStateDescription vmstate_via = {
-    .name = "vt82c686b",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, VT82C686BISAState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BISAState *s = VT82C686B_ISA(dev);
+    ViaISAState *s = VIA_ISA(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
@@ -668,7 +685,7 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BISAState *s = VT82C686B_ISA(d);
+    ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
     qemu_irq *isa_irq;
@@ -692,7 +709,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     }
 }
 
-static void via_class_init(ObjectClass *klass, void *data)
+static void vt82c686b_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -700,28 +717,101 @@ static void via_class_init(ObjectClass *klass, void *data)
     k->realize = vt82c686b_realize;
     k->config_write = vt82c686b_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_ISA_BRIDGE;
+    k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
     k->class_id = PCI_CLASS_BRIDGE_ISA;
     k->revision = 0x40;
     dc->reset = vt82c686b_isa_reset;
     dc->desc = "ISA bridge";
     dc->vmsd = &vmstate_via;
-    /*
-     * Reason: part of VIA VT82C686 southbridge, needs to be wired up,
-     * e.g. by mips_fuloong2e_init()
-     */
+    /* Reason: part of VIA VT82C686 southbridge, needs to be wired up */
     dc->user_creatable = false;
 }
 
-static const TypeInfo via_info = {
+static const TypeInfo vt82c686b_isa_info = {
     .name          = TYPE_VT82C686B_ISA,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT82C686BISAState),
-    .class_init    = via_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
+    .parent        = TYPE_VIA_ISA,
+    .instance_size = sizeof(ViaISAState),
+    .class_init    = vt82c686b_class_init,
+};
+
+/* TYPE_VT8231_ISA */
+
+static void vt8231_write_config(PCIDevice *d, uint32_t addr,
+                                uint32_t val, int len)
+{
+    ViaISAState *s = VIA_ISA(d);
+
+    trace_via_isa_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
+    if (addr == 0x50) {
+        /* BIT(2): enable or disable superio config io ports */
+        via_superio_io_enable(s->via_sio, val & BIT(2));
+    }
+}
+
+static void vt8231_isa_reset(DeviceState *dev)
+{
+    ViaISAState *s = VIA_ISA(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+                 PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+
+    pci_conf[0x58] = 0x40; /* Miscellaneous Control 0 */
+    pci_conf[0x67] = 0x08; /* Fast IR Config */
+    pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
+}
+
+static void vt8231_realize(PCIDevice *d, Error **errp)
+{
+    ViaISAState *s = VIA_ISA(d);
+    DeviceState *dev = DEVICE(d);
+    ISABus *isa_bus;
+    qemu_irq *isa_irq;
+    int i;
+
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+                          &error_fatal);
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus, TYPE_VT8231_SUPERIO));
+    mc146818_rtc_init(isa_bus, 2000, NULL);
+
+    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
+        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
+            d->wmask[i] = 0;
+        }
+    }
+}
+
+static void vt8231_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = vt8231_realize;
+    k->config_write = vt8231_write_config;
+    k->vendor_id = PCI_VENDOR_ID_VIA;
+    k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
+    k->class_id = PCI_CLASS_BRIDGE_ISA;
+    k->revision = 0x10;
+    dc->reset = vt8231_isa_reset;
+    dc->desc = "ISA bridge";
+    dc->vmsd = &vmstate_via;
+    /* Reason: part of VIA VT8231 southbridge, needs to be wired up */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo vt8231_isa_info = {
+    .name          = TYPE_VT8231_ISA,
+    .parent        = TYPE_VIA_ISA,
+    .instance_size = sizeof(ViaISAState),
+    .class_init    = vt8231_class_init,
 };
 
 
@@ -733,7 +823,9 @@ static void vt82c686b_register_types(void)
     type_register_static(&via_superio_info);
     type_register_static(&vt82c686b_superio_info);
     type_register_static(&vt8231_superio_info);
-    type_register_static(&via_info);
+    type_register_static(&via_isa_info);
+    type_register_static(&vt82c686b_isa_info);
+    type_register_static(&vt8231_isa_info);
 }
 
 type_init(vt82c686b_register_types)
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 0692b9a527..0f01aaa471 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -3,6 +3,7 @@
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT8231_ISA "vt8231-isa"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index ea28dcc850..ac0c23ebc7 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -204,12 +204,13 @@
 #define PCI_VENDOR_ID_XILINX             0x10ee
 
 #define PCI_VENDOR_ID_VIA                0x1106
-#define PCI_DEVICE_ID_VIA_ISA_BRIDGE     0x0686
+#define PCI_DEVICE_ID_VIA_82C686B_ISA    0x0686
 #define PCI_DEVICE_ID_VIA_IDE            0x0571
 #define PCI_DEVICE_ID_VIA_UHCI           0x3038
 #define PCI_DEVICE_ID_VIA_82C686B_PM     0x3057
 #define PCI_DEVICE_ID_VIA_AC97           0x3058
 #define PCI_DEVICE_ID_VIA_MC97           0x3068
+#define PCI_DEVICE_ID_VIA_8231_ISA       0x8231
 #define PCI_DEVICE_ID_VIA_8231_PM        0x8235
 
 #define PCI_VENDOR_ID_MARVELL            0x11ab
-- 
2.21.3


