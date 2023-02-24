Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526716A1DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNU-0007fT-LP; Fri, 24 Feb 2023 09:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNR-0007cI-Mp; Fri, 24 Feb 2023 09:48:49 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNO-0002pJ-Eb; Fri, 24 Feb 2023 09:48:49 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id F3CEF4852C;
 Fri, 24 Feb 2023 15:48:35 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 3/9] mirror: implement mirror_change method
Date: Fri, 24 Feb 2023 15:48:19 +0100
Message-Id: <20230224144825.466375-4-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224144825.466375-1-f.ebner@proxmox.com>
References: <20230224144825.466375-1-f.ebner@proxmox.com>
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

which allows switching the @copy-mode from 'background' to
'write-blocking'.

Once the job is in active mode, no new writes need to be registered in
the dirty bitmap, because they are synchronously written to the
target. But since the method is called from the monitor and IO might
be happening in an iothread at the same time, a drained section is
needed.

This is useful for management applications, so they can start out in
background mode to avoid limiting guest write speed and switch to
active mode when certain criteria are fullfilled. Currently, the
amount of information that can be used for those criteria is a bit
limited, so the plan is to extend quering of block jobs to return more
information relevant for mirror.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

Sorry, I still haven't fully grasped the drained logic. Is my
rationale for the drained section correct? There also are some yield
points in block/io.c, for example when the driver implements
bdrv_aio_pwritev (file-win32 and null), and the bitmap is only updated
after that. Is that another reason it's required?

 block/mirror.c       | 38 ++++++++++++++++++++++++++++++++++++++
 qapi/block-core.json | 13 ++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index ca87492fcc..961aaa5cd6 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1216,6 +1216,43 @@ static bool commit_active_cancel(Job *job, bool force)
     return force || !job_is_ready(job);
 }
 
+static void mirror_change(BlockJob *job, BlockJobChangeOptions *opts,
+                          Error **errp)
+{
+    MirrorBlockJob *s = container_of(job, MirrorBlockJob, common);
+    BlockJobChangeOptionsMirror *change_opts = &opts->u.mirror;
+    BlockDriverState *bs = s->mirror_top_bs->backing->bs;
+    AioContext *ctx = bdrv_get_aio_context(bs);
+
+    if (s->copy_mode == change_opts->copy_mode) {
+        return;
+    }
+
+    if (s->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING) {
+        error_setg(errp, "Cannot switch away from copy mode 'write-blocking'");
+        return;
+    }
+
+    assert(s->copy_mode == MIRROR_COPY_MODE_BACKGROUND &&
+           change_opts->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING);
+
+    /*
+     * Once the job is in active mode, no new writes need to be registered in
+     * the dirty bitmap, because they are synchronously written to the target.
+     * Ensure the bitmap is up-to-date first, using a drained section.
+     */
+    s->in_drain = true;
+    aio_context_acquire(ctx);
+    bdrv_drained_begin(bs);
+
+    s->copy_mode = MIRROR_COPY_MODE_WRITE_BLOCKING;
+    bdrv_disable_dirty_bitmap(s->dirty_bitmap);
+
+    bdrv_drained_end(bs);
+    aio_context_release(ctx);
+    s->in_drain = false;
+}
+
 static const BlockJobDriver mirror_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(MirrorBlockJob),
@@ -1230,6 +1267,7 @@ static const BlockJobDriver mirror_job_driver = {
         .cancel                 = mirror_cancel,
     },
     .drained_poll           = mirror_drained_poll,
+    .change                 = mirror_change,
 };
 
 static const BlockJobDriver commit_active_job_driver = {
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 714cabd49d..f9f464b25a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2964,6 +2964,17 @@
 { 'command': 'block-job-finalize', 'data': { 'id': 'str' },
   'allow-preconfig': true }
 
+##
+# @BlockJobChangeOptionsMirror:
+#
+# @copy-mode: Switch to this copy mode. Currenlty, only the switch from
+#             'background' to 'write-blocking' is implemented.
+#
+# Since: 8.0
+##
+{ 'struct': 'BlockJobChangeOptionsMirror',
+  'data': { 'copy-mode' : 'MirrorCopyMode' } }
+
 ##
 # @BlockJobChangeOptions:
 #
@@ -2978,7 +2989,7 @@
 { 'union': 'BlockJobChangeOptions',
   'base': { 'id': 'str', 'type': 'JobType' },
   'discriminator': 'type',
-  'data': {} }
+  'data': { 'mirror': 'BlockJobChangeOptionsMirror' } }
 
 ##
 # @block-job-change:
-- 
2.30.2



