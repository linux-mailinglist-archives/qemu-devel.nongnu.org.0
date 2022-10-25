Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C331A60C7B2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:15:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFm3-0002bp-F2; Tue, 25 Oct 2022 04:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdR-0007Ox-TW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdK-0007V2-IR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666687800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1fDW3dwvoO+gnQ2VDIACjQYspB1H17TcUXyWaGCtAw=;
 b=YlhU/w7rXqrQQD0M4HDt13VXydcU1dy1A+izSQU5+42N0RZZ9UWANokGVXZGCNgPIMPobQ
 F84o0FNvtHQXOMKXQZ888NGwcbPxCYOUzHzi6BEibDATUAYV36w9lUJ4UAHqixLu8WBdW+
 ewLxCtEJeomY5WYEYMBnDCMB269J7yA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-9csT-4m9N4izUFuFvUrqow-1; Tue, 25 Oct 2022 04:49:58 -0400
X-MC-Unique: 9csT-4m9N4izUFuFvUrqow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58F4D381459A;
 Tue, 25 Oct 2022 08:49:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13E2635429;
 Tue, 25 Oct 2022 08:49:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 09/10] block: rename bdrv_child_try_change_aio_context in
 bdrv_try_change_aio_context
Date: Tue, 25 Oct 2022 04:49:51 -0400
Message-Id: <20221025084952.2139888-10-eesposit@redhat.com>
In-Reply-To: <20221025084952.2139888-1-eesposit@redhat.com>
References: <20221025084952.2139888-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No functional changes intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                            | 6 +++---
 block/block-backend.c              | 3 +--
 include/block/block-global-state.h | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 3a59f7b7e0..ad8bc167ee 100644
--- a/block.c
+++ b/block.c
@@ -7340,8 +7340,8 @@ static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
  * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
  * Therefore the new AioContext lock must not be taken by the caller.
  */
-int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                      BdrvChild *ignore_child, Error **errp)
+int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                BdrvChild *ignore_child, Error **errp)
 {
     Transaction *tran;
     GHashTable *visited;
@@ -7411,7 +7411,7 @@ int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
     GLOBAL_STATE_CODE();
-    return bdrv_child_try_change_aio_context(bs, ctx, NULL, errp);
+    return bdrv_try_change_aio_context(bs, ctx, NULL, errp);
 }
 
 void bdrv_add_aio_context_notifier(BlockDriverState *bs,
diff --git a/block/block-backend.c b/block/block-backend.c
index a91c8d3916..705afef9b3 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2151,8 +2151,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
              * update_root_node MUST be false for blk_root_set_aio_ctx_commit(),
              * as we are already in the commit function of a transaction.
              */
-            ret = bdrv_child_try_change_aio_context(bs, new_context, blk->root,
-                                                    errp);
+            ret = bdrv_try_change_aio_context(bs, new_context, blk->root, errp);
             if (ret < 0) {
                 bdrv_unref(bs);
                 return ret;
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 03d4ade7c2..8db3132e8f 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -226,8 +226,8 @@ AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GHashTable *visited, Transaction *tran,
                                    Error **errp);
-int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                      BdrvChild *ignore_child, Error **errp);
+int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                BdrvChild *ignore_child, Error **errp);
 
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
-- 
2.31.1


