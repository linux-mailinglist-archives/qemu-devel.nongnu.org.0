Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE39E251F75
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:03:14 +0200 (CEST)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAeDx-0000Lm-QV
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=49978a6e9=alistair.francis@wdc.com>)
 id 1kAe9w-0003bu-Tp
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:59:04 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=49978a6e9=alistair.francis@wdc.com>)
 id 1kAe9t-0002w2-9w
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598381942; x=1629917942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FXTEMtOimnYTDN9cFJCrqlYCDBb3XD0iyFvKg5CoKnE=;
 b=YHPJZbHftZ0CkRGMY4KJ/jqoFodgsKtgPGYp14S5Lu7vMzyYAn6IFeJo
 o5sCJcNvh5uyLExCJf37dV9VxXKcvFFnb8pwAx01+9MjUNAOpDJorUIHm
 mQ2jCkixyQnC9cY6IGMI3s7E35we+1ihm2Vhw4HCa6eZ/XHIwHiACc53S
 warFmwuBjfR0NTSkmEXcb/snAoslCtulLD8kxiWnmbkZebWBKUQ/XAk+g
 eiShoKLVJQg380QIM1wWA8P2qnFiC0hMDo9WYWWWk1wnLiAYqNIefmi/J
 JZFnHtWt6zkQ8YnQfEO9iGSd1NatpgC9GzHxw0n3xWelLGemWWt5IwQhE A==;
IronPort-SDR: XPhZ/ITKabY972aEhD4Kzx9PTWQfVWbifLvPqZFCb9HXSaQEjfAnfEAcqIM0AHJBRYWXUssNaN
 ngfgjHXuYpqDqdHA+V0QDWeHtQKV5Uh053OsBObmbaQ6BLIwc0TWdlWu0wg0dzVww5JhSfCd8a
 CJu9lDc4zEXKbjl8W68UNwPs3IUlC51pgMXNNcD5Mk6R3h/shCXtUrRiZQG7i4PlFycL6pADXv
 vwSOXErqs7pboTbuqntLXstzTeFJGqPSKGpCKv/fe93K8alOe/gtWbOV4no2aQ2oNPDZ2R/H1j
 JFg=
X-IronPort-AV: E=Sophos;i="5.76,353,1592841600"; d="scan'208";a="150145287"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Aug 2020 02:58:56 +0800
IronPort-SDR: y4Y7Af/4DZAVK8ekbyGGP3K+8WNQti7my6VIfVqHJVaoRVwR3Av17oNvSzhrzCyrCM4OEzaEft
 i6yb6RDE2bDA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 11:46:31 -0700
IronPort-SDR: qW8Zz5jJ/OcfaSxP3ovrSJ5FudVa7ivnpLxsD/dWx83h7gvRSFVAgo9H1DSv7Bnr9abKQFQcqu
 SelZuMGU/AKg==
WDCIronportException: Internal
Received: from ind003389.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.59.125])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Aug 2020 11:58:54 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] hw/riscv: virt: Allow creating multiple NUMA sockets
Date: Tue, 25 Aug 2020 11:48:23 -0700
Message-Id: <20200825184836.1282371-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825184836.1282371-1-alistair.francis@wdc.com>
References: <20200825184836.1282371-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=49978a6e9=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 14:58:53
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 alistair.francis@wdc.com, Atish Patra <atish.patra@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We extend RISC-V virt machine to allow creating a multi-socket
machine. Each RISC-V virt machine socket is a NUMA node having
a set of HARTs, a memory instance, a CLINT instance, and a PLIC
instance. Other devices are shared between all sockets. We also
update the generated device tree accordingly.

By default, NUMA multi-socket support is disabled for RISC-V virt
machine. To enable it, users can use "-numa" command-line options
of QEMU.

Example1: For two NUMA nodes with 2 CPUs each, append following
to command-line options: "-smp 4 -numa node -numa node"

