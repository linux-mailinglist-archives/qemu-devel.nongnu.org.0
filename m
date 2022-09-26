Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332395EA66D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:44:29 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnTI-0007FN-9o
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1ocnRC-0004Fx-B4; Mon, 26 Sep 2022 08:42:18 -0400
Received: from sosiego.soundray.org ([2a01:4f8:c2c:a9a0::1]:40776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus@sphalerite.org>)
 id 1ocnR9-0005U9-Dh; Mon, 26 Sep 2022 08:42:18 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1664196129;
 bh=oNbq4CUFSuA/prX7LH4aHcj0vgmWDV9mybBkSQykdM0=;
 h=From:To:Cc:Subject:Date;
 b=1raUKHawU5LtGzcrdyFkA/bBEPTqcjf9Jjon+QOna8VHmJxqH2f1NqSADctSIOGNW
 X7RLwY7whTkuQuOw+7KxBHp245+JPOY65DJ9nQHSReqjT/Y4gA5iWceuucaJ9xK6I2
 rr63UExqRYH22s4HrEEL4CG5v3IMtVrUWoigElUY=
To: qemu-devel@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>
Subject: [PATCH 1/1] 9pfs: avoid iterator invalidation in
 v9fs_mark_fids_unreclaim
Date: Mon, 26 Sep 2022 14:42:06 +0200
Message-Id: <20220926124207.1325763-1-git@sphalerite.org>
MIME-Version: 1.0
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

Previously, the yielding in v9fs_reopen_fid and put_fid could result
in other parts of the code modifying the fid table. This would
invalidate the hash table iterator, causing misbehaviour.

Now we ensure that we complete the iteration before yielding, so that
the iterator remains valid throughout the loop, and only reopen the
fids afterwards.
---

@Christian: I still haven't been able to reproduce the issue that this
commit is supposed to fix (I tried building KDE too, no problems), so
it's a bit of a shot in the dark. It certainly still runs and I think it
should fix the issue, but it would be great if you could test it.



 hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index f4c1e37202..825c39e122 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -522,33 +522,47 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
     V9fsFidState *fidp;
     gpointer fid;
     GHashTableIter iter;
+    /*
+     * The most common case is probably that we have exactly one
+     * fid for the given path, so preallocate exactly one.
+     */
+    GArray *to_reopen = g_array_sized_new(FALSE, FALSE, sizeof(V9fsFidState*), 1);
+    gint i;
 
     g_hash_table_iter_init(&iter, s->fids);
 
+    /*
+     * We iterate over the fid table looking for the entries we need
+     * to reopen, and store them in to_reopen. This is because
+     * reopening them happens asynchronously, allowing the fid table
+     * to be modified in the meantime, invalidating our iterator.
+     */
     while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
-        /*
-         * Ensure the fid survives a potential clunk request during
-         * v9fs_reopen_fid.
-         */
-        fidp->ref++;
-
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
+            /*
+             * Ensure the fid survives a potential clunk request during
+             * v9fs_reopen_fid or put_fid.
+             */
+            fidp->ref++;
+            g_array_append_val(to_reopen, fidp);
         }
+    }
 
-        /* We're done with this fid */
+    for (i=0; i < to_reopen->len; i++) {
+        fidp = g_array_index(to_reopen, V9fsFidState*, i);
+        /* reopen the file/dir if already closed */
+        err = v9fs_reopen_fid(pdu, fidp);
+        if (err < 0) {
+            put_fid(pdu, fidp);
+            g_array_free(to_reopen, TRUE);
+            return err;
+        }
         put_fid(pdu, fidp);
     }
 
+    g_array_free(to_reopen, TRUE);
+
     return 0;
 }
 
-- 
2.36.2


