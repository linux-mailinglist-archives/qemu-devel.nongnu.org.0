Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969D63D236A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:39:20 +0200 (CEST)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xyx-0005kE-LF
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xml-00082H-JQ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmj-0007Tn-3B
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBgh/gvwJAhIITDT/rzpXMbqm8FmwmN1ZQED6/wwJPE=;
 b=B0zT4zmuu7X2ljmNR5wf4IIWmEquuvabER1ZcekbyZXA2ZlKXoO8LPZRL0fQMLgSndseEg
 xRWN67zKKkXjtRA+5k3ScbZIVK1Au9Ps830G942HME6HUNdv8N9sLTq8b7EpNKDUD37hOq
 5DvRjeSNU4V0qc1GuBMYFw3qPylsxrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-iDUrF_QiM9-7-gJb97t3Zg-1; Thu, 22 Jul 2021 08:26:39 -0400
X-MC-Unique: iDUrF_QiM9-7-gJb97t3Zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01153760C4;
 Thu, 22 Jul 2021 12:26:38 +0000 (UTC)
Received: from localhost (ovpn-112-220.ams2.redhat.com [10.36.112.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D21F60C5F;
 Thu, 22 Jul 2021 12:26:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? 4/6] job: Add job_cancel_requested()
Date: Thu, 22 Jul 2021 14:26:25 +0200
Message-Id: <20210722122627.29605-5-mreitz@redhat.com>
In-Reply-To: <20210722122627.29605-1-mreitz@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
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
job_cancel_request() as the general variant, which returns true for any
jobs which have been requested to be cancelled, whether it be
immediately or after an arbitrarily long completion phase.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/qemu/job.h |  8 +++++++-
 block/mirror.c     |  9 ++++-----
 job.c              | 13 +++++++++----
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 8aa90f7395..032edf3c5f 100644
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
index c3514f4196..291d2ed040 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -938,7 +938,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         job_transition_to_ready(&s->common.job);
         s->synced = true;
         s->actively_synced = true;
-        while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
+        while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
         s->common.job.cancelled = false;
@@ -1046,7 +1046,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             }
 
             should_complete = s->should_complete ||
-                job_is_cancelled(&s->common.job);
+                job_cancel_requested(&s->common.job);
             cnt = bdrv_get_dirty_count(s->dirty_bitmap);
         }
 
@@ -1089,7 +1089,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         }
         trace_mirror_before_sleep(s, cnt, s->synced, delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
+        if (job_is_cancelled(&s->common.job)) {
             break;
         }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -1101,8 +1101,7 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 || (s->common.job.force_cancel &&
-               job_is_cancelled(&s->common.job)));
+        assert(ret < 0 || job_is_cancelled(&s->common.job));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
diff --git a/job.c b/job.c
index e78d893a9c..c51c8077cb 100644
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
@@ -650,7 +655,7 @@ static void job_conclude(Job *job)
 
 static void job_update_rc(Job *job)
 {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_cancel_requested(job)) {
         job->ret = -ECANCELED;
     }
     if (job->ret) {
@@ -704,7 +709,7 @@ static int job_finalize_single(Job *job)
 
     /* Emit events only if we actually started */
     if (job_started(job)) {
-        if (job_is_cancelled(job)) {
+        if (job_cancel_requested(job)) {
             job_event_cancelled(job);
         } else {
             job_event_completed(job);
@@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_is_cancelled(job) || !job->driver->complete) {
+    if (job_cancel_requested(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
@@ -1043,7 +1048,7 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
     AIO_WAIT_WHILE(job->aio_context,
                    (job_enter(job), !job_is_completed(job)));
 
-    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
+    ret = (job_cancel_requested(job) && job->ret == 0) ? -ECANCELED : job->ret;
     job_unref(job);
     return ret;
 }
-- 
2.31.1


