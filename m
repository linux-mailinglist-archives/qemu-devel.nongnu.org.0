Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6000A694203
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:54:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQ4-0002Sx-FW; Mon, 13 Feb 2023 04:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPK-0001FN-BK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:59 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPC-0002o2-0r
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281550; x=1707817550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6VeAXw6MTJDnukDMe885TOloVmya5s6mRfsdePx/OWk=;
 b=Dceaj5xoS2XcEVV7jkGY9L5n+3deoBFTVkZVh5quZ/dNmEsF7rZtM8VS
 oEayTVSbito4jbczD6OG2UZstXPDCLNWzlaxwnH7gbP1HhOMvTxdCAwZ+
 qrFsDzZ7UiN9AO7VMjX+7gCsP5wEHSxM+B4ut5HZNYfhsVg35jwsgKbs8
 fpVYw3+I9ZWxem1tF93QWYzIluPkBhx3bSqca7XIHtICu10mAD/z+jMs3
 0vA1OK5e0qHSYUfw2eJjRS3SvWbmXa8yUDhFi7IuPcC1jKT8PAg2tkpVB
 qd5PNzTW0nUbGCvKqXWLsG4/AV+WZzqNUdfUEtjqdsPahHCn9pejrrHEP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486955"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486955"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760611"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760611"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:15 -0800
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
Subject: [RFC 34/52] i386: Rename variable topo_info to apicid_topo
Date: Mon, 13 Feb 2023 17:50:17 +0800
Message-Id: <20230213095035.158240-35-zhao1.liu@linux.intel.com>
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

Since X86ApicidTopoInfo is only used for APIC ID related work, the
common variable topo_info of X86ApicidTopoInfo type should be also
renamed to better suit its purpose.

Generic topology access should be obtained from MachineState.topo
(for the whole machine) or CPUState.topo (for the current CPU), and
apicid_topo (X86ApicidTopoInfo type) is only used to collaborate with
APIC ID.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c                |  38 ++++-----
 include/hw/i386/topology.h   |  76 ++++++++---------
 include/hw/i386/x86.h        |   2 +-
 target/i386/cpu.c            |  71 ++++++++--------
 tests/unit/test-x86-apicid.c | 158 +++++++++++++++++------------------
 5 files changed, 173 insertions(+), 172 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index a13c931df062..9ee0fcb9a460 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -65,15 +65,15 @@
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-inline void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
+inline void init_apicid_topo_info(X86ApicidTopoInfo *apicid_topo,
                                   const X86MachineState *x86ms)
 {
     MachineState *ms = MACHINE(x86ms);
 
-    topo_info->max_dies = machine_topo_get_dies(ms);
-    topo_info->max_modules = machine_topo_get_clusters(ms);
-    topo_info->max_cores = machine_topo_get_smp_cores(ms);
-    topo_info->max_threads = machine_topo_get_smp_threads(ms);
+    apicid_topo->max_dies = machine_topo_get_dies(ms);
+    apicid_topo->max_modules = machine_topo_get_clusters(ms);
+    apicid_topo->max_cores = machine_topo_get_smp_cores(ms);
+    apicid_topo->max_threads = machine_topo_get_smp_threads(ms);
 }
 
 /*
@@ -87,11 +87,11 @@ inline void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
                                     unsigned int cpu_index)
 {
-    X86ApicidTopoInfo topo_info;
+    X86ApicidTopoInfo apicid_topo;
 
-    init_apicid_topo_info(&topo_info, x86ms);
+    init_apicid_topo_info(&apicid_topo, x86ms);
 
-    return x86_apicid_from_cpu_idx(&topo_info, cpu_index);
+    return x86_apicid_from_cpu_idx(&apicid_topo, cpu_index);
 }
 
 
@@ -282,7 +282,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     X86CPU *cpu = X86_CPU(dev);
     MachineState *ms = MACHINE(hotplug_dev);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
-    X86ApicidTopoInfo topo_info;
+    X86ApicidTopoInfo apicid_topo;
 
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
         error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
@@ -301,7 +301,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         }
     }
 
-    init_apicid_topo_info(&topo_info, x86ms);
+    init_apicid_topo_info(&apicid_topo, x86ms);
 
     /*
      * If APIC ID is not set,
@@ -381,14 +381,14 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         topo_ids.module_id = cpu->cluster_id;
         topo_ids.core_id = cpu->core_id;
         topo_ids.smt_id = cpu->thread_id;
-        cpu->apic_id = x86_apicid_from_topo_ids(&topo_info, &topo_ids);
+        cpu->apic_id = x86_apicid_from_topo_ids(&apicid_topo, &topo_ids);
     }
 
     cpu_slot = x86_find_cpu_slot(MACHINE(x86ms), cpu->apic_id, &idx);
     if (!cpu_slot) {
         MachineState *ms = MACHINE(x86ms);
 
-        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+        x86_topo_ids_from_apicid(cpu->apic_id, &apicid_topo, &topo_ids);
 
         error_setg(errp,
             "Invalid CPU [socket: %u, die: %u, module: %u, core: %u, thread: %u]"
@@ -415,7 +415,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
      * CPUState::topo::cores_per_socket and CPUState::topo::threads_per_core
      * fields instead of globals
      */
