Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AB57FF2E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:44:43 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxRy-0003oY-Lm
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5g-0002aQ-S5
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5c-00064M-Ts
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtAkzJgmgSvnZY++3nStSUz9Dq0gU/2gwy5wg4aQA/0=;
 b=ZDWY+ZTbtjt3CTeSNQW8zsgiX59X3Iz86Da6fVf4tpwpgMB9VArx2p8cDr1rKgSFKjOykU
 taRyIQUXTdMc2sxZxlZXqUh0jhRmx8V0KmR4FX7XaAhLXCV7NTzgfblZZjxbfUw4eWJnHE
 dESEJe3GN7DGOM/PciPhi3AKTKP/d1Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-jUqwIB8JMJyAB5abW27ApA-1; Mon, 25 Jul 2022 08:21:31 -0400
X-MC-Unique: jUqwIB8JMJyAB5abW27ApA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 913092811383;
 Mon, 25 Jul 2022 12:21:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EA7390A04;
 Mon, 25 Jul 2022 12:21:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 10/11] block: rename bdrv_child_try_change_aio_context in
 bdrv_try_change_aio_context
Date: Mon, 25 Jul 2022 08:21:19 -0400
Message-Id: <20220725122120.309236-11-eesposit@redhat.com>
In-Reply-To: <20220725122120.309236-1-eesposit@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional changes intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 19 ++++++++-----------
 block/block-backend.c              |  3 +--
 include/block/block-global-state.h | 12 +++++-------
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index c066b41c8c..b82eb0ba6d 100644
--- a/block.c
+++ b/block.c
@@ -7462,11 +7462,9 @@ static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
  * For the same reason, it temporarily holds also the new AioContext, since
  * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
  */
-int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
-                                           AioContext *ctx,
-                                           BdrvChild *ignore_child,
-                                           Transaction *tran,
-                                           Error **errp)
+int bdrv_try_change_aio_context_tran(BlockDriverState *bs, AioContext *ctx,
+                                     BdrvChild *ignore_child, Transaction *tran,
+                                     Error **errp)
 {
     GHashTable *visited;
     int ret;
@@ -7483,11 +7481,11 @@ int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
 }
 
 /*
- * See bdrv_child_try_change_aio_context_tran for invariants on
+ * See bdrv_try_change_aio_context_tran for invariants on
  * AioContext locks.
  */
-int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                      BdrvChild *ignore_child, Error **errp)
+int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                BdrvChild *ignore_child, Error **errp)
 {
     Transaction *tran;
     int ret;
@@ -7496,8 +7494,7 @@ int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
 
     /* Recursion phase: go through all nodes of the graph */
     tran = tran_new();
-    ret = bdrv_child_try_change_aio_context_tran(bs, ctx, ignore_child, tran,
-                                                 errp);
+    ret = bdrv_try_change_aio_context_tran(bs, ctx, ignore_child, tran, errp);
 
     /* Linear phase: go through all callbacks collected in the transaction */
 
@@ -7542,7 +7539,7 @@ int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
     GLOBAL_STATE_CODE();
-    return bdrv_child_try_change_aio_context(bs, ctx, NULL, errp);
+    return bdrv_try_change_aio_context(bs, ctx, NULL, errp);
 }
 
 void bdrv_add_aio_context_notifier(BlockDriverState *bs,
diff --git a/block/block-backend.c b/block/block-backend.c
index a27b8b7a89..f785c1e7e2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2182,8 +2182,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
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
index 54fd008442..11f80768c3 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -223,13 +223,11 @@ AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GHashTable *visited, Transaction *tran,
                                    Error **errp);
-int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                      BdrvChild *ignore_child, Error **errp);
-int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
-                                           AioContext *ctx,
-                                           BdrvChild *ignore_child,
-                                           Transaction *tran,
-                                           Error **errp);
+int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                BdrvChild *ignore_child, Error **errp);
+int bdrv_try_change_aio_context_tran(BlockDriverState *bs, AioContext *ctx,
+                                     BdrvChild *ignore_child, Transaction *tran,
+                                     Error **errp);
 
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
-- 
2.31.1


