Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539BB36F989
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:46:13 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRb2-0007nu-CJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0004zz-NS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlf-0002sl-QJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgAN6WwRpVPXooRzVSttfxf/iqTBDnayyFY0N31nMr4=;
 b=h4eSsOxCmR4Np7OiQTb9ImOcTd+uQhTq72h1gA//CVPN+BjFTDy9Lz0hBqZZlesLslyNJZ
 cZoHOyUO16LE+246irsshGeslC1WkAIIeYhDAG8zFPHloDzIOqNeFDrWEx2rcDC1hlh8sC
 Z9vlVw0VBJAy9FckDxjwz+7ecEpCaCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-miSiKfnjMwmN71XrsBXN9A-1; Fri, 30 Apr 2021 06:53:03 -0400
X-MC-Unique: miSiKfnjMwmN71XrsBXN9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C61804759;
 Fri, 30 Apr 2021 10:53:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F68979828;
 Fri, 30 Apr 2021 10:53:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/39] block: add bdrv_attach_child_common() transaction action
Date: Fri, 30 Apr 2021 12:51:26 +0200
Message-Id: <20210430105147.125840-19-kwolf@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Split out no-perm part of bdrv_root_attach_child() into separate
transaction action. bdrv_root_attach_child() now moves to new
permission update paradigm: first update graph relations then update
permissions.

qsd-jobs test output updated. Seems now permission update goes in
another order. Still, the test comment say that we only want to check
that command doesn't crash, and it's still so.

Error message is a bit misleading as it looks like job was added first.
But actually in new paradigm of graph update we can't distinguish such
things. We should update the error message, but let's not do it now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210428151804.439460-19-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                               | 190 ++++++++++++++++++--------
 tests/qemu-iotests/tests/qsd-jobs.out |   2 +-
 2 files changed, 137 insertions(+), 55 deletions(-)

diff --git a/block.c b/block.c
index 6040b9dea0..4d5c60f2ae 100644
--- a/block.c
+++ b/block.c
@@ -2955,37 +2955,74 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 }
 
-/*
- * This function steals the reference to child_bs from the caller.
- * That reference is later dropped by bdrv_root_unref_child().
- *
- * On failure NULL is returned, errp is set and the reference to
- * child_bs is also dropped.
- *
- * The caller must hold the AioContext lock @child_bs, but not that of @ctx
- * (unless @child_bs is already in @ctx).
- */
-BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
-                                  const char *child_name,
-                                  const BdrvChildClass *child_class,
-                                  BdrvChildRole child_role,
-                                  uint64_t perm, uint64_t shared_perm,
-                                  void *opaque, Error **errp)
+static void bdrv_remove_empty_child(BdrvChild *child)
 {
-    BdrvChild *child;
-    Error *local_err = NULL;
-    int ret;
-    AioContext *ctx;
+    assert(!child->bs);
+    QLIST_SAFE_REMOVE(child, next);
+    g_free(child->name);
+    g_free(child);
+}
 
-    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(child_bs);
-        bdrv_unref(child_bs);
-        return NULL;
+typedef struct BdrvAttachChildCommonState {
+    BdrvChild **child;
+    AioContext *old_parent_ctx;
+    AioContext *old_child_ctx;
+} BdrvAttachChildCommonState;
+
+static void bdrv_attach_child_common_abort(void *opaque)
+{
+    BdrvAttachChildCommonState *s = opaque;
+    BdrvChild *child = *s->child;
+    BlockDriverState *bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
+
+    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
+        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
     }
 