-    x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+    x86_topo_ids_from_apicid(cpu->apic_id, &apicid_topo, &topo_ids);
     if (cpu->socket_id != -1 && cpu->socket_id != topo_ids.pkg_id) {
         error_setg(errp, "property socket-id: %u doesn't match set apic-id:"
             " 0x%x (socket-id: %u)", cpu->socket_id, cpu->apic_id,
@@ -481,13 +481,13 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
    X86CPUTopoIDs topo_ids;
    X86MachineState *x86ms = X86_MACHINE(ms);
-   X86ApicidTopoInfo topo_info;
+   X86ApicidTopoInfo apicid_topo;
 
-   init_apicid_topo_info(&topo_info, x86ms);
+   init_apicid_topo_info(&apicid_topo, x86ms);
 
    assert(idx < ms->possible_cpus->len);
    x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
-                            &topo_info, &topo_ids);
+                            &apicid_topo, &topo_ids);
    return topo_ids.pkg_id % ms->numa_state->num_nodes;
 }
 
@@ -495,7 +495,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
 {
     X86MachineState *x86ms = X86_MACHINE(ms);
     unsigned int max_cpus = machine_topo_get_max_cpus(ms);
-    X86ApicidTopoInfo topo_info;
+    X86ApicidTopoInfo apicid_topo;
     int i;
 
     if (ms->possible_cpus) {
@@ -511,7 +511,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
                                   sizeof(CPUArchId) * max_cpus);
     ms->possible_cpus->len = max_cpus;
 
-    init_apicid_topo_info(&topo_info, x86ms);
+    init_apicid_topo_info(&apicid_topo, x86ms);
 
     for (i = 0; i < ms->possible_cpus->len; i++) {
         X86CPUTopoIDs topo_ids;
@@ -521,7 +521,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[i].arch_id =
             x86_cpu_apic_id_from_index(x86ms, i);
         x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
-                                 &topo_info, &topo_ids);
+                                 &apicid_topo, &topo_ids);
         ms->possible_cpus->cpus[i].props.has_socket_id = true;
         ms->possible_cpus->cpus[i].props.socket_id = topo_ids.pkg_id;
         if (machine_topo_get_dies(ms) > 1) {
diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index 45a2ab2a3dfa..5b29c51329f1 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -91,51 +91,51 @@ static unsigned apicid_bitwidth_for_count(unsigned count)
 }
 
 /* Bit width of the SMT_ID (thread ID) field on the APIC ID */
