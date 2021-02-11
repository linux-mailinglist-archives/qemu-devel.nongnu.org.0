Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B26031912F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:36:54 +0100 (CET)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFtc-0004s9-Vg
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAFgB-00007p-Bq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:22:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAFg6-0006WE-IH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613064172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fn/jK3u3iNYinDSLvddg0iGOwNNI5hFvrYnbjj3est0=;
 b=YovJKVBSBWMuztlnfsU9rqsBNnYwxeR+CJ7Fa7HEUuGzhWtC2YSGISdI/GtWWRjPsuFr1N
 wv9m+4bGZdUJyEDy/zke97//fb/6Fc+Y2M4WJ9gB5ymcJO2iSD7RaPzMyU2DmJ/XIJ8lTq
 2bBVTksSGNXVeqxbuebf+++44MQeE+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-pYnT2M71NyWKeZE-9rcvCQ-1; Thu, 11 Feb 2021 12:22:50 -0500
X-MC-Unique: pYnT2M71NyWKeZE-9rcvCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75410107ACF6;
 Thu, 11 Feb 2021 17:22:49 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FFF60C64;
 Thu, 11 Feb 2021 17:22:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] file-posix: Cache next hole
Date: Thu, 11 Feb 2021 18:22:42 +0100
Message-Id: <20210211172242.146671-3-mreitz@redhat.com>
In-Reply-To: <20210211172242.146671-1-mreitz@redhat.com>
References: <20210211172242.146671-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have repeatedly received reports that SEEK_HOLE and SEEK_DATA are
slow on certain filesystems and/or under certain circumstances.  That is
why we generally try to avoid it (which is why bdrv_co_block_status()
has the @want_zero parameter, and which is why qcow2 has a metadata
preallocation detection, so we do not fall through to the protocol layer
to discover which blocks are zero, unless that is really necessary
(i.e., for metadata-preallocated images)).

In addition to those measures, we can also try to speed up zero
detection by letting file-posix cache some hole location information,
namely where the next hole after the most recently queried offset is.
This helps especially for images that are (nearly) fully allocated,
which is coincidentally also the case where querying for zero
information cannot gain us much.

Note that this of course only works so long as we have no concurrent
writers to the image, which is the case when the WRITE capability is not
shared.

Alternatively (or perhaps as an improvement in the future), we could let
file-posix keep track of what it knows is zero and what it knows is
non-zero with bitmaps, which would help images that actually have a
significant number of holes (where this implementation here cannot do
much).  But for such images, SEEK_HOLE/DATA are generally faster (they
do not need to seek through the whole file), and the performance lost by
querying the block status does not feel as bad because it is outweighed
by the performance that can be saved by special-cases zeroed areas, so
focussing on images that are (nearly) fully allocated is more important.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 81 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 05079b40ca..2ca0a2e05b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -172,6 +172,11 @@ typedef struct BDRVRawState {
     } stats;
 
     PRManager *pr_mgr;
+
+    bool can_cache_next_zero_offset;
+    bool next_zero_offset_valid;
+    uint64_t next_zero_offset_from;
+    uint64_t next_zero_offset;
 } BDRVRawState;
 
 typedef struct BDRVRawReopenState {
@@ -2049,7 +2054,25 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
                                        uint64_t bytes, QEMUIOVector *qiov,
                                        int flags)
 {
+    BDRVRawState *s = bs->opaque;
+
     assert(flags == 0);
+
+    /*
+     * If offset is just above s->next_zero_offset, the hole that was
+     * reportedly there might be removed from the file (because only
+     * whole filesystem clusters can be zeroed).  But that does not
+     * matter, because block-status does not care about whether there
+     * actually is a hole, but just about whether there are zeroes
+     * there - and this write will not make those zeroes non-zero.
+     */
+    if (s->next_zero_offset_valid &&
+        offset <= s->next_zero_offset &&
+        offset + bytes > s->next_zero_offset)
+    {
+        s->next_zero_offset_valid = false;
+    }
+
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
 }
 
@@ -2183,6 +2206,10 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
     struct stat st;
     int ret;
 
