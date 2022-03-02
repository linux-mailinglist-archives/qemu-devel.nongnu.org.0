Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20854CAED4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 20:36:27 +0100 (CET)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPUlt-00070z-Fy
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 14:36:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nPUX9-0000FJ-Nm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 14:21:12 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:45570
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nPUX6-0002Es-SO
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 14:21:11 -0500
HMM_SOURCE_IP: 172.18.0.188:52786.2076619004
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.98 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 978E2280095;
 Thu,  3 Mar 2022 03:21:03 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id bf532bc3ef1a474281167bf7ecd650fa for
 qemu-devel@nongnu.org; Thu, 03 Mar 2022 03:21:07 CST
X-Transaction-ID: bf532bc3ef1a474281167bf7ecd650fa
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v18 6/7] softmmu/dirtylimit: Implement virtual CPU throttle
Date: Thu,  3 Mar 2022 03:20:24 +0800
Message-Id: <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646247968.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1646247968.git.huangy81@chinatelecom.cn>
References: <cover.1646247968.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1646247968.git.huangy81@chinatelecom.cn>
References: <cover.1646247968.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Setup a negative feedback system when vCPU thread
handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
throttle_us_per_full field in struct CPUState. Sleep
throttle_us_per_full microseconds to throttle vCPU
if dirtylimit is in service.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c         |  19 ++-
 include/hw/core/cpu.h       |   6 +
 include/sysemu/dirtylimit.h |  15 +++
 softmmu/dirtylimit.c        | 291 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events        |   7 ++
 5 files changed, 337 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8821d80..98e43e6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -45,6 +45,7 @@
 #include "qemu/guest-random.h"
 #include "sysemu/hw_accel.h"
 #include "kvm-cpus.h"
+#include "sysemu/dirtylimit.h"
 
 #include "hw/boards.h"
 
@@ -476,6 +477,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
     cpu->dirty_pages = 0;
