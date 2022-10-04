Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648645F40F5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:44:08 +0200 (CEST)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offPD-0004IG-0R
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1offMm-0000cM-Ar; Tue, 04 Oct 2022 06:41:36 -0400
Received: from sosiego.soundray.org ([2a01:4f8:c2c:a9a0::1]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1offMh-0002T7-By; Tue, 04 Oct 2022 06:41:34 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1664880084;
 bh=PCASHbc5tkaz2xflkZ60bPrEDSnGb3iMXf/nDXXr5BA=;
 h=From:To:Cc:Subject:Date;
 b=3OFhN86Z1g5vm1O5biVPsgUJmRF44rdVCfoE/d2g3DG1d2zB9VnfzMpIZuxTkIBpU
 eOsuhxpZDEoyLax3+Y8ABf8AENaHzN1hZzld1YNnt0HVtTthBD4mdpZQgj1Y+pUt7I
 Jc641DfydYMgajcoWHVI1NQpOSPYUvsLdEJiAptI=
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Qemu-block <qemu-block@nongnu.org>,
 Linus Heckemann <git@sphalerite.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6] 9pfs: use GHashTable for fid table
Date: Tue,  4 Oct 2022 12:41:21 +0200
Message-Id: <20221004104121.713689-1-git@sphalerite.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c2c:a9a0::1;
 envelope-from=linus@sphalerite.org; helo=sosiego.soundray.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous implementation would iterate over the fid table for
lookup operations, resulting in an operation with O(n) complexity on
the number of open files and poor cache locality -- for every open,
stat, read, write, etc operation.

This change uses a hashtable for this instead, significantly improving
the performance of the 9p filesystem. The runtime of NixOS's simple
installer test, which copies ~122k files totalling ~1.8GiB from 9p,
decreased by a factor of about 10.

Signed-off-by: Linus Heckemann <git@sphalerite.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220908112353.289267-1-git@sphalerite.org>
[CS: - Retain BUG_ON(f->clunked) in get_fid().
     - Add TODO comment in clunk_fid(). ]
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
Christian Schoenebeck writes:
> Not a big deal, but I start thinking whether to keep BUG_ON() here as well.
> That would require using g_hash_table_lookup() here instead of
> g_hash_table_contains(). Not that I would insist.

Done.

> checkpatch.pl

Fixed.

> OK, I get it that you squashed your previous patch and that you ended up with
> this comment instead. But if you read the old comment version here, you'll
> notice that it describes the actual problem more accurately: especially that
> v9fs_reopen_fid() and put_fid() are the 2 functions that may cause the
> coroutine to "yield" here. That's an important information to be retained in
> this comment here as it's not obvious.

Reworded to mention these functions explicitly.

>  I would not move this to the 2nd loop. I would still set the
> FID_NON_RECLAIMABLE flag here, for the same reasons that you are bumping the
> refcount already in the first loop below.

Good point! Fixed.

>  ... that's not the same behaviour as before, is it? Old behaviour was to put
> the respective (last) fid only on error. And this would now put all fids.

Indeed it isn't the old behaviour, but I believe it's correct: since
before we only incremented the reference counter for each one when we
started reopening it. Now, we increment _all_ their refcounts, so we
need to put all of them back as well.

>  Wasn't there something like GLIST_FOREACH()? Then you wouldn't need to add
> that variable.

glib does provide g_list_foreach, but that requires a function
pointer. I'm not aware of a macro for this. I could change this to use
a QLIST (for which we do have a macro) instead of a GList if you
insist, but I'd default to leaving this as is.

Thanks for your repeated reviews and patience!

Linus


 hw/9pfs/9p.c | 195 +++++++++++++++++++++++++++++----------------------
 hw/9pfs/9p.h |   2 +-
 2 files changed, 113 insertions(+), 84 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index aebadeaa03..729d3181e0 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -256,7 +256,8 @@ static size_t v9fs_string_size(V9fsString *str)
 }

 /*
- * returns 0 if fid got re-opened, 1 if not, < 0 on error */
+ * returns 0 if fid got re-opened, 1 if not, < 0 on error
+ */
 static int coroutine_fn v9fs_reopen_fid(V9fsPDU *pdu, V9fsFidState *f)
 {
     int err = 1;
@@ -282,33 +283,32 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *pdu, int32_t fid)
     V9fsFidState *f;
     V9fsState *s = pdu->s;

