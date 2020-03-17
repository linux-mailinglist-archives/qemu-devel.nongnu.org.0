Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A168D187DAF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:03:07 +0100 (CET)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE93y-0006Nw-LJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jE8yy-0008N0-P9
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jE8yw-0006gO-Rh
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:57:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31380)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jE8ys-0006HI-8s; Tue, 17 Mar 2020 05:57:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D5FCA747E0B;
 Tue, 17 Mar 2020 10:57:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3FE8C747E13; Tue, 17 Mar 2020 10:57:44 +0100 (CET)
Message-Id: <a7bc82f10900d147f264d6f6967fa03f71826e1f.1584437958.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584437957.git.balaton@eik.bme.hu>
References: <cover.1584437957.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 5/7] hw/ide: Do ide_drive_get() within pci_ide_create_devs()
Date: Tue, 17 Mar 2020 10:39:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
Content-Transfer-Encoding: quoted-printable
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pci_ide_create_devs() function takes a hd_table parameter but all
callers just pass what ide_drive_get() returns so we can do it locally
simplifying callers and removing hd_table parameter.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/alpha/dp264.c              | 13 +++----------
 hw/i386/pc_piix.c             |  9 +++++----
 hw/ide/pci.c                  |  4 +++-
 hw/isa/piix4.c                | 10 ++--------
 hw/mips/mips_fulong2e.c       |  4 +---
 hw/mips/mips_malta.c          |  2 +-
 hw/sparc64/sun4u.c            |  6 +-----
 include/hw/ide/pci.h          |  2 +-
 include/hw/southbridge/piix.h |  3 +--
 9 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 27595767e5..f7751b18f6 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -15,7 +15,6 @@
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/timer/i8254.h"
 #include "hw/isa/superio.h"
@@ -58,6 +57,7 @@ static void clipper_init(MachineState *machine)
     const char *initrd_filename =3D machine->initrd_filename;
     AlphaCPU *cpus[4];
     PCIBus *pci_bus;
+    PCIDevice *pci_dev;
     ISABus *isa_bus;
     qemu_irq rtc_irq;
     long size, i;
@@ -100,15 +100,8 @@ static void clipper_init(MachineState *machine)
     isa_create_simple(isa_bus, TYPE_SMC37C669_SUPERIO);
=20
     /* IDE disk setup.  */
-    {
-        DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
-        PCIDevice *pci_dev;
-
-        ide_drive_get(hd, ARRAY_SIZE(hd));
-
-        pci_dev =3D pci_create_simple(pci_bus, -1, "cmd646-ide");
-        pci_ide_create_devs(pci_dev, hd);
-    }
+    pci_dev =3D pci_create_simple(pci_bus, -1, "cmd646-ide");
+    pci_ide_create_devs(pci_dev);
=20
     /* Load PALcode.  Given that this is not "real" cpu palcode,
        but one explicitly written for the emulation, we might as
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c399398739..9216596ec6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -86,7 +86,6 @@ static void pc_init1(MachineState *machine,
     int piix3_devfn =3D -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
-    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     BusState *idebus[MAX_IDE_BUS];
     ISADevice *rtc_state;
     MemoryRegion *ram_memory;
@@ -240,20 +239,22 @@ static void pc_init1(MachineState *machine,
=20
     pc_nic_init(pcmc, isa_bus, pci_bus);
=20
-    ide_drive_get(hd, ARRAY_SIZE(hd));
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
=20
         dev =3D pci_create_simple(pci_bus, piix3_devfn + 1,
                                 xen_enabled() ? "piix3-ide-xen" : "piix3=
-ide");
-        pci_ide_create_devs(dev, hd);
+        pci_ide_create_devs(dev);
         idebus[0] =3D qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] =3D qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #ifdef CONFIG_IDE_ISA
-else {
+    else {
+        DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
         int i;
+
+        ide_drive_get(hd, ARRAY_SIZE(hd));
         for (i =3D 0; i < MAX_IDE_BUS; i++) {
             ISADevice *dev;
             char busname[] =3D "ide.0";
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index e0c84392e2..97347f07f1 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -477,13 +477,15 @@ const VMStateDescription vmstate_ide_pci =3D {
 };
=20
 /* hd_table must contain 4 block drivers */
