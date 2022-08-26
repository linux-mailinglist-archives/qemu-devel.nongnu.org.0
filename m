Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCDA5A2882
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:27:37 +0200 (CEST)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZN3-0004JA-3L
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH5-0000uY-LF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGw-0003yO-6y
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7U6E90FGtRSbpixI9LatbGRxPSyzI8PxUSeETn4VtA=;
 b=BNqPRutnVwzh4N9FcWgpbxxrxzzRIrf1NzGZOn/z6pgrvT9oI+fsbOIweino+77M499c7X
 Na1CjAV8XH1HFlgT/xixvpQAPHeZfhR57NJIKbUNwzsTXeYhyUEcc1TQYGnL4SbK4CwzvI
 jqXmpChBBzSFgcSxJf/tYKgL9OOjekg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-9KgUxBAuMzOpy7VUHv7JYw-1; Fri, 26 Aug 2022 09:21:12 -0400
X-MC-Unique: 9KgUxBAuMzOpy7VUHv7JYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67B1C803520;
 Fri, 26 Aug 2022 13:21:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15280492C3B;
 Fri, 26 Aug 2022 13:21:12 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v11 12/21] job: detect change of aiocontext within job
 coroutine
Date: Fri, 26 Aug 2022 09:20:55 -0400
Message-Id: <20220826132104.3678958-13-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
job_enter_cond is not.
We want to avoid reading job->aio_context in job_enter_cond, therefore:
1) use aio_co_wake(), since it doesn't want an aiocontext as argument
   but uses job->co->ctx
2) detect possible discrepancy between job->co->ctx and job->aio_context
   by checking right after the coroutine resumes back from yielding if
   job->aio_context has changed. If so, reschedule the coroutine to the
   new context.

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

The solution is to stick with aio_co_wake() and detect every time
the coroutine resumes back from yielding if job->aio_context
has changed. If so, we can reschedule it to the new context.

Check for the aiocontext change in job_do_yield_locked because:
1) aio_co_reschedule_self requires to be in the running coroutine
2) since child_job_set_aio_context allows changing the aiocontext only
   while the job is paused, this is the exact place where the coroutine
   resumes, before running JobDriver's code.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 job.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/job.c b/job.c
index e336af0c1c..85ae843f03 100644
--- a/job.c
+++ b/job.c
@@ -588,7 +588,7 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
     job->busy = true;
     real_job_unlock();
     job_unlock();
-    aio_co_enter(job->aio_context, job->co);
+    aio_co_wake(job->co);
     job_lock();
 }
 
@@ -615,6 +615,8 @@ void job_enter(Job *job)
  */
 static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
 {
+    AioContext *next_aio_context;
+
     real_job_lock();
     if (ns != -1) {
         timer_mod(&job->sleep_timer, ns);
@@ -626,7 +628,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
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


