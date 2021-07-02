Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF83B9DE8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:11:38 +0200 (CEST)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFCy-0005Uv-JI
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBM-0002tM-G8
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:09:56 -0400
Received: from kerio.kamp.de ([195.62.97.192]:54449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBK-0006Y1-Gk
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:09:56 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 2 Jul 2021 11:09:42 +0200
Received: (qmail 37498 invoked from network); 2 Jul 2021 09:09:43 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 2 Jul 2021 09:09:43 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id BE86413DD27; Fri,  2 Jul 2021 11:09:43 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V4 3/6] block/rbd: update s->image_size in qemu_rbd_getlength
Date: Fri,  2 Jul 2021 11:09:32 +0200
Message-Id: <20210702090935.15300-4-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702090935.15300-1-pl@kamp.de>
References: <20210702090935.15300-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

while at it just call rbd_get_size and avoid rbd_stat.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index b4caea4f1b..1f8dc84079 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -968,15 +968,14 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
     int r;
 
-    r = rbd_stat(s->image, &info, sizeof(info));
+    r = rbd_get_size(s->image, &s->image_size);
     if (r < 0) {
         return r;
     }
 
-    return info.size;
+    return s->image_size;
 }
 
 static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
-- 
2.17.1



