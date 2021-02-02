Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3130CF96
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:05:01 +0100 (CET)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74jE-0004YS-Cn
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qz-0007l5-I3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qh-0005yC-IJ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knzTmtfTAH/MVCyM2gVYqPTsxDBlrsUYAd4+X4phvZY=;
 b=CIUGbCoq39mpjUROl1h4pK5IW+Nh79GZeHx2wrzwuDhRKrW6Qcu6euWyJteJbDefJbEzi4
 xAYuzc2YvJzwKVKnFxUMaf/7RmVPHyaEg5OchWJce8m6wA/VKx5BjbQThIw6ZmlzzdUTva
 55ClltEkE3bP+cvumFG9MmRsJ0BEo4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-aZWMxTltPT2xrj8tFuNxDQ-1; Tue, 02 Feb 2021 17:45:48 -0500
X-MC-Unique: aZWMxTltPT2xrj8tFuNxDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD85E107ACE3;
 Tue,  2 Feb 2021 22:45:47 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F36510016F9;
 Tue,  2 Feb 2021 22:45:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] block/io: support int64_t bytes in read/write wrappers
Date: Tue,  2 Feb 2021 16:45:25 -0600
Message-Id: <20210202224529.642055-17-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:blkverify" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

Now, since bdrv_co_preadv_part() and bdrv_co_pwritev_part() have been
updated, update all their wrappers.

For all of them type of 'bytes' is widening, so callers are safe. We
have update request_fn in blkverify.c simultaneously. Still it's just a
pointer to one of bdrv_co_pwritev() or bdrv_co_preadv(), and type is
widening for callers of the request_fn anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-16-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block.h     | 11 ++++++-----
 include/block/block_int.h |  4 ++--
 block/io.c                | 15 ++++++++-------
 block/blkverify.c         |  2 +-
 block/trace-events        |  2 +-
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 81fcaad5acca..5f28d0d33f5c 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -392,12 +392,13 @@ int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int bytes, BdrvRequestFlags flags);
+                       int64_t bytes, BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int bytes);
-int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf, int bytes);
+int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes);
+int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
+                int64_t bytes);
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                     const void *buf, int count);
+                     const void *buf, int64_t bytes);
 /*
  * Efficiently zero a region of the disk image.  Note that this is a regular
  * I/O request like read or write and should have a reasonable size.  This
@@ -405,7 +406,7 @@ int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
  * because it may allocate memory for the entire region.
  */
 int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                       int bytes, BdrvRequestFlags flags);
+                                       int64_t bytes, BdrvRequestFlags flags);
 BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
     const char *backing_file);
 void bdrv_refresh_filename(BlockDriverState *bs);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f2ad8aa771c3..749d1fb9d049 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1032,13 +1032,13 @@ extern BlockDriver bdrv_raw;
 extern BlockDriver bdrv_qcow2;

 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     int64_t offset, int64_t bytes,
diff --git a/block/io.c b/block/io.c
index 7b6b0027bc4c..8817c8496663 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1005,7 +1005,7 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
 }

 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int bytes, BdrvRequestFlags flags)
+                       int64_t bytes, BdrvRequestFlags flags)
 {
     return bdrv_pwritev(child, offset, bytes, NULL,
                         BDRV_REQ_ZERO_WRITE | flags);
@@ -1053,7 +1053,7 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
 }

 /* See bdrv_pwrite() for the return codes */
-int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int bytes)
+int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1073,7 +1073,8 @@ int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int bytes)
   -EINVAL      Invalid offset or number of bytes
   -EACCES      Trying to write a read-only device
 */
-int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf, int bytes)
+int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
+                int64_t bytes)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1094,7 +1095,7 @@ int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf, int bytes)
  * Returns 0 on success, -errno in error cases.
  */
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                     const void *buf, int count)
+                     const void *buf, int64_t count)
 {
     int ret;

@@ -1759,7 +1760,7 @@ static int bdrv_pad_request(BlockDriverState *bs,
 }

 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(child, offset, bytes, qiov, 0, flags);
@@ -2186,7 +2187,7 @@ out:
  * Handle a write request in coroutine context
  */
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(child, offset, bytes, qiov, 0, flags);
@@ -2279,7 +2280,7 @@ out:
 }

 int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                       int bytes, BdrvRequestFlags flags)
+                                       int64_t bytes, BdrvRequestFlags flags)
 {
     trace_bdrv_co_pwrite_zeroes(child->bs, offset, bytes, flags);

diff --git a/block/blkverify.c b/block/blkverify.c
index 4aed53ab5982..943e62be9cf1 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -31,7 +31,7 @@ typedef struct BlkverifyRequest {
     uint64_t bytes;
     int flags;

-    int (*request_fn)(BdrvChild *, int64_t, unsigned int, QEMUIOVector *,
+    int (*request_fn)(BdrvChild *, int64_t, int64_t, QEMUIOVector *,
                       BdrvRequestFlags);

     int ret;                    /* test image result */
diff --git a/block/trace-events b/block/trace-events
index b252457d8e1a..a8d3fe94e66d 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -13,7 +13,7 @@ blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 # io.c
 bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_pwritev_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
-bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "bs %p offset %"PRId64" count %d flags 0x%x"
+bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int64_t bytes, int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
 bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
-- 
2.30.0


