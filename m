Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B056943E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:21:59 +0200 (CEST)
Received: from localhost ([::1]:45906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CT7-0008BS-NW
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRG-0005Ff-Ij
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BR8-0007Fn-VY
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657138550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQ1ZDp3Sgr++kW+UUv+4pFkVwMiwKeAo0wxoeWPbovk=;
 b=SfZjZeQ5ks8s4Jk735lNTwxhBwYE9BHDHO0E5yqsZPwTXF41T73rqKTK8AkSnWf/ywZO0u
 UcFE1Bf8EBcuHT1CDTO4llKfYe6xaa67N/Uof7uCpJDZYH9iRR1fXrexZ5GVMEJlwNhed7
 CYXfviLzDmj5sbW4wTOcLJdOmr0gCdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-y2cWufcgNIydn8j8_hmbJA-1; Wed, 06 Jul 2022 16:15:47 -0400
X-MC-Unique: y2cWufcgNIydn8j8_hmbJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEF4E1019C8B;
 Wed,  6 Jul 2022 20:15:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FA321121315;
 Wed,  6 Jul 2022 20:15:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: [PATCH v9 13/21] job: detect change of aiocontext within job coroutine
Date: Wed,  6 Jul 2022 16:15:25 -0400
Message-Id: <20220706201533.289775-14-eesposit@redhat.com>
In-Reply-To: <20220706201533.289775-1-eesposit@redhat.com>
References: <20220706201533.289775-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 job.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/job.c b/job.c
index 9c8792c9e8..405f39566b 100644
--- a/job.c
+++ b/job.c
@@ -581,11 +581,12 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
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
 
 void job_enter_cond(Job *job, bool(*fn)(Job *job))
@@ -611,6 +612,8 @@ void job_enter(Job *job)
  */
 static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
 {
+    AioContext *next_aio_context;
+
     real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
@@ -622,7 +625,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
     qemu_coroutine_yield();
     job_lock();
 
-    /* Set by job_enter_cond() before re-entering the coroutine.  */
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
+    /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
     assert(job->busy);
 }
 
-- 
2.31.1


