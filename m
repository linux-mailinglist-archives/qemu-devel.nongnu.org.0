Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D98E2E31E5
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:47:05 +0100 (CET)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZCC-0005ky-Lu
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZ8D-0001OZ-Gr
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:42:57 -0500
Received: from kerio.kamp.de ([195.62.97.192]:33892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZ89-0003wr-PK
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:42:57 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:42:42 +0100
Received: (qmail 22366 invoked from network); 27 Dec 2020 16:42:44 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 27 Dec 2020 16:42:44 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 64E4E13DD27; Sun, 27 Dec 2020 17:42:44 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 6/7] block/rbd: add write zeroes support
Date: Sun, 27 Dec 2020 17:42:35 +0100
Message-Id: <20201227164236.10143-7-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201227164236.10143-1-pl@kamp.de>
References: <20201227164236.10143-1-pl@kamp.de>
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index 2d77d0007f..27b4404adf 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -63,7 +63,8 @@ typedef enum {
     RBD_AIO_READ,
     RBD_AIO_WRITE,
     RBD_AIO_DISCARD,
-    RBD_AIO_FLUSH
+    RBD_AIO_FLUSH,
+    RBD_AIO_WRITE_ZEROES
 } RBDAIOCmd;
 
 typedef struct BDRVRBDState {
@@ -221,8 +222,12 @@ done:
 
 static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
 {
+    BDRVRBDState *s = bs->opaque;
     /* XXX Does RBD support AIO on less than 512-byte alignment? */
     bs->bl.request_alignment = 512;
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    bs->bl.pwrite_zeroes_alignment = s->object_size;
+#endif
 }
 
 
@@ -695,6 +700,9 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->aio_context = bdrv_get_aio_context(bs);
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
+#endif
 
     /* When extending regular files, we get zeros from the OS */
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
@@ -808,6 +816,11 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
     case RBD_AIO_FLUSH:
         r = rbd_aio_flush(s->image, c);
         break;
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    case RBD_AIO_WRITE_ZEROES:
+        r = rbd_aio_write_zeroes(s->image, offset, bytes, c, 0, 0);
+        break;
+#endif
     default:
         r = -EINVAL;
     }
@@ -880,6 +893,19 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
     return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
 }
 
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+static int
+coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                      int count, BdrvRequestFlags flags)
+{
+    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
+        return -ENOTSUP;
+    }
+    return qemu_rbd_start_co(bs, offset, count, NULL, flags,
+                             RBD_AIO_WRITE_ZEROES);
+}
+#endif
+
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1108,6 +1134,9 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
     .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
     .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
+#endif
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



