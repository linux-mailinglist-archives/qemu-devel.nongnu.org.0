Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B834D3B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 18:27:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYCHz-0001o7-QK
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 12:27:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6F-00016S-TA
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6B-0005gj-7u
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:41686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC6A-0005C6-N3; Tue, 04 Jun 2019 12:15:42 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC5j-0005Pq-UJ; Tue, 04 Jun 2019 19:15:15 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue,  4 Jun 2019 19:15:08 +0300
Message-Id: <20190604161514.262241-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190604161514.262241-1-vsementsov@virtuozzo.com>
References: <20190604161514.262241-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 06/12] block/io: bdrv_co_do_copy_on_readv:
 lazy allocation
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

Allocate bounce_buffer only if it is really needed. Also, sub-optimize
allocation size (why not?).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/block/io.c b/block/io.c
index efd2b80293..a4f67aca47 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1171,7 +1171,7 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
      * modifying the image file.  This is critical for zero-copy guest I/O
      * where anything might happen inside guest memory.
      */
-    void *bounce_buffer;
+    void *bounce_buffer = NULL;
 
     BlockDriver *drv = bs->drv;
     int64_t cluster_offset;
@@ -1206,14 +1206,6 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     trace_bdrv_co_do_copy_on_readv(bs, offset, bytes,
                                    cluster_offset, cluster_bytes);
 
-    bounce_buffer = qemu_try_blockalign(bs,
-                                        MIN(MIN(max_transfer, cluster_bytes),
-                                            MAX_BOUNCE_BUFFER));
-    if (bounce_buffer == NULL) {
-        ret = -ENOMEM;
-        goto err;
-    }
-
     while (cluster_bytes) {
         int64_t pnum;
 
@@ -1240,6 +1232,17 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
 
             /* Must copy-on-read; use the bounce buffer */
             pnum = MIN(pnum, MAX_BOUNCE_BUFFER);
+            if (!bounce_buffer) {
+                int64_t max_we_need = MAX(pnum, cluster_bytes - pnum);
+                int64_t max_allowed = MIN(max_transfer, MAX_BOUNCE_BUFFER);
+                int64_t bounce_buffer_len = MIN(max_we_need, max_allowed);
+
+                bounce_buffer = qemu_try_blockalign(bs, bounce_buffer_len);
+                if (!bounce_buffer) {
+                    ret = -ENOMEM;
+                    goto err;
+                }
+            }
             qemu_iovec_init_buf(&local_qiov, bounce_buffer, pnum);
 
             ret = bdrv_driver_preadv(bs, cluster_offset, pnum,
-- 
2.18.0


