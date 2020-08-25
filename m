Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D39250E45
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 03:34:41 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kANrE-0004Fv-7E
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 21:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kANnr-0004wJ-30
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 21:31:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4213 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kANnp-0005qV-5V
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 21:31:10 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2E2EB96AE5C1B05EB132;
 Tue, 25 Aug 2020 09:31:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 09:30:54 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v5 10/12] migration/dirtyrate: Implement calculate_dirtyrate()
 function
Date: Tue, 25 Aug 2020 09:40:48 +0800
Message-ID: <1598319650-36762-11-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598319650-36762-1-git-send-email-zhengchuan@huawei.com>
References: <1598319650-36762-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 21:30:58
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement calculate_dirtyrate() function.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index d1c0a78..9f52f5f 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -171,6 +171,21 @@ static void get_ramblock_dirty_info(RAMBlock *block,
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
@@ -316,8 +331,34 @@ static int compare_page_hash_info(struct RamblockDirtyInfo *info,
 
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
+    if (record_ramblock_hash_info(&block_dinfo, config, &block_index) < 0) {
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
 }
 
 void *get_dirtyrate_thread(void *arg)
-- 
1.8.3.1


