Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248123D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSl9W-0002V2-8F
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:28:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkx8-00006C-8V
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkx4-0003iH-KD
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwz-0003eb-Ez; Mon, 20 May 2019 12:15:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89EB93D3C;
	Mon, 20 May 2019 16:15:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1E9718AA0;
	Mon, 20 May 2019 16:15:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:43 +0200
Message-Id: <20190520161453.30723-15-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 20 May 2019 16:15:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/24] blockjob: Propagate AioContext change to
 all job nodes
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block jobs require that all of the nodes the job is using are in the
same AioContext. Therefore all BdrvChild objects of the job propagate
.(can_)set_aio_context to all other job nodes, so that the switch is
checked and performed consistently even if both nodes are in different
subtrees.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/backup.c |  8 --------
 block/mirror.c | 10 +---------
 blockjob.c     | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 910ed764aa..916817d8b1 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -300,13 +300,6 @@ static void backup_clean(Job *job)
     s->target =3D NULL;
 }
=20
-static void backup_attached_aio_context(BlockJob *job, AioContext *aio_c=
ontext)
-{
-    BackupBlockJob *s =3D container_of(job, BackupBlockJob, common);
-
-    blk_set_aio_context(s->target, aio_context);
-}
-
 void backup_do_checkpoint(BlockJob *job, Error **errp)
 {
     BackupBlockJob *backup_job =3D container_of(job, BackupBlockJob, com=
mon);
@@ -558,7 +551,6 @@ static const BlockJobDriver backup_job_driver =3D {
         .abort                  =3D backup_abort,
         .clean                  =3D backup_clean,
     },
-    .attached_aio_context   =3D backup_attached_aio_context,
     .drain                  =3D backup_drain,
 };
=20
diff --git a/block/mirror.c b/block/mirror.c
index ff15cfb197..ec4bd9f404 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1142,13 +1142,6 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
=20
-static void mirror_attached_aio_context(BlockJob *job, AioContext *new_c=
ontext)
-{
-    MirrorBlockJob *s =3D container_of(job, MirrorBlockJob, common);
-
-    blk_set_aio_context(s->target, new_context);
-}
-
 static void mirror_drain(BlockJob *job)
 {
     MirrorBlockJob *s =3D container_of(job, MirrorBlockJob, common);
@@ -1178,7 +1171,6 @@ static const BlockJobDriver mirror_job_driver =3D {
         .complete               =3D mirror_complete,
     },
     .drained_poll           =3D mirror_drained_poll,
-    .attached_aio_context   =3D mirror_attached_aio_context,
     .drain                  =3D mirror_drain,
 };
=20
@@ -1196,7 +1188,6 @@ static const BlockJobDriver commit_active_job_drive=
r =3D {
         .complete               =3D mirror_complete,
     },
     .drained_poll           =3D mirror_drained_poll,
-    .attached_aio_context   =3D mirror_attached_aio_context,
     .drain                  =3D mirror_drain,
 };
=20
@@ -1612,6 +1603,7 @@ static void mirror_start_job(const char *job_id, Bl=
ockDriverState *bs,
          * ensure that. */
         blk_set_force_allow_inactivate(s->target);
     }
+    blk_set_allow_aio_context_change(s->target, true);
=20
     s->replaces =3D g_strdup(replaces);
     s->on_source_error =3D on_source_error;
diff --git a/blockjob.c b/blockjob.c
index 730101d282..24e6093a9c 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -183,11 +183,44 @@ static void child_job_drained_end(BdrvChild *c)
     job_resume(&job->job);
 }
=20
+static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
+                                      GSList **ignore, Error **errp)
+{
+    BlockJob *job =3D c->opaque;
+    GSList *l;
+
+    for (l =3D job->nodes; l; l =3D l->next) {
+        BdrvChild *sibling =3D l->data;
+        if (!bdrv_child_can_set_aio_context(sibling, ctx, ignore, errp))=
 {
+            return false;
+        }
+    }
+    return true;
+}
+
+static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
+                                  GSList **ignore)
+{
+    BlockJob *job =3D c->opaque;
+    GSList *l;
+
+    for (l =3D job->nodes; l; l =3D l->next) {
+        BdrvChild *sibling =3D l->data;
+        if (g_slist_find(*ignore, sibling)) {
+            continue;
+        }
+        *ignore =3D g_slist_prepend(*ignore, sibling);
+        bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
+    }
+}
+
 static const BdrvChildRole child_job =3D {
     .get_parent_desc    =3D child_job_get_parent_desc,
     .drained_begin      =3D child_job_drained_begin,
     .drained_poll       =3D child_job_drained_poll,
     .drained_end        =3D child_job_drained_end,
+    .can_set_aio_ctx    =3D child_job_can_set_aio_ctx,
+    .set_aio_ctx        =3D child_job_set_aio_ctx,
     .stay_at_node       =3D true,
 };
=20
@@ -440,6 +473,7 @@ void *block_job_create(const char *job_id, const Bloc=
kJobDriver *driver,
=20
     blk_add_aio_context_notifier(blk, block_job_attached_aio_context,
                                  block_job_detach_aio_context, job);
+    blk_set_allow_aio_context_change(blk, true);
=20
     /* Only set speed when necessary to avoid NotSupported error */
     if (speed !=3D 0) {
--=20
2.20.1


