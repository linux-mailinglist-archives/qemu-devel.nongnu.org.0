Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17F341384
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:36:18 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5vt-0007wc-Bm
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5r5-00012B-A4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:34610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5r3-00038f-0t
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:19 -0400
IronPort-SDR: MYXlynPNGVVpJicm93NQ8BkUr22YtcgafVVKdy4R6hW9/gQXKENgdUSdo727nFhQbaTKcHy6sI
 P/Nbm6Tp106A==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169117181"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169117181"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:31:15 -0700
IronPort-SDR: CNl4WPp0E2XtH7FB4Bn1iV/FbPqH11FBhJfViyCwNr3RFbEmxHdpkrDM+d12GXwz5sRRwS5uXq
 Z3YAhszgpMpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606449006"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 20:31:12 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v3 09/10] Add the function of colo_bitmap_clear_diry.
Date: Fri, 19 Mar 2021 11:07:47 +0800
Message-Id: <1616123268-89517-10-git-send-email-lei.rao@intel.com>
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

When we use continuous dirty memory copy for flushing ram cache on
secondary VM, we can also clean up the bitmap of contiguous dirty
page memory. This also can reduce the VM stop time during checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/ram.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 2a8ee96..9b23df6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -856,6 +856,30 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
     return first;
 }
 
+/**
+ * colo_bitmap_clear_dirty:when we flush ram cache to ram, we will use
+ * continuous memory copy, so we can also clean up the bitmap of contiguous
+ * dirty memory.
+ */
+static inline bool colo_bitmap_clear_dirty(RAMState *rs,
+                                           RAMBlock *rb,
+                                           unsigned long start,
+                                           unsigned long num)
+{
+    bool ret;
+    unsigned long i = 0;
+
+    qemu_mutex_lock(&rs->bitmap_mutex);
+    for (i = 0; i < num; i++) {
+        ret = test_and_clear_bit(start + i, rb->bmap);
+        if (ret) {
+            rs->migration_dirty_pages--;
+        }
+    }
+    qemu_mutex_unlock(&rs->bitmap_mutex);
+    return ret;
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page)
@@ -3703,7 +3727,6 @@ void colo_flush_ram_cache(void)
     void *src_host;
     unsigned long offset = 0;
     unsigned long num = 0;
-    unsigned long i = 0;
 
     memory_global_dirty_log_sync();
     WITH_RCU_READ_LOCK_GUARD() {
@@ -3725,9 +3748,7 @@ void colo_flush_ram_cache(void)
                 num = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-                for (i = 0; i < num; i++) {
-                    migration_bitmap_clear_dirty(ram_state, block, offset + i);
-                }
+                colo_bitmap_clear_dirty(ram_state, block, offset, num);
                 dst_host = block->host
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
                 src_host = block->colo_cache
-- 
1.8.3.1


