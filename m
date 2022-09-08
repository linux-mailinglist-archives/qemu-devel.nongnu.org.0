Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1D5B1B58
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:26:16 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFfj-0000bx-8q
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1oWFdg-0007SQ-VF; Thu, 08 Sep 2022 07:24:08 -0400
Received: from sosiego.soundray.org ([2a01:4f8:c2c:a9a0::1]:38032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1oWFdc-0004La-7O; Thu, 08 Sep 2022 07:24:08 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1662636236;
 bh=yOF7obn7bO8+DOYaGQXpTxRC0oFiXOne6VYAceKYfZ8=;
 h=From:To:Cc:Subject:Date;
 b=0IE/S8kt/pOUmxljO8rNBY8G2iq+i6pf3EZnH+WQhcJdhBMbJTPlaqkafIAfVRfEg
 aCVYX/sm8qg2+V1JOku538VITApHpez7hYW0NlSe2VnYTvu0OwKhtbbTvIb5gAYnRb
 Rn3ZiyDHKaH63bEWrvHJImZnN49kQ9b+9BN964HQ=
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>
Subject: [PATCH v3] 9pfs: use GHashTable for fid table
Date: Thu,  8 Sep 2022 13:23:53 +0200
Message-Id: <20220908112353.289267-1-git@sphalerite.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---

Greg Kurz writes:
> The comment above should be adapted to the new situation : no need

I've removed it completely, since the logic is simple enough that only
the shortened comment below remains necessary.

> With the new logic, this should just be:

now is :)

> g_hash_table_steal_extended() [1] actually allows to do just that.

g_hash_table_steal_extended unfortunately isn't available since it was
introduced in glib 2.58 and we're maintaining compatibility to 2.56.

> You could just call g_hash_table_iter_remove(&iter) here

Applied this suggestion, thanks!


> Well... finding at least one clunked fid state in this table is
> definitely a bug so I'll keep the BUG_ON() anyway.

Christian Schoenebeck writes:
> Yeah, I think you are right, it would feel odd. Just drop BUG_ON() for
> now.

I still prefer dropping it, but if we were to keep it I think it should
be in v9fs_reclaim_fd where we iterate and can thus check the whole
table.


Greg Kurz and Philippe Mathieu-Daudé write:
> [patch versioning]

Whoops. I used -v2 on git send-email, which just ignored the option,
rather than git format-patch, by accident. This one _should_ now be v3!


 hw/9pfs/9p.c | 140 +++++++++++++++++++++++++--------------------------
 hw/9pfs/9p.h |   2 +-
 2 files changed, 70 insertions(+), 72 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index aebadeaa03..98a475e560 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -282,33 +282,31 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *pdu, int32_t fid)
     V9fsFidState *f;
     V9fsState *s = pdu->s;
 
-    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
-        BUG_ON(f->clunked);
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
+    f = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
+    if (f) {
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
@@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
 {
     V9fsFidState *f;
 
-    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
+    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
         /* If fid is already there return NULL */
-        BUG_ON(f->clunked);
-        if (f->fid == fid) {
-            return NULL;
-        }
+        return NULL;
     }
     f = g_new0(V9fsFidState, 1);
     f->fid = fid;
@@ -333,7 +328,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
      * reclaim won't close the file descriptor
      */
     f->flags |= FID_REFERENCED;
-    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
+    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
 
     v9fs_readdir_init(s->proto_version, &f->fs.dir);
     v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
@@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
 {
     V9fsFidState *fidp;
 
-    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
-        if (fidp->fid == fid) {
-            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
-            fidp->clunked = true;
-            return fidp;
-        }
+    fidp = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
+    if (fidp) {
+        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
+        fidp->clunked = true;
+        return fidp;
     }
     return NULL;
 }
@@ -439,10 +433,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
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
@@ -518,23 +517,19 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
 {
     int err;
     V9fsState *s = pdu->s;
-    V9fsFidState *fidp, *fidp_next;
+    V9fsFidState *fidp;
+    gpointer fid;
+    GHashTableIter iter;
 
-    fidp = QSIMPLEQ_FIRST(&s->fid_list);
-    if (!fidp) {
-        return 0;
-    }
+    g_hash_table_iter_init(&iter, s->fids);
+
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
+        /*
+         * Ensure the fid survives a potential clunk request during
+         * v9fs_reopen_fid.
+         */
+        fidp->ref++;
 
-    /*
-     * v9fs_reopen_fid() can yield : a reference on the fid must be held
-     * to ensure its pointer remains valid and we can safely pass it to
-     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
-     * we must keep a reference on the next fid as well. So the logic here
-     * is to get a reference on a fid and only put it back during the next
-     * iteration after we could get a reference on the next fid. Start with
-     * the first one.
-     */
-    for (fidp->ref++; fidp; fidp = fidp_next) {
         if (fidp->path.size == path->size &&
             !memcmp(fidp->path.data, path->data, path->size)) {
             /* Mark the fid non reclaimable. */
@@ -548,16 +543,6 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
             }
         }
 
-        fidp_next = QSIMPLEQ_NEXT(fidp, next);
-
-        if (fidp_next) {
-            /*
-             * Ensure the next fid survives a potential clunk request during
-             * put_fid() below and v9fs_reopen_fid() in the next iteration.
-             */
-            fidp_next->ref++;
-        }
-
         /* We're done with this fid */
         put_fid(pdu, fidp);
     }
@@ -569,18 +554,20 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
 {
     V9fsState *s = pdu->s;
     V9fsFidState *fidp;
+    gpointer fid;
+    GHashTableIter iter;
+
+    g_hash_table_iter_init(&iter, s->fids);
 
     /* Free all fids */
-    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
-        /* Get fid */
-        fidp = QSIMPLEQ_FIRST(&s->fid_list);
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
         fidp->ref++;
 
         /* Clunk fid */
-        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
         fidp->clunked = true;
 
         put_fid(pdu, fidp);
+        g_hash_table_iter_remove(&iter);
     }
 }
 
@@ -3205,6 +3192,8 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsFidState *tfidp;
     V9fsState *s = pdu->s;
     V9fsFidState *dirfidp = NULL;
+    GHashTableIter iter;
+    gpointer fid;
 
     v9fs_path_init(&new_path);
     if (newdirfid != -1) {
@@ -3238,11 +3227,13 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
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
@@ -3320,6 +3311,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
     V9fsPath oldpath, newpath;
     V9fsState *s = pdu->s;
     int err;
+    GHashTableIter iter;
+    gpointer fid;
 
     v9fs_path_init(&oldpath);
     v9fs_path_init(&newpath);
@@ -3336,7 +3329,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
      * Fixup fid's pointing to the old name to
      * start pointing to the new name
      */
-    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
+    g_hash_table_iter_init(&iter, s->fids);
+    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
         if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
             /* replace the name */
             v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
@@ -4226,7 +4220,7 @@ int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
     s->ctx.fmode = fse->fmode;
     s->ctx.dmode = fse->dmode;
 
-    QSIMPLEQ_INIT(&s->fid_list);
+    s->fids = g_hash_table_new(NULL, NULL);
     qemu_co_rwlock_init(&s->rename_lock);
 
     if (s->ops->init(&s->ctx, errp) < 0) {
@@ -4286,6 +4280,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
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
2.36.0


