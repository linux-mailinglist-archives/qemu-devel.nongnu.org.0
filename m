Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB244A541
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 04:16:45 +0100 (CET)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkHcq-0000hi-Lu
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 22:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkHZm-0005eL-4z
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 22:13:34 -0500
Received: from mga07.intel.com ([134.134.136.100]:45865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkHZk-0005IH-DG
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 22:13:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="295808371"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="295808371"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 19:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="491490340"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 08 Nov 2021 19:13:26 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 lukasstraub2@web.de, dgilbert@redhat.com
Subject: [PATCH v7 2/2] Reduce the PVM stop time during Checkpoint
Date: Tue,  9 Nov 2021 11:04:55 +0800
Message-Id: <1636427095-11739-3-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
References: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When flushing memory from ram cache to ram during every checkpoint
on secondary VM, we can copy continuous chunks of memory instead of
4096 bytes per time to reduce the time of VM stop during checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d5f98e6..863035d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -845,6 +845,41 @@ migration_clear_memory_region_dirty_bitmap_range(RAMBlock *rb,
     }
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
+    *num = 0;
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
@@ -3895,19 +3930,26 @@ void colo_flush_ram_cache(void)
         block = QLIST_FIRST_RCU(&ram_list.blocks);
 
         while (block) {
-            offset = migration_bitmap_find_dirty(ram_state, block, offset);
+            unsigned long num = 0;
 
+            offset = colo_bitmap_find_dirty(ram_state, block, offset, &num);
             if (!offset_in_ramblock(block,
                                     ((ram_addr_t)offset) << TARGET_PAGE_BITS)) {
                 offset = 0;
+                num = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-                migration_bitmap_clear_dirty(ram_state, block, offset);
+                unsigned long i = 0;
+
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


