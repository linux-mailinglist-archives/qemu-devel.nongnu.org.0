Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719234D02F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:37:24 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQr91-0007Q1-33
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1lQr7W-0006N8-IY
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:35:50 -0400
Received: from zxshcas2.zhaoxin.com ([203.148.12.82]:12961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1lQr7S-00070B-U7
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:35:50 -0400
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 29 Mar
 2021 20:14:22 +0800
Received: from localhost.localdomain (10.28.252.160) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 29 Mar
 2021 20:14:20 +0800
From: FelixCuioc <FelixCui-oc@zhaoxin.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: [PATCH 1/1] Remove flatview_simplify()
Date: Mon, 29 Mar 2021 20:14:08 +0800
Message-ID: <20210329121408.17862-2-FelixCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329121408.17862-1-FelixCui-oc@zhaoxin.com>
References: <20210329121408.17862-1-FelixCui-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.252.160]
X-ClientProxiedBy: ZXSHMBX2.zhaoxin.com (10.28.252.164) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Received-SPF: pass client-ip=203.148.12.82;
 envelope-from=FelixCui-oc@zhaoxin.com; helo=ZXSHCAS2.zhaoxin.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: RaymondPang-oc@zhaoxin.com, qemu-devel@nongnu.org, CobeChen-oc@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Flatview_simplify() can merge many small memory ranges
into a large one and contains EHCI dma buffers.
For example,the merged range maybe0xc0000-0xbfffffff.
When seabios write PAM register to change the properties
of part of the merged range from RW to readonly,
this action cause the merged IOVA mapping will be
unmapped.But EHCI device still send DMA cycles
and then IOMMU blocks the DMA cycles of EHCI device.

Because the merged range is too large,there will be
problems even if EHCI device is configured to not
allocate buffers in low memory.
So this patch wants to remove flatview_simplify() completely.

Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
---
 softmmu/memory.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e4..aaace8c03f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -314,42 +314,6 @@ void flatview_unref(FlatView *view)
     }
 }
 
-static bool can_merge(FlatRange *r1, FlatRange *r2)
-{
-    return int128_eq(addrrange_end(r1->addr), r2->addr.start)
-        && r1->mr == r2->mr
-        && int128_eq(int128_add(int128_make64(r1->offset_in_region),
-                                r1->addr.size),
-                     int128_make64(r2->offset_in_region))
-        && r1->dirty_log_mask == r2->dirty_log_mask
-        && r1->romd_mode == r2->romd_mode
-        && r1->readonly == r2->readonly
-        && r1->nonvolatile == r2->nonvolatile;
-}
-
-/* Attempt to simplify a view by merging adjacent ranges */
-static void flatview_simplify(FlatView *view)
-{
-    unsigned i, j, k;
-
-    i = 0;
-    while (i < view->nr) {
-        j = i + 1;
-        while (j < view->nr
-               && can_merge(&view->ranges[j-1], &view->ranges[j])) {
-            int128_addto(&view->ranges[i].addr.size, view->ranges[j].addr.size);
-            ++j;
-        }
-        ++i;
-        for (k = i; k < j; k++) {
-            memory_region_unref(view->ranges[k].mr);
-        }
-        memmove(&view->ranges[i], &view->ranges[j],
-                (view->nr - j) * sizeof(view->ranges[j]));
-        view->nr -= j - i;
-    }
-}
-
 static bool memory_region_big_endian(MemoryRegion *mr)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -735,7 +699,6 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
                              addrrange_make(int128_zero(), int128_2_64()),
                              false, false);
     }
-    flatview_simplify(view);
 
     view->dispatch = address_space_dispatch_new(view);
     for (i = 0; i < view->nr; i++) {
-- 
2.17.1


