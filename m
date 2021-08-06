Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DEB3E2799
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:44:08 +0200 (CEST)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwOd-00016Q-Hx
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJz-0006n1-FI
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJv-0003iv-M4
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6cNxQzGRkge1GADmOqdAGbsoJjMdCxdAlM2ku65RkM=;
 b=NJuDBf+O6GdsKpM40AfOwuigBbJOS6+TsJ0h4L5lGH1wWQhc7RetlP3Hl8PdJJfUwzmrAr
 jeG3AU6nVwcSA62NM2+3O51GFvk//d2dlnvFJ5zfi689yzcuZ0ZhyxI6GausTXtw9qaaYc
 3yhbW+qU74B1c090U4+WGcGcU+TuDCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-n7_MefTFOd2Ay7kqHfP0uA-1; Fri, 06 Aug 2021 05:39:13 -0400
X-MC-Unique: n7_MefTFOd2Ay7kqHfP0uA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98D341006C80;
 Fri,  6 Aug 2021 09:39:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F2710016F4;
 Fri,  6 Aug 2021 09:39:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 05/12] job: @force parameter for job_cancel_sync{,
 _all}()
Date: Fri,  6 Aug 2021 11:38:52 +0200
Message-Id: <20210806093859.706464-6-mreitz@redhat.com>
In-Reply-To: <20210806093859.706464-1-mreitz@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers should be able to specify whether they want job_cancel_sync() to
force-cancel the job or not.

In fact, almost all invocations do not care about consistency of the
result and just want the job to terminate as soon as possible, so they
should pass force=true.  The replication block driver is the exception.

This changes some iotest outputs, because quitting qemu while a mirror
job is active will now lead to it being cancelled instead of completed,
which is what we want.  (Cancelling a READY mirror job with force=false
may take an indefinite amount of time, which we do not want when
quitting.  If users want consistent results, they must have all jobs be
done before they quit qemu.)

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/qemu/job.h                    | 10 ++---
 block/replication.c                   |  4 +-
 blockdev.c                            |  4 +-
 job.c                                 | 20 +++++++--
 qemu-nbd.c                            |  2 +-
 softmmu/runstate.c                    |  2 +-
 storage-daemon/qemu-storage-daemon.c  |  2 +-
 tests/unit/test-block-iothread.c      |  2 +-
 tests/unit/test-blockjob.c            |  2 +-
 tests/qemu-iotests/109.out            | 60 +++++++++++----------------
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 11 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 41162ed494..5e8edbc2c8 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -506,19 +506,19 @@ void job_user_cancel(Job *job, bool force, Error **errp);
 
 /**
  * Synchronously cancel the @job.  The completion callback is called
- * before the function returns.  The job may actually complete
- * instead of canceling itself; the circumstances under which this
- * happens depend on the kind of job that is active.
+ * before the function returns.  If @force is false, the job may
+ * actually complete instead of canceling itself; the circumstances
+ * under which this happens depend on the kind of job that is active.
  *
  * Returns the return value from the job if the job actually completed
  * during the call, or -ECANCELED if it was canceled.
  *
  * Callers must hold the AioContext lock of job->aio_context.
  */
-int job_cancel_sync(Job *job);
+int job_cancel_sync(Job *job, bool force);
 
 /** Synchronously cancels all jobs using job_cancel_sync(). */