Example2: For two NUMA nodes with 1 and 3 CPUs, append following
to command-line options:
"-smp 4 -numa node -numa node -numa cpu,node-id=0,core-id=0 \
-numa cpu,node-id=1,core-id=1 -numa cpu,node-id=1,core-id=2 \
-numa cpu,node-id=1,core-id=3"

The maximum number of sockets in a RISC-V virt machine is 8
but this limit can be changed in future.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Message-Id: <20200616032229.766089-6-anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |   9 +-
 hw/riscv/virt.c         | 526 +++++++++++++++++++++++-----------------
 2 files changed, 306 insertions(+), 229 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e69355efaf..1beacd7666 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -23,6 +23,9 @@
 #include "hw/sysbus.h"
 #include "hw/block/flash.h"
 
+#define VIRT_CPUS_MAX 8
+#define VIRT_SOCKETS_MAX 8
+
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
 #define RISCV_VIRT_MACHINE(obj) \
     OBJECT_CHECK(RISCVVirtState, (obj), TYPE_RISCV_VIRT_MACHINE)
@@ -32,8 +35,8 @@ typedef struct {
     MachineState parent;
 
     /*< public >*/
-    RISCVHartArrayState soc;
-    DeviceState *plic;
+    RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
+    DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
     void *fdt;
@@ -74,6 +77,8 @@ enum {
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
 #define VIRT_PLIC_CONTEXT_BASE 0x200000
 #define VIRT_PLIC_CONTEXT_STRIDE 0x1000
+#define VIRT_PLIC_SIZE(__num_context) \
+    (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8a66f43ee0..6fca513ec9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/sifive_test.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
+#include "hw/riscv/numa.h"
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
@@ -58,7 +59,7 @@ static const struct MemmapEntry {
     [VIRT_RTC] =         {   0x101000,        0x1000 },
     [VIRT_CLINT] =       {  0x2000000,       0x10000 },
     [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
-    [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
+    [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
@@ -179,10 +180,17 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
 {
     void *fdt;
-    int cpu, i;
-    uint32_t *cells;
-    char *nodename;
-    uint32_t plic_phandle, test_phandle, phandle = 1;
+    int i, cpu, socket;
+    MachineState *mc = MACHINE(s);
+    uint64_t addr, size;
+    uint32_t *clint_cells, *plic_cells;
+    unsigned long clint_addr, plic_addr;
+    uint32_t plic_phandle[MAX_NODES];
+    uint32_t cpu_phandle, intc_phandle, test_phandle;
+    uint32_t phandle = 1, plic_mmio_phandle = 1;
+    uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
+    char *mem_name, *cpu_name, *core_name, *intc_name;
+    char *name, *clint_name, *plic_name, *clust_name;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
@@ -203,231 +211,238 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
 
-    nodename = g_strdup_printf("/memory@%lx",
-        (long)memmap[VIRT_DRAM].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        memmap[VIRT_DRAM].base >> 32, memmap[VIRT_DRAM].base,
-        mem_size >> 32, mem_size);
-    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-    g_free(nodename);
-
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
                           SIFIVE_CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+
+    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
+        qemu_fdt_add_subnode(fdt, clust_name);
+
+        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+        clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+            cpu_phandle = phandle++;
 
-    for (cpu = s->soc.num_harts - 1; cpu >= 0; cpu--) {
-        int cpu_phandle = phandle++;
-        int intc_phandle;
-        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
-        char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        char *isa = riscv_isa_string(&s->soc.harts[cpu]);
-        qemu_fdt_add_subnode(fdt, nodename);
+            cpu_name = g_strdup_printf("/cpus/cpu@%d",
+                s->soc[socket].hartid_base + cpu);
+            qemu_fdt_add_subnode(fdt, cpu_name);
 #if defined(TARGET_RISCV32)
-        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
+            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
 #else
-        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
 #endif
-        qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
-        qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
-        qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
-        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
-        qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
-        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
-        intc_phandle = phandle++;
-        qemu_fdt_add_subnode(fdt, intc);
-        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandle);
-        qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
-        qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
-        g_free(isa);
-        g_free(intc);
-        g_free(nodename);
-    }
+            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
+            g_free(name);
+            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
+            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
+            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
+                s->soc[socket].hartid_base + cpu);
+            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
+            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
+            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
+
+            intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
+            qemu_fdt_add_subnode(fdt, intc_name);
+            intc_phandle = phandle++;
+            qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
+            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
+            qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
+
+            clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
+            clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
+            clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
+            clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
+
+            plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
+            plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
+            plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
+            plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
+
+            core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
+            qemu_fdt_add_subnode(fdt, core_name);
+            qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
+
+            g_free(core_name);
+            g_free(intc_name);
+            g_free(cpu_name);
+        }
 
-    /* Add cpu-topology node */
-    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
-    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map/cluster0");
-    for (cpu = s->soc.num_harts - 1; cpu >= 0; cpu--) {
-        char *core_nodename = g_strdup_printf("/cpus/cpu-map/cluster0/core%d",
-                                              cpu);
-        char *cpu_nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
-        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, cpu_nodename);
-        qemu_fdt_add_subnode(fdt, core_nodename);
-        qemu_fdt_setprop_cell(fdt, core_nodename, "cpu", intc_phandle);
-        g_free(core_nodename);
-        g_free(cpu_nodename);
+        addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
+        size = riscv_socket_mem_size(mc, socket);
+        mem_name = g_strdup_printf("/memory@%lx", (long)addr);
+        qemu_fdt_add_subnode(fdt, mem_name);
+        qemu_fdt_setprop_cells(fdt, mem_name, "reg",
+            addr >> 32, addr, size >> 32, size);
+        qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
+        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
+        g_free(mem_name);
+
+        clint_addr = memmap[VIRT_CLINT].base +
+            (memmap[VIRT_CLINT].size * socket);
+        clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
+        qemu_fdt_add_subnode(fdt, clint_name);
+        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
+        qemu_fdt_setprop_cells(fdt, clint_name, "reg",
+            0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
+        qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
+            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
+        g_free(clint_name);
+
+        plic_phandle[socket] = phandle++;
+        plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
+        plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
+        qemu_fdt_add_subnode(fdt, plic_name);
+        qemu_fdt_setprop_cell(fdt, plic_name,
+            "#address-cells", FDT_PLIC_ADDR_CELLS);
+        qemu_fdt_setprop_cell(fdt, plic_name,
+            "#interrupt-cells", FDT_PLIC_INT_CELLS);
+        qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
+        qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
+            plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+        qemu_fdt_setprop_cells(fdt, plic_name, "reg",
+            0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
+        qemu_fdt_setprop_cell(fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
+        riscv_socket_fdt_write_id(mc, fdt, plic_name, socket);
+        qemu_fdt_setprop_cell(fdt, plic_name, "phandle", plic_phandle[socket]);
+        g_free(plic_name);
+
+        g_free(clint_cells);
+        g_free(plic_cells);
+        g_free(clust_name);
     }
 
-    cells =  g_new0(uint32_t, s->soc.num_harts * 4);
-    for (cpu = 0; cpu < s->soc.num_harts; cpu++) {
-        nodename =
-            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
-        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
-        cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
-        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
-        cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
-        g_free(nodename);
-    }
-    nodename = g_strdup_printf("/soc/clint@%lx",
-        (long)memmap[VIRT_CLINT].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,clint0");
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[VIRT_CLINT].base,
-        0x0, memmap[VIRT_CLINT].size);
-    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
-        cells, s->soc.num_harts * sizeof(uint32_t) * 4);
-    g_free(cells);
-    g_free(nodename);
-
-    plic_phandle = phandle++;
-    cells =  g_new0(uint32_t, s->soc.num_harts * 4);
-    for (cpu = 0; cpu < s->soc.num_harts; cpu++) {
-        nodename =
-            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
-        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
-        cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
-        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
-        cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
-        g_free(nodename);
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        if (socket == 0) {
+            plic_mmio_phandle = plic_phandle[socket];
+            plic_virtio_phandle = plic_phandle[socket];
+            plic_pcie_phandle = plic_phandle[socket];
+        }
+        if (socket == 1) {
+            plic_virtio_phandle = plic_phandle[socket];
+            plic_pcie_phandle = plic_phandle[socket];
+        }
+        if (socket == 2) {
+            plic_pcie_phandle = plic_phandle[socket];
+        }
     }
-    nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
-        (long)memmap[VIRT_PLIC].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
-                          FDT_PLIC_ADDR_CELLS);
-    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
-                          FDT_PLIC_INT_CELLS);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
-    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
-        cells, s->soc.num_harts * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[VIRT_PLIC].base,
-        0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
-    plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
-    g_free(cells);
-    g_free(nodename);
+
+    riscv_socket_fdt_write_distance_matrix(mc, fdt);
 
     for (i = 0; i < VIRTIO_COUNT; i++) {
-        nodename = g_strdup_printf("/virtio_mmio@%lx",
+        name = g_strdup_printf("/soc/virtio_mmio@%lx",
             (long)(memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size));
-        qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_string(fdt, nodename, "compatible", "virtio,mmio");
-        qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        qemu_fdt_add_subnode(fdt, name);
+        qemu_fdt_setprop_string(fdt, name, "compatible", "virtio,mmio");
+        qemu_fdt_setprop_cells(fdt, name, "reg",
             0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
             0x0, memmap[VIRT_VIRTIO].size);
-        qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
-        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", VIRTIO_IRQ + i);
-        g_free(nodename);
+        qemu_fdt_setprop_cell(fdt, name, "interrupt-parent",
+            plic_virtio_phandle);
+        qemu_fdt_setprop_cell(fdt, name, "interrupts", VIRTIO_IRQ + i);
+        g_free(name);
     }
 
-    nodename = g_strdup_printf("/soc/pci@%lx",
+    name = g_strdup_printf("/soc/pci@%lx",
         (long) memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
-                          FDT_PCI_ADDR_CELLS);
-    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
-                          FDT_PCI_INT_CELLS);
-    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0x2);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible",
-                            "pci-host-ecam-generic");
-    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
-    qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
-                           memmap[VIRT_PCIE_ECAM].size /
-                               PCIE_MMCFG_SIZE_MIN - 1);
-    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0, memmap[VIRT_PCIE_ECAM].base,
-                           0, memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_cell(fdt, name, "#address-cells", FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(fdt, name, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(fdt, name, "bus-range", 0,
+        memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
+    qemu_fdt_setprop(fdt, name, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, name, "reg", 0,
+        memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
+    qemu_fdt_setprop_sized_cells(fdt, name, "ranges",
         1, FDT_PCI_RANGE_IOPORT, 2, 0,
         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
         1, FDT_PCI_RANGE_MMIO,
         2, memmap[VIRT_PCIE_MMIO].base,
         2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);
-    create_pcie_irq_map(fdt, nodename, plic_phandle);
-    g_free(nodename);
+    create_pcie_irq_map(fdt, name, plic_pcie_phandle);
+    g_free(name);
 
     test_phandle = phandle++;
-    nodename = g_strdup_printf("/test@%lx",
+    name = g_strdup_printf("/soc/test@%lx",
         (long)memmap[VIRT_TEST].base);
-    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_add_subnode(fdt, name);
     {
         const char compat[] = "sifive,test1\0sifive,test0\0syscon";
-        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
+        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
     }
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+    qemu_fdt_setprop_cells(fdt, name, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "phandle", test_phandle);
-    test_phandle = qemu_fdt_get_phandle(fdt, nodename);
-    g_free(nodename);
-
-    nodename = g_strdup_printf("/reboot");
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-reboot");
-    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
-    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_RESET);
-    g_free(nodename);
-
-    nodename = g_strdup_printf("/poweroff");
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-poweroff");
-    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
-    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_PASS);
-    g_free(nodename);
-
-    nodename = g_strdup_printf("/uart@%lx",
-        (long)memmap[VIRT_UART0].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "ns16550a");
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+    qemu_fdt_setprop_cell(fdt, name, "phandle", test_phandle);
+    test_phandle = qemu_fdt_get_phandle(fdt, name);
+    g_free(name);
+
+    name = g_strdup_printf("/soc/reboot");
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_RESET);
+    g_free(name);
+
+    name = g_strdup_printf("/soc/poweroff");
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_PASS);
+    g_free(name);
+
+    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(fdt, name, "reg",
         0x0, memmap[VIRT_UART0].base,
         0x0, memmap[VIRT_UART0].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", UART0_IRQ);
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "interrupts", UART0_IRQ);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
-    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
+    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
     if (cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
-    g_free(nodename);
-
-    nodename = g_strdup_printf("/rtc@%lx",
-        (long)memmap[VIRT_RTC].base);
-    qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible",
-        "google,goldfish-rtc");
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+    g_free(name);
+
+    name = g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "google,goldfish-rtc");
+    qemu_fdt_setprop_cells(fdt, name, "reg",
         0x0, memmap[VIRT_RTC].base,
         0x0, memmap[VIRT_RTC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", RTC_IRQ);
-    g_free(nodename);
-
-    nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(s->fdt, nodename);
-    qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
+    g_free(name);
+
+    name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop_string(s->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(s->fdt, nodename, "bank-width", 4);
-    g_free(nodename);
+    qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
+    g_free(name);
 }
 
-
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
@@ -475,22 +490,101 @@ static void virt_machine_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    char *plic_hart_config;
+    char *plic_hart_config, *soc_name;
     size_t plic_hart_config_len;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
-    int i;
-    unsigned int smp_cpus = machine->smp.cpus;
+    DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
+    int i, j, base_hartid, hart_count;
 
-    /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc,
-                            TYPE_RISCV_HART_ARRAY);
-    object_property_set_str(OBJECT(&s->soc), "cpu-type", machine->cpu_type,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->soc), "num-harts", smp_cpus,
-                            &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_abort);
+    /* Check socket count limit */
+    if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
+        error_report("number of sockets/nodes should be less than %d",
+            VIRT_SOCKETS_MAX);
+        exit(1);
+    }
+
+    /* Initialize sockets */
+    mmio_plic = virtio_plic = pcie_plic = NULL;
+    for (i = 0; i < riscv_socket_count(machine); i++) {
+        if (!riscv_socket_check_hartids(machine, i)) {
+            error_report("discontinuous hartids in socket%d", i);
+            exit(1);
+        }
+
+        base_hartid = riscv_socket_first_hartid(machine, i);
+        if (base_hartid < 0) {
+            error_report("can't find hartid base for socket%d", i);
+            exit(1);
+        }
+
+        hart_count = riscv_socket_hart_count(machine, i);
+        if (hart_count < 0) {
+            error_report("can't find hart count for socket%d", i);
+            exit(1);
+        }
+
+        soc_name = g_strdup_printf("soc%d", i);
+        object_initialize_child(OBJECT(machine), soc_name, &s->soc[i],
+                                TYPE_RISCV_HART_ARRAY);
+        g_free(soc_name);
+        object_property_set_str(OBJECT(&s->soc[i]), "cpu-type",
+                                machine->cpu_type, &error_abort);
+        object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
+                                base_hartid, &error_abort);
+        object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
+                                hart_count, &error_abort);
+        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+
+        /* Per-socket CLINT */
+        sifive_clint_create(
+            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
+            memmap[VIRT_CLINT].size, base_hartid, hart_count,
+            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, true);
+
+        /* Per-socket PLIC hart topology configuration string */
+        plic_hart_config_len =
+            (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
+        plic_hart_config = g_malloc0(plic_hart_config_len);
+        for (j = 0; j < hart_count; j++) {
+            if (j != 0) {
+                strncat(plic_hart_config, ",", plic_hart_config_len);
+            }
+            strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG,
+                plic_hart_config_len);
+            plic_hart_config_len -= (strlen(VIRT_PLIC_HART_CONFIG) + 1);
+        }
+
+        /* Per-socket PLIC */
+        s->plic[i] = sifive_plic_create(
+            memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
+            plic_hart_config, base_hartid,
+            VIRT_PLIC_NUM_SOURCES,
+            VIRT_PLIC_NUM_PRIORITIES,
+            VIRT_PLIC_PRIORITY_BASE,
+            VIRT_PLIC_PENDING_BASE,
+            VIRT_PLIC_ENABLE_BASE,
+            VIRT_PLIC_ENABLE_STRIDE,
+            VIRT_PLIC_CONTEXT_BASE,
+            VIRT_PLIC_CONTEXT_STRIDE,
+            memmap[VIRT_PLIC].size);
+        g_free(plic_hart_config);
+
+        /* Try to use different PLIC instance based device type */
+        if (i == 0) {
+            mmio_plic = s->plic[i];
+            virtio_plic = s->plic[i];
+            pcie_plic = s->plic[i];
+        }
+        if (i == 1) {
+            virtio_plic = s->plic[i];
+            pcie_plic = s->plic[i];
+        }
+        if (i == 2) {
+            pcie_plic = s->plic[i];
+        }
+    }
 
     /* register system main memory (actual RAM) */
     memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
