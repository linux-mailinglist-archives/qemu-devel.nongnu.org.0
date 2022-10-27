Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3A6101B1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:32:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hM-0003Ao-8t; Thu, 27 Oct 2022 14:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gK-0001nU-36
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g9-0002SH-VF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4QLac7pLdw10fb7UyiSTydb+UgZkfJ8hIIVDaPJTBw=;
 b=Pcd+avAdC34M+3uYYR9DHKKqI9ijm7f7PHu9E3pwrZTjj+PXYJIb1EUuPBQXgoSN5n/0jb
 unqx4mQR/J5KvQpbLNpzSe9NNSRHrdWXIOYE+Z6Hqp61qyJPU28+iRV/G9SgApLcdsuNtC
 +GPuzLxjahuEmok7VHmDCCPrtrH+laY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-x4PLYwahMa-3EWxvAu7c0g-1; Thu, 27 Oct 2022 14:32:30 -0400
X-MC-Unique: x4PLYwahMa-3EWxvAu7c0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCC74833AF0;
 Thu, 27 Oct 2022 18:32:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169181121320;
 Thu, 27 Oct 2022 18:32:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 19/58] Revert "block: Pass BdrvChild ** to replace_child_noperm"
Date: Thu, 27 Oct 2022 20:31:07 +0200
Message-Id: <20221027183146.463129-20-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit be64bbb0149748f3999c49b13976aafb8330ea86.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-13-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 2f80b7e094..683a9e0eff 100644
--- a/block.c
+++ b/block.c
@@ -90,7 +90,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_replace_child_noperm(BdrvChild **child,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
@@ -2359,7 +2359,7 @@ static void bdrv_replace_child_abort(void *opaque)
 
     GLOBAL_STATE_CODE();
     /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(&s->child, s->old_bs);
+    bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2389,7 +2389,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(&child, new_bs);
+    bdrv_replace_child_noperm(child, new_bs);
     /* old_bs reference is transparently moved from @child to @s */
 }
 
@@ -2771,10 +2771,9 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-static void bdrv_replace_child_noperm(BdrvChild **childp,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
 {
-    BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
@@ -2872,7 +2871,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BlockDriverState *bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(s->child, NULL);
+    bdrv_replace_child_noperm(child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2973,7 +2972,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
     *child = new_child;
 
@@ -3029,13 +3028,13 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild **childp)
+static void bdrv_detach_child(BdrvChild *child)
 {
-    BlockDriverState *old_bs = (*childp)->bs;
+    BlockDriverState *old_bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(childp, NULL);
-    bdrv_child_free(*childp);
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
 
     if (old_bs) {
         /*
@@ -3147,7 +3146,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     GLOBAL_STATE_CODE();
 
     child_bs = child->bs;
-    bdrv_detach_child(&child);
+    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.37.3


