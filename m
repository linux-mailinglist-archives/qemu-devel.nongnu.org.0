Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6533855B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:29:33 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaMe-0001X4-Iw
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIy-0005dH-DU
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:4921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIv-0006dL-1P
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:44 -0500
IronPort-SDR: HznS43ecIf9pWshvth5T9ZwcKe4ZTDHsIFWXv+VmC20PuTTJc0lwyiSaHVpsuB3ZX3ytKn3cCH
 Clql+DgrrfOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="273826942"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="273826942"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:40 -0800
IronPort-SDR: 9YRfhr8z4CeV1AtP0qTvQaFPofRqzi4K7YRVWUa0i0sRR5kKJPChI6Oh4gN93hChwgiJpw/OtU
 A34PecUhl3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481972"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:36 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 08/10] Reduce the PVM stop time during Checkpoint
Date: Fri, 12 Mar 2021 13:03:01 +0800
Message-Id: <1615525383-59071-9-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 migration/ram.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index e795a8d..b269637 100644
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
@@ -3682,19 +3717,22 @@ void colo_flush_ram_cache(void)
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
             }
         }
     }
-- 
1.8.3.1


