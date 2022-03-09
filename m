Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A94D39FF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:20:56 +0100 (CET)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1rj-00005L-AG
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:20:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <00bee0f7a89147c90c672f07b9a1ebcd9180215b@lizzy.crudebyte.com>)
 id 1nS1o7-0005lL-Bf
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:17:11 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:52541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <00bee0f7a89147c90c672f07b9a1ebcd9180215b@lizzy.crudebyte.com>)
 id 1nS1o5-0005N0-Ft
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=UqAt3a9BTQwGRW5/taODl7/EqgqAT+6O0K+arOyXnzU=; b=hqOeL
 pqB65RXGPuZcbMH0QJIuV3SttzVd/3YWadrLFuerSpHhs8taRNlduw5WUa/ntVYqN3K4trq2DfIlK
 /1snUwJ9fAe5CXmE6KYm+zltVuwHFko674Gruc7VsPzAu1yPQ1WsdFNESHBOk8nel+lloz8i3+ZC0
 OAz9uOzr0BtvJN5omcRMiXFBKBGMgi/+fS8pLrccy0e5ncqMAcVG+xUiV//7SWm/IKHMk1K6N3SP9
 Wsb6LQpXD+T27QxauJZUpcPanNEFI6Kn9nCIJzfe/RuHEXYb5LMXdy+L/Gfn2oIfckiIa49hM02Vw
 wOcNfhRR68kAdQ6T5V0ZGJrmKREag==;
Message-Id: <00bee0f7a89147c90c672f07b9a1ebcd9180215b.1646850707.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 18:12:17 +0100
Subject: [PATCH 4/6] 9pfs: refactor 'name_idx' -> 'nvalid' in v9fs_walk()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=00bee0f7a89147c90c672f07b9a1ebcd9180215b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The local variable 'name_idx' is used in two loops in function v9fs_walk().
Let the first loop use its own variable 'nvalid' instead, which we will use
in subsequent patches as the number of (requested) path components
successfully retrieved/walked by background I/O thread.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a6d6b3f835..6cdc566866 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1764,7 +1764,7 @@ static bool same_stat_id(const struct stat *a, const struct stat *b)
 
 static void coroutine_fn v9fs_walk(void *opaque)
 {
-    int name_idx;
+    int name_idx, nvalid;
     g_autofree V9fsQID *qids = NULL;
     int i, err = 0;
     V9fsPath dpath, path;
@@ -1842,17 +1842,17 @@ static void coroutine_fn v9fs_walk(void *opaque)
             break;
         }
         stbuf = fidst;
-        for (name_idx = 0; name_idx < nwnames; name_idx++) {
+        for (nvalid = 0; nvalid < nwnames; nvalid++) {
             if (v9fs_request_cancelled(pdu)) {
                 err = -EINTR;
                 break;
             }
             if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
-                strcmp("..", wnames[name_idx].data))
+                strcmp("..", wnames[nvalid].data))
             {
                 err = s->ops->name_to_path(&s->ctx, &dpath,
-                                           wnames[name_idx].data,
-                                           &pathes[name_idx]);
+                                           wnames[nvalid].data,
+                                           &pathes[nvalid]);
                 if (err < 0) {
                     err = -errno;
                     break;
@@ -1861,13 +1861,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
                     err = -EINTR;
                     break;
                 }
-                err = s->ops->lstat(&s->ctx, &pathes[name_idx], &stbuf);
+                err = s->ops->lstat(&s->ctx, &pathes[nvalid], &stbuf);
                 if (err < 0) {
                     err = -errno;
                     break;
                 }
-                stbufs[name_idx] = stbuf;
-                v9fs_path_copy(&dpath, &pathes[name_idx]);
+                stbufs[nvalid] = stbuf;
+                v9fs_path_copy(&dpath, &pathes[nvalid]);
             }
         }
     });
-- 
2.30.2