-    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
+    f = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
+    if (f) {
         BUG_ON(f->clunked);
-        if (f->fid == fid) {
-            /*
-             * Update the fid ref upfront so that
-             * we don't get reclaimed when we yield
-             * in open later.
-             */
-            f->ref++;
-            /*
-             * check whether we need to reopen the
-             * file. We might have closed the fd
-             * while trying to free up some file
-             * descriptors.
-             */
-            err = v9fs_reopen_fid(pdu, f);
-            if (err < 0) {
-                f->ref--;
-                return NULL;
-            }
-            /*
-             * Mark the fid as referenced so that the LRU
-             * reclaim won't close the file descriptor
-             */
-            f->flags |= FID_REFERENCED;
-            return f;
+        /*
+         * Update the fid ref upfront so that
+         * we don't get reclaimed when we yield
+         * in open later.
+         */
+        f->ref++;
+        /*
+         * check whether we need to reopen the
+         * file. We might have closed the fd
+         * while trying to free up some file
+         * descriptors.
+         */
+        err = v9fs_reopen_fid(pdu, f);
+        if (err < 0) {
+            f->ref--;
+            return NULL;
         }
+        /*
+         * Mark the fid as referenced so that the LRU
+         * reclaim won't close the file descriptor
+         */
+        f->flags |= FID_REFERENCED;
+        return f;
     }
     return NULL;
 }
@@ -317,12 +317,11 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
 {
     V9fsFidState *f;

-    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
+    f = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
+    if (f) {
         /* If fid is already there return NULL */
         BUG_ON(f->clunked);
-        if (f->fid == fid) {
-            return NULL;
-        }
+        return NULL;
     }
     f = g_new0(V9fsFidState, 1);
     f->fid = fid;
@@ -333,7 +332,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
      * reclaim won't close the file descriptor
      */
     f->flags |= FID_REFERENCED;
-    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
+    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);

     v9fs_readdir_init(s->proto_version, &f->fs.dir);
     v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
@@ -424,12 +423,12 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
 {
     V9fsFidState *fidp;

-    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
-        if (fidp->fid == fid) {
-            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
-            fidp->clunked = true;
-            return fidp;
-        }
+    /* TODO: Use g_hash_table_steal_extended() instead? */
+    fidp = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
+    if (fidp) {
+        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
+        fidp->clunked = true;
+        return fidp;
     }
     return NULL;
 }
@@ -439,10 +438,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
     int reclaim_count = 0;
     V9fsState *s = pdu->s;
     V9fsFidState *f;
+    GHashTableIter iter;
+    gpointer fid;
+
+    g_hash_table_iter_init(&iter, s->fids);
+
     QSLIST_HEAD(, V9fsFidState) reclaim_list =
         QSLIST_HEAD_INITIALIZER(reclaim_list);

