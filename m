Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B234D5C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 18:30:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYCKm-0004Gb-8N
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 12:30:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6F-00016R-Su
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6B-0005ge-6u
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:41652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC6A-0005Bw-Mh; Tue, 04 Jun 2019 12:15:42 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC5j-0005Pq-Qk; Tue, 04 Jun 2019 19:15:15 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue,  4 Jun 2019 19:15:07 +0300
Message-Id: <20190604161514.262241-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190604161514.262241-1-vsementsov@virtuozzo.com>
References: <20190604161514.262241-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 05/12] block/io: bdrv_co_do_copy_on_readv:
 use and support qiov_offset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use and support new API in bdrv_co_do_copy_on_readv. Note that in case
of allocated-in-top we need to shrink read size to MIN(..) by hand, as
pre-patch this was actually done implicitly by qemu_iovec_concat (and
we used local_qiov.size).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/block/io.c b/block/io.c
index 7e53a11492..efd2b80293 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1161,7 +1161,8 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
 }
 
 static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
-        int64_t offset, unsigned int bytes, QEMUIOVector *qiov)
+        int64_t offset, unsigned int bytes,
+        QEMUIOVector *qiov, size_t qiov_offset)
 {
     BlockDriverState *bs = child->bs;
 
@@ -1173,7 +1174,6 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     void *bounce_buffer;
 
     BlockDriver *drv = bs->drv;
-    QEMUIOVector local_qiov;
     int64_t cluster_offset;
     int64_t cluster_bytes;
     size_t skip_bytes;
@@ -1236,6 +1236,8 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
         assert(skip_bytes < pnum);
 
         if (ret <= 0) {
+            QEMUIOVector local_qiov;
+
             /* Must copy-on-read; use the bounce buffer */
             pnum = MIN(pnum, MAX_BOUNCE_BUFFER);
             qemu_iovec_init_buf(&local_qiov, bounce_buffer, pnum);
@@ -1272,15 +1274,14 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
                 goto err;
             }
 
-            qemu_iovec_from_buf(qiov, progress, bounce_buffer + skip_bytes,
+            qemu_iovec_from_buf(qiov, qiov_offset + progress,
+                                bounce_buffer + skip_bytes,
                                 pnum - skip_bytes);
         } else {
             /* Read directly into the destination */
-            qemu_iovec_init(&local_qiov, qiov->niov);
-            qemu_iovec_concat(&local_qiov, qiov, progress, pnum - skip_bytes);
-            ret = bdrv_driver_preadv(bs, offset + progress, local_qiov.size,
-                                     &local_qiov, 0, 0);
-            qemu_iovec_destroy(&local_qiov);
+            ret = bdrv_driver_preadv(bs, offset + progress,
+                                     MIN(pnum - skip_bytes, bytes - progress),
+                                     qiov, qiov_offset + progress, 0);
             if (ret < 0) {
                 goto err;
             }
@@ -1353,7 +1354,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         }
 
         if (!ret || pnum != bytes) {
-            ret = bdrv_co_do_copy_on_readv(child, offset, bytes, qiov);
+            ret = bdrv_co_do_copy_on_readv(child, offset, bytes, qiov, 0);
             goto out;
         }
     }
-- 
2.18.0