-static inline unsigned apicid_smt_width(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_smt_width(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_bitwidth_for_count(topo_info->max_threads);
+    return apicid_bitwidth_for_count(apicid_topo->max_threads);
 }
 
 /* Bit width of the Core_ID field */
-static inline unsigned apicid_core_width(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_core_width(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_bitwidth_for_count(topo_info->max_cores);
+    return apicid_bitwidth_for_count(apicid_topo->max_cores);
 }
 
 /* Bit width of the Module_ID (cluster ID) field */
-static inline unsigned apicid_module_width(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_module_width(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_bitwidth_for_count(topo_info->max_modules);
+    return apicid_bitwidth_for_count(apicid_topo->max_modules);
 }
 
 /* Bit width of the Die_ID field */
-static inline unsigned apicid_die_width(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_die_width(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_bitwidth_for_count(topo_info->max_dies);
+    return apicid_bitwidth_for_count(apicid_topo->max_dies);
 }
 
 /* Bit offset of the Core_ID field */
-static inline unsigned apicid_core_offset(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_core_offset(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_smt_width(topo_info);
+    return apicid_smt_width(apicid_topo);
 }
 
 /* Bit offset of the Module_ID (cluster ID) field */
-static inline unsigned apicid_module_offset(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_module_offset(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
+    return apicid_core_offset(apicid_topo) + apicid_core_width(apicid_topo);
 }
 
 /* Bit offset of the Die_ID field */
-static inline unsigned apicid_die_offset(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_die_offset(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_module_offset(topo_info) + apicid_module_width(topo_info);
+    return apicid_module_offset(apicid_topo) + apicid_module_width(apicid_topo);
 }
 
 /* Bit offset of the Pkg_ID (socket ID) field */
-static inline unsigned apicid_pkg_offset(X86ApicidTopoInfo *topo_info)
+static inline unsigned apicid_pkg_offset(X86ApicidTopoInfo *apicid_topo)
 {
-    return apicid_die_offset(topo_info) + apicid_die_width(topo_info);
+    return apicid_die_offset(apicid_topo) + apicid_die_width(apicid_topo);
 }
 
 /*
@@ -143,13 +143,13 @@ static inline unsigned apicid_pkg_offset(X86ApicidTopoInfo *topo_info)
  *
  * The caller must make sure core_id < nr_cores and smt_id < nr_threads.
  */
-static inline apic_id_t x86_apicid_from_topo_ids(X86ApicidTopoInfo *topo_info,
+static inline apic_id_t x86_apicid_from_topo_ids(X86ApicidTopoInfo *apicid_topo,
                                                  const X86CPUTopoIDs *topo_ids)
 {
-    return (topo_ids->pkg_id  << apicid_pkg_offset(topo_info)) |
-           (topo_ids->die_id  << apicid_die_offset(topo_info)) |
-           (topo_ids->module_id << apicid_module_offset(topo_info)) |
-           (topo_ids->core_id << apicid_core_offset(topo_info)) |
+    return (topo_ids->pkg_id  << apicid_pkg_offset(apicid_topo)) |
+           (topo_ids->die_id  << apicid_die_offset(apicid_topo)) |
+           (topo_ids->module_id << apicid_module_offset(apicid_topo)) |
+           (topo_ids->core_id << apicid_core_offset(apicid_topo)) |
            topo_ids->smt_id;
 }
 
@@ -157,14 +157,14 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86ApicidTopoInfo *topo_info,
  * Calculate thread/core/package IDs for a specific topology,
  * based on (contiguous) CPU index
  */
-static inline void x86_topo_ids_from_idx(X86ApicidTopoInfo *topo_info,
+static inline void x86_topo_ids_from_idx(X86ApicidTopoInfo *apicid_topo,
                                          unsigned cpu_index,
                                          X86CPUTopoIDs *topo_ids)
 {
-    unsigned nr_dies = topo_info->max_dies;
-    unsigned nr_modules = topo_info->max_modules;
-    unsigned nr_cores = topo_info->max_cores;
-    unsigned nr_threads = topo_info->max_threads;
+    unsigned nr_dies = apicid_topo->max_dies;
+    unsigned nr_modules = apicid_topo->max_modules;
+    unsigned nr_cores = apicid_topo->max_cores;
+    unsigned nr_threads = apicid_topo->max_threads;
 
     topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
                        nr_cores * nr_threads);
@@ -181,21 +181,21 @@ static inline void x86_topo_ids_from_idx(X86ApicidTopoInfo *topo_info,
  * based on APIC ID
  */
 static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
-                                            X86ApicidTopoInfo *topo_info,
+                                            X86ApicidTopoInfo *apicid_topo,
                                             X86CPUTopoIDs *topo_ids)
 {
     topo_ids->smt_id = apicid &
-            ~(0xFFFFFFFFUL << apicid_smt_width(topo_info));
+            ~(0xFFFFFFFFUL << apicid_smt_width(apicid_topo));
     topo_ids->core_id =
-            (apicid >> apicid_core_offset(topo_info)) &
-            ~(0xFFFFFFFFUL << apicid_core_width(topo_info));
+            (apicid >> apicid_core_offset(apicid_topo)) &
+            ~(0xFFFFFFFFUL << apicid_core_width(apicid_topo));
     topo_ids->module_id =
-            (apicid >> apicid_module_offset(topo_info)) &
-            ~(0xFFFFFFFFUL << apicid_module_width(topo_info));
+            (apicid >> apicid_module_offset(apicid_topo)) &
+            ~(0xFFFFFFFFUL << apicid_module_width(apicid_topo));
     topo_ids->die_id =
-            (apicid >> apicid_die_offset(topo_info)) &
-            ~(0xFFFFFFFFUL << apicid_die_width(topo_info));
-    topo_ids->pkg_id = apicid >> apicid_pkg_offset(topo_info);
+            (apicid >> apicid_die_offset(apicid_topo)) &
+            ~(0xFFFFFFFFUL << apicid_die_width(apicid_topo));
+    topo_ids->pkg_id = apicid >> apicid_pkg_offset(apicid_topo);
 }
 
 /*
@@ -203,12 +203,12 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
  *
  * 'cpu_index' is a sequential, contiguous ID for the CPU.
  */
-static inline apic_id_t x86_apicid_from_cpu_idx(X86ApicidTopoInfo *topo_info,
+static inline apic_id_t x86_apicid_from_cpu_idx(X86ApicidTopoInfo *apicid_topo,
                                                 unsigned cpu_index)
 {
     X86CPUTopoIDs topo_ids;
-    x86_topo_ids_from_idx(topo_info, cpu_index, &topo_ids);
-    return x86_apicid_from_topo_ids(topo_info, &topo_ids);
+    x86_topo_ids_from_idx(apicid_topo, cpu_index, &topo_ids);
+    return x86_apicid_from_topo_ids(apicid_topo, &topo_ids);
 }
 
 #endif /* HW_I386_TOPOLOGY_H */
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index d84f7717900c..0d11102599a9 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -98,7 +98,7 @@ struct X86MachineState {
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
-void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
+void init_apicid_topo_info(X86ApicidTopoInfo *apicid_topo,
                            const X86MachineState *x86ms);
 
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4494f01a1635..844b6df63a4a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -232,19 +232,19 @@ static uint8_t cpuid2_cache_descriptor(CPUCacheInfo *cache)
                        0 /* Invalid value */)
 
 static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
-                                            X86ApicidTopoInfo *topo_info)
+                                            X86ApicidTopoInfo *apicid_topo)
 {
     uint32_t num_ids = 0;
 
     switch (cache->share_level) {
     case CORE:
-        num_ids = 1 << apicid_core_offset(topo_info);
+        num_ids = 1 << apicid_core_offset(apicid_topo);
         break;
     case MODULE:
-        num_ids = 1 << apicid_module_offset(topo_info);
+        num_ids = 1 << apicid_module_offset(apicid_topo);
         break;
     case DIE:
-        num_ids = 1 << apicid_die_offset(topo_info);
+        num_ids = 1 << apicid_die_offset(apicid_topo);
         break;
     default:
         /*
@@ -257,16 +257,16 @@ static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
     return num_ids - 1;
 }
 
-static uint32_t max_core_ids_in_package(X86ApicidTopoInfo *topo_info)
+static uint32_t max_core_ids_in_package(X86ApicidTopoInfo *apicid_topo)
 {
-    uint32_t num_cores = 1 << (apicid_pkg_offset(topo_info) -
-                               apicid_core_offset(topo_info));
+    uint32_t num_cores = 1 << (apicid_pkg_offset(apicid_topo) -
+                               apicid_core_offset(apicid_topo));
     return num_cores - 1;
 }
 
 /* Encode cache info for CPUID[4] */
 static void encode_cache_cpuid4(CPUCacheInfo *cache,
-                                X86ApicidTopoInfo *topo_info,
+                                X86ApicidTopoInfo *apicid_topo,
                                 uint32_t *eax, uint32_t *ebx,
                                 uint32_t *ecx, uint32_t *edx)
 {
@@ -276,8 +276,8 @@ static void encode_cache_cpuid4(CPUCacheInfo *cache,
     *eax = CACHE_TYPE(cache->type) |
            CACHE_LEVEL(cache->level) |
            (cache->self_init ? CACHE_SELF_INIT_LEVEL : 0) |
-           (max_core_ids_in_package(topo_info) << 26) |
-           (max_processor_ids_for_cache(cache, topo_info) << 14);
+           (max_core_ids_in_package(apicid_topo) << 26) |
+           (max_processor_ids_for_cache(cache, apicid_topo) << 14);
 
     assert(cache->line_size > 0);
     assert(cache->partitions > 0);
@@ -354,7 +354,7 @@ static void encode_cache_cpuid80000006(CPUCacheInfo *l2,
 
 /* Encode cache info for CPUID[8000001D] */
 static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
-                                       X86ApicidTopoInfo *topo_info,
+                                       X86ApicidTopoInfo *apicid_topo,
                                        uint32_t *eax, uint32_t *ebx,
                                        uint32_t *ecx, uint32_t *edx)
 {
@@ -363,7 +363,7 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
 
     *eax = CACHE_TYPE(cache->type) | CACHE_LEVEL(cache->level) |
                (cache->self_init ? CACHE_SELF_INIT_LEVEL : 0);
-    *eax |= max_processor_ids_for_cache(cache, topo_info) << 14;
+    *eax |= max_processor_ids_for_cache(cache, apicid_topo) << 14;
 
     assert(cache->line_size > 0);
     assert(cache->partitions > 0);
@@ -383,14 +383,15 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
 }
 
 /* Encode cache info for CPUID[8000001E] */
-static void encode_topo_cpuid8000001e(X86CPU *cpu, X86ApicidTopoInfo *topo_info,
+static void encode_topo_cpuid8000001e(X86CPU *cpu,
+                                      X86ApicidTopoInfo *apicid_topo,
                                       uint32_t *eax, uint32_t *ebx,
                                       uint32_t *ecx, uint32_t *edx)
 {
     CPUState *cs = CPU(cpu);
     X86CPUTopoIDs topo_ids;
 
-    x86_topo_ids_from_apicid(cpu->apic_id, topo_info, &topo_ids);
+    x86_topo_ids_from_apicid(cpu->apic_id, apicid_topo, &topo_ids);
 
     *eax = cpu->apic_id;
 
@@ -433,7 +434,7 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86ApicidTopoInfo *topo_info,
      * in apic_id. Just use it by shifting.
      */
     *ecx = ((cs->topo.dies_per_socket - 1) << 8) |
-           ((cpu->apic_id >> apicid_die_offset(topo_info)) & 0xFF);
+           ((cpu->apic_id >> apicid_die_offset(apicid_topo)) & 0xFF);
 
     *edx = 0;
 }
@@ -5257,12 +5258,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     CPUState *cs = env_cpu(env);
     uint32_t limit;
     uint32_t signature[3];
-    X86ApicidTopoInfo topo_info;
+    X86ApicidTopoInfo apicid_topo;
 
-    topo_info.max_dies = cs->topo.dies_per_socket;
-    topo_info.max_modules = cs->topo.clusters_per_die;
-    topo_info.max_cores = cs->topo.cores_per_cluster;
-    topo_info.max_threads = cs->topo.threads_per_core;
+    apicid_topo.max_dies = cs->topo.dies_per_socket;
+    apicid_topo.max_modules = cs->topo.clusters_per_die;
+    apicid_topo.max_cores = cs->topo.cores_per_cluster;
+    apicid_topo.max_threads = cs->topo.threads_per_core;
 
     /* Calculate & apply limits for different index ranges */
     if (index >= 0xC0000000) {
@@ -5356,23 +5357,23 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             switch (count) {
             case 0: /* L1 dcache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
-                                    &topo_info,
+                                    &apicid_topo,
                                     eax, ebx, ecx, edx);
                 break;
             case 1: /* L1 icache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1i_cache,
-                                    &topo_info,
+                                    &apicid_topo,
                                     eax, ebx, ecx, edx);
                 break;
             case 2: /* L2 cache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l2_cache,
-                                    &topo_info,
+                                    &apicid_topo,
                                     eax, ebx, ecx, edx);
                 break;
             case 3: /* L3 cache info */
                 if (cpu->enable_l3_cache) {
                     encode_cache_cpuid4(env->cache_info_cpuid4.l3_cache,
-                                        &topo_info,
+                                        &apicid_topo,
                                         eax, ebx, ecx, edx);
                     break;
                 }
@@ -5469,12 +5470,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         switch (count) {
         case 0:
-            *eax = apicid_core_offset(&topo_info);
+            *eax = apicid_core_offset(&apicid_topo);
             *ebx = cs->topo.threads_per_core;
             *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
             break;
         case 1:
-            *eax = apicid_pkg_offset(&topo_info);
+            *eax = apicid_pkg_offset(&apicid_topo);
             *ebx = cs->topo.threads_per_socket;
             *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
             break;
@@ -5505,17 +5506,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *edx = cpu->apic_id;
         switch (count) {
         case 0:
-            *eax = apicid_core_offset(&topo_info);
+            *eax = apicid_core_offset(&apicid_topo);
             *ebx = cs->topo.threads_per_core;
             *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
             break;
         case 1:
-            *eax = apicid_die_offset(&topo_info);
+            *eax = apicid_die_offset(&apicid_topo);
             *ebx = cs->topo.threads_per_socket / cs->topo.dies_per_socket;
             *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
             break;
         case 2:
-            *eax = apicid_pkg_offset(&topo_info);
+            *eax = apicid_pkg_offset(&apicid_topo);
             *ebx = cs->topo.threads_per_socket;
             *ecx |= CPUID_TOPOLOGY_LEVEL_DIE;
             break;
@@ -5810,7 +5811,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
              * thread ID within a package".
              * Bits 7:0 is "The number of threads in the package is NC+1"
              */
-            *ecx = (apicid_pkg_offset(&topo_info) << 12) |
+            *ecx = (apicid_pkg_offset(&apicid_topo) << 12) |
                    (cs->topo.threads_per_socket - 1);
         } else {
             *ecx = 0;
@@ -5839,19 +5840,19 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         switch (count) {
         case 0: /* L1 dcache info */
             encode_cache_cpuid8000001d(env->cache_info_amd.l1d_cache,
-                                       &topo_info, eax, ebx, ecx, edx);
+                                       &apicid_topo, eax, ebx, ecx, edx);
             break;
         case 1: /* L1 icache info */
             encode_cache_cpuid8000001d(env->cache_info_amd.l1i_cache,
-                                       &topo_info, eax, ebx, ecx, edx);
+                                       &apicid_topo, eax, ebx, ecx, edx);
             break;
         case 2: /* L2 cache info */
             encode_cache_cpuid8000001d(env->cache_info_amd.l2_cache,
-                                       &topo_info, eax, ebx, ecx, edx);
+                                       &apicid_topo, eax, ebx, ecx, edx);
             break;
         case 3: /* L3 cache info */
             encode_cache_cpuid8000001d(env->cache_info_amd.l3_cache,
-                                       &topo_info, eax, ebx, ecx, edx);
+                                       &apicid_topo, eax, ebx, ecx, edx);
             break;
         default: /* end of info */
             *eax = *ebx = *ecx = *edx = 0;
@@ -5860,7 +5861,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 0x8000001E:
         if (cpu->core_id <= 255) {
-            encode_topo_cpuid8000001e(cpu, &topo_info, eax, ebx, ecx, edx);
+            encode_topo_cpuid8000001e(cpu, &apicid_topo, eax, ebx, ecx, edx);
         } else {
             *eax = 0;
             *ebx = 0;
diff --git a/tests/unit/test-x86-apicid.c b/tests/unit/test-x86-apicid.c
index 225d88bc3262..fd76d1775a10 100644
--- a/tests/unit/test-x86-apicid.c
+++ b/tests/unit/test-x86-apicid.c
@@ -28,115 +28,115 @@
 
 static void test_topo_bits(void)
 {
-    X86ApicidTopoInfo topo_info = {0};
+    X86ApicidTopoInfo apicid_topo = {0};
 
     /*
      * simple tests for 1 thread per core, 1 core per module,
      *                  1 module per die, 1 die per package
      */
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 1};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 0);
-    g_assert_cmpuint(apicid_core_width(&topo_info), ==, 0);
-    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 0);
-    g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 1};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 0);
+    g_assert_cmpuint(apicid_core_width(&apicid_topo), ==, 0);
+    g_assert_cmpuint(apicid_module_width(&apicid_topo), ==, 0);
+    g_assert_cmpuint(apicid_die_width(&apicid_topo), ==, 0);
 
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 1};
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 3), ==, 3);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 1};
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 0), ==, 0);
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1), ==, 1);
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2), ==, 2);
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 3), ==, 3);
 
 
     /* Test field width calculation for multiple values
      */
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 2};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 1);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 3};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 4};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
-
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 14};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 15};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 16};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 1, 17};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 5);
-
-
-    topo_info = (X86ApicidTopoInfo) {1, 1, 30, 2};
-    g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 31, 2};
-    g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 32, 2};
-    g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
-    topo_info = (X86ApicidTopoInfo) {1, 1, 33, 2};
-    g_assert_cmpuint(apicid_core_width(&topo_info), ==, 6);
-
-    topo_info = (X86ApicidTopoInfo) {1, 6, 30, 2};
-    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
-    topo_info = (X86ApicidTopoInfo) {1, 7, 30, 2};
-    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
-    topo_info = (X86ApicidTopoInfo) {1, 8, 30, 2};
-    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 3);
-    topo_info = (X86ApicidTopoInfo) {1, 9, 30, 2};
-    g_assert_cmpuint(apicid_module_width(&topo_info), ==, 4);
-
-    topo_info = (X86ApicidTopoInfo) {1, 6, 30, 2};
-    g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
-    topo_info = (X86ApicidTopoInfo) {2, 6, 30, 2};
-    g_assert_cmpuint(apicid_die_width(&topo_info), ==, 1);
-    topo_info = (X86ApicidTopoInfo) {3, 6, 30, 2};
-    g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
-    topo_info = (X86ApicidTopoInfo) {4, 6, 30, 2};
-    g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 2};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 1);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 3};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 2);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 4};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 2);
+
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 14};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 4);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 15};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 4);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 16};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 4);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 17};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 5);
+
+
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 30, 2};
+    g_assert_cmpuint(apicid_core_width(&apicid_topo), ==, 5);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 31, 2};
+    g_assert_cmpuint(apicid_core_width(&apicid_topo), ==, 5);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 32, 2};
+    g_assert_cmpuint(apicid_core_width(&apicid_topo), ==, 5);
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 33, 2};
+    g_assert_cmpuint(apicid_core_width(&apicid_topo), ==, 6);
+
+    apicid_topo = (X86ApicidTopoInfo) {1, 6, 30, 2};
+    g_assert_cmpuint(apicid_module_width(&apicid_topo), ==, 3);
+    apicid_topo = (X86ApicidTopoInfo) {1, 7, 30, 2};
+    g_assert_cmpuint(apicid_module_width(&apicid_topo), ==, 3);
+    apicid_topo = (X86ApicidTopoInfo) {1, 8, 30, 2};
+    g_assert_cmpuint(apicid_module_width(&apicid_topo), ==, 3);
+    apicid_topo = (X86ApicidTopoInfo) {1, 9, 30, 2};
+    g_assert_cmpuint(apicid_module_width(&apicid_topo), ==, 4);
+
+    apicid_topo = (X86ApicidTopoInfo) {1, 6, 30, 2};
+    g_assert_cmpuint(apicid_die_width(&apicid_topo), ==, 0);
+    apicid_topo = (X86ApicidTopoInfo) {2, 6, 30, 2};
+    g_assert_cmpuint(apicid_die_width(&apicid_topo), ==, 1);
+    apicid_topo = (X86ApicidTopoInfo) {3, 6, 30, 2};
+    g_assert_cmpuint(apicid_die_width(&apicid_topo), ==, 2);
+    apicid_topo = (X86ApicidTopoInfo) {4, 6, 30, 2};
+    g_assert_cmpuint(apicid_die_width(&apicid_topo), ==, 2);
 
     /* build a weird topology and see if IDs are calculated correctly
      */
 
     /* This will use 2 bits for thread ID and 3 bits for core ID
      */
