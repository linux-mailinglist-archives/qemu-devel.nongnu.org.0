Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311E62C060
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImx-0000lh-SC; Wed, 16 Nov 2022 08:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImr-0000gO-BZ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-000816-El
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4l2gJe+3drWx6sIrzk3hxD4/frbZRdLeHipnc18CfKY=;
 b=FSAcIAmobfVg22H8GOhMLRn67a5M4ZlC02IcRxZJkh1ZCzGxcsxmqxw2b/ve1EiZma2z5w
 svMncSsKidophts/G8MRgKyPvmmvs8QGUc7LzkFF9XV6OyNSzVom3K2IFQ6RLD05GkcUTt
 /JOVcf96FcUlbuCZi7E8KNYAhTa/oJA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-fzRwjVt-NrWR0n-supdGng-1; Wed, 16 Nov 2022 08:48:59 -0500
X-MC-Unique: fzRwjVt-NrWR0n-supdGng-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13FBD2A59579;
 Wed, 16 Nov 2022 13:48:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B71554A9268;
 Wed, 16 Nov 2022 13:48:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 18/20] block-gen: assert that
 bdrv_co_common_block_status_above is always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:48 -0500
Message-Id: <20221116134850.3051419-19-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function, in addition to be called by a generated_co_wrapper,
is also called elsewhere else.
The strategy is to always take the lock at the function called
when the coroutine is created, to avoid recursive locking.

Protecting bdrv_co_block_status() called by
bdrv_co_common_block_status_above() implies that
BlockDriver->bdrv_co_block_status() is always called with
graph rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/backup.c                   |  3 +++
 block/block-backend.c            |  2 ++
 block/block-copy.c               |  2 ++
 block/io.c                       |  2 ++
 block/mirror.c                   | 14 +++++++++-----
 block/stream.c                   | 32 ++++++++++++++++++--------------
 include/block/block_int-common.h |  2 ++
 qemu-img.c                       |  4 +++-
 8 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 6a9ad97a53..42b16d0136 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -269,7 +269,10 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
                 return -ECANCELED;
             }
 
+            /* rdlock protects the subsequent call to bdrv_is_allocated() */
+            bdrv_graph_co_rdlock();
             ret = block_copy_reset_unallocated(s->bcs, offset, &count);
+            bdrv_graph_co_rdunlock();
             if (ret < 0) {
                 return ret;
             }
diff --git a/block/block-backend.c b/block/block-backend.c
index 211a813523..20b772a476 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1433,6 +1433,7 @@ int coroutine_fn blk_block_status_above(BlockBackend *blk,
                                         BlockDriverState **file)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
     return bdrv_block_status_above(blk_bs(blk), base, offset, bytes, pnum, map,
                                    file);
 }
@@ -1443,6 +1444,7 @@ int coroutine_fn blk_is_allocated_above(BlockBackend *blk,
                                         int64_t bytes, int64_t *pnum)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
     return bdrv_is_allocated_above(blk_bs(blk), base, include_base, offset,
                                    bytes, pnum);
 }
