Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F13BF960
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:53:53 +0200 (CEST)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SbI-0004JK-A5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV6-0003uV-MJ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV2-0001RY-5s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625744843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ld+9hp5ik8tNIh+Y7VpxHJHDO168ucmKncl70hoxjX0=;
 b=E05wxROyN7VKFhNzGHJ6qgWaZe/bpxTGJp5jdNV/bMxSfv8/LYZi4R0GqeZRfA8NeggCBE
 WlVrTJH6dBN3WVleB4LzETrsWqI97P1k+hiq+oR+e8sVA6rVgMvG9oLDkPJ+bUAHrZB/JW
 ovw/EcznODDaO36Or2fZyykE7MM6JLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-rj8yGVSRNL-bHuuCfUYLiA-1; Thu, 08 Jul 2021 07:47:20 -0400
X-MC-Unique: rj8yGVSRNL-bHuuCfUYLiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF21919251A0;
 Thu,  8 Jul 2021 11:47:18 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C5E760843;
 Thu,  8 Jul 2021 11:47:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 3/6] block: Acquire AioContexts during
 bdrv_reopen_multiple()
Date: Thu,  8 Jul 2021 13:47:06 +0200
Message-Id: <20210708114709.206487-4-kwolf@redhat.com>
In-Reply-To: <20210708114709.206487-1-kwolf@redhat.com>
References: <20210708114709.206487-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the BlockReopenQueue can contain nodes in multiple AioContexts, only
one of which may be locked when AIO_WAIT_WHILE() can be called, we can't
let the caller lock the right contexts. Instead, individually lock the
AioContext of a single node when iterating the queue.

Reintroduce bdrv_reopen() as a wrapper for reopening a single node that
drains the node and temporarily drops the AioContext lock for
bdrv_reopen_multiple().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 ++
 block.c               | 49 ++++++++++++++++++++++++++++++++++++-------
 block/replication.c   |  7 +++++++
 blockdev.c            |  5 +++++
 qemu-io-cmds.c        |  7 +------
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 6d42992985..3477290f9a 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -388,6 +388,8 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     bool keep_old_opts);
 void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue);
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
+int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
+                Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
diff --git a/block.c b/block.c
index ee9b46e95e..06fb69df5c 100644
--- a/block.c
+++ b/block.c
@@ -4124,19 +4124,26 @@ void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
  *
  * All affected nodes must be drained between bdrv_reopen_queue() and
  * bdrv_reopen_multiple().
+ *
+ * To be called from the main thread, with all other AioContexts unlocked.
  */
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
     int ret = -1;
     BlockReopenQueueEntry *bs_entry, *next;
+    AioContext *ctx;
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
 
+    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bs_queue != NULL);
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
+        ctx = bdrv_get_aio_context(bs_entry->state.bs);
+        aio_context_acquire(ctx);
         ret = bdrv_flush(bs_entry->state.bs);
+        aio_context_release(ctx);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Error flushing drive");
             goto abort;
@@ -4145,7 +4152,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
+        ctx = bdrv_get_aio_context(bs_entry->state.bs);
+        aio_context_acquire(ctx);
         ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
+        aio_context_release(ctx);
         if (ret < 0) {
             goto abort;
         }
@@ -4188,7 +4198,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
      * to first element.
      */
     QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
+        ctx = bdrv_get_aio_context(bs_entry->state.bs);
+        aio_context_acquire(ctx);
         bdrv_reopen_commit(&bs_entry->state);
+        aio_context_release(ctx);
     }
 
     tran_commit(tran);
@@ -4197,7 +4210,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         BlockDriverState *bs = bs_entry->state.bs;
 
         if (bs->drv->bdrv_reopen_commit_post) {
+            ctx = bdrv_get_aio_context(bs);
+            aio_context_acquire(ctx);
             bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
+            aio_context_release(ctx);
         }
     }
 
