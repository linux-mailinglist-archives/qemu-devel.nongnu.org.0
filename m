Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1652451AB
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 20:04:34 +0200 (CEST)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k70Xh-0002bc-G7
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 14:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k70VI-0000rz-2l
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 14:02:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:57324 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k70VD-0007DS-8m
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 14:02:03 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 15330EF42AC93647B124;
 Sat, 15 Aug 2020 10:11:17 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Sat, 15 Aug 2020
 10:11:07 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 05/10] migration/dirtyrate: Record hash results for each
 sampled page
Date: Sat, 15 Aug 2020 10:22:55 +0800
Message-ID: <1597458180-16945-6-git-send-email-zhengchuan@huawei.com>
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

Record hash results for each sampled page.

Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++
 migration/dirtyrate.h |   7 +++
 2 files changed, 142 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index c4304ef..11c0051 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -25,6 +25,7 @@
 #include "dirtyrate.h"
 
 CalculatingDirtyRateState CalculatingState = CAL_DIRTY_RATE_INIT;
+static unsigned long int qcrypto_hash_len = QCRYPTO_HASH_LEN;
 static struct DirtyRateStat dirty_stat;
 
 static int dirty_rate_set_state(int new_state)
@@ -71,6 +72,140 @@ static void update_dirtyrate(uint64_t msec)
     dirty_stat.dirty_rate = dirty_rate;
 }
 
+/*
+ * get hash result for the sampled memory with length of 4K byte in ramblock,
+ * which starts from ramblock base address.
+ */
+static int get_ramblock_vfn_hash(struct RamblockDirtyInfo *info, unsigned long vfn,
+                                 uint8_t **md)
+{
+    struct iovec iov_array;
+    int ret = 0;
+    int nkey = 1;
+
+    iov_array.iov_base = info->ramblock_addr +
+                         vfn * DIRTYRATE_SAMPLE_PAGE_SIZE;
+    iov_array.iov_len = DIRTYRATE_SAMPLE_PAGE_SIZE;
+
+    if (qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_MD5,
+                            &iov_array, nkey,
+                            md, &qcrypto_hash_len, NULL) < 0) {
+        ret = -1;
+    }
+
+    return ret;
+}
+
+static int save_ramblock_hash(struct RamblockDirtyInfo *info)
+{
+    unsigned int sample_pages_count;
+    uint8_t *md = NULL;
+    int i;
+    int ret = -1;
+    GRand* rand = g_rand_new();
+
+    sample_pages_count = info->sample_pages_count;
+
+    /* ramblock size less than one page, return success to skip this ramblock */
+    if (unlikely(info->ramblock_pages == 0 || sample_pages_count == 0)) {
+        ret = 0;
+        goto out;
+    }
+
+    info->hash_result = g_try_malloc0_n(sample_pages_count, sizeof(uint8_t) * qcrypto_hash_len);
+    if (!info->hash_result) {
+        ret = -1;
+        goto out;
+    }
+
+    info->sample_page_vfn = g_try_malloc0_n(sample_pages_count, sizeof(unsigned long));
+    if (!info->sample_page_vfn) {
+        g_free(info->hash_result);
+        ret = -1;
+        goto out;
+    }
+
+    for (i = 0; i < sample_pages_count; i++) {
+        md = info->hash_result + i * qcrypto_hash_len;
+        info->sample_page_vfn[i] = g_rand_int_range(rand, 0, info->ramblock_pages - 1);
+        ret = get_ramblock_vfn_hash(info, info->sample_page_vfn[i], &md);
+        if (ret < 0) {
+            goto out;
+        }
+    }
+    ret = 0;
+
+out:
+    g_rand_free(rand);
+    return ret;
+}
+
+static void get_ramblock_dirty_info(RAMBlock *block, struct RamblockDirtyInfo *info,
+                                    struct DirtyRateConfig *config)
+{
+    uint64_t sample_pages_per_gigabytes = config->sample_pages_per_gigabytes;
+
+    /* Right shift 30 bits to calc block size in GB */
+    info->sample_pages_count = (qemu_ram_get_used_length(block) * sample_pages_per_gigabytes) >> 30;
+
+    /* Right shift 12 bits to calc page count in 4KB */
+    info->ramblock_pages = qemu_ram_get_used_length(block) >> 12;
+    info->ramblock_addr = qemu_ram_get_host_addr(block);
+    strcpy(info->idstr, qemu_ram_get_idstr(block));
+}
+
+static struct RamblockDirtyInfo *
+alloc_ramblock_dirty_info(int *block_index,
+                          struct RamblockDirtyInfo *block_dinfo)
+{
+    struct RamblockDirtyInfo *info = NULL;
+    int index = *block_index;
+
+    if (!block_dinfo) {
+        block_dinfo = g_try_new(struct RamblockDirtyInfo, 1);
+        index = 0;
+    } else {
+        index++;
+        block_dinfo = g_try_realloc(block_dinfo, (index + 1) *
+                                    sizeof(struct RamblockDirtyInfo));
+    }
+    if (!block_dinfo)
+        return NULL;
+
+    info = &block_dinfo[index];
+    memset(info, 0, sizeof(struct RamblockDirtyInfo));
+
+    *block_index = index;
+    return block_dinfo;
+}
+
+static int record_ramblock_hash_info(struct DirtyRateConfig config,
+                                     struct RamblockDirtyInfo **block_dinfo, int *block_index)
+{
+    struct RamblockDirtyInfo *info = NULL;
+    struct RamblockDirtyInfo *dinfo = NULL;
+    RAMBlock *block = NULL;
+    int index = 0;
+
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        dinfo = alloc_ramblock_dirty_info(&index, dinfo);
+        if (dinfo == NULL)
+            return -1;
+        info = &dinfo[index];
+        get_ramblock_dirty_info(block, info, &config);
+        if (save_ramblock_hash(info) < 0) {
+            *block_dinfo = dinfo;
+            *block_index = index;
+            return -1;
+        }
+    }
+
+    *block_dinfo = dinfo;
+    *block_index = index;
+
+    return 0;
+}
+
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
     /* todo */
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index af57c80..0812b16 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -20,10 +20,17 @@
 #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            256
 
 /*
+ * Sample page size 4K as default.
+ */
+#define DIRTYRATE_SAMPLE_PAGE_SIZE                4096
+
+/*
  * Record ramblock idstr
  */
 #define RAMBLOCK_INFO_MAX_LEN                     256
 
+#define QCRYPTO_HASH_LEN                          16
+
 /* Take 1s as default for calculation duration */
 #define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
 
-- 
1.8.3.1


