Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4704981E3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:18:19 +0100 (CET)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0Ak-0008MW-Jh
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nC042-0001TD-PX
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:11:22 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:43304
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nC03y-0003w6-6y
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:11:22 -0500
HMM_SOURCE_IP: 172.18.0.188:38272.1433758357
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.59 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id ED9512800AA;
 Mon, 24 Jan 2022 22:10:54 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id f676927213c8450eb139653a679ed226 for
 qemu-devel@nongnu.org; Mon, 24 Jan 2022 22:10:56 CST
X-Transaction-ID: f676927213c8450eb139653a679ed226
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 2/5] migration/dirtyrate: refactor dirty page rate
 calculation
Date: Mon, 24 Jan 2022 22:10:37 +0800
Message-Id: <1ecd8924ec4c9f9d35d73c8e3e066c9869e8b298.1643026714.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1642774952.git.huangy81@chinatelecom.cn>
References: <cover.1642774952.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1643026714.git.huangy81@chinatelecom.cn>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
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

abstract out dirty log change logic into function
global_dirty_log_change.

abstract out dirty page rate calculation logic via
dirty-ring into function vcpu_calculate_dirtyrate.

abstract out mathematical dirty page rate calculation
into do_calculate_dirtyrate, decouple it from DirtyStat.

rename set_sample_page_period to dirty_stat_wait, which
is well-understood and will be reused in dirtylimit.

add cpu_list_lock and cpu_list_generation_id to handle
cpu hotplug/unplug case when calculating dirty page rate.

export util functions outside migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 cpus-common.c              |   3 +
 include/sysemu/dirtyrate.h |  31 +++++++
 migration/dirtyrate.c      | 222 +++++++++++++++++++++++++++++----------------
 migration/dirtyrate.h      |   7 +-
 4 files changed, 178 insertions(+), 85 deletions(-)
 create mode 100644 include/sysemu/dirtyrate.h

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..63159d6 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -73,6 +73,7 @@ static int cpu_get_free_index(void)
 }
 
 CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
+unsigned int cpu_list_generation_id;
 
 void cpu_list_add(CPUState *cpu)
 {
@@ -84,6 +85,7 @@ void cpu_list_add(CPUState *cpu)
         assert(!cpu_index_auto_assigned);
     }
     QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
+    cpu_list_generation_id++;
 }
 
 void cpu_list_remove(CPUState *cpu)
@@ -96,6 +98,7 @@ void cpu_list_remove(CPUState *cpu)
 
     QTAILQ_REMOVE_RCU(&cpus, cpu, node);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
+    cpu_list_generation_id++;
 }
 
 CPUState *qemu_get_cpu(int index)
diff --git a/include/sysemu/dirtyrate.h b/include/sysemu/dirtyrate.h
new file mode 100644
index 0000000..ea4785f
--- /dev/null
+++ b/include/sysemu/dirtyrate.h
@@ -0,0 +1,31 @@
+/*
+ * dirty page rate helper functions
+ *
+ * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
+ *
+ * Authors:
+ *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_DIRTYRATE_H
+#define QEMU_DIRTYRATE_H
+
+extern unsigned int cpu_list_generation_id;
+
+typedef struct VcpuStat {
+    int nvcpu; /* number of vcpu */
+    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
+} VcpuStat;
+
+int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
+                                 int64_t init_time_ms,
+                                 VcpuStat *stat,
+                                 unsigned int flag,
+                                 bool one_shot);
+
+void global_dirty_log_change(unsigned int flag,
+                             bool start);
+#endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index d65e744..a851c50 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -46,7 +46,7 @@ static struct DirtyRateStat DirtyStat;
 static DirtyRateMeasureMode dirtyrate_mode =
                 DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
 
