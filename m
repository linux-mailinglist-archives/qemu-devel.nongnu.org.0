Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E9155125C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:16:51 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CaY-0000Qj-Gs
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3CPU-0006fE-KR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47772 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3CPK-0007Jp-DD
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:23 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+YjKrBilqVOAA--.20331S6; 
 Mon, 20 Jun 2022 16:04:53 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 4/8] hw/loongarch: Add LoongArch acpi support
Date: Mon, 20 Jun 2022 16:04:47 +0800
Message-Id: <20220620080451.3711049-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+YjKrBilqVOAA--.20331S6
X-Coremail-Antispam: 1UD129KBjvAXoWfCw1xAw4UArW7Ww1DGFW5trb_yoW5WFy3to
 Z3JFWrW3W8Xryj9rZYkrn0q3y7Wr18KF4Dtr93GF4kKa1fAw4UGryfKws5uw12y3Z0k347
 XrWrKwn3ArZ7CF18n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/Kconfig        |   2 +
 hw/loongarch/acpi-build.c   | 620 ++++++++++++++++++++++++++++++++++++
 hw/loongarch/loongson3.c    |  78 ++++-
 hw/loongarch/meson.build    |   4 +
 include/hw/loongarch/virt.h |  13 +
 include/hw/pci-host/ls7a.h  |   5 +
 6 files changed, 719 insertions(+), 3 deletions(-)
 create mode 100644 hw/loongarch/acpi-build.c

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 610552e522..a99aa387c3 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -15,3 +15,5 @@ config LOONGARCH_VIRT
     select LOONGARCH_EXTIOI
     select LS7A_RTC
     select SMBIOS
