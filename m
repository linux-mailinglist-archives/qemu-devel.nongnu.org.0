Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5971D89B1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 22:59:12 +0200 (CEST)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jamqt-0005RD-Q8
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 16:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jammz-0008HK-9h
 for qemu-devel@nongnu.org; Mon, 18 May 2020 16:55:09 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37709
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jammy-0006bo-CF
 for qemu-devel@nongnu.org; Mon, 18 May 2020 16:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589835307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKOVl551gv1fTJac5BBNK4Rg52Nf2bIcS138TDdT2xk=;
 b=IrAXdm+l7LF18xYSHIQQd5uhOTkCYSvaCVYdsTClkKS7yINmvW7mrV4bdvSlPJaMzawTCY
 2bHRDAXap0utiKJgU92zf7eLC074nC5M4DjNx0f/qwmuh5OlcCpT1h/2Inh0i57PkVJKX+
 P/BMsh8z3s219cKyQfewIz9+YwdgayU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-qmm_3kQKNqC6QvTvXJDU8g-1; Mon, 18 May 2020 16:55:03 -0400
X-MC-Unique: qmm_3kQKNqC6QvTvXJDU8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8AC1009600;
 Mon, 18 May 2020 20:55:02 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0047959A;
 Mon, 18 May 2020 20:54:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] blockdev: Promote several bitmap functions to non-static
Date: Mon, 18 May 2020 15:54:46 -0500
Message-Id: <20200518205448.690566-6-eblake@redhat.com>
In-Reply-To: <20200518205448.690566-1-eblake@redhat.com>
References: <20200518205448.690566-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 16:37:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patch will split blockdev.c, which will require accessing
some previously-static functions from more than one .c file.  But part
of promoting a function to public is picking a naming scheme that does
not reek of exposing too many internals (two of the three functions
were named starting with 'do_').  To make future code motion easier,
perform the function rename and non-static promotion into its own
patch.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200513011648.166876-5-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 12 ++++++++++
 blockdev.c                | 47 ++++++++++++++++-----------------------
 2 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 786bd2d092ea..4810e6fa5f2c 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1345,4 +1345,16 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
                                             Error **errp);
 extern QemuOptsList bdrv_create_opts_simple;

+BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
+                                           const char *name,
+                                           BlockDriverState **pbs,
+                                           Error **errp);
+BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
+                                          BlockDirtyBitmapMergeSourceList *bms,
+                                          HBitmap **backup, Error **errp);
+BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
+                                           bool release,
+                                           BlockDriverState **bitmap_bs,
+                                           Error **errp);
+
 #endif /* BLOCK_INT_H */
diff --git a/blockdev.c b/blockdev.c
index b3c840ec0312..69a30613a3dd 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1197,10 +1197,10 @@ out_aio_context:
  *
  * @return: A bitmap object on success, or NULL on failure.
  */
-static BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
-                                                  const char *name,
-                                                  BlockDriverState **pbs,
-                                                  Error **errp)
+BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
+                                           const char *name,
+                                           BlockDriverState **pbs,
+                                           Error **errp)
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
@@ -2171,11 +2171,6 @@ static void block_dirty_bitmap_disable_abort(BlkActionState *common)
     }
 }

-static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(
-        const char *node, const char *target,
-        BlockDirtyBitmapMergeSourceList *bitmaps,
-        HBitmap **backup, Error **errp);
-
 static void block_dirty_bitmap_merge_prepare(BlkActionState *common,
                                              Error **errp)
 {
@@ -2189,15 +2184,11 @@ static void block_dirty_bitmap_merge_prepare(BlkActionState *common,

     action = common->action->u.block_dirty_bitmap_merge.data;

-    state->bitmap = do_block_dirty_bitmap_merge(action->node, action->target,
-                                                action->bitmaps, &state->backup,
-                                                errp);
+    state->bitmap = block_dirty_bitmap_merge(action->node, action->target,
+                                             action->bitmaps, &state->backup,
+                                             errp);
 }

-static BdrvDirtyBitmap *do_block_dirty_bitmap_remove(
-        const char *node, const char *name, bool release,
-        BlockDriverState **bitmap_bs, Error **errp);
-
 static void block_dirty_bitmap_remove_prepare(BlkActionState *common,
                                               Error **errp)
 {
@@ -2211,8 +2202,8 @@ static void block_dirty_bitmap_remove_prepare(BlkActionState *common,

     action = common->action->u.block_dirty_bitmap_remove.data;

-    state->bitmap = do_block_dirty_bitmap_remove(action->node, action->name,
-                                                 false, &state->bs, errp);
+    state->bitmap = block_dirty_bitmap_remove(action->node, action->name,
+                                              false, &state->bs, errp);
     if (state->bitmap) {
         bdrv_dirty_bitmap_skip_store(state->bitmap, true);
         bdrv_dirty_bitmap_set_busy(state->bitmap, true);
@@ -2504,9 +2495,10 @@ out:
     aio_context_release(aio_context);
 }

-static BdrvDirtyBitmap *do_block_dirty_bitmap_remove(
-        const char *node, const char *name, bool release,
-        BlockDriverState **bitmap_bs, Error **errp)
+BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
+                                           bool release,
+                                           BlockDriverState **bitmap_bs,
+                                           Error **errp)
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
@@ -2548,7 +2540,7 @@ static BdrvDirtyBitmap *do_block_dirty_bitmap_remove(
 void qmp_block_dirty_bitmap_remove(const char *node, const char *name,
                                    Error **errp)
 {
-    do_block_dirty_bitmap_remove(node, name, true, NULL, errp);
+    block_dirty_bitmap_remove(node, name, true, NULL, errp);
 }

 /**
@@ -2609,10 +2601,9 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
     bdrv_disable_dirty_bitmap(bitmap);
 }

-static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(
-        const char *node, const char *target,
-        BlockDirtyBitmapMergeSourceList *bitmaps,
-        HBitmap **backup, Error **errp)
+BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
+                                          BlockDirtyBitmapMergeSourceList *bms,
+                                          HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
@@ -2630,7 +2621,7 @@ static BdrvDirtyBitmap *do_block_dirty_bitmap_merge(
         return NULL;
     }

-    for (lst = bitmaps; lst; lst = lst->next) {
+    for (lst = bms; lst; lst = lst->next) {
         switch (lst->value->type) {
             const char *name, *node;
         case QTYPE_QSTRING:
@@ -2675,7 +2666,7 @@ void qmp_block_dirty_bitmap_merge(const char *node, const char *target,
                                   BlockDirtyBitmapMergeSourceList *bitmaps,
                                   Error **errp)
 {
-    do_block_dirty_bitmap_merge(node, target, bitmaps, NULL, errp);
+    block_dirty_bitmap_merge(node, target, bitmaps, NULL, errp);
 }

 BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
-- 
2.26.2