-void pci_ide_create_devs(PCIDevice *dev, DriveInfo **hd_table)
+void pci_ide_create_devs(PCIDevice *dev)
 {
     PCIIDEState *d =3D PCI_IDE(dev);
+    DriveInfo *hd_table[2 * MAX_IDE_DEVS];
     static const int bus[4]  =3D { 0, 0, 1, 1 };
     static const int unit[4] =3D { 0, 1, 0, 1 };
     int i;
=20
+    ide_drive_get(hd_table, ARRAY_SIZE(hd_table));
     for (i =3D 0; i < 4; i++) {
         if (hd_table[i]) {
             ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0ab4787658..13fa1660c3 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -241,11 +241,8 @@ static void piix4_register_types(void)
=20
 type_init(piix4_register_types)
=20
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
-                          I2CBus **smbus, size_t ide_buses)
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **sm=
bus)
 {
-    size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;
-    DriveInfo **hd;
     PCIDevice *pci;
     DeviceState *dev;
=20
@@ -257,10 +254,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **=
isa_bus,
     }
=20
     pci =3D pci_create_simple(pci_bus, pci->devfn + 1, "piix4-ide");
-    hd =3D g_new(DriveInfo *, ide_drives);
-    ide_drive_get(hd, ide_drives);
-    pci_ide_create_devs(pci, hd);
-    g_free(hd);
+    pci_ide_create_devs(pci);
=20
     pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
     if (smbus) {
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 639ba2a091..0f312b5a35 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -239,7 +239,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bu=
s, int slot, qemu_irq intc,
 {
     qemu_irq *i8259;
     ISABus *isa_bus;
-    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     PCIDevice *dev;
=20
     isa_bus =3D vt82c686b_isa_init(pci_bus, PCI_DEVFN(slot, 0));
@@ -259,8 +258,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bu=
s, int slot, qemu_irq intc,
     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
=20
     dev =3D pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
-    ide_drive_get(hd, ARRAY_SIZE(hd));
-    pci_ide_create_devs(dev, hd);
+    pci_ide_create_devs(dev);
=20
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci")=
;
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci")=
;
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index d380f73d7b..e4c4de1b4e 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1403,7 +1403,7 @@ void mips_malta_init(MachineState *machine)
     pci_bus =3D gt64120_register(s->i8259);
=20
     /* Southbridge */
-    dev =3D piix4_create(pci_bus, &isa_bus, &smbus, MAX_IDE_BUS);
+    dev =3D piix4_create(pci_bus, &isa_bus, &smbus);
=20
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index d33e84f831..6abfcb30f8 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -50,7 +50,6 @@
 #include "hw/sparc/sparc64.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/sysbus.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/loader.h"
 #include "hw/fw-path-provider.h"
@@ -563,7 +562,6 @@ static void sun4uv_init(MemoryRegion *address_space_m=
em,
     PCIBus *pci_bus, *pci_busA, *pci_busB;
     PCIDevice *ebus, *pci_dev;
     SysBusDevice *s;
-    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     DeviceState *iommu, *dev;
     FWCfgState *fw_cfg;
     NICInfo *nd;
@@ -663,12 +661,10 @@ static void sun4uv_init(MemoryRegion *address_space=
_mem,
         qemu_macaddr_default_if_unset(&macaddr);
     }
=20
-    ide_drive_get(hd, ARRAY_SIZE(hd));
-
     pci_dev =3D pci_create(pci_busA, PCI_DEVFN(3, 0), "cmd646-ide");
     qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
     qdev_init_nofail(&pci_dev->qdev);
-    pci_ide_create_devs(pci_dev, hd);
+    pci_ide_create_devs(pci_dev);
=20
     /* Map NVRAM into I/O (ebus) space */
     nvram =3D m48t59_init(NULL, 0, 0, NVRAM_SIZE, 1968, 59);
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 98ffa7dfcd..dd504e5a0b 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -63,7 +63,7 @@ static inline IDEState *bmdma_active_if(BMDMAState *bmd=
ma)
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
-void pci_ide_create_devs(PCIDevice *dev, DriveInfo **hd_table);
+void pci_ide_create_devs(PCIDevice *dev);
=20
 extern const VMStateDescription vmstate_ide_pci;
 extern const MemoryRegionOps pci_ide_cmd_le_ops;
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
index 152628c6d9..02bd741209 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -68,7 +68,6 @@ extern PCIDevice *piix4_dev;
=20
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
=20
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
-                          I2CBus **smbus, size_t ide_buses);
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **sm=
bus);
=20
 #endif
--=20
2.21.1


