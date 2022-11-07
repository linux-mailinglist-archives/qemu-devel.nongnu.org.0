Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D361FA18
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os56y-0005aR-IP; Mon, 07 Nov 2022 11:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56v-0005X6-76; Mon, 07 Nov 2022 11:36:33 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1os56t-0000vO-Ih; Mon, 07 Nov 2022 11:36:32 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 8C5475F596;
 Mon,  7 Nov 2022 19:36:13 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:7318::1:29])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6oMWGH9or4-aCNCJsIM; Mon, 07 Nov 2022 19:36:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667838972; bh=4bqrvJC6j/nEcfgskbdizX61P6fUjTH4OVfUTvvL0wU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=1H+n0SS269Xbz7uj13Lx7M/kZpfmJZH9gbmIboqmwCgZSmYjSTiVJEAmdti+PjLRl
 ULqeqVrOvERVCVOpwsIrFIYwPM4LgsX/w2gEgKzBG0LAI7bXdU6uQjb7ecWPstF1c2
 DharAmBu0QRuyyb91EZ1YQsyk1YE1ENzBpsWm3co=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v8 2/4] block: drop bdrv_remove_filter_or_cow_child
Date: Mon,  7 Nov 2022 19:35:56 +0300
Message-Id: <20221107163558.618889-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107163558.618889-1-vsementsov@yandex-team.ru>
References: <20221107163558.618889-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

Drop this simple wrapper used only in one place. We have too many graph
modifying functions even without it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 65f5bb96ed..8acff7983d 100644
--- a/block.c
+++ b/block.c
@@ -93,8 +93,6 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
@@ -5055,17 +5053,6 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
-/*
- * A function to remove backing-chain child of @bs if exists: cow child for
- * format nodes (always .backing) and filter child for filters (may be .file or
- * .backing)
- */
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran)
-{
-    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
-}
-
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
@@ -5150,7 +5137,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     }
 
     if (detach_subchain) {
-        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.34.1


