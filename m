Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C061F758
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 16:15:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3oe-0001sH-1f; Mon, 07 Nov 2022 10:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os3oa-0001q8-JB
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os3oX-0006el-72
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667834008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1lRj+r/gTbpNpudSw9i6+i9XWJB5nkuLpeoxy4zt4Y=;
 b=arIETZZJWhYkbsecFCNdIqZ2BVSdCRnLyOB0GfRsP6rGZsGrhUblhOPA0ZJxfF7KYeKZRG
 KJ6MuuwjbF/jWVl6smnw2unqr2pmo5rr9jZ9KX4so7dNq6nUC7daHyaCjUIPA+SPZzUXOe
 3+tW/VVh/z/m80tbzyo8HsOTPUxXTcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-4EgUAimxP-6YO05K4TK-Ug-1; Mon, 07 Nov 2022 10:13:25 -0500
X-MC-Unique: 4EgUAimxP-6YO05K4TK-Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1541C87B2A4;
 Mon,  7 Nov 2022 15:13:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7707C15BB5;
 Mon,  7 Nov 2022 15:13:24 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 1/3] block: Make bdrv_child_get_parent_aio_context I/O
Date: Mon,  7 Nov 2022 16:13:19 +0100
Message-Id: <20221107151321.211175-2-hreitz@redhat.com>
In-Reply-To: <20221107151321.211175-1-hreitz@redhat.com>
References: <20221107151321.211175-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

We want to use bdrv_child_get_parent_aio_context() from
bdrv_parent_drained_{begin,end}_single(), both of which are "I/O or GS"
functions.

Prior to 3ed4f708fe1, all the implementations were I/O code anyway.
3ed4f708fe1 has put block jobs' AioContext field under the job mutex, so
to make child_job_get_parent_aio_context() work in an I/O context, we
need to take that lock there.

Furthermore, blk_root_get_parent_aio_context() is not marked as
anything, but is safe to run in an I/O context, so mark it that way now.
(blk_get_aio_context() is an I/O code function.)

With that done, all implementations explicitly are I/O code, so we can
mark bdrv_child_get_parent_aio_context() as I/O code, too, so callers
know it is safe to run from both GS and I/O contexts.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-global-state.h | 1 -
 include/block/block-io.h           | 2 ++
 include/block/block_int-common.h   | 4 ++--
 block.c                            | 2 +-
 block/block-backend.c              | 1 +
 blockjob.c                         | 3 ++-
 6 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index bb42ed9559..c7bd4a2088 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -220,7 +220,6 @@ void coroutine_fn bdrv_co_lock(BlockDriverState *bs);
  */
 void coroutine_fn bdrv_co_unlock(BlockDriverState *bs);
 
-AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GHashTable *visited, Transaction *tran,
                                    Error **errp);
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 770ddeb7c8..b099d7db45 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -171,6 +171,8 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event);
  */
 AioContext *bdrv_get_aio_context(BlockDriverState *bs);
 
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+
 /**
  * Move the current coroutine to the AioContext of @bs and return the old
  * AioContext of the coroutine. Increase bs->in_flight so that draining @bs
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 5a2cc077a0..31ae91e56e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -911,8 +911,6 @@ struct BdrvChildClass {
                            GHashTable *visited, Transaction *tran,
                            Error **errp);
 
-    AioContext *(*get_parent_aio_context)(BdrvChild *child);
-
     /*
      * I/O API functions. These functions are thread-safe.
      *
@@ -929,6 +927,8 @@ struct BdrvChildClass {
      */
     const char *(*get_name)(BdrvChild *child);
 
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
+
     /*
      * If this pair of functions is implemented, the parent doesn't issue new
      * requests after returning from .drained_begin() until .drained_end() is
diff --git a/block.c b/block.c
index 3bd594eb2a..2d6128d80a 100644
--- a/block.c
+++ b/block.c
@@ -1533,7 +1533,7 @@ const BdrvChildClass child_of_bds = {
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 {
-    GLOBAL_STATE_CODE();
+    IO_CODE();
     return c->klass->get_parent_aio_context(c);
 }
 
diff --git a/block/block-backend.c b/block/block-backend.c
index c0c7d56c8d..ed2f4b67a2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -311,6 +311,7 @@ static void blk_root_detach(BdrvChild *child)
 static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
 {
     BlockBackend *blk = c->opaque;
+    IO_CODE();
 
     return blk_get_aio_context(blk);
 }
diff --git a/blockjob.c b/blockjob.c
index 2d86014fa5..f51d4e18f3 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -173,7 +173,8 @@ static bool child_job_change_aio_ctx(BdrvChild *c, AioContext *ctx,
 static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
-    GLOBAL_STATE_CODE();
+    IO_CODE();
+    JOB_LOCK_GUARD();
 
     return job->job.aio_context;
 }
-- 
2.36.1


