Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C86694209
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNy-00078s-Ru; Mon, 13 Feb 2023 04:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNv-0006uX-Sr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:31 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNq-0002o2-Lt
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281466; x=1707817466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IewrUYoDaqiu4ppkfQzCoIjvC2ZxH4iWD+jUs2qoqkg=;
 b=S0Xv/8gYNfZ3NSQq8w+XBAp5TYJ/ZTvRlU4YLe8l6erpkoSDqE0b6vaX
 c0eihz/8xfFXzHaeVZNwHvKIsG1yRrXosbAF8Gb4vT8fVSTgmjYNBsDpq
 xODgUsYVvE1tZy4gz6ovid+s346hqwppC5VNo0OOZ4AhtwGbcxAEWAQhH
 u+TOu5/JshkiVIZqKJ5/qbSFhN6N9HtKgNw/qImcsAD4iPu+eeRVnksap
 aa2g97+bVQy64K6Em8SW7GbhbWEnb1nEkVsWc8tlUCcEsL+51/j7/HIJ6
 nH/U96mB4A4/D1ApR+C7Sk7qTEIOtm/t0EwRcdYtGfml8RLs4giaZq26Q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486626"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486626"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760088"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760088"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:11 -0800
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
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 19/52] i386: Replace MachineState.smp access with topology
 helpers
Date: Mon, 13 Feb 2023 17:50:02 +0800
Message-Id: <20230213095035.158240-20-zhao1.liu@linux.intel.com>
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

For these i386 codes, it is straightforward to replace topology access
with wrapped interfaces.

Note in x86_cpu_pre_plug(), the caculation of "max_socket" can be
replaced with simpler math, and the calculation of "cores" and "threads"
will use general topology helpers to be compatible with both hybrid
topology and smp topology.

Since X86CPUTopoInfo hasn't supported hybrid case, just use smp specific
helpers to get cores_per_cluster and threads_per_core.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/acpi-build.c        |  2 +-
 hw/i386/kvmvapic.c          |  4 +--
 hw/i386/microvm.c           |  4 +--
 hw/i386/x86.c               | 60 ++++++++++++++++++++-----------------
 hw/i386/xen/xen-hvm.c       |  4 +--
 target/i386/cpu.c           |  3 +-
 target/i386/hax/hax-all.c   |  2 +-
 target/i386/whpx/whpx-all.c |  2 +-
 8 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b67dcbbb37fa..d0971eb4c389 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -157,7 +157,7 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
              * CPUs for more than 8 CPUs, "Clustered Logical" mode has to be
              * used
              */
