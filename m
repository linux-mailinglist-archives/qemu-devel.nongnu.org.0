Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381E4897BF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:43:36 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6t5L-0003zl-Gf
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n6t40-0002tt-Ss
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:42:13 -0500
Received: from kerio.kamp.de ([195.62.97.192]:51196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n6t3z-0008R0-7T
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:42:12 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:42:00 +0100
Received: (qmail 63033 invoked from network); 10 Jan 2022 11:42:00 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 10 Jan 2022 11:42:00 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 6ABD413D99E; Mon, 10 Jan 2022 12:42:00 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
Date: Mon, 10 Jan 2022 12:41:54 +0100
Message-Id: <20220110114154.3774072-3-pl@kamp.de>
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
Work around this bug by rounding down the offset to object boundaries.

Fixes: https://tracker.ceph.com/issues/53784
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index 5e9dc91d81..260cb9f4b4 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1333,6 +1333,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
     int status, r;
     RBDDiffIterateReq req = { .offs = offset };
     uint64_t features, flags;
+    int64_t head;
 
     assert(offset + bytes <= s->image_size);
 
@@ -1360,6 +1361,19 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
         return status;
     }
 
+    /*
+     * librbd had a bug until early 2022 that affected all versions of ceph that
+     * supported fast-diff. This bug results in reporting of incorrect offsets
+     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
+     * Work around this bug by rounding down the offset to object boundaries.
+     *
+     * See: https://tracker.ceph.com/issues/53784
+     */
+    head = offset & (s->object_size - 1);
+    offset -= head;
+    req.offs -= head;
+    bytes += head;
+
     r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
                           qemu_rbd_diff_iterate_cb, &req);
     if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
@@ -1379,7 +1393,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
     }
 
-    *pnum = req.bytes;
+    assert(req.bytes > head);
+    *pnum = req.bytes - head;
     return status;
 }
 
-- 
2.25.1



