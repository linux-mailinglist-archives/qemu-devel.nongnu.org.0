Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE3361FA17
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os56t-0005T2-SS; Mon, 07 Nov 2022 11:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56r-0005QO-1q; Mon, 07 Nov 2022 11:36:29 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56o-0008Sc-3D; Mon, 07 Nov 2022 11:36:28 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id B2D02608A6;
 Mon,  7 Nov 2022 19:36:12 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:7318::1:29])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6oMWGH9or4-aBNCJ1rm; Mon, 07 Nov 2022 19:36:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667838971; bh=d/6W19azstujcDObR70ENetfPW6mRbE1NUxU6QlS31c=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=cEW6VCTQEpRx+noI6qkpLLdNkgSTvIA9oX7zOTEXtS5ORGu3xYe9gfqi19RAkw/kS
 O71hdx8gzXI4E2baFvfabiZ6EUBhQCUlPrmtwSzdGZSlK6gJMiAiY3KHtU2WzWoxu4
 l1jVmLJvQM/dMFtN3KZGKJzrCJDUFcY5hWBlh+cA=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v8 1/4] block: drop bdrv_detach_child()
Date: Mon,  7 Nov 2022 19:35:55 +0300
Message-Id: <20221107163558.618889-2-vsementsov@yandex-team.ru>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The only caller is bdrv_root_unref_child(), let's just do the logic
directly in it. It simplifies further convertion of
bdrv_root_unref_child() to transaction action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index 3bd594eb2a..65f5bb96ed 100644
--- a/block.c
+++ b/block.c
@@ -3060,30 +3060,6 @@ static BdrvChild *bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     tran, errp);
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /*
-         * When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext
-         */
-        bdrv_try_change_aio_context(old_bs, qemu_get_aio_context(), NULL, NULL);
-    }
-}
-
 /*
  * This function steals the reference to child_bs from the caller.
  * That reference is later dropped by bdrv_root_unref_child().
@@ -3172,12 +3148,28 @@ out:
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-    BlockDriverState *child_bs;
+    BlockDriverState *child_bs = child->bs;
 
     GLOBAL_STATE_CODE();
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
+
+    if (child_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(child_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_change_aio_context(child_bs, qemu_get_aio_context(), NULL,
+                                    NULL);
+    }
 
-    child_bs = child->bs;
-    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.34.1


