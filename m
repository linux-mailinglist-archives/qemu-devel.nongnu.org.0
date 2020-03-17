Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6811888FA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:18:54 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEDzZ-0004Ml-KD
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jEDuh-0007Ax-KA
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jEDug-0001Z2-Gk
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:13:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jEDuc-0000sK-Ii; Tue, 17 Mar 2020 11:13:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D2D32747E0A;
 Tue, 17 Mar 2020 16:13:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5C5F6747DF5; Tue, 17 Mar 2020 16:13:42 +0100 (CET)
Message-Id: <1020e0bfcfc6e364f967ccb2a9a3778ac174ccbe.1584457537.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584457537.git.balaton@eik.bme.hu>
References: <cover.1584457537.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 2/8] hw/isa/piix4.c: Introduce variable to store devfn
Date: Tue, 17 Mar 2020 16:05:37 +0100
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

To avoid any problem with reassigning pci variable store devfn in a
variable instead of acessing it from the PCIDevice.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/piix4.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7edec5e149..2cbdcd7700 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -247,9 +247,10 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **=
isa_bus,
     DriveInfo **hd;
     PCIDevice *pci;
     DeviceState *dev;
+    int devfn =3D PCI_DEVFN(10, 0);
=20
-    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
-                                          true, TYPE_PIIX4_PCI_DEVICE);
+    pci =3D pci_create_simple_multifunction(pci_bus, devfn,  true,
+                                          TYPE_PIIX4_PCI_DEVICE);
     dev =3D DEVICE(pci);
     if (isa_bus) {
         *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
@@ -257,11 +258,12 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus *=
*isa_bus,
=20
     hd =3D g_new(DriveInfo *, ide_drives);
     ide_drive_get(hd, ide_drives);
-    pci_piix4_ide_init(pci_bus, hd, pci->devfn + 1);
+    pci_piix4_ide_init(pci_bus, hd, devfn + 1);
     g_free(hd);
-    pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
+
+    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        *smbus =3D piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100,
+        *smbus =3D piix4_pm_init(pci_bus, devfn + 3, 0x1100,
                                isa_get_irq(NULL, 9), NULL, 0, NULL);
    }
=20
--=20
2.21.1