@@ -547,38 +641,14 @@ static void virt_machine_init(MachineState *machine)
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
-    /* create PLIC hart topology configuration string */
-    plic_hart_config_len = (strlen(VIRT_PLIC_HART_CONFIG) + 1) * smp_cpus;
-    plic_hart_config = g_malloc0(plic_hart_config_len);
-    for (i = 0; i < smp_cpus; i++) {
-        if (i != 0) {
-            strncat(plic_hart_config, ",", plic_hart_config_len);
-        }
-        strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG, plic_hart_config_len);
-        plic_hart_config_len -= (strlen(VIRT_PLIC_HART_CONFIG) + 1);
-    }
-
-    /* MMIO */
-    s->plic = sifive_plic_create(memmap[VIRT_PLIC].base,
-        plic_hart_config, 0,
-        VIRT_PLIC_NUM_SOURCES,
-        VIRT_PLIC_NUM_PRIORITIES,
-        VIRT_PLIC_PRIORITY_BASE,
-        VIRT_PLIC_PENDING_BASE,
-        VIRT_PLIC_ENABLE_BASE,
-        VIRT_PLIC_ENABLE_STRIDE,
-        VIRT_PLIC_CONTEXT_BASE,
-        VIRT_PLIC_CONTEXT_STRIDE,
-        memmap[VIRT_PLIC].size);
-    sifive_clint_create(memmap[VIRT_CLINT].base,
-        memmap[VIRT_CLINT].size, 0, smp_cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, true);
+    /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
 
