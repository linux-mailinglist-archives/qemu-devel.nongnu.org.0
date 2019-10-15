Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDED7C1C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:41:06 +0200 (CEST)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKPsf-000625-OV
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPiM-000335-PB
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPiL-0005n1-0r
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:30:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKPiK-0005mb-N2
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:30:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C849B3090FC2;
 Tue, 15 Oct 2019 16:30:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E754519C58;
 Tue, 15 Oct 2019 16:30:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/32] piix4: add a mc146818rtc controller as specified in
 datasheet
Date: Tue, 15 Oct 2019 18:26:49 +0200
Message-Id: <20191015162705.28087-17-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 15 Oct 2019 16:30:24 +0000 (UTC)
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

Remove mc146818rtc instanciated in malta board, to not have it twice.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-13-hpoussin@reactos.org>
[PMD: rebased, set RTC base_year to 2000]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  3 ++-
 hw/acpi/piix4.c               |  2 +-
 hw/i386/acpi-build.c          |  3 +--
 hw/i386/pc_piix.c             |  1 +
 hw/isa/piix4.c                | 22 ++++++++++++++++++++++
 hw/mips/mips_malta.c          |  4 +---
 include/hw/acpi/piix4.h       |  6 ------
 include/hw/i386/pc.h          |  6 ------
 include/hw/southbridge/piix.h | 20 ++++++++++++++++++++
 9 files changed, 48 insertions(+), 19 deletions(-)
 delete mode 100644 include/hw/acpi/piix4.h
 create mode 100644 include/hw/southbridge/piix.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c9f625fc2e..556f58bd8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1235,7 +1235,7 @@ F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
 F: hw/acpi/ich9.c
 F: include/hw/acpi/ich9.h
-F: include/hw/acpi/piix4.h
+F: include/hw/southbridge/piix.h
 F: hw/misc/sga.c
 F: hw/isa/apm.c
 F: include/hw/isa/apm.h
@@ -1720,6 +1720,7 @@ M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 S: Maintained
 F: hw/isa/piix4.c
+F: include/hw/southbridge/piix.h
=20
 Firmware configuration (fw_cfg)
 M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 1d29d438c7..27270621ab 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -21,6 +21,7 @@
=20
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
+#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/i2c/pm_smbus.h"
@@ -33,7 +34,6 @@
 #include "qapi/error.h"
 #include "qemu/range.h"
 #include "exec/address-spaces.h"
-#include "hw/acpi/piix4.h"
 #include "hw/acpi/pcihp.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/acpi/cpu.h"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4e0f9f425a..aa6fe61191 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -34,7 +34,6 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu.h"
-#include "hw/acpi/piix4.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
@@ -52,7 +51,7 @@
 #include "sysemu/reset.h"
=20
 /* Supported chipsets: */
-#include "hw/acpi/piix4.h"
+#include "hw/southbridge/piix.h"
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/ich9.h"
 #include "hw/pci/pci_bus.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6824b72124..431965d921 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -29,6 +29,7 @@
 #include "hw/loader.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
+#include "hw/southbridge/piix.h"
 #include "hw/display/ramfb.h"
 #include "hw/firmware/smbios.h"
 #include "hw/pci/pci.h"
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0b0a0ecab1..9f554747af 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -24,6 +24,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/irq.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
@@ -31,6 +32,7 @@
 #include "hw/sysbus.h"
 #include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
+#include "hw/timer/mc146818rtc.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -42,6 +44,7 @@ typedef struct PIIX4State {
     qemu_irq cpu_intr;
     qemu_irq *isa;
=20
+    RTCState rtc;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
@@ -144,6 +147,7 @@ static void piix4_realize(PCIDevice *pci_dev, Error *=
*errp)
     PIIX4State *s =3D DO_UPCAST(PIIX4State, dev, pci_dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
+    Error *err =3D NULL;
=20
     isa_bus =3D isa_bus_new(dev, pci_address_space(pci_dev),
                           pci_address_space_io(pci_dev), errp);
@@ -172,9 +176,26 @@ static void piix4_realize(PCIDevice *pci_dev, Error =
**errp)
     /* DMA */
     i8257_dma_init(isa_bus, 0);
=20
+    /* RTC */
+    qdev_set_parent_bus(DEVICE(&s->rtc), BUS(isa_bus));
+    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
+    object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
+
     piix4_dev =3D pci_dev;
 }
=20
+static void piix4_init(Object *obj)
+{
+    PIIX4State *s =3D PIIX4_PCI_DEVICE(obj);
+
+    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
+}
+
 static void piix4_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -199,6 +220,7 @@ static const TypeInfo piix4_info =3D {
     .name          =3D TYPE_PIIX4_PCI_DEVICE,
     .parent        =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof(PIIX4State),
+    .instance_init =3D piix4_init,
     .class_init    =3D piix4_class_init,
     .interfaces =3D (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 16d7a0e785..528c34a1c3 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -26,7 +26,7 @@
 #include "qemu/units.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "hw/i386/pc.h"
+#include "hw/southbridge/piix.h"
 #include "hw/isa/superio.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
@@ -44,7 +44,6 @@
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "hw/timer/mc146818rtc.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
 #include "qemu/host-utils.h"
@@ -1425,7 +1424,6 @@ void mips_malta_init(MachineState *machine)
     pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
     smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
                           isa_get_irq(NULL, 9), NULL, 0, NULL);
-    mc146818_rtc_init(isa_bus, 2000, NULL);
=20
     /* generate SPD EEPROM data */
     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
deleted file mode 100644
index 028bb53e3d..0000000000
--- a/include/hw/acpi/piix4.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef HW_ACPI_PIIX4_H
-#define HW_ACPI_PIIX4_H
-
-#define TYPE_PIIX4_PM "PIIX4_PM"
-
-#endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a95eab0d8a..c671c9fd2a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -244,12 +244,6 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
=20
 #define PORT92_A20_LINE "a20"
=20
-/* acpi_piix.c */
-
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      int smm_enabled, DeviceState **piix4_pm);
-
 /* hpet.c */
 extern int no_hpet;
=20
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
new file mode 100644
index 0000000000..b8ce26fec4
--- /dev/null
+++ b/include/hw/southbridge/piix.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU PIIX South Bridge Emulation
+ *
+ * Copyright (c) 2006 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_SOUTHBRIDGE_PIIX_H
+#define HW_SOUTHBRIDGE_PIIX_H
+
+#define TYPE_PIIX4_PM "PIIX4_PM"
+
+I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                      qemu_irq sci_irq, qemu_irq smi_irq,
+                      int smm_enabled, DeviceState **piix4_pm);
+
+#endif
--=20
2.21.0