-    child = g_new(BdrvChild, 1);
-    *child = (BdrvChild) {
+    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+        GSList *ignore = g_slist_prepend(NULL, child);
+
+        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
+                                      &error_abort);
+        g_slist_free(ignore);
+        ignore = g_slist_prepend(NULL, child);
+        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+
+        g_slist_free(ignore);
+    }
+
+    bdrv_unref(bs);
+    bdrv_remove_empty_child(child);
+    *s->child = NULL;
+}
+
+static TransactionActionDrv bdrv_attach_child_common_drv = {
+    .abort = bdrv_attach_child_common_abort,
+    .clean = g_free,
+};
+
+/*
+ * Common part of attaching bdrv child to bs or to blk or to job
+ */
+static int bdrv_attach_child_common(BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    uint64_t perm, uint64_t shared_perm,
+                                    void *opaque, BdrvChild **child,
+                                    Transaction *tran, Error **errp)
+{
+    BdrvChild *new_child;
+    AioContext *parent_ctx;
+    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
+
+    assert(child);
+    assert(*child == NULL);
+
+    new_child = g_new(BdrvChild, 1);
+    *new_child = (BdrvChild) {
         .bs             = NULL,
         .name           = g_strdup(child_name),
         .klass          = child_class,
@@ -2995,37 +3032,92 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
-    ctx = bdrv_child_get_parent_aio_context(child);
-
-    /* If the AioContexts don't match, first try to move the subtree of
+    /*
+     * If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
-     * try moving the parent into the AioContext of child_bs instead. */
-    if (bdrv_get_aio_context(child_bs) != ctx) {
-        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
+     * try moving the parent into the AioContext of child_bs instead.
+     */
+    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
+    if (child_ctx != parent_ctx) {
+        Error *local_err = NULL;
+        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
+
         if (ret < 0 && child_class->can_set_aio_ctx) {
-            GSList *ignore = g_slist_prepend(NULL, child);
-            ctx = bdrv_get_aio_context(child_bs);
-            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
+            GSList *ignore = g_slist_prepend(NULL, new_child);
+            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
+                                             NULL))
+            {
                 error_free(local_err);
                 ret = 0;
                 g_slist_free(ignore);
-                ignore = g_slist_prepend(NULL, child);
-                child_class->set_aio_ctx(child, ctx, &ignore);
+                ignore = g_slist_prepend(NULL, new_child);
+                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
             }
             g_slist_free(ignore);
         }
+
         if (ret < 0) {
             error_propagate(errp, local_err);
-            g_free(child);
-            bdrv_abort_perm_update(child_bs);
-            bdrv_unref(child_bs);
-            return NULL;
+            bdrv_remove_empty_child(new_child);
+            return ret;
         }
     }
 
-    /* This performs the matching bdrv_set_perm() for the above check. */
-    bdrv_replace_child(child, child_bs);
+    bdrv_ref(child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
+    *child = new_child;
+
+    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
+    *s = (BdrvAttachChildCommonState) {
+        .child = child,
+        .old_parent_ctx = parent_ctx,
+        .old_child_ctx = child_ctx,
+    };
+    tran_add(tran, &bdrv_attach_child_common_drv, s);
+
+    return 0;
+}
+
+static void bdrv_detach_child(BdrvChild *child)
+{
+    bdrv_replace_child(child, NULL);
+    bdrv_remove_empty_child(child);
+}
+
+/*
+ * This function steals the reference to child_bs from the caller.
+ * That reference is later dropped by bdrv_root_unref_child().
+ *
+ * On failure NULL is returned, errp is set and the reference to
+ * child_bs is also dropped.
+ *
+ * The caller must hold the AioContext lock @child_bs, but not that of @ctx
+ * (unless @child_bs is already in @ctx).
+ */
+BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
+                                  const char *child_name,
+                                  const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
+                                  uint64_t perm, uint64_t shared_perm,
+                                  void *opaque, Error **errp)
+{
+    int ret;
+    BdrvChild *child = NULL;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, opaque,
+                                   &child, tran, errp);
+    if (ret < 0) {
+        bdrv_unref(child_bs);
+        return NULL;
+    }
+
+    ret = bdrv_refresh_perms(child_bs, errp);
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
     return child;
 }
 
@@ -3067,16 +3159,6 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     return child;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    QLIST_SAFE_REMOVE(child, next);
-
-    bdrv_replace_child(child, NULL);
-
-    g_free(child->name);
-    g_free(child);
-}
-
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 5f41491e05..9f52255da8 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -16,7 +16,7 @@ QMP_VERSION
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by a block device as 'root', which uses 'write' on fmt_base"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.30.2


