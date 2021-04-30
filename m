Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3A36F994
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:48:52 +0200 (CEST)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRdb-0001X7-Bs
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm7-0005ZH-Cd
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm1-00033G-KA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxkThT62aP8i/7Ld/f0AXP2TkaaaAhB+oXUiUHLpw0Y=;
 b=SEzpmULf0+030xPkVTI4soQrToFiMeo1uYw4dUNb9v7xZiXeiTHMCv+spBe4gGcxmI6ROo
 BiVnsV7FFRu/Yw5TZWUlwwSfZqza24Nt+zliZ7+zowOzBM7WFtpqWE88uUxPxBK4fgDdHv
 v1wvH9EkrcaaKzHTQt1cJVs43SSNbi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-HAxvvR8SNuqJL-guiwwGng-1; Fri, 30 Apr 2021 06:53:26 -0400
X-MC-Unique: HAxvvR8SNuqJL-guiwwGng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DB88101C8DB;
 Fri, 30 Apr 2021 10:53:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292815F707;
 Fri, 30 Apr 2021 10:53:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/39] block: bdrv_reopen_multiple: refresh permissions on
 updated graph
Date: Fri, 30 Apr 2021 12:51:38 +0200
Message-Id: <20210430105147.125840-31-kwolf@redhat.com>
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

Move bdrv_reopen_multiple to new paradigm of permission update:
first update graph relations, then do refresh the permissions.

We have to modify reopen process in file-posix driver: with new scheme
we don't have prepared permissions in raw_reopen_prepare(), so we
should reconfigure fd in raw_check_perm(). Still this seems more native
and simple anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-31-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |   3 +-
 block.c               | 187 ++++++++++++------------------------------
 block/file-posix.c    |  91 +++++++-------------
 3 files changed, 84 insertions(+), 197 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index ad38259c91..8d5b3ecebd 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -208,8 +208,7 @@ typedef struct BDRVReopenState {
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
     bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
-    BlockDriverState *new_backing_bs; /* If NULL then detach the current bs */
-    uint64_t perm, shared_perm;
+    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
diff --git a/block.c b/block.c
index 357ec1be2c..ffaa367a1b 100644
--- a/block.c
+++ b/block.c
@@ -95,8 +95,9 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
-static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
-                               *queue, Error **errp);
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
+                               BlockReopenQueue *queue,
+                               Transaction *set_backings_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -2468,6 +2469,7 @@ static void bdrv_list_abort_perm_update(GSList *list)
     }
 }
 
+__attribute__((unused))
 static void bdrv_abort_perm_update(BlockDriverState *bs)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
@@ -2563,6 +2565,7 @@ char *bdrv_perm_names(uint64_t perm)
  *
  * Needs to be followed by a call to either bdrv_set_perm() or
  * bdrv_abort_perm_update(). */
+__attribute__((unused))
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
@@ -4183,10 +4186,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     bs_entry->state.explicit_options = explicit_options;
     bs_entry->state.flags = flags;
 
-    /* This needs to be overwritten in bdrv_reopen_prepare() */
-    bs_entry->state.perm = UINT64_MAX;
-    bs_entry->state.shared_perm = 0;
-
     /*
      * If keep_old_opts is false then it means that unspecified
      * options must be reset to their original value. We don't allow
@@ -4271,6 +4270,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
     int ret = -1;
     BlockReopenQueueEntry *bs_entry, *next;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     assert(bs_queue != NULL);
 
@@ -4284,33 +4286,33 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
-        if (bdrv_reopen_prepare(&bs_entry->state, bs_queue, errp)) {
-            goto cleanup;
+        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
+        if (ret < 0) {
+            goto abort;
         }
         bs_entry->prepared = true;
     }
 
+    found = g_hash_table_new(NULL, NULL);
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
-        ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, errp);
-        if (ret < 0) {
-            goto cleanup_perm;
-        }
-        /* Check if new_backing_bs would accept the new permissions */
-        if (state->replace_backing_bs && state->new_backing_bs) {
-            uint64_t nperm, nshared;
-            bdrv_child_perm(state->bs, state->new_backing_bs,
-                            NULL, bdrv_backing_role(state->bs),
-                            bs_queue, state->perm, state->shared_perm,
-                            &nperm, &nshared);
-            ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, errp);
-            if (ret < 0) {
-                goto cleanup_perm;
-            }
+
+        refresh_list = bdrv_topological_dfs(refresh_list, found, state->bs);
+        if (state->old_backing_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_backing_bs);
         }
