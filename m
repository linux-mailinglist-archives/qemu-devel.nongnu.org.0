Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B856941BE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVP3-0000eq-5V; Mon, 13 Feb 2023 04:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOy-0000VM-2M
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:36 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOp-0002n2-0l
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281527; x=1707817527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7/ZpLgczlG7ZMgWVzSgzCsAV7X8/BemDidEjebu7VRk=;
 b=mDVJlSPGUVixl7KjuKjA7V2JL2jKDb8qYZsFFCbAREo/COSZSkIhL2lV
 7G7qikVQDT4w2yh3kBZ/hJv7H12WHBkQHcDjTKhasx7Boe4klHJvmvcL/
 3rpiMdMUFz24XS+ICnhAu0sOF+V2pmBHAb/G+g4+fFTBpuNSqOcy9Y/Ij
 IiGtNGRV2mxCFD5p3kaV7PDB2IWJyKR+MJfRn3SCoEpi7UTtiDY1o6BX3
 PSl6sq0l1x+kWK+5vmB1h2//a5YwIXO4jcr3YpxFKdc6pOsH6UERAUT+N
 HG8lRsGaTsje15H5ybKXG/H8piAf1kOzwko2zzhuP5ofu8Z726utziWuy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486825"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760586"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760586"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:56 -0800
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
Subject: [RFC 29/52] hw/core/cpu: Introduce TopologyState in CPUState
Date: Mon, 13 Feb 2023 17:50:12 +0800
Message-Id: <20230213095035.158240-30-zhao1.liu@linux.intel.com>
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

MachineState has supported very complete topology levels. Although user
emulator doesn't need more levels than core/thread, we'd better to store
and maintain the complete topology information in CPUState for current
CPU to avoid repeated and redundant topology variables scattered
everywhere.

This is beneficial to drop other duplicate topology variables to prevent
confusion.

Meanwhile, rename topology variables (nr_cores/nr_threads) to better
reflect its own meaning.

Based on this, the CPUX86State.nr_dies/nr_modules will be cleaned up, and
X86CPUTopoInfo will be used exclusively to generate APIC ID.

From then on, MachineState.topo maintains the topology information of the
entire machine, while CPUState.topo maintains the topology information
required by the current CPU.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-common.c                 | 14 ++++++++++++--
 hw/i386/x86.c                        | 10 +++++++---
 hw/mips/malta.c                      | 12 +++++++-----
 include/hw/core/cpu.h                | 26 ++++++++++++++++++++++----
 softmmu/cpus.c                       | 18 +++++++++++++++---
 target/i386/cpu.c                    | 18 +++++++++---------
 target/i386/hvf/x86_emu.c            |  6 ++++--
 target/i386/kvm/kvm.c                |  6 ++++--
 target/i386/tcg/sysemu/misc_helper.c |  2 +-
 target/mips/tcg/sysemu/cp0_helper.c  |  4 ++--
 target/ppc/compat.c                  |  2 +-
 11 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5ccc3837b678..95a42a9dc65c 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -223,6 +223,17 @@ static void cpu_common_unrealizefn(DeviceState *dev)
     cpu_exec_unrealizefn(cpu);
 }
 
+static void cpu_topo_init(CPUState *cpu)
+{
+    cpu->topo.sockets = 1;
+    cpu->topo.cores_per_socket = 1;
+    cpu->topo.threads_per_socket = 1;
+    cpu->topo.dies_per_socket = 1;
+    cpu->topo.clusters_per_die = 1;
+    cpu->topo.cores_per_cluster = 1;
+    cpu->topo.threads_per_core = 1;
+}
+
 static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
@@ -233,8 +244,7 @@ static void cpu_common_initfn(Object *obj)
     cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
     /* *-user doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for softmmu */
-    cpu->nr_cores = 1;
-    cpu->nr_threads = 1;
+    cpu_topo_init(cpu);
     cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 0aa4594455e2..91da2486d99e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -409,12 +409,16 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* if 'address' properties socket-id/core-id/thread-id are not set, set them
+    /*
+     * if 'address' properties socket-id/core-id/thread-id are not set, set them
      * so that machine_query_hotpluggable_cpus would show correct values
      */
