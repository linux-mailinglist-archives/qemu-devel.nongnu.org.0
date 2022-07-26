Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C0581AF9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:24:15 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR6E-00037N-S0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQuj-0001Jp-9a; Tue, 26 Jul 2022 16:12:23 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:47364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQug-0001GF-6l; Tue, 26 Jul 2022 16:12:21 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 82F8F2E0DC5;
 Tue, 26 Jul 2022 23:12:08 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-C7O02it2; Tue, 26 Jul 2022 23:12:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866327; bh=ju7HSe4Rh57FfV8BcLgPnrNRqeYW0EA92gk1W4avp3w=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=aURYLLV9OoJptr1unua4+wFSv88Lgid8aMiTZDrXbAx/Bo9gHPuImgFNSYNr28ZT4
 2suG9lImokVyMVHwhGUUkc6eQPRRrDPRkY9IKlvEXuuKz1fKEMwp9XEFS7RvDqFwCA
 tNByI3prnZ6jZs0DUmJTM+OB3hEk5mPDIqmjiv1Q=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 12/15] Revert "block: Pass BdrvChild ** to
 replace_child_noperm"
Date: Tue, 26 Jul 2022 23:11:31 +0300
Message-Id: <20220726201134.924743-13-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit be64bbb0149748f3999c49b13976aafb8330ea86.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 5eefadf768..121affb045 100644
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
@@ -2354,7 +2354,7 @@ static void bdrv_replace_child_abort(void *opaque)
 
     GLOBAL_STATE_CODE();
     /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(&s->child, s->old_bs);
+    bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2384,7 +2384,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(&child, new_bs);
+    bdrv_replace_child_noperm(child, new_bs);
     /* old_bs reference is transparently moved from @child to @s */
 }
 
@@ -2766,10 +2766,9 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
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
@@ -2867,7 +2866,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BlockDriverState *bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(s->child, NULL);
+    bdrv_replace_child_noperm(child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2968,7 +2967,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
     *child = new_child;
 
@@ -3024,13 +3023,13 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
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
@@ -3142,7 +3141,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     GLOBAL_STATE_CODE();
 
     child_bs = child->bs;
-    bdrv_detach_child(&child);
+    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.25.1


