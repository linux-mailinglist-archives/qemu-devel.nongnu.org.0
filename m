Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC74554A3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:13:23 +0100 (CET)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnafi-000856-K5
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mnabD-0005FV-Qi
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:44 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:51720
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mnabA-0000Hv-BT
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:43 -0500
HMM_SOURCE_IP: 172.18.0.48:38028.1063050567
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id DBD822800C6;
 Thu, 18 Nov 2021 14:08:27 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 0396b9afe5b14eeb95f8bd07ac6c3477 for
 qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:08:29 CST
X-Transaction-ID: 0396b9afe5b14eeb95f8bd07ac6c3477
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v1 2/3] cpu-throttle: implement vCPU throttle
Date: Thu, 18 Nov 2021 14:07:21 +0800
Message-Id: <0537c7d112932f2d99df3dc0587bb246328e2d9d.1637214721.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1637214721.git.huangy81@chinatelecom.cn>
References: <cover.1637214721.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1637214721.git.huangy81@chinatelecom.cn>
References: <cover.1637214721.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
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
Cc: David Hildenbrand <david@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

implement dirty restraint by kicking each vcpu as the
auto-converge does during migration, but just kick the
specified vcpu instead, not all the vcpu of vm.

start a thread to track the dirty restraint status
and adjuct the throttle pencentage dynamically depend
on current and quota dirtyrate .

introduce the util function in the header for the dirty
restraint implemantataion.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/sysemu/cpu-throttle.h   |  21 +++
 include/sysemu/dirtyrestraint.h |   2 +
 migration/dirtyrate.c           |   7 +
 softmmu/cpu-throttle.c          | 304 ++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events            |   5 +
 5 files changed, 339 insertions(+)

diff --git a/include/sysemu/cpu-throttle.h b/include/sysemu/cpu-throttle.h
index d65bdef..48215d2 100644
--- a/include/sysemu/cpu-throttle.h
+++ b/include/sysemu/cpu-throttle.h
@@ -65,4 +65,25 @@ bool cpu_throttle_active(void);
  */
 int cpu_throttle_get_percentage(void);
 
+/**
+ * dirtyrestraint_state_init:
+ *
+ * initialize golobal state for dirty restraint
+ */
+void dirtyrestraint_state_init(int max_cpus);
+
+/**
+ * dirtyrestraint_vcpu:
+ *
+ * impose dirty restraint on vcpu util reaching the quota dirtyrate
+ */
+void dirtyrestraint_vcpu(int cpu_index,
+                         uint64_t quota);
+/**
+ * dirtyrestraint_cancel_vcpu:
+ *
+ * cancel dirty restraint for the specified vcpu
+ */
+void dirtyrestraint_cancel_vcpu(int cpu_index);
+
 #endif /* SYSEMU_CPU_THROTTLE_H */
diff --git a/include/sysemu/dirtyrestraint.h b/include/sysemu/dirtyrestraint.h
index ca744af..b84a5c0 100644
--- a/include/sysemu/dirtyrestraint.h
+++ b/include/sysemu/dirtyrestraint.h
@@ -14,6 +14,8 @@
 
 #define DIRTYRESTRAINT_CALC_PERIOD_TIME_S   15      /* 15s */
 
+int64_t dirtyrestraint_calc_current(int cpu_index);
+
 void dirtyrestraint_calc_start(void);
 
 void dirtyrestraint_calc_state_init(int max_cpus);
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index b453b3a..26919ff 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -137,6 +137,13 @@ static void *dirtyrestraint_calc_thread(void *opaque)
     return NULL;
 }
 
