Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179163890C3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:26:33 +0200 (CEST)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljN9b-0007Kz-SU
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ljN7P-0004YF-MZ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:24:15 -0400
Received: from kerio.kamp.de ([195.62.97.192]:37903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ljN7N-0005Et-NU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:24:15 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:24:06 +0200
Received: (qmail 19145 invoked from network); 19 May 2021 14:24:09 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 19 May 2021 14:24:09 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 79E9813DD27; Wed, 19 May 2021 16:24:09 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V3 6/6] block/rbd: drop qemu_rbd_refresh_limits
Date: Wed, 19 May 2021 16:23:59 +0200
Message-Id: <20210519142359.23083-7-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210519142359.23083-1-pl@kamp.de>
References: <20210519142359.23083-1-pl@kamp.de>
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
 pbonzini@redhat.com, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

librbd supports 1 byte alignment for all aio operations.

Currently, there is no API call to query limits from the ceph backend.
So drop the bdrv_refresh_limits completely until there is such an API call.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index ee13f08a74..368a674aa0 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -228,14 +228,6 @@ done:
     return;
 }
 
-
-static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
-{
-    /* XXX Does RBD support AIO on less than 512-byte alignment? */
-    bs->bl.request_alignment = 512;
-}
-
-
 static int qemu_rbd_set_auth(rados_t cluster, BlockdevOptionsRbd *opts,
                              Error **errp)
 {
@@ -1128,7 +1120,6 @@ static BlockDriver bdrv_rbd = {
     .format_name            = "rbd",
     .instance_size          = sizeof(BDRVRBDState),
     .bdrv_parse_filename    = qemu_rbd_parse_filename,
-    .bdrv_refresh_limits    = qemu_rbd_refresh_limits,
     .bdrv_file_open         = qemu_rbd_open,
     .bdrv_close             = qemu_rbd_close,
     .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
-- 
2.17.1



