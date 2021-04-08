Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9803589DE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:37:36 +0200 (CEST)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXev-0004FO-Jk
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUXWy-0006Eu-8T
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUXOs-00029E-T0
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617898858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPUgI0EWYJX9LLRwnrV0db0/K/q7sIiYNAYue3pPA+k=;
 b=TqD1xnG9F8Kvf5AFVZ8UmhjedOcHzJW7yv5taXB8p1oHMbc0E5u7QFRPCgNgSQfj84eIjw
 sqS01QpkYlRmi94lmE+/m8z9kFjHnldNuCDQkSm+8EDi0T3ezntO8Z328uIFtW711VF+yW
 gtrEzM2JYLUUHb4jPogjfr5M5t1UbeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-NFJpFezDNwO5jkaqIwUUqg-1; Thu, 08 Apr 2021 12:20:54 -0400
X-MC-Unique: NFJpFezDNwO5jkaqIwUUqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7462100A628;
 Thu,  8 Apr 2021 16:20:52 +0000 (UTC)
Received: from localhost (ovpn-114-123.ams2.redhat.com [10.36.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74D3662A1B;
 Thu,  8 Apr 2021 16:20:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
Date: Thu,  8 Apr 2021 18:20:37 +0200
Message-Id: <20210408162039.242670-2-mreitz@redhat.com>
In-Reply-To: <20210408162039.242670-1-mreitz@redhat.com>
References: <20210408162039.242670-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

block-job-complete can only be applied when the job is READY, not when
it is on STANDBY (ready, but paused).  Draining a job technically pauses
it (which makes a READY job enter STANDBY), and ending the drained
section does not synchronously resume it, but only schedules the job,
which will then be resumed.  So attempting to complete a job immediately
after a drained section may sometimes fail.

That is bad at least because users cannot really work nicely around
this: A job may be paused and resumed at any time, so waiting for the
job to be in the READY state and then issuing a block-job-complete poses
a TOCTTOU problem.  The only way around it would be to issue
block-job-complete until it no longer fails due to the job being in the
STANDBY state, but that would not be nice.

We can solve the problem by allowing block-job-complete to be invoked on
jobs that are on STANDBY, if that status is the result of a drained
section (not because the user has paused the job), and that section has
ended.  That is, if the job is on STANDBY, but scheduled to be resumed.

Perhaps we could actually just directly allow this, seeing that mirror
is the only user of ready/complete, and that mirror_complete() could
probably work under the given circumstances, but there may be many side
effects to consider.

It is simpler to add a function job_wait_unpaused() that waits for the
job to be resumed (under said circumstances), and to make
qmp_block_job_complete() use it to delay job_complete() until then.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1945635
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/qemu/job.h | 15 +++++++++++++++
 blockdev.c         |  3 +++
 job.c              | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index efc6fa7544..cf3082b6d7 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -563,4 +563,19 @@ void job_dismiss(Job **job, Error **errp);
  */
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
 
+/**
+ * If the job has been paused because of a drained section, and that
+ * section has ended, wait until the job is resumed.
+ *
+ * Return 0 if the job is not paused, or if it has been successfully
+ * resumed.
+ * Return an error if the job has been paused in such a way that
+ * waiting will not resume it, i.e. if it has been paused by the user,
+ * or if it is still drained.
+ *
+ * Callers must be in the home AioContext and hold the AioContext lock
+ * of job->aio_context.
+ */
+int job_wait_unpaused(Job *job, Error **errp);
+
 #endif
diff --git a/blockdev.c b/blockdev.c
index a57590aae4..c0cc2fa364 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3414,6 +3414,9 @@ void qmp_block_job_complete(const char *device, Error **errp)
         return;
     }
 
+    if (job_wait_unpaused(&job->job, errp) < 0) {
+        return;
+    }
     trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
     aio_context_release(aio_context);
diff --git a/job.c b/job.c
index 289edee143..1ea30fd294 100644
--- a/job.c
+++ b/job.c
@@ -1023,3 +1023,45 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
     job_unref(job);
     return ret;
 }
+
+int job_wait_unpaused(Job *job, Error **errp)
+{
+    /*
+     * Only run this function from the main context, because this is
+     * what we need, and this way we do not have to think about what
+     * happens if the user concurrently pauses the job from the main
+     * monitor.
+     */
+    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+
+    /*
+     * Quick path (e.g. so we do not get an error if pause_count > 0
+     * but the job is not even paused)
+     */
+    if (!job->paused) {
+        return 0;
+    }
+
+    /* If the user has paused the job, waiting will not help */
+    if (job->user_paused) {
+        error_setg(errp, "Job '%s' has been paused by the user", job->id);
+        return -EBUSY;
+    }
+
+    /* Similarly, if the job is still drained, waiting will not help either */
+    if (job->pause_count > 0) {
+        error_setg(errp, "Job '%s' is blocked and cannot be unpaused", job->id);
+        return -EBUSY;
+    }
+
+    /*
+     * This function is specifically for waiting for a job to be
+     * resumed after a drained section.  Ending the drained section
+     * includes a job_enter(), which schedules the job loop to be run,
+     * and once it does, job->paused will be cleared.  Therefore, we
+     * do not need to invoke job_enter() here.
+     */
+    AIO_WAIT_WHILE(job->aio_context, job->paused);
+
+    return 0;
+}
-- 
2.29.2


