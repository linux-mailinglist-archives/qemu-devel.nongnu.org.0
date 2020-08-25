Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576C8250E4B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 03:36:38 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kANt7-00074o-Dt
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 21:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kANo2-0005Oc-OW
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 21:31:22 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4217 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kANo0-0005rF-Mb
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 21:31:22 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 41ED7F8F06CBE946409F;
 Tue, 25 Aug 2020 09:31:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 09:30:55 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v5 12/12] migration/dirtyrate: Add trace_calls to make it
 easier to debug
Date: Tue, 25 Aug 2020 09:40:50 +0800
Message-ID: <1598319650-36762-13-git-send-email-zhengchuan@huawei.com>
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

Add trace_calls to  make it easier to debug

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c  | 7 +++++++
 migration/trace-events | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 08c46d3..3513ef3 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -23,6 +23,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "migration.h"
 #include "ram.h"
+#include "trace.h"
 #include "dirtyrate.h"
 
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
@@ -55,6 +56,7 @@ static int64_t get_sample_page_period(int64_t sec)
 static int dirtyrate_set_state(int *state, int old_state, int new_state)
 {
     assert(new_state < DIRTY_RATE_STATUS__MAX);
+    trace_dirtyrate_set_state(DirtyRateStatus_str(new_state));
     if (atomic_cmpxchg(state, old_state, new_state) == old_state) {
         return 0;
     } else {
@@ -78,6 +80,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
      * Only support query once for each calculation,
      * reset as DIRTY_RATE_STATUS_UNSTARTED after query
      */
+    trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
     (void)dirtyrate_set_state(&CalculatingState, CalculatingState,
                               DIRTY_RATE_STATUS_UNSTARTED);
 
@@ -129,6 +132,7 @@ static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
 
     crc = crc32(0, iov_array.iov_base, iov_array.iov_len);
 
+    trace_get_ramblock_vfn_hash(info->idstr, vfn, crc);
     return crc;
 }
 
@@ -246,6 +250,7 @@ static int skip_sample_ramblock(RAMBlock *block)
      * want to sample.
      */
     if (ramblock_size < MIN_RAMBLOCK_SIZE) {
+        trace_skip_sample_ramblock(block->idstr, ramblock_size);
         return -1;
     }
 
@@ -292,6 +297,7 @@ static int calc_page_dirty_rate(struct RamblockDirtyInfo *info)
     for (i = 0; i < info->sample_pages_count; i++) {
         crc = get_ramblock_vfn_hash(info, info->sample_page_vfn[i]);
         if (crc != info->hash_result[i]) {
+            trace_calc_page_dirty_rate(info->idstr, crc, info->hash_result[i]);
             info->sample_dirty_count++;
         }
     }
@@ -317,6 +323,7 @@ static bool find_page_matched(RAMBlock *block, struct RamblockDirtyInfo *infos,
     if (infos[i].ramblock_addr != qemu_ram_get_host_addr(block) ||
         infos[i].ramblock_pages !=
             (qemu_ram_get_used_length(block) >> DIRTYRATE_PAGE_SHIFT_KB)) {
+        trace_find_page_matched(block->idstr);
         return false;
     }
 
diff --git a/migration/trace-events b/migration/trace-events
index 4ab0a50..34569b9 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -312,3 +312,11 @@ dirty_bitmap_load_bits_zeroes(void) ""
 dirty_bitmap_load_header(uint32_t flags) "flags 0x%x"
 dirty_bitmap_load_enter(void) ""
 dirty_bitmap_load_success(void) ""
+
+# dirtyrate.c
+dirtyrate_set_state(const char *new_state) "new state %s"
+query_dirty_rate_info(const char *new_state) "current state %s"
+get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t crc) "ramblock name: %s, vfn: %"PRIu64 ", crc: %" PRIu32
+calc_page_dirty_rate(const char *idstr, uint32_t new_crc, uint32_t old_crc) "ramblock name: %s, new crc: %" PRIu32 ", old crc: %" PRIu32
+skip_sample_ramblock(const char *idstr, int64_t ramblock_size) "ramblock name: %s, ramblock size: %" PRIu64
+find_page_matched(const char *idstr) "ramblock %s addr or size changed"
-- 
1.8.3.1


