Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23116F060A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0yl-0006mI-48; Thu, 27 Apr 2023 08:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yi-0006ll-Q0
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:04 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yg-0001sE-Ej
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:04 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q6b1s3j0zz6J8C3;
 Thu, 27 Apr 2023 20:40:49 +0800 (CST)
Received: from DESKTOP-0LHM7NF.huawei.com (10.199.58.101) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:43:56 +0100
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <zhengchuan@huawei.com>, Andrei Gudkov
 <gudkov.andrei@huawei.com>
Subject: [PATCH v2 2/4] migration/calc-dirty-rate: detailed stats in sampling
 mode
Date: Thu, 27 Apr 2023 15:42:58 +0300
Message-ID: <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1682598010.git.gudkov.andrei@huawei.com>
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Andrei Gudkov <gudkov.andrei@huawei.com>
From:  Andrei Gudkov via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Collect number of dirty pages for progresseively increasing time
periods starting with 125ms up to number of seconds specified with
calc-dirty-rate. Report through qmp and hmp: 1) vector of dirty page
measurements, 2) page size, 3) total number of VM pages, 4) number
of sampled pages.

Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
---
 migration/dirtyrate.c | 165 +++++++++++++++++++++++++++++-------------
 migration/dirtyrate.h |  25 ++++++-
 qapi/migration.json   |  24 +++++-
 3 files changed, 160 insertions(+), 54 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index acba3213a3..4491bbe91a 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -224,6 +224,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     info->calc_time = DirtyStat.calc_time;
     info->sample_pages = DirtyStat.sample_pages;
     info->mode = dirtyrate_mode;
+    info->page_size = TARGET_PAGE_SIZE;
 
     if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
         info->has_dirty_rate = true;
@@ -245,6 +246,29 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
             info->vcpu_dirty_rate = head;
         }
 
+        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING) {
+            int64List *periods_head = NULL;
+            int64List **periods_tail = &periods_head;
+            int64List *n_dirty_pages_head = NULL;
+            int64List **n_dirty_pages_tail = &n_dirty_pages_head;
+
+            info->n_total_pages = DirtyStat.page_sampling.n_total_pages;
+            info->has_n_total_pages = true;
+
+            info->n_sampled_pages = DirtyStat.page_sampling.n_sampled_pages;
+            info->has_n_sampled_pages = true;
+
+            for (i = 0; i < DirtyStat.page_sampling.n_readings; i++) {
+                DirtyReading *dr = &DirtyStat.page_sampling.readings[i];
+                QAPI_LIST_APPEND(periods_tail, dr->period);
+                QAPI_LIST_APPEND(n_dirty_pages_tail, dr->n_dirty_pages);
+            }
+            info->n_dirty_pages = n_dirty_pages_head;
+            info->periods = periods_head;
+            info->has_n_dirty_pages = true;
+            info->has_periods = true;
+        }
+
         if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) {
             info->sample_pages = 0;
         }
