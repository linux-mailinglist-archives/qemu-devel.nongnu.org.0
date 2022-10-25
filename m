Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E6060C75D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:05:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFmG-0004jc-H1; Tue, 25 Oct 2022 04:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdV-0007Xb-W7
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdL-0007VL-9S
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666687801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63eUcMpol0t2jp03PhUpUP5EPG6mrFCUlZoPo0L+PW8=;
 b=CbC0TuR8YhWehJDw0TK261gOFkdGuLiP8ZBB6qQfLjmPECodr2NZys5lGOPKbzDiWZxgE1
 iqm+Mlp/4FNb6kG1GRIol7T5kEbLmXg9T+EKsBvGszyKhLgdZNcM7PryBWGIqVmUedXPsm
 akoihf4tgIknPp12nOV16obwMv9eVfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-kFL2rcnLMruCZCO93w_EuQ-1; Tue, 25 Oct 2022 04:49:57 -0400
X-MC-Unique: kFL2rcnLMruCZCO93w_EuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93A488434F;
 Tue, 25 Oct 2022 08:49:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6425439DB3;
 Tue, 25 Oct 2022 08:49:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 07/10] block: use the new _change_ API instead of _can_set_
 and _set_
Date: Tue, 25 Oct 2022 04:49:49 -0400
Message-Id: <20221025084952.2139888-8-eesposit@redhat.com>
In-Reply-To: <20221025084952.2139888-1-eesposit@redhat.com>
References: <20221025084952.2139888-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace all direct usage of ->can_set_aio_ctx and ->set_aio_ctx,
and call bdrv_child_try_change_aio_context() in
bdrv_try_set_aio_context(), the main function called through
the whole block layer.

From this point onwards, ->can_set_aio_ctx and ->set_aio_ctx
won't be used anymore.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c               | 44 ++++++++++++++++++++++++-------------------
 block/block-backend.c |  8 ++++++--
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/block.c b/block.c
index 647297ca81..2bdbdee910 100644
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
2.31.1


