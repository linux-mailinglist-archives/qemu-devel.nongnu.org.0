Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E026694212
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVPD-0000w2-3x; Mon, 13 Feb 2023 04:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVP4-0000jD-2i
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:42 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOy-0002n2-Dz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281536; x=1707817536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dSnLQcdM0qMsONcoCz+Twiih70B0fTfxZ9LYa7yT2Ng=;
 b=DvmTVD00AvYs9d5TDI0hFSAIWWZtVjFNpzWPZwexKeb+C+SmCmgxEYG3
 8Qwm5tLUoNGDqY0Z618gY6ucqhvboB14jla3v6U9Uwh5pNlCM+Ebxrt8Y
 9dgKwctcJHtu9iHfGHiuLY5dJH3g//OqBsgcLNehy8TP6RQUNb/Erk0wf
 JQgP06Zy8HkFYp2XHUSGDJ2mqSo+2lT+SiKReEhumYMSWLjRZDCVYWYz0
 uWYUo6qbbR5oR0RjTceGjLoSaQHEzY9B/5GkN/dvJrw1t6bTq6UKiwaUf
 SqFw8yDZB4iGSRlshk5l0iH1kR+fik2Tg/Wg733mGN4Yh11z+fc8b31d/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486901"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760605"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760605"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:08 -0800
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
Subject: [RFC 32/52] i386: Rename X86CPUTopoInfo and its members to reflect
 relationship with APIC ID
Date: Mon, 13 Feb 2023 17:50:15 +0800
Message-Id: <20230213095035.158240-33-zhao1.liu@linux.intel.com>
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

Rename X86CPUTopoInfo to X86ApicidTopoInfo, and also rename its members
to max_{dies, modules, cores, threads} to avoid confusion with
CPUState.topo.

Now the names can better reflect their relationship with APIC ID.

