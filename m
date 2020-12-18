Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3062DE65F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:18:49 +0100 (CET)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHWr-0007G4-0Y
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRO-0001dD-Bh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRL-0005Hk-OX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Zt+p4pJebC79I3akP94SypsVPg1h4mDGUxrQPDOUrE=;
 b=im/JfSaR3JcLeLTXKBTx/ddFcuaSfFbmN9ixlP0NY11q9g2UQtPekn539DxztkyHSe0nEg
 3jW1pdlJykftCvSGHUN14lRu2zZsSjEe8lb0rsCA6NhLPrGfXOBHDNrLe0uKKyeV1hlB/p
 aQH+zO8dm97UBt7wZ6XzKkUZMmTGn4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-KzKBU7fLN-GyK80P-Wp_Jw-1; Fri, 18 Dec 2020 10:13:01 -0500
X-MC-Unique: KzKBU7fLN-GyK80P-Wp_Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B0648030AD;
 Fri, 18 Dec 2020 15:13:00 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92EB72DACE;
 Fri, 18 Dec 2020 15:12:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/30] block: drop tighten_restrictions
Date: Fri, 18 Dec 2020 16:12:23 +0100
Message-Id: <20201218151249.715731-5-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The only users of this thing are:
 1. bdrv_child_try_set_perm, to ignore failures on loosen restrictions
 2. assertion in bdrv_replace_child
 3. assertion in bdrv_inactivate_recurse

Assertions are not enough reason for overcomplication the permission
update system. So, look at bdrv_child_try_set_perm.

We are interested in tighten_restrictions only on failure. But on
failure this field is not reliable: we may fail in the middle of
permission update, some nodes are not touched and we don't know should
their permissions be tighten or not. So, we rely on the fact that if we
loose restrictions on some node (or BdrvChild), we'll not tighten
restriction in the whole subtree as part of this update (assertions 2
and 3 rely on this fact as well). And, if we rely on this fact anyway,
we can just check it on top, and don't pass additional pointer through
the whole recursive infrastructure.

Note also, that further patches will fix real bugs in permission update
system, so now is good time to simplify it, as a help for further
refactorings.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201106124241.16950-8-vsementsov@virtuozzo.com>
[mreitz: Fixed rebase conflict]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 89 +++++++++++----------------------------------------------
 1 file changed, 17 insertions(+), 72 deletions(-)

diff --git a/block.c b/block.c
index f66388b9ea..b57421a969 100644
--- a/block.c
+++ b/block.c
@@ -1900,8 +1900,7 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 
 static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
                                  uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children,
-                                 bool *tighten_restrictions, Error **errp);
+                                 GSList *ignore_children, Error **errp);
 static void bdrv_child_abort_perm_update(BdrvChild *c);
 static void bdrv_child_set_perm(BdrvChild *c);
 
@@ -1974,43 +1973,18 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
  * permissions of all its parents. This involves checking whether all necessary
  * permission changes to child nodes can be performed.
  *
- * Will set *tighten_restrictions to true if and only if new permissions have to
- * be taken or currently shared permissions are to be unshared.  Otherwise,
- * errors are not fatal as long as the caller accepts that the restrictions
- * remain tighter than they need to be.  The caller still has to abort the
- * transaction.
- * @tighten_restrictions cannot be used together with @q: When reopening, we may
- * encounter fatal errors even though no restrictions are to be tightened.  For
- * example, changing a node from RW to RO will fail if the WRITE permission is
- * to be kept.
- *
  * A call to this function must always be followed by a call to bdrv_set_perm()
  * or bdrv_abort_perm_update().
  */
 static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            uint64_t cumulative_perms,
                            uint64_t cumulative_shared_perms,
-                           GSList *ignore_children,
-                           bool *tighten_restrictions, Error **errp)
+                           GSList *ignore_children, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     int ret;
 
-    assert(!q || !tighten_restrictions);
-
-    if (tighten_restrictions) {
-        uint64_t current_perms, current_shared;
-        uint64_t added_perms, removed_shared_perms;
-
-        bdrv_get_cumulative_perm(bs, &current_perms, &current_shared);
-
-        added_perms = cumulative_perms & ~current_perms;
-        removed_shared_perms = current_shared & ~cumulative_shared_perms;
-
-        *tighten_restrictions = added_perms || removed_shared_perms;
-    }
-
     /* Write permissions never work with read-only images */
     if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
         !bdrv_is_writable_after_reopen(bs, q))
@@ -2067,18 +2041,12 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
-        bool child_tighten_restr;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
         ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
-                                    tighten_restrictions ? &child_tighten_restr
-                                                         : NULL,
                                     errp);
-        if (tighten_restrictions) {
-            *tighten_restrictions |= child_tighten_restr;
-        }
         if (ret < 0) {
             return ret;
         }
@@ -2201,22 +2169,18 @@ char *bdrv_perm_names(uint64_t perm)
  * set, the BdrvChild objects in this list are ignored in the calculations;
  * this allows checking permission updates for an existing reference.
  *
- * See bdrv_check_perm() for the semantics of @tighten_restrictions.
- *
  * Needs to be followed by a call to either bdrv_set_perm() or
  * bdrv_abort_perm_update(). */
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
                                   GSList *ignore_children,