+    /* VirtIO MMIO devices */
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
             memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
-            qdev_get_gpio_in(DEVICE(s->plic), VIRTIO_IRQ + i));
+            qdev_get_gpio_in(DEVICE(virtio_plic), VIRTIO_IRQ + i));
     }
 
     gpex_pcie_init(system_memory,
@@ -587,14 +657,14 @@ static void virt_machine_init(MachineState *machine)
                          memmap[VIRT_PCIE_MMIO].base,
                          memmap[VIRT_PCIE_MMIO].size,
                          memmap[VIRT_PCIE_PIO].base,
-                         DEVICE(s->plic), true);
+                         DEVICE(pcie_plic), true);
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
-        0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
+        0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
-        qdev_get_gpio_in(DEVICE(s->plic), RTC_IRQ));
+        qdev_get_gpio_in(DEVICE(mmio_plic), RTC_IRQ));
 
     virt_flash_create(s);
 
@@ -604,8 +674,6 @@ static void virt_machine_init(MachineState *machine)
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
-
-    g_free(plic_hart_config);
 }
 
 static void virt_machine_instance_init(Object *obj)
@@ -618,9 +686,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
-    mc->max_cpus = 8;
+    mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = VIRT_CPU;
     mc->pci_allow_0_address = true;
+    mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
+    mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
+    mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
+    mc->numa_mem_supported = true;
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-- 
2.28.0


