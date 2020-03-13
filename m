Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64398185111
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 22:25:22 +0100 (CET)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCro1-0002eI-DL
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 17:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrly-0007lx-Mr
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlw-0000Kq-0Q
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57645)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jCrlr-0008UM-Ec; Fri, 13 Mar 2020 17:23:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 019D7747E13;
 Fri, 13 Mar 2020 22:23:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 71609747E04; Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Message-Id: <3240656814c804513de08bdbbf318f2f590df241.1584134074.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584134074.git.balaton@eik.bme.hu>
References: <cover.1584134074.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/8] hw/ide: Get rid of piix4_init function
Date: Fri, 13 Mar 2020 22:14:34 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes pci_piix4_ide_init() function similar to clean up done to
other ide devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/piix.c    | 12 +-----------
 hw/isa/piix4.c   |  5 ++++-
 include/hw/ide.h |  1 -
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 8bcd6b72c2..3b2de4c312 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -208,17 +208,6 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
-/* hd_table must contain 4 block drivers */
-/* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
-PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn)
-{
-    PCIDevice *dev;
-
-    dev = pci_create_simple(bus, devfn, "piix4-ide");
-    pci_ide_create_devs(dev, hd_table);
-    return dev;
-}
-
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -247,6 +236,7 @@ static const TypeInfo piix3_ide_xen_info = {
     .class_init    = piix3_ide_class_init,
 };
 
+/* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
 static void piix4_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7edec5e149..0ab4787658 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -35,6 +35,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide.h"
+#include "hw/ide/pci.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -255,10 +256,12 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
 
+    pci = pci_create_simple(pci_bus, pci->devfn + 1, "piix4-ide");
     hd = g_new(DriveInfo *, ide_drives);
     ide_drive_get(hd, ide_drives);
-    pci_piix4_ide_init(pci_bus, hd, pci->devfn + 1);
+    pci_ide_create_devs(pci, hd);
     g_free(hd);
+
     pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100,
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 883bbaeb9b..21bd8f23f1 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -12,7 +12,6 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
 /* ide-pci.c */
-PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn);
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
 
 /* ide-mmio.c */
-- 
2.21.1


