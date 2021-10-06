Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23B423C65
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:14:25 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4sS-0001Zy-P1
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eV-0000JZ-Gt
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eT-0006En-Ot
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2K7wwe6cos0Co9SCrHEDafO0i6pzgkz97OSYuikjPM=;
 b=NjOMovpvNFcrwJDACX46EhlsXjRdDuR1qZTPX/Ac/w8iyb+jrb6TwVurlnfE1A7N5fJKzq
 GrZXU6IjDzkwWxPijOyOL/H904TKWiuTSiGZKFQ4CH9HHwyU9sSyA5jR1sCoD+x9dYYTbe
 OVWUONdhVp4h/l/OlGRs27F7VOEkbFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-euMNRmilPLyNWLXF9JCYig-1; Wed, 06 Oct 2021 06:59:55 -0400
X-MC-Unique: euMNRmilPLyNWLXF9JCYig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED9D835DE1;
 Wed,  6 Oct 2021 10:59:54 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF9760BE5;
 Wed,  6 Oct 2021 10:59:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/13] block: introduce max_hw_iov for use in scsi-generic
Date: Wed,  6 Oct 2021 12:59:18 +0200
Message-Id: <20211006105923.223549-9-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

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
Cc: qemu-stable@nongnu.org
Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210923130436.1187591-1-pbonzini@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h      | 7 +++++++
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 6 ++++++
 block/file-posix.c             | 2 +-
 block/io.c                     | 1 +
 hw/scsi/scsi-generic.c         | 2 +-
 6 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index ffe86068d4..f4c75e8ba9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -718,6 +718,13 @@ typedef struct BlockLimits {
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
index c62e42743d..53be0bdc1b 100644
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
index 18d345a87a..bb0a254def 100644
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
-- 
2.31.1