@@ -265,9 +289,11 @@ static void init_dirtyrate_stat(int64_t start_time,
 
     switch (config.mode) {
     case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
-        DirtyStat.page_sampling.total_dirty_samples = 0;
-        DirtyStat.page_sampling.total_sample_count = 0;
-        DirtyStat.page_sampling.total_block_mem_MB = 0;
+        DirtyStat.page_sampling.n_total_pages = 0;
+        DirtyStat.page_sampling.n_sampled_pages = 0;
+        DirtyStat.page_sampling.n_readings = 0;
+        DirtyStat.page_sampling.readings = g_try_malloc0_n(MAX_DIRTY_READINGS,
+                                                          sizeof(DirtyReading));
         break;
     case DIRTY_RATE_MEASURE_MODE_DIRTY_RING:
         DirtyStat.dirty_ring.nvcpu = -1;
@@ -285,28 +311,10 @@ static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
         free(DirtyStat.dirty_ring.rates);
         DirtyStat.dirty_ring.rates = NULL;
     }
-}
-
-static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
-{
-    DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
-    DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
-    /* size of total pages in MB */
-    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
-                                                   TARGET_PAGE_SIZE) >> 20;
-}
-
-static void update_dirtyrate(uint64_t msec)
-{
-    uint64_t dirtyrate;
-    uint64_t total_dirty_samples = DirtyStat.page_sampling.total_dirty_samples;
-    uint64_t total_sample_count = DirtyStat.page_sampling.total_sample_count;
-    uint64_t total_block_mem_MB = DirtyStat.page_sampling.total_block_mem_MB;
-
-    dirtyrate = total_dirty_samples * total_block_mem_MB *
-                1000 / (total_sample_count * msec);
-
-    DirtyStat.dirty_rate = dirtyrate;
+    if (DirtyStat.page_sampling.readings) {
+        free(DirtyStat.page_sampling.readings);
+        DirtyStat.page_sampling.readings = NULL;
+    }
 }
 
 /*
@@ -377,12 +385,14 @@ static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
         return false;
     }
 
-    rand  = g_rand_new();
+    rand = g_rand_new();
+    DirtyStat.page_sampling.n_total_pages += info->ramblock_pages;
     for (i = 0; i < sample_pages_count; i++) {
         info->sample_page_vfn[i] = g_rand_int_range(rand, 0,
                                                     info->ramblock_pages - 1);
         info->hash_result[i] = get_ramblock_vfn_hash(info,
                                                      info->sample_page_vfn[i]);
+        DirtyStat.page_sampling.n_sampled_pages++;
     }
     g_rand_free(rand);
 
@@ -479,18 +489,20 @@ out:
     return ret;
 }
 
-static void calc_page_dirty_rate(struct RamblockDirtyInfo *info)
+static int64_t calc_page_dirty_rate(struct RamblockDirtyInfo *info)
 {
     uint32_t hash;
     int i;
 
+    int64_t n_dirty = 0;
     for (i = 0; i < info->sample_pages_count; i++) {
         hash = get_ramblock_vfn_hash(info, info->sample_page_vfn[i]);
         if (hash != info->hash_result[i]) {
+            n_dirty++;
             trace_calc_page_dirty_rate(info->idstr, hash, info->hash_result[i]);
-            info->sample_dirty_count++;
         }
     }
+    return n_dirty;
 }
 
 static struct RamblockDirtyInfo *
@@ -519,11 +531,12 @@ find_block_matched(RAMBlock *block, int count,
     return &infos[i];
 }
 
-static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
+static int64_t compare_page_hash_info(struct RamblockDirtyInfo *info,
                                   int block_count)
 {
     struct RamblockDirtyInfo *block_dinfo = NULL;
     RAMBlock *block = NULL;
+    int64_t n_dirty = 0;
 
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
         if (skip_sample_ramblock(block)) {
@@ -533,15 +546,10 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
         if (block_dinfo == NULL) {
             continue;
         }
-        calc_page_dirty_rate(block_dinfo);
-        update_dirtyrate_stat(block_dinfo);
-    }
-
-    if (DirtyStat.page_sampling.total_sample_count == 0) {
-        return false;
+        n_dirty += calc_page_dirty_rate(block_dinfo);
     }
 
-    return true;
+    return n_dirty;
 }
 
 static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
@@ -642,34 +650,77 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
     DirtyStat.dirty_rate = dirtyrate_sum;
 }
 
+static int64_t increase_period(int64_t prev_period, int64_t max_period)
+{
+    int64_t delta;
+    int64_t next_period;
+
+    if (prev_period < 500) {
+        delta = 125;
+    } else if (prev_period < 1000) {
+        delta = 250;
+    } else if (prev_period < 2000) {
+        delta = 500;
+    } else if (prev_period < 4000) {
+        delta = 1000;
+    } else if (prev_period < 10000) {
+        delta = 2000;
+    } else {
+        delta = 5000;
+    }
+
+    next_period = prev_period + delta;
+    if (next_period + delta >= max_period) {
+        next_period = max_period;
+    }
+    return next_period;
+}
+
+
 static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
 {
     struct RamblockDirtyInfo *block_dinfo = NULL;
     int block_count = 0;
-    int64_t msec = 0;
     int64_t initial_time;
+    int64_t current_time;
 
+    /* initial pass */
     rcu_read_lock();
     initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-    if (!record_ramblock_hash_info(&block_dinfo, config, &block_count)) {
+    bool ok = record_ramblock_hash_info(&block_dinfo, config, &block_count);
+    rcu_read_unlock();
+    if ((!ok) || (DirtyStat.page_sampling.n_sampled_pages == 0)) {
         goto out;
     }
-    rcu_read_unlock();
 
-    msec = config.sample_period_seconds * 1000;
-    msec = dirty_stat_wait(msec, initial_time);
-    DirtyStat.start_time = initial_time / 1000;
-    DirtyStat.calc_time = msec / 1000;
+    int64_t period = INITIAL_PERIOD_MS;
+    while (true) {
+        current_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+        int64_t delta = initial_time + period - current_time;
+        if (delta > 0) {
+            g_usleep(delta * 1000);
+        }
 
-    rcu_read_lock();
-    if (!compare_page_hash_info(block_dinfo, block_count)) {
-        goto out;
-    }
+        rcu_read_lock();
+        current_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+        int64_t n_dirty = compare_page_hash_info(block_dinfo, block_count);
+        rcu_read_unlock();
 
-    update_dirtyrate(msec);
+        SampleVMStat *ps = &DirtyStat.page_sampling;
+        ps->readings[ps->n_readings].period = current_time - initial_time;
+        ps->readings[ps->n_readings].n_dirty_pages = n_dirty;
+        ps->n_readings++;
+
+        if (period >= DirtyStat.calc_time * 1000) {
+            int64_t mb_total = (ps->n_total_pages * TARGET_PAGE_SIZE) >> 20;
+            int64_t mb_dirty = n_dirty * mb_total / ps->n_sampled_pages;
+            DirtyStat.dirty_rate = mb_dirty * 1000 / period;
+            break;
+        }
+        period = increase_period(period, DirtyStat.calc_time * 1000);
+    }
 
 out:
-    rcu_read_unlock();
     free_ramblock_dirty_info(block_dinfo, block_count);
 }
 