-void job_cancel_sync_all(void);
+void job_cancel_sync_all(bool force);
 
 /**
  * @job: The job to be completed.
diff --git a/block/replication.c b/block/replication.c
index 32444b9a8f..e7a9327b12 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -149,7 +149,7 @@ static void replication_close(BlockDriverState *bs)
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
         assert(commit_job->aio_context == qemu_get_current_aio_context());
-        job_cancel_sync(commit_job);
+        job_cancel_sync(commit_job, false);
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
@@ -726,7 +726,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
-            job_cancel_sync(&s->backup_job->job);
+            job_cancel_sync(&s->backup_job->job, false);
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index 3d8ac368a1..aa95918c02 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1848,7 +1848,7 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job);
+        job_cancel_sync(&state->job->job, true);
 
         aio_context_release(aio_context);
     }
@@ -1949,7 +1949,7 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job);
+        job_cancel_sync(&state->job->job, true);
 
         aio_context_release(aio_context);
     }
diff --git a/job.c b/job.c
index 24e7c4fcb7..1b68a7a983 100644
--- a/job.c
+++ b/job.c
@@ -982,12 +982,24 @@ static void job_cancel_err(Job *job, Error **errp)
     job_cancel(job, false);
 }
 
-int job_cancel_sync(Job *job)
+/**
+ * Same as job_cancel_err(), but force-cancel.
+ */
+static void job_force_cancel_err(Job *job, Error **errp)
 {
-    return job_finish_sync(job, &job_cancel_err, NULL);
+    job_cancel(job, true);
+}
+
+int job_cancel_sync(Job *job, bool force)
+{
+    if (force) {
+        return job_finish_sync(job, &job_force_cancel_err, NULL);
+    } else {
+        return job_finish_sync(job, &job_cancel_err, NULL);
+    }
 }
 
-void job_cancel_sync_all(void)
+void job_cancel_sync_all(bool force)
 {
     Job *job;
     AioContext *aio_context;
@@ -995,7 +1007,7 @@ void job_cancel_sync_all(void)
     while ((job = job_next(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
-        job_cancel_sync(job);
+        job_cancel_sync(job, force);
         aio_context_release(aio_context);
     }
 }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 26ffbf15af..7fadfcfd23 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -479,7 +479,7 @@ static const char *socket_activation_validate_opts(const char *device,
 
 static void qemu_nbd_shutdown(void)
 {
-    job_cancel_sync_all();
+    job_cancel_sync_all(true);
     blk_exp_close_all();
     bdrv_close_all();
 }
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365a..cf239e3b4c 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -812,7 +812,7 @@ void qemu_cleanup(void)
     vm_shutdown();
     replay_finish();
 
-    job_cancel_sync_all();
+    job_cancel_sync_all(true);
     bdrv_close_all();
 
     /* vhost-user must be cleaned up before chardevs.  */
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index fc8b150629..6c7142574c 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -347,7 +347,7 @@ int main(int argc, char *argv[])
 
     blk_exp_close_all();
     bdrv_drain_all_begin();
-    job_cancel_sync_all();
+    job_cancel_sync_all(true);
     bdrv_close_all();
 
     monitor_cleanup();
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index c39e70b2f5..09807fd2ca 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -662,7 +662,7 @@ static void test_propagate_mirror(void)
     g_assert(bdrv_get_aio_context(target) == ctx);
     g_assert(bdrv_get_aio_context(filter) == ctx);
 
-    job_cancel_sync_all();
+    job_cancel_sync_all(true);
 
     aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index dcacfa6c7c..4c9e1bf1e5 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -230,7 +230,7 @@ static void cancel_common(CancelJob *s)
     ctx = job->job.aio_context;
     aio_context_acquire(ctx);
 
-    job_cancel_sync(&job->job);
+    job_cancel_sync(&job->job, true);
     if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
         Job *dummy = &job->job;
         job_dismiss(&dummy, &error_abort);
diff --git a/tests/qemu-iotests/109.out b/tests/qemu-iotests/109.out
index 8f839b4b7f..e29280015e 100644
--- a/tests/qemu-iotests/109.out
+++ b/tests/qemu-iotests/109.out
@@ -44,9 +44,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -95,9 +94,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 197120, "offset": 197120, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 197120, "offset": 197120, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -146,9 +144,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -197,9 +194,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -248,9 +244,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 65536, "offset": 65536, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 65536, "offset": 65536, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -299,9 +294,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -349,9 +343,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -399,9 +392,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 31457280, "offset": 31457280, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 31457280, "offset": 31457280, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -449,9 +441,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -499,9 +490,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 2048, "offset": 2048, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 2048, "offset": 2048, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -529,9 +519,8 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -552,9 +541,8 @@ Images are identical.
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 189423354b..c1bc9b8356 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -8,7 +8,7 @@ QMP_VERSION
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
 
 === Streaming can't get permission on base node ===
 
-- 
2.31.1


