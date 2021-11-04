Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B014451AC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:45:30 +0100 (CET)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miaFN-0002pc-K0
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9v-000538-Ub
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9t-0006wd-QB
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636022389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kocsaTnqsOQDRk27VonMvEt1oNRfZ10PzaAMGOTMEEI=;
 b=eFxy7ktlySgpazRRNHObBb1B7z6XEA739pXLdaUxGT6w8ekJmflFmde3O1zdE+w3uObjcp
 ZOmm5eBQLPCLJOhJRQSHqw+h7e8PUJmlC0W8dnpcKqF/m2qymDoEwz80DXZZaBZZmhyxus
 93qyvh4Nh0kOV42IVbbibl4Xm70GWpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-pKuV4kCzMH-qBQvTbPDhuQ-1; Thu, 04 Nov 2021 06:39:46 -0400
X-MC-Unique: pKuV4kCzMH-qBQvTbPDhuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07997871807;
 Thu,  4 Nov 2021 10:39:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772885D9D3;
 Thu,  4 Nov 2021 10:39:44 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/7] block: Pass BdrvChild ** to replace_child_noperm
Date: Thu,  4 Nov 2021 11:38:47 +0100
Message-Id: <20211104103849.46855-6-hreitz@redhat.com>
In-Reply-To: <20211104103849.46855-1-hreitz@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_replace_child_noperm() modifies BdrvChild.bs, and can potentially
set it to NULL.  That is dangerous, because BDS parents generally assume
that their children's .bs pointer is never NULL.  We therefore want to
let bdrv_replace_child_noperm() set the corresponding BdrvChild pointer
to NULL, too.

This patch lays the foundation for it by passing a BdrvChild ** pointer
to bdrv_replace_child_noperm() so that it can later use it to NULL the
BdrvChild pointer immediately after setting BdrvChild.bs to NULL.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 59 ++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index 6d230ad3d1..ff45447686 100644
--- a/block.c
+++ b/block.c
@@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_replace_child_noperm(BdrvChild *child,
+static void bdrv_replace_child_noperm(BdrvChild **child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
@@ -2254,6 +2254,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
+    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2269,8 +2270,8 @@ static void bdrv_replace_child_abort(void *opaque)
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
-    /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(s->child, s->old_bs);
+    /* old_bs reference is transparently moved from @s to *s->childp */
+    bdrv_replace_child_noperm(s->childp, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2287,21 +2288,23 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * The function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+static void bdrv_replace_child_tran(BdrvChild **childp,
+                                    BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
-        .child = child,
-        .old_bs = child->bs,
+        .child = *childp,
+        .childp = childp,
+        .old_bs = (*childp)->bs,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(child, new_bs);
-    /* old_bs reference is transparently moved from @child to @s */
+    bdrv_replace_child_noperm(childp, new_bs);
+    /* old_bs reference is transparently moved from *childp to @s */
 }
 
 /*
@@ -2672,9 +2675,10 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-static void bdrv_replace_child_noperm(BdrvChild *child,
+static void bdrv_replace_child_noperm(BdrvChild **childp,
                                       BlockDriverState *new_bs)
 {
+    BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
@@ -2767,7 +2771,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2867,7 +2871,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(new_child, child_bs);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -2927,12 +2931,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
+static void bdrv_detach_child(BdrvChild **childp)
 {
-    BlockDriverState *old_bs = child->bs;
+    BlockDriverState *old_bs = (*childp)->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -3038,7 +3042,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     BlockDriverState *child_bs;
 
     child_bs = child->bs;
-    bdrv_detach_child(child);
+    bdrv_detach_child(&child);
     bdrv_unref(child_bs);
 }
 
@@ -4891,30 +4895,33 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
+    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
-    assert(child == bs->backing || child == bs->file);
+    if (child == bs->backing) {
+        childp = &bs->backing;
+    } else if (child == bs->file) {
+        childp = &bs->file;
+    } else {
+        g_assert_not_reached();
+    }
 
     if (!child) {
         return;
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(child, NULL, tran);
+        bdrv_replace_child_tran(childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (child == bs->backing),
+        .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    if (s->is_backing) {
-        bs->backing = NULL;
-    } else {
-        bs->file = NULL;
-    }
+    *childp = NULL;
 }
 
 /*
@@ -4950,7 +4957,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_tran(c, to, tran);
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -5099,7 +5106,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(child, new_bs, tran);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.33.1


