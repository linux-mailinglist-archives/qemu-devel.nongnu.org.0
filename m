Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB46A1DCD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:51:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNT-0007dq-8H; Fri, 24 Feb 2023 09:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNQ-0007bl-O6; Fri, 24 Feb 2023 09:48:48 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNO-0002pI-DY; Fri, 24 Feb 2023 09:48:48 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id F06C34852B;
 Fri, 24 Feb 2023 15:48:35 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 1/9] blockjob: introduce block-job-change QMP command
Date: Fri, 24 Feb 2023 15:48:17 +0100
Message-Id: <20230224144825.466375-2-f.ebner@proxmox.com>
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

which will allow changing job-type-specific options after job
creation.

In the JobVerbTable, the same allow bits as for set-speed are used,
because set-speed could be considered an existing change command.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

Tried to go more general at first with a 'job-change' command, but I
couldn't figure out a way to avoid mutual inclusion between
block-core.json and job.json.

 blockdev.c                   | 14 ++++++++++++++
 blockjob.c                   | 20 ++++++++++++++++++++
 include/block/blockjob.h     | 11 +++++++++++
 include/block/blockjob_int.h |  5 +++++
 job.c                        |  1 +
 qapi/block-core.json         | 26 ++++++++++++++++++++++++++
 qapi/job.json                |  4 +++-
 7 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index d7b5c18f0a..ceb367dcb8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3416,6 +3416,20 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
     job_dismiss_locked(&job, errp);
 }
 
+void qmp_block_job_change(BlockJobChangeOptions *opts, Error **errp)
+{
+    BlockJob *job;
+
+    JOB_LOCK_GUARD();
+    job = find_block_job_locked(opts->id, errp);
+
+    if (!job) {
+        return;
+    }
+
+    block_job_change_locked(job, opts, errp);
+}
+
 void qmp_change_backing_file(const char *device,
                              const char *image_node_name,
                              const char *backing_file,
diff --git a/blockjob.c b/blockjob.c
index 659c3cb9de..b933d1c631 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -319,6 +319,26 @@ static bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     return block_job_set_speed_locked(job, speed, errp);
 }
 
+void block_job_change_locked(BlockJob *job, BlockJobChangeOptions *opts,
+                             Error **errp)
+{
+    const BlockJobDriver *drv = block_job_driver(job);
+
+    GLOBAL_STATE_CODE();
+
+    if (job_apply_verb_locked(&job->job, JOB_VERB_CHANGE, errp)) {
+        return;
+    }
+
+    if (drv->change) {
+        job_unlock();
+        drv->change(job, opts, errp);
+        job_lock();
+    } else {
+        error_setg(errp, "Job type does not support change");
+    }
+}
+
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 {
     IO_CODE();
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 058b0c824c..d8b80d9625 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -172,6 +172,17 @@ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
  */
 bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp);
 
+/**
+ * block_job_change_locked:
+ * @job: The job to change.
+ * @opt: The new options.
+ * @errp: Error object.
+ *
+ * Change the job according to opts.
+ */
+void block_job_change_locked(BlockJob *job, BlockJobChangeOptions *opts,
+                             Error **errp);
+
 /**
  * block_job_query_locked:
  * @job: The job to get information about.
diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index f008446285..055bee5020 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -67,6 +67,11 @@ struct BlockJobDriver {
     void (*attached_aio_context)(BlockJob *job, AioContext *new_context);
 
     void (*set_speed)(BlockJob *job, int64_t speed);
+
+    /*
+     * Change the @job's options according to @opts.
+     */
+    void (*change)(BlockJob *job, BlockJobChangeOptions *opts, Error **errp);
 };
 
 /*
diff --git a/job.c b/job.c
index 72d57f0934..99a2e54b54 100644
--- a/job.c
+++ b/job.c
@@ -80,6 +80,7 @@ bool JobVerbTable[JOB_VERB__MAX][JOB_STATUS__MAX] = {
     [JOB_VERB_COMPLETE]             = {0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0},
     [JOB_VERB_FINALIZE]             = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
     [JOB_VERB_DISMISS]              = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
+    [JOB_VERB_CHANGE]               = {0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
 };
 
 /* Transactional group of jobs */
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7f331eb8ea..714cabd49d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2964,6 +2964,32 @@
 { 'command': 'block-job-finalize', 'data': { 'id': 'str' },
   'allow-preconfig': true }
 
+##
+# @BlockJobChangeOptions:
+#
+# Block job options that can be changed after job creation.
+#
+# @id: The job identifier
+#
+# @type: The job type
+#
+# Since 8.0
+##
+{ 'union': 'BlockJobChangeOptions',
+  'base': { 'id': 'str', 'type': 'JobType' },
+  'discriminator': 'type',
+  'data': {} }
+
+##
+# @block-job-change:
+#
+# Change the block job's options.
+#
+# Since: 8.0
+##
+{ 'command': 'block-job-change',
+  'data': 'BlockJobChangeOptions', 'boxed': true }
+
 ##
 # @BlockdevDiscardOptions:
 #
diff --git a/qapi/job.json b/qapi/job.json
index d5f84e9615..7d9d328d7f 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -100,11 +100,13 @@
 #
 # @finalize: see @job-finalize
 #
+# @change: see @block-job-change (since 8.0)
+#
 # Since: 2.12
 ##
 { 'enum': 'JobVerb',
   'data': ['cancel', 'pause', 'resume', 'set-speed', 'complete', 'dismiss',
-           'finalize' ] }
+           'finalize', 'change' ] }
 
 ##
 # @JOB_STATUS_CHANGE:
-- 
2.30.2



