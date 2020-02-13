Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E617E15B735
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 03:38:37 +0100 (CET)
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j24Oj-00035v-0m
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 21:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j24M4-0007EW-TA
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j24M3-0000aA-Fd
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:52 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:57520 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j24M0-0000Rg-6Z; Wed, 12 Feb 2020 21:35:48 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5B78D9043C57BD0FF0E9;
 Thu, 13 Feb 2020 10:35:45 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 10:35:35 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 2/4] acpi/cppc: Add ACPI CPPC registers
Date: Thu, 13 Feb 2020 10:35:30 +0800
Message-ID: <20200213023532.902-3-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20200213023532.902-1-fangying1@huawei.com>
References: <20200213023532.902-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Continuous Performance Control Package is used to
describe the ACPI CPPC registers.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c    | 74 ++++++++++++++++++++++++++++++++++++-
 hw/arm/virt.c               |  1 +
 include/hw/acpi/acpi-defs.h | 32 ++++++++++++++++
 include/hw/arm/virt.h       |  1 +
 4 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd5f771e9b..d133bad738 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -41,6 +41,7 @@
 #include "hw/acpi/pci.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/acpi-defs.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -51,7 +52,70 @@
=20
 #define ARM_SPI_BASE 32
=20
-static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
+
+static void acpi_dsdt_add_psd(Aml *dev, int cpus)
+{
+    Aml *pkg;
+    Aml *sub;
+
+    sub =3D aml_package(5);
+    aml_append(sub, aml_int(5));
+    aml_append(sub, aml_int(0));
+    /* Assume all vCPUs belong to the same domain */
+    aml_append(sub, aml_int(0));
+    /* SW_ANY: OSPM coordinate, initiate on any processor */
+    aml_append(sub, aml_int(0xFD));
+    aml_append(sub, aml_int(cpus));
+
+    pkg =3D aml_package(1);
+    aml_append(pkg, sub);
+
+    aml_append(dev, aml_name_decl("_PSD", pkg));
+}
+
+static void acpi_dsdt_add_cppc(Aml *dev, uint64_t cpu_base)
+{
+    Aml *cpc;
+    int i;
+
+    /* ACPI 6.3 8.4.7.1, version 3 of the CPPC table is used */
+    cpc =3D aml_package(23);
+    aml_append(cpc, aml_int(23));
+    aml_append(cpc, aml_int(3));
+
+    for (i =3D 0; i < CPPC_REG_COUNT; i++) {
+        Aml *res;
+        uint8_t reg_width;
+        uint8_t acc_type;
+        uint64_t addr;
+        /* Only some necessary registers are emulated */
+        if ((i >=3D MIN_PERF && i < REFERENCE_CTR) ||
+            (i >=3D ENABLE && i < LOWEST_FREQ)) {
+            reg_width =3D 0;
+            acc_type =3D AML_ANY_ACC;
+            addr =3D 0;
+        } else {
+            addr =3D cpu_base + i * 4;
+            if (i =3D=3D REFERENCE_CTR || i =3D=3D DELIVERED_CTR) {
+                reg_width =3D 64;
+                acc_type =3D AML_QWORD_ACC;
+            } else {
+                reg_width =3D 32;
+                acc_type =3D AML_DWORD_ACC;
+            }
+        }
+
+        res =3D aml_resource_template();
+        aml_append(res, aml_generic_register(AML_SYSTEM_MEMORY, reg_widt=
h, 0,
+                                             acc_type, addr));
+        aml_append(cpc, res);
+    }
+
+    aml_append(dev, aml_name_decl("_CPC", cpc));
+}
+
+static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus,
+                               const MemMapEntry *cppc_memmap)
 {
     uint16_t i;
=20
@@ -60,6 +124,12 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cp=
us)
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
         aml_append(scope, dev);
+        /*
+         * Append _CPC and _PSD to show CPU frequency
+         */
+        acpi_dsdt_add_cppc(dev,
+                           cppc_memmap->base + i * CPPC_REG_PER_CPU_STRI=
DE);
+        acpi_dsdt_add_psd(dev, smp_cpus);
     }
 }
=20
@@ -736,7 +806,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope =3D aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
+    acpi_dsdt_add_cpus(scope, vms->smp_cpus, &memmap[VIRT_CPUFREQ]);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f788fe27d6..ed9dc38b60 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -144,6 +144,7 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =3D           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
+    [VIRT_CPUFREQ] =3D            { 0x0b000000, 0x00010000 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that s=
ize */
     [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
     [VIRT_SECURE_MEM] =3D         { 0x0e000000, 0x01000000 },
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 57a3f58b0c..3a33f7220d 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -634,4 +634,36 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
=20
+/*
+ * CPPC register definition from kernel header
+ * include/acpi/cppc_acpi.h
+ * The last element is newly added for easy use
+ */
+enum cppc_regs {
+    HIGHEST_PERF,
+    NOMINAL_PERF,
+    LOW_NON_LINEAR_PERF,
+    LOWEST_PERF,
+    GUARANTEED_PERF,
+    DESIRED_PERF,
+    MIN_PERF,
+    MAX_PERF,
+    PERF_REDUC_TOLERANCE,
+    TIME_WINDOW,
+    CTR_WRAP_TIME,
+    REFERENCE_CTR,
+    DELIVERED_CTR,
+    PERF_LIMITED,
+    ENABLE,
+    AUTO_SEL_ENABLE,
+    AUTO_ACT_WINDOW,
+    ENERGY_PERF,
+    REFERENCE_PERF,
+    LOWEST_FREQ,
+    NOMINAL_FREQ,
+    CPPC_REG_COUNT,
+};
+
+#define CPPC_REG_PER_CPU_STRIDE     0x40
+
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 71508bf40c..f371713728 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -67,6 +67,7 @@ enum {
     VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
+    VIRT_CPUFREQ,
     VIRT_RTC,
     VIRT_FW_CFG,
     VIRT_PCIE,
--=20
2.19.1



