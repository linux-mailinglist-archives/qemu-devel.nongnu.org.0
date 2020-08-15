Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF82451A9
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 20:04:24 +0200 (CEST)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k70XX-0002Sm-1E
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 14:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k70VG-0000pu-J8
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 14:02:02 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:57320 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k70VE-0007DT-Ii
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 14:02:02 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 07955CC715B2438D88AC;
 Sat, 15 Aug 2020 10:11:17 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Sat, 15 Aug 2020
 10:11:09 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 09/10] migration/dirtyrate: Implement calculate_dirtyrate()
 function
Date: Sat, 15 Aug 2020 10:22:59 +0800
Message-ID: <1597458180-16945-10-git-send-email-zhengchuan@huawei.com>
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

Implement calculate_dirtyrate() function.

Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 54b832a..d487030 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -177,6 +177,21 @@ static void get_ramblock_dirty_info(RAMBlock *block, struct RamblockDirtyInfo *i
     strcpy(info->idstr, qemu_ram_get_idstr(block));
 }
 
+static void free_ramblock_dirty_info(struct RamblockDirtyInfo *infos, int count)
+{
+    int i;
+
+    if (!infos) {
+        return;
+    }
+
+    for (i = 0; i < count; i++) {
+        g_free(infos[i].sample_page_vfn);
+        g_free(infos[i].hash_result);
+    }
+    g_free(infos);
+}
+
 static struct RamblockDirtyInfo *
 alloc_ramblock_dirty_info(int *block_index,
                           struct RamblockDirtyInfo *block_dinfo)
@@ -328,8 +343,35 @@ static int compare_page_hash_info(struct RamblockDirtyInfo *info, int block_inde
 
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
-    /* todo */
-    return;
+    struct RamblockDirtyInfo *block_dinfo = NULL;
+    int block_index = 0;
+    int64_t msec = 0;
+    int64_t initial_time;
+
+    rcu_register_thread();
+    reset_dirtyrate_stat();
+    initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    rcu_read_lock();
+    if (record_ramblock_hash_info(config, &block_dinfo, &block_index) < 0) {
+        goto out;
+    }
+    rcu_read_unlock();
+
+    msec = config.sample_period_seconds * 1000;
+    msec = set_sample_page_period(msec, initial_time);
+
+    rcu_read_lock();
+    if (compare_page_hash_info(block_dinfo, block_index) < 0) {
+        goto out;
+    }
+
+    update_dirtyrate(msec);
+
+out:
+    rcu_read_unlock();
+    free_ramblock_dirty_info(block_dinfo, block_index + 1);
+    rcu_unregister_thread();
+
 }
 
 void *get_dirtyrate_thread(void *arg)
-- 
1.8.3.1


