Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960D3FEDAE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:21:21 +0200 (CEST)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlia-0001nQ-0G
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <97b1d8fdf6c923203968f44805e25dc92b11a317@lizzy.crudebyte.com>)
 id 1mLlFz-0001Fu-QV
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:47 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <97b1d8fdf6c923203968f44805e25dc92b11a317@lizzy.crudebyte.com>)
 id 1mLlFs-0006rE-Sf
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=huvXyPhyEyRe/ipDmgg8quhEL+BftkN51cGEvm9v/o4=; b=LI6Fw
 ED8ehxO8CF1t4eLraVU4AMmflOIjQW1xigmnCdQRSA33kQdC2mLe+gVYmcWIhjFvjTuv8koAA91y2
 Bn17or/zgiU8ahcI+q1ynkIeavLPhYFtG8U8THTYLRoY/iOKvJP+wrJ7rsZ1U/rU2EH1nXehQyzI6
 L7ytA+JSoa03s7TjrnZwWBlh551VnXrEhosa8ctJeGN9mNziUnE0y+J81hUJM3wH+e+W+zd2952kd
 mg9M+ScfyQyrfUlMzXXLwzNRIiVIKv98QK1RX+7nNoY2VL4T6x1bYvn84te1DMrltmgonufF15FXC
 rx/gTEbhpz5KZLKo5JwvkBaiTEjxA==;
Message-Id: <97b1d8fdf6c923203968f44805e25dc92b11a317.1630582967.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1630582967.git.qemu_oss@crudebyte.com>
References: <cover.1630582967.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 02 Sep 2021 13:42:47 +0200
Subject: [PULL 1/3] hw/9pfs: avoid 'path' copy in v9fs_walk()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=97b1d8fdf6c923203968f44805e25dc92b11a317@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3.1629208359.git.qemu_oss@crudebyte.com>
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


