Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7872836F967
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:36:52 +0200 (CEST)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRRz-0007tY-EA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQl8-0004X2-T1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQl6-0002di-VI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uujivRkrbPDnFSGK1q8xTJNc+5yDY0Si153FM8Fn30w=;
 b=RAlXith8Pn24S6Qb0zcD+MQZLx7VzAiqXx9ZXF1S+4linsqBKS77eGLj6eneye0znNWS/I
 njzMux8jyWFX/0W/UdYPJSx/olpXSmqLp2h3jAESNHheNIQeNe+r3iqcpp9sWTxJH5AzrB
 Qhhfa16pzFk8xmOV3jdmRd1WQqJRG0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-4wPIzq-aOSSmrtTvh16cPg-1; Fri, 30 Apr 2021 06:52:29 -0400
X-MC-Unique: 4wPIzq-aOSSmrtTvh16cPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18070612EF;
 Fri, 30 Apr 2021 10:52:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 765A967889;
 Fri, 30 Apr 2021 10:52:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/39] block: add bdrv_list_* permission update functions
Date: Fri, 30 Apr 2021 12:51:23 +0200
Message-Id: <20210430105147.125840-16-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Add new interface, allowing use of existing node list. It will be used
to fix bdrv_replace_node() in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-16-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 106 +++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 35 deletions(-)

diff --git a/block.c b/block.c
index ab7a4d13d8..98b7bc179c 100644
--- a/block.c
+++ b/block.c
@@ -2249,7 +2249,8 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children, Error **errp)
+                                GSList *ignore_children,
+                                Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2297,7 +2298,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, tran,
                             errp);
     if (ret < 0) {
         return ret;
@@ -2316,36 +2317,53 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
 }
 
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+/*
+ * If use_cumulative_perms is true, use cumulative_perms and
+ * cumulative_shared_perms for first element of the list. Otherwise just refresh
+ * all permissions.
+ */
+static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
+                                  bool use_cumulative_perms,
+                                  uint64_t cumulative_perms,
+                                  uint64_t cumulative_shared_perms,
+                                  GSList *ignore_children,
+                                  Transaction *tran, Error **errp)
 {
     int ret;
-    BlockDriverState *root = bs;
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
+    BlockDriverState *bs;
 
-    for ( ; list; list = list->next) {
+    if (use_cumulative_perms) {
         bs = list->data;
 
-        if (bs != root) {
-            if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
-                return -EINVAL;
-            }
+        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
+                                   cumulative_shared_perms,
+                                   ignore_children, tran, errp);
+        if (ret < 0) {
+            return ret;
+        }
 
-            bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                     &cumulative_shared_perms);
+        list = list->next;
+    }
+
+    for ( ; list; list = list->next) {
+        bs = list->data;
+
+        if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+            return -EINVAL;
         }
 
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, errp);
+                                   ignore_children, tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2354,6 +2372,23 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
+static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                           uint64_t cumulative_perms,
+                           uint64_t cumulative_shared_perms,
+                           GSList *ignore_children, Error **errp)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_check_perm_common(list, q, true, cumulative_perms,
+                                  cumulative_shared_perms, ignore_children,
+                                  NULL, errp);
+}
+
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
+{
+    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+}
+
 /*
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
@@ -2375,15 +2410,19 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
     }
 }
 
-static void bdrv_abort_perm_update(BlockDriverState *bs)
+static void bdrv_list_abort_perm_update(GSList *list)
 {
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-
     for ( ; list; list = list->next) {
         bdrv_node_abort_perm_update((BlockDriverState *)list->data);
     }
 }
 
+static void bdrv_abort_perm_update(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_abort_perm_update(list);
+}
+
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -2407,15 +2446,19 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs)
+static void bdrv_list_set_perm(GSList *list)
 {
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-
     for ( ; list; list = list->next) {
         bdrv_node_set_perm((BlockDriverState *)list->data);
     }
 }
 
+static void bdrv_set_perm(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_set_perm(list);
+}
+
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2523,20 +2566,13 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-    uint64_t perm, shared_perm;
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
 
-    if (bdrv_parent_perms_conflict(bs, NULL, errp)) {
-        return -EPERM;
-    }
-    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(bs);
-        return ret;
-    }
-    bdrv_set_perm(bs);
+    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    tran_finalize(tran, ret);
 
-    return 0;
+    return ret;
 }
 
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
-- 
2.30.2


