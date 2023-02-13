Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFAC6941AA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:45:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNw-0006t2-3f; Mon, 13 Feb 2023 04:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNu-0006mw-1c
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:30 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNp-0002kj-DG
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281465; x=1707817465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5DrmYMKOI+tRm9NDyBxo7J+PkI2m6jgkxVWM1yyilpM=;
 b=P4fZ8ztd3k+4wvYyK71z4SZoug9/mjkDmsBku8UXkYilmLn+QRR9pJbF
 JuGo3W+wOtuIoqcoUvX5eJHb8xtIFDnbcPrBJMusY6f+AmdOmmQr5M1OP
 Y0l5xrOPv6ELKAfOZEwJikEskjj+zwuVQIx715j1FYQjRSXR5xFO3tn1C
 slEKS+wTaBy6JXWo/cegN6030jkWr6DTETlDaDE7oFTPFBn8Dgral2ppO
 CdA9p6fjpKYfbp+ZLaS7iHfgBWOK9lNsw4kkqySaDKM60Zq8VM2yBEN0h
 Uan2ss8UHpeGVpJqdz33sM570WLH1DAviUOs3Py+ZBUSGHfV28Zs8II0S g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486601"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760007"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760007"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:07 -0800
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
Subject: [RFC 18/52] general: Replace MachineState.smp access with topology
 helpers
Date: Mon, 13 Feb 2023 17:50:01 +0800
Message-Id: <20230213095035.158240-19-zhao1.liu@linux.intel.com>
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

When "threads" or "cores" are not asked for, smp and hybrid topology do
not affect the access of topology information.

For these generic codes, it is straightforward to replace topology access
with wrapped interfaces.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 2 +-
 accel/tcg/tcg-all.c             | 2 +-
 backends/hostmem.c              | 2 +-
 gdbstub/gdbstub.c               | 2 +-
 hw/core/numa.c                  | 2 +-
 hw/virtio/virtio-pci.c          | 2 +-
 softmmu/dirtylimit.c            | 8 ++++----
 softmmu/vl.c                    | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index d50239e0e28f..5fee991108dd 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -140,7 +140,7 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
     g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
+    tcg_cpu_init_cflags(cpu, machine_topo_get_max_cpus(current_machine) > 1);
 
     cpu->thread = g_new0(QemuThread, 1);
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 30b503fb22fc..088af3b6f103 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -116,7 +116,7 @@ static int tcg_init_machine(MachineState *ms)
 #ifdef CONFIG_USER_ONLY
     unsigned max_cpus = 1;
 #else
-    unsigned max_cpus = ms->smp.max_cpus;
+    unsigned max_cpus = machine_topo_get_max_cpus(ms);
 #endif
 
     tcg_allowed = true;
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 747e7838c031..43fcee4c302d 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -280,7 +280,7 @@ static void host_memory_backend_init(Object *obj)
     backend->merge = machine_mem_merge(machine);
     backend->dump = machine_dump_guest_core(machine);
     backend->reserve = true;
-    backend->prealloc_threads = machine->smp.cpus;
+    backend->prealloc_threads = machine_topo_get_cpus(machine);
 }
 
 static void host_memory_backend_post_init(Object *obj)
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be88ca0d7182..bc283778be86 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1120,7 +1120,7 @@ static int gdb_handle_vcont(const char *p)
     }
 #else
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
 #endif
     /* uninitialised CPUs stay 0 */
     newstates = g_new0(char, max_cpus);
diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d80b..dfe14291c518 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -68,7 +68,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
     uint16_t nodenr;
     uint16List *cpus = NULL;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
     NodeInfo *numa_info = ms->numa_state->nodes;
 
     if (node->has_nodeid) {
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 247325c1933c..952fcdcca78e 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2438,7 +2438,7 @@ unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues)
      * doing so arbitrarily would result in a sudden performance drop once the
      * threshold number of vCPUs is exceeded.
      */
-    unsigned num_queues = current_machine->smp.cpus;
+    unsigned num_queues = machine_topo_get_cpus(current_machine);
 
     /*
      * The maximum number of MSI-X vectors is PCI_MSIX_FLAGS_QSIZE + 1, but the
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index c56f0f58c8c9..4aa6b405d3be 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -146,7 +146,7 @@ void vcpu_dirty_rate_stat_stop(void)
 void vcpu_dirty_rate_stat_initialize(void)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    int max_cpus = ms->smp.max_cpus;
+    int max_cpus = machine_topo_get_max_cpus(ms);
 
     vcpu_dirty_rate_stat =
         g_malloc0(sizeof(*vcpu_dirty_rate_stat));
@@ -191,7 +191,7 @@ static inline VcpuDirtyLimitState *dirtylimit_vcpu_get_state(int cpu_index)
 void dirtylimit_state_initialize(void)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    int max_cpus = ms->smp.max_cpus;
+    int max_cpus = machine_topo_get_max_cpus(ms);
     int i;
 
     dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
@@ -228,7 +228,7 @@ bool dirtylimit_vcpu_index_valid(int cpu_index)
     MachineState *ms = MACHINE(qdev_get_machine());
 
     return !(cpu_index < 0 ||
-             cpu_index >= ms->smp.max_cpus);
+             cpu_index >= machine_topo_get_max_cpus(ms));
 }
 
 static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
@@ -390,7 +390,7 @@ void dirtylimit_set_all(uint64_t quota,
                         bool enable)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    int max_cpus = ms->smp.max_cpus;
+    int max_cpus = machine_topo_get_max_cpus(ms);
     int i;
 
     for (i = 0; i < max_cpus; i++) {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b2ee3fee3f06..0547ad390f52 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1851,7 +1851,7 @@ static void qemu_apply_machine_options(QDict *qdict)
         semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
     }
 
-    if (current_machine->smp.cpus > 1) {
+    if (machine_topo_get_cpus(current_machine) > 1) {
         Error *blocker = NULL;
         error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
         replay_add_blocker(blocker);
-- 
2.34.1


