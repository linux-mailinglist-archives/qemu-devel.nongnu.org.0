Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C02E8E3F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:03:00 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAWh-00068g-1D
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMW-0004UQ-HE
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:29 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMU-0006IB-9Z
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id c133so15947190wme.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XKrzyGYDs2ZIrC3ygkFPwtkIBNSMvHVJ93e/77Thnk=;
 b=S4gMVMlPrEasXO1/fAAjTas9ubBkYwoSMxjdzQAgloUACYjUx06C9df6omMn1XMuPq
 GJJsKLzG1YTKTGEZtIvl9pwueBuOcjd6xs9xXu7u6xYV8ljlQ5/LueT+QVn89UfgFioZ
 9H6zums/xeK7bW4BHq9XMdoQ0p3DYctOBxC/s6zc8e+DVjMmTM5bhLvY4Ox0wxHRbQKk
 8DrUfl/r9Aazh9gXPIN/ADCbL1UVkqe9cCDtyAGs52r5NQSWk1FD44/W/uuhPfDugY8M
 OdMw7aD8s5RY+aegkayp5xgK82ZIqHIbufo1ynSOPsA/VDCHyOEDdL3ih1zM40WUCc/y
 1JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3XKrzyGYDs2ZIrC3ygkFPwtkIBNSMvHVJ93e/77Thnk=;
 b=Tf+b8SeKH77bTGK3FaDuaAWr59B8qfla1MQ5Sg8iQiZKFE0DHLLDNOvtZ3s6c9fbyh
 ZfaXg+abbw0rclLKqdf89j9aRy/Vs813sv5NoCWzISMnbY89QyDE7JXa6nQgyvLnQJQx
 tXLuhQF4TC3SwaKhJE65gzozT6UMPud+axTEaKBWMHXEWUvUBbgZNeZwV2rsUugkock0
 xU9g/qQYY2CoOmLs1kETxThwz0NRc4lXhW8EhkCwb+KKE4lThD7gsyc1mUWaeGAdnkuz
 O8mV4uhVMOdaHWsJkS1vlBaFkrykEU+lNY3++Rd/4OczCBALDqXFGrl08uYkRL6P3NZz
 N3gw==
X-Gm-Message-State: AOAM5337WuHNxWUcnh1mIr8Yx1xTOBChKWA9dMDgVJrvVJswt7wPjtLJ
 4FJNdb1klAAF13s3xL1neTYFzFYc9kk=
X-Google-Smtp-Source: ABdhPJwvIpoNr0ZxkVrn0bKpMpRhYKNwblN3f7HQ0yMBMKtt6aF5+6Gpm8tpo19Xx4moEMEZvzw3jw==
X-Received: by 2002:a1c:7d58:: with SMTP id y85mr24024584wmc.50.1609707144757; 
 Sun, 03 Jan 2021 12:52:24 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id l8sm30141603wmf.35.2021.01.03.12.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/35] hw/mips: Add Loongson-3 boot parameter helpers
Date: Sun,  3 Jan 2021 21:50:11 +0100
Message-Id: <20210103205021.2837760-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <chenhuacai@kernel.org>

Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
UEFI-like interface for BIOS-Kernel boot parameters) helpers first.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201221110538.3186646-4-chenhuacai@kernel.org>
[PMD: Fixed typo]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++
 hw/mips/loongson3_bootp.c | 151 ++++++++++++++++++++++++
 MAINTAINERS               |   2 +
 hw/mips/meson.build       |   1 +
 4 files changed, 395 insertions(+)
 create mode 100644 hw/mips/loongson3_bootp.h
 create mode 100644 hw/mips/loongson3_bootp.c

