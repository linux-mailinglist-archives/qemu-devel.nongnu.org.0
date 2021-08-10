Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D63E5BFF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:42:57 +0200 (CEST)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDS1w-0001pQ-1B
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mDS0g-0008Kd-7u
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:41:38 -0400
Received: from kerio.kamp.de ([195.62.97.192]:42138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mDS0b-000461-Vv
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:41:37 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:41:29 +0200
Received: (qmail 57170 invoked from network); 10 Aug 2021 13:41:29 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 10 Aug 2021 13:41:29 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 917EA13D87D; Tue, 10 Aug 2021 15:41:29 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V2] block/rbd: implement bdrv_co_block_status
Date: Tue, 10 Aug 2021 15:41:24 +0200
Message-Id: <20210810134124.18523-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the qemu rbd driver currently lacks support for bdrv_co_block_status.
This results mainly in incorrect progress during block operations (e.g.
qemu-img convert with an rbd image as source).

This patch utilizes the rbd_diff_iterate2 call from librbd to detect
allocated and unallocated (all zero areas).

To avoid querying the ceph OSDs for the answer this is only done if
the image has the fast-diff features which depends on the object-map
and exclusive-lock. In this case it is guaranteed that the information
is present in memory in the librbd client and thus very fast.

If fast-diff is not available all areas are reported to be allocated
which is the current behaviour if bdrv_co_block_status is not implemented.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
V1->V2:
- add commit comment [Stefano]
- use failed_post_open [Stefano]
- remove redundant assert [Stefano]
- add macro+comment for the magic -9000 value [Stefano]
- always set *file if its non NULL [Stefano]

 block/rbd.c | 125 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index dcf82b15b8..8692e76f40 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -88,6 +88,7 @@ typedef struct BDRVRBDState {
     char *namespace;
     uint64_t image_size;
     uint64_t object_size;
+    uint64_t features;
 } BDRVRBDState;
 
 typedef struct RBDTask {
@@ -983,6 +984,13 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->image_size = info.size;
     s->object_size = info.obj_size;
 
+    r = rbd_get_features(s->image, &s->features);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "error getting image features from %s",
+                         s->image_name);
+        goto failed_post_open;
+    }
+
     /* If we are using an rbd snapshot, we must be r/o, otherwise
      * leave as-is */
     if (s->snap != NULL) {
@@ -1259,6 +1267,122 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
     return spec_info;
 }
 
+typedef struct rbd_diff_req {
+    uint64_t offs;
+    uint64_t bytes;
+    int exists;
+} rbd_diff_req;
+
+/*
+ * rbd_diff_iterate2 allows to interrupt the exection by returning a negative
+ * value in the callback routine. Choose a value that does not conflict with
+ * an existing exitcode and return it if we want to prematurely stop the
+ * execution because we detected a change in the allocation status.
+ */
+#define QEMU_RBD_EXIT_DIFF_ITERATE2 -9000
+
+static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
+                                       int exists, void *opaque)
+{
+    struct rbd_diff_req *req = opaque;
+
+    assert(req->offs + req->bytes <= offs);
+
+    if (req->exists && offs > req->offs + req->bytes) {
+        /*
+         * we started in an allocated area and jumped over an unallocated area,
+         * req->bytes contains the length of the allocated area before the
+         * unallocated area. stop further processing.
+         */
+        return QEMU_RBD_EXIT_DIFF_ITERATE2;
+    }
+    if (req->exists && !exists) {
+        /*
+         * we started in an allocated area and reached a hole. req->bytes
+         * contains the length of the allocated area before the hole.
+         * stop further processing.
+         */
+        return QEMU_RBD_EXIT_DIFF_ITERATE2;
+    }
+    if (!req->exists && exists && offs > req->offs) {
+        /*
+         * we started in an unallocated area and hit the first allocated
+         * block. req->bytes must be set to the length of the unallocated area
+         * before the allocated area. stop further processing.
+         */
+        req->bytes = offs - req->offs;
+        return QEMU_RBD_EXIT_DIFF_ITERATE2;
+    }
+
+    /*
+     * assert that we catched all cases above and allocation state has not
+     * changed during callbacks.
+     */
+    assert(exists == req->exists || !req->bytes);
+    req->exists = exists;
+
+    /*
+     * assert that we either return an unallocated block or have got callbacks
+     * for all allocated blocks present.
+     */
+    assert(!req->exists || offs == req->offs + req->bytes);
+    req->bytes = offs + len - req->offs;
+
+    return 0;
+}
+
+static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
+                                                 bool want_zero, int64_t offset,
+                                                 int64_t bytes, int64_t *pnum,
+                                                 int64_t *map,
+                                                 BlockDriverState **file)
+{
+    BDRVRBDState *s = bs->opaque;
+    int ret, r;
+    struct rbd_diff_req req = { .offs = offset };
+
+    assert(offset + bytes <= s->image_size);
+
+    /* default to all sectors allocated */
+    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
+    if (map) {
+        *map = offset;
+    }
+    if (file) {
+        *file = bs;
+    }
+    *pnum = bytes;
+
+    /* RBD image does not support fast-diff */
+    if (!(s->features & RBD_FEATURE_FAST_DIFF)) {
+        goto out;
+    }
+
+    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
+                          qemu_rbd_co_block_status_cb, &req);
+    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
+        goto out;
+    }
+    assert(req.bytes <= bytes);
+    if (!req.exists) {
+        if (r == 0 && !req.bytes) {
+            /*
+             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
+             * except for the case where an overlay has a hole where the parent
+             * has not. This here catches the case where no callback was
+             * invoked at all.
+             */
+            req.bytes = bytes;
+        }
+        ret &= ~BDRV_BLOCK_DATA;
+        ret |= BDRV_BLOCK_ZERO;
+    }
+    *pnum = req.bytes;
+
+out:
+    return ret;
+}
+
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1494,6 +1618,7 @@ static BlockDriver bdrv_rbd = {
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
     .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
 #endif
+    .bdrv_co_block_status   = qemu_rbd_co_block_status,
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



