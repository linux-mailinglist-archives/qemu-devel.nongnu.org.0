Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79481189233
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 00:35:31 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jELkA-0000Q9-FA
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 19:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jELa2-0001WW-FQ
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 19:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jELZz-0007WJ-V7
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 19:25:02 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:39773)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jELZz-0007TB-Q1
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 19:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584487499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QY5+hc49S9hLmpXXwo6c6oOn06ahgVT49z1PA5oCsM=;
 b=XCvEn/94UGQwsOAP6qcEPcHier99gP4dgSI7dX+7dVMRdaVffUeRLEDXYSALShzh+WA+T/
 SErbed5q1lEDOtW6+wfeYoCieIMB/PQV1POQY+6AbSQRLpdWclbO4wh7MJw/+DvHUDIcuY
 KMl3DUrsweDEqGcPkgyz5YADSm8Nw6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-XG4GTmhHP7aH6dRIHgE1Lw-1; Tue, 17 Mar 2020 19:24:55 -0400
X-MC-Unique: XG4GTmhHP7aH6dRIHgE1Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CAC618A6EC1;
 Tue, 17 Mar 2020 23:24:53 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B67160BE0;
 Tue, 17 Mar 2020 23:24:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/20] hw/ide: Get rid of piix3_init functions
Date: Tue, 17 Mar 2020 19:23:22 -0400
Message-Id: <20200317232329.22362-14-jsnow@redhat.com>
In-Reply-To: <20200317232329.22362-1-jsnow@redhat.com>
References: <20200317232329.22362-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This removes pci_piix3_ide_init() and pci_piix3_xen_ide_init()
functions similar to clean up done to other ide devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: adddfa21552783020d64e1314318cab6d24362c3.1584457537.git.balaton=
@eik.bme.hu
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/hw/ide.h  |  2 --
 hw/i386/pc_piix.c | 10 +++++-----
 hw/ide/pci.c      |  1 +
 hw/ide/piix.c     | 21 +--------------------
 4 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/include/hw/ide.h b/include/hw/ide.h
index dea0ecf5be..883bbaeb9b 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -12,8 +12,6 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int ioba=
se2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
=20
 /* ide-pci.c */
-PCIDevice *pci_piix3_xen_ide_init(PCIBus *bus, DriveInfo **hd_table, int d=
evfn);
-PCIDevice *pci_piix3_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn=
);
 PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn=
);
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
=20
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e2d98243bc..c399398739 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -39,6 +39,7 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide.h"
+#include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
@@ -242,11 +243,10 @@ static void pc_init1(MachineState *machine,
     ide_drive_get(hd, ARRAY_SIZE(hd));
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
-        if (xen_enabled()) {
-            dev =3D pci_piix3_xen_ide_init(pci_bus, hd, piix3_devfn + 1);
-        } else {
-            dev =3D pci_piix3_ide_init(pci_bus, hd, piix3_devfn + 1);
-        }
+
+        dev =3D pci_create_simple(pci_bus, piix3_devfn + 1,
+                                xen_enabled() ? "piix3-ide-xen" : "piix3-i=
de");
+        pci_ide_create_devs(dev, hd);
         idebus[0] =3D qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] =3D qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 1a6a287e76..4fc76c5225 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -476,6 +476,7 @@ const VMStateDescription vmstate_ide_pci =3D {
     }
 };
=20
+/* hd_table must contain 4 block drivers */
 void pci_ide_create_devs(PCIDevice *dev, DriveInfo **hd_table)
 {
     PCIIDEState *d =3D PCI_IDE(dev);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index bc575b4d70..8bcd6b72c2 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -197,15 +197,6 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool au=
x)
     return 0;
 }
=20
-PCIDevice *pci_piix3_xen_ide_init(PCIBus *bus, DriveInfo **hd_table, int d=
evfn)
-{
-    PCIDevice *dev;
-
-    dev =3D pci_create_simple(bus, devfn, "piix3-ide-xen");
-    pci_ide_create_devs(dev, hd_table);
-    return dev;
-}
-
 static void pci_piix_ide_exitfn(PCIDevice *dev)
 {
     PCIIDEState *d =3D PCI_IDE(dev);
@@ -217,17 +208,6 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
=20
-/* hd_table must contain 4 block drivers */
-/* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
-PCIDevice *pci_piix3_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn=
)
-{
-    PCIDevice *dev;
-
-    dev =3D pci_create_simple(bus, devfn, "piix3-ide");
-    pci_ide_create_devs(dev, hd_table);
-    return dev;
-}
-
 /* hd_table must contain 4 block drivers */
 /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
 PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **hd_table, int devfn=
)
@@ -239,6 +219,7 @@ PCIDevice *pci_piix4_ide_init(PCIBus *bus, DriveInfo **=
hd_table, int devfn)
     return dev;
 }
=20
+/* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
--=20
2.21.1


