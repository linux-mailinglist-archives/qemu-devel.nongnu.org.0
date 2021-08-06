Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BB3E2784
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:41:21 +0200 (CEST)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBwLw-0001fj-Pf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwK2-0006xN-8U
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBwJz-0003ls-SN
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628242759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqyBtTPAkt1yWNO5dAY9msIfXXzBOn0Rv1MQCrTw4RM=;
 b=gOds+E1T4NzevbNtFMFko7ytwj6ESOe31BWhDsY1kel5nnTvBd0+AjRVlkFrTfV3NqtwnW
 OgxiaSminDgxyS2Keh/E3ieyLQtuLO2PctusxiKniyEeusyNNgNskyjrwoIIdc7iEnoQMw
 6ZK/uoBlNFwe4U3iFDmCNTJdZPquiWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-L7IKhHE2Nd6s4tTez6SIWQ-1; Fri, 06 Aug 2021 05:39:15 -0400
X-MC-Unique: L7IKhHE2Nd6s4tTez6SIWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA344C73C3;
 Fri,  6 Aug 2021 09:39:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD385C1B4;
 Fri,  6 Aug 2021 09:39:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.2 v3 06/12] jobs: Give Job.force_cancel more meaning
Date: Fri,  6 Aug 2021 11:38:53 +0200
Message-Id: <20210806093859.706464-7-mreitz@redhat.com>
In-Reply-To: <20210806093859.706464-1-mreitz@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We largely have two cancel modes for jobs:

First, there is actual cancelling.  The job is terminated as soon as
possible, without trying to reach a consistent result.

Second, we have mirror in the READY state.  Technically, the job is not
really cancelled, but it just is a different completion mode.  The job
can still run for an indefinite amount of time while it tries to reach a
consistent result.

We want to be able to clearly distinguish which cancel mode a job is in
(when it has been cancelled).  We can use Job.force_cancel for this, but
right now it only reflects cancel requests from the user with
force=true, but clearly, jobs that do not even distinguish between
force=false and force=true are effectively always force-cancelled.

So this patch has Job.force_cancel signify whether the job will
terminate as soon as possible (force_cancel=true) or whether it will
effectively remain running despite being "cancelled"
(force_cancel=false).

To this end, we let jobs that provide JobDriver.cancel() tell the
generic job code whether they will terminate as soon as possible or not,
and for jobs that do not provide that method we assume they will.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h | 11 ++++++++++-
 block/backup.c     |  3 ++-
 block/mirror.c     | 24 ++++++++++++++++++------
 job.c              |  6 +++++-
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 5e8edbc2c8..8aa90f7395 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -253,8 +253,17 @@ struct JobDriver {
 
     /**
      * If the callback is not NULL, it will be invoked in job_cancel_async
+     *
+     * This function must return true if the job will be cancelled
+     * immediately without any further I/O (mandatory if @force is
+     * true), and false otherwise.  This lets the generic job layer
+     * know whether a job has been truly (force-)cancelled, or whether
+     * it is just in a special completion mode (like mirror after
+     * READY).
+     * (If the callback is NULL, the job is assumed to terminate
+     * without I/O.)
      */
-    void (*cancel)(Job *job, bool force);
+    bool (*cancel)(Job *job, bool force);
 
 
     /** Called when the job is freed */
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..513e1c8a0b 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -331,11 +331,12 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }
 
-static void backup_cancel(Job *job, bool force)
+static bool backup_cancel(Job *job, bool force)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
 
     bdrv_cancel_in_flight(s->target_bs);
+    return true;
 }
 
 static const BlockJobDriver backup_job_driver = {
diff --git a/block/mirror.c b/block/mirror.c
index fcb7b65f93..e93631a9f6 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1087,9 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job) &&
-            (!job_is_ready(&s->common.job) || s->common.job.force_cancel))
-        {
+        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
             break;
         }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -1102,7 +1100,7 @@ immediate_exit:
          * the target is a copy of the source.
          */
         assert(ret < 0 ||
-               ((s->common.job.force_cancel || !job_is_ready(&s->common.job)) &&
+               (s->common.job.force_cancel &&
                 job_is_cancelled(&s->common.job)));
         assert(need_drain);
         mirror_wait_for_all_io(s);
@@ -1188,14 +1186,27 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
-static void mirror_cancel(Job *job, bool force)
+static bool mirror_cancel(Job *job, bool force)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target = blk_bs(s->target);
 
-    if (force || !job_is_ready(job)) {
+    /*
+     * Before the job is READY, we treat any cancellation like a
+     * force-cancellation.
+     */
+    force = force || !job_is_ready(job);
+
+    if (force) {
         bdrv_cancel_in_flight(target);
     }
+    return force;
+}
+
+static bool commit_active_cancel(Job *job, bool force)
+{
+    /* Same as above in mirror_cancel() */
+    return force || !job_is_ready(job);
 }
 
 static const BlockJobDriver mirror_job_driver = {
@@ -1225,6 +1236,7 @@ static const BlockJobDriver commit_active_job_driver = {
         .abort                  = mirror_abort,
         .pause                  = mirror_pause,
         .complete               = mirror_complete,
+        .cancel                 = commit_active_cancel,
     },
     .drained_poll           = mirror_drained_poll,
 };
diff --git a/job.c b/job.c
index 1b68a7a983..9e82b128ff 100644
--- a/job.c
+++ b/job.c
@@ -719,8 +719,12 @@ static int job_finalize_single(Job *job)
 static void job_cancel_async(Job *job, bool force)
 {
     if (job->driver->cancel) {
-        job->driver->cancel(job, force);
+        force = job->driver->cancel(job, force);
+    } else {
+        /* No .cancel() means the job will behave as if force-cancelled */
+        force = true;
     }
+
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
-- 
2.31.1


