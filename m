Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EAA4A6BD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 18:25:05 +0200 (CEST)
Received: from localhost ([::1]:59542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdGuu-0003gi-E7
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 12:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34215)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdGFf-0007QI-M5
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdGFY-0005vE-Ti
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:24 -0400
Received: from relay.sw.ru ([185.231.240.75]:38517)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdGFT-0005Vb-Bx; Tue, 18 Jun 2019 11:42:17 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdGFH-0002Sc-OG; Tue, 18 Jun 2019 18:42:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 18:42:01 +0300
Message-Id: <20190618154202.89107-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190618154202.89107-1-vsementsov@virtuozzo.com>
References: <20190618154202.89107-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 2/3] block/stream: use BDRV_REQ_PREFETCH
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps to avoid extra io, allocations and memory copying.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 1a906fd860..b316bfb290 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -22,11 +22,11 @@
 
 enum {
     /*
-     * Size of data buffer for populating the image file.  This should be large
+     * Maximum chunk size to feed it to copy-on-read.  This should be large
      * enough to process multiple clusters in a single call, so that populating
      * contiguous regions of the image is efficient.
      */
-    STREAM_BUFFER_SIZE = 512 * 1024, /* in bytes */
+    STREAM_CHUNK = 512 * 1024, /* in bytes */
 };
 
 typedef struct StreamBlockJob {
@@ -39,13 +39,12 @@ typedef struct StreamBlockJob {
 } StreamBlockJob;
 
 static int coroutine_fn stream_populate(BlockBackend *blk,
-                                        int64_t offset, uint64_t bytes,
-                                        void *buf)
+                                        int64_t offset, uint64_t bytes)
 {
     assert(bytes < SIZE_MAX);
 
-    /* Copy-on-read the unallocated clusters */
-    return blk_co_pread(blk, offset, bytes, buf, BDRV_REQ_COPY_ON_READ);
+    return blk_co_preadv(blk, offset, bytes, NULL,
+                         BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);
 }
 
 static void stream_abort(Job *job)
@@ -117,7 +116,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     int error = 0;
     int ret = 0;
     int64_t n = 0; /* bytes */
-    void *buf;
 
     if (!bs->backing) {
         goto out;
@@ -130,8 +128,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    buf = qemu_blockalign(bs, STREAM_BUFFER_SIZE);
-
     /* Turn on copy-on-read for the whole block device so that guest read
      * requests help us make progress.  Only do this when copying the entire
      * backing chain since the copy-on-read operation does not take base into
@@ -154,7 +150,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 
         copy = false;
 
-        ret = bdrv_is_allocated(bs, offset, STREAM_BUFFER_SIZE, &n);
+        ret = bdrv_is_allocated(bs, offset, STREAM_CHUNK, &n);
         if (ret == 1) {
             /* Allocated in the top, no need to copy.  */
         } else if (ret >= 0) {
@@ -172,7 +168,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
         trace_stream_one_iteration(s, offset, n, ret);
         if (copy) {
-            ret = stream_populate(blk, offset, n, buf);
+            ret = stream_populate(blk, offset, n);
         }
         if (ret < 0) {
             BlockErrorAction action =
@@ -206,8 +202,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     /* Do not remove the backing file if an error was there but ignored.  */
     ret = error;
 
-    qemu_vfree(buf);
-
 out:
     /* Modify backing chain and close BDSes in main loop */
     return ret;
-- 
2.18.0