-        bs_entry->perms_checked = true;
+    }
+
+    /*
+     * Note that file-posix driver rely on permission update done during reopen
+     * (even if no permission changed), because it wants "new" permissions for
+     * reconfiguring the fd and that's why it does it in raw_check_perm(), not
+     * in raw_reopen_prepare() which is called with "old" permissions.
+     */
+    ret = bdrv_list_refresh_perms(refresh_list, bs_queue, tran, errp);
+    if (ret < 0) {
+        goto abort;
     }
 
     /*
@@ -4326,51 +4328,31 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         bdrv_reopen_commit(&bs_entry->state);
     }
 
-    ret = 0;
-cleanup_perm:
-    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        BDRVReopenState *state = &bs_entry->state;
-
-        if (!bs_entry->perms_checked) {
-            continue;
-        }
-
-        if (ret == 0) {
-            uint64_t perm, shared;
+    tran_commit(tran);
 
-            bdrv_get_cumulative_perm(state->bs, &perm, &shared);
-            assert(perm == state->perm);
-            assert(shared == state->shared_perm);
+    QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
+        BlockDriverState *bs = bs_entry->state.bs;
 
-            bdrv_set_perm(state->bs);
-        } else {
-            bdrv_abort_perm_update(state->bs);
-            if (state->replace_backing_bs && state->new_backing_bs) {
-                bdrv_abort_perm_update(state->new_backing_bs);
-            }
+        if (bs->drv->bdrv_reopen_commit_post) {
+            bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
         }
     }
 
-    if (ret == 0) {
-        QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
-            BlockDriverState *bs = bs_entry->state.bs;
+    ret = 0;
+    goto cleanup;
 
-            if (bs->drv->bdrv_reopen_commit_post)
-                bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
+abort:
+    tran_abort(tran);
+    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+        if (bs_entry->prepared) {
+            bdrv_reopen_abort(&bs_entry->state);
         }
+        qobject_unref(bs_entry->state.explicit_options);
+        qobject_unref(bs_entry->state.options);
     }
+
 cleanup:
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        if (ret) {
-            if (bs_entry->prepared) {
-                bdrv_reopen_abort(&bs_entry->state);
-            }
-            qobject_unref(bs_entry->state.explicit_options);
-            qobject_unref(bs_entry->state.options);
-        }
-        if (bs_entry->state.new_backing_bs) {
-            bdrv_unref(bs_entry->state.new_backing_bs);
-        }
         g_free(bs_entry);
     }
     g_free(bs_queue);
@@ -4395,53 +4377,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
     return ret;
 }
 
-static BlockReopenQueueEntry *find_parent_in_reopen_queue(BlockReopenQueue *q,
-                                                          BdrvChild *c)
-{
-    BlockReopenQueueEntry *entry;
-
-    QTAILQ_FOREACH(entry, q, entry) {
-        BlockDriverState *bs = entry->state.bs;
-        BdrvChild *child;
-
-        QLIST_FOREACH(child, &bs->children, next) {
-            if (child == c) {
-                return entry;
-            }
-        }
-    }
-
-    return NULL;
-}
-
-static void bdrv_reopen_perm(BlockReopenQueue *q, BlockDriverState *bs,
-                             uint64_t *perm, uint64_t *shared)
-{
-    BdrvChild *c;
-    BlockReopenQueueEntry *parent;
-    uint64_t cumulative_perms = 0;
-    uint64_t cumulative_shared_perms = BLK_PERM_ALL;
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        parent = find_parent_in_reopen_queue(q, c);
-        if (!parent) {
-            cumulative_perms |= c->perm;
-            cumulative_shared_perms &= c->shared_perm;
-        } else {
-            uint64_t nperm, nshared;
-
-            bdrv_child_perm(parent->state.bs, bs, c, c->role, q,
-                            parent->state.perm, parent->state.shared_perm,
-                            &nperm, &nshared);
-
-            cumulative_perms |= nperm;
-            cumulative_shared_perms &= nshared;
-        }
-    }
-    *perm = cumulative_perms;
-    *shared = cumulative_shared_perms;
-}
-
 static bool bdrv_reopen_can_attach(BlockDriverState *parent,
                                    BdrvChild *child,
                                    BlockDriverState *new_child,
@@ -4483,6 +4418,7 @@ static bool bdrv_reopen_can_attach(BlockDriverState *parent,
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
 static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
+                                     Transaction *set_backings_tran,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
@@ -4559,6 +4495,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
 
     /* If we want to replace the backing file we need some extra checks */
     if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
