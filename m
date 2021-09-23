Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1914415F2D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:07:10 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTORR-0005DK-Ob
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTOPI-0003cA-0f
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTOPF-0000TU-Go
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632402292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZfoacO0I99bX1J14b0zBaj8jy7+N9TWBsLk+q1Wk6fQ=;
 b=QvgGQloZ7j3AKLCZH9uNiP3xK+wooJz81ylZturqFSQqoUas8QmPWSxLoWaBRr1nsB2uYy
 rRrrzLJ+NuZFlyPzi4JpQqvLgyrv4bFKbwSy/IUO8vg4HqgNTtKx7woZMHKnhCSCB5+BtD
 oEa2Moa2PHuSZxFBK0XNfHyKBA9fLqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-LNT03_jOOjKght26Ko_byw-1; Thu, 23 Sep 2021 09:04:51 -0400
X-MC-Unique: LNT03_jOOjKght26Ko_byw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0DC9802B9F;
 Thu, 23 Sep 2021 13:04:49 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75F511000358;
 Thu, 23 Sep 2021 13:04:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block: introduce max_hw_iov for use in scsi-generic
Date: Thu, 23 Sep 2021 09:04:36 -0400
Message-Id: <20210923130436.1187591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
sources, IOV_MAX in POSIX).  Because of this, on some host adapters
requests with many iovecs are rejected with -EINVAL by the
io_submit() or readv()/writev() system calls.

In fact, the same limit applies to SG_IO as well.  To fix both the
EINVAL and the possible performance issues from using fewer iovecs
than allowed by Linux (some HBAs have max_segments as low as 128),
introduce a separate entry in BlockLimits to hold the max_segments
value from sysfs.  This new limit is used only for SG_IO and clamped
to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
bs->bl.max_transfer.

Reported-by: Halil Pasic <pasic@linux.ibm.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org
Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c          | 6 ++++++
 block/file-posix.c             | 2 +-
 block/io.c                     | 1 +
 hw/scsi/scsi-generic.c         | 2 +-
 include/block/block_int.h      | 7 +++++++
 include/sysemu/block-backend.h | 1 +
 6 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6140d133e2..ba2b5ebb10 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1986,6 +1986,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
     return ROUND_DOWN(max, blk_get_request_alignment(blk));
 }
 
+int blk_get_max_hw_iov(BlockBackend *blk)
+{
+    return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
+                        blk->root->bs->bl.max_iov);
+}
+
 int blk_get_max_iov(BlockBackend *blk)
 {
     return blk->root->bs->bl.max_iov;
diff --git a/block/file-posix.c b/block/file-posix.c
index cb9bffe047..1567edb3d5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
         ret = hdev_get_max_segments(s->fd, &st);
         if (ret > 0) {
-            bs->bl.max_iov = ret;
+            bs->bl.max_hw_iov = ret;
         }
     }
 }
diff --git a/block/io.c b/block/io.c
index a19942718b..f38e7f81d8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
     dst->min_mem_alignment = MAX(dst->min_mem_alignment,
                                  src->min_mem_alignment);
     dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
+    dst->max_hw_iov = MIN_NON_ZERO(dst->max_hw_iov, src->max_hw_iov);
 }
 
 typedef struct BdrvRefreshLimitsState {
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 665baf900e..0306ccc7b1 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
         page = r->req.cmd.buf[2];
         if (page == 0xb0) {
             uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
-            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
+            uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
 
             assert(max_transfer);
             max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8..c31cbd034a 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -702,6 +702,13 @@ typedef struct BlockLimits {
      */
     uint64_t max_hw_transfer;
 
+    /* Maximal number of scatter/gather elements allowed by the hardware.
+     * Applies whenever transfers to the device bypass the kernel I/O
+     * scheduler, for example with SG_IO.  If larger than max_iov
+     * or if zero, blk_get_max_hw_iov will fall back to max_iov.
+     */
+    int max_hw_iov;
+
     /* memory alignment, in bytes so that no bounce buffer is needed */
     size_t min_mem_alignment;
 
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 29d4fdbf63..82bae55161 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -211,6 +211,7 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
 uint32_t blk_get_max_transfer(BlockBackend *blk);
 uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
 int blk_get_max_iov(BlockBackend *blk);
+int blk_get_max_hw_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
 void *blk_blockalign(BlockBackend *blk, size_t size);
-- 
2.27.0


