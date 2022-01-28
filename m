Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5006E49F956
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:25:41 +0100 (CET)
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQJw-0006Ga-Ev
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:25:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmU-0004b8-Ri
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmP-0003S9-W9
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbkEuR1C6NYQz0JZJ4AH1ROAHc6gyehm+OZm5zwf6uA=;
 b=SFH/mswAKyMT1SBWhQdpFfDkOQGouE0YKQJ/mPyeyDFy+d7AYGMfGeXvbA4yWbsanNt/iA
 F+zlrLq7TKWLHtoXffDpjPh4YfvkZngDUDA9CFa8NpZSaW8CQQvu+crjohfv5ZImY2xCNA
 C4J0RgJlglKvw428FIyEK9XaaBJ491A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-BtQNS9GzNA2f9Du-LE4Ofw-1; Fri, 28 Jan 2022 06:50:54 -0500
X-MC-Unique: BtQNS9GzNA2f9Du-LE4Ofw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 912A61083F60;
 Fri, 28 Jan 2022 11:50:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA02E22DE7;
 Fri, 28 Jan 2022 11:50:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 16/19] job: detect change of aiocontext within job coroutine
Date: Fri, 28 Jan 2022 06:50:28 -0500
Message-Id: <20220128115031.4061565-17-eesposit@redhat.com>
In-Reply-To: <20220128115031.4061565-1-eesposit@redhat.com>
References: <20220128115031.4061565-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

We want to make sure access of job->aio_context is always done
under either BQL or job_mutex. The problem is that using
aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
makes the coroutine immediately resume, so we can't hold the job lock.
And caching it is not safe either, as it might change.

job_start is under BQL, so it can freely read job->aiocontext, but
job_enter_cond is not. In order to fix this, use aio_co_wake():
the advantage is that it won't use job->aiocontext, but the
main disadvantage is that it won't be able to detect a change of
job AioContext.

Calling bdrv_try_set_aio_context() will issue the following calls
(simplified):
* in terms of  bdrv callbacks:
  .drained_begin -> .set_aio_context -> .drained_end
* in terms of child_job functions:
  child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
* in terms of job functions:
  job_pause_locked -> job_set_aio_context -> job_resume_locked

We can see that after setting the new aio_context, job_resume_locked
calls again job_enter_cond, which then invokes aio_co_wake(). But
while job->aiocontext has been set in job_set_aio_context,
job->co->ctx has not changed, so the coroutine would be entering in
the wrong aiocontext.

Using aio_co_schedule in job_resume_locked() might seem as a valid
alternative, but the problem is that the bh resuming the coroutine
is not scheduled immediately, and if in the meanwhile another
bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
test-block-iothread.c), we would have the first schedule in the
wrong aiocontext, and the second set of drains won't even manage
to schedule the coroutine, as job->busy would still be true from
the previous job_resume_locked().

The solution is to stick with aio_co_wake(), but then detect every time
the coroutine resumes back from yielding if job->aio_context
has changed. If so, we can reschedule it to the new context.

Check for the aiocontext change in job_do_yield_locked because:
1) aio_co_reschedule_self requires to be in the running coroutine
2) since child_job_set_aio_context allows changing the aiocontext only
   while the job is paused, this is the exact place where the coroutine
   resumes, before running JobDriver's code.

As a small improvement, we don't need aio_co_enter() in job_start(),
we can simplify it with qemu_coroutine_enter(). If the aio_context
where it is running is wrong, job_do_yield_locked() will automatically
reschedule the coroutine where it belongs, once the first
job_pause_point is triggered in job_co_entry.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 job.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/job.c b/job.c
index 468a387390..bce76b21d8 100644
--- a/job.c
+++ b/job.c
@@ -532,11 +532,12 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    assert(!job->deferred_to_main_loop);
     timer_del(&job->sleep_timer);
     job->busy = true;
     real_job_unlock();
-    aio_co_enter(job->aio_context, job->co);
+    job_unlock();
+    aio_co_wake(job->co);
+    job_lock();
 }
 
 void job_enter(Job *job)
@@ -556,6 +557,8 @@ void job_enter(Job *job)
  */
 static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
 {
+    AioContext *next_aio_context;
+
     real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
@@ -567,6 +570,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
     qemu_coroutine_yield();
     job_lock();
 
+    next_aio_context = job->aio_context;
+    /*
+     * Coroutine has resumed, but in the meanwhile the job AioContext
+     * might have changed via bdrv_try_set_aio_context(), so we need to move
+     * the coroutine too in the new aiocontext.
+     */
+    while (qemu_get_current_aio_context() != next_aio_context) {
+        job_unlock();
+        aio_co_reschedule_self(next_aio_context);
+        job_lock();
+        next_aio_context = job->aio_context;
+    }
+
+
     /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
     assert(job->busy);
 }
@@ -666,7 +683,6 @@ void job_resume_locked(Job *job)
     if (job->pause_count) {
         return;
     }
-
     /* kick only if no timer is pending */
     job_enter_cond_locked(job, job_timer_not_pending);
 }
@@ -1145,7 +1161,7 @@ void job_start(Job *job)
         job->paused = false;
         job_state_transition_locked(job, JOB_STATUS_RUNNING);
     }
-    aio_co_enter(job->aio_context, job->co);
+    qemu_coroutine_enter(job->co);
 }
 
 void job_cancel_locked(Job *job, bool force)
-- 
2.31.1


