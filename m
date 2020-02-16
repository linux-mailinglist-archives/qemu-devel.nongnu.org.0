Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CC160371
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 11:27:03 +0100 (CET)
Received: from localhost ([::1]:59638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3H8g-0000W9-4W
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 05:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1j3H3x-0001B9-5v
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 05:22:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1j3H3v-0000AK-7X
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 05:22:09 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2711 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1j3H3q-0008U8-Dz; Sun, 16 Feb 2020 05:22:02 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 58F771C8BC576F41668C;
 Sun, 16 Feb 2020 18:21:57 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Sun, 16 Feb 2020
 18:21:48 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <mst@redhat.com>, <imammedo@redhat.com>, <xiaoguangrong.eric@gmail.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <fam@euphon.net>,
 <rth@twiddle.net>, <ehabkost@redhat.com>, <mtosatti@redhat.com>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <pbonzini@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
 <jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v23 3/9] ACPI: Build related register address fields via
 hardware error fw_cfg blob
Date: Sun, 16 Feb 2020 18:24:02 +0800
Message-ID: <20200216102408.22987-5-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200216102408.22987-1-gengdongjiu@huawei.com>
References: <20200216102408.22987-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
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
Cc: zhengxiang9@huawei.com, gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch builds error_block_address and read_ack_register fields
in hardware errors table , the error_block_address points to Generic
Error Status Block(GESB) via bios_linker. The max size for one GESB
is 1kb in bytes, For more detailed information, please refer to
document: docs/specs/acpi_hest_ghes.rst

Now we only support one Error source, if necessary, we can extend to
support more.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/acpi/Kconfig                 |  4 ++
 hw/acpi/Makefile.objs           |  1 +
 hw/acpi/aml-build.c             |  2 +
 hw/acpi/ghes.c                  | 89 +++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c        |  6 +++
 include/hw/acpi/aml-build.h     |  1 +
 include/hw/acpi/ghes.h          | 28 +++++++++++++
 8 files changed, 132 insertions(+)
 create mode 100644 hw/acpi/ghes.c
 create mode 100644 include/hw/acpi/ghes.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 645e620..7648be0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -41,3 +41,4 @@ CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
+CONFIG_ACPI_APEI=y
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 54209c6..1932f66 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -28,6 +28,10 @@ config ACPI_HMAT
     bool
     depends on ACPI
 
+config ACPI_APEI
+    bool
+    depends on ACPI
+
 config ACPI_PCI
     bool
     depends on ACPI && PCI
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 777da07..28c5ddb 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
 common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
 common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
 common-obj-$(CONFIG_ACPI_HMAT) += hmat.o
+common-obj-$(CONFIG_ACPI_APEI) += ghes.o
 common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 common-obj-$(call lnot,$(CONFIG_PC)) += acpi-x86-stub.o
 
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2c3702b..3681ec6 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1578,6 +1578,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
     tables->table_data = g_array_new(false, true /* clear */, 1);
     tables->tcpalog = g_array_new(false, true /* clear */, 1);
     tables->vmgenid = g_array_new(false, true /* clear */, 1);
+    tables->hardware_errors = g_array_new(false, true /* clear */, 1);
     tables->linker = bios_linker_loader_init();
 }
 
@@ -1588,6 +1589,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
     g_array_free(tables->table_data, true);
     g_array_free(tables->tcpalog, mfre);
     g_array_free(tables->vmgenid, mfre);
+    g_array_free(tables->hardware_errors, mfre);
 }
 
 /*
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
new file mode 100644
index 0000000..e1b3f8f
--- /dev/null
+++ b/hw/acpi/ghes.c
@@ -0,0 +1,89 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests
+ *
+ * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ * Author: Dongjiu Geng <gengdongjiu@huawei.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/acpi/ghes.h"
+#include "hw/acpi/aml-build.h"
+
+#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
+#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+
+/* The max size in bytes for one error block */
+#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
+
+/* Now only support ARMv8 SEA notification type error source */
+#define ACPI_GHES_ERROR_SOURCE_COUNT        1
+
+/*
+ * Build table for the hardware error fw_cfg blob.
+ * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
+ * See docs/specs/acpi_hest_ghes.rst for blobs format.
+ */
+void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
+{
+    int i, error_status_block_offset;
+
+    /* Build error_block_address */
+    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+        build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
+    }
+
+    /* Build read_ack_register */
+    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+        /*
+         * Initialize the value of read_ack_register to 1, so GHES can be
+         * writeable after (re)boot.
+         * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
+         * (GHESv2 - Type 10)
+         */
+        build_append_int_noprefix(hardware_errors, 1, sizeof(uint64_t));
+    }
+
+    /* Generic Error Status Block offset in the hardware error fw_cfg blob */
+    error_status_block_offset = hardware_errors->len;
+
+    /* Reserve space for Error Status Data Block */
+    acpi_data_push(hardware_errors,
+        ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
+
+    /* Tell guest firmware to place hardware_errors blob into RAM */
+    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
+                             hardware_errors, sizeof(uint64_t), false);
+
+    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+        /*
+         * Tell firmware to patch error_block_address entries to point to
+         * corresponding "Generic Error Status Block"
+         */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
+            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
+            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
+    }
+
+    /*
+     * tell firmware to write hardware_errors GPA into
+     * hardware_errors_addr fw_cfg, once the former has been initialized.
+     */
+    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
+        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd5f771..6819fcf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -48,6 +48,7 @@
 #include "sysemu/reset.h"
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
+#include "hw/acpi/ghes.h"
 
 #define ARM_SPI_BASE 32
 
@@ -830,6 +831,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    if (vms->ras) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_ghes_error_table(tables->hardware_errors, tables->linker);
+    }
+
     if (ms->numa_state->num_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, vms);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de4a406..8f13620 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -220,6 +220,7 @@ struct AcpiBuildTables {
     GArray *rsdp;
     GArray *tcpalog;
     GArray *vmgenid;
+    GArray *hardware_errors;
     BIOSLinker *linker;
 } AcpiBuildTables;
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
new file mode 100644
index 0000000..50379b0
--- /dev/null
+++ b/include/hw/acpi/ghes.h
@@ -0,0 +1,28 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests
+ *
+ * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ * Author: Dongjiu Geng <gengdongjiu@huawei.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef ACPI_GHES_H
+#define ACPI_GHES_H
+
+#include "hw/acpi/bios-linker-loader.h"
+
+void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
+#endif
-- 
1.8.3.1