diff --git a/hw/mips/loongson3_bootp.h b/hw/mips/loongson3_bootp.h
new file mode 100644
index 00000000000..09f8480abff
--- /dev/null
+++ b/hw/mips/loongson3_bootp.h
@@ -0,0 +1,241 @@
+/*
+ * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) data structures
+ * defined at arch/mips/include/asm/mach-loongson64/boot_param.h in Linux kernel
+ *
+ * Copyright (c) 2017-2020 Huacai Chen (chenhc@lemote.com)
+ * Copyright (c) 2017-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <https://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MIPS_LOONGSON3_BOOTP_H
+#define HW_MIPS_LOONGSON3_BOOTP_H
+
+struct efi_memory_map_loongson {
+    uint16_t vers;               /* version of efi_memory_map */
+    uint32_t nr_map;             /* number of memory_maps */
+    uint32_t mem_freq;           /* memory frequence */
+    struct mem_map {
+        uint32_t node_id;        /* node_id which memory attached to */
+        uint32_t mem_type;       /* system memory, pci memory, pci io, etc. */
+        uint64_t mem_start;      /* memory map start address */
+        uint32_t mem_size;       /* each memory_map size, not the total size */
+    } map[128];
+} QEMU_PACKED;
+
+enum loongson_cpu_type {
+    Legacy_2E = 0x0,
+    Legacy_2F = 0x1,
+    Legacy_3A = 0x2,
+    Legacy_3B = 0x3,
+    Legacy_1A = 0x4,
+    Legacy_1B = 0x5,
+    Legacy_2G = 0x6,
+    Legacy_2H = 0x7,
+    Loongson_1A = 0x100,
+    Loongson_1B = 0x101,
+    Loongson_2E = 0x200,
+    Loongson_2F = 0x201,
+    Loongson_2G = 0x202,
+    Loongson_2H = 0x203,
+    Loongson_3A = 0x300,
+    Loongson_3B = 0x301
+};
+
+/*
+ * Capability and feature descriptor structure for MIPS CPU
+ */
+struct efi_cpuinfo_loongson {
+    uint16_t vers;               /* version of efi_cpuinfo_loongson */
+    uint32_t processor_id;       /* PRID, e.g. 6305, 6306 */
+    uint32_t cputype;            /* Loongson_3A/3B, etc. */
+    uint32_t total_node;         /* num of total numa nodes */
+    uint16_t cpu_startup_core_id;   /* Boot core id */
+    uint16_t reserved_cores_mask;
+    uint32_t cpu_clock_freq;     /* cpu_clock */
+    uint32_t nr_cpus;
+    char cpuname[64];
+} QEMU_PACKED;
+
+#define MAX_UARTS 64
+struct uart_device {
+    uint32_t iotype;
+    uint32_t uartclk;
+    uint32_t int_offset;
+    uint64_t uart_base;
+} QEMU_PACKED;
+
+#define MAX_SENSORS 64
+#define SENSOR_TEMPER  0x00000001
+#define SENSOR_VOLTAGE 0x00000002
+#define SENSOR_FAN     0x00000004
+struct sensor_device {
+    char name[32];  /* a formal name */
+    char label[64]; /* a flexible description */
+    uint32_t type;       /* SENSOR_* */
+    uint32_t id;         /* instance id of a sensor-class */
+    uint32_t fan_policy; /* step speed or constant speed */
+    uint32_t fan_percent;/* only for constant speed policy */
+    uint64_t base_addr;  /* base address of device registers */
+} QEMU_PACKED;
+
+struct system_loongson {
+    uint16_t vers;               /* version of system_loongson */
+    uint32_t ccnuma_smp;         /* 0: no numa; 1: has numa */
+    uint32_t sing_double_channel;/* 1: single; 2: double */
+    uint32_t nr_uarts;
+    struct uart_device uarts[MAX_UARTS];
+    uint32_t nr_sensors;
+    struct sensor_device sensors[MAX_SENSORS];
+    char has_ec;
+    char ec_name[32];
+    uint64_t ec_base_addr;
+    char has_tcm;
+    char tcm_name[32];
+    uint64_t tcm_base_addr;
+    uint64_t workarounds;
+    uint64_t of_dtb_addr; /* NULL if not support */
+} QEMU_PACKED;
+
+struct irq_source_routing_table {
+    uint16_t vers;
+    uint16_t size;
+    uint16_t rtr_bus;
+    uint16_t rtr_devfn;
+    uint32_t vendor;
+    uint32_t device;
+    uint32_t PIC_type;           /* conform use HT or PCI to route to CPU-PIC */
+    uint64_t ht_int_bit;         /* 3A: 1<<24; 3B: 1<<16 */
+    uint64_t ht_enable;          /* irqs used in this PIC */
+    uint32_t node_id;            /* node id: 0x0-0; 0x1-1; 0x10-2; 0x11-3 */
+    uint64_t pci_mem_start_addr;
+    uint64_t pci_mem_end_addr;
+    uint64_t pci_io_start_addr;
+    uint64_t pci_io_end_addr;
+    uint64_t pci_config_addr;
+    uint16_t dma_mask_bits;
+    uint16_t dma_noncoherent;
+} QEMU_PACKED;
+
+struct interface_info {
+    uint16_t vers;               /* version of the specificition */
+    uint16_t size;
+    uint8_t  flag;
+    char description[64];
+} QEMU_PACKED;
+
+#define MAX_RESOURCE_NUMBER 128
+struct resource_loongson {
+    uint64_t start;              /* resource start address */
+    uint64_t end;                /* resource end address */
+    char name[64];
+    uint32_t flags;
+};
+
+struct archdev_data {};          /* arch specific additions */
+
+struct board_devices {
+    char name[64];               /* hold the device name */
+    uint32_t num_resources;      /* number of device_resource */
+    /* for each device's resource */
+    struct resource_loongson resource[MAX_RESOURCE_NUMBER];
+    /* arch specific additions */
+    struct archdev_data archdata;
+};
+
+struct loongson_special_attribute {
+    uint16_t vers;               /* version of this special */
+    char special_name[64];       /* special_atribute_name */
+    uint32_t loongson_special_type; /* type of special device */
+    /* for each device's resource */
+    struct resource_loongson resource[MAX_RESOURCE_NUMBER];
+};
+
+struct loongson_params {
+    uint64_t memory_offset;      /* efi_memory_map_loongson struct offset */
+    uint64_t cpu_offset;         /* efi_cpuinfo_loongson struct offset */
+    uint64_t system_offset;      /* system_loongson struct offset */
+    uint64_t irq_offset;         /* irq_source_routing_table struct offset */
+    uint64_t interface_offset;   /* interface_info struct offset */
+    uint64_t special_offset;     /* loongson_special_attribute struct offset */
+    uint64_t boarddev_table_offset;  /* board_devices offset */
+};
+
+struct smbios_tables {
+    uint16_t vers;               /* version of smbios */
+    uint64_t vga_bios;           /* vga_bios address */
+    struct loongson_params lp;
+};
+
+struct efi_reset_system_t {
+    uint64_t ResetCold;
+    uint64_t ResetWarm;
+    uint64_t ResetType;
+    uint64_t Shutdown;
+    uint64_t DoSuspend; /* NULL if not support */
+};
+
+struct efi_loongson {
+    uint64_t mps;                /* MPS table */
+    uint64_t acpi;               /* ACPI table (IA64 ext 0.71) */
+    uint64_t acpi20;             /* ACPI table (ACPI 2.0) */
+    struct smbios_tables smbios; /* SM BIOS table */
+    uint64_t sal_systab;         /* SAL system table */
+    uint64_t boot_info;          /* boot info table */
+};
+
+struct boot_params {
+    struct efi_loongson efi;
+    struct efi_reset_system_t reset_system;
+};
+
+/* Overall MMIO & Memory layout */
+enum {
+    VIRT_LOWMEM,
+    VIRT_PM,
+    VIRT_FW_CFG,
+    VIRT_RTC,
+    VIRT_PCIE_PIO,
+    VIRT_PCIE_ECAM,
+    VIRT_BIOS_ROM,
+    VIRT_UART,
+    VIRT_LIOINTC,
+    VIRT_PCIE_MMIO,
+    VIRT_HIGHMEM
+};
+
+/* Low MEM layout for QEMU kernel loader */
+enum {
+    LOADER_KERNEL,
+    LOADER_INITRD,
+    LOADER_CMDLINE
+};
+
+/* BIOS ROM layout for QEMU kernel loader */
+enum {
+    LOADER_BOOTROM,
+    LOADER_PARAM,
+};
+
+struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+};
+
+extern const struct MemmapEntry virt_memmap[];
+void init_loongson_params(struct loongson_params *lp, void *p,
+                          uint64_t cpu_freq, uint64_t ram_size);
+void init_reset_system(struct efi_reset_system_t *reset);
+
+#endif
diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
new file mode 100644
index 00000000000..f99af229327
--- /dev/null
+++ b/hw/mips/loongson3_bootp.c
@@ -0,0 +1,151 @@
+/*
+ * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) helpers
+ *
+ * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
+ * Copyright (c) 2018-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <https://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
+#include "cpu.h"
+#include "hw/boards.h"
+#include "hw/mips/loongson3_bootp.h"
+
+#define LOONGSON3_CORE_PER_NODE 4
+
+static void init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
+{
+    struct efi_cpuinfo_loongson *c = g_cpuinfo;
+
+    c->cputype = cpu_to_le32(Loongson_3A);
+    c->processor_id = cpu_to_le32(MIPS_CPU(first_cpu)->env.CP0_PRid);
+    if (cpu_freq > UINT_MAX) {
+        c->cpu_clock_freq = cpu_to_le32(UINT_MAX);
+    } else {
+        c->cpu_clock_freq = cpu_to_le32(cpu_freq);
+    }
+
+    c->cpu_startup_core_id = cpu_to_le16(0);
+    c->nr_cpus = cpu_to_le32(current_machine->smp.cpus);
+    c->total_node = cpu_to_le32(DIV_ROUND_UP(current_machine->smp.cpus,
+                                             LOONGSON3_CORE_PER_NODE));
+}
+
+static void init_memory_map(void *g_map, uint64_t ram_size)
+{
+    struct efi_memory_map_loongson *emap = g_map;
+
+    emap->nr_map = cpu_to_le32(2);
+    emap->mem_freq = cpu_to_le32(300000000);
+
+    emap->map[0].node_id = cpu_to_le32(0);
+    emap->map[0].mem_type = cpu_to_le32(1);
+    emap->map[0].mem_start = cpu_to_le64(0x0);
+    emap->map[0].mem_size = cpu_to_le32(240);
+
+    emap->map[1].node_id = cpu_to_le32(0);
+    emap->map[1].mem_type = cpu_to_le32(2);
+    emap->map[1].mem_start = cpu_to_le64(0x90000000);
+    emap->map[1].mem_size = cpu_to_le32((ram_size / MiB) - 256);
+}
+
+static void init_system_loongson(void *g_system)
+{
+    struct system_loongson *s = g_system;
+
+    s->ccnuma_smp = cpu_to_le32(0);
+    s->sing_double_channel = cpu_to_le32(1);
+    s->nr_uarts = cpu_to_le32(1);
+    s->uarts[0].iotype = cpu_to_le32(2);
+    s->uarts[0].int_offset = cpu_to_le32(2);
+    s->uarts[0].uartclk = cpu_to_le32(25000000); /* Random value */
+    s->uarts[0].uart_base = cpu_to_le64(virt_memmap[VIRT_UART].base);
+}
+
+static void init_irq_source(void *g_irq_source)
+{
+    struct irq_source_routing_table *irq_info = g_irq_source;
+
+    irq_info->node_id = cpu_to_le32(0);
+    irq_info->PIC_type = cpu_to_le32(0);
+    irq_info->dma_mask_bits = cpu_to_le16(64);
+    irq_info->pci_mem_start_addr = cpu_to_le64(virt_memmap[VIRT_PCIE_MMIO].base);
+    irq_info->pci_mem_end_addr = cpu_to_le64(virt_memmap[VIRT_PCIE_MMIO].base +
+                                             virt_memmap[VIRT_PCIE_MMIO].size - 1);
+    irq_info->pci_io_start_addr = cpu_to_le64(virt_memmap[VIRT_PCIE_PIO].base);
+}
+
+static void init_interface_info(void *g_interface)
+{
+    struct interface_info *interface = g_interface;
+
+    interface->vers = cpu_to_le16(0x01);
+    strpadcpy(interface->description, 64, "UEFI_Version_v1.0", '\0');
+}
+
+static void board_devices_info(void *g_board)
+{
+    struct board_devices *bd = g_board;
+
+    strpadcpy(bd->name, 64, "Loongson-3A-VIRT-1w-V1.00-demo", '\0');
+}
+
+static void init_special_info(void *g_special)
+{
+    struct loongson_special_attribute *special = g_special;
+
+    strpadcpy(special->special_name, 64, "2018-05-01", '\0');
+}
+
+void init_loongson_params(struct loongson_params *lp, void *p,
+                          uint64_t cpu_freq, uint64_t ram_size)
+{
+    init_cpu_info(p, cpu_freq);
+    lp->cpu_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct efi_cpuinfo_loongson), 64);
+
+    init_memory_map(p, ram_size);
+    lp->memory_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct efi_memory_map_loongson), 64);
+
+    init_system_loongson(p);
+    lp->system_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct system_loongson), 64);
+
+    init_irq_source(p);
+    lp->irq_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct irq_source_routing_table), 64);
+
+    init_interface_info(p);
+    lp->interface_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct interface_info), 64);
+
+    board_devices_info(p);
+    lp->boarddev_table_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct board_devices), 64);
+
+    init_special_info(p);
+    lp->special_offset = cpu_to_le64((uintptr_t)p - (uintptr_t)lp);
+    p += ROUND_UP(sizeof(struct loongson_special_attribute), 64);
+}
+
+void init_reset_system(struct efi_reset_system_t *reset)
+{
+    reset->Shutdown = cpu_to_le64(0xffffffffbfc000a8);
+    reset->ResetCold = cpu_to_le64(0xffffffffbfc00080);
+    reset->ResetWarm = cpu_to_le64(0xffffffffbfc00080);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 42fedf91e75..29c5e3b13c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1159,6 +1159,8 @@ M: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Maintained
 F: hw/intc/loongson_liointc.c
+F: hw/mips/loongson3_bootp.c
+F: hw/mips/loongson3_bootp.h
 
 Boston
 M: Paul Burton <paulburton@kernel.org>
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index ca5e4d0f943..b06329f7ff7 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -2,6 +2,7 @@
 mips_ss.add(files('mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
+mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
 mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
-- 
2.26.2


