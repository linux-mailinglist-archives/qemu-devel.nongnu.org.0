Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EBE1CFB7A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 19:00:38 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYYGj-00044p-RX
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 13:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7k-0005OQ-Iu; Tue, 12 May 2020 12:51:20 -0400
Received: from relay.sw.ru ([185.231.240.75]:50584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7j-0001RI-3K; Tue, 12 May 2020 12:51:20 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7C-0004nT-9T; Tue, 12 May 2020 19:50:46 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 01/15] block: Mark commit and mirror as filter drivers
Date: Tue, 12 May 2020 19:50:31 +0300
Message-Id: <1589302245-893269-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589302245-893269-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1589302245-893269-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 10:53:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

The commit and mirror block nodes are filters, so they should be marked
as such.  (Strictly speaking, BDS.is_filter's documentation states that
a filter's child must be bs->file.  The following patch will relax this
restriction, however.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/commit.c | 2 ++
 block/mirror.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/block/commit.c b/block/commit.c
index 87f6096..445a280 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -240,6 +240,8 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      = bdrv_commit_top_refresh_filename,
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
+
+    .is_filter                  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index aca95c9..b6de24b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1527,6 +1527,8 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_co_block_status       = bdrv_co_block_status_from_backing,
     .bdrv_refresh_filename      = bdrv_mirror_top_refresh_filename,
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
+
+    .is_filter                  = true,
 };
 
 static BlockJob *mirror_start_job(
-- 
1.8.3.1


