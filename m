Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845F6EE6AA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:29:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMS5-0006r0-D4; Tue, 25 Apr 2023 13:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMRy-0006nn-Sx
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMRv-00034D-0Y
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JkFpuuttzsHF3MmIyOMmXjxDhu1gSfxxf39pT8P3Wk=;
 b=eOuOf6anvtgtNSlbHPqYrIMaflEVxvgijYK0CdXcZ+t+EOilYXID9tCjQSc25BLZATTlVS
 2AEw35AEe5ebwEVKed9ANye+tbEhUMt2kQEBYCqj3lkEkIFBPeG/9eN3DP0/+C6bhSyEP5
 3BjO4/tzM0yUcQLmgy5Ba3iJ08QuMDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-aQ75ElyHO6Sd8kPgmp3dug-1; Tue, 25 Apr 2023 13:27:22 -0400
X-MC-Unique: aQ75ElyHO6Sd8kPgmp3dug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E5D9A0F391;
 Tue, 25 Apr 2023 17:27:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B514514171B8;
 Tue, 25 Apr 2023 17:27:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Lieven <pl@kamp.de>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 01/20] block-backend: split blk_do_set_aio_context()
Date: Tue, 25 Apr 2023 13:26:57 -0400
Message-Id: <20230425172716.1033562-2-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

blk_set_aio_context() is not fully transactional because
blk_do_set_aio_context() updates blk->ctx outside the transaction. Most
of the time this goes unnoticed but a BlockDevOps.drained_end() callback
that invokes blk_get_aio_context() fails assert(ctx == blk->ctx). This
happens because blk->ctx is only assigned after
BlockDevOps.drained_end() is called and we're in an intermediate state
where BlockDrvierState nodes already have the new context and the
BlockBackend still has the old context.

Making blk_set_aio_context() fully transactional solves this assertion
failure because the BlockBackend's context is updated as part of the
transaction (before BlockDevOps.drained_end() is called).

Split blk_do_set_aio_context() in order to solve this assertion failure.
This helper function actually serves two different purposes:
1. It drives blk_set_aio_context().
2. It responds to BdrvChildClass->change_aio_ctx().

Get rid of the helper function. Do #1 inside blk_set_aio_context() and
do #2 inside blk_root_set_aio_ctx_commit(). This simplifies the code.

The only drawback of the fully transactional approach is that
blk_set_aio_context() must contend with blk_root_set_aio_ctx_commit()
being invoked as part of the AioContext change propagation. This can be
solved by temporarily setting blk->allow_aio_context_change to true.

Future patches call blk_get_aio_context() from
BlockDevOps->drained_end(), so this patch will become necessary.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 71 +++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 5566ea059d..ffd1d66f7d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2199,52 +2199,31 @@ static AioContext *blk_aiocb_get_aio_context(BlockAIOCB *acb)
     return blk_get_aio_context(blk_acb->blk);
 }
 
-static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
-                                  bool update_root_node, Error **errp)
-{
-    BlockDriverState *bs = blk_bs(blk);
-    ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
-    int ret;
-
-    if (bs) {
-        bdrv_ref(bs);
-
-        if (update_root_node) {
-            /*
-             * update_root_node MUST be false for blk_root_set_aio_ctx_commit(),
-             * as we are already in the commit function of a transaction.
-             */
-            ret = bdrv_try_change_aio_context(bs, new_context, blk->root, errp);
-            if (ret < 0) {
-                bdrv_unref(bs);
-                return ret;
-            }
-        }
-        /*
-         * Make blk->ctx consistent with the root node before we invoke any
-         * other operations like drain that might inquire blk->ctx
-         */
-        blk->ctx = new_context;
-        if (tgm->throttle_state) {
-            bdrv_drained_begin(bs);
-            throttle_group_detach_aio_context(tgm);
-            throttle_group_attach_aio_context(tgm, new_context);
-            bdrv_drained_end(bs);
-        }
-
-        bdrv_unref(bs);
-    } else {
-        blk->ctx = new_context;
-    }
-
-    return 0;
-}
-
 int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
                         Error **errp)
 {
+    bool old_allow_change;
+    BlockDriverState *bs = blk_bs(blk);
+    int ret;
+
     GLOBAL_STATE_CODE();
-    return blk_do_set_aio_context(blk, new_context, true, errp);
+
+    if (!bs) {
+        blk->ctx = new_context;
+        return 0;
+    }
+
+    bdrv_ref(bs);
+
+    old_allow_change = blk->allow_aio_context_change;
+    blk->allow_aio_context_change = true;
+
+    ret = bdrv_try_change_aio_context(bs, new_context, NULL, errp);
+
+    blk->allow_aio_context_change = old_allow_change;
+
+    bdrv_unref(bs);
+    return ret;
 }
 
 typedef struct BdrvStateBlkRootContext {
@@ -2256,8 +2235,14 @@ static void blk_root_set_aio_ctx_commit(void *opaque)
 {
     BdrvStateBlkRootContext *s = opaque;
     BlockBackend *blk = s->blk;
+    AioContext *new_context = s->new_ctx;
+    ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
 
-    blk_do_set_aio_context(blk, s->new_ctx, false, &error_abort);
+    blk->ctx = new_context;
+    if (tgm->throttle_state) {
+        throttle_group_detach_aio_context(tgm);
+        throttle_group_attach_aio_context(tgm, new_context);
+    }
 }
 
 static TransactionActionDrv set_blk_root_context = {
-- 
2.39.2