-            ((ms->smp.max_cpus > 8) ?
+            ((machine_topo_get_max_cpus(ms) > 8) ?
                         (1 << ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL) : 0),
         .int_model = 1 /* Multiple APIC */,
         .rtc_century = RTC_CENTURY,
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 43f8a8f679e3..9def3fcd7629 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -449,7 +449,7 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
     VAPICHandlers *handlers;
     PatchInfo *info;
 
-    if (ms->smp.cpus == 1) {
+    if (machine_topo_get_cpus(ms) == 1) {
         handlers = &s->rom_state.up;
     } else {
         handlers = &s->rom_state.mp;
@@ -759,7 +759,7 @@ static void kvmvapic_vm_state_change(void *opaque, bool running,
     }
 
     if (s->state == VAPIC_ACTIVE) {
-        if (ms->smp.cpus == 1) {
+        if (machine_topo_get_cpus(ms) == 1) {
             run_on_cpu(first_cpu, do_vapic_enable, RUN_ON_CPU_HOST_PTR(s));
         } else {
             zero = g_malloc0(s->rom_state.vapic_size);
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 29f30dd6d34c..8abde895e52d 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -320,8 +320,8 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, machine->smp.cpus);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, machine_topo_get_cpus(machine));
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine_topo_get_max_cpus(machine));
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 20ba2384bbb2..0aa4594455e2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -70,10 +70,10 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
 {
     MachineState *ms = MACHINE(x86ms);
 
-    topo_info->dies_per_pkg = ms->smp.dies;
-    topo_info->modules_per_die = ms->smp.clusters;
-    topo_info->cores_per_module = ms->smp.cores;
-    topo_info->threads_per_core = ms->smp.threads;
+    topo_info->dies_per_pkg = machine_topo_get_dies(ms);
+    topo_info->modules_per_die = machine_topo_get_clusters(ms);
+    topo_info->cores_per_module = machine_topo_get_smp_cores(ms);
+    topo_info->threads_per_core = machine_topo_get_smp_threads(ms);
 }
 
 /*
@@ -126,7 +126,7 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
      * This is used for FW_CFG_MAX_CPUS. See comments on fw_cfg_arch_create().
      */
     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
-                                                      ms->smp.max_cpus - 1) + 1;
+                                machine_topo_get_max_cpus(ms) - 1) + 1;
 
     /*
      * Can we support APIC ID 255 or higher?
@@ -147,7 +147,7 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     }
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(ms); i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
     }
 }
@@ -283,8 +283,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     CPUX86State *env = &cpu->env;
     MachineState *ms = MACHINE(hotplug_dev);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
-    unsigned int smp_cores = ms->smp.cores;
-    unsigned int smp_threads = ms->smp.threads;
     X86CPUTopoInfo topo_info;
 
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
@@ -306,22 +304,22 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
     init_topo_info(&topo_info, x86ms);
 
-    env->nr_dies = ms->smp.dies;
-    env->nr_modules = ms->smp.clusters;
+    env->nr_dies = machine_topo_get_dies(ms);
+    env->nr_modules = machine_topo_get_clusters(ms);
 
     /*
      * If APIC ID is not set,
      * set it based on socket/die/cluster/core/thread properties.
      */
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
-        int max_socket = (ms->smp.max_cpus - 1) / smp_threads / smp_cores /
-                                ms->smp.clusters / ms->smp.dies;
+        int sockets, dies, clusters, cores, threads;
 
         /*
          * die-id was optional in QEMU 4.0 and older, so keep it optional
          * if there's only one die per socket.
          */
-        if (cpu->die_id < 0 && ms->smp.dies == 1) {
+        dies = machine_topo_get_dies(ms);
+        if (cpu->die_id < 0 && dies == 1) {
             cpu->die_id = 0;
         }
 
@@ -329,48 +327,56 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
          * cluster-id was optional in QEMU 8.0 and older, so keep it optional
          * if there's only one cluster per die.
          */
-        if (cpu->cluster_id < 0 && ms->smp.clusters == 1) {
+        clusters = machine_topo_get_clusters(ms);
+        if (cpu->cluster_id < 0 && clusters == 1) {
             cpu->cluster_id = 0;
         }
 
+        sockets = machine_topo_get_sockets(ms);
         if (cpu->socket_id < 0) {
             error_setg(errp, "CPU socket-id is not set");
             return;
-        } else if (cpu->socket_id > max_socket) {
+        } else if (cpu->socket_id > (sockets - 1)) {
             error_setg(errp, "Invalid CPU socket-id: %u must be in range 0:%u",
-                       cpu->socket_id, max_socket);
+                       cpu->socket_id, sockets - 1);
             return;
         }
+
         if (cpu->die_id < 0) {
             error_setg(errp, "CPU die-id is not set");
             return;
-        } else if (cpu->die_id > ms->smp.dies - 1) {
+        } else if (cpu->die_id > (dies - 1)) {
             error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
-                       cpu->die_id, ms->smp.dies - 1);
+                       cpu->die_id, dies - 1);
             return;
         }
+
         if (cpu->cluster_id < 0) {
             error_setg(errp, "CPU cluster-id is not set");
             return;
-        } else if (cpu->cluster_id > ms->smp.clusters - 1) {
+        } else if (cpu->cluster_id > (clusters - 1)) {
             error_setg(errp, "Invalid CPU cluster-id: %u must be in range 0:%u",
-                       cpu->cluster_id, ms->smp.clusters - 1);
+                       cpu->cluster_id, clusters - 1);
             return;
         }
