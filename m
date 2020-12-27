Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6092E31E4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:46:06 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZBF-0003oC-UM
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZ8J-0001X8-Rc
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:43:03 -0500
Received: from kerio.kamp.de ([195.62.97.192]:33923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZ8H-0003yv-U2
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:43:03 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:42:42 +0100
Received: (qmail 22357 invoked from network); 27 Dec 2020 16:42:44 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 27 Dec 2020 16:42:44 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 5C95D13DD24; Sun, 27 Dec 2020 17:42:44 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 3/7] block/rbd: use stored image_size in qemu_rbd_getlength
Date: Sun, 27 Dec 2020 17:42:32 +0100
Message-Id: <20201227164236.10143-4-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201227164236.10143-1-pl@kamp.de>
References: <20201227164236.10143-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index bc8cf8af9b..a2da70e37f 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -956,15 +956,7 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
-    int r;
-
-    r = rbd_stat(s->image, &info, sizeof(info));
-    if (r < 0) {
-        return r;
-    }
-
-    return info.size;
+    return s->image_size;
 }
 
 static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
-- 
2.17.1



