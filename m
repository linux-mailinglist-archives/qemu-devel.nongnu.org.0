Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C14964DB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:14:16 +0100 (CET)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyQR-0006vP-SW
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxO7-00018X-Rt
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxO4-0000Z5-9U
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0/9h+ojJJD5VsAceZBm++9ONBxtrl2G08T5QKb0dZ4=;
 b=EylEzqtUrjYWmgu/nTCs8GUVoAhaQ5weq4DxGcFUhn/znowRz+tY3J93+2ilWJcyaz7QjI
 QLoVFvxxlu1KEC4PhUvme7WcwcUpsd5piyOKanIjd59XYILknqJdCYWrsycu9+0mO+QIr0
 RwxjZoInlyttBDzSQFno+B+nS2wfwgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-CZlOsoCdNaK2I5NZcq7OEw-1; Fri, 21 Jan 2022 12:07:39 -0500
X-MC-Unique: CZlOsoCdNaK2I5NZcq7OEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 768BC874980;
 Fri, 21 Jan 2022 17:07:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D31CC7ED83;
 Fri, 21 Jan 2022 17:07:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 33/33] block.c: assertions to the block layer permissions
 API
Date: Fri, 21 Jan 2022 12:05:44 -0500
Message-Id: <20220121170544.2049944-34-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
index ca16d90627..afa18653d1 100644
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
@@ -2581,6 +2588,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     Transaction *tran = tran_new();
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    assert(qemu_in_main_thread());
 
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
     tran_finalize(tran, ret);
@@ -2647,6 +2655,7 @@ static void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
                                       uint64_t perm, uint64_t shared,
                                       uint64_t *nperm, uint64_t *nshared)
 {
+    assert(qemu_in_main_thread());
     *nperm = perm & DEFAULT_PERM_PASSTHROUGH;
     *nshared = (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCHANGED;
 }
@@ -2658,6 +2667,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
                                        uint64_t *nperm, uint64_t *nshared)
 {
     assert(role & BDRV_CHILD_COW);
+    assert(qemu_in_main_thread());
 
     /*
      * We want consistent read from backing files if the parent needs it.
@@ -2694,6 +2704,7 @@ static void bdrv_default_perms_for_storage(BlockDriverState *bs, BdrvChild *c,
 {
     int flags;
 
+    assert(qemu_in_main_thread());
     assert(role & (BDRV_CHILD_METADATA | BDRV_CHILD_DATA));
 
     flags = bdrv_reopen_get_flags(reopen_queue, bs);
@@ -6090,6 +6101,7 @@ static void xdbg_graph_add_edge(XDbgBlockGraphConstructor *gr, void *parent,
 {
     BlockPermission qapi_perm;
     XDbgBlockGraphEdge *edge;
+    assert(qemu_in_main_thread());
 
     edge = g_new0(XDbgBlockGraphEdge, 1);
 
-- 
2.31.1