-static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
+static int64_t dirty_stat_wait(int64_t msec, int64_t initial_time)
 {
     int64_t current_time;
 
@@ -60,6 +60,130 @@ static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
     return msec;
 }
 
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
+static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
+                                      int64_t calc_time_ms)
+{
+    uint64_t memory_size_MB;
+    uint64_t increased_dirty_pages =
+        dirty_pages.end_pages - dirty_pages.start_pages;
+
+    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+
+    return memory_size_MB * 1000 / calc_time_ms;
+}
+
+void global_dirty_log_change(unsigned int flag, bool start)
+{
+    qemu_mutex_lock_iothread();
+    if (start) {
+        memory_global_dirty_log_start(flag);
+    } else {
+        memory_global_dirty_log_stop(flag);
+    }
+    qemu_mutex_unlock_iothread();
+}
+
+/*
+ * global_dirty_log_sync
+ * 1. sync dirty log from kvm
+ * 2. stop dirty tracking if needed.
+ */
+static void global_dirty_log_sync(unsigned int flag, bool one_shot)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_sync();
+    if (one_shot) {
+        memory_global_dirty_log_stop(flag);
+    }
+    qemu_mutex_unlock_iothread();
+}
+
+static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
+{
+    CPUState *cpu;
+    DirtyPageRecord *records;
+    int nvcpu = 0;
+
+    CPU_FOREACH(cpu) {
+        nvcpu++;
+    }
+
+    stat->nvcpu = nvcpu;
+    stat->rates = g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
+
+    records = g_malloc0(sizeof(DirtyPageRecord) * nvcpu);
+
+    return records;
+}
+
+static void vcpu_dirty_stat_collect(VcpuStat *stat,
+                                    DirtyPageRecord *records,
+                                    bool start)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(records, cpu, start);
+    }
+}
+
+int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
+                                 int64_t init_time_ms,
+                                 VcpuStat *stat,
+                                 unsigned int flag,
+                                 bool one_shot)
+{
+    DirtyPageRecord *records;
+    int64_t duration;
+    int64_t dirtyrate;
+    int i = 0;
+    unsigned int gen_id;
+
+retry:
+    cpu_list_lock();
+    gen_id = cpu_list_generation_id;
+    records = vcpu_dirty_stat_alloc(stat);
+    vcpu_dirty_stat_collect(stat, records, true);
+
+    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
+    cpu_list_unlock();
+
+    global_dirty_log_sync(flag, one_shot);
+
+    cpu_list_lock();
+    if (gen_id != cpu_list_generation_id) {
+        g_free(records);
+        g_free(stat->rates);
+        cpu_list_unlock();
+        goto retry;
+    }
+    vcpu_dirty_stat_collect(stat, records, false);
+    cpu_list_unlock();
+
+    for (i = 0; i < stat->nvcpu; i++) {
+        dirtyrate = do_calculate_dirtyrate(records[i], duration);
+
+        stat->rates[i].id = i;
+        stat->rates[i].dirty_rate = dirtyrate;
+
+        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
+    }
+
+    g_free(records);
+
+    return duration;
+}
+
 static bool is_sample_period_valid(int64_t sec)
 {
     if (sec < MIN_FETCH_DIRTYRATE_TIME_SEC ||
@@ -396,44 +520,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
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
-static void dirtyrate_global_dirty_log_start(void)
-{
-    qemu_mutex_lock_iothread();
-    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
-    qemu_mutex_unlock_iothread();
-}
-
-static void dirtyrate_global_dirty_log_stop(void)
-{
-    qemu_mutex_lock_iothread();
-    memory_global_dirty_log_sync();
-    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
-    qemu_mutex_unlock_iothread();
-}
-
-static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
-{
-    uint64_t memory_size_MB;
-    int64_t time_s;
-    uint64_t increased_dirty_pages =
-        dirty_pages.end_pages - dirty_pages.start_pages;
-
-    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
-    time_s = DirtyStat.calc_time;
-
-    return memory_size_MB / time_s;
-}
-
 static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
                                             bool start)
 {
@@ -444,11 +530,6 @@ static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
     }
 }
 
