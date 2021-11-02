Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A0443261
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:09:12 +0100 (CET)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwLX-00038E-8n
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIY-0007eV-5f
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIN-0004Gd-U0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfwzWg6ueDWabhvksK185iH6eoYrszv774E3cumhje0=;
 b=Wu2S0v4m7uvndRxmbYSQ75y7RsEHhlyjHMTTEtHdGDvK9O3bD1nY7tXMtFhRfrGMqcSVVv
 JT/h37rBBGs8cIfQ4z3+i+LBHMNmQy+ZB/zKUCyiBGwNkBKic1ifuf3rBQ/OPX0sVKZ1MN
 K+61nEpewGU2yl1JddpZ3FIq4i35Y9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-XRQxnHNZODC0UTXo251Aag-1; Tue, 02 Nov 2021 12:05:50 -0400
X-MC-Unique: XRQxnHNZODC0UTXo251Aag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CB7E802B61;
 Tue,  2 Nov 2021 16:05:49 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 273BD5D9D5;
 Tue,  2 Nov 2021 16:05:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/12] block/rbd: implement bdrv_co_block_status
Date: Tue,  2 Nov 2021 17:05:19 +0100
Message-Id: <20211102160528.206766-4-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

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
Message-Id: <20211012152231.24868-1-pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

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
2.31.1


