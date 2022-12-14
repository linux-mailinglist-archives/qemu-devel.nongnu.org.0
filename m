Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FEA64CBA0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:52:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S4r-00047L-SV; Wed, 14 Dec 2022 08:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4S-00041c-AE
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4P-0003Lo-T9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0o2/IljwoVRQBbHlEGwWv7CGjx3P7gNcdjAVe3dzVw=;
 b=ZSnCn/6AB9YPZqD7a/qJByzBSFTnm1mUERtAhybvt+ghJwkLlJbh/7YjvQS5zLPowqx6qJ
 IVXRhMj4KmO30zfkWgc2toSpS+/mkvkmBRqhg/WANcDAGMCGyKtHH+dXUI8ut3eGjGXQK4
 ZOnmTJDn6OJu3z7OrVYCuDGZXbsM524=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-qgCkVSORN16gusCBIngyyQ-1; Wed, 14 Dec 2022 08:45:11 -0500
X-MC-Unique: qgCkVSORN16gusCBIngyyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F67B2A2AD70;
 Wed, 14 Dec 2022 13:45:11 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C572014171BE;
 Wed, 14 Dec 2022 13:45:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/51] block: bdrv_refresh_perms(): allow external tran
Date: Wed, 14 Dec 2022 14:44:05 +0100
Message-Id: <20221214134453.31665-4-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Allow passing external Transaction pointer, stop creating extra
Transaction objects.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221107163558.618889-4-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index dc761209ac..f2f9178832 100644
--- a/block.c
+++ b/block.c
@@ -2591,15 +2591,24 @@ char *bdrv_perm_names(uint64_t perm)
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
@@ -2615,7 +2624,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
 
     bdrv_child_set_perm(c, perm, shared, tran);
 
-    ret = bdrv_refresh_perms(c->bs, &local_err);
+    ret = bdrv_refresh_perms(c->bs, tran, &local_err);
 
     tran_finalize(tran, ret);
 
@@ -3099,7 +3108,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(child_bs, errp);
+    ret = bdrv_refresh_perms(child_bs, tran, errp);
 
 out:
     tran_finalize(tran, ret);
@@ -3140,7 +3149,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(parent_bs, errp);
+    ret = bdrv_refresh_perms(parent_bs, tran, errp);
     if (ret < 0) {
         goto out;
     }
@@ -3168,7 +3177,7 @@ void bdrv_root_unref_child(BdrvChild *child)
          * we're loosening restrictions. Errors of permission update are not
          * fatal in this case, ignore them.
          */
-        bdrv_refresh_perms(child_bs, NULL);
+        bdrv_refresh_perms(child_bs, NULL, NULL);
 
         /*
          * When the parent requiring a non-default AioContext is removed, the
@@ -3410,7 +3419,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, errp);
+    ret = bdrv_refresh_perms(bs, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5223,7 +5232,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, errp);
+    ret = bdrv_refresh_perms(bs_new, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -6523,7 +6532,7 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        ret = bdrv_refresh_perms(bs, errp);
+        ret = bdrv_refresh_perms(bs, NULL, errp);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
@@ -6668,7 +6677,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
      * We only tried to loosen restrictions, so errors are not fatal, ignore
      * them.
      */
-    bdrv_refresh_perms(bs, NULL);
+    bdrv_refresh_perms(bs, NULL, NULL);
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.38.1