+
+        cores = machine_topo_get_cores(ms, cpu->cluster_id);
         if (cpu->core_id < 0) {
             error_setg(errp, "CPU core-id is not set");
             return;
-        } else if (cpu->core_id > (smp_cores - 1)) {
+        } else if (cpu->core_id > (cores - 1)) {
             error_setg(errp, "Invalid CPU core-id: %u must be in range 0:%u",
-                       cpu->core_id, smp_cores - 1);
+                       cpu->core_id, cores - 1);
             return;
         }
+
+        threads = machine_topo_get_threads(ms, cpu->cluster_id, cpu->core_id);
         if (cpu->thread_id < 0) {
             error_setg(errp, "CPU thread-id is not set");
             return;
-        } else if (cpu->thread_id > (smp_threads - 1)) {
+        } else if (cpu->thread_id > (threads - 1)) {
             error_setg(errp, "Invalid CPU thread-id: %u must be in range 0:%u",
-                       cpu->thread_id, smp_threads - 1);
+                       cpu->thread_id, threads - 1);
             return;
         }
 
@@ -488,7 +494,7 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
 const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
 {
     X86MachineState *x86ms = X86_MACHINE(ms);
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
     X86CPUTopoInfo topo_info;
     int i;
 
@@ -518,11 +524,11 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
                                  &topo_info, &topo_ids);
         ms->possible_cpus->cpus[i].props.has_socket_id = true;
         ms->possible_cpus->cpus[i].props.socket_id = topo_ids.pkg_id;
-        if (ms->smp.dies > 1) {
+        if (machine_topo_get_dies(ms) > 1) {
             ms->possible_cpus->cpus[i].props.has_die_id = true;
             ms->possible_cpus->cpus[i].props.die_id = topo_ids.die_id;
         }
-        if (ms->smp.clusters > 1) {
+        if (machine_topo_get_clusters(ms) > 1) {
             ms->possible_cpus->cpus[i].props.has_cluster_id = true;
             ms->possible_cpus->cpus[i].props.cluster_id = topo_ids.module_id;
         }
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index b9a6f7f5381e..63a430aa7418 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -757,7 +757,7 @@ static ioreq_t *cpu_get_ioreq_from_shared_memory(XenIOState *state, int vcpu)
 static ioreq_t *cpu_get_ioreq(XenIOState *state)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
     int i;
     evtchn_port_t port;
 
@@ -1392,7 +1392,7 @@ static int xen_map_ioreq_server(XenIOState *state)
 void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
     MachineState *ms = MACHINE(pcms);
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
     int i, rc;
     xen_pfn_t ioreq_pfn;
     XenIOState *state;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cf84c720a431..1aeea0e0ac3f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6667,7 +6667,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
-    if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) {
+    if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC ||
+        machine_topo_get_cpus(ms) > 1) {
         x86_cpu_apic_create(cpu, &local_err);
         if (local_err != NULL) {
             goto out;
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 3e5992a63b63..a33a3b6f1456 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -349,7 +349,7 @@ static int hax_init(ram_addr_t ram_size, int max_cpus)
 
 static int hax_accel_init(MachineState *ms)
 {
-    int ret = hax_init(ms->ram_size, (int)ms->smp.max_cpus);
+    int ret = hax_init(ms->ram_size, (int)machine_topo_get_max_cpus(ms));
 
     if (ret && (ret != -ENOSPC)) {
         fprintf(stderr, "No accelerator found.\n");
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index fc349f887e47..fb3332c7b82b 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2605,7 +2605,7 @@ static int whpx_accel_init(MachineState *ms)
     }
 
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
-    prop.ProcessorCount = ms->smp.cpus;
+    prop.ProcessorCount = machine_topo_get_cpus(ms);
     hr = whp_dispatch.WHvSetPartitionProperty(
         whpx->partition,
         WHvPartitionPropertyCodeProcessorCount,
-- 
2.34.1


