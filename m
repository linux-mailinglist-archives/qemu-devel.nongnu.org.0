Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8608621174
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNs8-000850-7D; Tue, 08 Nov 2022 07:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrn-0007ly-BQ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrh-0000yo-FM
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHNdZ8ld+frJDiOMMbtIIugEltCcnk/loS+XMbHu3T4=;
 b=TWp506o2JNvVQHcDaoZA699G7U0FQHOmlCBn0Yz42pvuNQUJlGIHZXx9+s/tEkN5jVqdC6
 q3l8afojGP7X37Zi1/jRRUdC7PFwigB3IPUGYFBFmqHumO18+g8rmVHq4RsyAFpLE+a3K4
 8WWmpu0/0e6MFlrM2c3jbujLwe/I/rU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-GLJw91HhMSu3TKxWazN_6g-1; Tue, 08 Nov 2022 07:38:01 -0500
X-MC-Unique: GLJw91HhMSu3TKxWazN_6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D358833AED;
 Tue,  8 Nov 2022 12:38:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F15B29E70;
 Tue,  8 Nov 2022 12:37:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 06/13] block: Drain invidual nodes during reopen
Date: Tue,  8 Nov 2022 13:37:31 +0100
Message-Id: <20221108123738.530873-7-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_reopen() and friends use subtree drains as a lazy way of covering
all the nodes they touch. Turns out that this lazy way is a lot more
complicated than just draining the nodes individually, even not
accounting for the additional complexity in the drain mechanism itself.

Simplify the code by switching to draining the individual nodes that are
already managed in the BlockReopenQueue anyway.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c             | 11 ++++-------
 block/replication.c |  6 ------
 blockdev.c          | 13 -------------
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index 7a24bd4c36..5828b970e4 100644
--- a/block.c
+++ b/block.c
@@ -4142,7 +4142,7 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
  * returns a pointer to bs_queue, which is either the newly allocated
  * bs_queue, or the existing bs_queue being used.
  *
- * bs must be drained between bdrv_reopen_queue() and bdrv_reopen_multiple().
+ * bs is drained here and undrained by bdrv_reopen_queue_free().
  */
 static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
                                                  BlockDriverState *bs,
@@ -4162,12 +4162,10 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     int flags;
     QemuOpts *opts;
 
-    /* Make sure that the caller remembered to use a drained section. This is
-     * important to avoid graph changes between the recursive queuing here and
-     * bdrv_reopen_multiple(). */
-    assert(bs->quiesce_counter > 0);
     GLOBAL_STATE_CODE();
 
+    bdrv_drained_begin(bs);
+
     if (bs_queue == NULL) {
         bs_queue = g_new0(BlockReopenQueue, 1);
         QTAILQ_INIT(bs_queue);
@@ -4317,6 +4315,7 @@ void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
     if (bs_queue) {
         BlockReopenQueueEntry *bs_entry, *next;
         QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+            bdrv_drained_end(bs_entry->state.bs);
             qobject_unref(bs_entry->state.explicit_options);
             qobject_unref(bs_entry->state.options);
             g_free(bs_entry);
@@ -4464,7 +4463,6 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
 
     GLOBAL_STATE_CODE();
 
-    bdrv_subtree_drained_begin(bs);
     if (ctx != qemu_get_aio_context()) {
         aio_context_release(ctx);
     }
@@ -4475,7 +4473,6 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
     if (ctx != qemu_get_aio_context()) {
         aio_context_acquire(ctx);
     }
-    bdrv_subtree_drained_end(bs);
 
     return ret;
 }
diff --git a/block/replication.c b/block/replication.c
index f1eed25e43..c62f48a874 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -374,9 +374,6 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
         s->orig_secondary_read_only = bdrv_is_read_only(secondary_disk->bs);
     }
 
-    bdrv_subtree_drained_begin(hidden_disk->bs);
-    bdrv_subtree_drained_begin(secondary_disk->bs);
-
     if (s->orig_hidden_read_only) {
         QDict *opts = qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
@@ -401,9 +398,6 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
             aio_context_acquire(ctx);
         }
     }
-
-    bdrv_subtree_drained_end(hidden_disk->bs);
-    bdrv_subtree_drained_end(secondary_disk->bs);
 }
 
 static void backup_job_cleanup(BlockDriverState *bs)
diff --git a/blockdev.c b/blockdev.c
index 3f1dec6242..8ffb3d9537 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3547,8 +3547,6 @@ fail:
 void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 {
     BlockReopenQueue *queue = NULL;
-    GSList *drained = NULL;
-    GSList *p;
 
     /* Add each one of the BDS that we want to reopen to the queue */
     for (; reopen_list != NULL; reopen_list = reopen_list->next) {
@@ -3585,9 +3583,7 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
         ctx = bdrv_get_aio_context(bs);
         aio_context_acquire(ctx);
 
-        bdrv_subtree_drained_begin(bs);
         queue = bdrv_reopen_queue(queue, bs, qdict, false);
-        drained = g_slist_prepend(drained, bs);
 
         aio_context_release(ctx);
     }
@@ -3598,15 +3594,6 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 
 fail:
     bdrv_reopen_queue_free(queue);
-    for (p = drained; p; p = p->next) {
-        BlockDriverState *bs = p->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
-
-        aio_context_acquire(ctx);
-        bdrv_subtree_drained_end(bs);
-        aio_context_release(ctx);
-    }
-    g_slist_free(drained);
 }
 
 void qmp_blockdev_del(const char *node_name, Error **errp)
-- 
2.38.1


