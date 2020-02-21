Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEAB166FB3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 07:38:08 +0100 (CET)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j51wt-0002oM-U2
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 01:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1j51ua-0007xn-C4
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 01:35:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1j51uY-0003P0-On
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 01:35:44 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:57172 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1j51uY-0002xM-47
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 01:35:42 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A4A98B5A7F26DB493CC5;
 Fri, 21 Feb 2020 14:35:30 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Fri, 21 Feb 2020 14:35:23 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>
Subject: [RFC v3 2/3] acpi:pci-expender-bus: Add pxb support for arm
Date: Fri, 21 Feb 2020 14:35:11 +0800
Message-ID: <20200221063512.1104-3-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
In-Reply-To: <20200221063512.1104-1-miaoyubo@huawei.com>
References: <20200221063512.1104-1-miaoyubo@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: imammedo@redhat.com, miaoyubo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: miaoyubo <miaoyubo@huawei.com>

Currently virt machine is not supported by pxb-pcie,
and only one main host bridge described in ACPI tables.
In this patch,PXB-PCIE is supproted by arm and certain
resource is allocated for each pxb-pcie in acpi table.
The resource for the main host bridge is also reallocated.

Signed-off-by: miaoyubo <miaoyubo@huawei.com>
---
 hw/arm/virt-acpi-build.c | 125 +++++++++++++++++++++++++++++++++++----
 hw/pci-host/gpex.c       |   4 ++
 include/hw/arm/virt.h    |   7 +++
 3 files changed, 125 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0540234b8a..2c1e0d2aaa 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -49,6 +49,8 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
=20
+#include "hw/arm/virt.h"
+#include "hw/pci/pci_bus.h"
 #define ARM_SPI_BASE 32
=20
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
@@ -271,19 +273,117 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, Aml *s=
cope)
 }
=20
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
-                              uint32_t irq, bool use_highmem, bool highm=
em_ecam)
+                              uint32_t irq, bool use_highmem, bool highm=
em_ecam,
+                              VirtMachineState *vms)
 {
     int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
-    Aml *method, *crs;
+    Aml *method, *dev, *crs;
+    int count =3D 0;
     hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
     hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
     hwaddr size_pio =3D memmap[VIRT_PCIE_PIO].size;
     hwaddr base_ecam =3D memmap[ecam_id].base;
     hwaddr size_ecam =3D memmap[ecam_id].size;
+    /*
+     * 0x600000 would be enough for pxb device
+     * if it is too small, there is no enough space
+     * for a pcie device plugged in a pcie-root port
+     */
+    hwaddr size_addr =3D 0x600000;
+    hwaddr size_io =3D 0x4000;
     int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;
+    int root_bus_limit =3D 0xFF;
+    PCIBus *bus =3D NULL;
+    bus =3D VIRT_MACHINE(vms)->bus;
+
+    if (bus) {
+        QLIST_FOREACH(bus, &bus->child, sibling) {
+            uint8_t bus_num =3D pci_bus_num(bus);
+            uint8_t numa_node =3D pci_bus_numa_node(bus);
+
+            if (!pci_bus_is_root(bus)) {
+                continue;
+            }
+            if (bus_num < root_bus_limit) {
+                root_bus_limit =3D bus_num - 1;
+            }
+            count++;
+            dev =3D aml_device("PC%.02X", bus_num);
+            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08"))=
);
+            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03"))=
);
+            aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+            aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
+            aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
+            aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
+            aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Devic=
e")));
+            if (numa_node !=3D NUMA_NODE_UNASSIGNED) {
+                method =3D aml_method("_PXM", 0, AML_NOTSERIALIZED);
+                aml_append(method, aml_return(aml_int(numa_node)));
+                aml_append(dev, method);
+            }
+
+            acpi_dsdt_add_pci_route_table(dev, scope, nr_pcie_buses, irq=
);
+
+            method =3D aml_method("_CBA", 0, AML_NOTSERIALIZED);
+            aml_append(method, aml_return(aml_int(base_ecam)));
+            aml_append(dev, method);
+
+            method =3D aml_method("_CRS", 0, AML_NOTSERIALIZED);
+            Aml *rbuf =3D aml_resource_template();
+            aml_append(rbuf,
+                       aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED,
+                                           AML_POS_DECODE, 0x0000,
+                                           bus_num, bus_num + 1, 0x0000,
+                                           2));
+            aml_append(rbuf,
+                       aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                        AML_MAX_FIXED, AML_NON_CACHEABLE=
,
+                                        AML_READ_WRITE, 0x0000,
+                                        base_mmio + size_mmio -
+                                        size_addr * count,
+                                        base_mmio + size_mmio - 1 -
+                                        size_addr * (count - 1),
+                                        0x0000, size_addr));
+            aml_append(rbuf,
+                       aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
+                       AML_POS_DECODE, AML_ENTIRE_RANGE,
+                       0x0000, size_pio - size_io * count,
+                       size_pio - 1 - size_io * (count - 1),
+                       base_pio, size_io));
+
+            if (use_highmem) {
+                hwaddr base_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].ba=
se;
+                hwaddr size_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].si=
ze;
+
+                aml_append(rbuf,
+                       aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                        AML_MAX_FIXED, AML_NON_CACHEABLE=
,
+                                        AML_READ_WRITE, 0x0000,
+                                        base_mmio_high + size_mmio_high =
-
+                                        size_addr * count,
+                                        base_mmio_high + size_mmio_high =
-
+                                        1 - size_addr * (count - 1),
+                                        0x0000, size_addr));
+            }
+
+            aml_append(method, aml_name_decl("RBUF", rbuf));
+            aml_append(method, aml_return(rbuf));
+            aml_append(dev, method);
+
+            acpi_dsdt_add_pci_osc(dev, scope);
+
+            Aml *dev_rp0 =3D aml_device("%s", "RP0");
+            aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
+            aml_append(dev, dev_rp0);
+
+            aml_append(scope, dev);
+
+        }
+    }
=20
-    Aml *dev =3D aml_device("%s", "PCI0");
+    dev =3D aml_device("%s", "PCI0");
     aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
     aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
