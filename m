Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DD57FEFB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:25:59 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFx9q-0000Sc-B6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5Z-0002Xa-Cd
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5U-00061m-GM
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bx79kqpmq1a7uj5+8p7ruAYDnXjpbMAKJvdsMpPZ064=;
 b=No8muXSsjlAXW2yusSNRgTppq7yzrJ9Y8PN5YRqauUlKQPqBN/E19epfUdG1x9XkxKHuPl
 roKYlyLDsIGYrluIjFWtuC47xrVLCja0fVhbHvKJT8wrQXzaoW9sgVWzn1akxft9sEJCGw
 8162vDKcM01XbLFbwahcWjdRYEWw14c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-2peHmXULPDm9J2gnfzMv7A-1; Mon, 25 Jul 2022 08:21:26 -0400
X-MC-Unique: 2peHmXULPDm9J2gnfzMv7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3687318F0271;
 Mon, 25 Jul 2022 12:21:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBB6218EB5;
 Mon, 25 Jul 2022 12:21:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 04/11] bdrv_child_try_change_aio_context: add transaction
 parameter
Date: Mon, 25 Jul 2022 08:21:13 -0400
Message-Id: <20220725122120.309236-5-eesposit@redhat.com>
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

This enables the caller to use the same transaction to also
keep track of aiocontext changes.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 31 ++++++++++++++++++++++++------
 include/block/block-global-state.h |  5 +++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index c02a628336..221bf90268 100644
--- a/block.c
+++ b/block.c
@@ -7643,17 +7643,16 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
  * For the same reason, it temporarily holds also the new AioContext, since
  * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
  */
-int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                      BdrvChild *ignore_child, Error **errp)
+int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
+                                           AioContext *ctx,
+                                           BdrvChild *ignore_child,
+                                           Transaction *tran,
+                                           Error **errp)
 {
-    Transaction *tran;
     GHashTable *visited;
     int ret;
-    AioContext *old_context = bdrv_get_aio_context(bs);
     GLOBAL_STATE_CODE();
 
-    /* Recursion phase: go through all nodes of the graph */
-    tran = tran_new();
     visited = g_hash_table_new(NULL, NULL);
     if (ignore_child) {
         g_hash_table_add(visited, ignore_child);
@@ -7661,6 +7660,26 @@ int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
     ret = bdrv_change_aio_context(bs, ctx, visited, tran, errp);
     g_hash_table_destroy(visited);
 
+    return ret;
+}
+
+/*
+ * See bdrv_child_try_change_aio_context_tran for invariants on
+ * AioContext locks.
+ */
+int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                      BdrvChild *ignore_child, Error **errp)
+{
+    Transaction *tran;
+    int ret;
+    AioContext *old_context = bdrv_get_aio_context(bs);
+    GLOBAL_STATE_CODE();
+
+    /* Recursion phase: go through all nodes of the graph */
+    tran = tran_new();
+    ret = bdrv_child_try_change_aio_context_tran(bs, ctx, ignore_child, tran,
+                                                 errp);
+
     /* Linear phase: go through all callbacks collected in the transaction */
 
     if (!ret) {
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index ceecf0aa8e..1bd445b507 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -234,6 +234,11 @@ bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    Error **errp);
 int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
                                       BdrvChild *ignore_child, Error **errp);
+int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
+                                           AioContext *ctx,
+                                           BdrvChild *ignore_child,
+                                           Transaction *tran,
+                                           Error **errp);
 
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
-- 
2.31.1


