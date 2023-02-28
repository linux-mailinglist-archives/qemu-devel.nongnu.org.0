Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4B6A5AC1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0pV-0001Se-69; Tue, 28 Feb 2023 09:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pWzrL-0001Ex-I3
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:17:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pWzrF-0002rt-1B
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:17:35 -0500
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PQyX03NNYz6J9gs;
 Tue, 28 Feb 2023 21:14:56 +0800 (CST)
Received: from DESKTOP-0LHM7NF.huawei.com (10.199.58.101) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 13:17:13 +0000
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <dgilbert@redhat.com>, Andrei Gudkov
 <gudkov.andrei@huawei.com>
Subject: [PATCH 1/2] migration/calc-dirty-rate: new metrics in sampling mode
Date: Tue, 28 Feb 2023 16:16:02 +0300
Message-ID: <dfd184b23d062a6ea92a2cc6237e6b76301f37b9.1677589218.git.gudkov.andrei@huawei.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1677589218.git.gudkov.andrei@huawei.com>
References: <cover.1677589218.git.gudkov.andrei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Feb 2023 09:19:40 -0500
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

* Collect number of all-zero pages
* Collect vector of number of dirty pages for different time periods
* Report total number of pages, number of sampled pages and page size
* Replaced CRC32 with xxHash for performance reasons

Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
---
 migration/dirtyrate.c | 219 +++++++++++++++++++++++++++++++++---------
 migration/dirtyrate.h |  26 ++++-
 qapi/migration.json   |  25 +++++
 3 files changed, 218 insertions(+), 52 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 575d48c397..cb5dc579c7 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -28,6 +28,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "exec/memory.h"
+#include "qemu/xxhash.h"
 
 /*
  * total_dirty_pages is procted by BQL and is used
@@ -222,6 +223,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     info->calc_time = DirtyStat.calc_time;
     info->sample_pages = DirtyStat.sample_pages;
     info->mode = dirtyrate_mode;
+    info->page_size = TARGET_PAGE_SIZE;
 
     if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
         info->has_dirty_rate = true;
@@ -243,6 +245,32 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
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
+            info->n_zero_pages = DirtyStat.page_sampling.n_zero_pages;
+            info->has_n_zero_pages = true;
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
@@ -263,9 +291,12 @@ static void init_dirtyrate_stat(int64_t start_time,
 
     switch (config.mode) {
     case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
-        DirtyStat.page_sampling.total_dirty_samples = 0;
-        DirtyStat.page_sampling.total_sample_count = 0;
-        DirtyStat.page_sampling.total_block_mem_MB = 0;
+        DirtyStat.page_sampling.n_total_pages = 0;
+        DirtyStat.page_sampling.n_sampled_pages = 0;
+        DirtyStat.page_sampling.n_zero_pages = 0;
+        DirtyStat.page_sampling.n_readings = 0;
+        DirtyStat.page_sampling.readings = g_try_malloc0_n(MAX_DIRTY_READINGS,
+                                                          sizeof(DirtyReading));
         break;
     case DIRTY_RATE_MEASURE_MODE_DIRTY_RING:
         DirtyStat.dirty_ring.nvcpu = -1;
@@ -283,28 +314,58 @@ static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
         free(DirtyStat.dirty_ring.rates);
         DirtyStat.dirty_ring.rates = NULL;
     }
+    if (DirtyStat.page_sampling.readings) {
+        free(DirtyStat.page_sampling.readings);
+        DirtyStat.page_sampling.readings = NULL;
+    }
 }
 
-static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
-{
-    DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
-    DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
-    /* size of total pages in MB */
-    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
-                                                   TARGET_PAGE_SIZE) >> 20;
+/*
+ * Compute hash of a single page of size TARGET_PAGE_SIZE.
+ * If ptr is NULL, then compute hash of a page entirely filled with zeros.
+ */
+static uint32_t compute_page_hash(void *ptr)
+{
+    uint32_t i;
+    uint64_t v1, v2, v3, v4;
+    uint64_t res;
+    const uint64_t *p = ptr;
+
+    v1 = QEMU_XXHASH_SEED + XXH_PRIME64_1 + XXH_PRIME64_2;
+    v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
+    v3 = QEMU_XXHASH_SEED + 0;
+    v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
+    if (ptr) {
+        for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
+            v1 = XXH64_round(v1, p[i + 0]);
+            v2 = XXH64_round(v2, p[i + 1]);
+            v3 = XXH64_round(v3, p[i + 2]);
+            v4 = XXH64_round(v4, p[i + 3]);
+        }
+    } else {
+        for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
+            v1 = XXH64_round(v1, 0);
+            v2 = XXH64_round(v2, 0);
+            v3 = XXH64_round(v3, 0);
+            v4 = XXH64_round(v4, 0);
+        }
+    }
+    res = XXH64_mergerounds(v1, v2, v3, v4);
+    res += TARGET_PAGE_SIZE;
+    res = XXH64_avalanche(res);
+    return (uint32_t)(res & UINT32_MAX);
 }
 
