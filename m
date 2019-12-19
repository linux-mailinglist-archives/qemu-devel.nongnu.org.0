Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77553125D07
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 09:54:24 +0100 (CET)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihrZf-0002Vk-DF
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 03:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihrWj-00071B-Re
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:51:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihrWi-00050Y-HY
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:51:21 -0500
Received: from relay.sw.ru ([185.231.240.75]:55346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihrWf-0004Xj-67; Thu, 19 Dec 2019 03:51:17 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihrWU-0004DF-KO; Thu, 19 Dec 2019 11:51:06 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/5] block: Mark commit and mirror as filter drivers
Date: Thu, 19 Dec 2019 11:51:02 +0300
Message-Id: <20191219085106.22309-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219085106.22309-1-vsementsov@virtuozzo.com>
References: <20191219085106.22309-1-vsementsov@virtuozzo.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 stefanha@redhat.com, den@openvz.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

The commit and mirror block nodes are filters, so they should be marked
as such.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
   [squash comment fix from another Max's patch and adjust commit msg]
---
 include/block/block_int.h | 8 +++++---
 block/commit.c            | 2 ++
 block/mirror.c            | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index dd033d0b37..964ce58481 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -89,9 +89,11 @@ struct BlockDriver {
     int instance_size;
 
     /* set to true if the BlockDriver is a block filter. Block filters pass
-     * certain callbacks that refer to data (see block.c) to their bs->file if
-     * the driver doesn't implement them. Drivers that do not wish to forward
-     * must implement them and return -ENOTSUP.
+     * certain callbacks that refer to data (see block.c) to their bs->file
+     * or bs->backing (whichever one exists) if the driver doesn't implement
+     * them. Drivers that do not wish to forward must implement them and return
+     * -ENOTSUP.
+     * Note that filters are not allowed to modify data.
      */
     bool is_filter;
     /* for snapshots block filter like Quorum can implement the
diff --git a/block/commit.c b/block/commit.c
index 23c90b3b91..9b455c4285 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -253,6 +253,8 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      = bdrv_commit_top_refresh_filename,
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
+
+    .is_filter                  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index f0f2d9dff1..8cbbe1e065 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1505,6 +1505,8 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      = bdrv_mirror_top_refresh_filename,
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
+
+    .is_filter                  = true,
 };
 
 static BlockJob *mirror_start_job(
-- 
2.21.0


