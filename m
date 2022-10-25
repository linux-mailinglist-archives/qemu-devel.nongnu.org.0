Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E960C722
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:02:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFmL-0005YU-LF; Tue, 25 Oct 2022 04:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdj-0007vg-FA
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdN-0007ZI-JO
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666687803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k8VJpiDmOvkkeh8LGfXs396lXAJSFkDiOFq98gyZFxM=;
 b=PILvG0UaH0PT7F97jvpwQysGQhwjifOTUYX1SlmhkF0GO/pTwxLmv7W4UiNKGKrcMLPmFO
 azOduvQCZ/dAdWtk8bUU+fu9ZHsTk+PBx5qsN9vmP7u2Q94WxqqTo6CK/TqLbF5h6SZt7l
 5OPU65FCoIRrzjkqvsVWQNpK8/z+SBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-mbyWKYcvPg-oxUqTlG05rg-1; Tue, 25 Oct 2022 04:49:56 -0400
X-MC-Unique: mbyWKYcvPg-oxUqTlG05rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A61D1881423;
 Tue, 25 Oct 2022 08:49:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14DFB23177;
 Tue, 25 Oct 2022 08:49:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 06/10] block-backend: implement .change_aio_ctx in
 child_root
Date: Tue, 25 Oct 2022 04:49:48 -0400
Message-Id: <20221025084952.2139888-7-eesposit@redhat.com>
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

blk_root_change_aio_ctx() is very similar to blk_root_can_set_aio_ctx(),
but implements a new transaction so that if all check pass, the new
transaction's .commit will take care of changing the BlockBackend
AioContext. blk_root_set_aio_ctx_commit() is the same as
blk_root_set_aio_ctx().

Note: bdrv_child_try_change_aio_context() is not called by
anyone at this point.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 52 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index aa4adf06ae..d87ae435a7 100644
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
@@ -2177,6 +2181,54 @@ int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
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


