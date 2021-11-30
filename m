Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195CE463146
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:41:07 +0100 (CET)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0ZN-0001NK-Vf
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ms0Wm-00075L-Lf
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:38:25 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:41841
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ms0Wj-0000Qj-Kg
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:38:24 -0500
HMM_SOURCE_IP: 172.18.0.188:51516.90363879
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id E0E842800AE;
 Tue, 30 Nov 2021 18:28:47 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 41c98b5ef4e0413da6e6e0216d6c6b82 for
 qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:28:54 CST
X-Transaction-ID: 41c98b5ef4e0413da6e6e0216d6c6b82
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Date: Tue, 30 Nov 2021 18:28:11 +0800
Message-Id: <d7fbcc438d315c72227da309a00f13444d0dd718.1638267948.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1638267778.git.huangy81@chinatelecom.cn>
References: <cover.1638267778.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1638267948.git.huangy81@chinatelecom.cn>
References: <cover.1638267948.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
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
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce the third method GLOBAL_DIRTY_LIMIT of dirty
tracking for calculate dirtyrate periodly for dirty restraint.

Implement thread for calculate dirtyrate periodly, which will
be used for dirty restraint.

Add dirtylimit.h to introduce the util function for dirty
limit implementation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/memory.h       |   5 +-
 include/sysemu/dirtylimit.h |  44 ++++++++++++++
 migration/dirtyrate.c       | 139 ++++++++++++++++++++++++++++++++++++++++----
 migration/dirtyrate.h       |   2 +
 4 files changed, 179 insertions(+), 11 deletions(-)
 create mode 100644 include/sysemu/dirtylimit.h

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27..606bec8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -69,7 +69,10 @@ static inline void fuzz_dma_read_cb(size_t addr,
 /* Dirty tracking enabled because measuring dirty rate */
 #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
 
-#define GLOBAL_DIRTY_MASK  (0x3)
+/* Dirty tracking enabled because dirty limit */
+#define GLOBAL_DIRTY_LIMIT      (1U << 2)
+
+#define GLOBAL_DIRTY_MASK  (0x7)
 
 extern unsigned int global_dirty_tracking;
 
diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
new file mode 100644
index 0000000..49298a2
--- /dev/null
+++ b/include/sysemu/dirtylimit.h
@@ -0,0 +1,44 @@
+/*
+ * dirty limit helper functions
+ *
+ * Copyright (c) 2021 CHINA TELECOM CO.,LTD.
+ *
+ * Authors:
+ *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_DIRTYRLIMIT_H
+#define QEMU_DIRTYRLIMIT_H
+
+#define DIRTYLIMIT_CALC_PERIOD_TIME_S   15      /* 15s */
+
+/**
+ * dirtylimit_calc_current:
+ *
+ * get current dirty page rate for specified vCPU.
+ */
+int64_t dirtylimit_calc_current(int cpu_index);
+
+/**
+ * dirtylimit_calc:
+ *
+ * start dirty page rate calculation thread.
+ */
+void dirtylimit_calc(void);
+
+/**
+ * dirtylimit_calc_quit:
+ *
+ * quit dirty page rate calculation thread.
+ */
+void dirtylimit_calc_quit(void);
+
+/**
+ * dirtylimit_calc_state_init:
+ *
+ * initialize dirty page rate calculation state.
+ */
+void dirtylimit_calc_state_init(int max_cpus);
+#endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index d65e744..d370a21 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -27,6 +27,7 @@
 #include "qapi/qmp/qdict.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
+#include "sysemu/dirtylimit.h"
 #include "exec/memory.h"
 
 /*
@@ -46,6 +47,134 @@ static struct DirtyRateStat DirtyStat;
 static DirtyRateMeasureMode dirtyrate_mode =
                 DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
 
+#define DIRTYLIMIT_CALC_TIME_MS         1000    /* 1000ms */
+
+struct {
+    DirtyRatesData data;
+    int64_t period;
+    bool quit;
+} *dirtylimit_calc_state;
+
+static void dirtylimit_global_dirty_log_start(void)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_start(GLOBAL_DIRTY_LIMIT);
+    qemu_mutex_unlock_iothread();
+}
+
+static void dirtylimit_global_dirty_log_stop(void)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_sync();
+    memory_global_dirty_log_stop(GLOBAL_DIRTY_LIMIT);
+    qemu_mutex_unlock_iothread();
+}
+
+static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
+                                     CPUState *cpu, bool start)
+{
+    if (start) {
+        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
+    } else {
+        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
+    }
+}
+
+static void dirtylimit_calc_func(void)
+{
+    CPUState *cpu;
+    DirtyPageRecord *dirty_pages;
+    int64_t start_time, end_time, calc_time;
+    DirtyRateVcpu rate;
+    int i = 0;
+
+    dirty_pages = g_malloc0(sizeof(*dirty_pages) *
+        dirtylimit_calc_state->data.nvcpu);
+
+    dirtylimit_global_dirty_log_start();
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(dirty_pages, cpu, true);
+    }
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    g_usleep(DIRTYLIMIT_CALC_TIME_MS * 1000);
+    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    calc_time = end_time - start_time;
+
+    dirtylimit_global_dirty_log_stop();
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(dirty_pages, cpu, false);
+    }
+
+    for (i = 0; i < dirtylimit_calc_state->data.nvcpu; i++) {
+        uint64_t increased_dirty_pages =
+            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
+        uint64_t memory_size_MB =
+            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+        int64_t dirtyrate = (memory_size_MB * 1000) / calc_time;
+
+        rate.id = i;
+        rate.dirty_rate  = dirtyrate;
+        dirtylimit_calc_state->data.rates[i] = rate;
+
+        trace_dirtyrate_do_calculate_vcpu(i,
+            dirtylimit_calc_state->data.rates[i].dirty_rate);
+    }
+}
+
+static void *dirtylimit_calc_thread(void *opaque)
+{
+    rcu_register_thread();
+
+    while (!qatomic_read(&dirtylimit_calc_state->quit)) {
+        dirtylimit_calc_func();
+        sleep(dirtylimit_calc_state->period);
+    }
+
+    rcu_unregister_thread();
+    return NULL;
+}
+
+int64_t dirtylimit_calc_current(int cpu_index)
+{
+    DirtyRateVcpu *rates = dirtylimit_calc_state->data.rates;
+
+    return qatomic_read(&rates[cpu_index].dirty_rate);
+}
+
+void dirtylimit_calc(void)
+{
+    if (unlikely(qatomic_read(&dirtylimit_calc_state->quit))) {
+        qatomic_set(&dirtylimit_calc_state->quit, 0);
+        QemuThread thread;
+        qemu_thread_create(&thread, "dirtylimit-calc",
+            dirtylimit_calc_thread,
+            NULL, QEMU_THREAD_DETACHED);
+    }
+}
+
+void dirtylimit_calc_quit(void)
+{
+    qatomic_set(&dirtylimit_calc_state->quit, 1);
+}
+
+void dirtylimit_calc_state_init(int max_cpus)
+{
+    dirtylimit_calc_state =
+        g_malloc0(sizeof(*dirtylimit_calc_state));
+
+    dirtylimit_calc_state->data.nvcpu = max_cpus;
+    dirtylimit_calc_state->data.rates =
+        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
+
+    dirtylimit_calc_state->period =
+        DIRTYLIMIT_CALC_PERIOD_TIME_S;
+
+    dirtylimit_calc_state->quit = true;
+}
+
 static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
 {
     int64_t current_time;
@@ -396,16 +525,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
     return true;
 }
 
-static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
-                                     CPUState *cpu, bool start)
-{
-    if (start) {
-        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
-    } else {
-        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
-    }
-}
-
 static void dirtyrate_global_dirty_log_start(void)
 {
     qemu_mutex_lock_iothread();
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 69d4c5b..e96acdc 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -70,6 +70,8 @@ typedef struct VcpuStat {
     DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
 } VcpuStat;
 
+typedef struct VcpuStat DirtyRatesData;
+
 /*
  * Store calculation statistics for each measure.
  */
-- 
1.8.3.1


