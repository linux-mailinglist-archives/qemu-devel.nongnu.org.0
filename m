Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2536F9A4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:53:56 +0200 (CEST)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRiU-00084r-MK
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm6-0005VZ-0E
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm1-00033F-LB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpr8gabRkcLG7L31OTWG/Hc0C0zIVLQXhXt7NP3YHJc=;
 b=GNvBRD3q9WIAbYCk4+eRSPqjPq9ImBbDWk/Npoy1kAvtAYD85pWNhmmcPAr3E6URorS69I
 oa/e9KmqZkSYqriWHpVdIfT1c9W0fX8qVNmy/BA6ln5e6qGbRYBUzpas46SQ3rlqwGo5Hs
 yCXy2evXrDCkKKr4knFJyba4hmZp0sg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-C5DVH2ClNyib9gxcYU4AvQ-1; Fri, 30 Apr 2021 06:53:26 -0400
X-MC-Unique: C5DVH2ClNyib9gxcYU4AvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22AEA801106;
 Fri, 30 Apr 2021 10:53:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 335AE17177;
 Fri, 30 Apr 2021 10:53:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 34/39] block: refactor bdrv_child_set_perm_safe() transaction
 action
Date: Fri, 30 Apr 2021 12:51:42 +0200
Message-Id: <20210430105147.125840-35-kwolf@redhat.com>
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

Old interfaces dropped, nobody directly calls
bdrv_child_set_perm_abort() and bdrv_child_set_perm_commit(), so we can
use personal state structure for the action and stop exploiting
BdrvChild structure. Also, drop "_safe" suffix which is redundant now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-35-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h |  5 ----
 block.c                   | 63 ++++++++++++++-------------------------
 2 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index dd2de6bd1d..c823f5b1b3 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -813,11 +813,6 @@ struct BdrvChild {
      */
     uint64_t shared_perm;
 
-    /* backup of permissions during permission update procedure */
-    bool has_backup_perm;
-    uint64_t backup_perm;
-    uint64_t backup_shared_perm;
-
     /*
      * This link is frozen: the child can neither be replaced nor
      * detached from the parent.
diff --git a/block.c b/block.c
index 2362c934a4..7b2a8844f6 100644
--- a/block.c
+++ b/block.c
@@ -2135,59 +2135,40 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
     return g_slist_prepend(list, bs);
 }
 
-static void bdrv_child_set_perm_commit(void *opaque)
-{
-    BdrvChild *c = opaque;
-
-    c->has_backup_perm = false;
-}
+typedef struct BdrvChildSetPermState {
+    BdrvChild *child;
+    uint64_t old_perm;
+    uint64_t old_shared_perm;
+} BdrvChildSetPermState;
 
 static void bdrv_child_set_perm_abort(void *opaque)
 {
-    BdrvChild *c = opaque;
-    /*
-     * We may have child->has_backup_perm unset at this point, as in case of
-     * _check_ stage of permission update failure we may _check_ not the whole
-     * subtree.  Still, _abort_ is called on the whole subtree anyway.
-     */
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
+    BdrvChildSetPermState *s = opaque;
+
+    s->child->perm = s->old_perm;
+    s->child->shared_perm = s->old_shared_perm;
 }
 
 static TransactionActionDrv bdrv_child_set_pem_drv = {
     .abort = bdrv_child_set_perm_abort,
-    .commit = bdrv_child_set_perm_commit,
+    .clean = g_free,
 };
 
-/*
- * With tran=NULL needs to be followed by direct call to either
- * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
- *
- * With non-NULL tran needs to be followed by tran_abort() or tran_commit()
- * instead.
- */
-static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
-                                     uint64_t shared, Transaction *tran)
+static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm,
+                                uint64_t shared, Transaction *tran)
 {
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same c twice during check_perm procedure
-     */
+    BdrvChildSetPermState *s = g_new(BdrvChildSetPermState, 1);
+
+    *s = (BdrvChildSetPermState) {
+        .child = c,
+        .old_perm = c->perm,
+        .old_shared_perm = c->shared_perm,
+    };
 
     c->perm = perm;
     c->shared_perm = shared;
 
-    if (tran) {
-        tran_add(tran, &bdrv_child_set_pem_drv, c);
-    }
+    tran_add(tran, &bdrv_child_set_pem_drv, s);
 }
 
 static void bdrv_drv_set_perm_commit(void *opaque)
@@ -2367,7 +2348,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
+        bdrv_child_set_perm(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
@@ -2466,7 +2447,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
-    bdrv_child_set_perm_safe(c, perm, shared, tran);
+    bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
 
-- 
2.30.2


