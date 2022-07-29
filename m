Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4E585737
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:12:15 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ9S-0005jW-LK
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3u-00036R-7j
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:30 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3r-0001sN-2e
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso6865710pjq.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwhK+uEqsgQFIgeyWnA4c2a6MyqKG9WuVXiIwSR70Dc=;
 b=fmgr/rrchXM4mk3DnimUrENvd6SKgN6mU7K2ceA57/IT2YfWj0S2rdfZnu69YDAGrd
 pvdxEZAPfhI2Gb7y1Cjha7FCUQBnPzT7WStWnFmsXOVJWDoPhLhCg0aBXNy0ecQrvgB4
 pYz4mY/AVK/GfVwyeP1bSDd9/47uL3FO5mfBEXXpXge5fcECGv71hTomluariQ0zMAfD
 aaJtm3yzNfQiFddXWTzKMOYyLJpAuMFzgATfxcKKevFQ7LqM4/Pn/VQIeGqfStwpJGAe
 EZQDbyij0T/VY9qbiyySxUNgJZdPr/BNquqo8j4ujcB3uvwW0XiFGeQHBlgSAA1ffxcP
 ELNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwhK+uEqsgQFIgeyWnA4c2a6MyqKG9WuVXiIwSR70Dc=;
 b=cksZIZBcRUspuuV76FOtg5qEQ8m9gyp638LvIJa4HDfXubrDMcO32qm7Hd9BFgq9QM
 rCHBNQybQIAD6g9uNzJhobagzUREWRkC4wuYEwoIwhPAErm22Q7xO/Xk3pIfqfOCNgOv
 y7rueS1n5Jetd10mu5tQK7SfbEHo+z/DZx+jzUNS069t3m9Lv5diPd1TY9VK3GYScXJl
 CWVxTiMtJtLDz7LMfmWtwU928xONa00smYFnIjRYUSOQKaA6Zr5L7EnASouWWH+PLr+7
 1yreust/HZfKDOCHk7g8MdyX2J/It/zwoUvILDw/woqt6BTXV6q8x6FXlwdqXSCi1q/6
 /1AQ==
X-Gm-Message-State: ACgBeo3ECCUAIzcXh2BaXFHuYt0jomjfa3/u4nfJNwQ/uZBQgVZsx7KS
 RVVXje5DLJfrdp2kpWAgP+rrS0k3Qo/ZWg==
X-Google-Smtp-Source: AA6agR4Wf0kespnaRiRosCc0LQs3cdNXa1osJkIwWyAkPz7/DniIdIHv0+bCxNVe8LVOUFXBji+Plw==
X-Received: by 2002:a17:902:eb81:b0:16d:847a:5f95 with SMTP id
 q1-20020a170902eb8100b0016d847a5f95mr6034447plg.166.1659135985347; 
 Fri, 29 Jul 2022 16:06:25 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g31-20020a63201f000000b0041ae78c3493sm3024009pgg.52.2022.07.29.16.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:25 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 05/11] hw/openrisc: Add PCI bus support to virt
Date: Sat, 30 Jul 2022 08:01:11 +0900
Message-Id: <20220729230117.3768312-6-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is mostly borrowed from xtensa and riscv as examples.  The
create_pcie_irq_map swizzle function is almost and exact copy
but here we use a single cell interrupt, possibly we can make
this generic.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - No changes

 hw/openrisc/Kconfig |   3 +
 hw/openrisc/virt.c  | 160 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 157 insertions(+), 6 deletions(-)

diff --git a/hw/openrisc/Kconfig b/hw/openrisc/Kconfig
index 202134668e..97af258b55 100644
--- a/hw/openrisc/Kconfig
+++ b/hw/openrisc/Kconfig
@@ -7,8 +7,11 @@ config OR1K_SIM
 
 config OR1K_VIRT
     bool
+    imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select PCI
+    select PCI_EXPRESS_GENERIC_BRIDGE
     select GOLDFISH_RTC
     select SERIAL
     select SIFIVE_TEST
diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index 54f2732a6b..9a78234a28 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -17,6 +17,8 @@
 #include "hw/core/split-irq.h"
 #include "hw/openrisc/boot.h"
 #include "hw/misc/sifive_test.h"
+#include "hw/pci/pci.h"
+#include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
 #include "hw/rtc/goldfish_rtc.h"
 #include "hw/sysbus.h"