-    /* TODO: move socket_id/core_id/thread_id checks into x86_cpu_realizefn()
+    /*
+     * TODO: move socket_id/core_id/thread_id checks into x86_cpu_realizefn()
      * once -smp refactoring is complete and there will be CPU private
-     * CPUState::nr_cores and CPUState::nr_threads fields instead of globals */
+     * CPUState::topo::cores_per_socket and CPUState::topo::threads_per_core
+     * fields instead of globals
+     */
     x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
     if (cpu->socket_id != -1 && cpu->socket_id != topo_ids.pkg_id) {
         error_setg(errp, "property socket-id: %u doesn't match set apic-id:"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index b3322f74baf5..a894401ac9c5 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -986,11 +986,13 @@ static void malta_mips_config(MIPSCPU *cpu)
     CPUState *cs = CPU(cpu);
 
     if (ase_mt_available(env)) {
-        env->mvp->CP0_MVPConf0 = deposit32(env->mvp->CP0_MVPConf0,
-                                           CP0MVPC0_PTC, 8,
-                                           smp_cpus * cs->nr_threads - 1);
-        env->mvp->CP0_MVPConf0 = deposit32(env->mvp->CP0_MVPConf0,
-                                           CP0MVPC0_PVPE, 4, smp_cpus - 1);
+        env->mvp->CP0_MVPConf0 =
+            deposit32(env->mvp->CP0_MVPConf0,
+                      CP0MVPC0_PTC, 8,
+                      smp_cpus * cs->topo.threads_per_core - 1);
+        env->mvp->CP0_MVPConf0 =
+            deposit32(env->mvp->CP0_MVPConf0,
+                      CP0MVPC0_PVPE, 4, smp_cpus - 1);
     }
 }
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5253e4e839bb..957438718e7e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -264,6 +264,26 @@ struct qemu_work_item;
 #define CPU_UNSET_NUMA_NODE_ID -1
 #define CPU_TRACE_DSTATE_MAX_EVENTS 32
 
+/**
+ * TopologyState:
+ * @sockets: Number of sockets within this machine.
+ * @cores_per_socket: Number of cores within this CPU socket.
+ * @threads_per_socket: Number of threads within this CPU socket.
+ * @dies_per_socket: Number of dies within this CPU socket.
+ * @clusters_per_die: Number of clusters within this CPU die.
+ * @cores_per_cluster: Number of cores within this CPU cluster.
+ * @threads_per_core: Number of threads within this CPU core.
+ */
+typedef struct TopologyState {
+    int sockets;
+    int cores_per_socket;
+    int threads_per_socket;
+    int dies_per_socket;
+    int clusters_per_die;
+    int cores_per_cluster;
+    int threads_per_core;
+} TopologyState;
+
 /**
  * CPUState:
  * @cpu_index: CPU index (informative).
@@ -273,8 +293,7 @@ struct qemu_work_item;
  *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
  *   QOM parent.
  * @tcg_cflags: Pre-computed cflags for this cpu.
- * @nr_cores: Number of cores within this CPU package.
- * @nr_threads: Number of threads within this CPU core.
+ * @topo: Topology information of this cpu.
  * @running: #true if CPU is currently running (lockless).
  * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
  * valid under cpu_list_lock.
@@ -327,8 +346,7 @@ struct CPUState {
     CPUClass *cc;
     /*< public >*/
 
-    int nr_cores;
-    int nr_threads;
+    TopologyState topo;
 
     struct QemuThread *thread;
 #ifdef _WIN32
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7892da9c82b5..da2e076d51b2 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -626,12 +626,24 @@ const AccelOpsClass *cpus_get_accel(void)
     return cpus_accel;
 }
 
