Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785024F6C0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 11:05:01 +0200 (CEST)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA8PU-0000b9-ER
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 05:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kA8O8-0007It-PZ
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 05:03:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41850 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kA8O2-0007kB-La
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 05:03:36 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7A91911E475953137EFF;
 Mon, 24 Aug 2020 17:03:26 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
 17:03:20 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v5 08/12] migration/dirtyrate: skip sampling ramblock with
 size below MIN_RAMBLOCK_SIZE
Date: Mon, 24 Aug 2020 17:14:36 +0800
Message-ID: <1598260480-64862-9-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598260480-64862-1-git-send-email-zhengchuan@huawei.com>
References: <1598260480-64862-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 05:03:27
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to sample real RAM, skip ramblock with size below MIN_RAMBLOCK_SIZE
which is set as 128M.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 24 ++++++++++++++++++++++++
 migration/dirtyrate.h | 10 ++++++++++
 2 files changed, 34 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 050270d..bd398b7 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -173,6 +173,24 @@ alloc_ramblock_dirty_info(int *block_index,
     return block_dinfo;
 }
 
+static int skip_sample_ramblock(RAMBlock *block)
+{
+    int64_t ramblock_size;
+
+    /* ramblock size in MB */
+    ramblock_size = qemu_ram_get_used_length(block) >> DIRTYRATE_PAGE_SHIFT_MB;
+
+    /*
+     * Consider ramblock with size larger than 128M is what we
+     * want to sample.
+     */
+    if (ramblock_size < MIN_RAMBLOCK_SIZE) {
+        return -1;
+    }
+
+    return 0;
+}
+
 static int record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
                                      struct DirtyRateConfig config,
                                      int *block_index)
@@ -183,6 +201,9 @@ static int record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
     int index = 0;
 
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        if (skip_sample_ramblock(block) < 0) {
+            continue;
+        }
         dinfo = alloc_ramblock_dirty_info(&index, dinfo);
         if (dinfo == NULL) {
             return -1;
@@ -249,6 +270,9 @@ static int compare_page_hash_info(struct RamblockDirtyInfo *info,
     RAMBlock *block = NULL;
 
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        if (skip_sample_ramblock(block) < 0) {
+            continue;
+        }
         block_dinfo = NULL;
         if (!find_page_matched(block, info, block_index + 1, &block_dinfo)) {
             continue;
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 5050add..41bc264 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -35,10 +35,20 @@
 #define DIRTYRATE_PAGE_SHIFT_KB                   12
 
 /*
+ * Sample page size MB shift
+ */
+#define DIRTYRATE_PAGE_SHIFT_MB                   20
+
+/*
  * Sample page size 1G shift
  */
 #define DIRTYRATE_PAGE_SHIFT_GB                   30
 
+/*
+ * minimum ramblock size to sampled
+ */
+#define MIN_RAMBLOCK_SIZE                         128
+
 /* Take 1s as default for calculation duration */
 #define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
 
-- 
1.8.3.1


