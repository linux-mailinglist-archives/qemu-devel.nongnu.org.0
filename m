Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91F2D9782
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:40:22 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1komDG-0007i3-0R
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1komBs-0007Ib-Ca
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:38:56 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1komBp-0002kz-Lw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:38:55 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CvfXD08TLz7DrK;
 Mon, 14 Dec 2020 19:38:04 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 19:38:31 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>
Subject: [PATCH v2] kvm: Take into account the unaligned section size when
 preparing bitmap
Date: Mon, 14 Dec 2020 19:37:06 +0800
Message-ID: <20201214113706.1553-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yuzenghui@huawei.com;
 helo=szxga07-in.huawei.com
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
 Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel KVM_CLEAR_DIRTY_LOG interface has align requirement on both the
start and the size of the given range of pages. We have been careful to
handle the unaligned cases when performing CLEAR on one slot. But it seems
that we forget to take the unaligned *size* case into account when
preparing bitmap for the interface, and we may end up clearing dirty status
for pages outside of [start, start + size). As an example,

    // psize = qemu_real_host_page_size;
    // slot.start_addr = 0;
    // slot.memory_size = 64 * psize;

    kvm_log_clear_one_slot(slot, as, 0 * psize, 32 * psize);   --> [1]

So the @size is not aligned with 64 pages. With [1], we'll clear dirty
status for all 64 pages within this slot whilst the caller only wants to
clear the former 32 pages.

If the size is unaligned, let's go through the slow path to manipulate a
temp bitmap for the interface so that we won't bother with those unaligned
bits at the end of bitmap.

I don't think this can happen in practice since the upper layer would
provide us with the alignment guarantee. But kvm-all shouldn't rely on it.
Carefully handle it in case someday we'll hit it.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
* From v1:
  - Squash the misbehave example into commit message
  - Add Peter's Acked-by

 accel/kvm/kvm-all.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index baaa54249d..7644d44097 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -745,7 +745,7 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     assert(bmap_start % BITS_PER_LONG == 0);
     /* We should never do log_clear before log_sync */
     assert(mem->dirty_bmap);
-    if (start_delta) {
+    if (start_delta || bmap_npages - size / psize) {
         /* Slow path - we need to manipulate a temp bitmap */
         bmap_clear = bitmap_new(bmap_npages);
         bitmap_copy_with_src_offset(bmap_clear, mem->dirty_bmap,
@@ -758,7 +758,10 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
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


