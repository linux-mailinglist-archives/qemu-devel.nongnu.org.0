Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D95245AF3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 05:10:17 +0200 (CEST)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7VXM-0008AP-Lu
	for lists+qemu-devel@lfdr.de; Sun, 16 Aug 2020 23:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k7VWB-0006Cv-BD
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 23:09:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4252 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k7VW8-0008Lw-6K
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 23:09:03 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1136D4C214A9D7FD99A;
 Mon, 17 Aug 2020 11:08:53 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 17 Aug 2020
 11:08:43 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v3 03/10] migration/dirtyrate: Add dirtyrate statistics series
 functions
Date: Mon, 17 Aug 2020 11:20:26 +0800
Message-ID: <1597634433-18809-4-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
References: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/16 23:08:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: zhang.zhanghailiang@huawei.com, linyilu@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, ann.zhuangyanying@huawei.com, fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirtyrate statistics to record/update dirtyrate info.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.c | 30 ++++++++++++++++++++++++++++++
 migration/dirtyrate.h | 10 ++++++++++
 2 files changed, 40 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index bb0ebe9..8708090 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -24,6 +24,7 @@
 #include "dirtyrate.h"
 
 CalculatingDirtyRateState CalculatingState = CAL_DIRTY_RATE_INIT;
+static struct DirtyRateStat dirty_stat;
 
 static int dirty_rate_set_state(int new_state)
 {
@@ -40,6 +41,35 @@ static int dirty_rate_set_state(int new_state)
     return 0;
 }
 
+static void reset_dirtyrate_stat(void)
+{
+    dirty_stat.total_dirty_samples = 0;
+    dirty_stat.total_sample_count = 0;
+    dirty_stat.total_block_mem_MB = 0;
+    dirty_stat.dirty_rate = 0;
+}
+
+static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
+{
+    dirty_stat.total_dirty_samples += info->sample_dirty_count;
+    dirty_stat.total_sample_count += info->sample_pages_count;
+    /* size of 4K pages in MB */
+    dirty_stat.total_block_mem_MB += info->ramblock_pages / 256;
+}
+
+static void update_dirtyrate(uint64_t msec)
+{
+    uint64_t dirty_rate;
+    unsigned int total_dirty_samples = dirty_stat.total_dirty_samples;
+    unsigned int total_sample_count = dirty_stat.total_sample_count;
+    size_t total_block_mem_MB = dirty_stat.total_block_mem_MB;
+
+    dirty_rate = total_dirty_samples * total_block_mem_MB *
+                 1000 / (total_sample_count * msec);
+
+    dirty_stat.dirty_rate = dirty_rate;
+}
+
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
     /* todo */
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 9650566..af57c80 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -57,6 +57,16 @@ struct RamblockDirtyInfo {
     uint8_t *hash_result; /* array of hash result for sampled pages */
 };
 
+/*
+ * Store calculate statistics for each measure.
+ */
+struct DirtyRateStat {
+    unsigned int total_dirty_samples; /* total dirty pages for this measure */
+    unsigned int total_sample_count; /* total sampled pages for this measure */
+    size_t total_block_mem_MB; /* size of sampled pages in MB */
+    int64_t dirty_rate; /* dirty rate for this measure */
+};
+
 void *get_dirtyrate_thread(void *arg);
 #endif
 
-- 
1.8.3.1


