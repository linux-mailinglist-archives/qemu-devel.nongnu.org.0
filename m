Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B2F72B94
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 11:40:44 +0200 (CEST)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqDlL-0008Ko-NW
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 05:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49712)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqDl8-0007s3-Tn
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqDl7-0005rI-M7
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 05:40:30 -0400
Received: from relay.sw.ru ([185.231.240.75]:56238)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqDl7-0005nr-Ek; Wed, 24 Jul 2019 05:40:29 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqDl4-0003Nw-6A; Wed, 24 Jul 2019 12:40:26 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 24 Jul 2019 12:40:25 +0300
Message-Id: <20190724094025.12442-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3] blockjob: drain all job nodes in
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
BlockJobDriver.drain becomes unused, so, drop it at all.

It's also a first step to finally get rid of blockjob->blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v3: just resend, as I've some auto returned mails and not sure that
    v2 reached recipients.

v2: apply Max's suggestions:
 - drop BlockJobDriver.drain
 - do firtly loop of bdrv_drained_begin and then separate loop
   of bdrv_drained_end.

   Hmm, a question here: should I call bdrv_drained_end in reverse
   order? Or it's OK as is?

 include/block/blockjob_int.h | 11 -----------
 block/backup.c               | 18 +-----------------
 block/mirror.c               | 26 +++-----------------------
 blockjob.c                   | 13 ++++++++-----
 4 files changed, 12 insertions(+), 56 deletions(-)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index e4a318dd15..e1abf4ee85 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -52,17 +52,6 @@ struct BlockJobDriver {
      * besides job->blk to the new AioContext.
      */
     void (*attached_aio_context)(BlockJob *job, AioContext *new_context);
-
-    /*
-     * If the callback is not NULL, it will be invoked when the job has to be
-     * synchronously cancelled or completed; it should drain BlockDriverStates
-     * as required to ensure progress.
-     *
-     * Block jobs must use the default implementation for job_driver.drain,
-     * which will in turn call this callback after doing generic block job
-     * stuff.
-     */
-    void (*drain)(BlockJob *job);
 };
 
 /**
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
index 8cb75fb409..8456ccd89d 100644
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
index 20b7f557da..78cf71d6c8 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -92,12 +92,15 @@ void block_job_free(Job *job)
 void block_job_drain(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
-    const JobDriver *drv = job->driver;
-    BlockJobDriver *bjdrv = container_of(drv, BlockJobDriver, job_driver);
+    GSList *l;
 
-    blk_drain(bjob->blk);
-    if (bjdrv->drain) {
-        bjdrv->drain(bjob);
+    for (l = bjob->nodes; l; l = l->next) {
+        BdrvChild *c = l->data;
+        bdrv_drained_begin(c->bs);
+    }
+    for (l = bjob->nodes; l; l = l->next) {
+        BdrvChild *c = l->data;
+        bdrv_drained_end(c->bs);
     }
 }
 
-- 
2.18.0


