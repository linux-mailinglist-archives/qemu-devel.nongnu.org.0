Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4FA393533
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:57:46 +0200 (CEST)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKGP-0002F8-Cn
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <364bc324ad4dfdb87cbbb75abb7dc09b561cda2f@lizzy.crudebyte.com>)
 id 1lmKFP-0000qo-Lr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:56:43 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <364bc324ad4dfdb87cbbb75abb7dc09b561cda2f@lizzy.crudebyte.com>)
 id 1lmKFN-0002Xo-CT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=TDBLWrGlbK49ZkCBN6JkQF/18xIACpjhm2CQWGx+LIQ=; b=FSlAp
 rNj78vSJ+sKKjK6MltK7BeUfYZ+wFapHReQdT18qBMGAjK7a3eeuwVO76cy5qCPOQKg55EhPf67SY
 USaknweRQkWAfmiocbD8qL94VYIGfTuUTNZK9jfRB2JukI83s3lN8hgv/80q5w9brS9t+67WrawZc
 Ygep3vA62ttEpIxCuMG5jGsJebPJKudab9ajnPp4Di9Ryb0oiEi7gwjkbNLAn/CF6sHppxYkj7woe
 iVChliNpQ211/G9ai1wJfSE1s9KMs5/U8aKzXA77b4QzGpNTWlDaqZ/sPJjSBXeIe/DGuVnrny1KT
 NZOiYfc+GygrqJHRPxP7F7CbEiKdw==;
Message-Id: <364bc324ad4dfdb87cbbb75abb7dc09b561cda2f.1622135592.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622135592.git.qemu_oss@crudebyte.com>
References: <cover.1622135592.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 27 May 2021 19:05:43 +0200
Subject: [PATCH 3/3] 9pfs: reduce latency of Twalk
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=364bc324ad4dfdb87cbbb75abb7dc09b561cda2f@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As on the previous performance optimization on Treaddir handling;
reduce the overall latency, i.e. overall time spent on processing
a Twalk request by reducing the amount of thread hops between the
9p server's main thread and fs worker thread(s).

In fact this patch even reduces the thread hops for Twalk handling
to its theoritical minimum of exactly 2 thread hops:

main thread -> fs worker thread -> main thread

This is achieved by doing all the required fs driver tasks altogether
in a single v9fs_co_run_in_worker({ ... }); code block.

This patches also changes the way how an arbitrary path is
identified to whether it equals the 9p export root. Previously
QIDs were compared for this, which forces to be done on main thread
for resolving individual path element QIDs. For that reason POSIX
stat device number and inode number pairs are compared instead now.
Accordingly, as 9p server's root_qid member variable is no longer
used, nor are functions fid_to_qid() and not_same_qid(), hence drop
them.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 118 +++++++++++++++++++++++++++++++++------------------
 hw/9pfs/9p.h |   1 -
 2 files changed, 76 insertions(+), 43 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 825de1561d..cc1b176eb5 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -971,23 +971,6 @@ static int stat_to_qid(V9fsPDU *pdu, const struct stat *stbuf, V9fsQID *qidp)
     return 0;
 }
 
-static int coroutine_fn fid_to_qid(V9fsPDU *pdu, V9fsFidState *fidp,
-                                   V9fsQID *qidp)
-{
-    struct stat stbuf;
-    int err;
-
-    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
-    if (err < 0) {
-        return err;
-    }
-    err = stat_to_qid(pdu, &stbuf, qidp);
-    if (err < 0) {
-        return err;
-    }
-    return 0;
-}
-
 V9fsPDU *pdu_alloc(V9fsState *s)
 {
     V9fsPDU *pdu = NULL;
@@ -1461,7 +1444,6 @@ static void coroutine_fn v9fs_attach(void *opaque)
     }
     err += offset;
 
-    memcpy(&s->root_qid, &qid, sizeof(qid));
     memcpy(&s->root_st, &stbuf, sizeof(struct stat));
     trace_v9fs_attach_return(pdu->tag, pdu->id,
                              qid.type, qid.version, qid.path);
@@ -1713,12 +1695,9 @@ static bool name_is_illegal(const char *name)
     return !*name || strchr(name, '/') != NULL;
 }
 
-static bool not_same_qid(const V9fsQID *qid1, const V9fsQID *qid2)
+static bool same_stat_id(const struct stat *a, const struct stat *b)
 {
-    return
-        qid1->type != qid2->type ||
-        qid1->version != qid2->version ||
-        qid1->path != qid2->path;
+    return a->st_dev == b->st_dev && a->st_ino == b->st_ino;
 }
 
 static void coroutine_fn v9fs_walk(void *opaque)
@@ -1726,9 +1705,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
     int name_idx;
     V9fsQID *qids = NULL;
     int i, err = 0;
-    V9fsPath dpath, path;
+    V9fsPath dpath, path, *pathes = NULL;
     uint16_t nwnames;
