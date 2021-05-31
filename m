Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47039669C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:12:12 +0200 (CEST)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlSV-0006of-Dr
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lnlM5-000059-SD
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:05:38 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:57779
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lnlM1-0005QO-3J
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:05:33 -0400
HMM_SOURCE_IP: 172.18.0.218:60136.529866758
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-262a242008784dafb9db8682f1ad8717
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 525342800B2;
 Tue,  1 Jun 2021 01:05:28 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 262a242008784dafb9db8682f1ad8717 for
 qemu-devel@nongnu.org; Tue Jun  1 01:05:27 2021
X-Transaction-ID: 262a242008784dafb9db8682f1ad8717
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 4/6] migration/dirtyrate: adjust struct DirtyRateStat
Date: Tue,  1 Jun 2021 01:05:29 +0800
Message-Id: <16e0e8f50b3b83f809187dcfed5693026bea0caa.1622479162.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1622479161.git.huangy81@chinatelecom.cn>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
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
Cc: kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

use union to store stat data of two mutual exclusive methods.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c | 32 ++++++++++++++++++++------------
 migration/dirtyrate.h | 18 +++++++++++++++---
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 3c1a824a41..7952eb6117 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -78,31 +78,39 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     return info;
 }
 
-static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
+static void init_dirtyrate_stat(int64_t start_time,
+                                int64_t calc_time,
+                                struct DirtyRateConfig config)
 {
-    DirtyStat.total_dirty_samples = 0;
-    DirtyStat.total_sample_count = 0;
-    DirtyStat.total_block_mem_MB = 0;
     DirtyStat.dirty_rate = -1;
     DirtyStat.start_time = start_time;
     DirtyStat.calc_time = calc_time;
+
+    if (config.vcpu) {
+        DirtyStat.method.vcpu.nvcpu = -1;
+        DirtyStat.method.vcpu.rates = NULL;
+    } else {
+        DirtyStat.method.vm.total_dirty_samples = 0;
+        DirtyStat.method.vm.total_sample_count = 0;
+        DirtyStat.method.vm.total_block_mem_MB = 0;
+    }
 }
 
 static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
 {
-    DirtyStat.total_dirty_samples += info->sample_dirty_count;
-    DirtyStat.total_sample_count += info->sample_pages_count;
+    DirtyStat.method.vm.total_dirty_samples += info->sample_dirty_count;
+    DirtyStat.method.vm.total_sample_count += info->sample_pages_count;
     /* size of total pages in MB */
-    DirtyStat.total_block_mem_MB += (info->ramblock_pages *
+    DirtyStat.method.vm.total_block_mem_MB += (info->ramblock_pages *
                                      TARGET_PAGE_SIZE) >> 20;
 }
 
 static void update_dirtyrate(uint64_t msec)
 {
     uint64_t dirtyrate;
-    uint64_t total_dirty_samples = DirtyStat.total_dirty_samples;
-    uint64_t total_sample_count = DirtyStat.total_sample_count;
-    uint64_t total_block_mem_MB = DirtyStat.total_block_mem_MB;
+    uint64_t total_dirty_samples = DirtyStat.method.vm.total_dirty_samples;
+    uint64_t total_sample_count = DirtyStat.method.vm.total_sample_count;
+    uint64_t total_block_mem_MB = DirtyStat.method.vm.total_block_mem_MB;
 
     dirtyrate = total_dirty_samples * total_block_mem_MB *
                 1000 / (total_sample_count * msec);
@@ -315,7 +323,7 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
         update_dirtyrate_stat(block_dinfo);
     }
 
-    if (DirtyStat.total_sample_count == 0) {
+    if (DirtyStat.method.vm.total_sample_count == 0) {
         return false;
     }
 
@@ -371,7 +379,7 @@ void *get_dirtyrate_thread(void *arg)
 
     start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
     calc_time = config.sample_period_seconds;
-    init_dirtyrate_stat(start_time, calc_time);
+    init_dirtyrate_stat(start_time, calc_time, config);
 
     calculate_dirtyrate(config);
 
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index f20dd52d77..3ab8e81f42 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -54,16 +54,28 @@ struct RamblockDirtyInfo {
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
+    union {
+        SampleVMStat vm;
+        VcpuStat vcpu;
+    } method;
 };
 
 void *get_dirtyrate_thread(void *arg);
-- 
2.24.3


