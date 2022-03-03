Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6F4CC121
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:24:15 +0100 (CET)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnJO-0001hv-Bk
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:24:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnE8-00074b-GJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnE6-0005IJ-7z
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKS8X18ChbOjcMs8+77PWXbqpiY1FnFZxNZSe8Gay+4=;
 b=JNMxLsc9uDvnXuGwhv9IyR1+8guclz4/Tm9R43PfUTc4XuUa7XNK8+RpSX/3BVGeIfC5Wd
 vwNV48xA0LfILZJvcpLsXAj+tpSdND+vxGx+vRU13anSS8DTI0bQ+73SlZ+189brTpnC0Y
 LLyP8LaLro1j5u4Z2Bb9Fp1YzZs9Zn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-n_CwzohoOMWZ-d2ej2999g-1; Thu, 03 Mar 2022 10:18:42 -0500
X-MC-Unique: n_CwzohoOMWZ-d2ej2999g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4832751EA;
 Thu,  3 Mar 2022 15:18:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5FD7BCD9;
 Thu,  3 Mar 2022 15:18:40 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 10/31] block.c: assertions to the block layer permissions
 API
Date: Thu,  3 Mar 2022 10:15:55 -0500
Message-Id: <20220303151616.325444-11-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we "covered" the three main cases where the
permission API was being used under BQL (fuse,
amend and invalidate_cache), we can safely assert for
the permission functions implemented in block.c

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/block.c b/block.c
index 2a7df2a013..7d4a5440de 100644
--- a/block.c
+++ b/block.c
@@ -2109,6 +2109,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 
     assert(a->bs);
     assert(a->bs == b->bs);
+    GLOBAL_STATE_CODE();
 
     if ((b->perm & a->shared_perm) == b->perm) {
         return true;
@@ -2132,6 +2133,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *a, *b;
+    GLOBAL_STATE_CODE();
 
     /*
      * During the loop we'll look at each pair twice. That's correct because
@@ -2213,6 +2215,8 @@ static void bdrv_child_set_perm_abort(void *opaque)
 {
     BdrvChildSetPermState *s = opaque;
 
+    GLOBAL_STATE_CODE();
+
     s->child->perm = s->old_perm;
     s->child->shared_perm = s->old_shared_perm;
 }
@@ -2226,6 +2230,7 @@ static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm,
                                 uint64_t shared, Transaction *tran)
 {
     BdrvChildSetPermState *s = g_new(BdrvChildSetPermState, 1);
+    GLOBAL_STATE_CODE();
 
     *s = (BdrvChildSetPermState) {
         .child = c,
@@ -2405,6 +2410,7 @@ static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
     BdrvChild *c;
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
+    GLOBAL_STATE_CODE();
 
     bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
 
@@ -2473,6 +2479,7 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
 {
     int ret;
     BlockDriverState *bs;
+    GLOBAL_STATE_CODE();
 
     for ( ; list; list = list->next) {
         bs = list->data;
@@ -2540,6 +2547,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     Transaction *tran = tran_new();
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    GLOBAL_STATE_CODE();
 
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
     tran_finalize(tran, ret);
@@ -2602,6 +2610,7 @@ static void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
                                       uint64_t perm, uint64_t shared,
                                       uint64_t *nperm, uint64_t *nshared)
 {
+    GLOBAL_STATE_CODE();
     *nperm = perm & DEFAULT_PERM_PASSTHROUGH;
     *nshared = (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCHANGED;
 }
@@ -2613,6 +2622,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
                                        uint64_t *nperm, uint64_t *nshared)
 {
     assert(role & BDRV_CHILD_COW);
+    GLOBAL_STATE_CODE();
 
     /*
      * We want consistent read from backing files if the parent needs it.
@@ -2649,6 +2659,7 @@ static void bdrv_default_perms_for_storage(BlockDriverState *bs, BdrvChild *c,
 {
     int flags;
 
+    GLOBAL_STATE_CODE();
     assert(role & (BDRV_CHILD_METADATA | BDRV_CHILD_DATA));
 
     flags = bdrv_reopen_get_flags(reopen_queue, bs);
@@ -6028,6 +6039,7 @@ static void xdbg_graph_add_edge(XDbgBlockGraphConstructor *gr, void *parent,
 {
     BlockPermission qapi_perm;
     XDbgBlockGraphEdge *edge;
+    GLOBAL_STATE_CODE();
 
     edge = g_new0(XDbgBlockGraphEdge, 1);
 
-- 
2.31.1


