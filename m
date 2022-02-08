Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA14ADE6B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:36:09 +0100 (CET)
Received: from localhost ([::1]:58226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTTM-0004ql-EN
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:36:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRb2-0003Jh-R1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRaq-0008Gp-Gv
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644330940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lx9ulToUDVpMbcY17VOM7nPtugvZMKLHWBbqHryuJf0=;
 b=ORXfRGU1DfPa0JGtmwqypqCbx5UlwoxjmN4umkt+azYxcCXYgd5mC0HiZRERL+YxI0vtQx
 00errKzNtrZ5d5Ga9XE8AyIFVwMU9S65NhmthQpkbjM9BKm2Zb/i3o+VH/p9Kv4RoMZ/zv
 JcH+WPl8CTHyGgstTBwODJDynk3DQ8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-Bs9GSiGfNniym4rsXrGSNg-1; Tue, 08 Feb 2022 09:35:39 -0500
X-MC-Unique: Bs9GSiGfNniym4rsXrGSNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52534100C669;
 Tue,  8 Feb 2022 14:35:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C3A670F55;
 Tue,  8 Feb 2022 14:35:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 17/20] job: detect change of aiocontext within job coroutine
Date: Tue,  8 Feb 2022 09:35:10 -0500
Message-Id: <20220208143513.1077229-18-eesposit@redhat.com>
In-Reply-To: <20220208143513.1077229-1-eesposit@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 job.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/job.c b/job.c
index 83cc9f52bd..f05850a337 100644
--- a/job.c
+++ b/job.c
@@ -529,11 +529,12 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
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
@@ -554,6 +555,8 @@ void job_enter(Job *job)
  */
 static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
 {
+    AioContext *next_aio_context;
+
     real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
@@ -565,6 +568,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
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
     job_enter_cond_locked(job, job_timer_not_pending_locked);
 }
@@ -1117,6 +1133,8 @@ static void coroutine_fn job_co_entry(void *opaque)
 
 void job_start(Job *job)
 {
+    assert(qemu_in_main_thread());
+
     WITH_JOB_LOCK_GUARD() {
         assert(job && !job_started(job) && job->paused &&
             job->driver && job->driver->run);
-- 
2.31.1


