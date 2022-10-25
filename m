Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06CC60C72A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:03:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFl7-0008DO-25; Tue, 25 Oct 2022 04:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdO-00070W-Ox
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdI-0007UL-U5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666687798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzK8Nvp5hWcQs1l+Px+GO6LAD7FMhoYv0HjAQM6gcfI=;
 b=Bbz1n3JJTlTTzbFr+W81gj8Gkxd9pIngnNhlr0J9uJXI1hpXie95hX55iEfpRDc5w6GptC
 ytA/8ic7ye6FIx9tPpjqQxYLjOPm6gEwjgHXBXE4xiwLIdyKcW+gI/sc1W2lWiVXjiaMT5
 bP44wv7HJkMhR0rxkulkP2EACSyBiE4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-218pGt7mM7GV2pgnl1aKjA-1; Tue, 25 Oct 2022 04:49:56 -0400
X-MC-Unique: 218pGt7mM7GV2pgnl1aKjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20041C075A2;
 Tue, 25 Oct 2022 08:49:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D41F17584;
 Tue, 25 Oct 2022 08:49:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 04/10] blockjob: implement .change_aio_ctx in child_job
Date: Tue, 25 Oct 2022 04:49:46 -0400
Message-Id: <20221025084952.2139888-5-eesposit@redhat.com>
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

child_job_change_aio_ctx() is very similar to
child_job_can_set_aio_ctx(), but it implements a new transaction
so that if all check pass, the new transaction's .commit()
will take care of changin the BlockJob AioContext.
child_job_set_aio_ctx_commit() is similar to child_job_set_aio_ctx(),
but it doesn't need to invoke the recursion, as this is already
taken care by child_job_change_aio_ctx().

Note: bdrv_child_try_change_aio_context() is not called by
anyone at this point.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 blockjob.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/blockjob.c b/blockjob.c
index bdf20a0e35..5a783b75c6 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -126,6 +126,50 @@ static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
     job_resume(&job->job);
 }
 
+typedef struct BdrvStateChildJobContext {
+    AioContext *new_ctx;
+    BlockJob *job;
+} BdrvStateChildJobContext;
+
+static void child_job_set_aio_ctx_commit(void *opaque)
+{
+    BdrvStateChildJobContext *s = opaque;
+    BlockJob *job = s->job;
+
+    job_set_aio_context(&job->job, s->new_ctx);
+}
+
+static TransactionActionDrv change_child_job_context = {
+    .commit = child_job_set_aio_ctx_commit,
+    .clean = g_free,
+};
+
+static bool child_job_change_aio_ctx(BdrvChild *c, AioContext *ctx,
+                                     GHashTable *visited, Transaction *tran,
+                                     Error **errp)
+{
+    BlockJob *job = c->opaque;
+    BdrvStateChildJobContext *s;
+    GSList *l;
+
+    for (l = job->nodes; l; l = l->next) {
+        BdrvChild *sibling = l->data;
+        if (!bdrv_child_change_aio_context(sibling, ctx, visited,
+                                           tran, errp)) {
+            return false;
+        }
+    }
+
+    s = g_new(BdrvStateChildJobContext, 1);
+    *s = (BdrvStateChildJobContext) {
+        .new_ctx = ctx,
+        .job = job,
+    };
+
+    tran_add(tran, &change_child_job_context, s);
+    return true;
+}
+
 static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
                                       GSList **ignore, Error **errp)
 {
@@ -174,6 +218,7 @@ static const BdrvChildClass child_job = {
     .drained_end        = child_job_drained_end,
     .can_set_aio_ctx    = child_job_can_set_aio_ctx,
     .set_aio_ctx        = child_job_set_aio_ctx,
+    .change_aio_ctx     = child_job_change_aio_ctx,
     .stay_at_node       = true,
     .get_parent_aio_context = child_job_get_parent_aio_context,
 };
-- 
2.31.1


