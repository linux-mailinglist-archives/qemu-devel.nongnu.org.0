Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5533855F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:30:53 +0100 (CET)
Received: from localhost ([::1]:46192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaNw-0002iV-Kk
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaJ7-0005kX-U4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:29330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaJ3-000710-Rz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:53 -0500
IronPort-SDR: r3fS6Og3u4ELJFFI1M2U/vYbyk9bErEQ9/GWiNemBTMorgxKs7JfLEMbulP9vsjOxTLpgi/Cwz
 nFefbADdQOKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="176376599"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="176376599"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:47 -0800
IronPort-SDR: TP8U5etHzaeljpq3VCLy7erGemAGdVgTPDFh0QtkhI/0ofb3nmW7r6OVHlK32DtrBFrTr4i19X
 JmF2FSnxbE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481983"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:43 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 09/10] Add the function of colo_bitmap_clear_diry
Date: Fri, 12 Mar 2021 13:03:02 +0800
Message-Id: <1615525383-59071-10-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
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

When we use continuous dirty memory copy for flushing ram cache on
secondary VM, we can also clean up the bitmap of contiguous dirty
page memory. This also can reduce the VM stop time during checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/ram.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b269637..008a26e 100644
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


