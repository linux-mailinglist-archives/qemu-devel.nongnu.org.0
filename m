Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7A39BED2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:31:49 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDfh-0007RL-2E
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1a6701674afc4f08d40396e3aa2631e18a4dbb33@lizzy.crudebyte.com>)
 id 1lpCqp-00052u-MH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:15 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1a6701674afc4f08d40396e3aa2631e18a4dbb33@lizzy.crudebyte.com>)
 id 1lpCqn-0004hW-Ga
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=3mSMktzPM7x/Zr9u1yWyuv2LYWx7aj6+VgFdfRJb+Ls=; b=LPUuY
 5FWXAIoaJ/1aULloq4L26pFU6rDXh0Xg2WzsKo8KFPpuGXDJ5LDUqCnbG9SpKFwF3MDftp6M4S+To
 elxq5WD4aplVVlyVGVN8ShgDVIwIi191z4u5uv1nAXWLjOpDm/7Yl/xtnZWH2B1QaIWol+GgyDiy1
 MDAC6a0ZOMUYQDxGw5sHNq5VqumJcLzMvVW7vu04ZRHSp5HTBh5BJF4fFnLgnzDN64Qq39Asb+sUu
 cUiRETk2XPhhKbWFVd4SNydW7+Fgtr/axcO3pmPz/rOAONbJwipzHwAwV2R8PQne9hrzfK9o6FV9+
 KS/NaSFRvWFqWwwTUEPoG0zxDJQEg==;
Message-Id: <1a6701674afc4f08d40396e3aa2631e18a4dbb33.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 4 Jun 2021 17:38:31 +0200
Subject: [PATCH v2 7/7] 9pfs: reduce latency of Twalk
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1a6701674afc4f08d40396e3aa2631e18a4dbb33@lizzy.crudebyte.com;
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

As with previous performance optimization on Treaddir handling;
reduce the overall latency, i.e. overall time spent on processing
a Twalk request by reducing the amount of thread hops between the
9p server's main thread and fs worker thread(s).

In fact this patch even reduces the thread hops for Twalk handling
to its theoritical minimum of exactly 2 thread hops:

main thread -> fs worker thread -> main thread

This is achieved by doing all the required fs driver tasks altogether
in a single v9fs_co_run_in_worker({ ... }); code block.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 89 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 19 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 7be07f2d68..2815257f42 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1705,9 +1705,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
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
@@ -1733,6 +1733,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
     if (nwnames) {
         wnames = g_new0(V9fsString, nwnames);
         qids   = g_new0(V9fsQID, nwnames);
+        stbufs = g_new0(struct stat, nwnames);
+        pathes = g_new0(V9fsPath, nwnames);
         for (i = 0; i < nwnames; i++) {
             err = pdu_unmarshal(pdu, offset, "s", &wnames[i]);
             if (err < 0) {
@@ -1753,39 +1755,85 @@ static void coroutine_fn v9fs_walk(void *opaque)
 
     v9fs_path_init(&dpath);
     v9fs_path_init(&path);
+    /*
+     * Both dpath and path initially point to fidp.
+     * Needed to handle request with nwnames == 0
+     */
+    v9fs_path_copy(&dpath, &fidp->path);
+    v9fs_path_copy(&path, &fidp->path);
 
-    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
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
-    err = stat_to_qid(pdu, &stbuf, &qid);
+
+    err = stat_to_qid(pdu, &fidst, &qid);
     if (err < 0) {
         goto out;
     }
+    stbuf = fidst;
 
-    /*
-     * Both dpath and path initially poin to fidp.
-     * Needed to handle request with nwnames == 0
-     */
+    /* reset dpath and path */
     v9fs_path_copy(&dpath, &fidp->path);
     v9fs_path_copy(&path, &fidp->path);
+
     for (name_idx = 0; name_idx < nwnames; name_idx++) {
         if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
-            strcmp("..", wnames[name_idx].data)) {
-            err = v9fs_co_name_to_path(pdu, &dpath, wnames[name_idx].data,
-                                       &path);
-            if (err < 0) {
-                goto out;
-            }
-
-            err = v9fs_co_lstat(pdu, &path, &stbuf);
-            if (err < 0) {
-                goto out;
-            }
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
@@ -1821,9 +1869,12 @@ out_nofid:
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
 
-- 
2.20.1


