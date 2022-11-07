Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924761FA16
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os56w-0005Y8-7p; Mon, 07 Nov 2022 11:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56t-0005Sn-4e; Mon, 07 Nov 2022 11:36:31 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56n-0000AG-O7; Mon, 07 Nov 2022 11:36:30 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 6AABB608DC;
 Mon,  7 Nov 2022 19:36:14 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:7318::1:29])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6oMWGH9or4-aDNCxf6A; Mon, 07 Nov 2022 19:36:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667838973; bh=c0FmKDdh4DOiEKkRdDWJq16mgKzvoqtsFukHeTA6gmY=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=JXVWzL+vW+GVN+zNU6HmiIveMs5fjPQWv/vWJ0q+kyAUhk3K7iGtHDua+t1DVaHMC
 gX9j3kzmVZ7b0QRQHCbBYgfO6b4/D888JC5vTulaEnbxLKyQ2+YZqXXBgdK+y+8Y09
 Lq9BO/ydvWmShlOvqEm7KDbQV0FCJMxd2ofmgQ5Y=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v8 3/4] block: bdrv_refresh_perms(): allow external tran
Date: Mon,  7 Nov 2022 19:35:57 +0300
Message-Id: <20221107163558.618889-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107163558.618889-1-vsementsov@yandex-team.ru>
References: <20221107163558.618889-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

Allow passing external Transaction pointer, stop creating extra
Transaction objects.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 8acff7983d..eed54f968d 100644
--- a/block.c
+++ b/block.c
@@ -2581,15 +2581,24 @@ char *bdrv_perm_names(uint64_t perm)
 }
 
 
-static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
+                              Error **errp)
 {
     int ret;
-    Transaction *tran = tran_new();
+    Transaction *local_tran = NULL;
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
     GLOBAL_STATE_CODE();
 
+    if (!tran) {
+        tran = local_tran = tran_new();
+    }
+
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
-    tran_finalize(tran, ret);
+
+    if (local_tran) {
+        tran_finalize(local_tran, ret);
+    }
 
     return ret;
 }
@@ -2605,7 +2614,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
 
     bdrv_child_set_perm(c, perm, shared, tran);
 
-    ret = bdrv_refresh_perms(c->bs, &local_err);
+    ret = bdrv_refresh_perms(c->bs, tran, &local_err);
 
     tran_finalize(tran, ret);
 
@@ -3089,7 +3098,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(child_bs, errp);
+    ret = bdrv_refresh_perms(child_bs, tran, errp);
 
 out:
     tran_finalize(tran, ret);
@@ -3130,7 +3139,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(parent_bs, errp);
+    ret = bdrv_refresh_perms(parent_bs, tran, errp);
     if (ret < 0) {
         goto out;
     }
@@ -3158,7 +3167,7 @@ void bdrv_root_unref_child(BdrvChild *child)
          * we're loosening restrictions. Errors of permission update are not
          * fatal in this case, ignore them.
          */
-        bdrv_refresh_perms(child_bs, NULL);
+        bdrv_refresh_perms(child_bs, NULL, NULL);
 
         /*
          * When the parent requiring a non-default AioContext is removed, the
@@ -3400,7 +3409,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, errp);
+    ret = bdrv_refresh_perms(bs, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5213,7 +5222,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, errp);
+    ret = bdrv_refresh_perms(bs_new, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -6513,7 +6522,7 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        ret = bdrv_refresh_perms(bs, errp);
+        ret = bdrv_refresh_perms(bs, NULL, errp);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
@@ -6658,7 +6667,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
      * We only tried to loosen restrictions, so errors are not fatal, ignore
      * them.
      */
-    bdrv_refresh_perms(bs, NULL);
+    bdrv_refresh_perms(bs, NULL, NULL);
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.34.1


