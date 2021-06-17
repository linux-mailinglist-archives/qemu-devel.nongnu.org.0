Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F23AB592
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:11:56 +0200 (CEST)
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltskN-0000rl-C0
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltsgr-00013H-Ui
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:08:17 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51741
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltsgo-0002jF-MI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:08:17 -0400
HMM_SOURCE_IP: 172.18.0.48:48630.1962201350
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-05d08ad9f51a4d9e834e1f4ae90155af
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id AB248280079;
 Thu, 17 Jun 2021 22:08:12 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 9580b63ac2e84ed3bd9585a423007ab6 for
 qemu-devel@nongnu.org; Thu Jun 17 22:08:12 2021
X-Transaction-ID: 9580b63ac2e84ed3bd9585a423007ab6
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/7] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
Date: Thu, 17 Jun 2021 22:12:05 +0800
Message-Id: <d91f66916a28327105f62919092224a403a0067f.1623938622.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1623938622.git.huangy81@chinatelecom.cn>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1623938622.git.huangy81@chinatelecom.cn>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
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

introduce "DirtyRateMeasureMode" to specify what method should be
used to calculate dirty rate, introduce "DirtyRateVcpu" to store
dirty rate fore each vcpu.

use union to store stat data of specific mode

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c | 48 ++++++++++++++++++++++++++++--------------------
 migration/dirtyrate.h | 19 ++++++++++++++++---
 qapi/migration.json   | 30 ++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 320c56b..e0a27a9 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -88,33 +88,44 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     return info;
 }
 
-static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
-                                uint64_t sample_pages)
+static void init_dirtyrate_stat(int64_t start_time,
+                                struct DirtyRateConfig config)
 {
-    DirtyStat.total_dirty_samples = 0;
-    DirtyStat.total_sample_count = 0;
-    DirtyStat.total_block_mem_MB = 0;
     DirtyStat.dirty_rate = -1;
     DirtyStat.start_time = start_time;
-    DirtyStat.calc_time = calc_time;
-    DirtyStat.sample_pages = sample_pages;
+    DirtyStat.calc_time = config.sample_period_seconds;
+    DirtyStat.sample_pages = config.sample_pages_per_gigabytes;
+
+    switch (config.mode) {
+    case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
+        DirtyStat.page_sampling.total_dirty_samples = 0;
+        DirtyStat.page_sampling.total_sample_count = 0;
+        DirtyStat.page_sampling.total_block_mem_MB = 0;
+        break;
+    case DIRTY_RATE_MEASURE_MODE_DIRTY_RING:
+        DirtyStat.dirty_ring.nvcpu = -1;
+        DirtyStat.dirty_ring.rates = NULL;
+        break;
+    default:
+        break;
+    }
 }
 
 static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
 {
-    DirtyStat.total_dirty_samples += info->sample_dirty_count;
-    DirtyStat.total_sample_count += info->sample_pages_count;
+    DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
+    DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
     /* size of total pages in MB */
-    DirtyStat.total_block_mem_MB += (info->ramblock_pages *
-                                     TARGET_PAGE_SIZE) >> 20;
+    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
+                                                   TARGET_PAGE_SIZE) >> 20;
 }
 
 static void update_dirtyrate(uint64_t msec)
 {
     uint64_t dirtyrate;
-    uint64_t total_dirty_samples = DirtyStat.total_dirty_samples;
-    uint64_t total_sample_count = DirtyStat.total_sample_count;
-    uint64_t total_block_mem_MB = DirtyStat.total_block_mem_MB;
+    uint64_t total_dirty_samples = DirtyStat.page_sampling.total_dirty_samples;
+    uint64_t total_sample_count = DirtyStat.page_sampling.total_sample_count;
+    uint64_t total_block_mem_MB = DirtyStat.page_sampling.total_block_mem_MB;
 
     dirtyrate = total_dirty_samples * total_block_mem_MB *
                 1000 / (total_sample_count * msec);
@@ -327,7 +338,7 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
         update_dirtyrate_stat(block_dinfo);
     }
 
-    if (DirtyStat.total_sample_count == 0) {
+    if (DirtyStat.page_sampling.total_sample_count == 0) {
         return false;
     }
 
@@ -372,8 +383,6 @@ void *get_dirtyrate_thread(void *arg)
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
     int64_t start_time;
-    int64_t calc_time;
-    uint64_t sample_pages;
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
                               DIRTY_RATE_STATUS_MEASURING);
@@ -383,9 +392,7 @@ void *get_dirtyrate_thread(void *arg)
     }
 
     start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-    calc_time = config.sample_period_seconds;
-    sample_pages = config.sample_pages_per_gigabytes;
-    init_dirtyrate_stat(start_time, calc_time, sample_pages);
+    init_dirtyrate_stat(start_time, config);
 
     calculate_dirtyrate(config);
 
@@ -442,6 +449,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
 
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
+    config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index e1fd290..69d4c5b 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -43,6 +43,7 @@
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
+    DirtyRateMeasureMode mode; /* mode of dirtyrate measurement */
 };
 
 /*
@@ -58,17 +59,29 @@ struct RamblockDirtyInfo {
     uint32_t *hash_result; /* array of hash result for sampled pages */
 };
 
+typedef struct SampleVMStat {
+    uint64_t total_dirty_samples; /* total dirty sampled page */
+    uint64_t total_sample_count; /* total sampled pages */
+    uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
+} SampleVMStat;
+
+typedef struct VcpuStat {
+    int nvcpu; /* number of vcpu */
+    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
+} VcpuStat;
+
 /*
  * Store calculation statistics for each measure.
  */
 struct DirtyRateStat {
-    uint64_t total_dirty_samples; /* total dirty sampled page */
-    uint64_t total_sample_count; /* total sampled pages */
-    uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
     int64_t dirty_rate; /* dirty rate in MB/s */
     int64_t start_time; /* calculation start time in units of second */
     int64_t calc_time; /* time duration of two sampling in units of second */
     uint64_t sample_pages; /* sample pages per GB */
+    union {
+        SampleVMStat page_sampling;
+        VcpuStat dirty_ring;
+    };
 };
 
 void *get_dirtyrate_thread(void *arg);
diff --git a/qapi/migration.json b/qapi/migration.json
index 1124a2d..7395305 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1709,6 +1709,21 @@
   'data': { 'device-id': 'str' } }
 
 ##
+# @DirtyRateVcpu:
+#
+# Dirty rate of vcpu.
+#
+# @id: vcpu index.
+#
+# @dirty-rate: dirty rate.
+#
+# Since: 6.1
+#
+##
+{ 'struct': 'DirtyRateVcpu',
+  'data': { 'id': 'int', 'dirty-rate': 'int64' } }
+
+##
 # @DirtyRateStatus:
 #
 # An enumeration of dirtyrate status.
@@ -1726,6 +1741,21 @@
   'data': [ 'unstarted', 'measuring', 'measured'] }
 
 ##
+# @DirtyRateMeasureMode:
+#
+# An enumeration of mode of measuring dirtyrate.
+#
+# @page-sampling: calculate dirtyrate by sampling pages.
+#
+# @dirty-ring: calculate dirtyrate by via dirty ring.
+#
+# Since: 6.1
+#
+##
+{ 'enum': 'DirtyRateMeasureMode',
+  'data': [ 'none', 'page-sampling', 'dirty-ring'] }
+
+##
 # @DirtyRateInfo:
 #
 # Information about current dirty page rate of vm.
-- 
1.8.3.1


