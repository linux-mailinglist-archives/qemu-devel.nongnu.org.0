Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F89BCF3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Aug 2019 12:09:10 +0200 (CEST)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Syr-0006gq-4o
	for lists+qemu-devel@lfdr.de; Sat, 24 Aug 2019 06:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i1SxY-0006A9-OO
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 06:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i1SxX-0005XM-PU
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 06:07:48 -0400
Received: from relay.sw.ru ([185.231.240.75]:60740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i1SxU-0005Se-J3; Sat, 24 Aug 2019 06:07:44 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i1SxR-0007AX-IJ; Sat, 24 Aug 2019 13:07:41 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Sat, 24 Aug 2019 13:07:40 +0300
Message-Id: <20190824100740.61635-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] block: fix permission update in
 bdrv_replace_node
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's wrong to OR shared permissions. It may lead to crash on further
permission updates.
Also, no needs to consider previously calculated permissions, as at
this point we already bind all new parents and bdrv_get_cumulative_perm
result is enough. So fix the bug by just set permissions by
bdrv_get_cumulative_perm result.

Bug was introduced in long ago 234ac1a9025, in 2.9.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

I found this bug during my work around backup-top filter. It happens that
on filter removing, bdrv_replace_node() breaks permissions in graph which
lead to bdrv_set_backing_hd(new backing: NULL) on
assert(tighten_restrictions == false).

 block.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 874a29a983..5944124845 100644
--- a/block.c
+++ b/block.c
@@ -4165,7 +4165,6 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
 {
     BdrvChild *c, *next;
     GSList *list = NULL, *p;
-    uint64_t old_perm, old_shared;
     uint64_t perm = 0, shared = BLK_PERM_ALL;
     int ret;
 
@@ -4211,8 +4210,8 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
         bdrv_unref(from);
     }
 
-    bdrv_get_cumulative_perm(to, &old_perm, &old_shared);
-    bdrv_set_perm(to, old_perm | perm, old_shared | shared);
+    bdrv_get_cumulative_perm(to, &perm, &shared);
+    bdrv_set_perm(to, perm, shared);
 
 out:
     g_slist_free(list);
-- 
2.18.0


