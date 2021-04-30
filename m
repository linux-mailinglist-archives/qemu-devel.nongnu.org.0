Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E536F97C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:41:16 +0200 (CEST)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRWF-0003q0-LX
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm4-0005Rv-JM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm1-00032z-7R
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzteYmPsxwSYpl9R4TLvqic/2NwMJ9RrqyiM56p5kzc=;
 b=JfFDf+pkaVodRqJtisOqTtcfNhUaPaBiZPMlaPXaICob2rhKZMCmMUk+I2FMoPwK4ouVmO
 GchE+jfoS4RaMAf9q2CRcI+fX462fo0I7se6dh9ENWz8nDR46Os9sWfvrcYlQEdiFeqIkR
 JTVNjel2zAN5vKqJpAEacHBpPkyx1Yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-V58Kuk-8Odm2_xGFRA3lOg-1; Fri, 30 Apr 2021 06:53:25 -0400
X-MC-Unique: V58Kuk-8Odm2_xGFRA3lOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E196F106BAF2;
 Fri, 30 Apr 2021 10:53:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F12265F707;
 Fri, 30 Apr 2021 10:53:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 33/39] block: inline bdrv_replace_child()
Date: Fri, 30 Apr 2021 12:51:41 +0200
Message-Id: <20210430105147.125840-34-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bdrv_replace_child() has only one caller, the second argument is
unused. Inline it now. This triggers deletion of some more unused
interfaces.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-34-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 101 ++++++++++----------------------------------------------
 1 file changed, 18 insertions(+), 83 deletions(-)

diff --git a/block.c b/block.c
index 38bd2ea32e..2362c934a4 100644
--- a/block.c
+++ b/block.c
@@ -2401,42 +2401,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static void bdrv_node_set_perm(BlockDriverState *bs)
-{
-    BlockDriver *drv = bs->drv;
-    BdrvChild *c;
-
-    if (!drv) {
-        return;
-    }
-
-    bdrv_drv_set_perm_commit(bs);
-
-    /* Drivers that never have children can omit .bdrv_child_perm() */
-    if (!drv->bdrv_child_perm) {
-        assert(QLIST_EMPTY(&bs->children));
-        return;
-    }
-
-    /* Update all children */
-    QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm_commit(c);
-    }
-}
-
-static void bdrv_list_set_perm(GSList *list)
-{
-    for ( ; list; list = list->next) {
-        bdrv_node_set_perm((BlockDriverState *)list->data);
-    }
-}
-
-static void bdrv_set_perm(BlockDriverState *bs)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_list_set_perm(list);
-}
-
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2776,52 +2740,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
 }
 
-/*
- * Updates @child to change its reference to point to @new_bs, including
- * checking and applying the necessary permission updates both to the old node
- * and to @new_bs.
- *
- * NULL is passed as @new_bs for removing the reference before freeing @child.
- *
- * If @new_bs is not NULL, bdrv_check_perm() must be called beforehand, as this
- * function uses bdrv_set_perm() to update the permissions according to the new
- * reference that @new_bs gets.
- *
- * Callers must ensure that child->frozen is false.
- */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    /* Asserts that child->frozen == false */
-    bdrv_replace_child_noperm(child, new_bs);
-
-    /*
-     * Start with the new node's permissions.  If @new_bs is a (direct
-     * or indirect) child of @old_bs, we must complete the permission
-     * update on @new_bs before we loosen the restrictions on @old_bs.
-     * Otherwise, bdrv_check_perm() on @old_bs would re-initiate
-     * updating the permissions of @new_bs, and thus not purely loosen
-     * restrictions.
-     */
-    if (new_bs) {
-        bdrv_set_perm(new_bs);
-    }
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /* When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
-    }
-}
-
 static void bdrv_child_free(void *opaque)
 {
     BdrvChild *c = opaque;
@@ -2989,8 +2907,25 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 
 static void bdrv_detach_child(BdrvChild *child)
 {
-    bdrv_replace_child(child, NULL);
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
     bdrv_remove_empty_child(child);
+
+    if (old_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(old_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
+    }
 }
 
 /*
-- 
2.30.2


