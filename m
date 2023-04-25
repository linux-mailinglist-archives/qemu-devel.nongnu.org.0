Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A86EE6E7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:36:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMWx-0007Fk-WC; Tue, 25 Apr 2023 13:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWa-0006iz-Qh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWY-0004Fu-Dc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noTcADSZSef9xMC3ZknSl0gJXihCSp61gzY1JXKuEMc=;
 b=Erp0ex+hrSK1lfv8RCvsQwCZGF+Xj/MhaM/+jurjdBiPzOBTJaEMLL7oCNWp8ydFCZUPZn
 AIULjzkpIIwCXToSKAXry61fneFexpFj5NCnGGLL2ygX424PuEVZLfZY1SOdQPzIEfmGIJ
 J6tsX9roFZxTkLk60et13Iw4hQr4sok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-GlL0jxg-NsCejUr0DwMxIA-1; Tue, 25 Apr 2023 13:32:14 -0400
X-MC-Unique: GlL0jxg-NsCejUr0DwMxIA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DE9C185A791;
 Tue, 25 Apr 2023 17:32:14 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31023492B03;
 Tue, 25 Apr 2023 17:32:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 08/20] block: .bdrv_open is non-coroutine and unlocked
Date: Tue, 25 Apr 2023 19:31:46 +0200
Message-Id: <20230425173158.574203-9-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Drivers were a bit confused about whether .bdrv_open can run in a
coroutine and whether or not it holds a graph lock.

It cannot keep a graph lock from the caller across the whole function
because it both changes the graph (requires a writer lock) and does I/O
(requires a reader lock). Therefore, it should take these locks
internally as needed.

The functions used to be called in coroutine context during image
creation. This was buggy for other reasons, and as of commit 32192301,
all block drivers go through no_co_wrappers. So it is not called in
coroutine context any more.

Fix qcow2 and qed to work with the correct assumptions: The graph lock
needs to be taken internally instead of just assuming it's already
there, and the coroutine path is dead code that can be removed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  8 ++++----
 block.c                          |  6 +++---
 block/qcow2.c                    | 15 ++++++---------
 block/qed.c                      | 18 ++++++++----------
 4 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 013d419444..6fb28cd8fa 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -236,12 +236,12 @@ struct BlockDriver {
     void (*bdrv_reopen_abort)(BDRVReopenState *reopen_state);
     void (*bdrv_join_options)(QDict *options, QDict *old_options);
 
-    int (*bdrv_open)(BlockDriverState *bs, QDict *options, int flags,
-                     Error **errp);
+    int GRAPH_UNLOCKED_PTR (*bdrv_open)(
+        BlockDriverState *bs, QDict *options, int flags, Error **errp);
 
     /* Protocol drivers should implement this instead of bdrv_open */
-    int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
-                          Error **errp);
+    int GRAPH_UNLOCKED_PTR (*bdrv_file_open)(
+        BlockDriverState *bs, QDict *options, int flags, Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
 
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_create)(
diff --git a/block.c b/block.c
index 20d5ee0959..abec940867 100644
--- a/block.c
+++ b/block.c
@@ -1610,9 +1610,9 @@ out:
  * bdrv_refresh_total_sectors() which polls when called from non-coroutine
  * context.
  */
-static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
-                            const char *node_name, QDict *options,
-                            int open_flags, Error **errp)
+static int no_coroutine_fn GRAPH_UNLOCKED
+bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
+                 QDict *options, int open_flags, Error **errp)
 {
     Error *local_err = NULL;
     int i, ret;
diff --git a/block/qcow2.c b/block/qcow2.c
index 01742b3ebe..5bde3b8401 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1891,7 +1891,7 @@ static void coroutine_fn qcow2_open_entry(void *opaque)
     QCow2OpenCo *qoc = opaque;
     BDRVQcow2State *s = qoc->bs->opaque;
 
-    assume_graph_lock(); /* FIXME */
+    GRAPH_RDLOCK_GUARD();
 
     qemu_co_mutex_lock(&s->lock);
     qoc->ret = qcow2_do_open(qoc->bs, qoc->options, qoc->flags, true,
@@ -1920,14 +1920,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
     /* Initialise locks */
     qemu_co_mutex_init(&s->lock);
 
-    if (qemu_in_coroutine()) {
-        /* From bdrv_co_create.  */
-        qcow2_open_entry(&qoc);
-    } else {
-        assert(qemu_get_current_aio_context() == qemu_get_aio_context());
-        qemu_coroutine_enter(qemu_coroutine_create(qcow2_open_entry, &qoc));
-        BDRV_POLL_WHILE(bs, qoc.ret == -EINPROGRESS);
-    }
+    assert(!qemu_in_coroutine());
+    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    qemu_coroutine_enter(qemu_coroutine_create(qcow2_open_entry, &qoc));
+    BDRV_POLL_WHILE(bs, qoc.ret == -EINPROGRESS);
+
     return qoc.ret;
 }
 
diff --git a/block/qed.c b/block/qed.c
index aff2a2076e..be9ff0fb34 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -557,11 +557,13 @@ typedef struct QEDOpenCo {
     int ret;
 } QEDOpenCo;
 
-static void coroutine_fn GRAPH_RDLOCK bdrv_qed_open_entry(void *opaque)
+static void coroutine_fn bdrv_qed_open_entry(void *opaque)
 {
     QEDOpenCo *qoc = opaque;
     BDRVQEDState *s = qoc->bs->opaque;
 
+    GRAPH_RDLOCK_GUARD();
+
     qemu_co_mutex_lock(&s->table_lock);
     qoc->ret = bdrv_qed_do_open(qoc->bs, qoc->options, qoc->flags, qoc->errp);
     qemu_co_mutex_unlock(&s->table_lock);
@@ -579,21 +581,17 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
     };
     int ret;
 
-    assume_graph_lock(); /* FIXME */
-
     ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
     if (ret < 0) {
         return ret;
     }
 
     bdrv_qed_init_state(bs);
-    if (qemu_in_coroutine()) {
-        bdrv_qed_open_entry(&qoc);
-    } else {
-        assert(qemu_get_current_aio_context() == qemu_get_aio_context());
-        qemu_coroutine_enter(qemu_coroutine_create(bdrv_qed_open_entry, &qoc));
-        BDRV_POLL_WHILE(bs, qoc.ret == -EINPROGRESS);
-    }
+    assert(!qemu_in_coroutine());
+    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    qemu_coroutine_enter(qemu_coroutine_create(bdrv_qed_open_entry, &qoc));
+    BDRV_POLL_WHILE(bs, qoc.ret == -EINPROGRESS);
+
     return qoc.ret;
 }
 
-- 
2.40.0


