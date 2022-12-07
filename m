Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAC645AF1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:29:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uSz-00026Q-LS; Wed, 07 Dec 2022 08:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1p2uSv-0001wA-Bl; Wed, 07 Dec 2022 08:28:02 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1p2uSs-0001ed-E3; Wed, 07 Dec 2022 08:28:01 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9D3B245183;
 Wed,  7 Dec 2022 14:27:44 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Date: Wed,  7 Dec 2022 14:27:19 +0100
Message-Id: <20221207132719.131227-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The new copy mode starts out in 'background' mode and switches to
'write-blocking' mode once the job transitions to ready.

Before switching to active mode and indicating that the drives are
actively synced, it is necessary to have seen and handled all guest
I/O. This is done by checking the dirty bitmap inside a drained
section. Transitioning to ready is also only done at the same time.

The new mode is useful for management applications using drive-mirror
in combination with migration. Currently, migration doesn't check on
mirror jobs before inactivating the blockdrives, so it's necessary to
either:
1) use the 'pause-before-switchover' migration capability and complete
   mirror jobs before actually switching over.
2) use 'write-blocking' copy mode for the drive mirrors.

The downside with 1) is longer downtime for the guest, while the
downside with 2) is that guest write speed is limited by the
synchronous writes to the mirror target. The newly introduced copy
mode reduces the time that limit is in effect.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

See [0] for a bit more context. While the new copy mode doesn't
fundamentally improve the downside of 2) (especially when multiple
drives are mirrored), it would still improve things a little. And I
guess when trying to keep downtime short, guest write speed needs to
be limited at /some/ point (always in the context of migration with
drive-mirror of course). Ideally, that could go hand-in-hand with
migration convergence, but that would require some larger changes to
implement and introduce more coupling.

[0] https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg04886.html

 block/mirror.c       | 29 +++++++++++++++++++++++++++--
 qapi/block-core.json |  5 ++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 251adc5ae0..e21b4e5e77 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -60,6 +60,7 @@ typedef struct MirrorBlockJob {
     /* Set when the target is synced (dirty bitmap is clean, nothing
      * in flight) and the job is running in active mode */
     bool actively_synced;
+    bool in_active_mode;
     bool should_complete;
     int64_t granularity;
     size_t buf_size;
@@ -1035,10 +1036,31 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         if (s->in_flight == 0 && cnt == 0) {
             trace_mirror_before_flush(s);
             if (!job_is_ready(&s->common.job)) {
+                if (s->copy_mode ==
+                    MIRROR_COPY_MODE_WRITE_BLOCKING_AFTER_READY) {
+                    /*
+                     * Pause guest I/O to check if we can switch to active mode.
+                     * To set actively_synced to true below, it is necessary to
+                     * have seen and synced all guest I/O.
+                     */
+                    s->in_drain = true;
+                    bdrv_drained_begin(bs);
+                    if (bdrv_get_dirty_count(s->dirty_bitmap) > 0) {
+                        bdrv_drained_end(bs);
+                        s->in_drain = false;
+                        continue;
+                    }
+                    s->in_active_mode = true;
+                    bdrv_disable_dirty_bitmap(s->dirty_bitmap);
+                    bdrv_drained_end(bs);
+                    s->in_drain = false;
+                }
+
                 if (mirror_flush(s) < 0) {
                     /* Go check s->ret.  */
                     continue;
                 }
+
                 /* We're out of the streaming phase.  From now on, if the job
                  * is cancelled we will actually complete all pending I/O and
                  * report completion.  This way, block-job-cancel will leave
@@ -1443,7 +1465,7 @@ static int coroutine_fn bdrv_mirror_top_do_write(BlockDriverState *bs,
     if (s->job) {
         copy_to_target = s->job->ret >= 0 &&
                          !job_is_cancelled(&s->job->common.job) &&
-                         s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
+                         s->job->in_active_mode;
     }
 
     if (copy_to_target) {
@@ -1494,7 +1516,7 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
     if (s->job) {
         copy_to_target = s->job->ret >= 0 &&
                          !job_is_cancelled(&s->job->common.job) &&
-                         s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
+                         s->job->in_active_mode;
     }
 
     if (copy_to_target) {
@@ -1792,7 +1814,10 @@ static BlockJob *mirror_start_job(
         goto fail;
     }
     if (s->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING) {
+        s->in_active_mode = true;
         bdrv_disable_dirty_bitmap(s->dirty_bitmap);
+    } else {
+        s->in_active_mode = false;
     }
 
     ret = block_job_add_bdrv(&s->common, "source", bs, 0,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 95ac4fa634..2a983ed78d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1200,10 +1200,13 @@
 #                  addition, data is copied in background just like in
 #                  @background mode.
 #
+# @write-blocking-after-ready: starts out in @background mode and switches to
+#                              @write-blocking when transitioning to ready.
+#
 # Since: 3.0
 ##
 { 'enum': 'MirrorCopyMode',
-  'data': ['background', 'write-blocking'] }
+  'data': ['background', 'write-blocking', 'write-blocking-after-ready'] }
 
 ##
 # @BlockJobInfo:
-- 
2.30.2



