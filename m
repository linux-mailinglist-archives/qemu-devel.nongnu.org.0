Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD142E86FE
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:20:56 +0100 (CET)
Received: from localhost ([::1]:38204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvexr-00011p-FI
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqw-0000ss-UY
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:47 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:56513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqr-00078t-NC
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C80D274760E;
 Sat,  2 Jan 2021 12:13:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 217CD747610; Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Message-Id: <4a5584e436ab30731abac5bf5fab7f389683c1c6.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 17/24] vt82c686: Make vt82c686b-pm an abstract base class and
 add vt8231-pm based on it
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
only difference between the two is the device id in what we emulate so
make an abstract via-pm model by renaming appropriately and add types
for vt82c686b-pm and vt8231-pm based on it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 87 ++++++++++++++++++++++++++-------------
 include/hw/isa/vt82c686.h |  1 +
 2 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index fc2a1f4430..a989e29fe5 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -27,9 +27,10 @@
 #include "exec/address-spaces.h"
 #include "trace.h"
 
-OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
+#define TYPE_VIA_PM "via-pm"
+OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
 
-struct VT686PMState {
+struct ViaPMState {
     PCIDevice dev;
     MemoryRegion io;
     ACPIREGS ar;
@@ -37,7 +38,7 @@ struct VT686PMState {
     PMSMBus smb;
 };
 
-static void pm_io_space_update(VT686PMState *s)
+static void pm_io_space_update(ViaPMState *s)
 {
     uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
 
@@ -47,7 +48,7 @@ static void pm_io_space_update(VT686PMState *s)
     memory_region_transaction_commit();
 }
 
-static void smb_io_space_update(VT686PMState *s)
+static void smb_io_space_update(ViaPMState *s)
 {
     uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
 
@@ -59,7 +60,7 @@ static void smb_io_space_update(VT686PMState *s)
 
 static int vmstate_acpi_post_load(void *opaque, int version_id)
 {
-    VT686PMState *s = opaque;
+    ViaPMState *s = opaque;
 
     pm_io_space_update(s);
     smb_io_space_update(s);
@@ -72,20 +73,20 @@ static const VMStateDescription vmstate_acpi = {
     .minimum_version_id = 1,
     .post_load = vmstate_acpi_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, VT686PMState),
-        VMSTATE_UINT16(ar.pm1.evt.sts, VT686PMState),
-        VMSTATE_UINT16(ar.pm1.evt.en, VT686PMState),
-        VMSTATE_UINT16(ar.pm1.cnt.cnt, VT686PMState),
-        VMSTATE_STRUCT(apm, VT686PMState, 0, vmstate_apm, APMState),
-        VMSTATE_TIMER_PTR(ar.tmr.timer, VT686PMState),
-        VMSTATE_INT64(ar.tmr.overflow_time, VT686PMState),
+        VMSTATE_PCI_DEVICE(dev, ViaPMState),
+        VMSTATE_UINT16(ar.pm1.evt.sts, ViaPMState),
+        VMSTATE_UINT16(ar.pm1.evt.en, ViaPMState),
+        VMSTATE_UINT16(ar.pm1.cnt.cnt, ViaPMState),
+        VMSTATE_STRUCT(apm, ViaPMState, 0, vmstate_apm, APMState),
+        VMSTATE_TIMER_PTR(ar.tmr.timer, ViaPMState),
+        VMSTATE_INT64(ar.tmr.overflow_time, ViaPMState),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 {
-    VT686PMState *s = VT82C686B_PM(d);
+    ViaPMState *s = VIA_PM(d);
 
     trace_via_pm_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
@@ -127,7 +128,7 @@ static const MemoryRegionOps pm_io_ops = {
     },
 };
 
-static void pm_update_sci(VT686PMState *s)
+static void pm_update_sci(ViaPMState *s)
 {
     int sci_level, pmsts;
 
@@ -145,13 +146,13 @@ static void pm_update_sci(VT686PMState *s)
 
 static void pm_tmr_timer(ACPIREGS *ar)
 {
-    VT686PMState *s = container_of(ar, VT686PMState, ar);
+    ViaPMState *s = container_of(ar, ViaPMState, ar);
     pm_update_sci(s);
 }
 
-static void vt82c686b_pm_reset(DeviceState *d)
+static void via_pm_reset(DeviceState *d)
 {
-    VT686PMState *s = VT82C686B_PM(d);
+    ViaPMState *s = VIA_PM(d);
 
     memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
            PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
@@ -164,9 +165,9 @@ static void vt82c686b_pm_reset(DeviceState *d)
     smb_io_space_update(s);
 }
 
-static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
+static void via_pm_realize(PCIDevice *dev, Error **errp)
 {
-    VT686PMState *s = VT82C686B_PM(dev);
+    ViaPMState *s = VIA_PM(dev);
 
     pci_set_word(dev->config + PCI_STATUS, PCI_STATUS_FAST_BACK |
                  PCI_STATUS_DEVSEL_MEDIUM);
@@ -177,8 +178,7 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 
     apm_init(dev, &s->apm, NULL, s);
 
-    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s,
-                          "vt82c686-pm", 0x100);
+    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s, "via-pm", 0x100);
     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
     memory_region_set_enabled(&s->io, false);
 
@@ -187,34 +187,61 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
 }
 
+typedef struct via_pm_init_info {
+    uint16_t device_id;
+} ViaPMInitInfo;
+
 static void via_pm_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    ViaPMInitInfo *info = data;
 
-    k->realize = vt82c686b_pm_realize;
+    k->realize = via_pm_realize;
     k->config_write = pm_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_ACPI;
+    k->device_id = info->device_id;
     k->class_id = PCI_CLASS_BRIDGE_OTHER;
     k->revision = 0x40;
-    dc->reset = vt82c686b_pm_reset;
-    dc->desc = "PM";
+    dc->reset = via_pm_reset;
+    /* Reason: part of VIA south bridge, does not exist stand alone */
+    dc->user_creatable = false;
     dc->vmsd = &vmstate_acpi;
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo via_pm_info = {
-    .name          = TYPE_VT82C686B_PM,
+    .name          = TYPE_VIA_PM,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT686PMState),
-    .class_init    = via_pm_class_init,
+    .instance_size = sizeof(ViaPMState),
+    .abstract      = true,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
     },
 };
 
+static const ViaPMInitInfo vt82c686b_pm_init_info = {
+    .device_id = PCI_DEVICE_ID_VIA_ACPI,
+};
+
+static const TypeInfo vt82c686b_pm_info = {
+    .name          = TYPE_VT82C686B_PM,
+    .parent        = TYPE_VIA_PM,
+    .class_init    = via_pm_class_init,
+    .class_data    = (void *)&vt82c686b_pm_init_info,
+};
+
+static const ViaPMInitInfo vt8231_pm_init_info = {
+    .device_id = 0x8235,
+};
+
+static const TypeInfo vt8231_pm_info = {
+    .name          = TYPE_VT8231_PM,
+    .parent        = TYPE_VIA_PM,
+    .class_init    = via_pm_class_init,
+    .class_data    = (void *)&vt8231_pm_init_info,
+};
+
 
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
@@ -423,6 +450,8 @@ static const TypeInfo via_superio_info = {
 static void vt82c686b_register_types(void)
 {
     type_register_static(&via_pm_info);
+    type_register_static(&vt82c686b_pm_info);
+    type_register_static(&vt8231_pm_info);
     type_register_static(&via_info);
     type_register_static(&via_superio_info);
 }
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 5b0a1ffe72..9b6d610e83 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -4,6 +4,7 @@
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
-- 
2.21.3


