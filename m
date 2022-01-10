Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE2A489821
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:56:54 +0100 (CET)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6tIE-0001Xe-1j
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n6tFI-0007yx-O9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:53:55 -0500
Received: from kerio.kamp.de ([195.62.97.192]:51470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n6tFG-0001g1-Q2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:53:52 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:42:00 +0100
Received: (qmail 63032 invoked from network); 10 Jan 2022 11:42:00 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 10 Jan 2022 11:42:00 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 6715A13D99C; Mon, 10 Jan 2022 12:42:00 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/rbd: fix handling of holes in .bdrv_co_block_status
Date: Mon, 10 Jan 2022 12:41:53 +0100
Message-Id: <20220110114154.3774072-2-pl@kamp.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110114154.3774072-1-pl@kamp.de>
References: <20220110114154.3774072-1-pl@kamp.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 qemu-stable@nongnu.org, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the assumption that we can't hit a hole if we do not diff against a snapshot was wrong.

We can see a hole in an image if we diff against base if there exists an older snapshot
of the image and we have discarded blocks in the image where the snapshot has data.

Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 55 +++++++++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index def96292e0..5e9dc91d81 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1279,13 +1279,24 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
     RBDDiffIterateReq *req = opaque;
 
     assert(req->offs + req->bytes <= offs);
-    /*
-     * we do not diff against a snapshot so we should never receive a callback
-     * for a hole.
-     */
-    assert(exists);
 
-    if (!req->exists && offs > req->offs) {
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
         /*
          * we started in an unallocated area and hit the first allocated
          * block. req->bytes must be set to the length of the unallocated area
@@ -1295,17 +1306,19 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
         return QEMU_RBD_EXIT_DIFF_ITERATE2;
     }
 
-    if (req->exists && offs > req->offs + req->bytes) {
-        /*
-         * we started in an allocated area and jumped over an unallocated area,
-         * req->bytes contains the length of the allocated area before the
-         * unallocated area. stop further processing.
-         */
-        return QEMU_RBD_EXIT_DIFF_ITERATE2;
-    }
+    /*
+     * assert that we caught all cases above and allocation state has not
+     * changed during callbacks.
+     */
+    assert(exists == req->exists || !req->bytes);
+    req->exists = exists;
 
-    req->bytes += len;
-    req->exists = true;
+    /*
+     * assert that we either return an unallocated block or have got callbacks
+     * for all allocated blocks present.
+     */
+    assert(!req->exists || offs == req->offs + req->bytes);
+    req->bytes = offs + len - req->offs;
 
     return 0;
 }
@@ -1354,13 +1367,13 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
     }
     assert(req.bytes <= bytes);
     if (!req.exists) {
-        if (r == 0) {
+        if (r == 0 && !req.bytes) {
             /*
-             * rbd_diff_iterate2 does not invoke callbacks for unallocated
-             * areas. This here catches the case where no callback was
-             * invoked at all (req.bytes == 0).
+             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
+             * except for the case where an overlay has a hole where the parent
+             * or an older snapshot of the image has not. This here catches the
+             * case where no callback was invoked at all.
              */
-            assert(req.bytes == 0);
             req.bytes = bytes;
         }
         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
-- 
2.25.1



