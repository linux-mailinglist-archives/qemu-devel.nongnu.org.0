Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306E4400A3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:51:43 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV6U-0006Ci-7r
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvC-0006m6-7t
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv0-0003WG-NM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoLHWBqwFq+3bp5mpxge2JH30i6yXLxBS9GlgYhV+PA=;
 b=Hx0V+Wm0Bb9oomsbiJ3f0Rznf9034cguYpdT4LIjq2kjd6q6RIShsqnvwkMoMUJpu1puEh
 yVrXBvk/QRRYOC/vnHc/ZvGkkomQMXnbzwbpuuJYiHD6+75WcGZjD+F7AatOlCmrLTsTox
 PHnlRpF1zjFnG/1gFxQ+d6Z0Uztq2TY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-A4YPyzYCO0epW3KfJHN2Hg-1; Fri, 29 Oct 2021 12:39:43 -0400
X-MC-Unique: A4YPyzYCO0epW3KfJHN2Hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD17110A8E04;
 Fri, 29 Oct 2021 16:39:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBBBF69214;
 Fri, 29 Oct 2021 16:39:40 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 06/15] jobs: add job-driver.h
Date: Fri, 29 Oct 2021 12:39:05 -0400
Message-Id: <20211029163914.4044794-7-eesposit@redhat.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

job-driver.h contains all functions of job.h that are used by
the drivers (JobDriver, BlockJobDriver).

These functions are unaware of the job_mutex,
so they all will take and release the lock internally.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-driver.h  | 152 +++++++++++++++++++++++++++++++++++++
 include/qemu/job-monitor.h |   4 +-
 include/qemu/job.h         | 114 +---------------------------
 3 files changed, 156 insertions(+), 114 deletions(-)
 create mode 100644 include/qemu/job-driver.h

diff --git a/include/qemu/job-driver.h b/include/qemu/job-driver.h
new file mode 100644
index 0000000000..1efd196da8
--- /dev/null
+++ b/include/qemu/job-driver.h
@@ -0,0 +1,152 @@
+/*
+ * Declarations for background jobs
+ *
+ * Copyright (c) 2011 IBM Corp.
+ * Copyright (c) 2012, 2018 Red Hat, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef JOB_DRIVER_H
+#define JOB_DRIVER_H
+
+#include "job-common.h"
+
+/*
+ * Job driver API.
+ *
+ * These functions use are used by job drivers like mirror,
+ * stream, commit etc. The driver is not aware of the job_mutex
+ * presence, so these functions use it internally to protect
+ * job fields (see job-common.h).
+ *
+ * Therefore, each function in this API that requires protection
+ * must have the comment
+ * "Called with job_mutext *not* held"
+ * in job.c
+ */
+
+/**
+ * Create a new long-running job and return it.
+ *
+ * @job_id: The id of the newly-created job, or %NULL for internal jobs
+ * @driver: The class object for the newly-created job.
+ * @txn: The transaction this job belongs to, if any. %NULL otherwise.
+ * @ctx: The AioContext to run the job coroutine in.
+ * @flags: Creation flags for the job. See @JobCreateFlags.
+ * @cb: Completion function for the job.
+ * @opaque: Opaque pointer value passed to @cb.
+ * @errp: Error object.
+ */
+void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
+                 AioContext *ctx, int flags, BlockCompletionFunc *cb,
+                 void *opaque, Error **errp);
+
+/**
+ * @job: The job that has made progress
+ * @done: How much progress the job made since the last call
+ *
+ * Updates the progress counter of the job.
+ */
+void job_progress_update(Job *job, uint64_t done);
+
+/**
+ * @job: The job whose expected progress end value is set
+ * @remaining: Missing progress (on top of the current progress counter value)
+ *             until the new expected end value is reached
+ *
+ * Sets the expected end value of the progress counter of a job so that a
+ * completion percentage can be calculated when the progress is updated.
+ */
+void job_progress_set_remaining(Job *job, uint64_t remaining);
+
+/**
+ * @job: The job whose expected progress end value is updated
+ * @delta: Value which is to be added to the current expected end
+ *         value
+ *
+ * Increases the expected end value of the progress counter of a job.
+ * This is useful for parenthesis operations: If a job has to
+ * conditionally perform a high-priority operation as part of its
+ * progress, it calls this function with the expected operation's
+ * length before, and job_progress_update() afterwards.
+ * (So the operation acts as a parenthesis in regards to the main job
+ * operation running in background.)
+ */
+void job_progress_increase_remaining(Job *job, uint64_t delta);
+
+/**
+ * @job: A job that has not yet been started.
+ *
+ * Begins execution of a job.
+ * Takes ownership of one reference to the job object.
+ */
+void job_start(Job *job);
+
+/**
+ * @job: The job to enter.
+ *
+ * Continue the specified job by entering the coroutine.
+ */
+void job_enter(Job *job);
+
+/**
+ * @job: The job that is ready to pause.
+ *
+ * Pause now if job_pause() has been called. Jobs that perform lots of I/O
+ * must call this between requests so that the job can be paused.
+ */
+void coroutine_fn job_pause_point(Job *job);
+
+/**
+ * @job: The job that calls the function.
+ *
+ * Yield the job coroutine.
+ */
+void job_yield(Job *job);
+
+/**
+ * @job: The job that calls the function.
+ * @ns: How many nanoseconds to stop for.
+ *
+ * Put the job to sleep (assuming that it wasn't canceled) for @ns
+ * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
+ * interrupt the wait.
+ */
+void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
+
+/**
+ * Returns whether the job is scheduled for cancellation (at an
+ * indefinite point).
+ */
+bool job_cancel_requested(Job *job);
+
+/** Returns whether the job is scheduled for cancellation. */
+bool job_is_cancelled(Job *job);
+
+/** Returns whether the job is ready to be completed. */
+bool job_is_ready(Job *job);
+
+/** The @job could not be started, free it. */
+void job_early_fail(Job *job);
+
+/** Moves the @job from RUNNING to READY */
+void job_transition_to_ready(Job *job);
+
+#endif /* JOB_DRIVER_H */
diff --git a/include/qemu/job-monitor.h b/include/qemu/job-monitor.h
index d92bc4f39d..f473bd298f 100644
--- a/include/qemu/job-monitor.h
+++ b/include/qemu/job-monitor.h
@@ -272,10 +272,10 @@ void job_dismiss(Job **job, Error **errp);
  */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
 