-    struct stat stbuf;
+    struct stat stbuf, fidst, *stbufs = NULL;
     size_t offset = 7;
     int32_t fid, newfid;
     V9fsString *wnames = NULL;
@@ -1754,6 +1733,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
     if (nwnames) {
         wnames = g_new0(V9fsString, nwnames);
         qids   = g_new0(V9fsQID, nwnames);
+        stbufs = g_new0(struct stat, nwnames);
+        pathes = g_new0(V9fsPath, nwnames);
         for (i = 0; i < nwnames; i++) {
             err = pdu_unmarshal(pdu, offset, "s", &wnames[i]);
             if (err < 0) {
@@ -1774,35 +1755,85 @@ static void coroutine_fn v9fs_walk(void *opaque)
 
     v9fs_path_init(&dpath);
     v9fs_path_init(&path);
+    /*
+     * Both dpath and path initially point to fidp.
+     * Needed to handle request with nwnames == 0
+     */
+    v9fs_path_copy(&dpath, &fidp->path);
+    v9fs_path_copy(&path, &fidp->path);
 
-    err = fid_to_qid(pdu, fidp, &qid);
+    /*
+     * To keep latency (i.e. overall execution time for processing this
+     * Twalk client request) as small as possible, run all the required fs
+     * driver code altogether inside the following block.
+     */
+    v9fs_co_run_in_worker({
+        if (v9fs_request_cancelled(pdu)) {
+            err = -EINTR;
+            break;
+        }
+        err = s->ops->lstat(&s->ctx, &dpath, &fidst);
+        if (err < 0) {
+            err = -errno;
+            break;
+        }
+        stbuf = fidst;
+        for (name_idx = 0; name_idx < nwnames; name_idx++) {
+            if (v9fs_request_cancelled(pdu)) {
+                err = -EINTR;
+                break;
+            }
+            if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
+                strcmp("..", wnames[name_idx].data))
+            {
+                err = s->ops->name_to_path(&s->ctx, &dpath,
+                                        wnames[name_idx].data, &path);
+                if (err < 0) {
+                    err = -errno;
+                    break;
+                }
+                if (v9fs_request_cancelled(pdu)) {
+                    err = -EINTR;
+                    break;
+                }
+                err = s->ops->lstat(&s->ctx, &path, &stbuf);
+                if (err < 0) {
+                    err = -errno;
+                    break;
+                }
+                stbufs[name_idx] = stbuf;
+                v9fs_path_copy(&dpath, &path);
+                v9fs_path_copy(&pathes[name_idx], &path);
+            }
+        }
+    });
+    /*
+     * Handle all the rest of this Twalk request on main thread ...
+     */
     if (err < 0) {
         goto out;
     }
 
-    /*
-     * Both dpath and path initially poin to fidp.
-     * Needed to handle request with nwnames == 0
-     */
+    err = stat_to_qid(pdu, &fidst, &qid);
+    if (err < 0) {
+        goto out;
+    }
+    stbuf = fidst;
+
+    /* reset dpath and path */
     v9fs_path_copy(&dpath, &fidp->path);
     v9fs_path_copy(&path, &fidp->path);
-    for (name_idx = 0; name_idx < nwnames; name_idx++) {
-        if (not_same_qid(&pdu->s->root_qid, &qid) ||
-            strcmp("..", wnames[name_idx].data)) {
-            err = v9fs_co_name_to_path(pdu, &dpath, wnames[name_idx].data,
-                                       &path);
-            if (err < 0) {
-                goto out;
-            }
 
-            err = v9fs_co_lstat(pdu, &path, &stbuf);
-            if (err < 0) {
-                goto out;
-            }
+    for (name_idx = 0; name_idx < nwnames; name_idx++) {
+        if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
+            strcmp("..", wnames[name_idx].data))
+        {
+            stbuf = stbufs[name_idx];
             err = stat_to_qid(pdu, &stbuf, &qid);
             if (err < 0) {
                 goto out;
             }
+            v9fs_path_copy(&path, &pathes[name_idx]);
             v9fs_path_copy(&dpath, &path);
         }
         memcpy(&qids[name_idx], &qid, sizeof(qid));
@@ -1838,9 +1869,12 @@ out_nofid:
     if (nwnames && nwnames <= P9_MAXWELEM) {
         for (name_idx = 0; name_idx < nwnames; name_idx++) {
             v9fs_string_free(&wnames[name_idx]);
+            v9fs_path_free(&pathes[name_idx]);
         }
         g_free(wnames);
         g_free(qids);
+        g_free(stbufs);
+        g_free(pathes);
     }
 }
 
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 6f0b4c78c0..1567b67841 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -355,7 +355,6 @@ struct V9fsState {
     int32_t root_fid;
     Error *migration_blocker;
     V9fsConf fsconf;
-    V9fsQID root_qid;
     struct stat root_st;
     dev_t dev_id;
     struct qht qpd_table;
-- 
2.20.1


