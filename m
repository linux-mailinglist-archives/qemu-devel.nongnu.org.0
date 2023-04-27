Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8936F060B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:44:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0yq-0006o1-7Q; Thu, 27 Apr 2023 08:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0ym-0006mY-Ez
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:08 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yZ-0001qR-1I
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:44:08 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q6b5H2CmYz6D9gs;
 Thu, 27 Apr 2023 20:43:47 +0800 (CST)
Received: from DESKTOP-0LHM7NF.huawei.com (10.199.58.101) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:43:48 +0100
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <zhengchuan@huawei.com>, Andrei Gudkov
 <gudkov.andrei@huawei.com>
Subject: [PATCH v2 1/4] migration/calc-dirty-rate: replaced CRC32 with xxHash
Date: Thu, 27 Apr 2023 15:42:57 +0300
Message-ID: <cd115a89fc81d5f2eeb4ea7d57a98b84f794f340.1682598010.git.gudkov.andrei@huawei.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1682598010.git.gudkov.andrei@huawei.com>
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Andrei Gudkov <gudkov.andrei@huawei.com>
From:  Andrei Gudkov via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This significantly reduces overhead of dirty page
rate calculation in sampling mode.
Tested using 32GiB VM on E5-2690 CPU.

With CRC32:
total_pages=8388608 sampled_pages=16384 millis=71

With xxHash:
total_pages=8388608 sampled_pages=16384 millis=14

Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
---
 migration/dirtyrate.c  | 45 +++++++++++++++++++++++++++++++++---------
 migration/trace-events |  4 ++--
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 180ba38c7a..acba3213a3 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -29,6 +29,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "exec/memory.h"
+#include "qemu/xxhash.h"
 
 /*
  * total_dirty_pages is procted by BQL and is used
@@ -308,6 +309,33 @@ static void update_dirtyrate(uint64_t msec)
     DirtyStat.dirty_rate = dirtyrate;
 }
 
+/*
+ * Compute hash of a single page of size TARGET_PAGE_SIZE.
+ */
+static uint32_t compute_page_hash(void *ptr)
+{
+    uint32_t i;
+    uint64_t v1, v2, v3, v4;
+    uint64_t res;
+    const uint64_t *p = ptr;
+
+    v1 = QEMU_XXHASH_SEED + XXH_PRIME64_1 + XXH_PRIME64_2;
+    v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
+    v3 = QEMU_XXHASH_SEED + 0;
+    v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
+    for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
+        v1 = XXH64_round(v1, p[i + 0]);
+        v2 = XXH64_round(v2, p[i + 1]);
+        v3 = XXH64_round(v3, p[i + 2]);
+        v4 = XXH64_round(v4, p[i + 3]);
+    }
+    res = XXH64_mergerounds(v1, v2, v3, v4);
+    res += TARGET_PAGE_SIZE;
+    res = XXH64_avalanche(res);
+    return (uint32_t)(res & UINT32_MAX);
+}
+
+
 /*
  * get hash result for the sampled memory with length of TARGET_PAGE_SIZE
  * in ramblock, which starts from ramblock base address.
@@ -315,13 +343,12 @@ static void update_dirtyrate(uint64_t msec)
 static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
                                       uint64_t vfn)
 {
-    uint32_t crc;
+    uint32_t hash;
 
-    crc = crc32(0, (info->ramblock_addr +
-                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
+    hash = compute_page_hash(info->ramblock_addr + vfn * TARGET_PAGE_SIZE);
 
-    trace_get_ramblock_vfn_hash(info->idstr, vfn, crc);
-    return crc;
+    trace_get_ramblock_vfn_hash(info->idstr, vfn, hash);
+    return hash;
 }
 
 static bool save_ramblock_hash(struct RamblockDirtyInfo *info)
@@ -454,13 +481,13 @@ out:
 
 static void calc_page_dirty_rate(struct RamblockDirtyInfo *info)
 {
-    uint32_t crc;
+    uint32_t hash;
     int i;
 
     for (i = 0; i < info->sample_pages_count; i++) {
-        crc = get_ramblock_vfn_hash(info, info->sample_page_vfn[i]);
-        if (crc != info->hash_result[i]) {
-            trace_calc_page_dirty_rate(info->idstr, crc, info->hash_result[i]);
+        hash = get_ramblock_vfn_hash(info, info->sample_page_vfn[i]);
+        if (hash != info->hash_result[i]) {
+            trace_calc_page_dirty_rate(info->idstr, hash, info->hash_result[i]);
             info->sample_dirty_count++;
         }
     }
diff --git a/migration/trace-events b/migration/trace-events
index 92161eeac5..f39818c329 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -342,8 +342,8 @@ dirty_bitmap_load_success(void) ""
 # dirtyrate.c
 dirtyrate_set_state(const char *new_state) "new state %s"
 query_dirty_rate_info(const char *new_state) "current state %s"
-get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t crc) "ramblock name: %s, vfn: %"PRIu64 ", crc: %" PRIu32
-calc_page_dirty_rate(const char *idstr, uint32_t new_crc, uint32_t old_crc) "ramblock name: %s, new crc: %" PRIu32 ", old crc: %" PRIu32
+get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t hash) "ramblock name: %s, vfn: %"PRIu64 ", hash: %" PRIu32
+calc_page_dirty_rate(const char *idstr, uint32_t new_hash, uint32_t old_hash) "ramblock name: %s, new hash: %" PRIu32 ", old hash: %" PRIu32
 skip_sample_ramblock(const char *idstr, uint64_t ramblock_size) "ramblock name: %s, ramblock size: %" PRIu64
 find_page_matched(const char *idstr) "ramblock %s addr or size changed"
 dirtyrate_calculate(int64_t dirtyrate) "dirty rate: %" PRIi64 " MB/s"
-- 
2.30.2