-    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &f)) {
         /*
          * Unlink fids cannot be reclaimed. Check
          * for them and skip them. Also skip fids
@@ -514,72 +518,86 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
     }
 }

+/*
+ * This is used when a path is removed from the directory tree. Any
+ * fids that still reference it must not be closed from then on, since
+ * they cannot be reopened.
+ */
 static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
 {
-    int err;
+    int err = 0;
     V9fsState *s = pdu->s;
-    V9fsFidState *fidp, *fidp_next;
+    V9fsFidState *fidp;
+    gpointer fid;
+    GHashTableIter iter;
+    /*
+     * The most common case is probably that we have exactly one
+     * fid for the given path, so preallocate exactly one.
+     */
+    g_autoptr(GArray) to_reopen = g_array_sized_new(FALSE, FALSE,
+            sizeof(V9fsFidState *), 1);
+    gint i;

-    fidp = QSIMPLEQ_FIRST(&s->fid_list);
-    if (!fidp) {
-        return 0;
-    }
+    g_hash_table_iter_init(&iter, s->fids);

     /*
-     * v9fs_reopen_fid() can yield : a reference on the fid must be held
-     * to ensure its pointer remains valid and we can safely pass it to
-     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
-     * we must keep a reference on the next fid as well. So the logic here
-     * is to get a reference on a fid and only put it back during the next
-     * iteration after we could get a reference on the next fid. Start with
-     * the first one.
+     * We iterate over the fid table looking for the entries we need
+     * to reopen, and store them in to_reopen. This is because
+     * v9fs_reopen_fid() and put_fid() yield. This allows the fid table
+     * to be modified in the meantime, invalidating our iterator.
      */
-    for (fidp->ref++; fidp; fidp = fidp_next) {
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
         if (fidp->path.size == path->size &&
             !memcmp(fidp->path.data, path->data, path->size)) {
-            /* Mark the fid non reclaimable. */
-            fidp->flags |= FID_NON_RECLAIMABLE;
-
-            /* reopen the file/dir if already closed */
-            err = v9fs_reopen_fid(pdu, fidp);
-            if (err < 0) {
-                put_fid(pdu, fidp);
-                return err;
-            }
-        }
-
-        fidp_next = QSIMPLEQ_NEXT(fidp, next);
-
-        if (fidp_next) {
             /*
-             * Ensure the next fid survives a potential clunk request during
-             * put_fid() below and v9fs_reopen_fid() in the next iteration.
+             * Ensure the fid survives a potential clunk request during
+             * v9fs_reopen_fid or put_fid.
              */
-            fidp_next->ref++;
+            fidp->ref++;
+            fidp->flags |= FID_NON_RECLAIMABLE;
+            g_array_append_val(to_reopen, fidp);
         }
+    }

-        /* We're done with this fid */
-        put_fid(pdu, fidp);
+    for (i = 0; i < to_reopen->len; i++) {
+        fidp = g_array_index(to_reopen, V9fsFidState*, i);
+        /* reopen the file/dir if already closed */
+        err = v9fs_reopen_fid(pdu, fidp);
+        if (err < 0) {
+            goto out;
+        }
     }

-    return 0;
+ out:
+    for (i = 0; i < to_reopen->len; i++) {
+        put_fid(pdu, g_array_index(to_reopen, V9fsFidState*, i));
+    }
+    return err;
 }

 static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
 {
     V9fsState *s = pdu->s;
     V9fsFidState *fidp;
+    GList *freeing;
+    /*
+     * Get a list of all the values (fid states) in the table, which
+     * we then...
+     */
+    g_autoptr(GList) fids = g_hash_table_get_values(s->fids);

-    /* Free all fids */
-    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
-        /* Get fid */
-        fidp = QSIMPLEQ_FIRST(&s->fid_list);
-        fidp->ref++;
+    /* ... remove from the table, taking over ownership. */
+    g_hash_table_steal_all(s->fids);

-        /* Clunk fid */
-        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
+    /*
+     * This allows us to release our references to them asynchronously without
+     * iterating over the hash table and risking iterator invalidation
+     * through concurrent modifications.
+     */
+    for (freeing = fids; freeing; freeing = freeing->next) {
+        fidp = freeing->data;
+        fidp->ref++;
         fidp->clunked = true;
-
         put_fid(pdu, fidp);
     }
 }
@@ -3205,6 +3223,8 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsFidState *tfidp;
     V9fsState *s = pdu->s;
     V9fsFidState *dirfidp = NULL;
+    GHashTableIter iter;
+    gpointer fid;

     v9fs_path_init(&new_path);
     if (newdirfid != -1) {
@@ -3238,11 +3258,13 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
     if (err < 0) {
         goto out;
     }
+
     /*
      * Fixup fid's pointing to the old name to
      * start pointing to the new name
      */
-    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
+    g_hash_table_iter_init(&iter, s->fids);
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
         if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
             /* replace the name */
             v9fs_fix_path(&tfidp->path, &new_path, strlen(fidp->path.data));
@@ -3320,6 +3342,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
     V9fsPath oldpath, newpath;
     V9fsState *s = pdu->s;
     int err;
+    GHashTableIter iter;
+    gpointer fid;

     v9fs_path_init(&oldpath);
     v9fs_path_init(&newpath);
@@ -3336,7 +3360,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
      * Fixup fid's pointing to the old name to
      * start pointing to the new name
      */
-    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
+    g_hash_table_iter_init(&iter, s->fids);
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
         if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
             /* replace the name */
             v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
@@ -4226,7 +4251,7 @@ int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
     s->ctx.fmode = fse->fmode;
     s->ctx.dmode = fse->dmode;

-    QSIMPLEQ_INIT(&s->fid_list);
+    s->fids = g_hash_table_new(NULL, NULL);
     qemu_co_rwlock_init(&s->rename_lock);

     if (s->ops->init(&s->ctx, errp) < 0) {
@@ -4286,6 +4311,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
     if (s->ctx.fst) {
         fsdev_throttle_cleanup(s->ctx.fst);
     }
+    if (s->fids) {
+        g_hash_table_destroy(s->fids);
+        s->fids = NULL;
+    }
     g_free(s->tag);
     qp_table_destroy(&s->qpd_table);
     qp_table_destroy(&s->qpp_table);
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..10fd2076c2 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -339,7 +339,7 @@ typedef struct {
 struct V9fsState {
     QLIST_HEAD(, V9fsPDU) free_list;
     QLIST_HEAD(, V9fsPDU) active_list;
-    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;
+    GHashTable *fids;
     FileOperations *ops;
     FsContext ctx;
     char *tag;
--
2.36.2

