Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A535CF1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 14:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYV86-0000Wt-KW
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 08:34:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYV5q-00081i-5q
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 08:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYV5p-0006Kc-7H
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 08:32:38 -0400
Received: from relay.sw.ru ([185.231.240.75]:52310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYV5o-0006EE-Ue; Wed, 05 Jun 2019 08:32:37 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYV5i-0001rG-Lf; Wed, 05 Jun 2019 15:32:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 15:32:29 +0300
Message-Id: <20190605123229.92848-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190605123229.92848-1-vsementsov@virtuozzo.com>
References: <20190605123229.92848-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 2/2] blockjob: use blk_new_pinned in
 block_job_create
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
Cc: kwolf@redhat.com, jsnow@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

child_role job already has .stay_at_node=true, so on bdrv_replace_node
operation these child are unchanged. Make block job blk behave in same
manner, to avoid inconsistent intermediate graph states and workarounds
like in mirror.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 6 +-----
 blockjob.c     | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index f8bdb5b21b..23443116e4 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -713,12 +713,8 @@ static int mirror_exit_common(Job *job)
                             &error_abort);
     bdrv_replace_node(mirror_top_bs, backing_bs(mirror_top_bs), &error_abort);
 
-    /* We just changed the BDS the job BB refers to (with either or both of the
-     * bdrv_replace_node() calls), so switch the BB back so the cleanup does
-     * the right thing. We don't need any permissions any more now. */
-    blk_remove_bs(bjob->blk);
+    /* We don't need any permissions any more now. */
     blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-    blk_insert_bs(bjob->blk, mirror_top_bs, &error_abort);
 
     bs_opaque->job = NULL;
 
diff --git a/blockjob.c b/blockjob.c
index 931d675c0c..f5c8d31491 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -398,7 +398,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
         job_id = bdrv_get_device_name(bs);
     }
 
-    blk = blk_new(bdrv_get_aio_context(bs), perm, shared_perm);
+    blk = blk_new_pinned(bdrv_get_aio_context(bs), perm, shared_perm);
     ret = blk_insert_bs(blk, bs, errp);
     if (ret < 0) {
         blk_unref(blk);
-- 
2.18.0


