Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25A1694207
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOl-00088E-Tn; Mon, 13 Feb 2023 04:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOU-0007si-Tw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:10 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOM-0002o2-0C
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281498; x=1707817498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbwYkoMO2zK7AhhXsjOHZu3CL9q7WqKUd31q7m09tSA=;
 b=TRiWwJ7sbPdIzkoOvZmrCzWxRFDxQYQUweJyBs0sZtd8wvEfuupNnI0f
 yeB7D+Duse5Rk4implWbmUeSF4zo2wxO2KtpE6yJsXL61tCZ5S4MA/uCS
 NhvWFpTE4okSgV89GLmZIgzaL97E2nid5IpAwq42UzaaGd/YQe6TZLwnw
 afxcVFdx7HQADFI8xKWR+3hFcqbwtDAsaCwD1tCq8Jg9xC5b8hmi5K/8W
 FRGD2a+WZPP0a6J9Qzdt47FO51A0eJeoh2JdEzerKJ6IKYpy5ecU6Z6+g
 FPFV4KNmmmhzYgZZqB2JGAVIb4stJMZEmKZp05ITThx/jZLz/rha4K/Jr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486770"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486770"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760570"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760570"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:39 -0800
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
 Zhao Liu <zhao1.liu@intel.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC 25/52] mips: Replace MachineState.smp access with topology
 helpers
Date: Mon, 13 Feb 2023 17:50:08 +0800
Message-Id: <20230213095035.158240-26-zhao1.liu@linux.intel.com>
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

For mips, it's straightforward to replace topology access with wrapped
generic interfaces.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/mips/boston.c          |  8 +++++---
 hw/mips/loongson3_bootp.c |  7 ++++---
 hw/mips/loongson3_virt.c  |  8 +++++---
 hw/mips/malta.c           | 10 ++++++----
 4 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a9d87f34378f..d02c88d769d4 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -514,7 +514,7 @@ static const void *create_fdt(BostonState *s,
                               const MemMapEntry *memmap, int *dt_size)
 {
     void *fdt;
-    int cpu;
+    int cpu, smp_cpus;
     MachineState *ms = s->mach;
     uint32_t platreg_ph, gic_ph, clk_ph;
     char *name, *gic_name, *platreg_name, *stdout_name;
@@ -542,7 +542,8 @@ static const void *create_fdt(BostonState *s,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    smp_cpus = machine_topo_get_cpus(ms);
+    for (cpu = 0; cpu < smp_cpus; cpu++) {
         name = g_strdup_printf("/cpus/cpu@%d", cpu);
         qemu_fdt_add_subnode(fdt, name);
         qemu_fdt_setprop_string(fdt, name, "compatible", "img,mips");
@@ -702,7 +703,8 @@ static void boston_mach_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
                             &error_fatal);
-    object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
+    object_property_set_int(OBJECT(&s->cps), "num-vp",
+                            machine_topo_get_cpus(machine),
                             &error_fatal);
     qdev_connect_clock_in(DEVICE(&s->cps), "clk-in",
                           qdev_get_clock_out(dev, "cpu-refclk"));
diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
index f99af229327a..d9a92825ceae 100644
--- a/hw/mips/loongson3_bootp.c
+++ b/hw/mips/loongson3_bootp.c
@@ -40,9 +40,10 @@ static void init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
     }
 
     c->cpu_startup_core_id = cpu_to_le16(0);
-    c->nr_cpus = cpu_to_le32(current_machine->smp.cpus);
-    c->total_node = cpu_to_le32(DIV_ROUND_UP(current_machine->smp.cpus,
-                                             LOONGSON3_CORE_PER_NODE));
+    c->nr_cpus = cpu_to_le32(machine_topo_get_cpus(current_machine));
+    c->total_node =
+        cpu_to_le32(DIV_ROUND_UP(machine_topo_get_cpus(current_machine),
+                                 LOONGSON3_CORE_PER_NODE));
 }
 
 static void init_memory_map(void *g_map, uint64_t ram_size)
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index 25534288dd81..c972bb43a1f7 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -271,8 +271,10 @@ static void fw_conf_init(unsigned long ram_size)
     hwaddr cfg_addr = virt_memmap[VIRT_FW_CFG].base;
 
     fw_cfg = fw_cfg_init_mem_wide(cfg_addr, cfg_addr + 8, 8, 0, NULL);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)current_machine->smp.cpus);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)current_machine->smp.max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS,
+                   (uint16_t)machine_topo_get_cpus(current_machine));
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS,
+                   (uint16_t)machine_topo_get_max_cpus(current_machine));
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
     fw_cfg_add_i32(fw_cfg, FW_CFG_MACHINE_VERSION, 1);
     fw_cfg_add_i64(fw_cfg, FW_CFG_CPU_FREQ, get_cpu_freq_hz());
@@ -528,7 +530,7 @@ static void mips_loongson3_virt_init(MachineState *machine)
     cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
     clock_set_hz(cpuclk, DEF_LOONGSON3_FREQ);
 
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(machine); i++) {
         int ip;
 
         /* init CPUs */
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ec172b111ae4..b3322f74baf5 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -981,7 +981,7 @@ static uint64_t load_kernel(void)
 static void malta_mips_config(MIPSCPU *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
@@ -1045,7 +1045,7 @@ static void create_cpu_without_cps(MachineState *ms, MaltaState *s,
     MIPSCPU *cpu;
     int i;
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(ms); i++) {
         cpu = mips_cpu_create_with_clock(ms->cpu_type, s->cpuclk);
 
         /* Init internal devices */
@@ -1066,7 +1066,8 @@ static void create_cps(MachineState *ms, MaltaState *s,
     object_initialize_child(OBJECT(s), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", ms->cpu_type,
                             &error_fatal);
-    object_property_set_int(OBJECT(&s->cps), "num-vp", ms->smp.cpus,
+    object_property_set_int(OBJECT(&s->cps), "num-vp",
+                            machine_topo_get_cpus(ms),
                             &error_fatal);
     qdev_connect_clock_in(DEVICE(&s->cps), "clk-in", s->cpuclk);
     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
@@ -1080,7 +1081,8 @@ static void create_cps(MachineState *ms, MaltaState *s,
 static void mips_create_cpu(MachineState *ms, MaltaState *s,
                             qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
-    if ((ms->smp.cpus > 1) && cpu_type_supports_cps_smp(ms->cpu_type)) {
+    if ((machine_topo_get_cpus(ms) > 1) &&
+        cpu_type_supports_cps_smp(ms->cpu_type)) {
         create_cps(ms, s, cbus_irq, i8259_irq);
     } else {
         create_cpu_without_cps(ms, s, cbus_irq, i8259_irq);
-- 
2.34.1


