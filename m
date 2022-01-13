Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6448DA26
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:51:46 +0100 (CET)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81S5-0007wG-Vx
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:51:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n81LE-0002z7-Jj
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:44:40 -0500
Received: from kerio.kamp.de ([195.62.97.192]:47234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n81LB-0000u4-T6
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:44:40 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:44:28 +0100
Received: (qmail 29079 invoked from network); 13 Jan 2022 14:44:27 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 13 Jan 2022 14:44:27 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id D93BB13D9A0; Thu, 13 Jan 2022 15:44:27 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V2 for-6.2 2/2] block/rbd: workaround for ceph issue #53784
Date: Thu, 13 Jan 2022 15:44:26 +0100
Message-Id: <20220113144426.4036493-3-pl@kamp.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113144426.4036493-1-pl@kamp.de>
References: <20220113144426.4036493-1-pl@kamp.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

librbd had a bug until early 2022 that affected all versions of ceph that
supported fast-diff. This bug results in reporting of incorrect offsets
if the offset parameter to rbd_diff_iterate2 is not object aligned.

This patch works around this bug for pre Quincy versions of librbd.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 20bb896c4a..d174d51659 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1320,6 +1320,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
     int status, r;
     RBDDiffIterateReq req = { .offs = offset };
     uint64_t features, flags;
+    uint64_t head = 0;
 
     assert(offset + bytes <= s->image_size);
 
@@ -1347,7 +1348,43 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
         return status;
     }
 
-    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
+#if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 17, 0)
+    /*
+     * librbd had a bug until early 2022 that affected all versions of ceph that
+     * supported fast-diff. This bug results in reporting of incorrect offsets
+     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
+     * Work around this bug by rounding down the offset to object boundaries.
+     * This is OK because we call rbd_diff_iterate2 with whole_object = true.
+     * However, this workaround only works for non cloned images with default
+     * striping.
+     *
+     * See: https://tracker.ceph.com/issues/53784
+     */
+
+    /*  check if RBD image has non-default striping enabled */
+    if (features & RBD_FEATURE_STRIPINGV2) {
+        return status;
+    }
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
+    /*
+     * check if RBD image is a clone (= has a parent).
+     *
+     * rbd_get_parent_info is deprecated from Nautilus onwards, but the
+     * replacement rbd_get_parent is not present in Luminous and Mimic.
+     */
+    if (rbd_get_parent_info(s->image, NULL, 0, NULL, 0, NULL, 0) != -ENOENT) {
+        return status;
+    }
+#pragma GCC diagnostic pop
+
+    head = req.offs & (s->object_size - 1);
+    req.offs -= head;
+    bytes += head;
+#endif
+
+    r = rbd_diff_iterate2(s->image, NULL, req.offs, bytes, true, true,
                           qemu_rbd_diff_iterate_cb, &req);
     if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
         return status;
@@ -1366,7 +1403,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
     }
 
-    *pnum = req.bytes;
+    assert(req.bytes > head);
+    *pnum = req.bytes - head;
     return status;
 }
 
-- 
2.25.1



