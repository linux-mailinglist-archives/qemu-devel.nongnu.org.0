Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC330CF5B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:51:47 +0100 (CET)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74WQ-0005mR-HQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74R5-0007n0-5o
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qn-000640-Vo
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pj9Dorn2S9imnPXtq+qvM4EkUTvngDuoNVbkBZ7l0bQ=;
 b=Twj86cvbXWgby7+GU0uFoiSHA3zFY6RoIBPAjVQT9+Cj8kXnhgnDq/WycUYsGuMBobxt82
 rU9cwn2tdRQu16A+xyjhHh2pOZAUg7dmVaMgabu4/3Lr8yFcsIeDVnrZ5Rfnq617MExLM8
 EboU7pAw32plnT/cCFb5ebU533P2Pt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-cNhrS74jMtaRgSptLaa1Fg-1; Tue, 02 Feb 2021 17:45:46 -0500
X-MC-Unique: cNhrS74jMtaRgSptLaa1Fg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5555C804023;
 Tue,  2 Feb 2021 22:45:45 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8B2710016F5;
 Tue,  2 Feb 2021 22:45:44 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] block/io: support int64_t bytes in
 bdrv_co_do_copy_on_readv()
Date: Tue,  2 Feb 2021 16:45:22 -0600
Message-Id: <20210202224529.642055-14-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, prepare bdrv_co_do_copy_on_readv() now.

'bytes' type widening, so callers are safe. Look at the function
itself:

bytes, skip_bytes and progress become int64_t.

bdrv_round_to_clusters() is OK, cluster_bytes now may be large.
trace_bdrv_co_do_copy_on_readv() is OK

looping through cluster_bytes is still OK.

pnum is still capped to max_transfer, and to MAX_BOUNCE_BUFFER when we
are going to do COR operation. Therefor calculations in
qemu_iovec_from_buf() and bdrv_driver_preadv() should not change.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-13-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c         | 8 +++++---
 block/trace-events | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 59ae0a110da1..63b0fa0e9ed7 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1311,7 +1311,7 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
 }

 static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
-        int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
@@ -1326,13 +1326,15 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     BlockDriver *drv = bs->drv;
     int64_t cluster_offset;
     int64_t cluster_bytes;
-    size_t skip_bytes;
+    int64_t skip_bytes;
     int ret;
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
                                     BDRV_REQUEST_MAX_BYTES);
-    unsigned int progress = 0;
+    int64_t progress = 0;
     bool skip_write;

+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
diff --git a/block/trace-events b/block/trace-events
index ecbc32a80a91..82b5dd7cb619 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -14,7 +14,7 @@ blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
 bdrv_co_pwritev(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "bs %p offset %"PRId64" count %d flags 0x%x"
-bdrv_co_do_copy_on_readv(void *bs, int64_t offset, unsigned int bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %"PRId64" bytes %u cluster_offset %"PRId64" cluster_bytes %"PRId64
+bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
 bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"

-- 
2.30.0