@@ -47,6 +49,9 @@ typedef struct OR1KVirtState {
 
 enum {
     VIRT_DRAM,
+    VIRT_ECAM,
+    VIRT_MMIO,
+    VIRT_PIO,
     VIRT_TEST,
     VIRT_RTC,
     VIRT_VIRTIO,
@@ -60,6 +65,7 @@ enum {
     VIRT_RTC_IRQ = 3,
     VIRT_VIRTIO_IRQ = 4, /* to 12 */
     VIRTIO_COUNT = 8,
+    VIRT_PCI_IRQ_BASE = 13, /* to 17 */
 };
 
 static const struct MemmapEntry {
@@ -72,6 +78,9 @@ static const struct MemmapEntry {
     [VIRT_RTC] =       { 0x96005000,     0x1000 },
     [VIRT_VIRTIO] =    { 0x97000000,     0x1000 },
     [VIRT_OMPIC] =     { 0x98000000, VIRT_CPUS_MAX * 8 },
+    [VIRT_ECAM] =      { 0x9e000000,  0x1000000 },
+    [VIRT_PIO] =       { 0x9f000000,  0x1000000 },
+    [VIRT_MMIO] =      { 0xa0000000, 0x10000000 },
 };
 
 static struct openrisc_boot_info {
@@ -115,12 +124,12 @@ static qemu_irq get_per_cpu_irq(OpenRISCCPU *cpus[], int num_cpus, int irq_pin)
 static void openrisc_create_fdt(OR1KVirtState *state,
                                 const struct MemmapEntry *memmap,
                                 int num_cpus, uint64_t mem_size,
-                                const char *cmdline)
+                                const char *cmdline,
+                                int32_t *pic_phandle)
 {
     void *fdt;
     int cpu;
     char *nodename;
-    int pic_ph;
 
     fdt = state->fdt = create_device_tree(&state->fdt_size);
     if (!fdt) {
@@ -163,14 +172,14 @@ static void openrisc_create_fdt(OR1KVirtState *state,
 
     nodename = (char *)"/pic";
     qemu_fdt_add_subnode(fdt, nodename);
-    pic_ph = qemu_fdt_alloc_phandle(fdt);
+    *pic_phandle = qemu_fdt_alloc_phandle(fdt);
     qemu_fdt_setprop_string(fdt, nodename, "compatible",
                             "opencores,or1k-pic-level");
     qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", pic_ph);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", *pic_phandle);
 
-    qemu_fdt_setprop_cell(fdt, "/", "interrupt-parent", pic_ph);
+    qemu_fdt_setprop_cell(fdt, "/", "interrupt-parent", *pic_phandle);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     if (cmdline) {
@@ -275,6 +284,7 @@ static void openrisc_virt_test_init(OR1KVirtState *state, hwaddr base,
     g_free(nodename);
 
 }
+
 static void openrisc_virt_rtc_init(OR1KVirtState *state, hwaddr base,
                                    hwaddr size, int num_cpus,
                                    OpenRISCCPU *cpus[], int irq_pin)
@@ -296,6 +306,134 @@ static void openrisc_virt_rtc_init(OR1KVirtState *state, hwaddr base,
     g_free(nodename);
 
 }
+
+static void create_pcie_irq_map(void *fdt, char *nodename, int irq_base,
+                                uint32_t irqchip_phandle)
+{
+    int pin, dev;
+    uint32_t irq_map_stride = 0;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS * 6] = {};
+    uint32_t *irq_map = full_irq_map;
+
+    /*
+     * This code creates a standard swizzle of interrupts such that
+     * each device's first interrupt is based on it's PCI_SLOT number.
+     * (See pci_swizzle_map_irq_fn())
+     *
+     * We only need one entry per interrupt in the table (not one per
+     * possible slot) seeing the interrupt-map-mask will allow the table
+     * to wrap to any number of devices.
+     */
+    for (dev = 0; dev < GPEX_NUM_IRQS; dev++) {
+        int devfn = dev << 3;
+
+        for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
+            int irq_nr = irq_base + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_IRQS);
+            int i = 0;
+
+            /* Fill PCI address cells */
+            irq_map[i++] = cpu_to_be32(devfn << 8);
+            irq_map[i++] = 0;
+            irq_map[i++] = 0;
+
+            /* Fill PCI Interrupt cells */
+            irq_map[i++] = cpu_to_be32(pin + 1);
+
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] = cpu_to_be32(irqchip_phandle);
+            irq_map[i++] = cpu_to_be32(irq_nr);
+
+            if (!irq_map_stride) {
+                irq_map_stride = i;
+            }
+            irq_map += irq_map_stride;
+        }
+    }
+
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                     irq_map_stride * sizeof(uint32_t));
+
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
+                           0x1800, 0, 0, 0x7);
+}
+
+static void openrisc_virt_pcie_init(OR1KVirtState *state,
+                                    hwaddr ecam_base, hwaddr ecam_size,
+                                    hwaddr pio_base, hwaddr pio_size,
+                                    hwaddr mmio_base, hwaddr mmio_size,
+                                    int num_cpus, OpenRISCCPU *cpus[],
+                                    int irq_base, int32_t pic_phandle)
+{
+    void *fdt = state->fdt;
+    char *nodename;
+    MemoryRegion *alias;
+    MemoryRegion *reg;
+    DeviceState *dev;
+    qemu_irq pcie_irq;
+    int i;
+
+    dev = qdev_new(TYPE_GPEX_HOST);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    /* Map ECAM space. */
+    alias = g_new0(MemoryRegion, 1);
+    reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(alias, OBJECT(dev), "pcie-ecam",
+                             reg, 0, ecam_size);
+    memory_region_add_subregion(get_system_memory(), ecam_base, alias);
+
+    /*
+     * Map the MMIO window into system address space so as to expose
+     * the section of PCI MMIO space which starts at the same base address
+     * (ie 1:1 mapping for that part of PCI MMIO space visible through
+     * the window).
+     */
+    alias = g_new0(MemoryRegion, 1);
+    reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(alias, OBJECT(dev), "pcie-mmio",
+                             reg, mmio_base, mmio_size);
+    memory_region_add_subregion(get_system_memory(), mmio_base, alias);
+
+    /* Map IO port space. */
+    alias = g_new0(MemoryRegion, 1);
+    reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 2);
+    memory_region_init_alias(alias, OBJECT(dev), "pcie-pio",
+                             reg, 0, pio_size);
+    memory_region_add_subregion(get_system_memory(), pio_base, alias);
+
+    /* Connect IRQ lines. */
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        pcie_irq = get_per_cpu_irq(cpus, num_cpus, irq_base + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pcie_irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, irq_base + i);
+    }
+
+    nodename = g_strdup_printf("/soc/pci@%" HWADDR_PRIx, ecam_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 3);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 2);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+                            "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
+                           ecam_size / PCIE_MMCFG_SIZE_MIN - 1);
+    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", ecam_base, ecam_size);
+    /* pci-address(3) cpu-address(1) pci-size(2) */
+    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
+                           FDT_PCI_RANGE_IOPORT, 0, 0,
+                           pio_base, 0, pio_size,
+                           FDT_PCI_RANGE_MMIO, 0, mmio_base,
+                           mmio_base, 0, mmio_size);
+
+    create_pcie_irq_map(fdt, nodename, irq_base, pic_phandle);
+    g_free(nodename);
+}
+
 static void openrisc_virt_virtio_init(OR1KVirtState *state, hwaddr base,
                                       hwaddr size, int num_cpus,
                                       OpenRISCCPU *cpus[], int irq_pin)
