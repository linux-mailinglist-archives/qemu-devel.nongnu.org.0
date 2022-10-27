Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D09610144
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hm-0004Lh-3x; Thu, 27 Oct 2022 14:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gT-0001sT-An
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gI-0002Uu-HQ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I83YdYcXkSBUdKd6NyWh/TH83ap/UReK5oVW2Hm99zc=;
 b=fBi9l570KzKaY5mKVIRNqJiGQfYfv/N2yMYZXOjkeogHO2vnDb/v1aKZ83xz6orY5/EagJ
 zB6l1hiG9GqP+hGgr8I1K6QilXHyfgILFfHIaYm9pbsX0Smarchpi6eWs5QWFMw1/9IIlB
 RDmSnUHjDkYMeXXbplMkCiSVD+snZcU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-fQlcOE6_NFGsheGeXJxILg-1; Thu, 27 Oct 2022 14:32:40 -0400
X-MC-Unique: fQlcOE6_NFGsheGeXJxILg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0CF2811E67;
 Thu, 27 Oct 2022 18:32:39 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFEA41121320;
 Thu, 27 Oct 2022 18:32:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 29/58] block: use the new _change_ API instead of _can_set_ and
 _set_
Date: Thu, 27 Oct 2022 20:31:17 +0200
Message-Id: <20221027183146.463129-30-kwolf@redhat.com>
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

Replace all direct usage of ->can_set_aio_ctx and ->set_aio_ctx,
and call bdrv_child_try_change_aio_context() in
bdrv_try_set_aio_context(), the main function called through
the whole block layer.

From this point onwards, ->can_set_aio_ctx and ->set_aio_ctx
won't be used anymore.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221025084952.2139888-8-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c               | 44 ++++++++++++++++++++++++-------------------
 block/block-backend.c |  8 ++++++--
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/block.c b/block.c
index 3386457083..c35249e8c3 100644
--- a/block.c
+++ b/block.c
@@ -2924,17 +2924,21 @@ static void bdrv_attach_child_common_abort(void *opaque)
     }
 
     if (bdrv_child_get_parent_aio_context(s->child) != s->old_parent_ctx) {
-        GSList *ignore;
+        Transaction *tran;
+        GHashTable *visited;
+        bool ret;
 
-        /* No need to ignore `child`, because it has been detached already */
-        ignore = NULL;
-        s->child->klass->can_set_aio_ctx(s->child, s->old_parent_ctx, &ignore,
-                                         &error_abort);
-        g_slist_free(ignore);
+        tran = tran_new();
 
-        ignore = NULL;
-        s->child->klass->set_aio_ctx(s->child, s->old_parent_ctx, &ignore);
-        g_slist_free(ignore);
+        /* No need to visit `child`, because it has been detached already */
+        visited = g_hash_table_new(NULL, NULL);
+        ret = s->child->klass->change_aio_ctx(s->child, s->old_parent_ctx,
+                                              visited, tran, &error_abort);
+        g_hash_table_destroy(visited);
+
+        /* transaction is supposed to always succeed */
+        assert(ret == true);
+        tran_commit(tran);
     }
 
     bdrv_unref(bs);
@@ -2989,18 +2993,20 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
         Error *local_err = NULL;
         int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
 
-        if (ret < 0 && child_class->can_set_aio_ctx) {
-            GSList *ignore = g_slist_prepend(NULL, new_child);
-            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
-                                             NULL))
-            {
+        if (ret < 0 && child_class->change_aio_ctx) {
+            Transaction *tran = tran_new();
+            GHashTable *visited = g_hash_table_new(NULL, NULL);
+            bool ret_child;
+
+            g_hash_table_add(visited, new_child);
+            ret_child = child_class->change_aio_ctx(new_child, child_ctx,
+                                                    visited, tran, NULL);
+            if (ret_child == true) {
                 error_free(local_err);
                 ret = 0;
-                g_slist_free(ignore);
-                ignore = g_slist_prepend(NULL, new_child);
-                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
             }
-            g_slist_free(ignore);
+            tran_finalize(tran, ret_child == true ? 0 : -1);
+            g_hash_table_destroy(visited);
         }
 
         if (ret < 0) {
@@ -7601,7 +7607,7 @@ int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
     GLOBAL_STATE_CODE();
-    return bdrv_child_try_set_aio_context(bs, ctx, NULL, errp);
+    return bdrv_child_try_change_aio_context(bs, ctx, NULL, errp);
 }
 
 void bdrv_add_aio_context_notifier(BlockDriverState *bs,
diff --git a/block/block-backend.c b/block/block-backend.c
index d87ae435a7..ff417dbff9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2153,8 +2153,12 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
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
2.37.3


