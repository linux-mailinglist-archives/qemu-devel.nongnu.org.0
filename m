Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23E262F89
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 16:11:13 +0200 (CEST)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG0oa-00051t-Fy
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 10:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kG0lL-0000Wc-NI
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 10:07:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4726 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kG0lF-0001i4-Uk
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 10:07:51 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 69C7E91BA811AADB6964;
 Wed,  9 Sep 2020 22:07:37 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 22:07:26 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>, <dme@dme.org>
Subject: [PATCH v7 04/12] migration/dirtyrate: Add dirtyrate statistics series
 functions
Date: Wed, 9 Sep 2020 22:18:08 +0800
Message-ID: <1599661096-127913-5-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599661096-127913-1-git-send-email-zhengchuan@huawei.com>
References: <1599661096-127913-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 10:07:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 zhang.zhanghailiang@huawei.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirtyrate statistics functions to record/update dirtyrate info.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 32 ++++++++++++++++++++++++++++++++
 migration/dirtyrate.h | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 0a3350a..5911ff0 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -23,6 +23,7 @@
 #include "dirtyrate.h"
 
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
+static struct DirtyRateStat DirtyStat;
 
 static int dirtyrate_set_state(int *state, int old_state, int new_state)
 {
@@ -34,6 +35,37 @@ static int dirtyrate_set_state(int *state, int old_state, int new_state)
     }
 }
 
+static void reset_dirtyrate_stat(void)
+{
+    DirtyStat.total_dirty_samples = 0;
+    DirtyStat.total_sample_count = 0;
+    DirtyStat.total_block_mem_MB = 0;
+    DirtyStat.dirty_rate = 0;
+    DirtyStat.start_time = 0;
+    DirtyStat.calc_time = 0;
+}
+
+static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
+{
+    DirtyStat.total_dirty_samples += info->sample_dirty_count;
+    DirtyStat.total_sample_count += info->sample_pages_count;
+    /* size of total pages in MB */
+    DirtyStat.total_block_mem_MB += (info->ramblock_pages *
+                                     TARGET_PAGE_SIZE) >> 20;
+}
+
+static void update_dirtyrate(uint64_t msec)
+{
+    uint64_t dirtyrate;
+    uint64_t total_dirty_samples = DirtyStat.total_dirty_samples;
+    uint64_t total_sample_count = DirtyStat.total_sample_count;
+    uint64_t total_block_mem_MB = DirtyStat.total_block_mem_MB;
+
+    dirtyrate = total_dirty_samples * total_block_mem_MB *
+                1000 / (total_sample_count * msec);
+
+    DirtyStat.dirty_rate = dirtyrate;
+}
 
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 479e222..a3ee305 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -42,6 +42,18 @@ struct RamblockDirtyInfo {
     uint32_t *hash_result; /* array of hash result for sampled pages */
 };
 
+/*
+ * Store calculation statistics for each measure.
+ */
+struct DirtyRateStat {
+    uint64_t total_dirty_samples; /* total dirty sampled page */
+    uint64_t total_sample_count; /* total sampled pages */
+    uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
+    int64_t dirty_rate; /* dirty rate in MB/s */
+    int64_t start_time; /* calculation start time in units of second */
+    int64_t calc_time; /* time duration of two sampling in units of second */
+};
+
 void *get_dirtyrate_thread(void *arg);
 #endif
 
-- 
1.8.3.1