@@ -333,6 +471,7 @@ static void openrisc_virt_init(MachineState *machine)
     hwaddr load_addr;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
+    int32_t pic_phandle;
 
     assert(smp_cpus >= 1 && smp_cpus <= VIRT_CPUS_MAX);
     for (n = 0; n < smp_cpus; n++) {
@@ -352,7 +491,7 @@ static void openrisc_virt_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0, ram);
 
     openrisc_create_fdt(state, virt_memmap, smp_cpus, machine->ram_size,
-                        machine->kernel_cmdline);
+                        machine->kernel_cmdline, &pic_phandle);
 
     if (smp_cpus > 1) {
         openrisc_virt_ompic_init(state, virt_memmap[VIRT_OMPIC].base,
@@ -371,6 +510,15 @@ static void openrisc_virt_init(MachineState *machine)
                            virt_memmap[VIRT_RTC].size, smp_cpus, cpus,
                            VIRT_RTC_IRQ);
 
+    openrisc_virt_pcie_init(state, virt_memmap[VIRT_ECAM].base,
+                            virt_memmap[VIRT_ECAM].size,
+                            virt_memmap[VIRT_PIO].base,
+                            virt_memmap[VIRT_PIO].size,
+                            virt_memmap[VIRT_MMIO].base,
+                            virt_memmap[VIRT_MMIO].size,
+                            smp_cpus, cpus,
+                            VIRT_PCI_IRQ_BASE, pic_phandle);
+
     for (n = 0; n < VIRTIO_COUNT; n++) {
         openrisc_virt_virtio_init(state, virt_memmap[VIRT_VIRTIO].base
                                          + n * virt_memmap[VIRT_VIRTIO].size,
-- 
2.37.1


