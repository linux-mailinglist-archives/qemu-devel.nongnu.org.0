Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D450A4846E0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:18:49 +0100 (CET)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4nST-0001w1-0n
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n4nOQ-000452-0A
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:14:38 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:48554
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n4nOM-00009I-4C
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:14:36 -0500
HMM_SOURCE_IP: 172.18.0.218:33794.643395762
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.99 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D184F280099;
 Wed,  5 Jan 2022 01:14:29 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f3d0e93427eb426d843a02d9d93ba84a for
 qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:14:32 CST
X-Transaction-ID: f3d0e93427eb426d843a02d9d93ba84a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Date: Wed,  5 Jan 2022 01:14:08 +0800
Message-Id: <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641315745.git.huangy81@chinatelecom.cn>
References: <cover.1641315745.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1641316375.git.huangy81@chinatelecom.cn>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
if dirtylimit is enabled.

Start a thread to track current dirty page rates and
tune the throttle_us_per_full dynamically untill current
dirty page rate reach the quota.

Introduce the util function in the header for dirtylimit
implementation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 accel/kvm/kvm-all.c         |   8 +
 include/hw/core/cpu.h       |   6 +
 include/sysemu/dirtylimit.h |  12 ++
 include/sysemu/kvm.h        |   2 +
 qapi/migration.json         |  19 +++
 softmmu/dirtylimit.c        | 357 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events        |   8 +
 7 files changed, 412 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0e66ebb..908d954 100644
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
@@ -2309,6 +2311,11 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+uint32_t kvm_dirty_ring_size(void)
+{
+    return kvm_state->kvm_dirty_ring_size;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -2958,6 +2965,7 @@ int kvm_cpu_exec(CPUState *cpu)
             qemu_mutex_lock_iothread();
             kvm_dirty_ring_reap(kvm_state);
             qemu_mutex_unlock_iothread();
+            dirtylimit_vcpu_execute(cpu);
             ret = 0;
             break;
         case KVM_EXIT_SYSTEM_EVENT:
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81..9631c1e 100644
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
 
     struct hax_vcpu_state *hax_vcpu;
diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
index da459f0..6eadd16 100644
--- a/include/sysemu/dirtylimit.h
+++ b/include/sysemu/dirtylimit.h
@@ -19,4 +19,16 @@ void vcpu_dirty_rate_stat_start(void);
 void vcpu_dirty_rate_stat_stop(void);
 void vcpu_dirty_rate_stat_initialize(void);
 void vcpu_dirty_rate_stat_finalize(void);
+
+void dirtylimit_state_initialize(void);
+void dirtylimit_state_finalize(void);
+void dirtylimit_thread_finalize(void);
+bool dirtylimit_in_service(void);
+bool dirtylimit_vcpu_index_valid(int cpu_index);
+void dirtylimit_set_vcpu(int cpu_index,
+                         uint64_t quota,
+                         bool enable);
+void dirtylimit_set_all(uint64_t quota,
+                        bool enable);
+void dirtylimit_vcpu_execute(CPUState *cpu);
 #endif
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6eb39a0..bc3f0b5 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -563,4 +563,6 @@ bool kvm_cpu_check_are_resettable(void);
 bool kvm_arch_cpu_check_are_resettable(void);
 
 bool kvm_dirty_ring_enabled(void);
+
+uint32_t kvm_dirty_ring_size(void);
 #endif
diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48c..ac5fa56 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1850,6 +1850,25 @@
 { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
 
 ##
+# @DirtyLimitInfo:
+#
+# Dirty page rate limit information of virtual CPU.
+#
+# @cpu-index: index of virtual CPU.
+#
+# @limit-rate: upper limit of dirty page rate for virtual CPU.
+#
+# @current-rate: current dirty page rate for virtual CPU.
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'DirtyLimitInfo',
+  'data': { 'cpu-index': 'int',
+            'limit-rate': 'int64',
+            'current-rate': 'int64' } }
+
+##
 # @snapshot-save:
 #
 # Save a VM snapshot
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index a10ac6f..c9f5745 100644
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
@@ -25,6 +45,36 @@ struct {
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
+    /*
+     * How many times that the current dirty page
+     * rate unmatch the quota dirty page rate.
+     */
+    int unmatched_cnt;
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
+static QemuThread dirtylimit_thr;
+
+/* dirtylimit thread quit if dirtylimit_quit is true */
+static bool dirtylimit_quit;
+
 static void vcpu_dirty_rate_stat_collect(void)
 {
     int64_t start_time;
@@ -118,3 +168,310 @@ void vcpu_dirty_rate_stat_finalize(void)
     free(vcpu_dirty_rate_stat);
     vcpu_dirty_rate_stat = NULL;
 }
+
+static void dirtylimit_state_lock(void)
+{
+    qemu_mutex_lock(&dirtylimit_mutex);
+}
+
+static void dirtylimit_state_unlock(void)
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
+static inline void dirtylimit_vcpu_set_quota(int cpu_index,
+                                             uint64_t quota,
+                                             bool on)
+{
+    dirtylimit_state->states[cpu_index].quota = quota;
+    if (on) {
+        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
+            dirtylimit_state->limited_nvcpu++;
+        }
+    } else {
+        if (dirtylimit_state->states[cpu_index].enabled) {
+            dirtylimit_state->limited_nvcpu--;
+        }
+    }
+
+    dirtylimit_state->states[cpu_index].enabled = on;
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
+    uint64_t min, max, pct;
+
+    min = MIN(quota, current);
+    max = MAX(quota, current);
+
+    pct = (max - min) * 100 / max;
+
+    return pct > DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
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
+    if (current == 0 &&
+        dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt == 0) {
+        cpu->throttle_us_per_full = 0;
+        goto end;
+    } else if (++dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt
+               < 2) {
+        goto end;
+    } else if (dirtylimit_done(quota, current)) {
+        goto end;
+    } else {
+        dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt = 0;
+        dirtylimit_set_throttle(cpu, quota, current);
+    }
+end:
+    trace_dirtylimit_adjust_throttle(cpu_index,
+                                     quota, current,
+                                     cpu->throttle_us_per_full);
+    return;
+}
+
+static void *dirtylimit_thread(void *opaque)
+{
+    CPUState *cpu;
+
+    rcu_register_thread();
+
+    while (!qatomic_read(&dirtylimit_quit)) {
+        sleep(DIRTYLIMIT_CALC_TIME_MS / 1000);
+
+        dirtylimit_state_lock();
+
+        if (!dirtylimit_in_service()) {
+            dirtylimit_state_unlock();
+            break;
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
+
+    rcu_unregister_thread();
+
+    return NULL;
+}
+
+static void dirtylimit_thread_start(void)
+{
+    qatomic_set(&dirtylimit_quit, 0);
+    qemu_thread_create(&dirtylimit_thr,
+                       "dirtylimit",
+                       dirtylimit_thread,
+                       NULL,
+                       QEMU_THREAD_JOINABLE);
+}
+
+static void dirtylimit_thread_stop(void)
+{
+    qatomic_set(&dirtylimit_quit, 1);
+    qemu_mutex_unlock_iothread();
+    qemu_thread_join(&dirtylimit_thr);
+    qemu_mutex_lock_iothread();
+}
+
+void dirtylimit_set_vcpu(int cpu_index,
+                         uint64_t quota,
+                         bool enable)
+{
+    trace_dirtylimit_set_vcpu(cpu_index, quota);
+
+    if (enable) {
+        if (dirtylimit_in_service()) {
+            /* only set the vcpu dirty page rate limit */
+            dirtylimit_vcpu_set_quota(cpu_index, quota, true);
+            return;
+        }
+
+        /* initialize state when set dirtylimit first time */
+        dirtylimit_state_lock();
+        dirtylimit_state_initialize();
+        dirtylimit_vcpu_set_quota(cpu_index, quota, true);
+        dirtylimit_state_unlock();
+
+        dirtylimit_thread_start();
+    } else {
+        if (!dirtylimit_in_service()) {
+            return;
+        }
+
+        dirtylimit_state_lock();
+        /* dirty page rate limit is not enabled */
+        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
+            dirtylimit_state_unlock();
+            return;
+        }
+
+        /* switch off vcpu dirty page rate limit */
+        dirtylimit_vcpu_set_quota(cpu_index, 0, false);
+        dirtylimit_state_unlock();
+
+        if (!dirtylimit_state->limited_nvcpu) {
+            dirtylimit_thread_stop();
+
+            dirtylimit_state_lock();
+            dirtylimit_state_finalize();
+            dirtylimit_state_unlock();
+        }
+    }
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
index 9c88887..ff441ac 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -31,3 +31,11 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
 system_wakeup_request(int reason) "reason=%d"
 qemu_system_shutdown_request(int reason) "reason=%d"
 qemu_system_powerdown_request(void) ""
+
+#dirtylimit.c
+dirtylimit_state_initialize(int max_cpus) "dirtylimit state initialize: max cpus %d"
+dirtylimit_state_finalize(void)
+dirtylimit_adjust_throttle(int cpu_index, uint64_t quota, uint64_t current, int64_t time_us) "CPU[%d] throttle: quota %" PRIu64 ", current %" PRIu64 ", throttle %"PRIi64 " us"
+dirtylimit_throttle_pct(int cpu_index, uint64_t pct, int64_t time_us) "CPU[%d] throttle percent: %" PRIu64 ", throttle adjust time %"PRIi64 " us"
+dirtylimit_set_vcpu(int cpu_index, uint64_t quota) "CPU[%d] set dirty page rate limit %"PRIu64
+dirtylimit_vcpu_execute(int cpu_index, int64_t sleep_time_us) "CPU[%d] sleep %"PRIi64 " us"
-- 
1.8.3.1