-    topo_info = (X86ApicidTopoInfo) {1, 1, 6, 3};
-    g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
-    g_assert_cmpuint(apicid_core_offset(&topo_info), ==, 2);
-    g_assert_cmpuint(apicid_module_offset(&topo_info), ==, 5);
-    g_assert_cmpuint(apicid_die_offset(&topo_info), ==, 5);
-    g_assert_cmpuint(apicid_pkg_offset(&topo_info), ==, 5);
-
-    topo_info = (X86ApicidTopoInfo) {1, 1, 6, 3};
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
-
-    topo_info = (X86ApicidTopoInfo) {1, 1, 6, 3};
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 0), ==,
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 6, 3};
+    g_assert_cmpuint(apicid_smt_width(&apicid_topo), ==, 2);
+    g_assert_cmpuint(apicid_core_offset(&apicid_topo), ==, 2);
+    g_assert_cmpuint(apicid_module_offset(&apicid_topo), ==, 5);
+    g_assert_cmpuint(apicid_die_offset(&apicid_topo), ==, 5);
+    g_assert_cmpuint(apicid_pkg_offset(&apicid_topo), ==, 5);
+
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 6, 3};
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 0), ==, 0);
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1), ==, 1);
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2), ==, 2);
+
+    apicid_topo = (X86ApicidTopoInfo) {1, 1, 6, 3};
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 0), ==,
                      (1 << 2) | 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 1), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 1), ==,
                      (1 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 2), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 2), ==,
                      (1 << 2) | 2);
 
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2 * 3 + 0), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 0), ==,
                      (2 << 2) | 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2 * 3 + 1), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 1), ==,
                      (2 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2 * 3 + 2), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 2), ==,
                      (2 << 2) | 2);
 
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 5 * 3 + 0), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 0), ==,
                      (5 << 2) | 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 5 * 3 + 1), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 1), ==,
                      (5 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 5 * 3 + 2), ==,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 2), ==,
                      (5 << 2) | 2);
 
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo,
                      1 * 6 * 3 + 0 * 3 + 0), ==, (1 << 5));
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo,
                      1 * 6 * 3 + 1 * 3 + 1), ==, (1 << 5) | (1 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info,
+    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo,
                      3 * 6 * 3 + 5 * 3 + 2), ==, (3 << 5) | (5 << 2) | 2);
 }
 
-- 
2.34.1


