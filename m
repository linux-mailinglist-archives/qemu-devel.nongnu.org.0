Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7A2687B9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 10:58:52 +0200 (CEST)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHkK3-0000fN-9F
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 04:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kHkE2-00064i-PO
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 04:52:38 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4689 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kHkDw-0005kd-DA
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 04:52:38 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3730F9C1835DB7782715;
 Mon, 14 Sep 2020 16:52:26 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 16:52:19 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v8 06/12] migration/dirtyrate: Record hash results for each
 sampled page
Date: Mon, 14 Sep 2020 17:02:59 +0800
Message-ID: <1600074185-91624-7-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600074185-91624-1-git-send-email-zhengchuan@huawei.com>
References: <1600074185-91624-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 04:52:27
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
Cc: zhengchuan@huawei.com, zhang.zhanghailiang@huawei.com, yuxiating@huawei.com,
 liq3ea@gmail.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, jinyan12@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record hash results for each sampled page, crc32 is taken to calculate
hash results for each sampled length in TARGET_PAGE_SIZE.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 migration/dirtyrate.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index cf2d560..beb18cb 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -10,6 +10,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include <zlib.h>
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
@@ -68,6 +69,116 @@ static void update_dirtyrate(uint64_t msec)
     DirtyStat.dirty_rate = dirtyrate;
 }
 
+/*
+ * get hash result for the sampled memory with length of TARGET_PAGE_SIZE
+ * in ramblock, which starts from ramblock base address.
+ */
+static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
+                                      uint64_t vfn)
+{
+    uint32_t crc;
+
+    crc = crc32(0, (info->ramblock_addr +
+                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
+
+    return crc;
+}
+
+static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
+{
+    unsigned int sample_pages_count;
+    int i;
+    GRand *rand;
+
+    sample_pages_count = info->sample_pages_count;
+
+    /* ramblock size less than one page, return success to skip this ramblock */
+    if (unlikely(info->ramblock_pages == 0 || sample_pages_count == 0)) {
+        return true;
+    }
+
+    info->hash_result = g_try_malloc0_n(sample_pages_count,
+                                        sizeof(uint32_t));
+    if (!info->hash_result) {
+        return false;
+    }
+
+    info->sample_page_vfn = g_try_malloc0_n(sample_pages_count,
+                                            sizeof(uint64_t));
+    if (!info->sample_page_vfn) {
+        g_free(info->hash_result);
+        return false;
+    }
+
+    rand  = g_rand_new();
+    for (i = 0; i < sample_pages_count; i++) {
+        info->sample_page_vfn[i] = g_rand_int_range(rand, 0,
+                                                    info->ramblock_pages - 1);
+        info->hash_result[i] = get_ramblock_vfn_hash(info,
+                                                     info->sample_page_vfn[i]);
+    }
+    g_rand_free(rand);
+
+    return true;
+}
+
+static void get_ramblock_dirty_info(RAMBlock *block,
+                                    struct RamblockDirtyInfo *info,
+                                    struct DirtyRateConfig *config)
+{
+    uint64_t sample_pages_per_gigabytes = config->sample_pages_per_gigabytes;
+
+    /* Right shift 30 bits to calc ramblock size in GB */
+    info->sample_pages_count = (qemu_ram_get_used_length(block) *
+                                sample_pages_per_gigabytes) >> 30;
+    /* Right shift TARGET_PAGE_BITS to calc page count */
+    info->ramblock_pages = qemu_ram_get_used_length(block) >>
+                           TARGET_PAGE_BITS;
+    info->ramblock_addr = qemu_ram_get_host_addr(block);
+    strcpy(info->idstr, qemu_ram_get_idstr(block));
+}
+
+static bool record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
+                                      struct DirtyRateConfig config,
+                                      int *block_index)
+{
+    struct RamblockDirtyInfo *info = NULL;
+    struct RamblockDirtyInfo *dinfo = NULL;
+    RAMBlock *block = NULL;
+    int total_index = 0;
+    int index = 0;
+    bool ret = true;
+
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        total_index++;
+    }
+
+    dinfo = g_try_malloc0_n(total_index, sizeof(struct RamblockDirtyInfo));
+    if (dinfo == NULL) {
+        total_index = 0;
+        ret = false;
+        goto out;
+    }
+
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        if (index >= total_index) {
+            break;
+        }
+        info = &dinfo[index];
+        get_ramblock_dirty_info(block, info, &config);
+        if (!save_ramblock_hash(info)) {
+            ret = false;
+            goto out;
+        }
+        index++;
+    }
+
+out:
+    *block_index = total_index;
+    *block_dinfo = dinfo;
+    return ret;
+}
+
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
     /* todo */
-- 
1.8.3.1


