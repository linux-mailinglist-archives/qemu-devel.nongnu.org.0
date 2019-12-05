Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2C114381
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 16:27:37 +0100 (CET)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ict2W-0005t6-0U
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 10:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsvy-0000Bk-H7
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsvu-0005nY-SU
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:49 -0500
Received: from relay.sw.ru ([185.231.240.75]:43534)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvt-0005aC-7c; Thu, 05 Dec 2019 10:20:45 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvc-00007O-BD; Thu, 05 Dec 2019 18:20:28 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/21] block/snapshot: rename Error ** parameter to more
 common errp
Date: Thu,  5 Dec 2019 18:20:08 +0300
Message-Id: <20191205152019.8454-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205152019.8454-1-vsementsov@virtuozzo.com>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@Redhat.com>
---
 include/block/snapshot.h | 2 +-
 block/snapshot.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index b5d5084a12..2bfcd57578 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -78,7 +78,7 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
 
 bool bdrv_all_can_snapshot(BlockDriverState **first_bad_bs);
 int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bsd_bs,
-                             Error **err);
+                             Error **errp);
 int bdrv_all_goto_snapshot(const char *name, BlockDriverState **first_bad_bs,
                            Error **errp);
 int bdrv_all_find_snapshot(const char *name, BlockDriverState **first_bad_bs);
diff --git a/block/snapshot.c b/block/snapshot.c
index 8081616ae9..bd9fb01817 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -426,7 +426,7 @@ fail:
 }
 
 int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bad_bs,
-                             Error **err)
+                             Error **errp)
 {
     int ret = 0;
     BlockDriverState *bs;
@@ -441,7 +441,7 @@ int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bad_bs,
             bdrv_snapshot_find(bs, snapshot, name) >= 0)
         {
             ret = bdrv_snapshot_delete(bs, snapshot->id_str,
-                                       snapshot->name, err);
+                                       snapshot->name, errp);
         }
         aio_context_release(ctx);
         if (ret < 0) {
-- 
2.21.0


