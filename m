Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33611A227C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 15:02:46 +0200 (CEST)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMALt-0005BW-Pl
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1jMAI7-0008VZ-HQ
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1jMAI5-000581-FF
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:58:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:36628 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1jMAI4-00056S-R1
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:58:49 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F2A2BC2A177341006499;
 Wed,  8 Apr 2020 20:58:44 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 20:58:34 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <lersek@redhat.com>
Subject: [PATCH v6 4/8] acpi: Refactor the source of host bridge and build
 tables for pxb
Date: Wed, 8 Apr 2020 20:58:12 +0800
Message-ID: <20200408125816.955-5-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
In-Reply-To: <20200408125816.955-1-miaoyubo@huawei.com>
References: <20200408125816.955-1-miaoyubo@huawei.com>
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
Cc: berrange@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, miaoyubo@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: miaoyubo <miaoyubo@huawei.com>

The resources of pxbs and obtained by crs_build and the resources
used by pxbs would be moved form the resources defined for host-bridge.

The resources for pxb are composed of the bar space of the
pci-bridge/pcie-root-port behined it and the config space of devices
behind it.

Signed-off-by: miaoyubo <miaoyubo@huawei.com>
---
 hw/arm/virt-acpi-build.c | 131 +++++++++++++++++++++++++++++++++------
 1 file changed, 111 insertions(+), 20 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e8ba09855c..7bcd04dfb7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -49,6 +49,9 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
=20
+#include "hw/arm/virt.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_bridge.h"
 #define ARM_SPI_BASE 32
=20
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
@@ -266,19 +269,81 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, Aml *sc=
ope)
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
+    int i;
+    Aml *method, *crs, *dev;
     hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
     hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
     hwaddr size_pio =3D memmap[VIRT_PCIE_PIO].size;
     hwaddr base_ecam =3D memmap[ecam_id].base;
     hwaddr size_ecam =3D memmap[ecam_id].size;
+    CrsRangeEntry *entry;
+    CrsRangeSet crs_range_set;
+
+    crs_range_set_init(&crs_range_set);
     int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;
+    PCIHostState *s =3D OBJECT_CHECK(PCIHostState,
+                                   object_resolve_path_type("",
+                                   "pcie-host-bridge", NULL),
+                                   TYPE_PCI_HOST_BRIDGE);
+
+    PCIBus *bus =3D s->bus;
+    /* start to construct the tables for pxb*/
+    if (bus) {
+        QLIST_FOREACH(bus, &bus->child, sibling) {
+            uint8_t bus_num =3D pci_bus_num(bus);
+            uint8_t numa_node =3D pci_bus_numa_node(bus);
+
+            if (!pci_bus_is_root(bus)) {
+                continue;
+            }
+            /*
+             * Coded up the MIN of the busNr defined for pxb-pcie,
+             * the MIN - 1 would be the MAX bus number for the main
+             * host bridge.
+             */
+            if (bus_num < nr_pcie_buses) {
+                nr_pcie_buses =3D bus_num;
+            }
+
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
+            acpi_dsdt_add_pci_route_table(dev, scope, irq);
+
+            /*
+             * Resources deined for PXBs are composed by the folling par=
ts:
+             * 1. The resources the pci-brige/pcie-root-port need.
+             * 2. The resources the devices behind pxb need.
+             */
+            crs =3D build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_ra=
nge_set);
+            aml_append(dev, aml_name_decl("_CRS", crs));
+
+            acpi_dsdt_add_pci_osc(dev, scope);
+
+            aml_append(scope, dev);
+
+        }
+    }
=20
-    Aml *dev =3D aml_device("%s", "PCI0");
+    /* start to construct the tables for main host bridge */
+    dev =3D aml_device("%s", "PCI0");
     aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
     aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
@@ -299,25 +364,51 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE=
,
                             0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
                             nr_pcie_buses));
-    aml_append(rbuf,
-        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                         AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000, base=
_mmio,
-                         base_mmio + size_mmio - 1, 0x0000, size_mmio));
-    aml_append(rbuf,
-        aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                     AML_ENTIRE_RANGE, 0x0000, 0x0000, size_pio - 1, bas=
e_pio,
-                     size_pio));
+
+    /*
+     * Remove the resources used by PXBs.
+     */
+    crs_replace_with_free_ranges(crs_range_set.mem_ranges,
+                                 base_mmio,
+                                 base_mmio + size_mmio - 1);
+    for (i =3D 0; i < crs_range_set.mem_ranges->len; i++) {
+        entry =3D g_ptr_array_index(crs_range_set.mem_ranges, i);
+        aml_append(rbuf,
+            aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXE=
D,
+                             AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                             entry->base, entry->limit,
+                             0x0000, entry->limit - entry->base + 1));
+    }
+
+    crs_replace_with_free_ranges(crs_range_set.io_ranges,
+                                 0x0000,
+                                 size_pio - 1);
+    for (i =3D 0; i < crs_range_set.io_ranges->len; i++) {
+        entry =3D g_ptr_array_index(crs_range_set.io_ranges, i);
+        aml_append(rbuf,
+            aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                         AML_ENTIRE_RANGE, 0x0000, entry->base,
+                         entry->limit, base_pio,
+                         entry->limit - entry->base + 1));
+    }
+
=20
     if (use_highmem) {
         hwaddr base_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].base;
         hwaddr size_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].size;
=20
-        aml_append(rbuf,
-            aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXE=
D,
-                             AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                             base_mmio_high,
-                             base_mmio_high + size_mmio_high - 1, 0x0000=
,
-                             size_mmio_high));
+        crs_replace_with_free_ranges(crs_range_set.mem_64bit_ranges,
+                                     base_mmio_high,
+                                     base_mmio_high + size_mmio_high - 1=
);
+        for (i =3D 0; i < crs_range_set.mem_64bit_ranges->len; i++) {
+            entry =3D g_ptr_array_index(crs_range_set.mem_64bit_ranges, =
i);
+            aml_append(rbuf,
+                aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_=
FIXED,
+                                 AML_NON_CACHEABLE, AML_READ_WRITE, 0x00=
00,
+                                 entry->base,
+                                 entry->limit, 0x0000,
+                                 entry->limit - entry->base + 1));
+        }
     }
=20
     aml_append(method, aml_return(rbuf));
@@ -335,6 +426,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
     aml_append(dev_res0, aml_name_decl("_CRS", crs));
     aml_append(dev, dev_res0);
     aml_append(scope, dev);
+
+    crs_range_set_free(&crs_range_set);
 }
=20
 static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memma=
p,
@@ -746,7 +839,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
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
@@ -798,7 +891,6 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuild=
Tables *tables)
     unsigned dsdt, xsdt;
     GArray *tables_blob =3D tables->table_data;
     MachineState *ms =3D MACHINE(vms);
-
     table_offsets =3D g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
=20
@@ -952,7 +1044,6 @@ void virt_acpi_setup(VirtMachineState *vms)
     build_state->rsdp_mr =3D acpi_add_rom_blob(virt_acpi_build_update,
                                              build_state, tables.rsdp,
                                              ACPI_BUILD_RSDP_FILE, 0);
-
     qemu_register_reset(virt_acpi_build_reset, build_state);
     virt_acpi_build_reset(build_state);
     vmstate_register(NULL, 0, &vmstate_virt_acpi_build, build_state);
--=20
2.19.1



