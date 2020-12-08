Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F792D29E4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 12:42:28 +0100 (CET)
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbNy-0005bZ-M2
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 06:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kmbMh-00058n-U3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:41:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kmbMc-0006pG-KA
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:41:07 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqysJ52Tfzkn5p;
 Tue,  8 Dec 2020 19:40:04 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 19:40:37 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>
Subject: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Date: Tue, 8 Dec 2020 19:40:13 +0800
Message-ID: <20201208114013.875-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel KVM_CLEAR_DIRTY_LOG interface has align requirement on both the
start and the size of the given range of pages. We have been careful to
handle the unaligned cases when performing CLEAR on one slot. But it seems
that we forget to take the unaligned *size* case into account when
preparing bitmap for the interface, and we may end up clearing dirty status
for pages outside of [start, start + size).

If the size is unaligned, let's go through the slow path to manipulate a
temp bitmap for the interface so that we won't bother with those unaligned
bits at the end of bitmap.

I don't think this can happen in practice since the upper layer would
provide us with the alignment guarantee. I'm not sure if kvm-all could rely
on it. And this patch is mainly intended to address correctness of the
specific algorithm used inside kvm_log_clear_one_slot().

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 accel/kvm/kvm-all.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index bed2455ca5..05d323ba1f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -747,7 +747,7 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     assert(bmap_start % BITS_PER_LONG == 0);
     /* We should never do log_clear before log_sync */
     assert(mem->dirty_bmap);
-    if (start_delta) {
+    if (start_delta || bmap_npages - size / psize) {
         /* Slow path - we need to manipulate a temp bitmap */
         bmap_clear = bitmap_new(bmap_npages);
         bitmap_copy_with_src_offset(bmap_clear, mem->dirty_bmap,
@@ -760,7 +760,10 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
         bitmap_clear(bmap_clear, 0, start_delta);
         d.dirty_bitmap = bmap_clear;
     } else {
-        /* Fast path - start address aligns well with BITS_PER_LONG */
+        /*
+         * Fast path - both start and size align well with BITS_PER_LONG
+         * (or the end of memory slot)
+         */
         d.dirty_bitmap = mem->dirty_bmap + BIT_WORD(bmap_start);
     }
 
-- 
2.19.1


