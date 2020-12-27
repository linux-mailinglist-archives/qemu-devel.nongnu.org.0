Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80722E2F8F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:24:46 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktKnd-0001np-LL
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkY-0008TW-CP
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:35 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkS-0001Dq-RE
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F7667470F1;
 Sun, 27 Dec 2020 02:21:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EE9A97470DF; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <599e3174ab2cbe105d17733ae25c1a7f22030dcb.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609031406.git.balaton@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
Subject: [PATCH 11/12] vt82c686: Rename some functions to better show where
 they belong
Date: Sun, 27 Dec 2020 02:10:06 +0100
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

This groups identifiers related to the ISA bridge part and superio
part also in their naming.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 48 ++++++++++++++++++---------------------
 hw/mips/fuloong2e.c       |  2 +-
 include/hw/isa/vt82c686.h |  2 +-
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 6dff2bc67d..698627d1b5 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -36,10 +36,10 @@ struct VT82C686BState {
     SuperIOConfig superio_conf;
 };
 
-OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
+OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B_ISA)
 
-static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
-                                  unsigned size)
+static void vt82c686b_superio_writeb(void *opaque, hwaddr addr, uint64_t data,
+                                     unsigned size)
 {
     SuperIOConfig *superio_conf = opaque;
 
@@ -72,7 +72,8 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
     }
 }
 
-static uint64_t superio_ioport_readb(void *opaque, hwaddr addr, unsigned size)
+static uint64_t vt82c686b_superio_readb(void *opaque, hwaddr addr,
+                                        unsigned size)
 {
     SuperIOConfig *superio_conf = opaque;
     uint8_t val = superio_conf->config[superio_conf->index];
@@ -81,9 +82,9 @@ static uint64_t superio_ioport_readb(void *opaque, hwaddr addr, unsigned size)
     return val;
 }
 
-static const MemoryRegionOps superio_ops = {
-    .read = superio_ioport_readb,
-    .write = superio_ioport_writeb,
+static const MemoryRegionOps vt82c686b_superio_ops = {
+    .read = vt82c686b_superio_readb,
+    .write = vt82c686b_superio_writeb,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -93,7 +94,7 @@ static const MemoryRegionOps superio_ops = {
 
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BState *vt82c = VT82C686B(dev);
+    VT82C686BState *vt82c = VT82C686B_ISA(dev);
     uint8_t *pci_conf = vt82c->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
@@ -118,11 +119,10 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     vt82c->superio_conf.config[0xe8] = 0xbe;
 }
 
-/* write config pci function0 registers. PCI-ISA bridge */
-static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
+static void vt82c686b_isa_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
-    VT82C686BState *vt686 = VT82C686B(d);
+    VT82C686BState *vt686 = VT82C686B_ISA(d);
 
     trace_via_isa_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
@@ -284,10 +284,9 @@ static const VMStateDescription vmstate_via = {
     }
 };
 
-/* init the PCI-to-ISA bridge */
-static void vt82c686b_realize(PCIDevice *d, Error **errp)
+static void vt82c686b_isa_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BState *vt82c = VT82C686B(d);
+    VT82C686BState *vt82c = VT82C686B_ISA(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -309,7 +308,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&vt82c->superio, OBJECT(d), &superio_ops,
+    memory_region_init_io(&vt82c->superio, OBJECT(d), &vt82c686b_superio_ops,
                           &vt82c->superio_conf, "superio", 2);
     memory_region_set_enabled(&vt82c->superio, false);
     /*
@@ -320,13 +319,13 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
                                 &vt82c->superio);
 }
 
-static void via_class_init(ObjectClass *klass, void *data)
+static void via_isa_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->realize = vt82c686b_realize;
-    k->config_write = vt82c686b_write_config;
+    k->realize = vt82c686b_isa_realize;
+    k->config_write = vt82c686b_isa_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_ISA_BRIDGE;
     k->class_id = PCI_CLASS_BRIDGE_ISA;
@@ -334,18 +333,15 @@ static void via_class_init(ObjectClass *klass, void *data)
     dc->reset = vt82c686b_isa_reset;
     dc->desc = "ISA bridge";
     dc->vmsd = &vmstate_via;
-    /*
-     * Reason: part of VIA VT82C686 southbridge, needs to be wired up,
-     * e.g. by mips_fuloong2e_init()
-     */
+    /* Reason: Part of VIA southbridge, needs to be wired up by board code */
     dc->user_creatable = false;
 }
 
-static const TypeInfo via_info = {
-    .name          = TYPE_VT82C686B,
+static const TypeInfo via_isa_info = {
+    .name          = TYPE_VT82C686B_ISA,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT82C686BState),
-    .class_init    = via_class_init,
+    .class_init    = via_isa_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
@@ -374,7 +370,7 @@ static void vt82c686b_register_types(void)
 {
     type_register_static(&via_pm_info);
     type_register_static(&via_superio_info);
-    type_register_static(&via_info);
+    type_register_static(&via_isa_info);
 }
 
 type_init(vt82c686b_register_types)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index d275038830..a2b69a3a7a 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -241,7 +241,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     PCIDevice *dev;
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
-                                          TYPE_VT82C686B);
+                                          TYPE_VT82C686B_ISA);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
     assert(isa_bus);
     *p_isa_bus = isa_bus;
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 080ee8fc59..5b0a1ffe72 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,7 +1,7 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
-#define TYPE_VT82C686B "vt82c686b"
+#define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VIA_AC97 "via-ac97"
-- 
2.21.3


