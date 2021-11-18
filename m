Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE094554A2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:13:19 +0100 (CET)
Received: from localhost ([::1]:42248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnafe-0007tv-Ok
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mnabA-0005E8-I3
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:40 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:51661
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mnab7-0000Hg-77
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:40 -0500
HMM_SOURCE_IP: 172.18.0.48:38028.1063050567
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id CFD7B2800C5;
 Thu, 18 Nov 2021 14:08:23 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 2716d12c574f4e6aaa3a1b5680f2890c for
 qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:08:26 CST
X-Transaction-ID: 2716d12c574f4e6aaa3a1b5680f2890c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v1 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Date: Thu, 18 Nov 2021 14:07:20 +0800
Message-Id: <499bdfeea4b19ef44a36e0fbb5be3e0d51765430.1637214721.git.huangy81@chinatelecom.cn>
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

introduce the third method GLOBAL_DIRTY_RESTRAINT of dirty
tracking for calculate dirtyrate periodly for dirty restraint.

implement thread for calculate dirtyrate periodly, which will
be used for dirty restraint.

add dirtyrestraint.h to introduce the util function for dirty
restrain.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/memory.h           |   5 +-
 include/sysemu/dirtyrestraint.h |  20 +++++++
 migration/dirtyrate.c           | 118 ++++++++++++++++++++++++++++++++++++++++
 migration/dirtyrate.h           |   2 +
 4 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 include/sysemu/dirtyrestraint.h

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27..565d06b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -69,7 +69,10 @@ static inline void fuzz_dma_read_cb(size_t addr,
 /* Dirty tracking enabled because measuring dirty rate */
 #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
 
-#define GLOBAL_DIRTY_MASK  (0x3)
+/* Dirty tracking enabled because dirty restraint */
+#define GLOBAL_DIRTY_RESTRAINT  (1U << 2)
+
+#define GLOBAL_DIRTY_MASK  (0x7)
 
 extern unsigned int global_dirty_tracking;
 
diff --git a/include/sysemu/dirtyrestraint.h b/include/sysemu/dirtyrestraint.h
new file mode 100644
index 0000000..ca744af
--- /dev/null
+++ b/include/sysemu/dirtyrestraint.h
@@ -0,0 +1,20 @@
+/*
+ * dirty restraint helper functions
+ *
+ * Copyright (c) 2021 CHINA TELECOM CO.,LTD.
+ *
+ * Authors:
+ *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_DIRTYRESTRAINT_H
+#define QEMU_DIRTYRESTRAINT_H
+
+#define DIRTYRESTRAINT_CALC_PERIOD_TIME_S   15      /* 15s */
+
+void dirtyrestraint_calc_start(void);
+
+void dirtyrestraint_calc_state_init(int max_cpus);
+#endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index d65e744..b453b3a 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -27,6 +27,7 @@
 #include "qapi/qmp/qdict.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
+#include "sysemu/dirtyrestraint.h"
 #include "exec/memory.h"
 
 /*
@@ -46,6 +47,123 @@ static struct DirtyRateStat DirtyStat;
 static DirtyRateMeasureMode dirtyrate_mode =
                 DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
 
+#define DIRTYRESTRAINT_CALC_TIME_MS         1000    /* 1000ms */
+
+struct {
+    DirtyRatesData data;
+    int64_t period;
+    bool enable;
+    QemuCond ready_cond;
+    QemuMutex ready_mtx;
+    bool ready;
+} *dirtyrestraint_calc_state;
+
+static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
+                                     CPUState *cpu, bool start);
+
+static void dirtyrestraint_global_dirty_log_start(void)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_start(GLOBAL_DIRTY_RESTRAINT);
+    qemu_mutex_unlock_iothread();
+}
+
+static void dirtyrestraint_global_dirty_log_stop(void)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_sync();
+    memory_global_dirty_log_stop(GLOBAL_DIRTY_RESTRAINT);
+    qemu_mutex_unlock_iothread();
+}
+
+static void dirtyrestraint_calc_func(void)
+{
+    CPUState *cpu;
+    DirtyPageRecord *dirty_pages;
+    int64_t start_time, end_time, calc_time;
+    DirtyRateVcpu rate;
+    int i = 0;
+
+    dirty_pages = g_malloc0(sizeof(*dirty_pages) *
+        dirtyrestraint_calc_state->data.nvcpu);
+
+    dirtyrestraint_global_dirty_log_start();
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(dirty_pages, cpu, true);
+    }
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    g_usleep(DIRTYRESTRAINT_CALC_TIME_MS * 1000);
+    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    calc_time = end_time - start_time;
+
+    dirtyrestraint_global_dirty_log_stop();
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(dirty_pages, cpu, false);
+    }
+
+    for (i = 0; i < dirtyrestraint_calc_state->data.nvcpu; i++) {
+        uint64_t increased_dirty_pages =
+            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
+        uint64_t memory_size_MB =
+            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+        int64_t dirtyrate = (memory_size_MB * 1000) / calc_time;
+
+        rate.id = i;
+        rate.dirty_rate  = dirtyrate;
+        dirtyrestraint_calc_state->data.rates[i] = rate;
+
+        trace_dirtyrate_do_calculate_vcpu(i,
+            dirtyrestraint_calc_state->data.rates[i].dirty_rate);
+    }
+
+    return;
+}
+
+static void *dirtyrestraint_calc_thread(void *opaque)
+{
+    rcu_register_thread();
+
+    while (qatomic_read(&dirtyrestraint_calc_state->enable)) {
+        dirtyrestraint_calc_func();
+        dirtyrestraint_calc_state->ready = true;
+        qemu_cond_signal(&dirtyrestraint_calc_state->ready_cond);
+        sleep(dirtyrestraint_calc_state->period);
+    }
+
+    rcu_unregister_thread();
+    return NULL;
+}
+
+void dirtyrestraint_calc_start(void)
+{
+    if (likely(!qatomic_read(&dirtyrestraint_calc_state->enable))) {
+        qatomic_set(&dirtyrestraint_calc_state->enable, 1);
+        QemuThread thread;
+        qemu_thread_create(&thread, "dirtyrestraint-calc",
+            dirtyrestraint_calc_thread,
+            NULL, QEMU_THREAD_DETACHED);
+    }
+}
+
+void dirtyrestraint_calc_state_init(int max_cpus)
+{
+    dirtyrestraint_calc_state =
+        g_malloc0(sizeof(*dirtyrestraint_calc_state));
+
+    dirtyrestraint_calc_state->data.nvcpu = max_cpus;
+    dirtyrestraint_calc_state->data.rates =
+        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
+
+    dirtyrestraint_calc_state->period =
+        DIRTYRESTRAINT_CALC_PERIOD_TIME_S;
+
+    qemu_cond_init(&dirtyrestraint_calc_state->ready_cond);
+    qemu_mutex_init(&dirtyrestraint_calc_state->ready_mtx);
+}
+
 static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
 {
     int64_t current_time;
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


