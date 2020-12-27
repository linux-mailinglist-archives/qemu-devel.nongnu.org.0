Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4E2E3319
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 23:26:51 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kteV0-0002wY-JY
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 17:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kteSs-0000MA-7Q
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:24:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:21903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kteSk-0007zp-NI
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:24:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 32FFC74645F;
 Sun, 27 Dec 2020 23:24:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 94D977470DF; Sun, 27 Dec 2020 23:24:26 +0100 (CET)
Message-Id: <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609107222.git.balaton@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
Subject: [PATCH v2 2/2] via-ide: Fix fuloong2e support
Date: Sun, 27 Dec 2020 23:13:42 +0100
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, f4bug@amsat.org,
 John Snow <jsnow@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

The IDE legacy mode emulation has been removed in commit 4ea98d317eb
("ide/via: Implement and use native PCI IDE mode") but some Linux
kernels (probably including def_config) require legacy mode on the
Fuloong2e so only emulating native mode did not turn out feasible.
Add property to via-ide model to make the mode configurable, and set
legacy mode for Fuloong2e.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
[balaton: Use bit in flags for property, add comment for missing BAR4]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Reworded commit message

 hw/ide/via.c        | 19 +++++++++++++++++--
 hw/mips/fuloong2e.c |  4 +++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b33..7d54d7e829 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
@@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
                           &d->bus[1], "via-ide1-cmd", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
-    bmdma_setup_bar(d);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
+        /* Missing BAR4 will make Linux driver fall back to legacy PIO mode */
+        bmdma_setup_bar(d);
+        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    }
 
     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
+            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
+                            i ? 0x376 : 0x3f6);
+        }
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
@@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property via_ide_properties[] = {
+    DEFINE_PROP_BIT("legacy_mode", PCIIDEState, flags, PCI_IDE_LEGACY_MODE,
+                    false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void via_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_VIA_IDE;
     k->revision = 0x06;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    device_class_set_props(dc, via_ide_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 45c596f4fe..f0733e87b7 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
+    qdev_prop_set_bit(&dev->qdev, "legacy_mode", true);
+    pci_realize_and_unref(dev, pci_bus, &error_fatal);
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-- 
2.21.3


