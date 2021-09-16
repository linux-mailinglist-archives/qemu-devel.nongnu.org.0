Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7B40D9DB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:24:16 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqR5-0004Zg-Nx
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mQqOV-000310-Jm
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:21:37 -0400
Received: from kerio.kamp.de ([195.62.97.192]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1mQqOS-0001D9-O9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:21:35 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:21:22 +0200
Received: (qmail 40586 invoked from network); 16 Sep 2021 12:21:22 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 16 Sep 2021 12:21:22 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 851DB13D87D; Thu, 16 Sep 2021 14:21:22 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V3] block/rbd: implement bdrv_co_block_status
Date: Thu, 16 Sep 2021 14:21:16 +0200
Message-Id: <20210916122116.802-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
the image has the fast-diff feature which depends on the object-map and
exclusive-lock features. In this case it is guaranteed that the information
is present in memory in the librbd client and thus very fast.

If fast-diff is not available all areas are reported to be allocated
which is the current behaviour if bdrv_co_block_status is not implemented.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
V2->V3:
- check rbd_flags every time (they can change during runtime) [Ilya]
- also check for fast-diff invalid flag [Ilya]
- *map and *file cant be NULL [Ilya]
- set ret = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID in case of an
  unallocated area [Ilya]
- typo: catched -> caught [Ilya]
- changed wording about fast-diff, object-map and exclusive lock in
  commit msg [Ilya]

V1->V2:
- add commit comment [Stefano]
- use failed_post_open [Stefano]
- remove redundant assert [Stefano]
- add macro+comment for the magic -9000 value [Stefano]
- always set *file if its non NULL [Stefano]

 block/rbd.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index dcf82b15b8..3cb24f9981 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1259,6 +1259,131 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
+     * assert that we caught all cases above and allocation state has not
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
+    uint64_t features, flags;
+
+    assert(offset + bytes <= s->image_size);
+
+    /* default to all sectors allocated */
+    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
+    *map = offset;
+    *file = bs;
+    *pnum = bytes;
+
+    /* check if RBD image supports fast-diff */
+    r = rbd_get_features(s->image, &features);
+    if (r < 0) {
+        goto out;
+    }
+    if (!(features & RBD_FEATURE_FAST_DIFF)) {
+        goto out;
+    }
+
+    /* check if RBD fast-diff result is valid */
+    r = rbd_get_flags(s->image, &flags);
+    if (r < 0) {
+        goto out;
+    }
+    if (flags & RBD_FLAG_FAST_DIFF_INVALID) {
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
+        ret = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
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
@@ -1494,6 +1619,7 @@ static BlockDriver bdrv_rbd = {
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
     .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
 #endif
+    .bdrv_co_block_status   = qemu_rbd_co_block_status,
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



