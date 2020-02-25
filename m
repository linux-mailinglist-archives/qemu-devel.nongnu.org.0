Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1F16B76B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 02:53:35 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6PPi-0001yB-DV
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 20:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1j6PO4-0000SW-Kk
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:51:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1j6PNz-0002ft-5t
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:51:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2729 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1j6PNx-0002dU-BX
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:51:46 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 43FEFD928091389C0C37;
 Tue, 25 Feb 2020 09:50:52 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Feb 2020 09:50:44 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>
Subject: [PATCH v4 1/3] acpi:Extract two APIs from acpi_dsdt_add_pci
Date: Tue, 25 Feb 2020 09:50:24 +0800
Message-ID: <20200225015026.940-2-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
In-Reply-To: <20200225015026.940-1-miaoyubo@huawei.com>
References: <20200225015026.940-1-miaoyubo@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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

Extract two APIs acpi_dsdt_add_pci_route_table and
acpi_dsdt_add_pci_osc form acpi_dsdt_add_pci. The first
API is used to specify the pci route table and the second
API is used to declare the operation system capabilities.
These two APIs would be used to specify the pxb-pcie in DSDT.

Signed-off-by: miaoyubo <miaoyubo@huawei.com>
---
 hw/arm/virt-acpi-build.c | 129 ++++++++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 57 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fb4b166f82..37c34748a6 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -146,29 +146,11 @@ static void acpi_dsdt_add_virtio(Aml *scope,
     }
 }
=20
-static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
-                              uint32_t irq, bool use_highmem, bool highm=
em_ecam)
+static void acpi_dsdt_add_pci_route_table(Aml *dev, Aml *scope,
+                                          uint32_t irq)
 {
-    int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
-    Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
     int i, slot_no;
-    hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
-    hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
-    hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
-    hwaddr size_pio =3D memmap[VIRT_PCIE_PIO].size;
-    hwaddr base_ecam =3D memmap[ecam_id].base;
-    hwaddr size_ecam =3D memmap[ecam_id].size;
-    int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;
-
-    Aml *dev =3D aml_device("%s", "PCI0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
-    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
-    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
-    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")))=
;
-    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
+    Aml *method, *crs;
     /* Declare the PCI Routing Table. */
     Aml *rt_pkg =3D aml_varpackage(PCI_SLOT_MAX * PCI_NUM_PINS);
     for (slot_no =3D 0; slot_no < PCI_SLOT_MAX; slot_no++) {
@@ -204,41 +186,11 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
         aml_append(dev_gsi, method);
         aml_append(dev, dev_gsi);
     }
+}
=20
-    method =3D aml_method("_CBA", 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_return(aml_int(base_ecam)));
-    aml_append(dev, method);
-
-    method =3D aml_method("_CRS", 0, AML_NOTSERIALIZED);
-    Aml *rbuf =3D aml_resource_template();
-    aml_append(rbuf,
-        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE=
,
-                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
-                            nr_pcie_buses));
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
-
-    if (use_highmem) {
-        hwaddr base_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].base;
-        hwaddr size_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].size;
-
-        aml_append(rbuf,
-            aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXE=
D,
-                             AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                             base_mmio_high,
-                             base_mmio_high + size_mmio_high - 1, 0x0000=
,
-                             size_mmio_high));
-    }
-
-    aml_append(method, aml_return(rbuf));
-    aml_append(dev, method);
-
+static void acpi_dsdt_add_pci_osc(Aml *dev, Aml *scope)
+{
+    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
     aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
@@ -246,7 +198,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
     aml_append(method,
         aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
=20
-    /* PCI Firmware Specification 3.0
+    /*
+     * PCI Firmware Specification 3.0
      * 4.5.1. _OSC Interface for PCI Host Bridge Devices
      * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
      * identified by the Universal Unique IDentifier (UUID)
@@ -291,7 +244,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
=20
     method =3D aml_method("_DSM", 4, AML_NOTSERIALIZED);
=20
-    /* PCI Firmware Specification 3.0
+    /*
+     * PCI Firmware Specification 3.0
      * 4.6.1. _DSM for PCI Express Slot Information
      * The UUID in _DSM in this context is
      * {E5C937D0-3553-4D7A-9117-EA4D19C3434D}
@@ -309,6 +263,67 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemM=
apEntry *memmap,
     buf =3D aml_buffer(1, byte_list);
     aml_append(method, aml_return(buf));
     aml_append(dev, method);
+}
+
+static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
+                              uint32_t irq, bool use_highmem, bool highm=
em_ecam)
+{
+    int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
+    Aml *method, *crs;
+    hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
+    hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
+    hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
+    hwaddr size_pio =3D memmap[VIRT_PCIE_PIO].size;
+    hwaddr base_ecam =3D memmap[ecam_id].base;
+    hwaddr size_ecam =3D memmap[ecam_id].size;
+    int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;
+
+    Aml *dev =3D aml_device("%s", "PCI0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
+    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
+    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")))=
;
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    acpi_dsdt_add_pci_route_table(dev, scope, irq);
+
+    method =3D aml_method("_CBA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(base_ecam)));
+    aml_append(dev, method);
+
+    method =3D aml_method("_CRS", 0, AML_NOTSERIALIZED);
+    Aml *rbuf =3D aml_resource_template();
+    aml_append(rbuf,
+        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE=
,
+                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
+                            nr_pcie_buses));
+    aml_append(rbuf,
+        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                         AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000, base=
_mmio,
+                         base_mmio + size_mmio - 1, 0x0000, size_mmio));
+    aml_append(rbuf,
+        aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                     AML_ENTIRE_RANGE, 0x0000, 0x0000, size_pio - 1, bas=
e_pio,
+                     size_pio));
+
+    if (use_highmem) {
+        hwaddr base_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].base;
+        hwaddr size_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].size;
+
+        aml_append(rbuf,
+            aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXE=
D,
+                             AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                             base_mmio_high,
+                             base_mmio_high + size_mmio_high - 1, 0x0000=
,
+                             size_mmio_high));
+    }
+
+    aml_append(method, aml_return(rbuf));
+    aml_append(dev, method);
+
+    acpi_dsdt_add_pci_osc(dev, scope);
=20
     Aml *dev_res0 =3D aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
--=20
2.19.1



