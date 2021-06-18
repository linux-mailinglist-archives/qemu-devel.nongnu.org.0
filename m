Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F33ACEF7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:29:50 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGRJ-0001XD-A7
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1luGQ5-00079Y-7S
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:34144
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1luGQ1-0008Ls-RZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:32 -0400
HMM_SOURCE_IP: 172.18.0.218:58570.1979376666
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-c4a34c2761364744ac7f6e25c2e48997
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 6BC2728008E;
 Fri, 18 Jun 2021 23:28:29 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id ffe9699fcd9e418a92ba53cb1e9139c3 for
 qemu-devel@nongnu.org; Fri Jun 18 23:28:28 2021
X-Transaction-ID: ffe9699fcd9e418a92ba53cb1e9139c3
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v8 6/6] migration/dirtyrate: implement dirty-ring dirtyrate
 calculation
Date: Fri, 18 Jun 2021 23:32:07 +0800
Message-Id: <98a2f333668f27cfd73e97e1f0e220b80dc18679.1624028590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624028590.git.huangy81@chinatelecom.cn>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624028590.git.huangy81@chinatelecom.cn>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

use dirty ring feature to implement dirtyrate calculation.

introduce mode option in qmp calc_dirty_rate to specify what
method should be used when calculating dirtyrate, either
page-sampling or dirty-ring should be passed.

introduce "dirty_ring:-r" option in hmp calc_dirty_rate to
indicate dirty ring method should be used for calculation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 hmp-commands.hx        |   7 +-
 migration/dirtyrate.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++---
 migration/trace-events |   2 +
 qapi/migration.json    |  16 +++-
 4 files changed, 217 insertions(+), 15 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce..f7fc9d7 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1738,8 +1738,9 @@ ERST
 
     {
         .name       = "calc_dirty_rate",
-        .args_type  = "second:l,sample_pages_per_GB:l?",
-        .params     = "second [sample_pages_per_GB]",
-        .help       = "start a round of guest dirty rate measurement",
+        .args_type  = "dirty_ring:-r,second:l,sample_pages_per_GB:l?",
+        .params     = "[-r] second [sample_pages_per_GB]",
+        .help       = "start a round of guest dirty rate measurement (using -d to"
+                      "\n\t\t\t specify dirty ring as the method of calculation)",
         .cmd        = hmp_calc_dirty_rate,
     },
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index b8f61cc..3c8c5e2 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -16,6 +16,7 @@
 #include "cpu.h"
 #include "exec/ramblock.h"
 #include "qemu/rcu_queue.h"
+#include "qemu/main-loop.h"
 #include "qapi/qapi-commands-migration.h"
 #include "ram.h"
 #include "trace.h"
@@ -23,9 +24,19 @@
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "qapi/qmp/qdict.h"
+#include "sysemu/kvm.h"
+#include "sysemu/runstate.h"
+#include "exec/memory.h"
+
+typedef struct DirtyPageRecord {
+    uint64_t start_pages;
+    uint64_t end_pages;
+} DirtyPageRecord;
 
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
 static struct DirtyRateStat DirtyStat;
+static DirtyRateMeasureMode dirtyrate_mode =
+                DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
 
 static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
 {
@@ -70,18 +81,37 @@ static int dirtyrate_set_state(int *state, int old_state, int new_state)
 
 static struct DirtyRateInfo *query_dirty_rate_info(void)
 {
+    int i;
     int64_t dirty_rate = DirtyStat.dirty_rate;
     struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
-
-    if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
-        info->has_dirty_rate = true;
-        info->dirty_rate = dirty_rate;
-    }
+    DirtyRateVcpuList *head = NULL, **tail = &head;
 
     info->status = CalculatingState;
     info->start_time = DirtyStat.start_time;
     info->calc_time = DirtyStat.calc_time;
     info->sample_pages = DirtyStat.sample_pages;
+    info->mode = dirtyrate_mode;
+
+    if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
+        info->has_dirty_rate = true;
+        info->dirty_rate = dirty_rate;
+
+        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
+            /*
+             * set sample_pages with 0 to indicate page sampling
+             * isn't enabled
+             **/
+            info->sample_pages = 0;
+            info->has_vcpu_dirty_rate = true;
+            for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
+                DirtyRateVcpu *rate = g_malloc0(sizeof(DirtyRateVcpu));
+                rate->id = DirtyStat.dirty_ring.rates[i].id;
+                rate->dirty_rate = DirtyStat.dirty_ring.rates[i].dirty_rate;
+                QAPI_LIST_APPEND(tail, rate);
+            }
+            info->vcpu_dirty_rate = head;
+        }
+    }
 
     trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
 