-void qemu_init_vcpu(CPUState *cpu)
+static void qemu_init_vcpu_topo(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
-    cpu->nr_cores = machine_topo_get_cores_per_socket(ms);
-    cpu->nr_threads = machine_topo_get_threads_by_idx(ms, cpu->cpu_index);
+    cpu->topo.sockets = machine_topo_get_sockets(ms);
+    cpu->topo.cores_per_socket = machine_topo_get_cores_per_socket(ms);
+    cpu->topo.threads_per_socket = machine_topo_get_threads_per_socket(ms);
+    cpu->topo.dies_per_socket = machine_topo_get_dies(ms);
+    cpu->topo.clusters_per_die = machine_topo_get_clusters(ms);
+    cpu->topo.cores_per_cluster =
+        machine_topo_get_cores_by_idx(ms, cpu->cpu_index);
+    cpu->topo.threads_per_core =
+        machine_topo_get_threads_by_idx(ms, cpu->cpu_index);
+}
+
+void qemu_init_vcpu(CPUState *cpu)
+{
+    qemu_init_vcpu_topo(cpu);
     cpu->stopped = true;
     cpu->random_seed = qemu_guest_random_seed_thread_part1();
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1aeea0e0ac3f..fcea4ea1a7e2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5259,13 +5259,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     X86CPUTopoInfo topo_info;
     uint32_t cpus_per_pkg;
 
-    topo_info.dies_per_pkg = env->nr_dies;
-    topo_info.modules_per_die = env->nr_modules;
-    topo_info.cores_per_module = cs->nr_cores / env->nr_dies / env->nr_modules;
-    topo_info.threads_per_core = cs->nr_threads;
+    topo_info.dies_per_pkg = cs->topo.dies_per_socket;
+    topo_info.modules_per_die = cs->topo.clusters_per_die;
+    topo_info.cores_per_module = cs->topo.cores_per_cluster;
+    topo_info.threads_per_core = cs->topo.threads_per_core;
 
-    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.modules_per_die *
-                   topo_info.cores_per_module * topo_info.threads_per_core;
+    cpus_per_pkg = cs->topo.threads_per_socket;
 
     /* Calculate & apply limits for different index ranges */
     if (index >= 0xC0000000) {
@@ -6687,14 +6686,15 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
      * users a warning.
      *
      * NOTE: the following code has to follow qemu_init_vcpu(). Otherwise
-     * cs->nr_threads hasn't be populated yet and the checking is incorrect.
+     * cs->topo.threads_per_core hasn't be populated yet and the checking is
+     * incorrect.
      */
     if (IS_AMD_CPU(env) &&
         !(env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_TOPOEXT) &&
-        cs->nr_threads > 1 && !ht_warned) {
+        cs->topo.threads_per_core > 1 && !ht_warned) {
             warn_report("This family of AMD CPU doesn't support "
                         "hyperthreading(%d)",
-                        cs->nr_threads);
+                        cs->topo.threads_per_core);
             error_printf("Please configure -smp options properly"
                          " or try enabling topoext feature.\n");
             ht_warned = true;
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index f5704f63e8da..f72db54a7265 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -746,8 +746,10 @@ void simulate_rdmsr(struct CPUState *cpu)
         val = env->mtrr_deftype;
         break;
     case MSR_CORE_THREAD_COUNT:
-        val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
-        val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+        /* thread count, bits 15..0 */
+        val = cs->topo.threads_per_socket;
+        /* core count, bits 31..16 */
+        val |= ((uint32_t)cs->topo.cores_per_socket << 16);
         break;
     default:
         /* fprintf(stderr, "%s: unknown msr 0x%x\n", __func__, msr); */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 587030199192..77a8c381a73a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2416,8 +2416,10 @@ static bool kvm_rdmsr_core_thread_count(X86CPU *cpu, uint32_t msr,
 {
     CPUState *cs = CPU(cpu);
 
-    *val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
-    *val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+    /* thread count, bits 15..0 */
+    *val = cs->topo.threads_per_socket;
+    /* core count, bits 31..16 */
+    *val |= ((uint32_t)cs->topo.cores_per_socket << 16);
 
     return true;
 }
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index e1528b7f80be..f359f5869ee1 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -452,7 +452,7 @@ void helper_rdmsr(CPUX86State *env)
         break;
     case MSR_CORE_THREAD_COUNT: {
         CPUState *cs = CPU(x86_cpu);
-        val = (cs->nr_threads * cs->nr_cores) | (cs->nr_cores << 16);
+        val = (cs->topo.threads_per_socket) | (cs->topo.cores_per_socket << 16);
         break;
     }
     default:
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index 5da112458928..ee1f4f019ac2 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -124,8 +124,8 @@ static CPUMIPSState *mips_cpu_map_tc(CPUMIPSState *env, int *tc)
     }
 
     cs = env_cpu(env);
-    vpe_idx = tc_idx / cs->nr_threads;
-    *tc = tc_idx % cs->nr_threads;
+    vpe_idx = tc_idx / cs->topo.threads_per_core;
+    *tc = tc_idx % cs->topo.threads_per_core;
     other_cs = qemu_get_cpu(vpe_idx);
     if (other_cs == NULL) {
         return env;
diff --git a/target/ppc/compat.c b/target/ppc/compat.c
index 7949a24f5a15..091654884734 100644
--- a/target/ppc/compat.c
+++ b/target/ppc/compat.c
@@ -232,7 +232,7 @@ int ppc_set_compat_all(uint32_t compat_pvr, Error **errp)
 int ppc_compat_max_vthreads(PowerPCCPU *cpu)
 {
     const CompatInfo *compat = compat_by_pvr(cpu->compat_pvr);
-    int n_threads = CPU(cpu)->nr_threads;
+    int n_threads = CPU(cpu)->topo.threads_per_core;
 
     if (cpu->compat_pvr) {
         g_assert(compat);
-- 
2.34.1