+    select ACPI_PCI
+    select ACPI_HW_REDUCED
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
new file mode 100644
index 0000000000..008f661d7b
--- /dev/null
+++ b/hw/loongarch/acpi-build.c
@@ -0,0 +1,620 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Support for generating ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/bitmap.h"
+#include "hw/pci/pci.h"
+#include "hw/core/cpu.h"
+#include "target/loongarch/cpu.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/acpi.h"
+#include "hw/nvram/fw_cfg.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "migration/vmstate.h"
+#include "hw/mem/memory-device.h"
+#include "sysemu/reset.h"
+
+/* Supported chipsets: */
+#include "hw/pci-host/ls7a.h"
+#include "hw/loongarch/virt.h"
+#include "hw/acpi/aml-build.h"
+
+#include "hw/acpi/utils.h"
+#include "hw/acpi/pci.h"
+
+#include "qom/qom-qobject.h"
+
+#include "hw/acpi/generic_event_device.h"
+
+#define ACPI_BUILD_ALIGN_SIZE             0x1000
+#define ACPI_BUILD_TABLE_SIZE             0x20000
+
+#ifdef DEBUG_ACPI_BUILD
+#define ACPI_BUILD_DPRINTF(fmt, ...)        \
+    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
+#else
+#define ACPI_BUILD_DPRINTF(fmt, ...)
+#endif
+
+static void init_common_fadt_data(AcpiFadtData *data)
+{
+    AcpiFadtData fadt = {
+        /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
+        .rev = 5,
+        .flags = ((1 << ACPI_FADT_F_HW_REDUCED_ACPI) |
+                  (1 << ACPI_FADT_F_RESET_REG_SUP)),
+
+        /* ACPI 5.0: 4.8.3.7 Sleep Control and Status Registers */
+        .sleep_ctl = {
+            .space_id = AML_AS_SYSTEM_MEMORY,
+            .bit_width = 8,
+            .address = GED_REG_ADDR + ACPI_GED_REG_SLEEP_CTL,
+        },
+        .sleep_sts = {
+            .space_id = AML_AS_SYSTEM_MEMORY,
+            .bit_width = 8,
+            .address = GED_REG_ADDR + ACPI_GED_REG_SLEEP_STS,
+        },
+
+        /* ACPI 5.0: 4.8.3.6 Reset Register */
+        .reset_reg = {
+            .space_id = AML_AS_SYSTEM_MEMORY,
+            .bit_width = 8,
+            .address = GED_REG_ADDR + ACPI_GED_REG_RESET,
+        },
+        .reset_val = ACPI_GED_RESET_VALUE,
+    };
+    *data = fadt;
+}
+
+static void acpi_align_size(GArray *blob, unsigned align)
+{
+    /*
+     * Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
+/*
+ * Loongson CPU firmware and kernel interface specification V3.1.
+ * chapter 8.7 Firmware ACPI Control Structure
+ */
+static void
+build_facs(GArray *table_data)
+{
+    const char *sig = "FACS";
+    const uint8_t reserved[40] = {};
+
+    g_array_append_vals(table_data, sig, 4); /* Signature */
+    build_append_int_noprefix(table_data, 64, 4); /* Length */
+    build_append_int_noprefix(table_data, 0, 4); /* Hardware Signature */
+    build_append_int_noprefix(table_data, 0, 4); /* Firmware Waking Vector */
+    build_append_int_noprefix(table_data, 0, 4); /* Global Lock */
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
+    g_array_append_vals(table_data, reserved, 40); /* Reserved */
+}
+
+/*
+ * Loongson CPU firmware and kernel interface specification V3.1.
+ * chapter 8.3 Multiple APIC Description Table
+ */
+static void
+build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    int i;
+    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = lams->oem_id,
+                        .oem_table_id = lams->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    /* Local APIC Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
+
+    for (i = 0; i < ms->smp.cpus; i++) {
+        /* Processor Core Interrupt Controller Structure */
+        build_append_int_noprefix(table_data, 17, 1);    /* Type */
+        build_append_int_noprefix(table_data, 15, 1);    /* Length */
+        build_append_int_noprefix(table_data, 1, 1);     /* Version */
+        build_append_int_noprefix(table_data, i + 1, 4); /* ACPI Processor ID */
+        build_append_int_noprefix(table_data, i, 4);     /* Core ID */
+        build_append_int_noprefix(table_data, 1, 4);     /* Flags */
+    }
+
+    /* Extend I/O Interrupt Controller Structure */
+    build_append_int_noprefix(table_data, 20, 1);        /* Type */
+    build_append_int_noprefix(table_data, 13, 1);        /* Length */
+    build_append_int_noprefix(table_data, 1, 1);         /* Version */
+    build_append_int_noprefix(table_data, 3, 1);         /* Cascade */
+    build_append_int_noprefix(table_data, 0, 1);         /* Node */
+    build_append_int_noprefix(table_data, 0xffff, 8);    /* Node map */
+
+    /* MSI Interrupt Controller Structure */
+    build_append_int_noprefix(table_data, 21, 1);        /* Type */
+    build_append_int_noprefix(table_data, 19, 1);        /* Length */
+    build_append_int_noprefix(table_data, 1, 1);         /* Version */
+    build_append_int_noprefix(table_data, LS7A_PCH_MSI_ADDR_LOW, 8);/* Address */
+    build_append_int_noprefix(table_data, 0x40, 4);      /* Start */
+    build_append_int_noprefix(table_data, 0xc0, 4);      /* Count */
+
+    /* Bridge I/O Interrupt Controller Structure */
+    build_append_int_noprefix(table_data, 22, 1);        /* Type */
+    build_append_int_noprefix(table_data, 17, 1);        /* Length */
+    build_append_int_noprefix(table_data, 1, 1);         /* Version */
+    build_append_int_noprefix(table_data, LS7A_PCH_REG_BASE, 8);/* Address */
+    build_append_int_noprefix(table_data, 0x1000, 2);    /* Size */
+    build_append_int_noprefix(table_data, 0, 2);         /* Id */
+    build_append_int_noprefix(table_data, 0x40, 2);      /* Base */
+
+    acpi_table_end(linker, &table);
+}
+
+/*
+ * Loongson CPU firmware and kernel interface specification V3.1.
+ * chapter 8.4 System Resource Affinity Table
+ */
+static void
+build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
+{
+    uint64_t i;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    MachineState *ms = MACHINE(lams);
+    AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = lams->oem_id,
+                        .oem_table_id = lams->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
+
+    for (i = 0; i < ms->smp.cpus; ++i) {
+        /* Processor Local APIC/SAPIC Affinity Structure */
+        build_append_int_noprefix(table_data, 0, 1);  /* Type  */
+        build_append_int_noprefix(table_data, 16, 1); /* Length */
+        /* Proximity Domain [7:0] */
+        build_append_int_noprefix(table_data, 0, 1);
+        build_append_int_noprefix(table_data, i, 1); /* APIC ID */
+        /* Flags, Table 5-36 */
+        build_append_int_noprefix(table_data, 1, 4);
+        build_append_int_noprefix(table_data, 0, 1); /* Local SAPIC EID */
+        /* Proximity Domain [31:8] */
+        build_append_int_noprefix(table_data, 0, 3);
+        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    }
+
+    build_srat_memory(table_data, LOW_MEM_BASE, LOW_MEM_SIZE,
+                      0, MEM_AFFINITY_ENABLED);
+
+    build_srat_memory(table_data, HIGH_MEM_BASE, machine->ram_size - LOW_MEM_SIZE,
+                      0, MEM_AFFINITY_ENABLED);
+
+    acpi_table_end(linker, &table);
+}
+
+typedef
+struct AcpiBuildState {
+    /* Copy of table in RAM (for patching). */
+    MemoryRegion *table_mr;
+    /* Is table patched? */
+    uint8_t patched;
+    void *rsdp;
+    MemoryRegion *rsdp_mr;
+    MemoryRegion *linker_mr;
+} AcpiBuildState;
+
+static void build_gpex_pci0_int(Aml *table)
+{
+    Aml *sb_scope = aml_scope("_SB");
+    Aml *pci0_scope = aml_scope("PCI0");
+    Aml *prt_pkg = aml_varpackage(128);
+    int slot, pin;
+
+    for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
+        for (pin = 0; pin < PCI_NUM_PINS; pin++) {
+            Aml *pkg = aml_package(4);
+            aml_append(pkg, aml_int((slot << 16) | 0xFFFF));
+            aml_append(pkg, aml_int(pin));
+            aml_append(pkg, aml_int(0));
+            aml_append(pkg, aml_int(80 + (slot + pin) % 4));
+            aml_append(prt_pkg, pkg);
+        }
+    }
+    aml_append(pci0_scope, aml_name_decl("_PRT", prt_pkg));
+    aml_append(sb_scope, pci0_scope);
+    aml_append(table, sb_scope);
+}
+
+static void build_dbg_aml(Aml *table)
+{
+    Aml *field;
+    Aml *method;
+    Aml *while_ctx;
+    Aml *scope = aml_scope("\\");
+    Aml *buf = aml_local(0);
+    Aml *len = aml_local(1);
+    Aml *idx = aml_local(2);
+
+    aml_append(scope,
+       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
+    field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("DBGB", 8));
+    aml_append(scope, field);
+
+    method = aml_method("DBUG", 1, AML_NOTSERIALIZED);
+
+    aml_append(method, aml_to_hexstring(aml_arg(0), buf));
+    aml_append(method, aml_to_buffer(buf, buf));
+    aml_append(method, aml_subtract(aml_sizeof(buf), aml_int(1), len));
+    aml_append(method, aml_store(aml_int(0), idx));
+
+    while_ctx = aml_while(aml_lless(idx, len));
+    aml_append(while_ctx,
+        aml_store(aml_derefof(aml_index(buf, idx)), aml_name("DBGB")));
+    aml_append(while_ctx, aml_increment(idx));
+    aml_append(method, while_ctx);
+    aml_append(method, aml_store(aml_int(0x0A), aml_name("DBGB")));
+    aml_append(scope, method);
+    aml_append(table, scope);
+}
+
+static Aml *build_ls7a_osc_method(void)
+{
+    Aml *if_ctx;
+    Aml *if_ctx2;
+    Aml *else_ctx;
+    Aml *method;
+    Aml *a_cwd1 = aml_name("CDW1");
+    Aml *a_ctrl = aml_local(0);
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    if_ctx = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
+
+    /*
+     * Always allow native PME, AER (no dependencies)
+     * Allow SHPC (PCI bridges can have SHPC controller)
+     */
+    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
+    /* Unknown revision */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
+    /* Capabilities bits were masked */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    /* Update DWORD3 in the buffer */
+    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
+    aml_append(method, if_ctx);
+
+    else_ctx = aml_else();
+    /* Unrecognized UUID */
+    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
+    aml_append(method, else_ctx);
+
+    aml_append(method, aml_return(aml_arg(3)));
+    return method;
+}
+
+static void build_ls7a_uart_device_aml(Aml *table)
+{
+    Aml *dev;
+    Aml *crs;
+    Aml *pkg0, *pkg1, *pkg2;
+    uint32_t uart_irq = LS7A_UART_IRQ;
+
+    Aml *scope = aml_scope("_SB");
+    dev = aml_device("COMA");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                         AML_NON_CACHEABLE, AML_READ_WRITE,
+                         0, 0x1FE001E0, 0x1FE001E7, 0, 0x8));
+    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                  AML_SHARED, &uart_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    pkg0 = aml_package(0x2);
+    aml_append(pkg0, aml_int(0x05F5E100));
+    aml_append(pkg0, aml_string("clock-frenquency"));
+    pkg1 = aml_package(0x1);
+    aml_append(pkg1, pkg0);
+    pkg2 = aml_package(0x2);
+    aml_append(pkg2, aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301"));
+    aml_append(pkg2, pkg1);
+    aml_append(dev, aml_name_decl("_DSD", pkg2));
+    aml_append(scope, dev);
+    aml_append(table, scope);
+}
+
+/*
+ * Loongson CPU firmware and kernel interface specification V3.1.
+ * chapter 8.6 Differentiated System Description Table
+ */
+static void
+build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
+{
+    Aml *dsdt, *sb_scope, *scope, *dev, *crs, *pkg;
+    int root_bus_limit = 0x7F;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = lams->oem_id,
+                        .oem_table_id = lams->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    dsdt = init_aml_allocator();
+
+    build_dbg_aml(dsdt);
+
+    sb_scope = aml_scope("_SB");
+    dev = aml_device("PCI0");
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+    aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+    aml_append(dev, build_ls7a_osc_method());
+    aml_append(sb_scope, dev);
+    aml_append(dsdt, sb_scope);
+
+    build_gpex_pci0_int(dsdt);
+    build_ls7a_uart_device_aml(dsdt);
+    if (lams->acpi_ged) {
+        build_ged_aml(dsdt, "\\_SB."GED_DEVICE,
+                      HOTPLUG_HANDLER(lams->acpi_ged),
+                      LS7A_SCI_IRQ - PCH_PIC_IRQ_OFFSET, AML_SYSTEM_MEMORY,
+                      GED_EVT_ADDR);
+    }
+
+    scope = aml_scope("\\_SB.PCI0");
+    /* Build PCI0._CRS */
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                            0x0000, 0x0, root_bus_limit,
+                            0x0000, root_bus_limit + 1));
+    aml_append(crs,
+        aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
+                    AML_POS_DECODE, AML_ENTIRE_RANGE,
+                    0x0000, 0x0000, 0xFFFF, 0x18000000, 0x10000));
+    aml_append(crs,
+        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                         AML_CACHEABLE, AML_READ_WRITE,
+                         0, LS7A_PCI_MEM_BASE,
+                         LS7A_PCI_MEM_BASE + LS7A_PCI_MEM_SIZE - 1,
+                         0, LS7A_PCI_MEM_BASE));
+    aml_append(scope, aml_name_decl("_CRS", crs));
+    aml_append(dsdt, scope);
+
+    /* System State Package */
+    scope = aml_scope("\\");
+    pkg = aml_package(4);
+    aml_append(pkg, aml_int(ACPI_GED_SLP_TYP_S5));
+    aml_append(pkg, aml_int(0)); /* ignored */
+    aml_append(pkg, aml_int(0)); /* reserved */
+    aml_append(pkg, aml_int(0)); /* reserved */
+    aml_append(scope, aml_name_decl("_S5", pkg));
+    aml_append(dsdt, scope);
+    /* Copy AML table into ACPI tables blob and patch header there */
+    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
+    acpi_table_end(linker, &table);
+    free_aml_allocator();
+}
+
+static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    GArray *table_offsets;
+    AcpiFadtData fadt_data;
+    unsigned facs, rsdt, fadt, dsdt;
+    uint8_t *u;
+    size_t aml_len = 0;
+    GArray *tables_blob = tables->table_data;
+
+    init_common_fadt_data(&fadt_data);
+
+    table_offsets = g_array_new(false, true, sizeof(uint32_t));
+    ACPI_BUILD_DPRINTF("init ACPI tables\n");
+
+    bios_linker_loader_alloc(tables->linker,
+                             ACPI_BUILD_TABLE_FILE, tables_blob,
+                             64, false);
+
+    /*
+     * FACS is pointed to by FADT.
+     * We place it first since it's the only table that has alignment
+     * requirements.
+     */
+    facs = tables_blob->len;
+    build_facs(tables_blob);
+
+    /* DSDT is pointed to by FADT */
+    dsdt = tables_blob->len;
+    build_dsdt(tables_blob, tables->linker, machine);
+
+    /*
+     * Count the size of the DSDT, we will need it for
+     * legacy sizing of ACPI tables.
+     */
+    aml_len += tables_blob->len - dsdt;
+
+    /* ACPI tables pointed to by RSDT */
+    fadt = tables_blob->len;
+    acpi_add_table(table_offsets, tables_blob);
+    fadt_data.facs_tbl_offset = &facs;
+    fadt_data.dsdt_tbl_offset = &dsdt;
+    fadt_data.xdsdt_tbl_offset = &dsdt;
+    build_fadt(tables_blob, tables->linker, &fadt_data,
+               lams->oem_id, lams->oem_table_id);
+    aml_len += tables_blob->len - fadt;
+
+    acpi_add_table(table_offsets, tables_blob);
+    build_madt(tables_blob, tables->linker, lams);
+
+    acpi_add_table(table_offsets, tables_blob);
+    build_srat(tables_blob, tables->linker, machine);
+
+    acpi_add_table(table_offsets, tables_blob);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = cpu_to_le64(LS_PCIECFG_BASE),
+           .size = cpu_to_le64(LS_PCIECFG_SIZE),
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
+                   lams->oem_table_id);
+    }
+
+    /* Add tables supplied by user (if any) */
+    for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
+        unsigned len = acpi_table_len(u);
+
+        acpi_add_table(table_offsets, tables_blob);
+        g_array_append_vals(tables_blob, u, len);
+    }
+
+    /* RSDT is pointed to by RSDP */
+    rsdt = tables_blob->len;
+    build_rsdt(tables_blob, tables->linker, table_offsets,
+               lams->oem_id, lams->oem_table_id);
+
+    /* RSDP is in FSEG memory, so allocate it separately */
+    {
+        AcpiRsdpData rsdp_data = {
+            .revision = 0,
+            .oem_id = lams->oem_id,
+            .xsdt_tbl_offset = NULL,
+            .rsdt_tbl_offset = &rsdt,
+        };
+        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
+    }
+
+    /*
+     * The align size is 128, warn if 64k is not enough therefore
+     * the align size could be resized.
+     */
+    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        warn_report("ACPI table size %u exceeds %d bytes,"
+                    " migration may not work",
+                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
+        error_printf("Try removing CPUs, NUMA nodes, memory slots"
+                     " or PCI bridges.");
+    }
+
+    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
+
+    /* Cleanup memory that's no longer used. */
+    g_array_free(table_offsets, true);
+}
+
+static void acpi_ram_update(MemoryRegion *mr, GArray *data)
+{
+    uint32_t size = acpi_data_len(data);
+
+    /*
+     * Make sure RAM size is correct - in case it got changed
+     * e.g. by migration
+     */
+    memory_region_ram_resize(mr, size, &error_abort);
+
+    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
+    memory_region_set_dirty(mr, 0, size);
+}
+
+static void acpi_build_update(void *build_opaque)
+{
+    AcpiBuildState *build_state = build_opaque;
+    AcpiBuildTables tables;
+
+    /* No state to update or already patched? Nothing to do. */
+    if (!build_state || build_state->patched) {
+        return;
+    }
+    build_state->patched = 1;
+
+    acpi_build_tables_init(&tables);
+
+    acpi_build(&tables, MACHINE(qdev_get_machine()));
+
+    acpi_ram_update(build_state->table_mr, tables.table_data);
+    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
+
+    acpi_build_tables_cleanup(&tables, true);
+}
+
+static void acpi_build_reset(void *build_opaque)
+{
+    AcpiBuildState *build_state = build_opaque;
+    build_state->patched = 0;
+}
+
+static const VMStateDescription vmstate_acpi_build = {
+    .name = "acpi_build",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(patched, AcpiBuildState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+void loongarch_acpi_setup(LoongArchMachineState *lams)
+{
+    AcpiBuildTables tables;
+    AcpiBuildState *build_state;
+
+    if (!lams->fw_cfg) {
+        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
+        return;
+    }
+
+    if (!loongarch_is_acpi_enabled(lams)) {
+        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
+        return;
+    }
+
+    build_state = g_malloc0(sizeof *build_state);
+
+    acpi_build_tables_init(&tables);
+    acpi_build(&tables, MACHINE(lams));
+
+    /* Now expose it all to Guest */
+    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
+                                              build_state, tables.table_data,
+                                              ACPI_BUILD_TABLE_FILE);
+    assert(build_state->table_mr != NULL);
+
+    build_state->linker_mr =
+        acpi_add_rom_blob(acpi_build_update, build_state,
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
+
+    build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
+                                             build_state, tables.rsdp,
+                                             ACPI_BUILD_RSDP_FILE);
+
+    qemu_register_reset(acpi_build_reset, build_state);
+    acpi_build_reset(build_state);
+    vmstate_register(NULL, 0, &vmstate_acpi_build, build_state);
+
+    /*
+     * Cleanup tables but don't free the memory: we track it
+     * in build_state.
+     */
+    acpi_build_tables_cleanup(&tables, false);
+}
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index b638d02eb5..cc449a12ae 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -33,6 +33,10 @@
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
 #include "hw/firmware/smbios.h"
+#include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
+#include "hw/acpi/generic_event_device.h"
+#include "hw/mem/nvdimm.h"
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
@@ -69,6 +73,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     LoongArchMachineState *lams = container_of(notifier,
                                         LoongArchMachineState, machine_done);
     virt_build_smbios(lams);
+    loongarch_acpi_setup(lams);
 }
 
 struct la_memmap_entry {
@@ -103,7 +108,6 @@ static int la_memmap_add_entry(uint64_t address, uint64_t length, uint32_t type)
     return la_memmap_entries;
 }
 