-                                  bool *tighten_restrictions,
                                   Error **errp)
 {
     BdrvChild *c;
     uint64_t cumulative_perms = new_used_perm;
     uint64_t cumulative_shared_perms = new_shared_perm;
 
-    assert(!q || !tighten_restrictions);
 
     /* There is no reason why anyone couldn't tolerate write_unchanged */
     assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
@@ -2230,10 +2194,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
             char *user = bdrv_child_user_desc(c);
             char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
 
-            if (tighten_restrictions) {
-                *tighten_restrictions = true;
-            }
-
             error_setg(errp, "Conflicts with use by %s as '%s', which does not "
                              "allow '%s' on %s",
                        user, c->name, perm_names, bdrv_get_node_name(c->bs));
@@ -2246,10 +2206,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
             char *user = bdrv_child_user_desc(c);
             char *perm_names = bdrv_perm_names(c->perm & ~new_shared_perm);
 
-            if (tighten_restrictions) {
-                *tighten_restrictions = true;
-            }
-
             error_setg(errp, "Conflicts with use by %s as '%s', which uses "
                              "'%s' on %s",
                        user, c->name, perm_names, bdrv_get_node_name(c->bs));
@@ -2263,21 +2219,19 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           ignore_children, tighten_restrictions, errp);
+                           ignore_children, errp);
 }
 
 /* Needs to be followed by a call to either bdrv_child_set_perm() or
  * bdrv_child_abort_perm_update(). */
 static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
                                  uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children,
-                                 bool *tighten_restrictions, Error **errp)
+                                 GSList *ignore_children, Error **errp)
 {
     int ret;
 
     ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-    ret = bdrv_check_update_perm(c->bs, q, perm, shared, ignore_children,
-                                 tighten_restrictions, errp);
+    ret = bdrv_check_update_perm(c->bs, q, perm, shared, ignore_children, errp);
     g_slist_free(ignore_children);
 
     if (ret < 0) {
@@ -2318,15 +2272,13 @@ static void bdrv_child_abort_perm_update(BdrvChild *c)
     bdrv_abort_perm_update(c->bs);
 }
 
-static int bdrv_refresh_perms(BlockDriverState *bs, bool *tighten_restrictions,
-                              Error **errp)
+static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
     uint64_t perm, shared_perm;
 
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL,
-                          tighten_restrictions, errp);
+    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
         bdrv_abort_perm_update(bs);
         return ret;
@@ -2341,13 +2293,12 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
 {
     Error *local_err = NULL;
     int ret;
-    bool tighten_restrictions;
 
-    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL,
-                                &tighten_restrictions, &local_err);
+    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL, &local_err);
     if (ret < 0) {
         bdrv_child_abort_perm_update(c);
-        if (tighten_restrictions) {
+        if ((perm & ~c->perm) || (c->shared_perm & ~shared)) {
+            /* tighten permissions */
             error_propagate(errp, local_err);
         } else {
             /*
@@ -2649,15 +2600,12 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 
     if (old_bs) {
-        bool tighten_restrictions;
-
         /*
          * Update permissions for old node. We're just taking a parent away, so
          * we're loosening restrictions. Errors of permission update are not
          * fatal in this case, ignore them.
          */
-        bdrv_refresh_perms(old_bs, &tighten_restrictions, NULL);
-        assert(tighten_restrictions == false);
+        bdrv_refresh_perms(old_bs, NULL);
 
         /* When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext */
@@ -2687,8 +2635,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
     Error *local_err = NULL;
     int ret;
 
-    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, NULL,
-                                 errp);
+    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
         bdrv_abort_perm_update(child_bs);
         bdrv_unref(child_bs);
@@ -3820,7 +3767,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
         ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, NULL, NULL, errp);
+                              state->shared_perm, NULL, errp);
         if (ret < 0) {
             goto cleanup_perm;
         }
@@ -3832,7 +3779,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
                             bs_queue, state->perm, state->shared_perm,
                             &nperm, &nshared);
             ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, NULL, NULL, errp);
+                                         nperm, nshared, NULL, errp);
             if (ret < 0) {
                 goto cleanup_perm;
             }
@@ -4622,7 +4569,7 @@ static void bdrv_replace_node_common(BlockDriverState *from,
 
     /* Check whether the required permissions can be granted on @to, ignoring
      * all BdrvChild in @list so that they can't block themselves. */
-    ret = bdrv_check_update_perm(to, NULL, perm, shared, list, NULL, errp);
+    ret = bdrv_check_update_perm(to, NULL, perm, shared, list, errp);
     if (ret < 0) {
         bdrv_abort_perm_update(to);
         goto out;
@@ -5817,7 +5764,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        ret = bdrv_refresh_perms(bs, NULL, errp);
+        ret = bdrv_refresh_perms(bs, errp);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
@@ -5896,7 +5843,6 @@ static bool bdrv_has_bds_parent(BlockDriverState *bs, bool only_active)
 static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
-    bool tighten_restrictions;
     int ret;
 
     if (!bs->drv) {
@@ -5935,8 +5881,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
      * We only tried to loosen restrictions, so errors are not fatal, ignore
      * them.
      */
-    bdrv_refresh_perms(bs, &tighten_restrictions, NULL);
-    assert(tighten_restrictions == false);
+    bdrv_refresh_perms(bs, NULL);
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.29.2


