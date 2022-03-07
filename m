Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BEE4CFD32
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:41:50 +0100 (CET)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBkL-0005N7-MY
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:41:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjW-0005NB-7O
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjS-0008LJ-79
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R4ojwN55JUbVSUHbXAlMy94ZelSYyRy2w27t5I+2FA=;
 b=hIt6mmAvLLluPsqMKcykmAvgxIzmOxzXJcvtTeYVWjBK32gsSpZPmPgTtzYpV7V61AYGVA
 BVD0RjNn70aDWf2SvjVQSGCVTyb/qN0et3byp6lEANXD+wdndOgmPD3n0Bf4raDUOKLtjf
 OGQO8T3JzBPxlJUhfup8EGD8iA0mqJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-WhW4c0RsMOy6z-8tQxBemA-1; Mon, 07 Mar 2022 05:36:45 -0500
X-MC-Unique: WhW4c0RsMOy6z-8tQxBemA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FBF835DE5;
 Mon,  7 Mar 2022 10:36:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 964527A5C5;
 Mon,  7 Mar 2022 10:36:43 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/23] block: copy-before-write: realize snapshot-access API
Date: Mon,  7 Mar 2022 11:35:45 +0100
Message-Id: <20220307103549.808809-20-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Current scheme of image fleecing looks like this:

[guest]                    [NBD export]
  |                              |
  |root                          | root
  v                              v
[copy-before-write] -----> [temp.qcow2]
  |                 target  |
  |file                     |backing
  v                         |
[active disk] <-------------+

 - On guest writes copy-before-write filter copies old data from active
   disk to temp.qcow2. So fleecing client (NBD export) when reads
   changed regions from temp.qcow2 image and unchanged from active disk
   through backing link.

This patch makes possible new image fleecing scheme:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

 - copy-before-write does CBW operations and also provides
   snapshot-access API. The API may be accessed through
   snapshot-access driver.

Benefits of new scheme:

1. Access control: if remote client try to read data that not covered
   by original dirty bitmap used on copy-before-write open, client gets
   -EACCES.

2. Discard support: if remote client do DISCARD, this additionally to
   discarding data in temp.img informs block-copy process to not copy
   these clusters. Next read from discarded area will return -EACCES.
   This is significant thing: when fleecing user reads data that was
   not yet copied to temp.img, we can avoid copying it on further guest
   write.

3. Synchronisation between client reads and block-copy write is more
   efficient. In old scheme we just rely on BDRV_REQ_SERIALISING flag
   used for writes to temp.qcow2. New scheme is less blocking:
     - fleecing reads are never blocked: if data region is untouched or
       in-flight, we just read from active-disk, otherwise we read from
       temp.img
     - writes to temp.img are not blocked by fleecing reads
     - still, guest writes of-course are blocked by in-flight fleecing
       reads, that currently read from active-disk - it's the minimum
       necessary blocking

4. Temporary image may be of any format, as we don't rely on backing
   feature.

5. Permission relation are simplified. With old scheme we have to share
   write permission on target child of copy-before-write, otherwise
   backing link conflicts with copy-before-write file child write
   permissions. With new scheme we don't have backing link, and
   copy-before-write node may have unshared access to temporary node.
   (Not realized in this commit, will be in future).

6. Having control on fleecing reads we'll be able to implement
   alternative behavior on failed copy-before-write operations.
   Currently we just break guest request (that's a historical behavior
   of backup). But in some scenarios it's a bad behavior: better
   is to drop the backup as failed but don't break guest request.
   With new scheme we can simply unset some bits in a bitmap on CBW
   failure and further fleecing reads will -EACCES, or something like
   this. (Not implemented in this commit, will be in future)
   Additional application for this is implementing timeout for CBW
   operations.

Iotest 257 output is updated, as two more bitmaps now live in
copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303194349.2304213-13-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.c  | 212 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/257.out | 224 +++++++++++++++++++++++++++++++++++++
 2 files changed, 435 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c83c9c7c46..a8a06fdc09 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -33,12 +33,37 @@
 #include "block/block-copy.h"
 
 #include "block/copy-before-write.h"
+#include "block/reqlist.h"
 
 #include "qapi/qapi-visit-block-core.h"
 
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+
+    /*
+     * @lock: protects access to @access_bitmap, @done_bitmap and
+     * @frozen_read_reqs
+     */
+    CoMutex lock;
+
+    /*
+     * @access_bitmap: represents areas allowed for reading by fleecing user.
+     * Reading from non-dirty areas leads to -EACCES.
+     */
+    BdrvDirtyBitmap *access_bitmap;
+
+    /*
+     * @done_bitmap: represents areas that was successfully copied to @target by
+     * copy-before-write operations.
+     */
+    BdrvDirtyBitmap *done_bitmap;
+
+    /*
+     * @frozen_read_reqs: current read requests for fleecing user in bs->file
+     * node. These areas must not be rewritten by guest.
+     */
+    BlockReqList frozen_read_reqs;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -48,10 +73,20 @@ static coroutine_fn int cbw_co_preadv(
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
+/*
+ * Do copy-before-write operation.
+ *
+ * On failure guest request must be failed too.
+ *
+ * On success, we also wait for all in-flight fleecing read requests in source
+ * node, and it's guaranteed that after cbw_do_copy_before_write() successful
+ * return there are no such requests and they will never appear.
+ */
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    int ret;
     uint64_t off, end;
     int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
@@ -62,7 +97,17 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true);
+    if (ret < 0) {
+        return ret;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
+    }
+
+    return 0;
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
@@ -110,6 +155,142 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->file->bs);
 }
 