@@ -4208,7 +4224,10 @@ abort:
     tran_abort(tran);
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
         if (bs_entry->prepared) {
+            ctx = bdrv_get_aio_context(bs_entry->state.bs);
+            aio_context_acquire(ctx);
             bdrv_reopen_abort(&bs_entry->state);
+            aio_context_release(ctx);
         }
     }
 
@@ -4218,23 +4237,39 @@ cleanup:
     return ret;
 }
 
-int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
-                              Error **errp)
+int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
+                Error **errp)
 {
-    int ret;
+    AioContext *ctx = bdrv_get_aio_context(bs);
     BlockReopenQueue *queue;
-    QDict *opts = qdict_new();
-
-    qdict_put_bool(opts, BDRV_OPT_READ_ONLY, read_only);
+    int ret;
 
     bdrv_subtree_drained_begin(bs);
-    queue = bdrv_reopen_queue(NULL, bs, opts, true);
+    if (ctx != qemu_get_aio_context()) {
+        aio_context_release(ctx);
+    }
+
+    queue = bdrv_reopen_queue(NULL, bs, opts, keep_old_opts);
     ret = bdrv_reopen_multiple(queue, errp);
+
+    if (ctx != qemu_get_aio_context()) {
+        aio_context_acquire(ctx);
+    }
     bdrv_subtree_drained_end(bs);
 
     return ret;
 }
 
+int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
+                              Error **errp)
+{
+    QDict *opts = qdict_new();
+
+    qdict_put_bool(opts, BDRV_OPT_READ_ONLY, read_only);
+
+    return bdrv_reopen(bs, opts, true, errp);
+}
+
 /*
  * Take a BDRVReopenState and check if the value of 'backing' in the
  * reopen_state->options QDict is valid or not.
diff --git a/block/replication.c b/block/replication.c
index 52163f2d1f..774e15df16 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -390,7 +390,14 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
     }
 
     if (reopen_queue) {
+        AioContext *ctx = bdrv_get_aio_context(bs);
+        if (ctx != qemu_get_aio_context()) {
+            aio_context_release(ctx);
+        }
         bdrv_reopen_multiple(reopen_queue, errp);
+        if (ctx != qemu_get_aio_context()) {
+            aio_context_acquire(ctx);
+        }
     }
 
     bdrv_subtree_drained_end(s->hidden_disk->bs);
diff --git a/blockdev.c b/blockdev.c
index f08192deda..f657d090d3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3593,8 +3593,13 @@ void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
     ctx = bdrv_get_aio_context(bs);
     aio_context_acquire(ctx);
     bdrv_subtree_drained_begin(bs);
+    aio_context_release(ctx);
+
     queue = bdrv_reopen_queue(NULL, bs, qdict, false);
     bdrv_reopen_multiple(queue, errp);
+
+    ctx = bdrv_get_aio_context(bs);
+    aio_context_acquire(ctx);
     bdrv_subtree_drained_end(bs);
     aio_context_release(ctx);
 
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index e8d862a426..46593d632d 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -2116,8 +2116,6 @@ static int reopen_f(BlockBackend *blk, int argc, char **argv)
     bool writethrough = !blk_enable_write_cache(blk);
     bool has_rw_option = false;
     bool has_cache_option = false;
-
-    BlockReopenQueue *brq;
     Error *local_err = NULL;
 
     while ((c = getopt(argc, argv, "c:o:rw")) != -1) {
@@ -2210,10 +2208,7 @@ static int reopen_f(BlockBackend *blk, int argc, char **argv)
         qdict_put_bool(opts, BDRV_OPT_CACHE_NO_FLUSH, flags & BDRV_O_NO_FLUSH);
     }
 
-    bdrv_subtree_drained_begin(bs);
-    brq = bdrv_reopen_queue(NULL, bs, opts, true);
-    bdrv_reopen_multiple(brq, &local_err);
-    bdrv_subtree_drained_end(bs);
+    bdrv_reopen(bs, opts, true, &local_err);
 
     if (local_err) {
         error_report_err(local_err);
-- 
2.31.1


