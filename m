Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB2D7C34
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:43:52 +0200 (CEST)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKPvL-00027S-03
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPis-0003fl-4K
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPiq-0006Am-LF
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:30:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKPiq-0006AM-D6
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:30:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84B7D3082B41;
 Tue, 15 Oct 2019 16:30:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F7219C58;
 Tue, 15 Oct 2019 16:30:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/32] hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c
Date: Tue, 15 Oct 2019 18:26:52 +0200
Message-Id: <20191015162705.28087-20-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 15 Oct 2019 16:30:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Now that we properly refactored the piix4_create() function, let's
move it to hw/isa/piix4.c where it belongs, so it can be reused
on other places.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/piix4.c                | 30 ++++++++++++++++++++++++++++++
 hw/mips/gt64xxx_pci.c         |  1 +
 hw/mips/mips_malta.c          | 28 ----------------------------
 include/hw/i386/pc.h          |  2 --
 include/hw/southbridge/piix.h |  6 ++++++
 5 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9f554747af..d90899e122 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -27,12 +27,14 @@
 #include "qapi/error.h"
 #include "hw/irq.h"
 #include "hw/i386/pc.h"
+#include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
 #include "hw/timer/mc146818rtc.h"
+#include "hw/ide.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -234,3 +236,31 @@ static void piix4_register_types(void)
 }
=20
 type_init(piix4_register_types)
+
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
+                          I2CBus **smbus, size_t ide_buses)
+{
+    size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;
+    DriveInfo **hd;
+    PCIDevice *pci;
+    DeviceState *dev;
+
+    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
+                                          true, TYPE_PIIX4_PCI_DEVICE);
+    dev =3D DEVICE(pci);
+    if (isa_bus) {
+        *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    }
+
+    hd =3D g_new(DriveInfo *, ide_drives);
+    ide_drive_get(hd, ide_drives);
+    pci_piix4_ide_init(pci_bus, hd, pci->devfn + 1);
+    g_free(hd);
+    pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
+    if (smbus) {
+        *smbus =3D piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100,
+                               isa_get_irq(NULL, 9), NULL, 0, NULL);
+   }
+
+    return dev;
+}
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index f325bd6c1c..c277398c0d 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -28,6 +28,7 @@
 #include "hw/mips/mips.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/southbridge/piix.h"
 #include "migration/vmstate.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 0d4312840b..477a4725c0 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1210,34 +1210,6 @@ static void mips_create_cpu(MachineState *ms, Malt=
aState *s,
     }
 }
=20
-static DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
-                                 I2CBus **smbus, size_t ide_buses)
-{
-    const size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;
-    DriveInfo **hd;
-    PCIDevice *pci;
-    DeviceState *dev;
-
-    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
-                                          true, TYPE_PIIX4_PCI_DEVICE);
-    dev =3D DEVICE(pci);
-    if (isa_bus) {
-        *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    }
-
-    hd =3D g_new(DriveInfo *, ide_drives);
-    ide_drive_get(hd, ide_drives);
-    pci_piix4_ide_init(pci_bus, hd, pci->devfn + 1);
-    g_free(hd);
-    pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
-    if (smbus) {
-        *smbus =3D piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100,
-                               isa_get_irq(NULL, 9), NULL, 0, NULL);
-   }
-
-    return dev;
-}
-
 static
 void mips_malta_init(MachineState *machine)
 {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c671c9fd2a..b63fc7631e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -274,8 +274,6 @@ PCIBus *i440fx_init(const char *host_type, const char=
 *pci_type,
                     MemoryRegion *ram_memory);
=20
 PCIBus *find_i440fx(void);
-/* piix4.c */
-extern PCIDevice *piix4_dev;
=20
 /* pc_sysfw.c */
 void pc_system_flash_create(PCMachineState *pcms);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
index b8ce26fec4..add352456b 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -2,6 +2,7 @@
  * QEMU PIIX South Bridge Emulation
  *
  * Copyright (c) 2006 Fabrice Bellard
+ * Copyright (c) 2018 Herv=C3=A9 Poussineau
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
  * See the COPYING file in the top-level directory.
@@ -17,4 +18,9 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t =
smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
                       int smm_enabled, DeviceState **piix4_pm);
=20
+extern PCIDevice *piix4_dev;
+
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
+                          I2CBus **smbus, size_t ide_buses);
+
 #endif
--=20
2.21.0


