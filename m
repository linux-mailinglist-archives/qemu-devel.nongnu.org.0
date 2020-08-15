Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116382451AD
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 20:06:10 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k70ZF-0005uo-48
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 14:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k70VM-00010S-G4
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 14:02:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:57598 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k70VI-0007E9-7w
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 14:02:08 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F2CB275511DCECD4CEE2;
 Sat, 15 Aug 2020 10:11:16 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Sat, 15 Aug 2020
 10:11:08 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 07/10] migration/dirtyrate: skip sampling ramblock with
 size below MIN_RAMBLOCK_SIZE
Date: Sat, 15 Aug 2020 10:22:57 +0800
Message-ID: <1597458180-16945-8-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597458180-16945-1-git-send-email-zhengchuan@huawei.com>
References: <1597458180-16945-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/15 14:01:48
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

From: Zheng Chuan <zhengchuan@huawei.com>

In order to sample real RAM, skip ramblock with size below
MIN_RAMBLOCK_SIZE which is 128M as default.

Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 24 ++++++++++++++++++++++++
 migration/dirtyrate.h |  5 +++++
 2 files changed, 29 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index f136067..3dc9feb 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -179,6 +179,24 @@ alloc_ramblock_dirty_info(int *block_index,
     return block_dinfo;
 }
 
+static int skip_sample_ramblock(RAMBlock *block)
+{
+    int64_t ramblock_size;
+
+    /* ramblock size in MB */
+    ramblock_size = qemu_ram_get_used_length(block) >> 20;
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
 static int record_ramblock_hash_info(struct DirtyRateConfig config,
                                      struct RamblockDirtyInfo **block_dinfo, int *block_index)
 {
@@ -188,6 +206,9 @@ static int record_ramblock_hash_info(struct DirtyRateConfig config,
     int index = 0;
 
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        if (skip_sample_ramblock(block) < 0) {
+            continue;
+        }
         dinfo = alloc_ramblock_dirty_info(&index, dinfo);
         if (dinfo == NULL)
             return -1;
@@ -263,6 +284,9 @@ static int compare_page_hash_info(struct RamblockDirtyInfo *info, int block_inde
     RAMBlock *block = NULL;
 
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        if (skip_sample_ramblock(block) < 0) {
+            continue;
+        }
         block_dinfo = NULL;
         if (!find_page_matched(block, info, block_index + 1, &block_dinfo)) {
             continue;
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 0812b16..fce2e3b 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -31,6 +31,11 @@
 
 #define QCRYPTO_HASH_LEN                          16
 
+/*
+ * minimum ramblock size to sampled
+ */
+#define MIN_RAMBLOCK_SIZE                        128
+
 /* Take 1s as default for calculation duration */
 #define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
 
-- 
1.8.3.1