-/** Same as job_is_ready(), but assumes job_lock is held. */
+/** Same as job_is_ready() in job-driver.h, but assumes job_lock is held. */
 bool job_is_ready_locked(Job *job);
 
-/** Same as job_early_fail(), but assumes job_lock is held. */
+/** Same as job_early_fail() in job-driver.h, but assumes job_lock is held. */
 void job_early_fail_locked(Job *job);
 
 #endif
diff --git a/include/qemu/job.h b/include/qemu/job.h
index 8d189ed1c2..4a0b01dd1d 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -27,118 +27,8 @@
 #define JOB_H
 
 #include "job-monitor.h"
+#include "job-driver.h"
 
-/**
- * Create a new long-running job and return it.
- *
- * @job_id: The id of the newly-created job, or %NULL for internal jobs
- * @driver: The class object for the newly-created job.
- * @txn: The transaction this job belongs to, if any. %NULL otherwise.
- * @ctx: The AioContext to run the job coroutine in.
- * @flags: Creation flags for the job. See @JobCreateFlags.
- * @cb: Completion function for the job.
- * @opaque: Opaque pointer value passed to @cb.
- * @errp: Error object.
- */
-void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
-                 AioContext *ctx, int flags, BlockCompletionFunc *cb,
-                 void *opaque, Error **errp);
-
-/**
- * @job: The job that has made progress
- * @done: How much progress the job made since the last call
- *
- * Updates the progress counter of the job.
- */
-void job_progress_update(Job *job, uint64_t done);
-
-/**
- * @job: The job whose expected progress end value is set
- * @remaining: Missing progress (on top of the current progress counter value)
- *             until the new expected end value is reached
- *
- * Sets the expected end value of the progress counter of a job so that a
- * completion percentage can be calculated when the progress is updated.
- */
-void job_progress_set_remaining(Job *job, uint64_t remaining);
-
-/**
- * @job: The job whose expected progress end value is updated
- * @delta: Value which is to be added to the current expected end
- *         value
- *
- * Increases the expected end value of the progress counter of a job.
- * This is useful for parenthesis operations: If a job has to
- * conditionally perform a high-priority operation as part of its
- * progress, it calls this function with the expected operation's
- * length before, and job_progress_update() afterwards.
- * (So the operation acts as a parenthesis in regards to the main job
- * operation running in background.)
- */
-void job_progress_increase_remaining(Job *job, uint64_t delta);
-
-/** To be called when a cancelled job is finalised. */
-void job_event_cancelled(Job *job);
-
-/** To be called when a successfully completed job is finalised. */
-void job_event_completed(Job *job);
-
-/**
- * @job: A job that has not yet been started.
- *
- * Begins execution of a job.
- * Takes ownership of one reference to the job object.
- */
-void job_start(Job *job);
-
-/**
- * @job: The job to enter.
- *
- * Continue the specified job by entering the coroutine.
- */
-void job_enter(Job *job);
-
-/**
- * @job: The job that is ready to pause.
- *
- * Pause now if job_pause() has been called. Jobs that perform lots of I/O
- * must call this between requests so that the job can be paused.
- */
-void coroutine_fn job_pause_point(Job *job);
-
-/**
- * @job: The job that calls the function.
- *
- * Yield the job coroutine.
- */
-void job_yield(Job *job);
-
-/**
- * @job: The job that calls the function.
- * @ns: How many nanoseconds to stop for.
- *
- * Put the job to sleep (assuming that it wasn't canceled) for @ns
- * %QEMU_CLOCK_REALTIME nanoseconds.  Canceling the job will immediately
- * interrupt the wait.
- */
-void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
-
-/** Returns whether the job is being cancelled. */
-bool job_is_cancelled(Job *job);
-
-/**
- * Returns whether the job is scheduled for cancellation (at an
- * indefinite point).
- */
-bool job_cancel_requested(Job *job);
-
-/** Returns whether the job is ready to be completed. */
-bool job_is_ready(Job *job);
-
-/** The @job could not be started, free it. */
-void job_early_fail(Job *job);
-
-/** Moves the @job from RUNNING to READY */
-void job_transition_to_ready(Job *job);
+/* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
 #endif
-- 
2.27.0


