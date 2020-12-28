Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990612E3398
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:27:37 +0100 (CET)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiG0-0000oh-K4
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD0-0007SH-Rc
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiCx-0003v7-7N
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EA4D17470F5;
 Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 495097470DB; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <0df2885abd286feab5d8edf864afa65bf35c6f95.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 04/10] vt82c686: Remove vt82c686b_[am]c97_init() functions
Date: Mon, 28 Dec 2020 03:08:13 +0100
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

These are legacy init functions that are just equivalent to directly
calling pci_create_simple so do that instead. Also rename objects to
lower case via-ac97 and via-mc97 matching naming of other devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 27 ++++-----------------------
 hw/mips/fuloong2e.c       |  4 ++--
 include/hw/isa/vt82c686.h |  4 ++--
 3 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d40599c7da..8677a2d212 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -179,12 +179,6 @@ struct VIAMC97State {
 #define TYPE_VT82C686B_PM "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
-#define TYPE_VIA_MC97 "VIA_MC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
-
-#define TYPE_VIA_AC97 "VIA_AC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
-
 static void pm_update_sci(VT686PMState *s)
 {
     int sci_level, pmsts;
@@ -254,10 +248,13 @@ static const VMStateDescription vmstate_acpi = {
 };
 
 /*
- * TODO: vt82c686b_ac97_init() and vt82c686b_mc97_init()
+ * TODO: VIA_AC97 and VIA_MC97
  * just register a PCI device now, functionalities will be implemented later.
  */
 
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
+
 static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
 {
     VIAAC97State *s = VIA_AC97(dev);
@@ -270,14 +267,6 @@ static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
 }
 
-void vt82c686b_ac97_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *dev;
-
-    dev = pci_new(devfn, TYPE_VIA_AC97);
-    pci_realize_and_unref(dev, bus, &error_fatal);
-}
-
 static void via_ac97_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -314,14 +303,6 @@ static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
 }
 
-void vt82c686b_mc97_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *dev;
-
-    dev = pci_new(devfn, TYPE_VIA_MC97);
-    pci_realize_and_unref(dev, bus, &error_fatal);
-}
-
 static void via_mc97_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index f0733e87b7..3b0489f781 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -264,8 +264,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);
 
     /* Audio support */
-    vt82c686b_ac97_init(pci_bus, PCI_DEVFN(slot, 5));
-    vt82c686b_mc97_init(pci_bus, PCI_DEVFN(slot, 6));
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
 }
 
 /* Network support */
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index f23f45dfb1..ff80a926dc 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -3,11 +3,11 @@
 
 
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
+#define TYPE_VIA_AC97 "via-ac97"
+#define TYPE_VIA_MC97 "via-mc97"
 
 /* vt82c686.c */
 ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
-void vt82c686b_ac97_init(PCIBus *bus, int devfn);
-void vt82c686b_mc97_init(PCIBus *bus, int devfn);
 I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                           qemu_irq sci_irq);
 
-- 
2.21.3


