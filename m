Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC76702CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:35:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXOt-0006Qz-F3; Mon, 15 May 2023 08:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOc-0006PI-JX
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOa-0003Hg-L6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aNRT/QOFv5C4ygClS3otDs06SJvR/HzI4hgraYypFc=;
 b=fU1CkwTvoxlgIC4AIgF2Cs4Je/5sIsR5GHFS/YeCyMNpjA/FHciMDH6hYZkZjn0XD218EE
 l7sXYPWW5DHhsC51zJ4dWT8BQnR0u46/1c11wML2wILVklHtms57O4uI25iiqBoRmto8BO
 4gpquhRIZvYZcXMET7TquUvWIgK7igQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-UPk55WeiOzGi8rKLMfDN9Q-1; Mon, 15 May 2023 08:33:39 -0400
X-MC-Unique: UPk55WeiOzGi8rKLMfDN9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 821121C07553;
 Mon, 15 May 2023 12:33:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C32435453;
 Mon, 15 May 2023 12:33:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Andrei Gudkov <gudkov.andrei@huawei.com>
Subject: [PULL 01/11] migration/calc-dirty-rate: replaced CRC32 with xxHash
Date: Mon, 15 May 2023 14:33:24 +0200
Message-Id: <20230515123334.58995-2-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Andrei Gudkov <gudkov.andrei@huawei.com>

This significantly reduces overhead of dirty page
rate calculation in sampling mode.
Tested using 32GiB VM on E5-2690 CPU.

With CRC32:
total_pages=8388608 sampled_pages=16384 millis=71

With xxHash:
total_pages=8388608 sampled_pages=16384 millis=14

Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
Message-Id: <cd115a89fc81d5f2eeb4ea7d57a98b84f794f340.1682598010.git.gudkov.andrei@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c  | 45 +++++++++++++++++++++++++++++++++---------
 migration/trace-events |  4 ++--
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 388337a332..5bac984fa5 100644
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
2.40.1


