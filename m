Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5113E46DA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:43:24 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Yp-0005mb-L3
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mD5XN-0003mj-3J
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:41:53 -0400
Received: from kerio.kamp.de ([195.62.97.192]:44438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mD5XL-0005f4-33
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 09:41:52 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 9 Aug 2021 15:41:42 +0200
Received: (qmail 48752 invoked from network); 9 Aug 2021 13:41:41 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 9 Aug 2021 13:41:41 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id DC4DC13D87D; Mon,  9 Aug 2021 15:41:41 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH] block/rbd: implement bdrv_co_block_status
Date: Mon,  9 Aug 2021 15:41:36 +0200
Message-Id: <20210809134136.23140-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index dcf82b15b8..ef1eaa6af3 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -88,6 +88,7 @@ typedef struct BDRVRBDState {
     char *namespace;
     uint64_t image_size;
     uint64_t object_size;
+    uint64_t features;
 } BDRVRBDState;
 
 typedef struct RBDTask {
@@ -983,6 +984,14 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->image_size = info.size;
     s->object_size = info.obj_size;
 
+    r = rbd_get_features(s->image, &s->features);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "error getting image features from %s",
+                         s->image_name);
+        rbd_close(s->image);
+        goto failed_open;
+    }
+
     /* If we are using an rbd snapshot, we must be r/o, otherwise
      * leave as-is */
     if (s->snap != NULL) {
@@ -1259,6 +1268,115 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
     return spec_info;
 }
 
+typedef struct rbd_diff_req {
+    uint64_t offs;
+    uint64_t bytes;
+    int exists;
+} rbd_diff_req;
+
+static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
+                                       int exists, void *opaque)
+{
+    struct rbd_diff_req *req = opaque;
+
+    assert(req->offs + req->bytes <= offs);
+    assert(offs >= req->offs + req->bytes);
+
+    if (req->exists && offs > req->offs + req->bytes) {
+        /*
+         * we started in an allocated area and jumped over an unallocated area,
+         * req->bytes contains the length of the allocated area before the
+         * unallocated area. stop further processing.
+         */
+        return -9000;
+    }
+    if (req->exists && !exists) {
+        /*
+         * we started in an allocated area and reached a hole. req->bytes
+         * contains the length of the allocated area before the hole.
+         * stop further processing.
+         */
+        return -9000;
+    }
+    if (!req->exists && exists && offs > req->offs) {
+        /*
+         * we started in an unallocated area and hit the first allocated
+         * block. req->bytes must be set to the length of the unallocated area
+         * before the allocated area. stop further processing.
+         */
+        req->bytes = offs - req->offs;
+        return -9000;
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
+    *pnum = bytes;
+
+    /* RBD image does not support fast-diff */
+    if (!(s->features & RBD_FEATURE_FAST_DIFF)) {
+        goto out;
+    }
+
+    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
+                          qemu_rbd_co_block_status_cb, &req);
+    if (r < 0 && r != -9000) {
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
+    if (ret > 0 && ret & BDRV_BLOCK_OFFSET_VALID && file) {
+        *file = bs;
+    }
+    return ret;
+}
+
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1494,6 +1612,7 @@ static BlockDriver bdrv_rbd = {
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
     .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
 #endif
+    .bdrv_co_block_status   = qemu_rbd_co_block_status,
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