+int64_t dirtyrestraint_calc_current(int cpu_index)
+{
+    DirtyRateVcpu *rates = dirtyrestraint_calc_state->data.rates;
+
+    return qatomic_read(&rates[cpu_index].dirty_rate);
+}
+
 void dirtyrestraint_calc_start(void)
 {
     if (likely(!qatomic_read(&dirtyrestraint_calc_state->enable))) {
diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index 8c2144a..7a127a0 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -29,6 +29,8 @@
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/dirtyrestraint.h"
+#include "trace.h"
 
 /* vcpu throttling controls */
 static QEMUTimer *throttle_timer;
@@ -38,6 +40,308 @@ static unsigned int throttle_percentage;
 #define CPU_THROTTLE_PCT_MAX 99
 #define CPU_THROTTLE_TIMESLICE_NS 10000000
 
+#define DIRTYRESTRAINT_TOLERANCE_RANGE  15      /* 15MB/s */
+
+#define DIRTYRESTRAINT_THROTTLE_HEAVY_WATERMARK     75
+#define DIRTYRESTRAINT_THROTTLE_SLIGHT_WATERMARK    90
+
+#define DIRTYRESTRAINT_THROTTLE_HEAVY_STEP_SIZE     5
+#define DIRTYRESTRAINT_THROTTLE_SLIGHT_STEP_SIZE    2
+
+typedef enum {
+    RESTRAIN_KEEP,
+    RESTRAIN_RATIO,
+    RESTRAIN_HEAVY,
+    RESTRAIN_SLIGHT,
+} RestrainPolicy;
+
+typedef struct DirtyRestraintState {
+    int cpu_index;
+    bool enabled;
+    uint64_t quota;     /* quota dirtyrate MB/s */
+    QemuThread thread;
+    char *name;         /* thread name */
+} DirtyRestraintState;
+
+struct {
+    DirtyRestraintState *states;
+    int max_cpus;
+} *dirtyrestraint_state;
+
+static inline bool dirtyrestraint_enabled(int cpu_index)
+{
+    return qatomic_read(&dirtyrestraint_state->states[cpu_index].enabled);
+}
+
+static inline void dirtyrestraint_set_quota(int cpu_index, uint64_t quota)
+{
+    qatomic_set(&dirtyrestraint_state->states[cpu_index].quota, quota);
+}
+
+static inline uint64_t dirtyrestraint_quota(int cpu_index)
+{
+    return qatomic_read(&dirtyrestraint_state->states[cpu_index].quota);
+}
+
+static int64_t dirtyrestraint_current(int cpu_index)
+{
+    return dirtyrestraint_calc_current(cpu_index);
+}
+
+static void dirtyrestraint_vcpu_thread(CPUState *cpu, run_on_cpu_data data)
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
+static void do_dirtyrestraint(int cpu_index,
+                              int percentage)
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
+                async_run_on_cpu(cpu, dirtyrestraint_vcpu_thread,
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
+                     (DIRTYRESTRAINT_CALC_PERIOD_TIME_S * 1000))) {
+            break;
+        }
+    }
+}
+
+static uint64_t dirtyrestraint_init_pct(uint64_t quota,
+                                        uint64_t current)
+{
+    uint64_t restraint_pct = 0;
+
+    if (quota >= current || (current == 0) ||
+        ((current - quota) <= DIRTYRESTRAINT_TOLERANCE_RANGE)) {
+        restraint_pct = 0;
+    } else {
+        restraint_pct = (current - quota) * 100 / current;
+
+        restraint_pct = MIN(restraint_pct,
+            DIRTYRESTRAINT_THROTTLE_HEAVY_WATERMARK);
+    }
+
+    return restraint_pct;
+}
+
+static RestrainPolicy dirtyrestraint_policy(unsigned int last_pct,
+                                            uint64_t quota,
+                                            uint64_t current)
+{
+    uint64_t max, min;
+
+    max = MAX(quota, current);
+    min = MIN(quota, current);
+    if ((max - min) <= DIRTYRESTRAINT_TOLERANCE_RANGE) {
+        return RESTRAIN_KEEP;
+    }
+    if (last_pct < DIRTYRESTRAINT_THROTTLE_HEAVY_WATERMARK) {
+        /* last percentage locates in [0, 75)*/
+        return RESTRAIN_RATIO;
+    } else if (last_pct < DIRTYRESTRAINT_THROTTLE_SLIGHT_WATERMARK) {
+        /* last percentage locates in [75, 90)*/
+        return RESTRAIN_HEAVY;
+    } else {
+        /* last percentage locates in [90, 99]*/
+        return RESTRAIN_SLIGHT;
+    }
+}
+
+static uint64_t dirtyrestraint_pct(unsigned int last_pct,
+                                   uint64_t quota,
+                                   uint64_t current)
+{
+    uint64_t restraint_pct = 0;
+    RestrainPolicy policy;
+    bool mitigate = (quota > current) ? true : false;
+
+    if (mitigate && ((current == 0) ||
+        (last_pct <= DIRTYRESTRAINT_THROTTLE_SLIGHT_STEP_SIZE))) {
+        return 0;
+    }
+
+    policy = dirtyrestraint_policy(last_pct, quota, current);
+    switch (policy) {
+    case RESTRAIN_SLIGHT:
+        /* [90, 99] */
+        if (mitigate) {
+            restraint_pct =
+                last_pct - DIRTYRESTRAINT_THROTTLE_SLIGHT_STEP_SIZE;
+        } else {
+            restraint_pct =
+                last_pct + DIRTYRESTRAINT_THROTTLE_SLIGHT_STEP_SIZE;
+
+            restraint_pct = MIN(restraint_pct, CPU_THROTTLE_PCT_MAX);
+        }
+       break;
+    case RESTRAIN_HEAVY:
+        /* [75, 90) */
+        if (mitigate) {
+            restraint_pct =
+                last_pct - DIRTYRESTRAINT_THROTTLE_HEAVY_STEP_SIZE;
+        } else {
+            restraint_pct =
+                last_pct + DIRTYRESTRAINT_THROTTLE_HEAVY_STEP_SIZE;
+
+            restraint_pct = MIN(restraint_pct,
+                DIRTYRESTRAINT_THROTTLE_SLIGHT_WATERMARK);
+        }
+       break;
+    case RESTRAIN_RATIO:
+        /* [0, 75) */
+        if (mitigate) {
+            if (last_pct <= (((quota - current) * 100 / quota) / 2)) {
+                restraint_pct = 0;
+            } else {
+                restraint_pct = last_pct -
+                    ((quota - current) * 100 / quota) / 2;
+                restraint_pct = MAX(restraint_pct, CPU_THROTTLE_PCT_MIN);
+            }
+        } else {
+            /*
+             * increase linearly with dirtyrate
+             * but tune a little by divide it by 2
+             */
+            restraint_pct = last_pct +
+                ((current - quota) * 100 / current) / 2;
+
+            restraint_pct = MIN(restraint_pct,
+                DIRTYRESTRAINT_THROTTLE_HEAVY_WATERMARK);
+        }
+       break;
+    case RESTRAIN_KEEP:
+    default:
+       restraint_pct = last_pct;
+       break;
+    }
+
+    return restraint_pct;
+}
+
+static void *dirtyrestraint_thread(void *opaque)
+{
+    int cpu_index = *(int *)opaque;
+    uint64_t quota_dirtyrate, current_dirtyrate;
+    unsigned int last_pct = 0;
+    unsigned int pct = 0;
+
+    rcu_register_thread();
+
+    quota_dirtyrate = dirtyrestraint_quota(cpu_index);
+    current_dirtyrate = dirtyrestraint_current(cpu_index);
+
+    pct = dirtyrestraint_init_pct(quota_dirtyrate, current_dirtyrate);
+
+    do {
+        trace_dirtyrestraint_impose(cpu_index,
+            quota_dirtyrate, current_dirtyrate, pct);
+        if (pct == 0) {
+            sleep(DIRTYRESTRAINT_CALC_PERIOD_TIME_S);
+        } else {
+            last_pct = pct;
+            do_dirtyrestraint(cpu_index, pct);
+        }
+
+        quota_dirtyrate = dirtyrestraint_quota(cpu_index);
+        current_dirtyrate = dirtyrestraint_current(cpu_index);
+
+        pct = dirtyrestraint_pct(last_pct, quota_dirtyrate, current_dirtyrate);
+    } while (dirtyrestraint_enabled(cpu_index));
+
+    rcu_unregister_thread();
+
+    return NULL;
+}
+
+void dirtyrestraint_cancel_vcpu(int cpu_index)
+{
+    qatomic_set(&dirtyrestraint_state->states[cpu_index].enabled, 0);
+}
+
+void dirtyrestraint_vcpu(int cpu_index,
+                         uint64_t quota)
+{
+    trace_dirtyrestraint_vcpu(cpu_index, quota);
+
+    dirtyrestraint_set_quota(cpu_index, quota);
+
+    if (unlikely(!dirtyrestraint_enabled(cpu_index))) {
+        qatomic_set(&dirtyrestraint_state->states[cpu_index].enabled, 1);
+        dirtyrestraint_state->states[cpu_index].name =
+            g_strdup_printf("dirtyrestraint-%d", cpu_index);
+        qemu_thread_create(&dirtyrestraint_state->states[cpu_index].thread,
+            dirtyrestraint_state->states[cpu_index].name,
+            dirtyrestraint_thread,
+            (void *)&dirtyrestraint_state->states[cpu_index].cpu_index,
+            QEMU_THREAD_DETACHED);
+    }
+
+    return;
+}
+
+void dirtyrestraint_state_init(int max_cpus)
+{
+    int i;
+
+    dirtyrestraint_state = g_malloc0(sizeof(*dirtyrestraint_state));
+
+    dirtyrestraint_state->states =
+            g_malloc0(sizeof(DirtyRestraintState) * max_cpus);
+
+    for (i = 0; i < max_cpus; i++) {
+        dirtyrestraint_state->states[i].cpu_index = i;
+    }
+
+    dirtyrestraint_state->max_cpus = max_cpus;
+
+    trace_dirtyrestraint_state_init(max_cpus);
+}
+
 static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
 {
     double pct;
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887..0307567 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -31,3 +31,8 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
 system_wakeup_request(int reason) "reason=%d"
 qemu_system_shutdown_request(int reason) "reason=%d"
 qemu_system_powerdown_request(void) ""
+
+#cpu-throttle.c
+dirtyrestraint_state_init(int max_cpus) "dirtyrate restraint init: max cpus %d"
+dirtyrestraint_impose(int cpu_index, uint64_t quota, uint64_t current, int pct) "CPU[%d] impose dirtyrate restraint: quota %" PRIu64 ", current %" PRIu64 ", percentage %d"
+dirtyrestraint_vcpu(int cpu_index, uint64_t quota) "CPU[%d] dirtyrate restraint, quota dirtyrate %"PRIu64
-- 
1.8.3.1


