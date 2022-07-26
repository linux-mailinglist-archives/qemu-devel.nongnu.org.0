Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE434581B11
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:30:48 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRCZ-0005ec-PE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQun-0001LO-CP; Tue, 26 Jul 2022 16:12:25 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQuj-0001Hq-Sn; Tue, 26 Jul 2022 16:12:23 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 57D182E0C7C;
 Tue, 26 Jul 2022 23:12:12 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-CBO028tv; Tue, 26 Jul 2022 23:12:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866331; bh=0TCakQ4ndmZLdd1cOsw/z2YQaMII6NoaA7Hn15EFnfQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=i/3QNdoKJVHmiTOYc5ye5RHifw0vMtVhQIMsLnvk64M97YwLle8v0KyV6F8y5RZQA
 umhg3d5o3+KBqaqiuxlhAcOfAwJM+walLPjRVcbM6B9FF5ZUOze37ryAwmiLfpqLlS
 a/K2zzII13Z6Nvd9mkpXF7+wGgQ2R1VxipcDQpdg=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 15/15] block: refactor bdrv_remove_file_or_backing_child to
 bdrv_remove_child
Date: Tue, 26 Jul 2022 23:11:34 +0300
Message-Id: <20220726201134.924743-16-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now the function can remove any child, so give it more common name.
Drop assertions and drop bs argument which becomes unused. Function
would be reused in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/block.c b/block.c
index 3343dc5649..55cff270f8 100644
--- a/block.c
+++ b/block.c
@@ -92,9 +92,7 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran);
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3337,7 +3335,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+        bdrv_remove_child(child, tran);
     }
 
     if (!child_bs) {
@@ -5021,26 +5019,19 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
+static void bdrv_remove_child_commit(void *opaque)
 {
     GLOBAL_STATE_CODE();
     bdrv_child_free(opaque);
 }
 
-static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .commit = bdrv_remove_filter_or_cow_child_commit,
+static TransactionActionDrv bdrv_remove_child_drv = {
+    .commit = bdrv_remove_child_commit,
 };
 
-/*
- * A function to remove backing or file child of @bs.
- * Function doesn't update permissions, caller is responsible for this.
- */
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran)
+/* Function doesn't update permissions, caller is responsible for this. */
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
 {
-    assert(child == bs->backing || child == bs->file);
-
     if (!child) {
         return;
     }
@@ -5049,7 +5040,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
+    tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
 /*
@@ -5060,7 +5051,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
-    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
 }
 
 static int bdrv_replace_node_noperm(BlockDriverState *from,
-- 
2.25.1


