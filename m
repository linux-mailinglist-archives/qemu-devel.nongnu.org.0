Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E483EEE1D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:07:34 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzkZ-0002h2-Vo
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3@lizzy.crudebyte.com>)
 id 1mFziy-0000s7-78
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:05:52 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3@lizzy.crudebyte.com>)
 id 1mFzit-0006aT-CJ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=OaO3YB+4zeFcNbwwHKkr3fnRXdRx4zTA07GodXV//E8=; b=WwXEb
 OzBXBIA+BS5SYEqM1yniX7bz0ut3x3bm+AnMc91tG7lNIW7m+ARq8Oa7yzzbTnFdacPYGJihvCmox
 wDCgLgx+yDJ+HY8PqfN1X9sUN9CiccQHigg0MCC1K6dZX493FzNHIpquKirSzLJZMGTfr0GCqfa8D
 BS4XGEb0vblQm0xMzcSPLqClXJ08A6v1H3avQcyTYCl6EHNOJUBcWUS7B65njpoNIeZEpb4zBDqBm
 jDq5FsT3TKqsrv/Zvmn2JojqBRr+Q8hqW8WILa2PWpRfVTfXa7su3aLnFIRR/jaLNBMgTX8s4gGO+
 RQO/xQ8Lp76cRtm94Wd+6uKqPYuRQ==;
Message-Id: <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3.1629208359.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629208359.git.qemu_oss@crudebyte.com>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 17 Aug 2021 14:38:24 +0200
Subject: [PATCH 1/2] hw/9pfs: avoid 'path' copy in v9fs_walk()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3@lizzy.crudebyte.com;
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

The v9fs_walk() function resolves all client submitted path nodes to the
local 'pathes' array. Using a separate string scalar variable 'path'
inside the background worker thread loop and copying that local 'path'
string scalar variable subsequently to the 'pathes' array (at the end of
each loop iteration) is not necessary.

Instead simply resolve each path directly to the 'pathes' array and
don't use the string scalar variable 'path' inside the fs worker thread
loop at all.

The only advantage of the 'path' scalar was that in case of an error
the respective 'pathes' element would not be filled. Right now this is
not an issue as the v9fs_walk() function returns as soon as any error
occurs.

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2815257f42..4d642ab12a 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1787,7 +1787,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
                 strcmp("..", wnames[name_idx].data))
             {
                 err = s->ops->name_to_path(&s->ctx, &dpath,
-                                        wnames[name_idx].data, &path);
+                                           wnames[name_idx].data,
+                                           &pathes[name_idx]);
                 if (err < 0) {
                     err = -errno;
                     break;
@@ -1796,14 +1797,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
                     err = -EINTR;
                     break;
                 }
-                err = s->ops->lstat(&s->ctx, &path, &stbuf);
+                err = s->ops->lstat(&s->ctx, &pathes[name_idx], &stbuf);
                 if (err < 0) {
                     err = -errno;
                     break;
                 }
                 stbufs[name_idx] = stbuf;
-                v9fs_path_copy(&dpath, &path);
-                v9fs_path_copy(&pathes[name_idx], &path);
+                v9fs_path_copy(&dpath, &pathes[name_idx]);
             }
         }
     });
-- 
2.20.1


