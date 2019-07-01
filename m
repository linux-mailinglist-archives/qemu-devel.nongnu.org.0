Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E914E4BC4F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 17:05:00 +0200 (CEST)
Received: from localhost ([::1]:39092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdc8y-0004mz-2W
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 11:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdc0g-0005cr-6H
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:56:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdbpX-0006UE-DH
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:44:57 -0400
Received: from relay.sw.ru ([185.231.240.75]:55958)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdbpV-0006RT-TC; Wed, 19 Jun 2019 10:44:55 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdbpQ-0000Eu-8M; Wed, 19 Jun 2019 17:44:48 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 19 Jun 2019 17:44:47 +0300
Message-Id: <20190619144447.215894-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190619144447.215894-1-vsementsov@virtuozzo.com>
References: <20190619144447.215894-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] blockjob: drain all job nodes in
 block_job_drain
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of draining additional nodes in each job code, let's do it in
common block_job_drain, draining just all job's children.

It's also a first step to finally get rid of blockjob->blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

As a follow-up for "block: drop bs->job" recently merged, I'm now trying
to drop BlockJob.blk pointer, jobs really works with several nodes and
now reason to keep special blk for one of the children, and no reason to
handle nodes differently in, for example, backup code..

And as a first step I need to sort out block_job_drain, and here is my
suggestion on it.

 block/backup.c | 18 +-----------------
 block/mirror.c | 26 +++-----------------------
 blockjob.c     |  7 ++++++-
 3 files changed, 10 insertions(+), 41 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 715e1d3be8..7930004bbd 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -320,21 +320,6 @@ void backup_do_checkpoint(BlockJob *job, Error **errp)
     hbitmap_set(backup_job->copy_bitmap, 0, backup_job->len);
 }
 
-static void backup_drain(BlockJob *job)
-{
-    BackupBlockJob *s = container_of(job, BackupBlockJob, common);
-
-    /* Need to keep a reference in case blk_drain triggers execution
-     * of backup_complete...
-     */
-    if (s->target) {
-        BlockBackend *target = s->target;
-        blk_ref(target);
-        blk_drain(target);
-        blk_unref(target);
-    }
-}
-
 static BlockErrorAction backup_error_action(BackupBlockJob *job,
                                             bool read, int error)
 {
@@ -493,8 +478,7 @@ static const BlockJobDriver backup_job_driver = {
         .commit                 = backup_commit,
         .abort                  = backup_abort,
         .clean                  = backup_clean,
-    },
-    .drain                  = backup_drain,
+    }
 };
 
 static int64_t backup_calculate_cluster_size(BlockDriverState *target,
diff --git a/block/mirror.c b/block/mirror.c
index d17be4cdbc..6bea99558f 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -644,14 +644,11 @@ static int mirror_exit_common(Job *job)
     bdrv_ref(mirror_top_bs);
     bdrv_ref(target_bs);
 
-    /* Remove target parent that still uses BLK_PERM_WRITE/RESIZE before
+    /*
+     * Remove target parent that still uses BLK_PERM_WRITE/RESIZE before
      * inserting target_bs at s->to_replace, where we might not be able to get
      * these permissions.
-     *
-     * Note that blk_unref() alone doesn't necessarily drop permissions because
-     * we might be running nested inside mirror_drain(), which takes an extra
-     * reference, so use an explicit blk_set_perm() first. */
-    blk_set_perm(s->target, 0, BLK_PERM_ALL, &error_abort);
+     */
     blk_unref(s->target);
     s->target = NULL;
 
@@ -1143,21 +1140,6 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
-static void mirror_drain(BlockJob *job)
-{
-    MirrorBlockJob *s = container_of(job, MirrorBlockJob, common);
-
-    /* Need to keep a reference in case blk_drain triggers execution
-     * of mirror_complete...
-     */
-    if (s->target) {
-        BlockBackend *target = s->target;
-        blk_ref(target);
-        blk_drain(target);
-        blk_unref(target);
-    }
-}
-
 static const BlockJobDriver mirror_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(MirrorBlockJob),
@@ -1172,7 +1154,6 @@ static const BlockJobDriver mirror_job_driver = {
         .complete               = mirror_complete,
     },
     .drained_poll           = mirror_drained_poll,
-    .drain                  = mirror_drain,
 };
 
 static const BlockJobDriver commit_active_job_driver = {
@@ -1189,7 +1170,6 @@ static const BlockJobDriver commit_active_job_driver = {
         .complete               = mirror_complete,
     },
     .drained_poll           = mirror_drained_poll,
-    .drain                  = mirror_drain,
 };
 
 static void coroutine_fn
diff --git a/blockjob.c b/blockjob.c
index 458ae76f51..0cabdc867d 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -94,8 +94,13 @@ void block_job_drain(Job *job)
     BlockJob *bjob = container_of(job, BlockJob, job);
     const JobDriver *drv = job->driver;
     BlockJobDriver *bjdrv = container_of(drv, BlockJobDriver, job_driver);
+    GSList *l;
+
+    for (l = bjob->nodes; l; l = l->next) {
+        BdrvChild *c = l->data;
+        bdrv_drain(c->bs);
+    }
 
-    blk_drain(bjob->blk);
     if (bjdrv->drain) {
         bjdrv->drain(bjob);
     }
-- 
2.18.0


