Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B41402977
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:12:04 +0200 (CEST)
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNatP-0000hY-4d
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRP-0005pz-FH
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRN-0006K5-Bl
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2qjWC184SgtZW0uZepwV1Zki7wrfLnzi1cy5EMaknI=;
 b=DbJjk5N5uVSR0fAi/jUwGBWneZozrGKTlKquxJosmuSvjAM8hUId3kHhZOhVvHl3/vp93u
 NgObtIJpBajQkGgagjk9p81JqipESOyZQzYGger5P7uBPr4KnsrR96jKRqvNbSQ6YpH86A
 9meA3ZtT0+2jXrFfpofcfRsEuHV21oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-NztsfsewMIGMI8NGOaAyQQ-1; Tue, 07 Sep 2021 08:43:03 -0400
X-MC-Unique: NztsfsewMIGMI8NGOaAyQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7530835DE0;
 Tue,  7 Sep 2021 12:43:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2532B76606;
 Tue,  7 Sep 2021 12:43:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/12] job: Add job_cancel_requested()
Date: Tue,  7 Sep 2021 14:42:40 +0200
Message-Id: <20210907124245.143492-8-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most callers of job_is_cancelled() actually want to know whether the job
is on its way to immediate termination.  For example, we refuse to pause
jobs that are cancelled; but this only makes sense for jobs that are
really actually cancelled.

A mirror job that is cancelled during READY with force=false should
absolutely be allowed to pause.  This "cancellation" (which is actually
a kind of completion) may take an indefinite amount of time, and so
should behave like any job during normal operation.  For example, with
on-target-error=stop, the job should stop on write errors.  (In
contrast, force-cancelled jobs should not get write errors, as they
should just terminate and not do further I/O.)

Therefore, redefine job_is_cancelled() to only return true for jobs that
are force-cancelled (which as of HEAD^ means any job that interprets the
cancellation request as a request for immediate termination), and add
job_cancel_requested() as the general variant, which returns true for
any jobs which have been requested to be cancelled, whether it be
immediately or after an arbitrarily long completion phase.

Finally, here is a justification for how different job_is_cancelled()
invocations are treated by this patch:

- block/mirror.c (mirror_run()):
  - The first invocation is a while loop that should loop until the job
    has been cancelled or scheduled for completion.  What kind of cancel
    does not matter, only the fact that the job is supposed to end.

  - The second invocation wants to know whether the job has been
    soft-cancelled.  Calling job_cancel_requested() is a bit too broad,
    but if the job were force-cancelled, we should leave the main loop
    as soon as possible anyway, so this should not matter here.

  - The last two invocations already check force_cancel, so they should
    continue to use job_is_cancelled().

- block/backup.c, block/commit.c, block/stream.c, anything in tests/:
  These jobs know only force-cancel, so there is no difference between
  job_is_cancelled() and job_cancel_requested().  We can continue using
  job_is_cancelled().

- job.c:
  - job_pause_point(), job_yield(), job_sleep_ns(): Only force-cancelled
    jobs should be prevented from being paused.  Continue using job_is_cancelled().

  - job_update_rc(), job_finalize_single(), job_finish_sync(): These
    functions are all called after the job has left its main loop.  The
    mirror job (the only job that can be soft-cancelled) will clear
    .cancelled before leaving the main loop if it has been
    soft-cancelled.  Therefore, these functions will observe .cancelled
    to be true only if the job has been force-cancelled.  We can
    continue to use job_is_cancelled().
    (Furthermore, conceptually, a soft-cancelled mirror job should not
    report to have been cancelled.  It should report completion (see
    also the block-job-cancel QAPI documentation).  Therefore, it makes
    sense for these functions not to distinguish between a
    soft-cancelled mirror job and a job that has completed as normal.)

  - job_completed_txn_abort(): All jobs other than @job have been
    force-cancelled.  job_is_cancelled() must be true for them.
    Regarding @job itself: job_completed_txn_abort() is mostly called
    when the job's return value is not 0.  A soft-cancelled mirror has a
    return value of 0, and so will not end up here then.
    However, job_cancel() invokes job_completed_txn_abort() if the job
    has been deferred to the main loop, which is mostly the case for
    completed jobs (which skip the assertion), but not for sure.
    To be safe, use job_cancel_requested() in this assertion.

  - job_complete(): This is function eventually invoked by the user
    (through qmp_block_job_complete() or qmp_job_complete(), or
    job_complete_sync(), which comes from qemu-img).  The intention here
    is to prevent a user from invoking job-complete after the job has
    been cancelled.  This should also apply to soft cancelling: After a
    mirror job has been soft-cancelled, the user should not be able to
    decide otherwise and have it complete as normal (i.e. pivoting to
    the target).

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h |  8 +++++++-
 block/mirror.c     | 10 ++++------
 job.c              |  9 +++++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 90f6abbd6a..6e67b6977f 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
 /** Returns true if the job should not be visible to the management layer. */
 bool job_is_internal(Job *job);
 
-/** Returns whether the job is scheduled for cancellation. */
+/** Returns whether the job is being cancelled. */
 bool job_is_cancelled(Job *job);
 
+/**
+ * Returns whether the job is scheduled for cancellation (at an
+ * indefinite point).
+ */
+bool job_cancel_requested(Job *job);
+
 /** Returns whether the job is in a completed state. */
 bool job_is_completed(Job *job);
 
diff --git a/block/mirror.c b/block/mirror.c
index e93631a9f6..72e02fa34e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -936,7 +936,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         /* Transition to the READY state and wait for complete. */
         job_transition_to_ready(&s->common.job);
         s->actively_synced = true;
-        while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
+        while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
         s->common.job.cancelled = false;
@@ -1043,7 +1043,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             }
 
             should_complete = s->should_complete ||
-                job_is_cancelled(&s->common.job);
+                job_cancel_requested(&s->common.job);
             cnt = bdrv_get_dirty_count(s->dirty_bitmap);
         }
 
@@ -1087,7 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
+        if (job_is_cancelled(&s->common.job)) {
             break;
         }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -1099,9 +1099,7 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 ||
-               (s->common.job.force_cancel &&
-                job_is_cancelled(&s->common.job)));
+        assert(ret < 0 || job_is_cancelled(&s->common.job));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
diff --git a/job.c b/job.c
index 81c016eb10..be878ca5fc 100644
--- a/job.c
+++ b/job.c
@@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
 }
 
 bool job_is_cancelled(Job *job)
+{
+    return job->cancelled && job->force_cancel;
+}
+
+bool job_cancel_requested(Job *job)
 {
     return job->cancelled;
 }
@@ -788,7 +793,7 @@ static void job_completed_txn_abort(Job *job)
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed(other_job)) {
-            assert(job_is_cancelled(other_job));
+            assert(job_cancel_requested(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
@@ -1027,7 +1032,7 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_is_cancelled(job) || !job->driver->complete) {
+    if (job_cancel_requested(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.31.1


