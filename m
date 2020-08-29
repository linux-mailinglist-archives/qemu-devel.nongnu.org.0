Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFF256433
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 04:48:16 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBqub-0005w3-9b
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 22:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kBqod-0003hz-Vm
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:42:04 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4673 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kBqoY-00021y-Rj
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:42:03 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7FB4033952FFD65774C1;
 Sat, 29 Aug 2020 10:41:48 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sat, 29 Aug 2020
 10:41:38 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>, <dme@dme.org>
Subject: [PATCH v6 07/12] migration/dirtyrate: Compare page hash results for
 recorded sampled page
Date: Sat, 29 Aug 2020 10:52:52 +0800
Message-ID: <1598669577-76914-8-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598669577-76914-1-git-send-email-zhengchuan@huawei.com>
References: <1598669577-76914-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 22:41:44
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

Compare page hash results for recorded sampled page.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index f4967fd..9cc2cbb 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -193,6 +193,69 @@ static int record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
     return 0;
 }
 
+static void calc_page_dirty_rate(struct RamblockDirtyInfo *info)
+{
+    uint32_t crc;
+    int i;
+
+    for (i = 0; i < info->sample_pages_count; i++) {
+        crc = get_ramblock_vfn_hash(info, info->sample_page_vfn[i]);
+        if (crc != info->hash_result[i]) {
+            info->sample_dirty_count++;
+        }
+    }
+}
+
+static struct RamblockDirtyInfo *
+find_page_matched(RAMBlock *block, int count,
+                  struct RamblockDirtyInfo *infos)
+{
+    int i;
+    struct RamblockDirtyInfo *matched;
+
+    for (i = 0; i < count; i++) {
+        if (!strcmp(infos[i].idstr, qemu_ram_get_idstr(block))) {
+            break;
+        }
+    }
+
+    if (i == count) {
+        return NULL;
+    }
+
+    if (infos[i].ramblock_addr != qemu_ram_get_host_addr(block) ||
+        infos[i].ramblock_pages !=
+            (qemu_ram_get_used_length(block) >> TARGET_PAGE_BITS)) {
+        return NULL;
+    }
+
+    matched = &infos[i];
+
+    return matched;
+}
+
+static int compare_page_hash_info(struct RamblockDirtyInfo *info,
+                                  int block_index)
+{
+    struct RamblockDirtyInfo *block_dinfo = NULL;
+    RAMBlock *block = NULL;
+
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        block_dinfo = find_page_matched(block, block_index + 1, info);
+        if (block_dinfo == NULL) {
+            continue;
+        }
+        calc_page_dirty_rate(block_dinfo);
+        update_dirtyrate_stat(block_dinfo);
+    }
+
+    if (!DirtyStat.total_sample_count) {
+        return -1;
+    }
+
+    return 0;
+}
+
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
     /* todo */
-- 
1.8.3.1


