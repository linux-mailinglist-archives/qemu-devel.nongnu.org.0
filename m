Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6BF610085
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:42:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7i5-0005QU-KI; Thu, 27 Oct 2022 14:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gV-0001sZ-Nv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gK-0002Vh-D0
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHEDNYlUvOTDK+7KygzeY/NWMMdx2QXuq7zdyhK4nmo=;
 b=KJeEKfkX/G2eqrvwqJjfzY37rDD5473T6MehmnrDdBeH/C1XU+fqcUaD+3dcSQ/DWPcu/3
 Jb07zGzck75uwRlllao3y9+0p5ymit+5USay/W6ovn5qI+YMaucxPrU0PX9rqzx0e7X2kv
 yI2mqRtMqOwisDQRJ9LMXj6B/co1/wA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-3AJX4nYVN4imBjRHqk80kg-1; Thu, 27 Oct 2022 14:32:42 -0400
X-MC-Unique: 3AJX4nYVN4imBjRHqk80kg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA4033C0F66E;
 Thu, 27 Oct 2022 18:32:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E837A112132D;
 Thu, 27 Oct 2022 18:32:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 31/58] block: rename bdrv_child_try_change_aio_context in
 bdrv_try_change_aio_context
Date: Thu, 27 Oct 2022 20:31:19 +0200
Message-Id: <20221027183146.463129-32-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

No functional changes intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221025084952.2139888-10-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h | 4 ++--
 block.c                            | 6 +++---
 block/block-backend.c              | 3 +--
 3 files changed, 6 insertions(+), 7 deletions(-)

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
diff --git a/block.c b/block.c
index 353240eecd..cf97a35f82 100644
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
-- 
2.37.3


