Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC345B55C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:29:25 +0100 (CET)
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmia-0000Y4-JJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3f-0005jb-4Z
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3d-0005I8-41
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBhxgowuQFcAUR58uqqa1WKNXK5w+PFAr5esLP1KKHs=;
 b=iIQN8DzNC4u7xIQWer7EONm2eQq2WKzKMt3C4YDPrilBH/vxFwPg18PaFQf9/LmlYItRYz
 1pioDCLWcAqQIIKlfUesJysuJ7Q1HNVOeNV5F/RHL4NRNCapnwUPYrbxIVGfg0x1jD33ur
 eSLjlErTAqM6PnNOgPEN1vinburfdts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-m3vw3HT2M9iC4dpragY7tA-1; Wed, 24 Nov 2021 01:47:01 -0500
X-MC-Unique: m3vw3HT2M9iC4dpragY7tA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FAD51006AA1;
 Wed, 24 Nov 2021 06:47:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221AB60843;
 Wed, 24 Nov 2021 06:46:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 31/31] block.c: assertions to the block layer permissions
 API
Date: Wed, 24 Nov 2021 01:44:18 -0500
Message-Id: <20211124064418.3120601-32-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
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
index 805974676b..6056ec4bc5 100644
--- a/block.c
+++ b/block.c
@@ -2138,6 +2138,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 
     assert(a->bs);
     assert(a->bs == b->bs);
+    assert(qemu_in_main_thread());
 
     if ((b->perm & a->shared_perm) == b->perm) {
         return true;
@@ -2161,6 +2162,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *a, *b;
+    assert(qemu_in_main_thread());
 
     /*
      * During the loop we'll look at each pair twice. That's correct because
@@ -2245,6 +2247,8 @@ static void bdrv_child_set_perm_abort(void *opaque)
 {
     BdrvChildSetPermState *s = opaque;
 
+    assert(qemu_in_main_thread());
+
     s->child->perm = s->old_perm;
     s->child->shared_perm = s->old_shared_perm;
 }
@@ -2258,6 +2262,7 @@ static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm,
                                 uint64_t shared, Transaction *tran)
 {
     BdrvChildSetPermState *s = g_new(BdrvChildSetPermState, 1);
+    assert(qemu_in_main_thread());
 
     *s = (BdrvChildSetPermState) {
         .child = c,
@@ -2442,6 +2447,7 @@ static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
     BdrvChild *c;
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
+    assert(qemu_in_main_thread());
 
     bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
 
@@ -2510,6 +2516,7 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
 {
     int ret;
     BlockDriverState *bs;
+    assert(qemu_in_main_thread());
 
     for ( ; list; list = list->next) {
         bs = list->data;
@@ -2582,6 +2589,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     Transaction *tran = tran_new();
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    assert(qemu_in_main_thread());
 
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
     tran_finalize(tran, ret);
@@ -2648,6 +2656,7 @@ static void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
                                       uint64_t perm, uint64_t shared,
                                       uint64_t *nperm, uint64_t *nshared)
 {
+    assert(qemu_in_main_thread());
     *nperm = perm & DEFAULT_PERM_PASSTHROUGH;
     *nshared = (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCHANGED;
 }
@@ -2659,6 +2668,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
                                        uint64_t *nperm, uint64_t *nshared)
 {
     assert(role & BDRV_CHILD_COW);
+    assert(qemu_in_main_thread());
 
     /*
      * We want consistent read from backing files if the parent needs it.
@@ -2696,6 +2706,7 @@ static void bdrv_default_perms_for_storage(BlockDriverState *bs, BdrvChild *c,
 {
     int flags;
 
+    assert(qemu_in_main_thread());
     assert(role & (BDRV_CHILD_METADATA | BDRV_CHILD_DATA));
 
     flags = bdrv_reopen_get_flags(reopen_queue, bs);
@@ -6094,6 +6105,7 @@ static void xdbg_graph_add_edge(XDbgBlockGraphConstructor *gr, void *parent,
 {
     BlockPermission qapi_perm;
     XDbgBlockGraphEdge *edge;
+    assert(qemu_in_main_thread());
 
     edge = g_new0(XDbgBlockGraphEdge, 1);
 
-- 
2.27.0


