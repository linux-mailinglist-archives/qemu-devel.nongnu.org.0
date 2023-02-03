Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6430689E3C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxu7-0007b9-IO; Fri, 03 Feb 2023 10:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu3-0007VS-4V
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu1-0005Mk-Ir
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsMoKc1kfwQocMh0gbn0IS4q5JFYNQlfuNfS04Ywu/Q=;
 b=FF9m7rsjX+KcpsfzG1CPWihsnwOHkJR/lbwwFEQ+hH4nsF3O3biShVhTbO73DyLAeXB8Ic
 SlFRUqWNNGpgyU0teCPECXcTbJ4etxTh9BJICXF6sXEKvxuPO0Fz27fPLHRWNN543SxTYk
 tgqhuE1y7kyStX46TYnZ1Wr3z1VcsxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-Gszzo2DhOJSP18aSplFf0w-1; Fri, 03 Feb 2023 10:22:59 -0500
X-MC-Unique: Gszzo2DhOJSP18aSplFf0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10960101A52E;
 Fri,  3 Feb 2023 15:22:59 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15C9040C1073;
 Fri,  3 Feb 2023 15:22:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 17/23] block: Mark bdrv_co_io_(un)plug() and callers
 GRAPH_RDLOCK
Date: Fri,  3 Feb 2023 16:21:56 +0100
Message-Id: <20230203152202.49054-18-kwolf@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_io_plug() and bdrv_co_io_unplug() need to hold a reader lock for
the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 4 ++--
 include/block/block_int-common.h | 5 +++--
 block/block-backend.c            | 2 ++
 block/io.c                       | 2 ++
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index c551742a86..b8f99741a3 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -233,8 +233,8 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx);
 
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
-void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs);
-void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs);
+void coroutine_fn GRAPH_RDLOCK bdrv_co_io_plug(BlockDriverState *bs);
+void coroutine_fn GRAPH_RDLOCK bdrv_co_io_unplug(BlockDriverState *bs);
 
 bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
                                                      const char *name,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6b8fd22c71..61f894bcf6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -735,8 +735,9 @@ struct BlockDriver {
                                              BlkdebugEvent event);
 
     /* io queue for linux-aio */
-    void coroutine_fn (*bdrv_co_io_plug)(BlockDriverState *bs);
-    void coroutine_fn (*bdrv_co_io_unplug)(BlockDriverState *bs);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_plug)(BlockDriverState *bs);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_unplug)(
+        BlockDriverState *bs);
 
     /**
      * bdrv_drain_begin is called if implemented in the beginning of a
diff --git a/block/block-backend.c b/block/block-backend.c
index fdb1e1d5f7..3661a066b3 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2328,6 +2328,7 @@ void coroutine_fn blk_co_io_plug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     if (bs) {
         bdrv_co_io_plug(bs);
@@ -2338,6 +2339,7 @@ void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     if (bs) {
         bdrv_co_io_unplug(bs);
diff --git a/block/io.c b/block/io.c
index af9a0cc964..be350aba98 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3150,6 +3150,7 @@ void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     QLIST_FOREACH(child, &bs->children, next) {
         bdrv_co_io_plug(child->bs);
@@ -3167,6 +3168,7 @@ void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     assert(bs->io_plugged);
     if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
-- 
2.38.1


