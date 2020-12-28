Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0F2E339E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:29:48 +0100 (CET)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiI7-0004GB-AH
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD9-0007b3-JF
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:39 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:57235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD2-0003xg-LK
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 617AE7470F6;
 Mon, 28 Dec 2020 03:24:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 500467470DF; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <76efd30b1c69505e4ed4c1e3d680f328b2734750.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 05/10] vt82c686: Split off via-[am]c97 into separate file
 in hw/audio
Date: Mon, 28 Dec 2020 03:08:13 +0100
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

The via-[am]c97 code is supposed to implement the audio part of VIA
south bridge chips so it is better placed under hw/audio/. Split it
off into a separate file.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Reworded commit message

 hw/audio/meson.build |   1 +
 hw/audio/via-ac97.c  | 106 +++++++++++++++++++++++++++++++++++++++++++
 hw/isa/vt82c686.c    |  91 -------------------------------------
 3 files changed, 107 insertions(+), 91 deletions(-)
 create mode 100644 hw/audio/via-ac97.c

diff --git a/hw/audio/meson.build b/hw/audio/meson.build
index 549e9a0396..32c42bdebe 100644
--- a/hw/audio/meson.build
+++ b/hw/audio/meson.build
@@ -11,4 +11,5 @@ softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-ac97.c'))
 softmmu_ss.add(when: 'CONFIG_PCSPK', if_true: files('pcspk.c'))
 softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
 softmmu_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
+softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('via-ac97.c'))
 softmmu_ss.add(when: 'CONFIG_WM8750', if_true: files('wm8750.c'))
diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
new file mode 100644
index 0000000000..e617416ff7
--- /dev/null
+++ b/hw/audio/via-ac97.c
@@ -0,0 +1,106 @@
+/*
+ * VIA south bridges sound support
+ *
+ * This work is licensed under the GNU GPL license version 2 or later.
+ */
+
+/*
+ * TODO: This is entirely boiler plate just registering empty PCI devices
+ * with the right ID guests expect, functionality should be added here.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/isa/vt82c686.h"
+#include "hw/pci/pci.h"
+
+struct VIAAC97State {
+    PCIDevice dev;
+};
+
+struct VIAMC97State {
+    PCIDevice dev;
+};
+
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
+
+static void via_ac97_realize(PCIDevice *dev, Error **errp)
+{
+    VIAAC97State *s = VIA_AC97(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
+                 PCI_COMMAND_PARITY);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_CAP_LIST |
+                 PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+}
+
+static void via_ac97_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = via_ac97_realize;
+    k->vendor_id = PCI_VENDOR_ID_VIA;
+    k->device_id = PCI_DEVICE_ID_VIA_AC97;
+    k->revision = 0x50;
+    k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
+    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
+    dc->desc = "AC97";
+}
+
+static const TypeInfo via_ac97_info = {
+    .name          = TYPE_VIA_AC97,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(VIAAC97State),
+    .class_init    = via_ac97_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void via_mc97_realize(PCIDevice *dev, Error **errp)
+{
+    VIAMC97State *s = VIA_MC97(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
+                 PCI_COMMAND_VGA_PALETTE);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+}
+
+static void via_mc97_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = via_mc97_realize;
+    k->vendor_id = PCI_VENDOR_ID_VIA;
+    k->device_id = PCI_DEVICE_ID_VIA_MC97;
+    k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+    k->revision = 0x30;
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->desc = "MC97";
+}
+
+static const TypeInfo via_mc97_info = {
+    .name          = TYPE_VIA_MC97,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(VIAMC97State),
+    .class_init    = via_mc97_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void via_ac97_register_types(void)
+{
+    type_register_static(&via_ac97_info);
+    type_register_static(&via_mc97_info);
+}
+
+type_init(via_ac97_register_types)
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 8677a2d212..9567326d8e 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -168,14 +168,6 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-struct VIAAC97State {
-    PCIDevice dev;
-};
-
-struct VIAMC97State {
-    PCIDevice dev;
-};
-
 #define TYPE_VT82C686B_PM "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
@@ -247,87 +239,6 @@ static const VMStateDescription vmstate_acpi = {
     }
 };
 
-/*
- * TODO: VIA_AC97 and VIA_MC97
- * just register a PCI device now, functionalities will be implemented later.
- */
-
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
-
-static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
-{
-    VIAAC97State *s = VIA_AC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_PARITY);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_CAP_LIST |
-                 PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
-}
-
-static void via_ac97_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = vt82c686b_ac97_realize;
-    k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_AC97;
-    k->revision = 0x50;
-    k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
-    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
-    dc->desc = "AC97";
-}
-
-static const TypeInfo via_ac97_info = {
-    .name          = TYPE_VIA_AC97,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAAC97State),
-    .class_init    = via_ac97_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
-{
-    VIAMC97State *s = VIA_MC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_VGA_PALETTE);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
-}
-
-static void via_mc97_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = vt82c686b_mc97_realize;
-    k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_MC97;
-    k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
-    k->revision = 0x30;
-    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
-    dc->desc = "MC97";
-}
-
-static const TypeInfo via_mc97_info = {
-    .name          = TYPE_VIA_MC97,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAMC97State),
-    .class_init    = via_mc97_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
 /* vt82c686 pm init */
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
@@ -516,8 +427,6 @@ static const TypeInfo via_superio_info = {
 
 static void vt82c686b_register_types(void)
 {
-    type_register_static(&via_ac97_info);
-    type_register_static(&via_mc97_info);
     type_register_static(&via_pm_info);
     type_register_static(&via_superio_info);
     type_register_static(&via_info);
-- 
2.21.3