+        int ret;
+
         /* Check for implicit nodes between bs and its backing file */
         if (bs != overlay_bs) {
             error_setg(errp, "Cannot change backing link if '%s' has "
@@ -4579,9 +4517,11 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
             return -EPERM;
         }
         reopen_state->replace_backing_bs = true;
-        if (new_backing_bs) {
-            bdrv_ref(new_backing_bs);
-            reopen_state->new_backing_bs = new_backing_bs;
+        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
+        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
+                                      errp);
+        if (ret < 0) {
+            return ret;
         }
     }
 
@@ -4606,7 +4546,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  *
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                               BlockReopenQueue *queue, Error **errp)
+                               BlockReopenQueue *queue,
+                               Transaction *set_backings_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4673,10 +4614,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
         goto error;
     }
 
-    /* Calculate required permissions after reopening */
-    bdrv_reopen_perm(queue, reopen_state->bs,
-                     &reopen_state->perm, &reopen_state->shared_perm);
-
     if (drv->bdrv_reopen_prepare) {
         /*
          * If a driver-specific option is missing, it means that we
@@ -4730,7 +4667,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, errp);
+    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
     if (ret < 0) {
         goto error;
     }
@@ -4852,22 +4789,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
         qdict_del(bs->explicit_options, child->name);
         qdict_del(bs->options, child->name);
     }
-
-    /*
-     * Change the backing file if a new one was specified. We do this
-     * after updating bs->options, so bdrv_refresh_filename() (called
-     * from bdrv_set_backing_hd()) has the new values.
-     */
-    if (reopen_state->replace_backing_bs) {
-        BlockDriverState *old_backing_bs = child_bs(bs->backing);
-        assert(!old_backing_bs || !old_backing_bs->implicit);
-        /* Abort the permission update on the backing bs we're detaching */
-        if (old_backing_bs) {
-            bdrv_abort_perm_update(old_backing_bs);
-        }
-        bdrv_set_backing_hd(bs, reopen_state->new_backing_bs, &error_abort);
-    }
-
     bdrv_refresh_limits(bs, NULL, NULL);
 }
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 20e14f8e96..10b71d9a13 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -175,7 +175,6 @@ typedef struct BDRVRawState {
 } BDRVRawState;
 
 typedef struct BDRVRawReopenState {
-    int fd;
     int open_flags;
     bool drop_cache;
     bool check_cache_dropped;
@@ -1075,7 +1074,6 @@ static int raw_reopen_prepare(BDRVReopenState *state,
     BDRVRawReopenState *rs;
     QemuOpts *opts;
     int ret;
-    Error *local_err = NULL;
 
     assert(state != NULL);
     assert(state->bs != NULL);
@@ -1101,32 +1099,18 @@ static int raw_reopen_prepare(BDRVReopenState *state,
      * bdrv_reopen_prepare() will detect changes and complain. */
     qemu_opts_to_qdict(opts, state->options);
 
-    rs->fd = raw_reconfigure_getfd(state->bs, state->flags, &rs->open_flags,
-                                   state->perm, true, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        ret = -1;
-        goto out;
-    }
-
-    /* Fail already reopen_prepare() if we can't get a working O_DIRECT
-     * alignment with the new fd. */
-    if (rs->fd != -1) {
-        raw_probe_alignment(state->bs, rs->fd, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            ret = -EINVAL;
-            goto out_fd;
-        }
-    }
+    /*
+     * As part of reopen prepare we also want to create new fd by
+     * raw_reconfigure_getfd(). But it wants updated "perm", when in
+     * bdrv_reopen_multiple() .bdrv_reopen_prepare() callback called prior to
+     * permission update. Happily, permission update is always a part (a seprate
+     * stage) of bdrv_reopen_multiple() so we can rely on this fact and
+     * reconfigure fd in raw_check_perm().
+     */
 
     s->reopen_state = state;
     ret = 0;
-out_fd:
-    if (ret < 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
+
 out:
     qemu_opts_del(opts);
     return ret;
@@ -1140,10 +1124,6 @@ static void raw_reopen_commit(BDRVReopenState *state)
     s->drop_cache = rs->drop_cache;
     s->check_cache_dropped = rs->check_cache_dropped;
     s->open_flags = rs->open_flags;
-
-    qemu_close(s->fd);
-    s->fd = rs->fd;
-
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -1162,10 +1142,6 @@ static void raw_reopen_abort(BDRVReopenState *state)
         return;
     }
 
-    if (rs->fd >= 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -3073,39 +3049,30 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
                           Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-    BDRVRawReopenState *rs = NULL;
+    int input_flags = s->reopen_state ? s->reopen_state->flags : bs->open_flags;
     int open_flags;
     int ret;
 
-    if (s->perm_change_fd) {
+    /* We may need a new fd if auto-read-only switches the mode */
+    ret = raw_reconfigure_getfd(bs, input_flags, &open_flags, perm,
+                                false, errp);
+    if (ret < 0) {
+        return ret;
+    } else if (ret != s->fd) {
+        Error *local_err = NULL;
+
         /*
-         * In the context of reopen, this function may be called several times
-         * (directly and recursively while change permissions of the parent).
-         * This is even true for children that don't inherit from the original
-         * reopen node, so s->reopen_state is not set.
-         *
-         * Ignore all but the first call.
+         * Fail already check_perm() if we can't get a working O_DIRECT
+         * alignment with the new fd.
          */
-        return 0;
-    }
-
-    if (s->reopen_state) {
-        /* We already have a new file descriptor to set permissions for */
-        assert(s->reopen_state->perm == perm);
-        assert(s->reopen_state->shared_perm == shared);
-        rs = s->reopen_state->opaque;
-        s->perm_change_fd = rs->fd;
-        s->perm_change_flags = rs->open_flags;
-    } else {
-        /* We may need a new fd if auto-read-only switches the mode */
-        ret = raw_reconfigure_getfd(bs, bs->open_flags, &open_flags, perm,
-                                    false, errp);
-        if (ret < 0) {
-            return ret;
-        } else if (ret != s->fd) {
-            s->perm_change_fd = ret;
-            s->perm_change_flags = open_flags;
+        raw_probe_alignment(bs, ret, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return -EINVAL;
         }
+
+        s->perm_change_fd = ret;
+        s->perm_change_flags = open_flags;
     }
 
     /* Prepare permissions on old fd to avoid conflicts between old and new,
@@ -3127,7 +3094,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
     return 0;
 
 fail:
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
@@ -3158,7 +3125,7 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 
     /* For reopen, .bdrv_reopen_abort is called afterwards and will close
      * the file descriptor. */
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
-- 
2.30.2