For hybrid CPU topology, X86ApicidTopoInfo will be different with
CPUState.topo and keep the maximum possible number of topology
structures in each topology level other than the actual topology
information of a certain CPU. This is required for the APIC ID under the
hybrid CPU topology.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c                | 18 ++++-----
 include/hw/i386/topology.h   | 72 +++++++++++++++++++++++-------------
 include/hw/i386/x86.h        |  2 +-
 target/i386/cpu.c            | 20 +++++-----
 tests/unit/test-x86-apicid.c | 50 ++++++++++++-------------
 5 files changed, 91 insertions(+), 71 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 52f7a19ceb7c..f20b0c3a5f12 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -65,15 +65,15 @@
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-inline void init_topo_info(X86CPUTopoInfo *topo_info,
+inline void init_topo_info(X86ApicidTopoInfo *topo_info,
                            const X86MachineState *x86ms)
 {
     MachineState *ms = MACHINE(x86ms);
 
-    topo_info->dies_per_pkg = machine_topo_get_dies(ms);
-    topo_info->modules_per_die = machine_topo_get_clusters(ms);
-    topo_info->cores_per_module = machine_topo_get_smp_cores(ms);
-    topo_info->threads_per_core = machine_topo_get_smp_threads(ms);
+    topo_info->max_dies = machine_topo_get_dies(ms);
+    topo_info->max_modules = machine_topo_get_clusters(ms);
+    topo_info->max_cores = machine_topo_get_smp_cores(ms);
+    topo_info->max_threads = machine_topo_get_smp_threads(ms);
 }
 
 /*
@@ -87,7 +87,7 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
                                     unsigned int cpu_index)
 {
-    X86CPUTopoInfo topo_info;
+    X86ApicidTopoInfo topo_info;
 
     init_topo_info(&topo_info, x86ms);
 
@@ -282,7 +282,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     X86CPU *cpu = X86_CPU(dev);
     MachineState *ms = MACHINE(hotplug_dev);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
-    X86CPUTopoInfo topo_info;
+    X86ApicidTopoInfo topo_info;
 
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
         error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
@@ -481,7 +481,7 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
    X86CPUTopoIDs topo_ids;
    X86MachineState *x86ms = X86_MACHINE(ms);
-   X86CPUTopoInfo topo_info;
+   X86ApicidTopoInfo topo_info;
 
    init_topo_info(&topo_info, x86ms);
 
@@ -495,7 +495,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
 {
     X86MachineState *x86ms = X86_MACHINE(ms);
     unsigned int max_cpus = machine_topo_get_max_cpus(ms);
-    X86CPUTopoInfo topo_info;
+    X86ApicidTopoInfo topo_info;
     int i;
 
     if (ms->possible_cpus) {
diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index 3cec97b377f2..45a2ab2a3dfa 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -47,6 +47,15 @@
  */
 typedef uint32_t apic_id_t;
 
+/**
+ * X86CPUTopoIDs - IDs for different topology levels.
+ *
+ * @pkg_id: the ID of package level
+ * @die_id: the ID of die level
+ * @module_id: the ID of module level
+ * @core_id: the ID of core level
+ * @smt_id: the ID of SMT level
+ */
 typedef struct X86CPUTopoIDs {
     unsigned pkg_id;
     unsigned die_id;
@@ -55,12 +64,23 @@ typedef struct X86CPUTopoIDs {
     unsigned smt_id;
 } X86CPUTopoIDs;
 
-typedef struct X86CPUTopoInfo {
-    unsigned dies_per_pkg;
-    unsigned modules_per_die;
-    unsigned cores_per_module;
-    unsigned threads_per_core;
-} X86CPUTopoInfo;
+/**
+ * X86ApicidTopoInfo - Topology information of APIC ID.
+ *
+ * X86ApicidTopoInfo stores the maximum possible number of corresponding
+ * topology structures in each topology level.
+ *
+ * @max_dies: the maximum possible number of dies in one package
+ * @max_modules: the maximum possible number of modules in one die
+ * @max_cores: the maximum possible number of cores in one module
+ * @max_threads: the maximum possible number of threads in one core
+ */
+typedef struct X86ApicidTopoInfo {
+    unsigned max_dies;
+    unsigned max_modules;
+    unsigned max_cores;
+    unsigned max_threads;
+} X86ApicidTopoInfo;
 
 /* Return the bit width needed for 'count' IDs */
 static unsigned apicid_bitwidth_for_count(unsigned count)
@@ -71,49 +91,49 @@ static unsigned apicid_bitwidth_for_count(unsigned count)
 }
 
 /* Bit width of the SMT_ID (thread ID) field on the APIC ID */
-static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_smt_width(X86ApicidTopoInfo *topo_info)
 {
-    return apicid_bitwidth_for_count(topo_info->threads_per_core);
+    return apicid_bitwidth_for_count(topo_info->max_threads);
 }
 
 /* Bit width of the Core_ID field */
-static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_core_width(X86ApicidTopoInfo *topo_info)
 {
-    return apicid_bitwidth_for_count(topo_info->cores_per_module);
+    return apicid_bitwidth_for_count(topo_info->max_cores);
 }
 
 /* Bit width of the Module_ID (cluster ID) field */
-static inline unsigned apicid_module_width(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_module_width(X86ApicidTopoInfo *topo_info)
 {
-    return apicid_bitwidth_for_count(topo_info->modules_per_die);
+    return apicid_bitwidth_for_count(topo_info->max_modules);
 }
 
 /* Bit width of the Die_ID field */
-static inline unsigned apicid_die_width(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_die_width(X86ApicidTopoInfo *topo_info)
 {
-    return apicid_bitwidth_for_count(topo_info->dies_per_pkg);
+    return apicid_bitwidth_for_count(topo_info->max_dies);
 }
 
 /* Bit offset of the Core_ID field */
-static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_core_offset(X86ApicidTopoInfo *topo_info)
 {
     return apicid_smt_width(topo_info);
 }
 
 /* Bit offset of the Module_ID (cluster ID) field */
-static inline unsigned apicid_module_offset(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_module_offset(X86ApicidTopoInfo *topo_info)
 {
     return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
 }
 
 /* Bit offset of the Die_ID field */
-static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_die_offset(X86ApicidTopoInfo *topo_info)
 {
     return apicid_module_offset(topo_info) + apicid_module_width(topo_info);
 }
 
 /* Bit offset of the Pkg_ID (socket ID) field */
-static inline unsigned apicid_pkg_offset(X86CPUTopoInfo *topo_info)
+static inline unsigned apicid_pkg_offset(X86ApicidTopoInfo *topo_info)
 {
     return apicid_die_offset(topo_info) + apicid_die_width(topo_info);
 }
@@ -123,7 +143,7 @@ static inline unsigned apicid_pkg_offset(X86CPUTopoInfo *topo_info)
  *
  * The caller must make sure core_id < nr_cores and smt_id < nr_threads.
  */
-static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
+static inline apic_id_t x86_apicid_from_topo_ids(X86ApicidTopoInfo *topo_info,
                                                  const X86CPUTopoIDs *topo_ids)
 {
     return (topo_ids->pkg_id  << apicid_pkg_offset(topo_info)) |
@@ -137,14 +157,14 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
  * Calculate thread/core/package IDs for a specific topology,
  * based on (contiguous) CPU index
  */
-static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
+static inline void x86_topo_ids_from_idx(X86ApicidTopoInfo *topo_info,
                                          unsigned cpu_index,
                                          X86CPUTopoIDs *topo_ids)
 {
-    unsigned nr_dies = topo_info->dies_per_pkg;
-    unsigned nr_modules = topo_info->modules_per_die;
-    unsigned nr_cores = topo_info->cores_per_module;
-    unsigned nr_threads = topo_info->threads_per_core;
+    unsigned nr_dies = topo_info->max_dies;
+    unsigned nr_modules = topo_info->max_modules;
+    unsigned nr_cores = topo_info->max_cores;
+    unsigned nr_threads = topo_info->max_threads;
 
     topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
                        nr_cores * nr_threads);
@@ -161,7 +181,7 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
  * based on APIC ID
  */
 static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
-                                            X86CPUTopoInfo *topo_info,
+                                            X86ApicidTopoInfo *topo_info,
                                             X86CPUTopoIDs *topo_ids)
 {
     topo_ids->smt_id = apicid &
@@ -183,7 +203,7 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
  *
  * 'cpu_index' is a sequential, contiguous ID for the CPU.
  */
-static inline apic_id_t x86_apicid_from_cpu_idx(X86CPUTopoInfo *topo_info,
+static inline apic_id_t x86_apicid_from_cpu_idx(X86ApicidTopoInfo *topo_info,
                                                 unsigned cpu_index)
 {
     X86CPUTopoIDs topo_ids;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f849..ac6f1e4a74af 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -98,7 +98,7 @@ struct X86MachineState {
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
-void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
+void init_topo_info(X86ApicidTopoInfo *topo_info, const X86MachineState *x86ms);
 
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f626d74639ed..4494f01a1635 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -232,7 +232,7 @@ static uint8_t cpuid2_cache_descriptor(CPUCacheInfo *cache)
                        0 /* Invalid value */)
 
 static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
-                                            X86CPUTopoInfo *topo_info)
+                                            X86ApicidTopoInfo *topo_info)
 {
     uint32_t num_ids = 0;
 
@@ -257,7 +257,7 @@ static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
     return num_ids - 1;
 }
 
-static uint32_t max_core_ids_in_package(X86CPUTopoInfo *topo_info)
+static uint32_t max_core_ids_in_package(X86ApicidTopoInfo *topo_info)
 {
     uint32_t num_cores = 1 << (apicid_pkg_offset(topo_info) -
                                apicid_core_offset(topo_info));
@@ -266,7 +266,7 @@ static uint32_t max_core_ids_in_package(X86CPUTopoInfo *topo_info)
 
 /* Encode cache info for CPUID[4] */
 static void encode_cache_cpuid4(CPUCacheInfo *cache,
-                                X86CPUTopoInfo *topo_info,
+                                X86ApicidTopoInfo *topo_info,
                                 uint32_t *eax, uint32_t *ebx,
                                 uint32_t *ecx, uint32_t *edx)
 {
@@ -354,7 +354,7 @@ static void encode_cache_cpuid80000006(CPUCacheInfo *l2,
 
 /* Encode cache info for CPUID[8000001D] */
 static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
-                                       X86CPUTopoInfo *topo_info,
+                                       X86ApicidTopoInfo *topo_info,
                                        uint32_t *eax, uint32_t *ebx,
                                        uint32_t *ecx, uint32_t *edx)
 {
@@ -383,7 +383,7 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
 }
 
 /* Encode cache info for CPUID[8000001E] */
-static void encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info,
+static void encode_topo_cpuid8000001e(X86CPU *cpu, X86ApicidTopoInfo *topo_info,
                                       uint32_t *eax, uint32_t *ebx,
                                       uint32_t *ecx, uint32_t *edx)
 {
@@ -5257,12 +5257,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     CPUState *cs = env_cpu(env);
     uint32_t limit;
     uint32_t signature[3];
-    X86CPUTopoInfo topo_info;
+    X86ApicidTopoInfo topo_info;
 
-    topo_info.dies_per_pkg = cs->topo.dies_per_socket;
-    topo_info.modules_per_die = cs->topo.clusters_per_die;
-    topo_info.cores_per_module = cs->topo.cores_per_cluster;
-    topo_info.threads_per_core = cs->topo.threads_per_core;
+    topo_info.max_dies = cs->topo.dies_per_socket;
+    topo_info.max_modules = cs->topo.clusters_per_die;
+    topo_info.max_cores = cs->topo.cores_per_cluster;
+    topo_info.max_threads = cs->topo.threads_per_core;
 
     /* Calculate & apply limits for different index ranges */
     if (index >= 0xC0000000) {
diff --git a/tests/unit/test-x86-apicid.c b/tests/unit/test-x86-apicid.c
index 55b731ccae55..225d88bc3262 100644
--- a/tests/unit/test-x86-apicid.c
+++ b/tests/unit/test-x86-apicid.c
@@ -28,19 +28,19 @@
 
 static void test_topo_bits(void)
 {
-    X86CPUTopoInfo topo_info = {0};
+    X86ApicidTopoInfo topo_info = {0};
 
     /*
      * simple tests for 1 thread per core, 1 core per module,
      *                  1 module per die, 1 die per package
      */
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 1};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 0);
     g_assert_cmpuint(apicid_core_width(&topo_info), ==, 0);
     g_assert_cmpuint(apicid_module_width(&topo_info), ==, 0);
     g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
 
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 1};
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
@@ -49,48 +49,48 @@ static void test_topo_bits(void)
 
     /* Test field width calculation for multiple values
      */
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 2};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 1);
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 3};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 3};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 4};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 4};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
 
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 14};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 14};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 15};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 15};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 16};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 16};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
-    topo_info = (X86CPUTopoInfo) {1, 1, 1, 17};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 17};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 5);
 
 
-    topo_info = (X86CPUTopoInfo) {1, 1, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 30, 2};
     g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
