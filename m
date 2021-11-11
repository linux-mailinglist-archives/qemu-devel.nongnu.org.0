Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0844CF61
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:56:49 +0100 (CET)
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzKa-0006Iy-Jv
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz13-0006f4-IV
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54418 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0y-0001tT-AL
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:37 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S32; 
 Thu, 11 Nov 2021 09:36:19 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 30/30] hw/loongarch: Add Numa support.
Date: Thu, 11 Nov 2021 09:35:28 +0800
Message-Id: <1636594528-8175-31-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S32
X-Coremail-Antispam: 1UD129KBjvAXoWfZr1xZr1UCrykKw4DuFy3Jwb_yoW8KF4Uto
 WYyFyYg3yxGrWxursayr4DtrWjgr1v9rZxAa47Aa13uanFy345GFZrKw1Yya1xJFs8KFyU
 J347u3srAa4xt3Wkn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1.From Loongson-3A5000 4 cpus belongs to 1 node.
  Now support mostly 4 nodes 16 cpus.
2.Different nodes access different address spaces. All
  memory access should be handle correctly even nodes
  not assigned memory by numa parameters in the command
  line.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/loongarch_extioi.c         | 76 ++++++++++++++++-----------
 hw/loongarch/acpi-build.c          | 15 +++++-
 hw/loongarch/ipi.c                 |  2 +
 hw/loongarch/ls3a5000_virt.c       | 84 +++++++++++++++++++++++++++++-
 include/hw/intc/loongarch_extioi.h | 10 ++--
 include/hw/loongarch/loongarch.h   | 10 +++-
 target/loongarch/cpu.c             |  1 +
 target/loongarch/cpu.h             |  1 +
 target/loongarch/csr_helper.c      | 15 ++++--
 9 files changed, 174 insertions(+), 40 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 592cd8d1e2..a48f4823ec 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -74,12 +74,14 @@ static void extioi_handler(void *opaque, int irq, int level)
 
 static uint32_t extioi_readb(void *opaque, hwaddr addr)
 {
-    loongarch_extioi *state = opaque;
+    loongarch_extioi **backref = (loongarch_extioi **)opaque;
+    loongarch_extioi *state = *backref;
     unsigned long offset, reg_count;
     uint8_t ret;
-    int cpu;
+    int cpu, node_id;
 
     offset = addr & 0xffff;
+    node_id = (backref - state->backref);
 
     if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
         reg_count = (offset - EXTIOI_ENABLE_START);
@@ -91,7 +93,7 @@ static uint32_t extioi_readb(void *opaque, hwaddr addr)
     } else if ((offset >= EXTIOI_COREISR_START) &&
                (offset < EXTIOI_COREISR_END)) {
         reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        cpu = node_id * 4 + (((offset - EXTIOI_COREISR_START) >> 8) & 0x3);
         ret = state->coreisr_reg8[cpu][reg_count];
     } else if ((offset >= EXTIOI_IPMAP_START) &&
                (offset < EXTIOI_IPMAP_END)) {
@@ -100,7 +102,7 @@ static uint32_t extioi_readb(void *opaque, hwaddr addr)
     } else if ((offset >= EXTIOI_COREMAP_START) &&
                (offset < EXTIOI_COREMAP_END)) {
         reg_count = (offset - EXTIOI_COREMAP_START);
-        ret = state->coremap_reg8[reg_count];
+        ret = state->coremap_reg8[node_id][reg_count];
     } else if ((offset >= EXTIOI_NODETYPE_START) &&
                (offset < EXTIOI_NODETYPE_END)) {
         reg_count = (offset - EXTIOI_NODETYPE_START);
@@ -113,12 +115,14 @@ static uint32_t extioi_readb(void *opaque, hwaddr addr)
 
 static uint32_t extioi_readw(void *opaque, hwaddr addr)
 {
-    loongarch_extioi *state = opaque;
+    loongarch_extioi **backref = (loongarch_extioi **)opaque;
+    loongarch_extioi *state = *backref;
     unsigned long offset, reg_count;
     uint32_t ret;
-    int cpu;
+    int cpu, node_id;
 
     offset = addr & 0xffff;
+    node_id = (backref - state->backref);
 
     if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
         reg_count = (offset - EXTIOI_ENABLE_START) / 4;
@@ -130,7 +134,7 @@ static uint32_t extioi_readw(void *opaque, hwaddr addr)
     } else if ((offset >= EXTIOI_COREISR_START) &&
                (offset < EXTIOI_COREISR_END)) {
         reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        cpu = node_id * 4 + (((offset - EXTIOI_COREISR_START) >> 8) & 0x3);
         ret = state->coreisr_reg32[cpu][reg_count];
     } else if ((offset >= EXTIOI_IPMAP_START) &&
                (offset < EXTIOI_IPMAP_END)) {
@@ -139,7 +143,7 @@ static uint32_t extioi_readw(void *opaque, hwaddr addr)
     } else if ((offset >= EXTIOI_COREMAP_START) &&
                (offset < EXTIOI_COREMAP_END)) {
         reg_count = (offset - EXTIOI_COREMAP_START) / 4;
-        ret = state->coremap_reg32[reg_count];
+        ret = state->coremap_reg32[node_id][reg_count];
     } else if ((offset >= EXTIOI_NODETYPE_START) &&
                (offset < EXTIOI_NODETYPE_END)) {
         reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
@@ -152,12 +156,14 @@ static uint32_t extioi_readw(void *opaque, hwaddr addr)
 
 static uint64_t extioi_readl(void *opaque, hwaddr addr)
 {
-    loongarch_extioi *state = opaque;
+    loongarch_extioi **backref = (loongarch_extioi **)opaque;
+    loongarch_extioi *state = *backref;
     unsigned long offset, reg_count;
     uint64_t ret;
-    int cpu;
+    int cpu, node_id;
 
     offset = addr & 0xffff;
+    node_id = (backref - state->backref);
 
     if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
         reg_count = (offset - EXTIOI_ENABLE_START) / 8;
@@ -169,7 +175,7 @@ static uint64_t extioi_readl(void *opaque, hwaddr addr)
     } else if ((offset >= EXTIOI_COREISR_START) &&
                (offset < EXTIOI_COREISR_END)) {
         reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        cpu = node_id * 4 + (((offset - EXTIOI_COREISR_START) >> 8) & 0x3);
         ret = state->coreisr_reg64[cpu][reg_count];
     } else if ((offset >= EXTIOI_IPMAP_START) &&
                (offset < EXTIOI_IPMAP_END)) {
@@ -177,7 +183,7 @@ static uint64_t extioi_readl(void *opaque, hwaddr addr)
     } else if ((offset >= EXTIOI_COREMAP_START) &&
                (offset < EXTIOI_COREMAP_END)) {
         reg_count = (offset - EXTIOI_COREMAP_START) / 8;
-        ret = state->coremap_reg64[reg_count];
+        ret = state->coremap_reg64[node_id][reg_count];
     } else if ((offset >= EXTIOI_NODETYPE_START) &&
                (offset < EXTIOI_NODETYPE_END)) {
         reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
@@ -190,13 +196,15 @@ static uint64_t extioi_readl(void *opaque, hwaddr addr)
 
 static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
 {
-    loongarch_extioi *state = opaque;
+    loongarch_extioi **backref = (loongarch_extioi **)opaque;
+    loongarch_extioi *state = *backref;
     unsigned long offset, reg_count;
     uint8_t old_data_u8;
-    int cpu, i, ipnum, level, mask, irqnum;
+    int cpu, node_id, i, ipnum, level, mask, irqnum;
 
     offset = addr & 0xffff;
     val = val & 0xffUL;
+    node_id = (backref - state->backref);
 
     if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
         reg_count = (offset - EXTIOI_ENABLE_START);
@@ -234,7 +242,7 @@ static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
     } else if ((offset >= EXTIOI_COREISR_START) &&
                (offset < EXTIOI_COREISR_END)) {
         reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        cpu = node_id * 4 + (((offset - EXTIOI_COREISR_START) >> 8) & 0x3);
 
         /* ext_isr */
         old_data_u8 = state->isr_reg8[reg_count];
@@ -284,8 +292,8 @@ static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
         /* Node map different from kernel */
         if (cpu) {
             cpu = ctz32(cpu);
-            state->coremap_reg8[reg_count] = val;
-            state->sw_coremap[reg_count] = cpu;
+            state->coremap_reg8[node_id][reg_count] = val;
+            state->sw_coremap[reg_count] = node_id * 4 + cpu;
         }
     } else if ((offset >= EXTIOI_NODETYPE_START) &&
                (offset < EXTIOI_NODETYPE_END)) {
@@ -298,11 +306,13 @@ static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
 
 static void extioi_writew(void *opaque, hwaddr addr, uint32_t val)
 {
-    loongarch_extioi *state = opaque;
-    int cpu, level;
+    loongarch_extioi **backref = (loongarch_extioi **)opaque;
+    loongarch_extioi *state = *backref;
+    int cpu, node_id, level;
     uint32_t offset, old_data_u32, reg_count, mask, i;
 
     offset = addr & 0xffff;
+    node_id = (backref - state->backref);
 
     if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
         reg_count = (offset - EXTIOI_ENABLE_START) / 4;
@@ -327,7 +337,7 @@ static void extioi_writew(void *opaque, hwaddr addr, uint32_t val)
     } else if ((offset >= EXTIOI_COREISR_START) &&
                (offset < EXTIOI_COREISR_END)) {
         reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        cpu = node_id * 4 + (((offset - EXTIOI_COREISR_START) >> 8) & 0x3);
 
         /* Ext_isr */
         old_data_u32 = state->isr_reg32[reg_count];
@@ -369,11 +379,13 @@ static void extioi_writew(void *opaque, hwaddr addr, uint32_t val)
 
 static void extioi_writel(void *opaque, hwaddr addr, uint64_t val)
 {
-    loongarch_extioi *state = (loongarch_extioi *)opaque;
-    int cpu, level;
+    loongarch_extioi **backref = (loongarch_extioi **)opaque;
+    loongarch_extioi *state = *backref;
+    int cpu, node_id, level;
     uint64_t offset, old_data_u64, reg_count, mask, i;
 
     offset = addr & 0xffff;
+    node_id = (backref - state->backref);
 
     if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
         reg_count = (offset - EXTIOI_ENABLE_START) / 8;
@@ -397,7 +409,7 @@ static void extioi_writel(void *opaque, hwaddr addr, uint64_t val)
     } else if ((offset >= EXTIOI_COREISR_START) &&
                (offset < EXTIOI_COREISR_END)) {
         reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        cpu = node_id * 4 + (((offset - EXTIOI_COREISR_START) >> 8) & 0x3);
 
         /* core_ext_ioisr */
         old_data_u64 = state->coreisr_reg64[cpu][reg_count];
@@ -488,7 +500,9 @@ static void loongarch_extioi_realize(DeviceState *dev, Error **errp)
     LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
     MachineState *ms = MACHINE(lams);
     loongarch_extioi *p = LOONGARCH_EXTIOI(dev);
-    int cpu, pin;
+    int cpu, pin, id, nb_nodes;
+    char str[16];
+    nb_nodes = (ms->smp.cpus - 1) >> 2;
 
     qdev_init_gpio_in(dev, extioi_setirq, EXTIOI_IRQS);
 
@@ -496,9 +510,13 @@ static void loongarch_extioi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &p->irq[i]);
     }
 
-    memory_region_init_io(&p->mmio, OBJECT(p), &extioi_ops, p,
-                          TYPE_LOONGARCH_EXTIOI, 0x900);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->mmio);
+    for (id = 0; id <= nb_nodes; id++) {
+        p->backref[id] = p;
+        sprintf(str, "extioi%d", id);
+        memory_region_init_io(&p->mmio[id], OBJECT(p), &extioi_ops,
+                              &p->backref[id], str, 0x900);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->mmio[id]);
+    }
 
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
         for (pin = 0; pin < LS3A_INTC_IP; pin++) {
@@ -534,8 +552,8 @@ static const VMStateDescription vmstate_loongarch_extioi = {
                               EXTIOI_IRQS_BITMAP_SIZE),
         VMSTATE_UINT8_ARRAY(ipmap_reg8, loongarch_extioi,
                             EXTIOI_IRQS_IPMAP_SIZE),
-        VMSTATE_UINT8_ARRAY(coremap_reg8, loongarch_extioi,
-                            EXTIOI_IRQS_COREMAP_SIZE),
+        VMSTATE_UINT8_2DARRAY(coremap_reg8, loongarch_extioi,
+                              LS3A_NODES, EXTIOI_IRQS_COREMAP_SIZE),
         VMSTATE_UINT16_ARRAY(nodetype_reg16, loongarch_extioi,
                              EXTIOI_IRQS_NODETYPE_SIZE),
         VMSTATE_UINT8_ARRAY(sw_ipmap, loongarch_extioi, EXTIOI_IRQS),
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 5f1d4070d8..3acc18f74b 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -182,7 +182,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         build_append_int_noprefix(table_data, 0, 1);  /* Type  */
         build_append_int_noprefix(table_data, 16, 1); /* Length */
         /* Proximity Domain [7:0] */
-        build_append_int_noprefix(table_data, 0, 1);
+        build_append_int_noprefix(table_data, core_id >> 2, 1);
         build_append_int_noprefix(table_data, core_id, 1); /* APIC ID */
         /* Flags, Table 5-36 */
         build_append_int_noprefix(table_data, 1, 4);
@@ -202,6 +202,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_srat_memory(table_data, mem_base, mem_len,
                             0, MEM_AFFINITY_ENABLED);
 
+    if (machine->numa_state) {
+        for (i = 1; i < machine->numa_state->num_nodes; ++i) {
+            mem_base = (i << LOONGARCH_NODE_SHIFT) + 0x80000000;
+            mem_len = machine->numa_state->nodes[i].node_mem;
+            build_srat_memory(table_data, mem_base, mem_len,
+                                i, MEM_AFFINITY_ENABLED);
+        }
+    }
     acpi_table_end(linker, &table);
 }
 
@@ -489,6 +497,11 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     acpi_add_table(table_offsets, tables_blob);
     build_srat(tables_blob, tables->linker, machine);
+    if (machine->numa_state->have_numa_distance) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_slit(tables_blob, tables->linker, machine, lams->oem_id,
+                   lams->oem_table_id);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     {
diff --git a/hw/loongarch/ipi.c b/hw/loongarch/ipi.c
index 4902205ff5..74f22cebba 100644
--- a/hw/loongarch/ipi.c
+++ b/hw/loongarch/ipi.c
@@ -122,6 +122,7 @@ static const MemoryRegionOps gipi_ops = {
 
 int cpu_init_ipi(LoongArchMachineState *lams, qemu_irq parent, int cpu)
 {
+    int node_id = cpu / 4;
     int core_num = cpu % 4;
     hwaddr addr;
     MemoryRegion *region;
@@ -135,6 +136,7 @@ int cpu_init_ipi(LoongArchMachineState *lams, qemu_irq parent, int cpu)
     lams->gipi->core[cpu].irq = parent;
 
     addr = SMP_GIPI_MAILBOX + core_num * 0x100;
+    addr = addr + ((unsigned long)node_id << LOONGARCH_NODE_SHIFT);
     region = g_new(MemoryRegion, 1);
     sprintf(str, "gipi%d", cpu);
     memory_region_init_io(region, NULL, &gipi_ops,
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 768af074f4..b3381730b7 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -41,6 +41,38 @@ static struct _loaderparams {
 
 CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
 
+struct la_memmap_entry {
+    uint64_t address;
+    uint64_t length;
+    uint32_t type;
+    uint32_t reserved;
+} ;
+
+static struct la_memmap_entry *la_memmap_table;
+static unsigned la_memmap_entries;
+
+static int la_memmap_add_entry(uint64_t address, uint64_t length, uint32_t type)
+{
+    int i;
+
+    for (i = 0; i < la_memmap_entries; i++) {
+        if (la_memmap_table[i].address == address) {
+            fprintf(stderr, "%s address:0x%lx length:0x%lx already exists\n",
+                     __func__, address, length);
+            return 0;
+        }
+    }
+
+    la_memmap_table = g_renew(struct la_memmap_entry, la_memmap_table,
+                                                      la_memmap_entries + 1);
+    la_memmap_table[la_memmap_entries].address = cpu_to_le64(address);
+    la_memmap_table[la_memmap_entries].length = cpu_to_le64(length);
+    la_memmap_table[la_memmap_entries].type = cpu_to_le32(type);
+    la_memmap_entries++;
+
+    return la_memmap_entries;
+}
+
 static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
 {
     return addr & 0x1fffffffll;
@@ -247,12 +279,17 @@ static DeviceState *ls3a5000_irq_init(MachineState *machine,
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     DeviceState *extioi, *pch_pic, *pch_msi;
     SysBusDevice *d;
-    int cpu, pin, i;
+    int cpu, pin, i, id, node_id;
+    unsigned long base;
+    node_id = (machine->smp.cpus - 1) >> 2;
 
     extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
     d = SYS_BUS_DEVICE(extioi);
     sysbus_realize_and_unref(d, &error_fatal);
-    sysbus_mmio_map_loongarch(d, 0, APIC_BASE, lams->system_iocsr);
+    for (id = 0; id <= node_id; id++) {
+        base = APIC_BASE | (uint64_t)id << LOONGARCH_NODE_SHIFT;
+        sysbus_mmio_map_loongarch(d, id, base, lams->system_iocsr);
+    }
 
     for (i = 0; i < EXTIOI_IRQS; i++) {
         sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
@@ -333,6 +370,7 @@ static void ls3a5000_virt_init(MachineState *machine)
     DeviceState *pch_pic;
     const CPUArchIdList *possible_cpus;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    uint64_t phyAddr = 0;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -362,6 +400,8 @@ static void ls3a5000_virt_init(MachineState *machine)
 
         machine->possible_cpus->cpus[i].cpu = cpuobj;
 
+        numa_cpu_pre_plug(&possible_cpus->cpus[i], DEVICE(cpuobj),
+                          &error_fatal);
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
 
@@ -398,6 +438,22 @@ static void ls3a5000_virt_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x90000000, highmem);
     offset += highram_size;
 
+    if (machine->numa_state) {
+        for (i = 1; i < machine->numa_state->num_nodes; i++) {
+            char *ramName = g_strdup_printf("loongarch.node%d.ram", i);
+            MemoryRegion *noderam = g_new(MemoryRegion, 1);
+            uint64_t node_size = machine->numa_state->nodes[i].node_mem;
+
+            memory_region_init_alias(noderam, NULL, ramName,
+                                    machine->ram, offset, node_size);
+            phyAddr = (((uint64_t)i) << LOONGARCH_NODE_SHIFT) + 0x80000000;
+            memory_region_add_subregion(address_space_mem,
+                                        phyAddr, noderam);
+            la_memmap_add_entry(phyAddr, node_size, SYSTEM_RAM);
+            offset += node_size;
+        }
+    }
+
     /* load the BIOS image. */
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
                               machine->firmware ?: LOONGSON3_BIOSNAME);
@@ -423,6 +479,12 @@ static void ls3a5000_virt_init(MachineState *machine)
         fw_cfg_add_kernel_info(lams->fw_cfg);
     }
 
+    if (lams->fw_cfg != NULL) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
+                        la_memmap_table,
+                        sizeof(struct la_memmap_entry) * (la_memmap_entries));
+    }
+
     memory_region_init_ram(bios, NULL, "loongarch.bios",
                            LA_BIOS_SIZE, &error_fatal);
     memory_region_set_readonly(bios, true);
@@ -529,6 +591,22 @@ static const CPUArchIdList *loongarch_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static CpuInstanceProperties
+loongarch_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+
+    assert(cpu_index < possible_cpus->len);
+    return possible_cpus->cpus[cpu_index].props;
+}
+
+static int64_t loongarch_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    return idx % nb_numa_nodes;
+}
+
 static void loongarch_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -536,6 +614,8 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->desc = "Loongson-5000 LS7A1000 machine";
     mc->init = ls3a5000_virt_init;
     mc->possible_cpu_arch_ids = loongarch_possible_cpu_arch_ids;
+    mc->cpu_index_to_instance_props = loongarch_cpu_index_to_props;
+    mc->get_default_cpu_node_id = loongarch_get_default_cpu_node_id;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
     mc->default_ram_id = "loongarch.ram";
diff --git a/include/hw/intc/loongarch_extioi.h b/include/hw/intc/loongarch_extioi.h
index f6381b6236..b3a046da96 100644
--- a/include/hw/intc/loongarch_extioi.h
+++ b/include/hw/intc/loongarch_extioi.h
@@ -13,6 +13,7 @@
 
 #define LS3A_INTC_IP               8
 #define MAX_CORES                  LOONGARCH_MAX_VCPUS
+#define LS3A_NODES                 4
 #define EXTIOI_IRQS                (256)
 #define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
 /* map to ipnum per 32 irqs */
@@ -75,9 +76,9 @@ typedef struct loongarch_extioi {
         uint8_t ipmap_reg8[EXTIOI_IRQS_IPMAP_SIZE];
     };
     union {
-        uint64_t coremap_reg64[EXTIOI_IRQS_COREMAP_SIZE / 8];
-        uint32_t coremap_reg32[EXTIOI_IRQS_COREMAP_SIZE / 4];
-        uint8_t coremap_reg8[EXTIOI_IRQS_COREMAP_SIZE];
+        uint64_t coremap_reg64[LS3A_NODES][EXTIOI_IRQS_COREMAP_SIZE / 8];
+        uint32_t coremap_reg32[LS3A_NODES][EXTIOI_IRQS_COREMAP_SIZE / 4];
+        uint8_t coremap_reg8[LS3A_NODES][EXTIOI_IRQS_COREMAP_SIZE];
     };
     union {
         uint64_t nodetype_reg64[EXTIOI_IRQS_NODETYPE_SIZE / 4];
@@ -93,7 +94,8 @@ typedef struct loongarch_extioi {
 
     qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
     qemu_irq irq[EXTIOI_IRQS];
-    MemoryRegion mmio;
+    MemoryRegion mmio[LS3A_NODES];
+    struct loongarch_extioi *backref[LS3A_NODES];
 } loongarch_extioi;
 
 #endif /* LOONGARCH_EXTIOI_H */
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index ea80e9f9a1..eafe24716a 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -14,7 +14,7 @@
 #include "qemu/queue.h"
 #include "hw/loongarch/gipi.h"
 
-#define LOONGARCH_MAX_VCPUS     4
+#define LOONGARCH_MAX_VCPUS     16
 #define PM_MMIO_ADDR            0x10080000UL
 #define PM_MMIO_SIZE            0x100
 #define PM_CNT_MODE             0x10
@@ -42,6 +42,14 @@
 #define INITRD_BASE             0x04000000
 #define COMMAND_LINE_SIZE       4096
 
+#define LOONGARCH_NODE_SHIFT    44
+/* Memory types: */
+#define SYSTEM_RAM              1
+#define SYSTEM_RAM_RESERVED     2
+#define ACPI_TABLE              3
+#define ACPI_NVS                4
+#define SYSTEM_PMEM             5
+
 typedef struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index a6010deef0..1c44a12049 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -538,6 +538,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
 static Property loongarch_cpu_properties[] = {
     DEFINE_PROP_INT32("core-id", LoongArchCPU, core_id, -1),
     DEFINE_PROP_UINT32("id", LoongArchCPU, id, UNASSIGNED_CPU_ID),
+    DEFINE_PROP_INT32("node-id", LoongArchCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index b7ef0b8b3c..d72924295e 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -376,6 +376,7 @@ struct LoongArchCPU {
     CPULoongArchState env;
     uint32_t id;
     int32_t core_id;
+    int32_t node_id; /* NUMA node this CPU belongs to */
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index c9e17bed20..1b21654f68 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -242,9 +242,13 @@ uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
 {
     LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
     int cpuid = env_cpu(env)->cpu_index;
+    target_ulong node_addr = (target_ulong)(cpuid & 0x3c) << 42;
+    
 
     if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
-        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
+        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8) + node_addr;
+    } else if (((r_addr & 0xf000) == 0x1000)) {
+        r_addr = r_addr + node_addr;
     }
 
     if (size == 1) {
@@ -269,6 +273,7 @@ void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
     LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
     int cpuid = env_cpu(env)->cpu_index;
     int mask, i;
+    target_ulong node_addr;
 
     /*
      * For IPI send, Mail send, ANY send adjust addr and val
@@ -290,10 +295,11 @@ void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
         val = val >> 32;
         mask = (val >> 27) & 0xf;
         size = 1;
+        node_addr = ((target_ulong)(cpuid & 0x3c) << 42);
 
         for (i = 0; i < 4; i++) {
             if (!((mask >> i) & 1)) {
-                address_space_stb(lams->address_space_iocsr, w_addr,
+                address_space_stb(lams->address_space_iocsr, w_addr + node_addr,
                                   val, MEMTXATTRS_UNSPECIFIED, NULL);
             }
             w_addr = w_addr + 1;
@@ -302,8 +308,11 @@ void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
         return;
     }
 
+    node_addr = (target_ulong)(cpuid & 0x3c) << 42;
     if (((w_addr & 0xff00) == 0x1000) || ((w_addr & 0xff00) == 0x1800)) {
-        w_addr = w_addr + ((target_ulong)(cpuid & 0x3) << 8);
+        w_addr = w_addr + ((target_ulong)(cpuid & 0x3) << 8) + node_addr;
+    } else if (((w_addr & 0xf000) == 0x1000)) {
+        w_addr = w_addr + node_addr;
     }
 
     if (size == 1) {
-- 
2.27.0


