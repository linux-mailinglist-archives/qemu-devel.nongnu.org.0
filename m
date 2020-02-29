Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93BF174A1F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 00:28:43 +0100 (CET)
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8BXG-0001Uz-Uf
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 18:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j8BW2-0008NQ-LL
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 18:27:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j8BW1-0005Wt-Fo
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 18:27:26 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40851)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j8BVx-0005L8-Lz; Sat, 29 Feb 2020 18:27:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1242C747E01;
 Sun,  1 Mar 2020 00:27:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8085F747E04; Sun,  1 Mar 2020 00:27:11 +0100 (CET)
Message-Id: <775825dba26f6b36ab067f253e4ab5dc3a3d15dc.1583017348.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1583017348.git.balaton@eik.bme.hu>
References: <cover.1583017348.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/2] ide: Make room for flags in PCIIDEState and add one for
 legacy IRQ routing
Date: Sun, 01 Mar 2020 00:02:28 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll need a flag for implementing some device specific behaviour in
via-ide but we already have a currently CMD646 specific field that can
be repurposed for this and leave room for furhter flags if needed in
the future. This patch changes the "secondary" field to "flags" and
define the flags for CMD646 and via-ide and change CMD646 and its
users accordingly.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/alpha/dp264.c     |  2 +-
 hw/ide/cmd646.c      | 12 ++++++------
 hw/sparc64/sun4u.c   |  9 ++-------
 include/hw/ide.h     |  4 ++--
 include/hw/ide/pci.h |  7 ++++++-
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 8d71a30617..e4075feaaf 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -102,7 +102,7 @@ static void clipper_init(MachineState *machine)
         DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
         ide_drive_get(hd, ARRAY_SIZE(hd));
 
-        pci_cmd646_ide_init(pci_bus, hd, 0);
+        pci_cmd646_ide_init(pci_bus, hd, -1, false);
     }
 
     /* Load PALcode.  Given that this is not "real" cpu palcode,
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 335c060673..0be650791f 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -256,7 +256,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     pci_conf[PCI_CLASS_PROG] = 0x8f;
 
     pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0
-    if (d->secondary) {
+    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
         /* XXX: if not enabled, really disable the seconday IDE controller */
         pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */
     }
@@ -317,20 +317,20 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
     }
 }
 
-void pci_cmd646_ide_init(PCIBus *bus, DriveInfo **hd_table,
-                         int secondary_ide_enabled)
+void pci_cmd646_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn,
+                         bool secondary_ide_enabled)
 {
     PCIDevice *dev;
 
-    dev = pci_create(bus, -1, "cmd646-ide");
-    qdev_prop_set_uint32(&dev->qdev, "secondary", secondary_ide_enabled);
+    dev = pci_create(bus, devfn, "cmd646-ide");
+    qdev_prop_set_bit(&dev->qdev, "secondary", secondary_ide_enabled);
     qdev_init_nofail(&dev->qdev);
 
     pci_ide_create_devs(dev, hd_table);
 }
 
 static Property cmd646_ide_properties[] = {
-    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
+    DEFINE_PROP_BIT("secondary", PCIIDEState, flags, PCI_IDE_SECONDARY, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index b7ac42f7a5..b64899300c 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -50,8 +50,7 @@
 #include "hw/sparc/sparc64.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/sysbus.h"
-#include "hw/ide.h"
-#include "hw/ide/pci.h"
+#include "hw/ide/internal.h"
 #include "hw/loader.h"
 #include "hw/fw-path-provider.h"
 #include "elf.h"
@@ -664,11 +663,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     }
 
     ide_drive_get(hd, ARRAY_SIZE(hd));
-
-    pci_dev = pci_create(pci_busA, PCI_DEVFN(3, 0), "cmd646-ide");
-    qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
-    qdev_init_nofail(&pci_dev->qdev);
-    pci_ide_create_devs(pci_dev, hd);
+    pci_cmd646_ide_init(pci_busA, hd, PCI_DEVFN(3, 0), true);
 
     /* Map NVRAM into I/O (ebus) space */
     nvram = m48t59_init(NULL, 0, 0, NVRAM_SIZE, 1968, 59);
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 28d8a06439..d88c5ee695 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -12,8 +12,8 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
 /* ide-pci.c */
-void pci_cmd646_ide_init(PCIBus *bus, DriveInfo **hd_table,
-                         int secondary_ide_enabled);
+void pci_cmd646_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn,
+                         bool secondary_ide_enabled);
 PCIDevice *pci_piix3_xen_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
 PCIDevice *pci_piix3_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
 PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index a9f2c33e68..21075edf16 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -40,6 +40,11 @@ typedef struct BMDMAState {
 #define TYPE_PCI_IDE "pci-ide"
 #define PCI_IDE(obj) OBJECT_CHECK(PCIIDEState, (obj), TYPE_PCI_IDE)
 
+enum {
+    PCI_IDE_SECONDARY, /* used only for cmd646 */
+    PCI_IDE_LEGACY_IRQ
+};
+
 typedef struct PCIIDEState {
     /*< private >*/
     PCIDevice parent_obj;
@@ -47,7 +52,7 @@ typedef struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
-    uint32_t secondary; /* used only for cmd646 */
+    uint32_t flags;
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
-- 
2.21.1


