Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123CC3BEDB3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:06:40 +0200 (CEST)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BwV-0005Ka-4R
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1m1BvL-0003nm-8t
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:05:27 -0400
Received: from kerio.kamp.de ([195.62.97.192]:39391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1m1BvI-0003Oz-LH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:05:27 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 7 Jul 2021 20:05:10 +0200
Received: (qmail 23967 invoked from network); 7 Jul 2021 18:05:13 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 7 Jul 2021 18:05:13 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id C2C3913DD24; Wed,  7 Jul 2021 20:05:13 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH] block/rbd: fix type of task->complete
Date: Wed,  7 Jul 2021 20:04:48 +0200
Message-Id: <20210707180449.32665-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

task->complete is a bool not an integer.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index 01a7b94d62..dcf82b15b8 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1066,7 +1066,7 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
 static void qemu_rbd_finish_bh(void *opaque)
 {
     RBDTask *task = opaque;
-    task->complete = 1;
+    task->complete = true;
     aio_co_wake(task->co);
 }
 
-- 
2.17.1