@@ -303,16 +403,18 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
     Aml *rbuf =3D aml_resource_template();
     aml_append(rbuf,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE=
,
-                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
-                            nr_pcie_buses));
+                            0x0000, 0x0000, root_bus_limit, 0x0000,
+                            root_bus_limit + 1));
     aml_append(rbuf,
         aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
                          AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000, base=
_mmio,
-                         base_mmio + size_mmio - 1, 0x0000, size_mmio));
+                         base_mmio + size_mmio - 1 - size_addr * count,
+                         0x0000, size_mmio - size_addr * count));
     aml_append(rbuf,
         aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                     AML_ENTIRE_RANGE, 0x0000, 0x0000, size_pio - 1, bas=
e_pio,
-                     size_pio));
+                     AML_ENTIRE_RANGE, 0x0000, 0x0000,
+                     size_pio - 1 - size_io * count, base_pio,
+                     size_pio - size_io * count));
=20
     if (use_highmem) {
         hwaddr base_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].base;
@@ -322,8 +424,9 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
             aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXE=
D,
                              AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
                              base_mmio_high,
-                             base_mmio_high + size_mmio_high - 1, 0x0000=
,
-                             size_mmio_high));
+                             base_mmio_high + size_mmio_high - 1 -
+                             size_addr * count,
+                             0x0000, size_mmio_high - size_addr * count)=
);
     }
=20
     aml_append(method, aml_name_decl("RBUF", rbuf));
@@ -759,7 +862,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANS=
PORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
-                      vms->highmem, vms->highmem_ecam);
+                      vms->highmem, vms->highmem_ecam, vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 0ca604dc62..2c18cdfec4 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -36,6 +36,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "hw/arm/virt.h"
=20
 /***********************************************************************=
*****
  * GPEX host
@@ -98,6 +99,9 @@ static void gpex_host_realize(DeviceState *dev, Error *=
*errp)
                                      pci_swizzle_map_irq_fn, s, &s->io_m=
mio,
                                      &s->io_ioport, 0, 4, TYPE_PCIE_BUS)=
;
=20
+#ifdef __aarch64__
+    VIRT_MACHINE(qdev_get_machine())->bus =3D pci->bus;
+#endif
     qdev_set_parent_bus(DEVICE(&s->gpex_root), BUS(pci->bus));
     pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
     qdev_init_nofail(DEVICE(&s->gpex_root));
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 71508bf40c..9accaf2b1b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -140,6 +140,13 @@ typedef struct {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    /*
+     * pointer to devices and objects
+     * Via going through the bus, all
+     * pci devices and related objectes
+     * could be gained.
+     * */
+    PCIBus *bus;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.19.1



