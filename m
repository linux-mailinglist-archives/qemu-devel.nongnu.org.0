Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE918461BBE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 17:28:24 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrjVv-00060b-Fb
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 11:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mrjUc-0005K6-3E
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:27:03 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:45588
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mrjUR-0003Po-BO
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:27:01 -0500
HMM_SOURCE_IP: 172.18.0.218:47794.1234783482
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.33 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C28DF280079;
 Tue, 30 Nov 2021 00:26:09 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 88031bd5a5ae46f9abc9ed19304d697e for
 qemu-devel@nongnu.org; Tue, 30 Nov 2021 00:26:16 CST
X-Transaction-ID: 88031bd5a5ae46f9abc9ed19304d697e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 2/3] cpu-throttle: implement vCPU throttle
Date: Tue, 30 Nov 2021 00:26:11 +0800
Message-Id: <5f6382c1ca862e7c00f90e7ec8260de711717fa1.1638202004.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1638202004.git.huangy81@chinatelecom.cn>
References: <cover.1638202004.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Impose dirty restraint on vCPU by kicking it and sleep
as the auto-converge does during migration, but just
kick the specified vCPU instead, not all vCPUs of vm.

Start a thread to track the dirtylimit status and adjust
the throttle pencentage dynamically depend on current
and quota dirtyrate.

Introduce the util function in the header for dirtylimit
implementation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/sysemu/cpu-throttle.h |  30 ++++
 softmmu/cpu-throttle.c        | 316 ++++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events          |   5 +
 3 files changed, 351 insertions(+)

diff --git a/include/sysemu/cpu-throttle.h b/include/sysemu/cpu-throttle.h
index d65bdef..334e5e2 100644
--- a/include/sysemu/cpu-throttle.h
+++ b/include/sysemu/cpu-throttle.h
@@ -65,4 +65,34 @@ bool cpu_throttle_active(void);
  */
 int cpu_throttle_get_percentage(void);
 
+/**
+ * dirtylimit_enabled
+ *
+ * Returns: %true if dirty page limit for vCPU is enabled, %false otherwise.
+ */
+bool dirtylimit_enabled(int cpu_index);
+
+/**
+ * dirtylimit_state_init:
+ *
+ * initialize golobal state for dirtylimit
+ */
+void dirtylimit_state_init(int max_cpus);
+
+/**
+ * dirtylimit_vcpu:
+ *
+ * impose dirtylimit on vcpu util reaching the quota dirtyrate
+ */
+void dirtylimit_vcpu(int cpu_index,
+                     uint64_t quota);
+/**
+ * dirtylimit_cancel_vcpu:
+ *
+ * cancel dirtylimit for the specified vcpu
+ *
+ * Returns: the number of running threads for dirtylimit
+ */
+int dirtylimit_cancel_vcpu(int cpu_index);
+
 #endif /* SYSEMU_CPU_THROTTLE_H */
diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index 8c2144a..f199d68 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -29,6 +29,8 @@
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/dirtylimit.h"
+#include "trace.h"
 
 /* vcpu throttling controls */
 static QEMUTimer *throttle_timer;
@@ -38,6 +40,320 @@ static unsigned int throttle_percentage;
 #define CPU_THROTTLE_PCT_MAX 99
 #define CPU_THROTTLE_TIMESLICE_NS 10000000
 