-
 /*
  * This is a placeholder for missing ACPI,
  * and will eventually be replaced.
@@ -174,7 +178,32 @@ static int64_t load_kernel_info(void)
     return kernel_entry;
 }
 
-static void loongarch_devices_init(DeviceState *pch_pic)
+static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState *lams)
+{
+    DeviceState *dev;
+    MachineState *ms = MACHINE(lams);
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+
+    if (ms->ram_slots) {
+        event |= ACPI_GED_MEM_HOTPLUG_EVT;
+    }
+    dev = qdev_new(TYPE_ACPI_GED);
+    qdev_prop_set_uint32(dev, "ged-event", event);
+
+    /* ged event */
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, GED_EVT_ADDR);
+    /* memory hotplug */
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, GED_MEM_ADDR);
+    /* ged regs used for reset and power down */
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, GED_REG_ADDR);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
+                       qdev_get_gpio_in(pch_pic, LS7A_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    return dev;
+}
+
+static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *lams)
 {
     DeviceState *gpex_dev;
     SysBusDevice *d;
@@ -250,6 +279,8 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
                           NULL, "loongarch_virt_pm", PM_SIZE);
     memory_region_add_subregion(get_system_memory(), PM_BASE, pm_mem);
+    /* acpi ged */
+    lams->acpi_ged = create_acpi_ged(pch_pic, lams);
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
@@ -347,7 +378,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
                               qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
     }
 
