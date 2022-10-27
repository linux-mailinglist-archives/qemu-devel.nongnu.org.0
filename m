Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4D6101AE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:30:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hP-0003Tm-Ew; Thu, 27 Oct 2022 14:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gL-0001qP-SN
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gD-0002TE-DM
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYAlZOHBYOevW/Gsp5EqDFgsms2N9mt6LpiDPG1M3TQ=;
 b=BxAUvaWPH4I+womAzxDO0Db0y8NsRHFT9bwv+X3ueJoiYmKmlQE2K/jvRw/H7BEa+gAw8U
 ZtR8YAh0LSWvjV4EuDQ5ugjaOXaVjkNjcP/r8ab4NEfLdStYuRatM3+Wc+1UGQV20ds7bj
 c6HYJdT94eViiIfxys2KpMh0J1VrmFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-zTx6G_ZWNT6yebatph86Tg-1; Thu, 27 Oct 2022 14:32:33 -0400
X-MC-Unique: zTx6G_ZWNT6yebatph86Tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7B9D811E81;
 Thu, 27 Oct 2022 18:32:32 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22C551121320;
 Thu, 27 Oct 2022 18:32:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 22/58] block: refactor bdrv_remove_file_or_backing_child to
 bdrv_remove_child
Date: Thu, 27 Oct 2022 20:31:10 +0200
Message-Id: <20221027183146.463129-23-kwolf@redhat.com>
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

Now the function can remove any child, so give it more common name.
Drop assertions and drop bs argument which becomes unused. Function
would be reused in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-16-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/block.c b/block.c
index ed11a421b0..2d74bfe665 100644
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
 
@@ -3342,7 +3340,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+        bdrv_remove_child(child, tran);
     }
 
     if (!child_bs) {
@@ -5023,26 +5021,19 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
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
@@ -5051,7 +5042,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
+    tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
 /*
@@ -5062,7 +5053,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
-    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
 }
 
 static int bdrv_replace_node_noperm(BlockDriverState *from,
-- 
2.37.3


