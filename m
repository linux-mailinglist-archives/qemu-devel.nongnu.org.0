Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5046F060D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:44:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0ys-0006yz-Uv; Thu, 27 Apr 2023 08:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yo-0006nq-KK
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0ym-0001sm-Mj
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:10 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q6b471W3Hz6D9XP;
 Thu, 27 Apr 2023 20:42:47 +0800 (CST)
Received: from DESKTOP-0LHM7NF.huawei.com (10.199.58.101) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:44:03 +0100
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <zhengchuan@huawei.com>, Andrei Gudkov
 <gudkov.andrei@huawei.com>
Subject: [PATCH v2 3/4] migration/calc-dirty-rate: added n-zero-pages metric
Date: Thu, 27 Apr 2023 15:42:59 +0300
Message-ID: <ccdc82d8bdf6b4a0ccf49eec563db34e0dcf5e59.1682598010.git.gudkov.andrei@huawei.com>
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

In sampling mode, a new metric is collected and reported:
number of pages entirely filled with zeroes.

Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
---
 migration/dirtyrate.c | 40 +++++++++++++++++++++++++++++++++++-----
 migration/dirtyrate.h |  1 +
 qapi/migration.json   |  4 ++++
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 4491bbe91a..55ef69927e 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -258,6 +258,9 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
             info->n_sampled_pages = DirtyStat.page_sampling.n_sampled_pages;
             info->has_n_sampled_pages = true;
 
+            info->n_zero_pages = DirtyStat.page_sampling.n_zero_pages;
+            info->has_n_zero_pages = true;
+
             for (i = 0; i < DirtyStat.page_sampling.n_readings; i++) {
                 DirtyReading *dr = &DirtyStat.page_sampling.readings[i];
                 QAPI_LIST_APPEND(periods_tail, dr->period);
@@ -291,6 +294,7 @@ static void init_dirtyrate_stat(int64_t start_time,
     case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
         DirtyStat.page_sampling.n_total_pages = 0;
         DirtyStat.page_sampling.n_sampled_pages = 0;
+        DirtyStat.page_sampling.n_zero_pages = 0;
         DirtyStat.page_sampling.n_readings = 0;
         DirtyStat.page_sampling.readings = g_try_malloc0_n(MAX_DIRTY_READINGS,
                                                           sizeof(DirtyReading));
@@ -319,6 +323,7 @@ static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
 
 /*
  * Compute hash of a single page of size TARGET_PAGE_SIZE.
+ * If ptr is NULL, then compute hash of a page entirely filled with zeros.
  */
 static uint32_t compute_page_hash(void *ptr)
 {
@@ -331,11 +336,20 @@ static uint32_t compute_page_hash(void *ptr)
     v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
     v3 = QEMU_XXHASH_SEED + 0;
     v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
-    for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
-        v1 = XXH64_round(v1, p[i + 0]);
-        v2 = XXH64_round(v2, p[i + 1]);
-        v3 = XXH64_round(v3, p[i + 2]);
-        v4 = XXH64_round(v4, p[i + 3]);
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
     }
     res = XXH64_mergerounds(v1, v2, v3, v4);
     res += TARGET_PAGE_SIZE;
@@ -343,6 +357,17 @@ static uint32_t compute_page_hash(void *ptr)
     return (uint32_t)(res & UINT32_MAX);
 }
 
+static uint32_t get_zero_page_hash(void)
+{
+    static uint32_t hash;
+    static int is_computed;
+
+    if (!is_computed) {
+        hash = compute_page_hash(NULL);
+        is_computed = 1;
+    }
+    return hash;
+}
 
 /*
  * get hash result for the sampled memory with length of TARGET_PAGE_SIZE
@@ -364,6 +389,7 @@ static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
     unsigned int sample_pages_count;
     int i;
     GRand *rand;
+    uint32_t zero_page_hash = get_zero_page_hash();
 
     sample_pages_count = info->sample_pages_count;
 
@@ -393,6 +419,9 @@ static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
         info->hash_result[i] = get_ramblock_vfn_hash(info,
                                                      info->sample_page_vfn[i]);
         DirtyStat.page_sampling.n_sampled_pages++;
+        if (info->hash_result[i] == zero_page_hash) {
+            DirtyStat.page_sampling.n_zero_pages++;
+        }
     }
     g_rand_free(rand);
 
@@ -891,6 +920,7 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "Page count (page size %d):\n", TARGET_PAGE_SIZE);
         monitor_printf(mon, " Total: %"PRIi64"\n", info->n_total_pages);
         monitor_printf(mon, "  Sampled: %"PRIi64"\n", info->n_sampled_pages);
+        monitor_printf(mon, "   Zero: %"PRIi64"\n", info->n_zero_pages);
         int64List *periods = info->periods;
         int64List *n_dirty_pages = info->n_dirty_pages;
         while (periods) {
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 7a97e2b076..e2af72fb8c 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -80,6 +80,7 @@ typedef struct DirtyReading {
 typedef struct SampleVMStat {
     int64_t n_total_pages; /* total number of pages */
     int64_t n_sampled_pages; /* number of sampled pages */
+    int64_t n_zero_pages; /* number of observed zero pages */
     int64_t n_readings;
     DirtyReading *readings;
 } SampleVMStat;
diff --git a/qapi/migration.json b/qapi/migration.json
index f818f51e0e..2c48a9ef80 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1811,6 +1811,9 @@
 #
 # @n-sampled-pages: [page-sampling] number of sampled VM pages (since 8.1)
 #
+# @n-zero-pages: [page-sampling] number of observed all-zero pages among all
+#                sampled pages (since 8.1)
+#
 # @periods: [page-sampling] array of time periods expressed in milliseconds
 #           for which dirty-sample measurements were collected (since 8.1)
 #
@@ -1834,6 +1837,7 @@
            'page-size': 'int64',
            '*n-total-pages': 'int64',
            '*n-sampled-pages': 'int64',
+           '*n-zero-pages': 'int64',
            '*periods': ['int64'],
            '*n-dirty-pages': ['int64'] } }
 
-- 
2.30.2