-    loongarch_devices_init(pch_pic);
+    loongarch_devices_init(pch_pic, lams);
 }
 
 static bool loongarch_firmware_init(LoongArchMachineState *lams)
@@ -565,6 +596,40 @@ static void loongarch_init(MachineState *machine)
     qemu_add_machine_init_done_notifier(&lams->machine_done);
 }
 
+bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
+{
+    if (lams->acpi == ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void loongarch_get_acpi(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(obj);
+    OnOffAuto acpi = lams->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void loongarch_set_acpi(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &lams->acpi, errp);
+}
+
+static void loongarch_machine_initfn(Object *obj)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(obj);
+
+    lams->acpi = ON_OFF_AUTO_AUTO;
+    lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+}
+
 static void loongarch_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -580,6 +645,12 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->default_boot_order = "c";
     mc->no_cdrom = 1;
+
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+        loongarch_get_acpi, loongarch_set_acpi,
+        NULL, NULL);
+    object_class_property_set_description(oc, "acpi",
+        "Enable ACPI");
 }
 
 static const TypeInfo loongarch_machine_types[] = {
@@ -588,6 +659,7 @@ static const TypeInfo loongarch_machine_types[] = {
         .parent         = TYPE_MACHINE,
         .instance_size  = sizeof(LoongArchMachineState),
         .class_init     = loongarch_class_init,
+        .instance_init = loongarch_machine_initfn,
     }
 };
 
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index cecb1a5d65..3e7cbcfc05 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,4 +1,8 @@
 loongarch_ss = ss.source_set()
