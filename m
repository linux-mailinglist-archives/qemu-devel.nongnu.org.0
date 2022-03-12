Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146E4D6E9E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 13:13:34 +0100 (CET)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT0cm-0007jG-OL
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 07:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eebd764c82b49f50d83b5d64ecc28ac802fbea3b@lizzy.crudebyte.com>)
 id 1nT0Zo-0004hT-8U
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:10:28 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eebd764c82b49f50d83b5d64ecc28ac802fbea3b@lizzy.crudebyte.com>)
 id 1nT0Zm-0005XM-Rg
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=My4K+eiCxAHtELn1btGGEyng+75fSZVgSXg21Pv6JpQ=; b=G/hpJ
 h+rWP+bIjeby02goE3PfCb9lN4ahahV9oxB87fN/sdtFIS9xv7+KQRZGRQbqH5eB1qdJ63TD+QXFW
 JWvKdFLIcHcIGKUksDfXjiO2DsqApkNGGX2ZofU2QBBGyTUl8PY+yrXgeyIOfs2rI5JwauRf4heBN
 QBZuGCjyPnT5R8ZShS64PGhMmW15Ooap+cN4reBsXByAzcBcOy6rY4cNOwIlF9uZ+uLH+t6/7sHp8
 p6/zoEFOjmJKzg0QxHAtevufg/S42ovNoPc7fYXad152jOZkWJWiMvx1yAftHiitdUNHbzMrPqUvv
 d5cU7MyUcOyjjdxfAtiitZjs43GMg==;
Message-Id: <eebd764c82b49f50d83b5d64ecc28ac802fbea3b.1647083430.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1647083430.git.qemu_oss@crudebyte.com>
References: <cover.1647083430.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 12 Mar 2022 12:06:45 +0100
Subject: [PATCH v2 4/7] 9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=eebd764c82b49f50d83b5d64ecc28ac802fbea3b@lizzy.crudebyte.com;
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
Let the first loop use its own variable 'nwalked' instead, which we will
use in subsequent patch as the number of (requested) path components
successfully walked by background I/O thread.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a6d6b3f835..298f4e6548 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1764,7 +1764,7 @@ static bool same_stat_id(const struct stat *a, const struct stat *b)
 
 static void coroutine_fn v9fs_walk(void *opaque)
 {
-    int name_idx;
+    int name_idx, nwalked;
     g_autofree V9fsQID *qids = NULL;
     int i, err = 0;
     V9fsPath dpath, path;
@@ -1842,17 +1842,17 @@ static void coroutine_fn v9fs_walk(void *opaque)
             break;
         }
         stbuf = fidst;
-        for (name_idx = 0; name_idx < nwnames; name_idx++) {
+        for (nwalked = 0; nwalked < nwnames; nwalked++) {
             if (v9fs_request_cancelled(pdu)) {
                 err = -EINTR;
                 break;
             }
             if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
-                strcmp("..", wnames[name_idx].data))
+                strcmp("..", wnames[nwalked].data))
             {
                 err = s->ops->name_to_path(&s->ctx, &dpath,
-                                           wnames[name_idx].data,
-                                           &pathes[name_idx]);
+                                           wnames[nwalked].data,
+                                           &pathes[nwalked]);
                 if (err < 0) {
                     err = -errno;
                     break;
@@ -1861,13 +1861,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
                     err = -EINTR;
                     break;
                 }
-                err = s->ops->lstat(&s->ctx, &pathes[name_idx], &stbuf);
+                err = s->ops->lstat(&s->ctx, &pathes[nwalked], &stbuf);
                 if (err < 0) {
                     err = -errno;
                     break;
                 }
-                stbufs[name_idx] = stbuf;
-                v9fs_path_copy(&dpath, &pathes[name_idx]);
+                stbufs[nwalked] = stbuf;
+                v9fs_path_copy(&dpath, &pathes[nwalked]);
             }
         }
     });
-- 
2.30.2


