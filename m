Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D52D2E197
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:50:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0q3-0005n9-89
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:50:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n8-0004V5-Vo
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n7-00053R-Rh
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:43146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n7-00051w-IO; Wed, 29 May 2019 11:47:01 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n2-0004iP-7J; Wed, 29 May 2019 18:46:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 29 May 2019 18:46:50 +0300
Message-Id: <20190529154654.95870-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190529154654.95870-1-vsementsov@virtuozzo.com>
References: <20190529154654.95870-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 3/7] block: allow not one child for implicit
 node
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upcoming backup-top filter wants to operate like usual implicit filter
node with fall-through to backing child. But also needs additional
target child, let's support that.

On the other hand, after backup completion (before job dismiss) filter
is still attached to job blk, but don't have any children. Support this
too.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 57216f4115..3f4de3ae32 100644
--- a/block.c
+++ b/block.c
@@ -6200,9 +6200,20 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     }
 
     if (bs->implicit) {
-        /* For implicit nodes, just copy everything from the single child */
+        /*
+         * For implicit nodes, just copy everything from the single child or
+         * from backing, if there are several children.
+         * If there are no children for some reason (filter is still attached
+         * to block-job blk, but already removed from backing chain of device)
+         * do nothing.
+         */
         child = QLIST_FIRST(&bs->children);
-        assert(QLIST_NEXT(child, next) == NULL);
+        if (!child) {
+            return;
+        } else if (QLIST_NEXT(child, next)) {
+            assert(bs->backing);
+            child = bs->backing;
+        }
 
         pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
                 child->bs->exact_filename);
-- 
2.18.0