+loongarch_ss.add(files(
+    'fw_cfg.c',
+))
 loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: files('loongson3.c'))
+loongarch_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-build.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 55bc2fe4e9..63b6917c15 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -21,6 +21,13 @@
 #define LA_BIOS_BASE            0x1c000000
 #define LA_BIOS_SIZE            (4 * MiB)
 
+#define LOW_MEM_BASE 0
+#define LOW_MEM_SIZE 0x10000000
+#define HIGH_MEM_BASE 0x90000000
+#define GED_EVT_ADDR 0x100e0000
+#define GED_MEM_ADDR (GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
+#define GED_REG_ADDR (GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
+
 struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -34,8 +41,14 @@ struct LoongArchMachineState {
     /* State for other subsystems/APIs: */
     FWCfgState  *fw_cfg;
     Notifier machine_done;
+    OnOffAuto   acpi;
+    char        *oem_id;
+    char        *oem_table_id;
+    DeviceState *acpi_ged;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchMachineState, LOONGARCH_MACHINE)
+bool loongarch_is_acpi_enabled(LoongArchMachineState *lams);
+void loongarch_acpi_setup(LoongArchMachineState *lams);
 #endif
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 08c5f78be2..f93c3e3287 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -23,6 +23,9 @@
 #define LS7A_PCI_IO_BASE        0x18004000UL
 #define LS7A_PCI_IO_SIZE        0xC000
 
+#define LS7A_PCI_MEM_BASE        0x40000000UL
+#define LS7A_PCI_MEM_SIZE        0x40000000UL
+
 #define LS7A_PCH_REG_BASE       0x10000000UL
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
 #define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
@@ -41,4 +44,6 @@
 #define LS7A_MISC_REG_BASE      (LS7A_PCH_REG_BASE + 0x00080000)
 #define LS7A_RTC_REG_BASE       (LS7A_MISC_REG_BASE + 0x00050100)
 #define LS7A_RTC_LEN            0x100
+#define LS7A_ACPI_REG_BASE      (LS7A_MISC_REG_BASE + 0x00050000)
+#define LS7A_SCI_IRQ            (PCH_PIC_IRQ_OFFSET + 4)
 #endif
-- 
2.31.1