@@ -111,6 +141,15 @@ static void init_dirtyrate_stat(int64_t start_time,
     }
 }
 
+static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
+{
+    /* last calc-dirty-rate qmp use dirty ring mode */
+    if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
+        free(DirtyStat.dirty_ring.rates);
+        DirtyStat.dirty_ring.rates = NULL;
+    }
+}
+
 static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
 {
     DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
@@ -345,7 +384,96 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
     return true;
 }
 
-static void calculate_dirtyrate(struct DirtyRateConfig config)
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
+static void dirtyrate_global_dirty_log_start(void)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
+    qemu_mutex_unlock_iothread();
+}
+
+static void dirtyrate_global_dirty_log_stop(void)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
+    qemu_mutex_unlock_iothread();
+}
+
+static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
+{
+    uint64_t memory_size_MB;
+    int64_t time_s;
+    uint64_t increased_dirty_pages =
+        dirty_pages.end_pages - dirty_pages.start_pages;
+
+    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+    time_s = DirtyStat.calc_time;
+
+    return memory_size_MB / time_s;
+}
+
+static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
+{
+    CPUState *cpu;
+    int64_t msec = 0;
+    int64_t start_time;
+    uint64_t dirtyrate = 0;
+    uint64_t dirtyrate_sum = 0;
+    DirtyPageRecord *dirty_pages;
+    int nvcpu = 0;
+    int i = 0;
+
+    CPU_FOREACH(cpu) {
+        nvcpu++;
+    }
+
+    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
+
+    DirtyStat.dirty_ring.nvcpu = nvcpu;
+    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
+
+    dirtyrate_global_dirty_log_start();
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(dirty_pages, cpu, true);
+    }
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    DirtyStat.start_time = start_time / 1000;
+
+    msec = config.sample_period_seconds * 1000;
+    msec = set_sample_page_period(msec, start_time);
+    DirtyStat.calc_time = msec / 1000;
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(dirty_pages, cpu, false);
+    }
+
+    dirtyrate_global_dirty_log_stop();
+
+    for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
+        dirtyrate = do_calculate_dirtyrate_vcpu(dirty_pages[i]);
+        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
+
+        DirtyStat.dirty_ring.rates[i].id = i;
+        DirtyStat.dirty_ring.rates[i].dirty_rate = dirtyrate;
+        dirtyrate_sum += dirtyrate;
+    }
+
+    DirtyStat.dirty_rate = dirtyrate_sum;
+    free(dirty_pages);
+}
+
+static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
 {
     struct RamblockDirtyInfo *block_dinfo = NULL;
     int block_count = 0;
@@ -376,6 +504,17 @@ out:
     free_ramblock_dirty_info(block_dinfo, block_count);
 }
 
+static void calculate_dirtyrate(struct DirtyRateConfig config)
+{
+    if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
+        calculate_dirtyrate_dirty_ring(config);
+    } else {
+        calculate_dirtyrate_sample_vm(config);
+    }
+
+    trace_dirtyrate_calculate(DirtyStat.dirty_rate);
+}
+
 void *get_dirtyrate_thread(void *arg)
 {
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
@@ -401,8 +540,12 @@ void *get_dirtyrate_thread(void *arg)
     return NULL;
 }
 
-void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
-                         int64_t sample_pages, Error **errp)
+void qmp_calc_dirty_rate(int64_t calc_time,
+                         bool has_sample_pages,
+                         int64_t sample_pages,
+                         bool has_mode,
+                         DirtyRateMeasureMode mode,
+                         Error **errp)
 {
     static struct DirtyRateConfig config;
     QemuThread thread;
@@ -424,6 +567,15 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
         return;
     }
 
+    if (!has_mode) {
+        mode =  DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
+    }
+
+    if (has_sample_pages && mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
+        error_setg(errp, "either sample-pages or dirty-ring can be specified.");
+        return;
+    }
+
     if (has_sample_pages) {
         if (!is_sample_pages_valid(sample_pages)) {
             error_setg(errp, "sample-pages is out of range[%d, %d].",
@@ -436,6 +588,16 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     }
 
     /*
+     * dirty ring mode only works when kvm dirty ring is enabled.
+     */
+    if ((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) &&
+        !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty ring is disabled, use sample-pages method "
+                         "or remeasure later.");
+        return;
+    }
+
+    /*
      * Init calculation state as unstarted.
      */
     ret = dirtyrate_set_state(&CalculatingState, CalculatingState,
@@ -447,7 +609,15 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
 
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
-    config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
+    config.mode = mode;
+
+    cleanup_dirtyrate_stat(config);
+
+    /*
+     * update dirty rate mode so that we can figure out what mode has
+     * been used in last calculation
+     **/
+    dirtyrate_mode = mode;
 
     start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
     init_dirtyrate_stat(start_time, config);
@@ -473,12 +643,24 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
                    info->sample_pages);
     monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
                    info->calc_time);