+#define DIRTYLIMIT_TOLERANCE_RANGE  15      /* 15MB/s */
+
+#define DIRTYLIMIT_THROTTLE_HEAVY_WATERMARK     75
+#define DIRTYLIMIT_THROTTLE_SLIGHT_WATERMARK    90
+
+#define DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE     5
+#define DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE    2
+
+typedef enum {
+    RESTRAIN_KEEP,
+    RESTRAIN_RATIO,
+    RESTRAIN_HEAVY,
+    RESTRAIN_SLIGHT,
+} RestrainPolicy;
+
+typedef struct DirtyLimitState {
+    int cpu_index;
+    bool enabled;
+    uint64_t quota;     /* quota dirtyrate MB/s */
+    QemuThread thread;
+    char *name;         /* thread name */
+} DirtyLimitState;
+
+struct {
+    DirtyLimitState *states;
+    int max_cpus;
+    unsigned long *bmap; /* running thread bitmap */
+    unsigned long nr;
+} *dirtylimit_state;
+
+bool dirtylimit_enabled(int cpu_index)
+{
+    return qatomic_read(&dirtylimit_state->states[cpu_index].enabled);
+}
+
+static inline void dirtylimit_set_quota(int cpu_index, uint64_t quota)
+{
+    qatomic_set(&dirtylimit_state->states[cpu_index].quota, quota);
+}
+
+static inline uint64_t dirtylimit_quota(int cpu_index)
+{
+    return qatomic_read(&dirtylimit_state->states[cpu_index].quota);
+}
+
+static int64_t dirtylimit_current(int cpu_index)
+{
+    return dirtylimit_calc_current(cpu_index);
+}
+
+static void dirtylimit_vcpu_thread(CPUState *cpu, run_on_cpu_data data)
+{
+    double pct;
+    double throttle_ratio;
+    int64_t sleeptime_ns, endtime_ns;
+    int *percentage = (int *)data.host_ptr;
+
+    pct = (double)(*percentage) / 100;
+    throttle_ratio = pct / (1 - pct);
+    /* Add 1ns to fix double's rounding error (like 0.9999999...) */
+    sleeptime_ns = (int64_t)(throttle_ratio * CPU_THROTTLE_TIMESLICE_NS + 1);
+    endtime_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + sleeptime_ns;
+    while (sleeptime_ns > 0 && !cpu->stop) {
+        if (sleeptime_ns > SCALE_MS) {
+            qemu_cond_timedwait_iothread(cpu->halt_cond,
+                                         sleeptime_ns / SCALE_MS);
+        } else {
+            qemu_mutex_unlock_iothread();
+            g_usleep(sleeptime_ns / SCALE_US);
+            qemu_mutex_lock_iothread();
+        }
+        sleeptime_ns = endtime_ns - qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
+    }
+    qatomic_set(&cpu->throttle_thread_scheduled, 0);
+
+    free(percentage);
+}
+
+static void dirtylimit_check(int cpu_index,
+                             int percentage)
+{
+    CPUState *cpu;
+    int64_t sleeptime_ns, starttime_ms, currenttime_ms;
+    int *pct_parameter;
+    double pct;
+
+    pct = (double) percentage / 100;
+
+    starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    while (true) {
+        CPU_FOREACH(cpu) {
+            if ((cpu_index == cpu->cpu_index) &&
+                (!qatomic_xchg(&cpu->throttle_thread_scheduled, 1))) {
+                pct_parameter = malloc(sizeof(*pct_parameter));
+                *pct_parameter = percentage;
+                async_run_on_cpu(cpu, dirtylimit_vcpu_thread,
+                                 RUN_ON_CPU_HOST_PTR(pct_parameter));
+                break;
+            }
+        }
+
+        sleeptime_ns = CPU_THROTTLE_TIMESLICE_NS / (1 - pct);
+        g_usleep(sleeptime_ns / SCALE_US);
+
+        currenttime_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+        if (unlikely((currenttime_ms - starttime_ms) >
+                     (DIRTYLIMIT_CALC_PERIOD_TIME_S * 1000))) {
+            break;
+        }
+    }
+}
+
+static uint64_t dirtylimit_init_pct(uint64_t quota,
+                                    uint64_t current)
+{
+    uint64_t limit_pct = 0;
+
+    if (quota >= current || (current == 0) ||
+        ((current - quota) <= DIRTYLIMIT_TOLERANCE_RANGE)) {
+        limit_pct = 0;
+    } else {
+        limit_pct = (current - quota) * 100 / current;
+
+        limit_pct = MIN(limit_pct,
+            DIRTYLIMIT_THROTTLE_HEAVY_WATERMARK);
+    }
+
+    return limit_pct;
+}
+
+static RestrainPolicy dirtylimit_policy(unsigned int last_pct,
+                                        uint64_t quota,
+                                        uint64_t current)
+{
+    uint64_t max, min;
+
+    max = MAX(quota, current);
+    min = MIN(quota, current);
+    if ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) {
+        return RESTRAIN_KEEP;
+    }
+    if (last_pct < DIRTYLIMIT_THROTTLE_HEAVY_WATERMARK) {
+        /* last percentage locates in [0, 75)*/
+        return RESTRAIN_RATIO;
+    } else if (last_pct < DIRTYLIMIT_THROTTLE_SLIGHT_WATERMARK) {
+        /* last percentage locates in [75, 90)*/
+        return RESTRAIN_HEAVY;
+    } else {
+        /* last percentage locates in [90, 99]*/
+        return RESTRAIN_SLIGHT;
+    }
+}
+
+static uint64_t dirtylimit_pct(unsigned int last_pct,
+                               uint64_t quota,
+                               uint64_t current)
+{
+    uint64_t limit_pct = 0;
+    RestrainPolicy policy;
+    bool mitigate = (quota > current) ? true : false;
+
+    if (mitigate && ((current == 0) ||
+        (last_pct <= DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE))) {
+        return 0;
+    }
+
+    policy = dirtylimit_policy(last_pct, quota, current);
+    switch (policy) {
+    case RESTRAIN_SLIGHT:
+        /* [90, 99] */
+        if (mitigate) {
+            limit_pct =
+                last_pct - DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE;
+        } else {
+            limit_pct =
+                last_pct + DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE;
+
+            limit_pct = MIN(limit_pct, CPU_THROTTLE_PCT_MAX);
+        }
+       break;
+    case RESTRAIN_HEAVY:
+        /* [75, 90) */
+        if (mitigate) {
+            limit_pct =
+                last_pct - DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE;
+        } else {
+            limit_pct =
+                last_pct + DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE;
+
+            limit_pct = MIN(limit_pct,
+                DIRTYLIMIT_THROTTLE_SLIGHT_WATERMARK);
+        }
+       break;
+    case RESTRAIN_RATIO:
+        /* [0, 75) */
+        if (mitigate) {
+            if (last_pct <= (((quota - current) * 100 / quota))) {
+                limit_pct = 0;
+            } else {
+                limit_pct = last_pct -
+                    ((quota - current) * 100 / quota);
+                limit_pct = MAX(limit_pct, CPU_THROTTLE_PCT_MIN);
+            }
+        } else {
+            limit_pct = last_pct +
+                ((current - quota) * 100 / current);
+
+            limit_pct = MIN(limit_pct,
+                DIRTYLIMIT_THROTTLE_HEAVY_WATERMARK);
+        }
+       break;
+    case RESTRAIN_KEEP:
+    default:
+       limit_pct = last_pct;
+       break;
+    }
+
+    return limit_pct;
+}
+
+static void *dirtylimit_thread(void *opaque)
+{
+    int cpu_index = *(int *)opaque;
+    uint64_t quota_dirtyrate, current_dirtyrate;
+    unsigned int last_pct = 0;
+    unsigned int pct = 0;
+
+    rcu_register_thread();
+
+    quota_dirtyrate = dirtylimit_quota(cpu_index);
+    current_dirtyrate = dirtylimit_current(cpu_index);
+
+    pct = dirtylimit_init_pct(quota_dirtyrate, current_dirtyrate);
+
+    do {
+        trace_dirtylimit_impose(cpu_index,
+            quota_dirtyrate, current_dirtyrate, pct);
+
+        last_pct = pct;
+        if (pct == 0) {
+            sleep(DIRTYLIMIT_CALC_PERIOD_TIME_S);
+        } else {
+            dirtylimit_check(cpu_index, pct);
+        }
+
+        quota_dirtyrate = dirtylimit_quota(cpu_index);
+        current_dirtyrate = dirtylimit_current(cpu_index);
+
+        pct = dirtylimit_pct(last_pct, quota_dirtyrate, current_dirtyrate);
+    } while (dirtylimit_enabled(cpu_index));
+
+    rcu_unregister_thread();
+
+    return NULL;
+}
+
+int dirtylimit_cancel_vcpu(int cpu_index)
+{
+    int i;
+    int nr_threads = 0;
+
+    qatomic_set(&dirtylimit_state->states[cpu_index].enabled, 0);
+    bitmap_test_and_clear_atomic(dirtylimit_state->bmap, cpu_index, 1);
+
+    for (i = 0; i < dirtylimit_state->nr; i++) {
+        unsigned long temp = dirtylimit_state->bmap[i];
+        nr_threads += ctpopl(temp);
+    }
+
+   return nr_threads;
+}
+
+void dirtylimit_vcpu(int cpu_index,
+                     uint64_t quota)
+{
+    trace_dirtylimit_vcpu(cpu_index, quota);
+
+    dirtylimit_set_quota(cpu_index, quota);
+
+    if (unlikely(!dirtylimit_enabled(cpu_index))) {
+        qatomic_set(&dirtylimit_state->states[cpu_index].enabled, 1);
+        dirtylimit_state->states[cpu_index].name =
+            g_strdup_printf("dirtylimit-%d", cpu_index);
+        qemu_thread_create(&dirtylimit_state->states[cpu_index].thread,
+            dirtylimit_state->states[cpu_index].name,
+            dirtylimit_thread,
+            (void *)&dirtylimit_state->states[cpu_index].cpu_index,
+            QEMU_THREAD_DETACHED);
+        bitmap_set_atomic(dirtylimit_state->bmap, cpu_index, 1);
+    }
+}
+
+void dirtylimit_state_init(int max_cpus)
+{
+    int i;
+
+    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
+
+    dirtylimit_state->states =
+            g_malloc0(sizeof(DirtyLimitState) * max_cpus);
+
+    for (i = 0; i < max_cpus; i++) {
+        dirtylimit_state->states[i].cpu_index = i;
+    }
+
+    dirtylimit_state->max_cpus = max_cpus;
+    dirtylimit_state->bmap = bitmap_new(max_cpus);
+    bitmap_clear(dirtylimit_state->bmap, 0, max_cpus);
+    dirtylimit_state->nr = BITS_TO_LONGS(max_cpus);
+
+    trace_dirtylimit_state_init(max_cpus);
+}
+
 static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
 {
     double pct;
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887..a7c9c04 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -31,3 +31,8 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
 system_wakeup_request(int reason) "reason=%d"
 qemu_system_shutdown_request(int reason) "reason=%d"
 qemu_system_powerdown_request(void) ""
+
+#cpu-throttle.c
+dirtylimit_state_init(int max_cpus) "dirtylimit state init: max cpus %d"
+dirtylimit_impose(int cpu_index, uint64_t quota, uint64_t current, int pct) "CPU[%d] impose dirtylimit: quota %" PRIu64 ", current %" PRIu64 ", percentage %d"
+dirtylimit_vcpu(int cpu_index, uint64_t quota) "CPU[%d] set quota dirtylimit %"PRIu64
-- 
1.8.3.1


