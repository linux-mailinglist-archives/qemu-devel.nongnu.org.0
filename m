Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71A2E31F1
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:56:47 +0100 (CET)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZLa-00042B-47
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZIt-0002VZ-Nm
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:53:59 -0500
Received: from kerio.kamp.de ([195.62.97.192]:34019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZIq-0007ZR-Oi
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:53:59 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:42:42 +0100
Received: (qmail 22370 invoked from network); 27 Dec 2020 16:42:44 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 27 Dec 2020 16:42:44 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 5FB2B13DD25; Sun, 27 Dec 2020 17:42:44 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] block/rbd: add bdrv_{attach,detach}_aio_context
Date: Sun, 27 Dec 2020 17:42:33 +0100
Message-Id: <20201227164236.10143-5-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201227164236.10143-1-pl@kamp.de>
References: <20201227164236.10143-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index a2da70e37f..27b232f4d8 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -91,6 +91,7 @@ typedef struct BDRVRBDState {
     char *namespace;
     uint64_t image_size;
     uint64_t object_size;
+    AioContext *aio_context;
 } BDRVRBDState;
 
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
@@ -749,6 +750,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+    s->aio_context = bdrv_get_aio_context(bs);
+
     /* When extending regular files, we get zeros from the OS */
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
@@ -839,8 +842,7 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
     rcb->ret = rbd_aio_get_return_value(c);
     rbd_aio_release(c);
 
-    replay_bh_schedule_oneshot_event(bdrv_get_aio_context(acb->common.bs),
-                                     rbd_finish_bh, rcb);
+    replay_bh_schedule_oneshot_event(acb->s->aio_context, rbd_finish_bh, rcb);
 }
 
 static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
@@ -1151,6 +1153,18 @@ static const char *const qemu_rbd_strong_runtime_opts[] = {
     NULL
 };
 
+static void qemu_rbd_attach_aio_context(BlockDriverState *bs,
+                                       AioContext *new_context)
+{
+    BDRVRBDState *s = bs->opaque;
+    s->aio_context = new_context;
+}
+
+static void qemu_rbd_detach_aio_context(BlockDriverState *bs)
+{
+
+}
+
 static BlockDriver bdrv_rbd = {
     .format_name            = "rbd",
     .instance_size          = sizeof(BDRVRBDState),
@@ -1180,6 +1194,9 @@ static BlockDriver bdrv_rbd = {
     .bdrv_snapshot_goto     = qemu_rbd_snap_rollback,
     .bdrv_co_invalidate_cache = qemu_rbd_co_invalidate_cache,
 
+    .bdrv_attach_aio_context  = qemu_rbd_attach_aio_context,
+    .bdrv_detach_aio_context  = qemu_rbd_detach_aio_context,
+
     .strong_runtime_opts    = qemu_rbd_strong_runtime_opts,
 };
 
-- 
2.17.1



