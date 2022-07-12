Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8824572895
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:26:42 +0200 (CEST)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNOz-0004VH-UQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNIJ-0002un-1D
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHw-0002J7-RZ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657660762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KybLU9IwFgMw2xhqFt7O9/VvMxuZ2cPdo4RsO4G9iaw=;
 b=MyatZ7D9tD1w34B33n1yjJqPIc5VzRneKZFrANBvzP+o0GNpr5wJvhSJzucpDv7WOtFqwN
 rpkiM1iqt4w/pCjVIcsbnheuSul0gK3PxFX2Cbhd57uWGeXIDEK3db9tXoKsP3O/Y2R+2u
 mcPpOR6c12qSb3j9vuiLPXw8p3Jl0ao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-SXNDNXHzNwibxhZnZjmj1A-1; Tue, 12 Jul 2022 17:19:21 -0400
X-MC-Unique: SXNDNXHzNwibxhZnZjmj1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76E341C05145;
 Tue, 12 Jul 2022 21:19:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803482166B2A;
 Tue, 12 Jul 2022 21:19:19 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 7/8] block: use the new _change_ API instead of _can_set_
 and _set_
Date: Tue, 12 Jul 2022 17:19:10 -0400
Message-Id: <20220712211911.1302836-8-eesposit@redhat.com>
In-Reply-To: <20220712211911.1302836-1-eesposit@redhat.com>
References: <20220712211911.1302836-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace all direct usage of ->can_set_aio_ctx and ->set_aio_ctx,
and call bdrv_child_try_change_aio_context() in
bdrv_try_set_aio_context(), the main function called through
the whole block layer.

From this point onwards, ->can_set_aio_ctx and ->set_aio_ctx
won't be used anymore.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c               | 30 ++++++++++++++++--------------
 block/block-backend.c |  8 ++++++--
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index a7ba590dfa..101188a2d4 100644
--- a/block.c
+++ b/block.c
@@ -2966,17 +2966,18 @@ static void bdrv_attach_child_common_abort(void *opaque)
     }
 
     if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+        Transaction *tran;
         GSList *ignore;
+        bool ret;
 
-        /* No need to ignore `child`, because it has been detached already */
-        ignore = NULL;
-        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
-                                      &error_abort);
-        g_slist_free(ignore);
+        tran = tran_new();
 
+        /* No need to ignore `child`, because it has been detached already */
         ignore = NULL;
-        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+        ret = child->klass->change_aio_ctx(child, s->old_parent_ctx, &ignore,
+                                           tran, &error_abort);
         g_slist_free(ignore);
+        tran_finalize(tran, ret ? ret : -1);
     }
 
     bdrv_unref(bs);
@@ -3037,17 +3038,18 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
         Error *local_err = NULL;
         int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
 
-        if (ret < 0 && child_class->can_set_aio_ctx) {
+        if (ret < 0 && child_class->change_aio_ctx) {
+            Transaction *tran = tran_new();
             GSList *ignore = g_slist_prepend(NULL, new_child);
-            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
-                                             NULL))
-            {
+            bool ret_child;
+
+            ret_child = child_class->change_aio_ctx(new_child, child_ctx,
+                                                    &ignore, tran, NULL);
+            if (ret_child) {
                 error_free(local_err);
                 ret = 0;
-                g_slist_free(ignore);
-                ignore = g_slist_prepend(NULL, new_child);
-                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
             }
+            tran_finalize(tran, ret_child ? ret_child : -1);
             g_slist_free(ignore);
         }
 
@@ -7708,7 +7710,7 @@ int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
     GLOBAL_STATE_CODE();
-    return bdrv_child_try_set_aio_context(bs, ctx, NULL, errp);
+    return bdrv_child_try_change_aio_context(bs, ctx, NULL, errp);
 }
 
 void bdrv_add_aio_context_notifier(BlockDriverState *bs,
diff --git a/block/block-backend.c b/block/block-backend.c
index 674eaaa2bf..6e90ac3a6a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2184,8 +2184,12 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
         bdrv_ref(bs);
 
         if (update_root_node) {
-            ret = bdrv_child_try_set_aio_context(bs, new_context, blk->root,
-                                                 errp);
+            /*
+             * update_root_node MUST be false for blk_root_set_aio_ctx_commit(),
+             * as we are already in the commit function of a transaction.
+             */
+            ret = bdrv_child_try_change_aio_context(bs, new_context, blk->root,
+                                                    errp);
             if (ret < 0) {
                 bdrv_unref(bs);
                 return ret;
-- 
2.31.1


