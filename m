Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D076148D9F7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:47:55 +0100 (CET)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81OM-0004vd-J7
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n81LB-0002qE-1q
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:44:37 -0500
Received: from kerio.kamp.de ([195.62.97.192]:47258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1n81L7-0000ue-2X
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:44:34 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:44:27 +0100
Received: (qmail 29074 invoked from network); 13 Jan 2022 14:44:27 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 13 Jan 2022 14:44:27 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id D642313D99A; Thu, 13 Jan 2022 15:44:27 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V2 for-6.2 1/2] block/rbd: fix handling of holes in
 .bdrv_co_block_status
Date: Thu, 13 Jan 2022 15:44:25 +0100
Message-Id: <20220113144426.4036493-2-pl@kamp.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113144426.4036493-1-pl@kamp.de>
References: <20220113144426.4036493-1-pl@kamp.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 qemu-stable@nongnu.org, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the assumption that we can't hit a hole if we do not diff against a snapshot was wrong.

We can see a hole in an image if we diff against base if there exists an older snapshot
of the image and we have discarded blocks in the image where the snapshot has data.

Fix this by simply handling a hole like an unallocated area. There are no callbacks
for unallocated areas so just bail out if we hit a hole.

Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
Suggested-by: Ilya Dryomov <idryomov@gmail.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index def96292e0..20bb896c4a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1279,11 +1279,11 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
     RBDDiffIterateReq *req = opaque;
 
     assert(req->offs + req->bytes <= offs);
-    /*
-     * we do not diff against a snapshot so we should never receive a callback
-     * for a hole.
-     */
-    assert(exists);
+
+    /* treat a hole like an unallocated area and bail out */
+    if (!exists) {
+        return 0;
+    }
 
     if (!req->exists && offs > req->offs) {
         /*
-- 
2.25.1