+    cpu->throttle_us_per_full = 0;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size < 0) {
@@ -1469,6 +1471,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
          */
         sleep(1);
 
+        /* keep sleeping so that dirtylimit not be interfered by reaper */
+        if (dirtylimit_in_service()) {
+            continue;
+        }
+
         trace_kvm_dirty_ring_reaper("wakeup");
         r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
 
@@ -2964,8 +2971,18 @@ int kvm_cpu_exec(CPUState *cpu)
              */
             trace_kvm_dirty_ring_full(cpu->cpu_index);
             qemu_mutex_lock_iothread();
-            kvm_dirty_ring_reap(kvm_state, NULL);
+            /* We throttle vCPU by making it sleep once it exit from kernel
+             * due to dirty ring full. In the dirtylimit scenario, reaping
+             * all vCPUs after a single vCPU dirty ring get full result in
+             * the miss of sleep, so just reap the ring-fulled vCPU.
+             */
+            if (dirtylimit_in_service()) {
+                kvm_dirty_ring_reap(kvm_state, cpu);
+            } else {
+                kvm_dirty_ring_reap(kvm_state, NULL);
+            }
             qemu_mutex_unlock_iothread();
+            dirtylimit_vcpu_execute(cpu);
             ret = 0;
             break;
         case KVM_EXIT_SYSTEM_EVENT:
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ab3b8..dbeb31a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -411,6 +411,12 @@ struct CPUState {
      */
     bool throttle_thread_scheduled;
 
+    /*
+     * Sleep throttle_us_per_full microseconds once dirty ring is full
+     * if dirty page rate limit is enabled.
+     */
+    int64_t throttle_us_per_full;
+
     bool ignore_memory_transaction_failures;
 
     /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
index da459f0..8d2c1f3 100644
--- a/include/sysemu/dirtylimit.h
+++ b/include/sysemu/dirtylimit.h
@@ -19,4 +19,19 @@ void vcpu_dirty_rate_stat_start(void);
 void vcpu_dirty_rate_stat_stop(void);
 void vcpu_dirty_rate_stat_initialize(void);
 void vcpu_dirty_rate_stat_finalize(void);
+
+void dirtylimit_state_lock(void);
+void dirtylimit_state_unlock(void);
+void dirtylimit_state_initialize(void);
+void dirtylimit_state_finalize(void);
+bool dirtylimit_in_service(void);
+bool dirtylimit_vcpu_index_valid(int cpu_index);
+void dirtylimit_process(void);
+void dirtylimit_change(bool start);
+void dirtylimit_set_vcpu(int cpu_index,
+                         uint64_t quota,
+                         bool enable);
+void dirtylimit_set_all(uint64_t quota,
+                        bool enable);
+void dirtylimit_vcpu_execute(CPUState *cpu);
 #endif
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 6102e8c..76d0b44 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -18,6 +18,26 @@
 #include "sysemu/dirtylimit.h"
 #include "exec/memory.h"
 #include "hw/boards.h"
+#include "sysemu/kvm.h"
+#include "trace.h"
+
+/*
+ * Dirtylimit stop working if dirty page rate error
+ * value less than DIRTYLIMIT_TOLERANCE_RANGE
+ */
+#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
+/*
+ * Plus or minus vcpu sleep time linearly if dirty
+ * page rate error value percentage over
+ * DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT.
+ * Otherwise, plus or minus a fixed vcpu sleep time.
+ */
+#define DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT     50
+/*
+ * Max vcpu sleep time percentage during a cycle
+ * composed of dirty ring full and sleep time.
+ */
+#define DIRTYLIMIT_THROTTLE_PCT_MAX 99
 
 struct {
     VcpuStat stat;
@@ -25,6 +45,30 @@ struct {
     QemuThread thread;
 } *vcpu_dirty_rate_stat;
 
+typedef struct VcpuDirtyLimitState {
+    int cpu_index;
+    bool enabled;
+    /*
+     * Quota dirty page rate, unit is MB/s
+     * zero if not enabled.
+     */
+    uint64_t quota;
+} VcpuDirtyLimitState;
+
+struct {
+    VcpuDirtyLimitState *states;
+    /* Max cpus number configured by user */
+    int max_cpus;
+    /* Number of vcpu under dirtylimit */
+    int limited_nvcpu;
+} *dirtylimit_state;
+
+/* protect dirtylimit_state */
+static QemuMutex dirtylimit_mutex;
+
+/* dirtylimit thread quit if dirtylimit_quit is true */
+static bool dirtylimit_quit;
+
 static void vcpu_dirty_rate_stat_collect(void)
 {
     VcpuStat stat;
@@ -54,6 +98,9 @@ static void *vcpu_dirty_rate_stat_thread(void *opaque)
 
     while (qatomic_read(&vcpu_dirty_rate_stat->running)) {
         vcpu_dirty_rate_stat_collect();
+        if (dirtylimit_in_service()) {
+            dirtylimit_process();
+        }
     }
 
     /* stop log sync */
@@ -86,9 +133,11 @@ void vcpu_dirty_rate_stat_start(void)
 void vcpu_dirty_rate_stat_stop(void)
 {
     qatomic_set(&vcpu_dirty_rate_stat->running, 0);
+    dirtylimit_state_unlock();
     qemu_mutex_unlock_iothread();
     qemu_thread_join(&vcpu_dirty_rate_stat->thread);
     qemu_mutex_lock_iothread();
+    dirtylimit_state_lock();
 }
 
 void vcpu_dirty_rate_stat_initialize(void)
@@ -114,3 +163,245 @@ void vcpu_dirty_rate_stat_finalize(void)
     free(vcpu_dirty_rate_stat);
     vcpu_dirty_rate_stat = NULL;
 }
+
+void dirtylimit_state_lock(void)
+{
+    qemu_mutex_lock(&dirtylimit_mutex);
+}
+
+void dirtylimit_state_unlock(void)
+{
+    qemu_mutex_unlock(&dirtylimit_mutex);
+}
+
+static void
+__attribute__((__constructor__)) dirtylimit_mutex_init(void)
+{
+    qemu_mutex_init(&dirtylimit_mutex);
+}
+
+static inline VcpuDirtyLimitState *dirtylimit_vcpu_get_state(int cpu_index)
+{
+    return &dirtylimit_state->states[cpu_index];
+}
+
+void dirtylimit_state_initialize(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int max_cpus = ms->smp.max_cpus;
+    int i;
+
+    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
+
+    dirtylimit_state->states =
+            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
+
+    for (i = 0; i < max_cpus; i++) {
+        dirtylimit_state->states[i].cpu_index = i;
+    }
+
+    dirtylimit_state->max_cpus = max_cpus;
+    trace_dirtylimit_state_initialize(max_cpus);
+}
+
+void dirtylimit_state_finalize(void)
+{
+    free(dirtylimit_state->states);
+    dirtylimit_state->states = NULL;
+
+    free(dirtylimit_state);
+    dirtylimit_state = NULL;
+
+    trace_dirtylimit_state_finalize();
+}
+
+bool dirtylimit_in_service(void)
+{
+    return !!dirtylimit_state;
+}
+
+bool dirtylimit_vcpu_index_valid(int cpu_index)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    return !(cpu_index < 0 ||
+             cpu_index >= ms->smp.max_cpus);
+}
+
+static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
+{
+    static uint64_t max_dirtyrate;
+    uint32_t dirty_ring_size = kvm_dirty_ring_size();
+    uint64_t dirty_ring_size_meory_MB =
+        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
+
+    if (max_dirtyrate < dirtyrate) {
+        max_dirtyrate = dirtyrate;
+    }
+
+    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
+}
+
+static inline bool dirtylimit_done(uint64_t quota,
+                                   uint64_t current)
+{
+    uint64_t min, max;
+
+    min = MIN(quota, current);
+    max = MAX(quota, current);
+
+    return ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
+}
+
+static inline bool
+dirtylimit_need_linear_adjustment(uint64_t quota,
+                                  uint64_t current)
+{
+    uint64_t min, max;
+
+    min = MIN(quota, current);
+    max = MAX(quota, current);
+
+    return ((max - min) * 100 / max) > DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
+}
+
+static void dirtylimit_set_throttle(CPUState *cpu,
+                                    uint64_t quota,
+                                    uint64_t current)
+{
+    int64_t ring_full_time_us = 0;
+    uint64_t sleep_pct = 0;
+    uint64_t throttle_us = 0;
+
+    if (current == 0) {
+        cpu->throttle_us_per_full = 0;
+        return;
+    }
+
+    ring_full_time_us = dirtylimit_dirty_ring_full_time(current);
+
+    if (dirtylimit_need_linear_adjustment(quota, current)) {
+        if (quota < current) {
+            sleep_pct = (current - quota) * 100 / current;
+            throttle_us =
+                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
+            cpu->throttle_us_per_full += throttle_us;
+        } else {
+            sleep_pct = (quota - current) * 100 / quota;
+            throttle_us =
+                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
+            cpu->throttle_us_per_full -= throttle_us;
+        }
+
+        trace_dirtylimit_throttle_pct(cpu->cpu_index,
+                                      sleep_pct,
+                                      throttle_us);
+    } else {
+        if (quota < current) {
+            cpu->throttle_us_per_full += ring_full_time_us / 10;
+        } else {
+            cpu->throttle_us_per_full -= ring_full_time_us / 10;
+        }
+    }
+
+    /*
+     * TODO: in the big kvm_dirty_ring_size case (eg: 65536, or other scenario),
+     *       current dirty page rate may never reach the quota, we should stop
+     *       increasing sleep time?
+     */
+    cpu->throttle_us_per_full = MIN(cpu->throttle_us_per_full,
+        ring_full_time_us * DIRTYLIMIT_THROTTLE_PCT_MAX);
+
+    cpu->throttle_us_per_full = MAX(cpu->throttle_us_per_full, 0);
+}
+
+static void dirtylimit_adjust_throttle(CPUState *cpu)
+{
+    uint64_t quota = 0;
+    uint64_t current = 0;
+    int cpu_index = cpu->cpu_index;
+
+    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
+    current = vcpu_dirty_rate_get(cpu_index);
+
+    if (!dirtylimit_done(quota, current)) {
+        dirtylimit_set_throttle(cpu, quota, current);
+    }
+
+    return;
+}
+
+void dirtylimit_process(void)
+{
+    CPUState *cpu;
+
+    if (!qatomic_read(&dirtylimit_quit)) {
+        dirtylimit_state_lock();
+
+        if (!dirtylimit_in_service()) {
+            dirtylimit_state_unlock();
+            return;
+        }
+
+        CPU_FOREACH(cpu) {
+            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
+                continue;
+            }
+            dirtylimit_adjust_throttle(cpu);
+        }
+        dirtylimit_state_unlock();
+    }
+}
+
+void dirtylimit_change(bool start)
+{
+    if (start) {
+        qatomic_set(&dirtylimit_quit, 0);
+    } else {
+        qatomic_set(&dirtylimit_quit, 1);
+    }
+}
+
+void dirtylimit_set_vcpu(int cpu_index,
+                         uint64_t quota,
+                         bool enable)
+{
+    trace_dirtylimit_set_vcpu(cpu_index, quota);
+
+    if (enable) {
+        dirtylimit_state->states[cpu_index].quota = quota;
+        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
+            dirtylimit_state->limited_nvcpu++;
+        }
+    } else {
+        dirtylimit_state->states[cpu_index].quota = 0;
+        if (dirtylimit_state->states[cpu_index].enabled) {
+            dirtylimit_state->limited_nvcpu--;
+        }
+    }
+
+    dirtylimit_state->states[cpu_index].enabled = enable;
+}
+
+void dirtylimit_set_all(uint64_t quota,
+                        bool enable)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int max_cpus = ms->smp.max_cpus;
+    int i;
+
+    for (i = 0; i < max_cpus; i++) {
+        dirtylimit_set_vcpu(i, quota, enable);
+    }
+}
+
+void dirtylimit_vcpu_execute(CPUState *cpu)
+{
+    if (dirtylimit_in_service() &&
+        dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled &&
+        cpu->throttle_us_per_full) {
+        trace_dirtylimit_vcpu_execute(cpu->cpu_index,
+                cpu->throttle_us_per_full);
+        usleep(cpu->throttle_us_per_full);
+    }
+}
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887..22606dc 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -31,3 +31,10 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
 system_wakeup_request(int reason) "reason=%d"
 qemu_system_shutdown_request(int reason) "reason=%d"
 qemu_system_powerdown_request(void) ""
+
+#dirtylimit.c
+dirtylimit_state_initialize(int max_cpus) "dirtylimit state initialize: max cpus %d"
+dirtylimit_state_finalize(void)
+dirtylimit_throttle_pct(int cpu_index, uint64_t pct, int64_t time_us) "CPU[%d] throttle percent: %" PRIu64 ", throttle adjust time %"PRIi64 " us"
+dirtylimit_set_vcpu(int cpu_index, uint64_t quota) "CPU[%d] set dirty page rate limit %"PRIu64
+dirtylimit_vcpu_execute(int cpu_index, int64_t sleep_time_us) "CPU[%d] sleep %"PRIi64 " us"
-- 
1.8.3.1