-    topo_info = (X86CPUTopoInfo) {1, 1, 31, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 31, 2};
     g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
-    topo_info = (X86CPUTopoInfo) {1, 1, 32, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 32, 2};
     g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
-    topo_info = (X86CPUTopoInfo) {1, 1, 33, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 33, 2};
     g_assert_cmpuint(apicid_core_width(&topo_info), ==, 6);
 
-    topo_info = (X86CPUTopoInfo) {1, 6, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 6, 30, 2};
     g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
-    topo_info = (X86CPUTopoInfo) {1, 7, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 7, 30, 2};
     g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
-    topo_info = (X86CPUTopoInfo) {1, 8, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 8, 30, 2};
     g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
-    topo_info = (X86CPUTopoInfo) {1, 9, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 9, 30, 2};
     g_assert_cmpuint(apicid_module_width(&topo_info), ==, 4);
 
-    topo_info = (X86CPUTopoInfo) {1, 6, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {1, 6, 30, 2};
     g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
-    topo_info = (X86CPUTopoInfo) {2, 6, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {2, 6, 30, 2};
     g_assert_cmpuint(apicid_die_width(&topo_info), ==, 1);
-    topo_info = (X86CPUTopoInfo) {3, 6, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {3, 6, 30, 2};
     g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
-    topo_info = (X86CPUTopoInfo) {4, 6, 30, 2};
+    topo_info = (X86ApicidTopoInfo) {4, 6, 30, 2};
     g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
 
     /* build a weird topology and see if IDs are calculated correctly
@@ -98,19 +98,19 @@ static void test_topo_bits(void)
 
     /* This will use 2 bits for thread ID and 3 bits for core ID
      */
-    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 6, 3};
     g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
     g_assert_cmpuint(apicid_core_offset(&topo_info), ==, 2);
     g_assert_cmpuint(apicid_module_offset(&topo_info), ==, 5);
     g_assert_cmpuint(apicid_die_offset(&topo_info), ==, 5);
     g_assert_cmpuint(apicid_pkg_offset(&topo_info), ==, 5);
 
-    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 6, 3};
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
 
-    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
+    topo_info = (X86ApicidTopoInfo) {1, 1, 6, 3};
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 0), ==,
                      (1 << 2) | 0);
     g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 1), ==,
-- 
2.34.1


