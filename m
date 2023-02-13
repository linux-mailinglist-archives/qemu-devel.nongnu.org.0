Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4EF6941DE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:49:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOq-0008V9-0R; Mon, 13 Feb 2023 04:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOR-0007qF-6L
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:07 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOK-0002kj-BL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281496; x=1707817496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vkGWAxNJmwXw+eeaw+ADv9h+5/+621sGEzCDxA+ftlQ=;
 b=FsP1smYY9fokrhYEJu2J5DI1UIvdc2XmdMbD3u4+tmWyBsaXP7o2u9hA
 tLy1Jsi33hesNsT/ijmHyXkrIDviJNws0mtqHOYkV+itMxWGeTOmCbkO5
 sG3OtTICXZLSSG4gZC5dqmHKmgAtLhhWBZ4DYR+tlC3JOcK1yNUYID9UF
 DviMb3lYMNgNRNsise72RMfZIbFQmVtqyvhqCA23W2GcPYdNoKFh5+aRZ
 snril21+KF21+TMKzlGIYXiBlwLu5ywXd9pvqjGS9NeabjYorD8Rt1QCU
 5gex0jQPQWjAJDdZa8CWfxbQTgv8BTUQY5GdzOhQkIwfzwlTEzeqpkDSG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486759"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486759"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760565"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760565"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:35 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>
Subject: [RFC 24/52] loongarch: Replace MachineState.smp access with topology
 helpers
Date: Mon, 13 Feb 2023 17:50:07 +0800
Message-Id: <20230213095035.158240-25-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

When MachineState.topo is introduced, the topology related structures
become complicated. So we wrapped the access to topology fields of
MachineState.topo into some helpers, and we are using these helpers
to replace the use of MachineState.smp.

Before loongarch supports hybrid, here we use smp-specific interface to
get "threads per core" and "cores per cluster".

For other cases, it's straightforward to replace topology access with
wrapped generic interfaces.

Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/loongarch/acpi-build.c |  4 ++--
 hw/loongarch/fw_cfg.c     |  4 ++--
 hw/loongarch/virt.c       | 30 ++++++++++++++++--------------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index f551296a0e07..87fa5f0836f8 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -116,7 +116,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
     build_append_int_noprefix(table_data, 0, 4);
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(ms); i++) {
         /* Processor Core Interrupt Controller Structure */
         build_append_int_noprefix(table_data, 17, 1);    /* Type */
         build_append_int_noprefix(table_data, 15, 1);    /* Length */
@@ -168,7 +168,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_append_int_noprefix(table_data, 1, 4); /* Reserved */
     build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
-    for (i = 0; i < ms->smp.cpus; ++i) {
+    for (i = 0; i < machine_topo_get_cpus(ms); ++i) {
         /* Processor Local APIC/SAPIC Affinity Structure */
         build_append_int_noprefix(table_data, 0, 1);  /* Type  */
         build_append_int_noprefix(table_data, 16, 1); /* Length */
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
index f15a17416c48..a9c1762a1681 100644
--- a/hw/loongarch/fw_cfg.c
+++ b/hw/loongarch/fw_cfg.c
@@ -20,8 +20,8 @@ static void fw_cfg_boot_set(void *opaque, const char *boot_device,
 FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
 {
     FWCfgState *fw_cfg;
-    int max_cpus = ms->smp.max_cpus;
-    int smp_cpus = ms->smp.cpus;
+    int max_cpus = machine_topo_get_max_cpus(ms);
+    int smp_cpus = machine_topo_get_cpus(ms);
 
     fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8,
                                   VIRT_FWCFG_BASE + 16, &address_space_memory);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 66be9250684e..475b82d283bf 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -152,7 +152,9 @@ static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
 {
     int num;
     const MachineState *ms = MACHINE(lams);
-    int smp_cpus = ms->smp.cpus;
+    int smp_cpus = machine_topo_get_cpus(ms);
+    int smp_cores = machine_topo_get_smp_cores(ms);
+    int smp_threads = machine_topo_get_smp_threads(ms);
 
     qemu_fdt_add_subnode(ms->fdt, "/cpus");
     qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
@@ -180,17 +182,17 @@ static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
         char *cpu_path = g_strdup_printf("/cpus/cpu@%d", num);
         char *map_path;
 
-        if (ms->smp.threads > 1) {
+        if (smp_threads > 1) {
             map_path = g_strdup_printf(
                 "/cpus/cpu-map/socket%d/core%d/thread%d",
-                num / (ms->smp.cores * ms->smp.threads),
-                (num / ms->smp.threads) % ms->smp.cores,
-                num % ms->smp.threads);
+                num / (smp_cores * smp_threads),
+                (num / smp_threads) % smp_cores,
+                num % smp_threads);
         } else {
             map_path = g_strdup_printf(
                 "/cpus/cpu-map/socket%d/core%d",
-                num / ms->smp.cores,
-                num % ms->smp.cores);
+                num / smp_cores,
+                num % smp_cores);
         }
         qemu_fdt_add_path(ms->fdt, map_path);
         qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
@@ -553,7 +555,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     LoongArchCPU *lacpu;
     CPULoongArchState *env;
     CPUState *cpu_state;
-    int cpu, pin, i, start, num;
+    int cpu, pin, i, start, num, smp_cpus = machine_topo_get_cpus(ms);
 
     ipi = qdev_new(TYPE_LOONGARCH_IPI);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
@@ -582,7 +584,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
      * | UARTs  | | Devices | | Devices |
      * +--------+ +---------+ +---------+
      */
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    for (cpu = 0; cpu < smp_cpus; cpu++) {
         cpu_state = qemu_get_cpu(cpu);
         cpudev = DEVICE(cpu_state);
         lacpu = LOONGARCH_CPU(cpu_state);
@@ -607,7 +609,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
      * connect ext irq to the cpu irq
      * cpu_pin[9:2] <= intc_pin[7:0]
      */
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    for (cpu = 0; cpu < smp_cpus; cpu++) {
         cpudev = DEVICE(qemu_get_cpu(cpu));
         for (pin = 0; pin < LS3A_INTC_IP; pin++) {
             qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
@@ -736,7 +738,7 @@ static void loongarch_direct_kernel_boot(LoongArchMachineState *lams)
 
     kernel_addr = load_kernel_info();
     if (!machine->firmware) {
-        for (i = 0; i < machine->smp.cpus; i++) {
+        for (i = 0; i < machine_topo_get_cpus(machine); i++) {
             lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
             lacpu->env.load_elf = true;
             lacpu->env.elf_address = kernel_addr;
@@ -753,7 +755,7 @@ static void loongarch_init(MachineState *machine)
     uint64_t highram_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
-    int i;
+    int i, smp_cpus = machine_topo_get_cpus(machine);
     hwaddr fdt_base;
 
     if (!cpu_model) {
@@ -771,7 +773,7 @@ static void loongarch_init(MachineState *machine)
     }
     create_fdt(lams);
     /* Init CPUs */
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < smp_cpus; i++) {
         cpu_create(machine->cpu_type);
     }
     fdt_add_cpu_nodes(lams);
@@ -846,7 +848,7 @@ static void loongarch_init(MachineState *machine)
     }
     fdt_add_flash_node(lams);
     /* register reset function */
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < smp_cpus; i++) {
         lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
         qemu_register_reset(reset_load_elf, lacpu);
     }
-- 
2.34.1