+    if (s->next_zero_offset_valid && offset < s->next_zero_offset) {
+        s->next_zero_offset_valid = false;
+    }
+
     if (fstat(s->fd, &st)) {
         ret = -errno;
         error_setg_errno(errp, -ret, "Failed to fstat() the file");
@@ -2616,8 +2643,17 @@ static int coroutine_fn raw_co_delete_file(BlockDriverState *bs,
 static int find_allocation(BlockDriverState *bs, off_t start,
                            off_t *data, off_t *hole)
 {
-#if defined SEEK_HOLE && defined SEEK_DATA
     BDRVRawState *s = bs->opaque;
+
+    if (s->next_zero_offset_valid) {
+        if (start >= s->next_zero_offset_from && start < s->next_zero_offset) {
+            *data = start;
+            *hole = s->next_zero_offset;
+            return 0;
+        }
+    }
+
+#if defined SEEK_HOLE && defined SEEK_DATA
     off_t offs;
 
     /*
@@ -2716,6 +2752,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
                                             int64_t *map,
                                             BlockDriverState **file)
 {
+    BDRVRawState *s = bs->opaque;
     off_t data = 0, hole = 0;
     int ret;
 
@@ -2734,6 +2771,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
     }
 
     ret = find_allocation(bs, offset, &data, &hole);
+    s->next_zero_offset_valid = false;
     if (ret == -ENXIO) {
         /* Trailing hole */
         *pnum = bytes;
@@ -2761,6 +2799,12 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
         }
 
         ret = BDRV_BLOCK_DATA;
+
+        if (s->can_cache_next_zero_offset) {
+            s->next_zero_offset_valid = true;
+            s->next_zero_offset_from = offset;
+            s->next_zero_offset = hole;
+        }
     } else {
         /* On a hole, compute bytes to the beginning of the next extent.  */
         assert(hole == offset);
@@ -2910,6 +2954,13 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
     RawPosixAIOData acb;
     int ret;
 
+    if (s->next_zero_offset_valid &&
+        offset <= s->next_zero_offset &&
+        offset + bytes > s->next_zero_offset_from)
+    {
+        s->next_zero_offset_valid = false;
+    }
+
     acb = (RawPosixAIOData) {
         .bs             = bs,
         .aio_fildes     = s->fd,
@@ -2941,6 +2992,17 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
     RawPosixAIOData acb;
     ThreadPoolFunc *handler;
 
+    if (s->next_zero_offset_valid &&
+        offset < s->next_zero_offset &&
+        offset + bytes > s->next_zero_offset_from)
+    {
+        if (offset > s->next_zero_offset_from) {
+            s->next_zero_offset = offset;
+        } else {
+            s->next_zero_offset_valid = false;
+        }
+    }
+
 #ifdef CONFIG_FALLOCATE
     if (offset + bytes > bs->total_sectors * BDRV_SECTOR_SIZE) {
         BdrvTrackedRequest *req;
@@ -3155,6 +3217,15 @@ static void raw_set_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared)
     raw_handle_perm_lock(bs, RAW_PL_COMMIT, perm, shared, NULL);
     s->perm = perm;
     s->shared_perm = shared;
+
+    /*
+     * We can only cache anything if there are no external writers on
+     * the image.
+     */
+    s->can_cache_next_zero_offset = !(shared & BLK_PERM_WRITE);
+    if (!s->can_cache_next_zero_offset) {
+        s->next_zero_offset_valid = false;
+    }
 }
 
 static void raw_abort_perm_update(BlockDriverState *bs)
@@ -3203,6 +3274,14 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
         return -EIO;
     }
 
+    /* Same as in raw_co_pwritev() */
+    if (s->next_zero_offset_valid &&
+        dst_offset <= s->next_zero_offset &&
+        dst_offset + bytes > s->next_zero_offset_from)
+    {
+        s->next_zero_offset_valid = false;
+    }
+
     acb = (RawPosixAIOData) {
         .bs             = bs,
         .aio_type       = QEMU_AIO_COPY_RANGE,
-- 
2.29.2


