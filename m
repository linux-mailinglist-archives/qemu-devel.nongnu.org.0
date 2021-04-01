Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27373510B0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:14:18 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsT3-0007SV-Pt
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsQ1-0002k1-Oh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:11:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:13082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPz-00067j-SE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:11:09 -0400
IronPort-SDR: vmTsYzo+znR32h4mFnT9L9fdQ2DFEyCCkABF2Ik6TD5h2/789KeWDUzbN9aWjUO1NQe9vhYHIr
 7wgo7+bFoHtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192205151"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="192205151"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 01:11:06 -0700
IronPort-SDR: /c6H/bAyzP7aU+9Hgi8XQgSW3Da4niUmKVdcT/t/sl4hdQPZk2CSrgH7NaURfFF8HLmdGRNpWM
 k6iEPvfHtdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439119235"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2021 01:11:03 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v5 09/10] Add the function of colo_bitmap_clear_dirty
Date: Thu,  1 Apr 2021 15:47:28 +0800
Message-Id: <1617263249-54501-10-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.65; envelope-from=lei.rao@intel.com;
 helo=mga03.intel.com
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

The performance test for COLO as follow:

Server configuraton:
CPU :Intel(R) Xeon(R) Gold 6140 CPU @ 2.30GHz
MEM :251G(type:DDR4 Speed:2666 MT/s)
SSD :Intel 730 and DC S35x0/3610/3700 Series SSDs

dirty pages:3189376  migration_bitmap_clear_dirty time consuming(ns):105194000
dirty pages:3189784  migration_bitmap_clear_dirty time consuming(ns):105297000
dirty pages:3190501  migration_bitmap_clear_dirty time consuming(ns):105410000
dirty pages:3188734  migration_bitmap_clear_dirty time consuming(ns):105138000
dirty pages:3189464  migration_bitmap_clear_dirty time consuming(ns):111736000
dirty pages:3188558  migration_bitmap_clear_dirty time consuming(ns):105079000
dirty pages:3239489  migration_bitmap_clear_dirty time consuming(ns):106761000

dirty pages:3190240  colo_bitmap_clear_dirty time consuming(ns):8369000
dirty pages:3189293  colo_bitmap_clear_dirty time consuming(ns):8388000
dirty pages:3189171  colo_bitmap_clear_dirty time consuming(ns):8641000
dirty pages:3189099  colo_bitmap_clear_dirty time consuming(ns):8280000
dirty pages:3189974  colo_bitmap_clear_dirty time consuming(ns):8352000
dirty pages:3189471  colo_bitmap_clear_dirty time consuming(ns):8348000
dirty pages:3189681  colo_bitmap_clear_dirty time consuming(ns):8426000

it can be seen from the data that colo_bitmap_clear_dirty is more
efficient.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/ram.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 317fa4e..570ffa4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -857,6 +857,36 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
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
+    /*
+     * Since flush ram cache to ram can only happen on Secondary VM.
+     * and the clear bitmap always is NULL on destination side.
+     * Therefore, there is unnecessary to judge whether the
+     * clear_bitmap needs clear.
+     */
+    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
+    for (i = 0; i < num; i++) {
+        ret = test_and_clear_bit(start + i, rb->bmap);
+        if (ret) {
+            rs->migration_dirty_pages--;
+        }
+    }
+
+    return ret;
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page)
@@ -3723,11 +3753,7 @@ void colo_flush_ram_cache(void)
                 num = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-                unsigned long i = 0;
-
-                for (i = 0; i < num; i++) {
-                    migration_bitmap_clear_dirty(ram_state, block, offset + i);
-                }
+                colo_bitmap_clear_dirty(ram_state, block, offset, num);
                 dst_host = block->host
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
                 src_host = block->colo_cache
-- 
1.8.3.1