-static void update_dirtyrate(uint64_t msec)
+static uint32_t get_zero_page_hash(void)
 {
-    uint64_t dirtyrate;
-    uint64_t total_dirty_samples = DirtyStat.page_sampling.total_dirty_samples;
-    uint64_t total_sample_count = DirtyStat.page_sampling.total_sample_count;
-    uint64_t total_block_mem_MB = DirtyStat.page_sampling.total_block_mem_MB;
+    static uint32_t hash;
+    static int is_computed;
 
-    dirtyrate = total_dirty_samples * total_block_mem_MB *
-                1000 / (total_sample_count * msec);
-
-    DirtyStat.dirty_rate = dirtyrate;
+    if (!is_computed) {
+        hash = compute_page_hash(NULL);
+        is_computed = 1;
+    }
+    return hash;
 }
 
 /*
@@ -314,13 +375,10 @@ static void update_dirtyrate(uint64_t msec)
 static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
                                       uint64_t vfn)
 {
-    uint32_t crc;
-
-    crc = crc32(0, (info->ramblock_addr +
-                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
-
-    trace_get_ramblock_vfn_hash(info->idstr, vfn, crc);
-    return crc;
+    uint32_t hash;
+    hash = compute_page_hash(info->ramblock_addr + vfn * TARGET_PAGE_SIZE);
+    trace_get_ramblock_vfn_hash(info->idstr, vfn, hash);
+    return hash;
 }
 
 static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
@@ -328,6 +386,7 @@ static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
     unsigned int sample_pages_count;
     int i;
     GRand *rand;
+    uint32_t zero_page_hash = get_zero_page_hash();
 
     sample_pages_count = info->sample_pages_count;
 
@@ -349,12 +408,17 @@ static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
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
+        if (info->hash_result[i] == zero_page_hash) {
+            DirtyStat.page_sampling.n_zero_pages++;
+        }
     }
     g_rand_free(rand);
 
@@ -451,18 +515,20 @@ out:
     return ret;
 }
 
-static void calc_page_dirty_rate(struct RamblockDirtyInfo *info)
+static int64_t calc_page_dirty_rate(struct RamblockDirtyInfo *info)
 {
     uint32_t crc;
     int i;
 
+    int64_t n_dirty = 0;
     for (i = 0; i < info->sample_pages_count; i++) {
         crc = get_ramblock_vfn_hash(info, info->sample_page_vfn[i]);
         if (crc != info->hash_result[i]) {
+            n_dirty++;
             trace_calc_page_dirty_rate(info->idstr, crc, info->hash_result[i]);
-            info->sample_dirty_count++;
         }
     }
+    return n_dirty;
 }
 
 static struct RamblockDirtyInfo *
@@ -491,11 +557,12 @@ find_block_matched(RAMBlock *block, int count,
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
@@ -505,15 +572,10 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
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
@@ -544,6 +606,8 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
     int64_t start_time;
     DirtyPageRecord dirty_pages;
 
+
+
     qemu_mutex_lock_iothread();
     memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
 
@@ -614,13 +678,40 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
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
 static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
 {
     struct RamblockDirtyInfo *block_dinfo = NULL;
     int block_count = 0;
-    int64_t msec = 0;
     int64_t initial_time;
+    int64_t current_time;
 
+    /* first pass */
     rcu_read_lock();
     initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     if (!record_ramblock_hash_info(&block_dinfo, config, &block_count)) {
@@ -628,20 +719,34 @@ static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
     }
     rcu_read_unlock();
 
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
 
@@ -804,11 +909,29 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
                                rate->value->dirty_rate);
             }
         }
+
     } else {
         monitor_printf(mon, "(not ready)\n");
     }
 
+    if (info->has_n_total_pages) {
+        monitor_printf(mon, "Page count (page size %d):\n", TARGET_PAGE_SIZE);
+        monitor_printf(mon, " Total: %"PRIi64"\n", info->n_total_pages);
+        monitor_printf(mon, "  Sampled: %"PRIi64"\n", info->n_sampled_pages);
+        monitor_printf(mon, "   Zero: %"PRIi64"\n", info->n_zero_pages);
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
index 594a5c0bb6..e2af72fb8c 100644
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
@@ -57,14 +69,20 @@ struct RamblockDirtyInfo {
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
+    int64_t n_zero_pages; /* number of observed zero pages */
+    int64_t n_readings;
+    DirtyReading *readings;
 } SampleVMStat;
 
 /*
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..1a1d7cb30a 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1830,6 +1830,25 @@
 # @mode: mode containing method of calculate dirtyrate includes
 #        'page-sampling' and 'dirty-ring' (Since 6.2)
 #
+# @page-size: page size in bytes
+#
+# @n-total-pages: total number of VM pages
+#
+# @n-sampled-pages: number of sampled pages
+#
+# @n-zero-pages: number of observed zero pages among all sampled pages.
+#                Normally all pages are zero when VM starts, but
+#                their number progressively goes down as VM fills more
+#                and more memory with useful data.
+#                Migration of zero pages is optimized: only their headers
+#                are copied but not the (zero) data.
+#
+# @periods: array of time periods expressed in milliseconds for which
+#           dirty-sample measurements are collected
+#
+# @n-dirty-pages: number of pages among all sampled pages that were observed
+#                 as changed after respective time period
+#
 # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
 #                   mode specified (Since 6.2)
 #
@@ -1842,6 +1861,12 @@
            'calc-time': 'int64',
            'sample-pages': 'uint64',
            'mode': 'DirtyRateMeasureMode',
+           'page-size': 'int64',
+           '*n-total-pages': 'int64',
+           '*n-sampled-pages': 'int64',
+           '*n-zero-pages': 'int64',
+           '*periods': ['int64'],
+           '*n-dirty-pages': ['int64'],
            '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
 
 ##
-- 
2.30.2


