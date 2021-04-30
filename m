Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B336F95A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:31:34 +0200 (CEST)
Received: from localhost ([::1]:33932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRMr-0003v8-R3
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkw-00048A-7L
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkt-0002V7-LC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13YCM//OaNIcFYjzugElvCNiF9aiANOQj+ObS1anL5g=;
 b=Gb9LDr27xF6udWhMyJ+8aQeidHYggN22UaasT6+lwR4QfcdObjZ1lxPhrRZZ/P9UQX6wvy
 mdSBRTm1Px5k3cIVhZTCHggosjBjSgi/FiiMO48YTlM0H7fOWl18Zy56jxA/OhW86eNXoh
 aO4weZ9IkKN0EuldCJHjKAeXN0kmixc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-fmKnnhInMmC8A-gGziJUoA-1; Fri, 30 Apr 2021 06:52:16 -0400
X-MC-Unique: fmKnnhInMmC8A-gGziJUoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E9771898296;
 Fri, 30 Apr 2021 10:52:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E299117177;
 Fri, 30 Apr 2021 10:52:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/39] block: inline bdrv_child_*() permission functions calls
Date: Fri, 30 Apr 2021 12:51:20 +0200
Message-Id: <20210430105147.125840-13-kwolf@redhat.com>
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

Each of them has only one caller. Open-coding simplifies further
pemission-update system changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-13-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 59 +++++++++++++++++----------------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/block.c b/block.c
index 4511766825..e5af4cdae9 100644
--- a/block.c
+++ b/block.c
@@ -1974,11 +1974,11 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp);
-static void bdrv_child_abort_perm_update(BdrvChild *c);
-static void bdrv_child_set_perm(BdrvChild *c);
+static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  uint64_t new_used_perm,
+                                  uint64_t new_shared_perm,
+                                  GSList *ignore_children,
+                                  Error **errp);
 
 typedef struct BlockReopenQueueEntry {
      bool prepared;
@@ -2226,15 +2226,21 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
+        GSList *cur_ignore_children;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
-                                    errp);
+
+        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
+        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
+                                     cur_ignore_children, errp);
+        g_slist_free(cur_ignore_children);
         if (ret < 0) {
             return ret;
         }
+
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
     }
 
     return 0;
@@ -2261,7 +2267,8 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_abort_perm_update(c);
+        bdrv_child_set_perm_abort(c);
+        bdrv_abort_perm_update(c->bs);
     }
 }
 
@@ -2290,7 +2297,8 @@ static void bdrv_set_perm(BlockDriverState *bs)
 
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm(c);
+        bdrv_child_set_perm_commit(c);
+        bdrv_set_perm(c->bs);
     }
 }
 
@@ -2398,39 +2406,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            ignore_children, errp);
 }
 
-/* Needs to be followed by a call to either bdrv_child_set_perm() or
- * bdrv_child_abort_perm_update(). */
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp)
-{
-    int ret;
-
-    ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-    ret = bdrv_check_update_perm(c->bs, q, perm, shared, ignore_children, errp);
-    g_slist_free(ignore_children);
-
-    if (ret < 0) {
-        return ret;
-    }
-
-    bdrv_child_set_perm_safe(c, perm, shared, NULL);
-
-    return 0;
-}
-
-static void bdrv_child_set_perm(BdrvChild *c)
-{
-    bdrv_child_set_perm_commit(c);
-    bdrv_set_perm(c->bs);
-}
-
-static void bdrv_child_abort_perm_update(BdrvChild *c)
-{
-    bdrv_child_set_perm_abort(c);
-    bdrv_abort_perm_update(c->bs);
-}
-
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-- 
2.30.2