diff --git a/block/block-copy.c b/block/block-copy.c
index dabf461112..e20d2b2f78 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -630,6 +630,7 @@ static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
 
     while (true) {
+        /* protected in backup_run() */
         ret = bdrv_is_allocated(bs, offset, bytes, &count);
         if (ret < 0) {
             return ret;
@@ -892,6 +893,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 
 static void coroutine_fn block_copy_async_co_entry(void *opaque)
 {
+    GRAPH_RDLOCK_GUARD();
     block_copy_common(opaque);
 }
 
diff --git a/block/io.c b/block/io.c
index bc9f47538c..c5b3bb0a6d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2215,6 +2215,7 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     bool has_filtered_child;
 
     assert(pnum);
+    assert_bdrv_graph_readable();
     *pnum = 0;
     total_size = bdrv_getlength(bs);
     if (total_size < 0) {
@@ -2445,6 +2446,7 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     IO_CODE();
 
     assert(!include_base || base); /* Can't include NULL base */
+    assert_bdrv_graph_readable();
 
     if (!depth) {
         depth = &dummy;
diff --git a/block/mirror.c b/block/mirror.c
index f509cc1cb1..02ee7bba08 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -559,9 +559,11 @@ static uint64_t coroutine_fn mirror_iteration(MirrorBlockJob *s)
         MirrorMethod mirror_method = MIRROR_METHOD_COPY;
 
         assert(!(offset % s->granularity));
-        ret = bdrv_block_status_above(source, NULL, offset,
-                                      nb_chunks * s->granularity,
-                                      &io_bytes, NULL, NULL);
+        WITH_GRAPH_RDLOCK_GUARD() {
+            ret = bdrv_block_status_above(source, NULL, offset,
+                                        nb_chunks * s->granularity,
+                                        &io_bytes, NULL, NULL);
+        }
         if (ret < 0) {
             io_bytes = MIN(nb_chunks * s->granularity, max_io_bytes);
         } else if (ret & BDRV_BLOCK_DATA) {
@@ -864,8 +866,10 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
             return 0;
         }
 
-        ret = bdrv_is_allocated_above(bs, s->base_overlay, true, offset, bytes,
-                                      &count);
+        WITH_GRAPH_RDLOCK_GUARD() {
+            ret = bdrv_is_allocated_above(bs, s->base_overlay, true, offset,
+                                          bytes, &count);
+        }
         if (ret < 0) {
             return ret;
         }
diff --git a/block/stream.c b/block/stream.c
index 8744ad103f..22368ce186 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -161,21 +161,25 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 
         copy = false;
 
-        ret = bdrv_is_allocated(unfiltered_bs, offset, STREAM_CHUNK, &n);
-        if (ret == 1) {
-            /* Allocated in the top, no need to copy.  */
-        } else if (ret >= 0) {
-            /* Copy if allocated in the intermediate images.  Limit to the
-             * known-unallocated area [offset, offset+n*BDRV_SECTOR_SIZE).  */
-            ret = bdrv_is_allocated_above(bdrv_cow_bs(unfiltered_bs),
-                                          s->base_overlay, true,
-                                          offset, n, &n);
-            /* Finish early if end of backing file has been reached */
-            if (ret == 0 && n == 0) {
-                n = len - offset;
+        WITH_GRAPH_RDLOCK_GUARD() {
+            ret = bdrv_is_allocated(unfiltered_bs, offset, STREAM_CHUNK, &n);
+            if (ret == 1) {
+                /* Allocated in the top, no need to copy.  */
+            } else if (ret >= 0) {
+                /*
+                 * Copy if allocated in the intermediate images.  Limit to the
+                 * known-unallocated area [offset, offset+n*BDRV_SECTOR_SIZE).
+                 */
+                ret = bdrv_is_allocated_above(bdrv_cow_bs(unfiltered_bs),
+                                            s->base_overlay, true,
+                                            offset, n, &n);
+                /* Finish early if end of backing file has been reached */
+                if (ret == 0 && n == 0) {
+                    n = len - offset;
+                }
+
+                copy = (ret > 0);
             }
-
-            copy = (ret > 0);
         }
         trace_stream_one_iteration(s, offset, n, ret);
         if (copy) {
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 7c34a8e40f..9d9cd59f1e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -623,6 +623,8 @@ struct BlockDriver {
      * block/io.c's bdrv_co_block_status() will utilize an unclamped
      * *pnum value for the block-status cache on protocol nodes, prior
      * to clamping *pnum for return to its caller.
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_block_status)(BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
diff --git a/qemu-img.c b/qemu-img.c
index 4282a34bc0..33703a6d92 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1977,7 +1977,9 @@ static void coroutine_fn convert_co_do_copy(void *opaque)
             qemu_co_mutex_unlock(&s->lock);
             break;
         }
-        n = convert_iteration_sectors(s, s->sector_num);
+        WITH_GRAPH_RDLOCK_GUARD() {
+            n = convert_iteration_sectors(s, s->sector_num);
+        }
         if (n < 0) {
             qemu_co_mutex_unlock(&s->lock);
             s->ret = n;
-- 
2.31.1


