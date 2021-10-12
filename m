Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E542A834
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:24:37 +0200 (CEST)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJdr-0000Vz-Cn
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1maJc5-0007QJ-4B
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:22:45 -0400
Received: from kerio.kamp.de ([195.62.97.192]:50176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1maJc2-00064E-H5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:22:44 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:22:32 +0200
Received: (qmail 40312 invoked from network); 12 Oct 2021 15:22:32 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 12 Oct 2021 15:22:32 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 16A32141249; Tue, 12 Oct 2021 17:22:32 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V5] block/rbd: implement bdrv_co_block_status
Date: Tue, 12 Oct 2021 17:22:31 +0200
Message-Id: <20211012152231.24868-1-pl@kamp.de>
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
 block/rbd.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

V4->V5:
 - rename rbd_diff_req to RBDDiffIterateReq, use typedef and move
   defintion to top [Ilya]
 - rename callback to qemu_rbd_diff_iterate_cb [Ilya]
 - assert that req.bytes == 0 if !req.exists and r == 0 [Ilya]

V3->V4:
 - make req.exists a bool [Ilya]
 - simplify callback under the assuption that we never receive a cb
   for a hole since we do not diff against a snapshot [Ilya]
 - remove out label [Ilya]
 - rename ret to status [Ilya]

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


diff --git a/block/rbd.c b/block/rbd.c
index 701fbf2b0c..def96292e0 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -97,6 +97,12 @@ typedef struct RBDTask {
     int64_t ret;
 } RBDTask;
 
+typedef struct RBDDiffIterateReq {
+    uint64_t offs;
+    uint64_t bytes;
+    bool exists;
+} RBDDiffIterateReq;
+
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
                             BlockdevOptionsRbd *opts, bool cache,
                             const char *keypairs, const char *secretid,
@@ -1259,6 +1265,111 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
     return spec_info;
 }
 
+/*
+ * rbd_diff_iterate2 allows to interrupt the exection by returning a negative
+ * value in the callback routine. Choose a value that does not conflict with
+ * an existing exitcode and return it if we want to prematurely stop the
+ * execution because we detected a change in the allocation status.
+ */
+#define QEMU_RBD_EXIT_DIFF_ITERATE2 -9000
+
+static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
+                                    int exists, void *opaque)
+{
+    RBDDiffIterateReq *req = opaque;
+
+    assert(req->offs + req->bytes <= offs);
+    /*
+     * we do not diff against a snapshot so we should never receive a callback
+     * for a hole.
+     */
+    assert(exists);
+
+    if (!req->exists && offs > req->offs) {
+        /*
+         * we started in an unallocated area and hit the first allocated
+         * block. req->bytes must be set to the length of the unallocated area
+         * before the allocated area. stop further processing.
+         */
+        req->bytes = offs - req->offs;
+        return QEMU_RBD_EXIT_DIFF_ITERATE2;
+    }
+
+    if (req->exists && offs > req->offs + req->bytes) {
+        /*
+         * we started in an allocated area and jumped over an unallocated area,
+         * req->bytes contains the length of the allocated area before the
+         * unallocated area. stop further processing.
+         */
+        return QEMU_RBD_EXIT_DIFF_ITERATE2;
+    }
+
+    req->bytes += len;
+    req->exists = true;
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
+    int status, r;
+    RBDDiffIterateReq req = { .offs = offset };
+    uint64_t features, flags;
+
+    assert(offset + bytes <= s->image_size);
+
+    /* default to all sectors allocated */
+    status = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
+    *map = offset;
+    *file = bs;
+    *pnum = bytes;
+
+    /* check if RBD image supports fast-diff */
+    r = rbd_get_features(s->image, &features);
+    if (r < 0) {
+        return status;
+    }
+    if (!(features & RBD_FEATURE_FAST_DIFF)) {
+        return status;
+    }
+
+    /* check if RBD fast-diff result is valid */
+    r = rbd_get_flags(s->image, &flags);
+    if (r < 0) {
+        return status;
+    }
+    if (flags & RBD_FLAG_FAST_DIFF_INVALID) {
+        return status;
+    }
+
+    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
+                          qemu_rbd_diff_iterate_cb, &req);
+    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
+        return status;
+    }
+    assert(req.bytes <= bytes);
+    if (!req.exists) {
+        if (r == 0) {
+            /*
+             * rbd_diff_iterate2 does not invoke callbacks for unallocated
+             * areas. This here catches the case where no callback was
+             * invoked at all (req.bytes == 0).
+             */
+            assert(req.bytes == 0);
+            req.bytes = bytes;
+        }
+        status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
+    }
+
+    *pnum = req.bytes;
+    return status;
+}
+
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1494,6 +1605,7 @@ static BlockDriver bdrv_rbd = {
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
     .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
 #endif
+    .bdrv_co_block_status   = qemu_rbd_co_block_status,
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