+/*
+ * If @offset not accessible - return NULL.
+ *
+ * Otherwise, set @pnum to some bytes that accessible from @file (@file is set
+ * to bs->file or to s->target). Return newly allocated BlockReq object that
+ * should be than passed to cbw_snapshot_read_unlock().
+ *
+ * It's guaranteed that guest writes will not interact in the region until
+ * cbw_snapshot_read_unlock() called.
+ */
+static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
+                                        int64_t offset, int64_t bytes,
+                                        int64_t *pnum, BdrvChild **file)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    BlockReq *req = g_new(BlockReq, 1);
+    bool done;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
+        g_free(req);
+        return NULL;
+    }
+
+    done = bdrv_dirty_bitmap_status(s->done_bitmap, offset, bytes, pnum);
+    if (done) {
+        /*
+         * Special invalid BlockReq, that is handled in
+         * cbw_snapshot_read_unlock(). We don't need to lock something to read
+         * from s->target.
+         */
+        *req = (BlockReq) {.offset = -1, .bytes = -1};
+        *file = s->target;
+    } else {
+        reqlist_init_req(&s->frozen_read_reqs, req, offset, bytes);
+        *file = bs->file;
+    }
+
+    return req;
+}
+
+static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    if (req->offset == -1 && req->bytes == -1) {
+        g_free(req);
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    reqlist_remove_req(req);
+    g_free(req);
+}
+
+static coroutine_fn int
+cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BlockReq *req;
+    BdrvChild *file;
+    int ret;
+
+    /* TODO: upgrade to async loop using AioTask */
+    while (bytes) {
+        int64_t cur_bytes;
+
+        req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &file);
+        if (!req) {
+            return -EACCES;
+        }
+
+        ret = bdrv_co_preadv_part(file, offset, cur_bytes,
+                                  qiov, qiov_offset, 0);
+        cbw_snapshot_read_unlock(bs, req);
+        if (ret < 0) {
+            return ret;
+        }
+
+        bytes -= cur_bytes;
+        offset += cur_bytes;
+        qiov_offset += cur_bytes;
+    }
+
+    return 0;
+}
+
+static int coroutine_fn
+cbw_co_snapshot_block_status(BlockDriverState *bs,
+                             bool want_zero, int64_t offset, int64_t bytes,
+                             int64_t *pnum, int64_t *map,
+                             BlockDriverState **file)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    BlockReq *req;
+    int ret;
+    int64_t cur_bytes;
+    BdrvChild *child;
+
+    req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &child);
+    if (!req) {
+        return -EACCES;
+    }
+
+    ret = bdrv_block_status(child->bs, offset, cur_bytes, pnum, map, file);
+    if (child == s->target) {
+        /*
+         * We refer to s->target only for areas that we've written to it.
+         * And we can not report unallocated blocks in s->target: this will
+         * break generic block-status-above logic, that will go to
+         * copy-before-write filtered child in this case.
+         */
+        assert(ret & BDRV_BLOCK_ALLOCATED);
+    }
+
+    cbw_snapshot_read_unlock(bs, req);
+
+    return ret;
+}
+
+static int coroutine_fn cbw_co_pdiscard_snapshot(BlockDriverState *bs,
+                                                 int64_t offset, int64_t bytes)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_reset_dirty_bitmap(s->access_bitmap, offset, bytes);
+    }
+
+    block_copy_reset(s->bcs, offset, bytes);
+
+    return bdrv_co_pdiscard(s->target, offset, bytes);
+}
+
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
@@ -194,6 +375,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
+    int64_t cluster_size;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -225,6 +407,27 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    cluster_size = block_copy_cluster_size(s->bcs);
+
+    s->done_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
+    if (!s->done_bitmap) {
+        return -EINVAL;
+    }
+    bdrv_disable_dirty_bitmap(s->done_bitmap);
+
+    /* s->access_bitmap starts equal to bcs bitmap */
+    s->access_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
+    if (!s->access_bitmap) {
+        return -EINVAL;
+    }
+    bdrv_disable_dirty_bitmap(s->access_bitmap);
+    bdrv_dirty_bitmap_merge_internal(s->access_bitmap,
+                                     block_copy_dirty_bitmap(s->bcs), NULL,
+                                     true);
+
+    qemu_co_mutex_init(&s->lock);
+    QLIST_INIT(&s->frozen_read_reqs);
+
     return 0;
 }
 
@@ -232,6 +435,9 @@ static void cbw_close(BlockDriverState *bs)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
+    bdrv_release_dirty_bitmap(s->access_bitmap);
+    bdrv_release_dirty_bitmap(s->done_bitmap);
+
     block_copy_state_free(s->bcs);
     s->bcs = NULL;
 }
@@ -249,6 +455,10 @@ BlockDriver bdrv_cbw_filter = {
     .bdrv_co_pdiscard           = cbw_co_pdiscard,
     .bdrv_co_flush              = cbw_co_flush,
 
+    .bdrv_co_preadv_snapshot       = cbw_co_preadv_snapshot,
+    .bdrv_co_pdiscard_snapshot     = cbw_co_pdiscard_snapshot,
+    .bdrv_co_snapshot_block_status = cbw_co_snapshot_block_status,
+
     .bdrv_refresh_filename      = cbw_refresh_filename,
 
     .bdrv_child_perm            = cbw_child_perm,
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index 50cbd8e882..aa76131ca9 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -106,6 +106,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -566,6 +582,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -819,6 +851,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1279,6 +1327,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1532,6 +1596,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1992,6 +2072,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2245,6 +2341,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2705,6 +2817,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2958,6 +3086,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -3418,6 +3562,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -3671,6 +3831,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4131,6 +4307,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4384,6 +4576,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4844,6 +5052,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
-- 
2.34.1


