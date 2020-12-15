Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03C2DB338
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:05:53 +0100 (CET)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEhs-0000Dt-Iv
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXV-0003Fk-DQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXN-0001W2-0C
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYDd6zYKz9pi+upwu6ID1TqfBHFMyVj6C3gpkiA5RLQ=;
 b=WTRsUE4thYPiMTqh9Zxn8YILH3EFxe0+TaExWO5V/std+mY2lKTDF7dpvQUVc5+YgncOzr
 DOyAn05a7npQ6jfilIH+UnaEwzCOKdh14gYXCpG3WxQwENMqNJ+ROFy0zdVeRkdLp4rjMZ
 A5Tugs6xL1LTsYn5TNy8z+8rx02/FqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-SPG4SXA0OiWHhmQ2LAeqpw-1; Tue, 15 Dec 2020 12:54:58 -0500
X-MC-Unique: SPG4SXA0OiWHhmQ2LAeqpw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32FC718B37E0;
 Tue, 15 Dec 2020 17:54:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5F2B5C1C4;
 Tue, 15 Dec 2020 17:54:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/45] kvm: Take into account the unaligned section size when
 preparing bitmap
Date: Tue, 15 Dec 2020 12:54:26 -0500
Message-Id: <20201215175445.1272776-27-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

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
Message-Id: <20201208114013.875-1-yuzenghui@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 666b9ab96c..389eaace72 100644
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
2.26.2