@@ -836,7 +887,23 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "(not ready)\n");
     }
 
+    if (info->has_n_total_pages) {
+        monitor_printf(mon, "Page count (page size %d):\n", TARGET_PAGE_SIZE);
+        monitor_printf(mon, " Total: %"PRIi64"\n", info->n_total_pages);
+        monitor_printf(mon, "  Sampled: %"PRIi64"\n", info->n_sampled_pages);
+        int64List *periods = info->periods;
+        int64List *n_dirty_pages = info->n_dirty_pages;
+        while (periods) {
+            monitor_printf(mon, "   Dirty(%"PRIi64"ms): %"PRIi64"\n",
+                           periods->value, n_dirty_pages->value);
+            periods = periods->next;
+            n_dirty_pages = n_dirty_pages->next;
+        }
+    }
+
     qapi_free_DirtyRateVcpuList(info->vcpu_dirty_rate);
+    qapi_free_int64List(info->periods);
+    qapi_free_int64List(info->n_dirty_pages);
     g_free(info);
 }
 
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 594a5c0bb6..7a97e2b076 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -42,6 +42,18 @@
 #define MIN_SAMPLE_PAGE_COUNT                     128
 #define MAX_SAMPLE_PAGE_COUNT                     16384
 
+/*
+ * Initial sampling period expressed in milliseconds
+ */
+#define INITIAL_PERIOD_MS 125
+
+/*
+ * Upper bound on the number of DirtyReadings calculcated based on
+ * INITIAL_PERIOD_MS, MAX_FETCH_DIRTYRATE_TIME_SEC and increase_period()
+ */
+#define MAX_DIRTY_READINGS 32
+
+
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
@@ -57,14 +69,19 @@ struct RamblockDirtyInfo {
     uint64_t ramblock_pages; /* ramblock size in TARGET_PAGE_SIZE */
     uint64_t *sample_page_vfn; /* relative offset address for sampled page */
     uint64_t sample_pages_count; /* count of sampled pages */
-    uint64_t sample_dirty_count; /* count of dirty pages we measure */
     uint32_t *hash_result; /* array of hash result for sampled pages */
 };
 
+typedef struct DirtyReading {
+    int64_t period; /* time period in milliseconds */
+    int64_t n_dirty_pages; /* number of observed dirty pages */
+} DirtyReading;
+
 typedef struct SampleVMStat {
-    uint64_t total_dirty_samples; /* total dirty sampled page */
-    uint64_t total_sample_count; /* total sampled pages */
-    uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
+    int64_t n_total_pages; /* total number of pages */
+    int64_t n_sampled_pages; /* number of sampled pages */
+    int64_t n_readings;
+    DirtyReading *readings;
 } SampleVMStat;
 
 /*
diff --git a/qapi/migration.json b/qapi/migration.json
index 2c35b7b9cf..f818f51e0e 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1805,6 +1805,22 @@
 # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
 #                   mode specified (Since 6.2)
 #
+# @page-size: page size in bytes (since 8.1)
+#
+# @n-total-pages: [page-sampling] total number of VM pages (since 8.1)
+#
+# @n-sampled-pages: [page-sampling] number of sampled VM pages (since 8.1)
+#
+# @periods: [page-sampling] array of time periods expressed in milliseconds
+#           for which dirty-sample measurements were collected (since 8.1)
+#
+# @n-dirty-pages: [page-sampling] number of pages among all sampled pages
+#                 that were observed as changed during respective time period.
+#                 i-th element of this array corresponds to the i-th element
+#                 of the @periods array, i.e. @n-dirty-pages[i] is the number
+#                 of dirtied pages during period of @periods[i] milliseconds
+#                 after the initiation of calc-dirty-rate (since 8.1)
+#
 # Since: 5.2
 ##
 { 'struct': 'DirtyRateInfo',
@@ -1814,7 +1830,13 @@
            'calc-time': 'int64',
            'sample-pages': 'uint64',
            'mode': 'DirtyRateMeasureMode',
-           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
+           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ],
+           'page-size': 'int64',
+           '*n-total-pages': 'int64',
+           '*n-sampled-pages': 'int64',
+           '*periods': ['int64'],
+           '*n-dirty-pages': ['int64'] } }
+
 
 ##
 # @calc-dirty-rate:
-- 
2.30.2


