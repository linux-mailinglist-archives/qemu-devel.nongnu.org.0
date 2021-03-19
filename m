Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C2341380
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:34:52 +0100 (CET)
Received: from localhost ([::1]:60250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5uV-0005ZU-Jw
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5r5-00011k-3l
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5r1-00030p-6c
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:18 -0400
IronPort-SDR: bTRti6lPSjqUkg9HSQE975zoYwjFoHXytbVmOPHtqfqdTYU3lJVYY90W2onWayMgY4Lq1zDm2v
 oPgYwx1G+S7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169117149"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169117149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:31:11 -0700
IronPort-SDR: cPBUgrMs2GnMF1xUpYjIuSM7+kojd4lfBqLC8ZyhLx32+98yuZku0mHuXBd4iFrN6RpBeLyyil
 /gWz0UEKBfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606448984"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 20:31:09 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v3 08/10] Reduce the PVM stop time during Checkpoint
Date: Fri, 19 Mar 2021 11:07:46 +0800
Message-Id: <1616123268-89517-9-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
References: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When flushing memory from ram cache to ram during every checkpoint
on secondary VM, we can copy continuous chunks of memory instead of
4096 bytes per time to reduce the time of VM stop during checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/ram.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index e795a8d..2a8ee96 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -823,6 +823,39 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
     return next;
 }
 
+/*
+ * colo_bitmap_find_diry:find contiguous dirty pages from start
+ *
+ * Returns the page offset within memory region of the start of the contiguout
+ * dirty page
+ *
+ * @rs: current RAM state
+ * @rb: RAMBlock where to search for dirty pages
+ * @start: page where we start the search
+ * @num: the number of contiguous dirty pages
+ */
+static inline
+unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
+                                     unsigned long start, unsigned long *num)
+{
+    unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
+    unsigned long *bitmap = rb->bmap;
+    unsigned long first, next;
+
+    if (ramblock_is_ignored(rb)) {
+        return size;
+    }
+
+    first = find_next_bit(bitmap, size, start);
+    if (first >= size) {
+        return first;
+    }
+    next = find_next_zero_bit(bitmap, size, first + 1);
+    assert(next >= first);
+    *num = next - first;
+    return first;
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page)
@@ -3669,6 +3702,8 @@ void colo_flush_ram_cache(void)
     void *dst_host;
     void *src_host;
     unsigned long offset = 0;
+    unsigned long num = 0;
+    unsigned long i = 0;
 
     memory_global_dirty_log_sync();
     WITH_RCU_READ_LOCK_GUARD() {
@@ -3682,19 +3717,23 @@ void colo_flush_ram_cache(void)
         block = QLIST_FIRST_RCU(&ram_list.blocks);
 
         while (block) {
-            offset = migration_bitmap_find_dirty(ram_state, block, offset);
+            offset = colo_bitmap_find_dirty(ram_state, block, offset, &num);
 
             if (((ram_addr_t)offset) << TARGET_PAGE_BITS
                 >= block->used_length) {
                 offset = 0;
+                num = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-                migration_bitmap_clear_dirty(ram_state, block, offset);
+                for (i = 0; i < num; i++) {
+                    migration_bitmap_clear_dirty(ram_state, block, offset + i);
+                }
                 dst_host = block->host
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
                 src_host = block->colo_cache
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
-                memcpy(dst_host, src_host, TARGET_PAGE_SIZE);
+                memcpy(dst_host, src_host, TARGET_PAGE_SIZE * num);
+                offset += num;
             }
         }
     }
-- 
1.8.3.1