-static void do_calculate_dirtyrate_bitmap(DirtyPageRecord dirty_pages)
-{
-    DirtyStat.dirty_rate = do_calculate_dirtyrate_vcpu(dirty_pages);
-}
-
 static inline void dirtyrate_manual_reset_protect(void)
 {
     RAMBlock *block = NULL;
@@ -492,71 +573,52 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
     DirtyStat.start_time = start_time / 1000;
 
     msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, start_time);
+    msec = dirty_stat_wait(msec, start_time);
     DirtyStat.calc_time = msec / 1000;
 
     /*
-     * dirtyrate_global_dirty_log_stop do two things.
+     * do two things.
      * 1. fetch dirty bitmap from kvm
      * 2. stop dirty tracking
      */
-    dirtyrate_global_dirty_log_stop();
+    global_dirty_log_sync(GLOBAL_DIRTY_DIRTY_RATE, true);
 
     record_dirtypages_bitmap(&dirty_pages, false);
 
-    do_calculate_dirtyrate_bitmap(dirty_pages);
+    DirtyStat.dirty_rate = do_calculate_dirtyrate(dirty_pages, msec);
 }
 
 static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
 {
-    CPUState *cpu;
-    int64_t msec = 0;
     int64_t start_time;
+    int64_t duration;
     uint64_t dirtyrate = 0;
     uint64_t dirtyrate_sum = 0;
-    DirtyPageRecord *dirty_pages;
-    int nvcpu = 0;
     int i = 0;
 
-    CPU_FOREACH(cpu) {
-        nvcpu++;
-    }
-
-    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
-
-    DirtyStat.dirty_ring.nvcpu = nvcpu;
-    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
-
-    dirtyrate_global_dirty_log_start();
-
-    CPU_FOREACH(cpu) {
-        record_dirtypages(dirty_pages, cpu, true);
-    }
+    /* start log sync */
+    global_dirty_log_change(GLOBAL_DIRTY_DIRTY_RATE, true);
 
     start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     DirtyStat.start_time = start_time / 1000;
 
-    msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, start_time);
-    DirtyStat.calc_time = msec / 1000;
+    /* calculate vcpu dirtyrate */
+    duration = vcpu_calculate_dirtyrate(config.sample_period_seconds * 1000,
+                                        start_time,
+                                        &DirtyStat.dirty_ring,
+                                        GLOBAL_DIRTY_DIRTY_RATE,
+                                        true);
 
-    dirtyrate_global_dirty_log_stop();
-
-    CPU_FOREACH(cpu) {
-        record_dirtypages(dirty_pages, cpu, false);
-    }
+    DirtyStat.calc_time = duration / 1000;
 
+    /* calculate vm dirtyrate */
     for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
-        dirtyrate = do_calculate_dirtyrate_vcpu(dirty_pages[i]);
-        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
-
-        DirtyStat.dirty_ring.rates[i].id = i;
+        dirtyrate = DirtyStat.dirty_ring.rates[i].dirty_rate;
         DirtyStat.dirty_ring.rates[i].dirty_rate = dirtyrate;
         dirtyrate_sum += dirtyrate;
     }
 
     DirtyStat.dirty_rate = dirtyrate_sum;
-    free(dirty_pages);
 }
 
 static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
@@ -574,7 +636,7 @@ static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
     rcu_read_unlock();
 
     msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, initial_time);
+    msec = dirty_stat_wait(msec, initial_time);
     DirtyStat.start_time = initial_time / 1000;
     DirtyStat.calc_time = msec / 1000;
 
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 69d4c5b..594a5c0 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_MIGRATION_DIRTYRATE_H
 #define QEMU_MIGRATION_DIRTYRATE_H
 
+#include "sysemu/dirtyrate.h"
+
 /*
  * Sample 512 pages per GB as default.
  */
@@ -65,11 +67,6 @@ typedef struct SampleVMStat {
     uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
 } SampleVMStat;
 
-typedef struct VcpuStat {
-    int nvcpu; /* number of vcpu */
-    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
-} VcpuStat;
-
 /*
  * Store calculation statistics for each measure.
  */
-- 
1.8.3.1


