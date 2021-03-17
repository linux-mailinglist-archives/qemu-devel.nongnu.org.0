Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202A33E648
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:39:36 +0100 (CET)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lML9r-0002Da-Fo
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMKyi-0008SB-MP; Tue, 16 Mar 2021 21:28:07 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMKye-0000W6-Rq; Tue, 16 Mar 2021 21:28:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2E74174642A;
 Wed, 17 Mar 2021 02:27:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 86E2B7463B7; Wed, 17 Mar 2021 02:27:51 +0100 (CET)
Message-Id: <e5b92a771d811a46faf64ff56b2c07e6796eaf71.1615943871.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1615943871.git.balaton@eik.bme.hu>
References: <cover.1615943871.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v10 3/7] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
Date: Wed, 17 Mar 2021 02:17:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 10%
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow reusing ISA bridge emulation for vt8231_isa move the device
state of vt82c686b_isa emulation in an abstract via_isa class. This
change breaks migration back compatibility but this is not an issue
for Fuloong2E machine which is not versioned or migration supported.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
 include/hw/pci/pci_ids.h |  2 +-
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b3048fd37e..69f073ec9e 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -518,24 +518,48 @@ static const TypeInfo vt8231_superio_info = {
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
@@ -545,19 +569,9 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
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
@@ -577,7 +591,7 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BISAState *s = VT82C686B_ISA(d);
+    ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
     qemu_irq *isa_irq;
@@ -601,7 +615,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     }
 }
 
-static void via_class_init(ObjectClass *klass, void *data)
+static void vt82c686b_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -609,28 +623,21 @@ static void via_class_init(ObjectClass *klass, void *data)
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
 };
 
 
@@ -642,7 +649,8 @@ static void vt82c686b_register_types(void)
     type_register_static(&via_superio_info);
     type_register_static(&vt82c686b_superio_info);
     type_register_static(&vt8231_superio_info);
-    type_register_static(&via_info);
+    type_register_static(&via_isa_info);
+    type_register_static(&vt82c686b_isa_info);
 }
 
 type_init(vt82c686b_register_types)
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index ea28dcc850..aa3f67eaa4 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -204,7 +204,7 @@
 #define PCI_VENDOR_ID_XILINX             0x10ee
 
 #define PCI_VENDOR_ID_VIA                0x1106
-#define PCI_DEVICE_ID_VIA_ISA_BRIDGE     0x0686
+#define PCI_DEVICE_ID_VIA_82C686B_ISA    0x0686
 #define PCI_DEVICE_ID_VIA_IDE            0x0571
 #define PCI_DEVICE_ID_VIA_UHCI           0x3038
 #define PCI_DEVICE_ID_VIA_82C686B_PM     0x3057
-- 
2.21.4