+    monitor_printf(mon, "Mode: %s\n",
+                   DirtyRateMeasureMode_str(info->mode));
     monitor_printf(mon, "Dirty rate: ");
     if (info->has_dirty_rate) {
         monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
+        if (info->has_vcpu_dirty_rate) {
+            DirtyRateVcpuList *rate, *head = info->vcpu_dirty_rate;
+            for (rate = head; rate != NULL; rate = rate->next) {
+                monitor_printf(mon, "vcpu[%"PRIi64"], Dirty rate: %"PRIi64
+                               " (MB/s)\n", rate->value->id,
+                               rate->value->dirty_rate);
+            }
+        }
     } else {
         monitor_printf(mon, "(not ready)\n");
     }
+
+    qapi_free_DirtyRateVcpuList(info->vcpu_dirty_rate);
     g_free(info);
 }
 
@@ -487,6 +669,10 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
     int64_t sec = qdict_get_try_int(qdict, "second", 0);
     int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
     bool has_sample_pages = (sample_pages != -1);
+    bool dirty_ring = qdict_get_try_bool(qdict, "dirty_ring", false);
+    DirtyRateMeasureMode mode =
+        (dirty_ring ? DIRTY_RATE_MEASURE_MODE_DIRTY_RING :
+         DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING);
     Error *err = NULL;
 
     if (!sec) {
@@ -494,7 +680,8 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, &err);
+    qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, true,
+                        mode, &err);
     if (err) {
         hmp_handle_error(mon, err);
         return;
diff --git a/migration/trace-events b/migration/trace-events
index 860c4f4..3186929 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -330,6 +330,8 @@ get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t crc) "ramblock n
 calc_page_dirty_rate(const char *idstr, uint32_t new_crc, uint32_t old_crc) "ramblock name: %s, new crc: %" PRIu32 ", old crc: %" PRIu32
 skip_sample_ramblock(const char *idstr, uint64_t ramblock_size) "ramblock name: %s, ramblock size: %" PRIu64
 find_page_matched(const char *idstr) "ramblock %s addr or size changed"
+dirtyrate_calculate(int64_t dirtyrate) "dirty rate: %" PRIi64 " MB/s"
+dirtyrate_do_calculate_vcpu(int idx, uint64_t rate) "vcpu[%d]: %"PRIu64 " MB/s"
 
 # block.c
 migration_block_init_shared(const char *blk_device_name) "Start migration for %s with shared base image"
diff --git a/qapi/migration.json b/qapi/migration.json
index c464bef..de35528 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1773,6 +1773,12 @@
 # @sample-pages: page count per GB for sample dirty pages
 #                the default value is 512 (since 6.1)
 #
+# @mode: mode containing method of calculate dirtyrate includes
+#        'page-sampling' and 'dirty-ring' (Since 6.1)
+#
+# @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
+#                   mode specified (Since 6.1)
+#
 # Since: 5.2
 #
 ##
@@ -1781,7 +1787,9 @@
            'status': 'DirtyRateStatus',
            'start-time': 'int64',
            'calc-time': 'int64',
-           'sample-pages': 'uint64'} }
+           'sample-pages': 'uint64',
+           'mode': 'DirtyRateMeasureMode',
+           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
 
 ##
 # @calc-dirty-rate:
@@ -1793,6 +1801,9 @@
 # @sample-pages: page count per GB for sample dirty pages
 #                the default value is 512 (since 6.1)
 #
+# @mode: mechanism of calculating dirtyrate includes
+#        'page-sampling' and 'dirty-ring' (Since 6.1)
+#
 # Since: 5.2
 #
 # Example:
@@ -1801,7 +1812,8 @@
 #
 ##
 { 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64',
-                                         '*sample-pages': 'int'} }
+                                         '*sample-pages': 'int',
+                                         '*mode': 'DirtyRateMeasureMode'} }
 
 ##
 # @query-dirty-rate:
-- 
1.8.3.1


