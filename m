Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5473E57FEFA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:25:55 +0200 (CEST)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFx9m-0000KE-7Q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5c-0002Yv-DJ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5Z-00062t-0o
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibePkfzDt/wBtcTJ6xHX6w7CbYK24Namjfp2PXdQc0k=;
 b=HFGZNFeXvb6dWUd5i3xYaORMyf86JffqOL5kHaAb9EXd3tKJOWgiSpt3zNTq7bu+ZMKv4m
 ayxHe5pRE+bvmAgBJ4Ceb1fYJdTJmwQaCPkHIw6wPmPyOSWj8gqwyAoEpvNp2t9Bhu4W/u
 u6TvrPiBALfi2+XOyaGy8/eqXNzmUPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-9eFepM5zO3ma0__2V5EVvg-1; Mon, 25 Jul 2022 08:21:28 -0400
X-MC-Unique: 9eFepM5zO3ma0__2V5EVvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6437D1C05AAB;
 Mon, 25 Jul 2022 12:21:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCB8518EB5;
 Mon, 25 Jul 2022 12:21:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 07/11] block-backend: implement .change_aio_ctx in
 child_root
Date: Mon, 25 Jul 2022 08:21:16 -0400
Message-Id: <20220725122120.309236-8-eesposit@redhat.com>
In-Reply-To: <20220725122120.309236-1-eesposit@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

blk_root_change_aio_ctx() is very similar to blk_root_can_set_aio_ctx(),
but implements a new transaction so that if all check pass, the new
transaction's .commit will take care of changing the BlockBackend
AioContext. blk_root_set_aio_ctx_commit() is the same as
blk_root_set_aio_ctx().

Note: bdrv_child_try_change_aio_context() is not called by
anyone at this point.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c | 52 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index f425b00793..b4951c6e21 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -138,6 +138,9 @@ static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
                                      GSList **ignore, Error **errp);
 static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
                                  GSList **ignore);
+static bool blk_root_change_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                    GHashTable *visited, Transaction *tran,
+                                    Error **errp);
 
 static char *blk_root_get_parent_desc(BdrvChild *child)
 {
@@ -336,6 +339,7 @@ static const BdrvChildClass child_root = {
 
     .can_set_aio_ctx    = blk_root_can_set_aio_ctx,
     .set_aio_ctx        = blk_root_set_aio_ctx,
+    .change_aio_ctx     = blk_root_change_aio_ctx,
 
     .get_parent_aio_context = blk_root_get_parent_aio_context,
 };
@@ -2208,6 +2212,54 @@ int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
     return blk_do_set_aio_context(blk, new_context, true, errp);
 }
 
+typedef struct BdrvStateBlkRootContext {
+    AioContext *new_ctx;
+    BlockBackend *blk;
+} BdrvStateBlkRootContext;
+
+static void blk_root_set_aio_ctx_commit(void *opaque)
+{
+    BdrvStateBlkRootContext *s = opaque;
+    BlockBackend *blk = s->blk;
+
+    blk_do_set_aio_context(blk, s->new_ctx, false, &error_abort);
+}
+
+static TransactionActionDrv set_blk_root_context = {
+    .commit = blk_root_set_aio_ctx_commit,
+    .clean = g_free,
+};
+
+static bool blk_root_change_aio_ctx(BdrvChild *child, AioContext *ctx,
+                                    GHashTable *visited, Transaction *tran,
+                                    Error **errp)
+{
+    BlockBackend *blk = child->opaque;
+    BdrvStateBlkRootContext *s;
+
+    if (!blk->allow_aio_context_change) {
+        /*
+         * Manually created BlockBackends (those with a name) that are not
+         * attached to anything can change their AioContext without updating
+         * their user; return an error for others.
+         */
+        if (!blk->name || blk->dev) {
+            /* TODO Add BB name/QOM path */
+            error_setg(errp, "Cannot change iothread of active block backend");
+            return false;
+        }
+    }
+
+    s = g_new(BdrvStateBlkRootContext, 1);
+    *s = (BdrvStateBlkRootContext) {
+        .new_ctx = ctx,
+        .blk = blk,
+    };
+
+    tran_add(tran, &set_blk_root_context, s);
+    return true;
+}
+
 static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
                                      GSList **ignore, Error **errp)
 {
-- 
2.31.1


