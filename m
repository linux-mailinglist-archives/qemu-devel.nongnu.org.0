Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6382E33A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:33:43 +0100 (CET)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiLt-0007aM-Sh
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD3-0007V0-6U
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:33 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD0-0003wS-DH
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0FE237470DD;
 Mon, 28 Dec 2020 03:24:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 560257470E6; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <1ebc069cbab65386d01125f6b0997a88e560d582.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 06/10] audio/via-ac97: Simplify code and set user_creatable
 to false
Date: Mon, 28 Dec 2020 03:08:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 9%
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

Remove some unneded, empty code and set user_creatable to false
(besides being not implemented yet, so does nothing anyway) it's also
normally part of VIA south bridge chips so no need to confuse users
showing them these devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/audio/via-ac97.c | 51 +++++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
index e617416ff7..6d556f74fc 100644
--- a/hw/audio/via-ac97.c
+++ b/hw/audio/via-ac97.c
@@ -13,27 +13,13 @@
 #include "hw/isa/vt82c686.h"
 #include "hw/pci/pci.h"
 
-struct VIAAC97State {
-    PCIDevice dev;
-};
-
-struct VIAMC97State {
-    PCIDevice dev;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
-
-static void via_ac97_realize(PCIDevice *dev, Error **errp)
+static void via_ac97_realize(PCIDevice *pci_dev, Error **errp)
 {
-    VIAAC97State *s = VIA_AC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_PARITY);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_CAP_LIST |
-                 PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+    pci_set_word(pci_dev->config + PCI_COMMAND,
+                 PCI_COMMAND_INVALIDATE | PCI_COMMAND_PARITY);
+    pci_set_word(pci_dev->config + PCI_STATUS,
+                 PCI_STATUS_CAP_LIST | PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_dev->config + PCI_INTERRUPT_PIN, 0x03);
 }
 
 static void via_ac97_class_init(ObjectClass *klass, void *data)
@@ -47,13 +33,15 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
     k->revision = 0x50;
     k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
     set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
-    dc->desc = "AC97";
+    dc->desc = "VIA AC97";
+    /* Reason: Part of a south bridge chip */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo via_ac97_info = {
     .name          = TYPE_VIA_AC97,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAAC97State),
+    .instance_size = sizeof(PCIDevice),
     .class_init    = via_ac97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -61,15 +49,12 @@ static const TypeInfo via_ac97_info = {
     },
 };
 
-static void via_mc97_realize(PCIDevice *dev, Error **errp)
+static void via_mc97_realize(PCIDevice *pci_dev, Error **errp)
 {
-    VIAMC97State *s = VIA_MC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_VGA_PALETTE);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+    pci_set_word(pci_dev->config + PCI_COMMAND,
+                 PCI_COMMAND_INVALIDATE | PCI_COMMAND_VGA_PALETTE);
+    pci_set_word(pci_dev->config + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_dev->config + PCI_INTERRUPT_PIN, 0x03);
 }
 
 static void via_mc97_class_init(ObjectClass *klass, void *data)
@@ -83,13 +68,15 @@ static void via_mc97_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
     k->revision = 0x30;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
-    dc->desc = "MC97";
+    dc->desc = "VIA MC97";
+    /* Reason: Part of a south bridge chip */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo via_mc97_info = {
     .name          = TYPE_VIA_MC97,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAMC97State),
+    .instance_size = sizeof(PCIDevice),
     .class_init    = via_mc97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.21.3


