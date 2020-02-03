Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B005015001E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 01:18:33 +0100 (CET)
Received: from localhost ([::1]:60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyPRg-0000Md-LZ
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 19:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQU-0006qp-5l
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQT-00049X-32
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:18 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2692 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQP-00041C-9N; Sun, 02 Feb 2020 19:17:13 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5E670FE6E6B5D5E7C80C;
 Mon,  3 Feb 2020 08:17:09 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:03 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 4/7] arm/acpi: fix PCI _PRT definition
Date: Mon, 3 Feb 2020 08:15:02 +0800
Message-ID: <20200203001505.52573-5-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200203001505.52573-1-guoheyi@huawei.com>
References: <20200203001505.52573-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The address field in each _PRT mapping package should be constructed
with high word for device# and low word for function#, so it is wrong
to use bus_no as the high word. Enumerate all possible slots
(i.e. PCI_SLOT_MAX) instead.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index be752c0ad8..5d157a9dd5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -151,7 +151,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
 {
     int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
     Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
-    int i, bus_no;
+    int i, slot_no;
     hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
     hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
@@ -170,12 +170,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
=20
     /* Declare the PCI Routing Table. */
-    Aml *rt_pkg =3D aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
-    for (bus_no =3D 0; bus_no < nr_pcie_buses; bus_no++) {
+    Aml *rt_pkg =3D aml_varpackage(PCI_SLOT_MAX * PCI_NUM_PINS);
+    for (slot_no =3D 0; slot_no < PCI_SLOT_MAX; slot_no++) {
         for (i =3D 0; i < PCI_NUM_PINS; i++) {
-            int gsi =3D (i + bus_no) % PCI_NUM_PINS;
+            int gsi =3D (i + slot_no) % PCI_NUM_PINS;
             Aml *pkg =3D aml_package(4);
-            aml_append(pkg, aml_int((bus_no << 16) | 0xFFFF));
+            aml_append(pkg, aml_int((slot_no << 16) | 0xFFFF));
             aml_append(pkg, aml_int(i));
             aml_append(pkg, aml_name("GSI%d", gsi));
             aml_append(pkg, aml_int(0));
--=20
2.19.1


