Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9214685
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 10:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNZA5-0006Ya-Dy
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 04:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hNZ5P-0002qP-Dg
	for qemu-devel@nongnu.org; Mon, 06 May 2019 04:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hNZ5L-0007Is-Rl
	for qemu-devel@nongnu.org; Mon, 06 May 2019 04:34:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:60066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hNZ5L-0007EJ-8J
	for qemu-devel@nongnu.org; Mon, 06 May 2019 04:34:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 May 2019 01:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,437,1549958400"; d="scan'208";a="155407090"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by FMSMGA003.fm.intel.com with ESMTP; 06 May 2019 01:34:45 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 16:33:09 +0800
Message-Id: <1557131596-25403-4-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1557131596-25403-1-git-send-email-like.xu@linux.intel.com>
References: <1557131596-25403-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH v2 03/10] cpu/topology: replace global smp
 variables by MachineState in general path
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Basically, the context could get the MachineState reference via call
chains or unrecommend qdev_get_machine() in !CONFIG_USER_ONLY mode.

A new variable of the same name would be introduced in the declaration
phase out of less effort OR replace it on the spot if it's only used
once in the context. No semantic changes.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 accel/kvm/kvm-all.c          |  4 ++--
 backends/hostmem.c           |  6 ++++--
 cpus.c                       |  6 ++++--
 exec.c                       |  3 ++-
 gdbstub.c                    |  4 ++++
 hw/cpu/core.c                |  4 +++-
 migration/postcopy-ram.c     |  8 +++++++-
 numa.c                       |  1 +
 target/openrisc/sys_helper.c |  6 +++++-
 tcg/tcg.c                    | 13 ++++++++++++-
 10 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 524c4dd..f8ef39d 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1533,8 +1533,8 @@ static int kvm_init(MachineState *ms)
         const char *name;
         int num;
     } num_cpus[] = {
-        { "SMP",          smp_cpus },
-        { "hotpluggable", max_cpus },
+        { "SMP",          ms->smp.cpus },
+        { "hotpluggable", ms->smp.max_cpus },
         { NULL, }
     }, *nc = num_cpus;
     int soft_vcpus_limit, hard_vcpus_limit;
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 04baf47..463102a 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -222,6 +222,7 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
 {
     Error *local_err = NULL;
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+    MachineState *ms = MACHINE(qdev_get_machine());
 
     if (backend->force_prealloc) {
         if (value) {
@@ -241,7 +242,7 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
         void *ptr = memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz = memory_region_size(&backend->mr);
 
-        os_mem_prealloc(fd, ptr, sz, smp_cpus, &local_err);
+        os_mem_prealloc(fd, ptr, sz, ms->smp.cpus, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -311,6 +312,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(uc);
     HostMemoryBackendClass *bc = MEMORY_BACKEND_GET_CLASS(uc);
+    MachineState *ms = MACHINE(qdev_get_machine());
     Error *local_err = NULL;
     void *ptr;
     uint64_t sz;
@@ -375,7 +377,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          */
         if (backend->prealloc) {
             os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
-                            smp_cpus, &local_err);
+                            ms->smp.cpus, &local_err);
             if (local_err) {
                 goto out;
             }
diff --git a/cpus.c b/cpus.c
index e58e7ab..b49db36 100644
--- a/cpus.c
+++ b/cpus.c
@@ -2068,8 +2068,10 @@ static void qemu_dummy_start_vcpu(CPUState *cpu)
 
 void qemu_init_vcpu(CPUState *cpu)
 {
-    cpu->nr_cores = smp_cores;
-    cpu->nr_threads = smp_threads;
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    cpu->nr_cores = ms->smp.cores;
+    cpu->nr_threads =  ms->smp.threads;
     cpu->stopped = true;
 
     if (!cpu->as) {
diff --git a/exec.c b/exec.c
index 4e73477..2744df6 100644
--- a/exec.c
+++ b/exec.c
@@ -1871,6 +1871,7 @@ static void *file_ram_alloc(RAMBlock *block,
                             bool truncate,
                             Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     void *area;
 
     block->page_size = qemu_fd_getpagesize(fd);
@@ -1927,7 +1928,7 @@ static void *file_ram_alloc(RAMBlock *block,
     }
 
     if (mem_prealloc) {
-        os_mem_prealloc(fd, area, memory, smp_cpus, errp);
+        os_mem_prealloc(fd, area, memory, ms->smp.cpus, errp);
         if (errp && *errp) {
             qemu_ram_munmap(fd, area, memory);
             return NULL;
diff --git a/gdbstub.c b/gdbstub.c
index d54abd1..dba37df 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -30,6 +30,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/gdbstub.h"
 #include "hw/cpu/cluster.h"
+#include "hw/boards.h"
 #endif
 
 #define MAX_PACKET_LENGTH 4096
@@ -1159,6 +1160,9 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
     CPU_FOREACH(cpu) {
         max_cpus = max_cpus <= cpu->cpu_index ? cpu->cpu_index + 1 : max_cpus;
     }
+#else
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->smp.max_cpus;
 #endif
     /* uninitialised CPUs stay 0 */
     newstates = g_new0(char, max_cpus);
diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 7e42e2c..be2c7e1 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -11,6 +11,7 @@
 #include "qapi/visitor.h"
 #include "qapi/error.h"
 #include "sysemu/cpus.h"
+#include "hw/boards.h"
 
 static void core_prop_get_core_id(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
@@ -69,13 +70,14 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
 
 static void cpu_core_instance_init(Object *obj)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     CPUCore *core = CPU_CORE(obj);
 
     object_property_add(obj, "core-id", "int", core_prop_get_core_id,
                         core_prop_set_core_id, NULL, NULL, NULL);
     object_property_add(obj, "nr-threads", "int", core_prop_get_nr_threads,
                         core_prop_set_nr_threads, NULL, NULL, NULL);
-    core->nr_threads = smp_threads;
+    core->nr_threads = ms->smp.threads;
 }
 
 static void cpu_core_class_init(ObjectClass *oc, void *data)
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e2aa57a..390e7ea 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -29,6 +29,7 @@
 #include "sysemu/balloon.h"
 #include "qemu/error-report.h"
 #include "trace.h"
+#include "hw/boards.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -128,6 +129,8 @@ static void migration_exit_cb(Notifier *n, void *data)
 
 static struct PostcopyBlocktimeContext *blocktime_context_new(void)
 {
+    MachineState *macs = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = macs->smp.cpus;
     PostcopyBlocktimeContext *ctx = g_new0(PostcopyBlocktimeContext, 1);
     ctx->page_fault_vcpu_time = g_new0(uint32_t, smp_cpus);
     ctx->vcpu_addr = g_new0(uintptr_t, smp_cpus);
@@ -141,10 +144,11 @@ static struct PostcopyBlocktimeContext *blocktime_context_new(void)
 
 static uint32List *get_vcpu_blocktime_list(PostcopyBlocktimeContext *ctx)
 {
+    MachineState *macs = MACHINE(qdev_get_machine());
     uint32List *list = NULL, *entry = NULL;
     int i;
 
-    for (i = smp_cpus - 1; i >= 0; i--) {
+    for (i = macs->smp.cpus - 1; i >= 0; i--) {
         entry = g_new0(uint32List, 1);
         entry->value = ctx->vcpu_blocktime[i];
         entry->next = list;
@@ -807,6 +811,8 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     PostcopyBlocktimeContext *dc = mis->blocktime_ctx;
+    MachineState *macs = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = macs->smp.cpus;
     int i, affected_cpu = 0;
     bool vcpu_total_blocktime = false;
     uint32_t read_vcpu_time, low_time_offset;
diff --git a/numa.c b/numa.c
index 3875e1e..844be01 100644
--- a/numa.c
+++ b/numa.c
@@ -64,6 +64,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
     uint16_t nodenr;
     uint16List *cpus = NULL;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    unsigned int max_cpus = ms->smp.max_cpus;
 
     if (node->has_nodeid) {
         nodenr = node->nodeid;
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 05f66c4..deae88f 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -24,6 +24,9 @@
 #include "exec/helper-proto.h"
 #include "exception.h"
 #include "sysemu/sysemu.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/boards.h"
+#endif
 
 #define TO_SPR(group, number) (((group) << 11) + (number))
 
@@ -194,6 +197,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
                            target_ulong spr)
 {
 #ifndef CONFIG_USER_ONLY
+    MachineState *ms = MACHINE(qdev_get_machine());
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
     int idx;
@@ -241,7 +245,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return cpu->parent_obj.cpu_index;
 
     case TO_SPR(0, 129): /* NUMCORES */
-        return max_cpus;
+        return ms->smp.max_cpus;
 
     case TO_SPR(0, 1024) ... TO_SPR(0, 1024 + (16 * 32)): /* Shadow GPRs */
         idx = (spr - 1024);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f7bef51..62f3770 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -45,6 +45,10 @@
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/boards.h"
+#endif
+
 #include "tcg-op.h"
 
 #if UINTPTR_MAX == UINT32_MAX
@@ -599,6 +603,10 @@ static size_t tcg_n_regions(void)
     size_t i;
 
     /* Use a single region if all we have is one vCPU thread */
+#if !defined(CONFIG_USER_ONLY)
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->smp.max_cpus;
+#endif
     if (max_cpus == 1 || !qemu_tcg_mttcg_enabled()) {
         return 1;
     }
@@ -731,6 +739,7 @@ void tcg_register_thread(void)
 #else
 void tcg_register_thread(void)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
     bool err;
@@ -748,7 +757,7 @@ void tcg_register_thread(void)
 
     /* Claim an entry in tcg_ctxs */
     n = atomic_fetch_inc(&n_tcg_ctxs);
-    g_assert(n < max_cpus);
+    g_assert(n < ms->smp.max_cpus);
     atomic_set(&tcg_ctxs[n], s);
 
     tcg_ctx = s;
@@ -958,6 +967,8 @@ void tcg_context_init(TCGContext *s)
     tcg_ctxs = &tcg_ctx;
     n_tcg_ctxs = 1;
 #else
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->smp.max_cpus;
     tcg_ctxs = g_new(TCGContext *, max_cpus);
 #endif
 
-- 
1.8.3.1


