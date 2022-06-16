Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0A54DFEF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:22:48 +0200 (CEST)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1naJ-0005MU-IQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <fd6c979e651a2163062b746e01adf6f267c8e874@lizzy.crudebyte.com>)
 id 1o1nLl-0007K0-I7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:45 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <fd6c979e651a2163062b746e01adf6f267c8e874@lizzy.crudebyte.com>)
 id 1o1nLk-0003KI-5W
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=LfOg2LJMp+lzmauAGTMKtTKYtVr9WibU0AurDQsfIYI=; b=d2SR/
 QH//QplBsViZTxcD1trRxVz8DdOEMuir3n2KLLmkt3MKG+J6SkixraejP5OOtUYhZSVrJz8PTxboI
 dlXUUgwdfN4WpuF66Ynt0eb4iWTeorOVsG2hW7oChrcSEK4rWrwCJLnkIiNNqPyi1+IXvZ1QGCCZm
 zfs9Zh1bLkbLfgsZG8LVCOwjYP4rz7iOA6Xkjt8nr+06KqgDAqCBbP2D76u5azf54/bsn5WXvpGSw
 +702dvleeOX6CwdEK7STDgng4PRrs6z4hUlAy17MnAAvq/XBlwHLTUy4CJxfIZyuNrg/HQcEKGGRZ
 Ty4cKahG8BTrAou4KXQ/nHsHavp8w==;
Message-Id: <fd6c979e651a2163062b746e01adf6f267c8e874.1655377203.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 4/7] 9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=fd6c979e651a2163062b746e01adf6f267c8e874@lizzy.crudebyte.com;
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
Message-Id: <d506308e7e343023c4db95d0e6053dd2627ed3c1.1647339025.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 0cd0c14c2a..f29611e9ed 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1766,7 +1766,7 @@ static bool same_stat_id(const struct stat *a, const struct stat *b)
 
 static void coroutine_fn v9fs_walk(void *opaque)
 {
-    int name_idx;
+    int name_idx, nwalked;
     g_autofree V9fsQID *qids = NULL;
     int i, err = 0;
     V9fsPath dpath, path;
@@ -1844,17 +1844,17 @@ static void coroutine_fn v9fs_walk(void *opaque)
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
@@ -1863,13 +1863,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
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


