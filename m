Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919358A849
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:46:52 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsyo-0001O1-MP
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJsq0-00027H-1x
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJspx-0008CF-DO
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659688660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LrRP7B1de3CezWxbrKi0IxqQErMBuFnceVIPRM6I8wA=;
 b=c5VyK5b2np+6n7BlvKbOCqqMaKvGz9iWcL6HN5c/E5Iuf+PuSGK5vJmynZNlIto4cxdVhu
 xTUUzKsN5g98EOdvL/F9RXuqWfKb7G4CPYyazf35tiZU6E+QhrpIDK+5/8QqlEpLJcAVNJ
 XzcNs6nsqdmpGLwGDQb8m4BvfEdTpU8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-Ee591VVRPxC8fa10fnDbHQ-1; Fri, 05 Aug 2022 04:37:36 -0400
X-MC-Unique: Ee591VVRPxC8fa10fnDbHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A6193826A51;
 Fri,  5 Aug 2022 08:37:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3401C2026D07;
 Fri,  5 Aug 2022 08:37:33 +0000 (UTC)
Date: Fri, 5 Aug 2022 10:37:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 13/21] job: detect change of aiocontext within job
 coroutine
Message-ID: <YuzWy1wQPf6HXl+0@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-14-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> We want to make sure access of job->aio_context is always done
> under either BQL or job_mutex.

Is this the goal of this series? If so, it would have been useful to
state somewhere more obvious, because I had assumed that holding the BQL
would not be considered enough, but everyone needs to hold the job_mutex.

> The problem is that using
> aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
> makes the coroutine immediately resume, so we can't hold the job lock.
> And caching it is not safe either, as it might change.
> 
> job_start is under BQL, so it can freely read job->aiocontext, but
> job_enter_cond is not. In order to fix this, use aio_co_wake():
> the advantage is that it won't use job->aiocontext, but the
> main disadvantage is that it won't be able to detect a change of
> job AioContext.
> 
> Calling bdrv_try_set_aio_context() will issue the following calls
> (simplified):
> * in terms of  bdrv callbacks:
>   .drained_begin -> .set_aio_context -> .drained_end
> * in terms of child_job functions:
>   child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
> * in terms of job functions:
>   job_pause_locked -> job_set_aio_context -> job_resume_locked
> 
> We can see that after setting the new aio_context, job_resume_locked
> calls again job_enter_cond, which then invokes aio_co_wake(). But
> while job->aiocontext has been set in job_set_aio_context,
> job->co->ctx has not changed, so the coroutine would be entering in
> the wrong aiocontext.
> 
> Using aio_co_schedule in job_resume_locked() might seem as a valid
> alternative, but the problem is that the bh resuming the coroutine
> is not scheduled immediately, and if in the meanwhile another
> bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
> test-block-iothread.c), we would have the first schedule in the
> wrong aiocontext, and the second set of drains won't even manage
> to schedule the coroutine, as job->busy would still be true from
> the previous job_resume_locked().
> 
> The solution is to stick with aio_co_wake(), but then detect every time
> the coroutine resumes back from yielding if job->aio_context
> has changed. If so, we can reschedule it to the new context.

Hm, but with this in place, what does aio_co_wake() actually buy us
compared to aio_co_enter()?

I guess it's a bit simpler code because you don't have to explicitly
specify the AioContext, but we're still going to enter the coroutine in
the wrong AioContext occasionally and have to reschedule it, just like
in the existing code (except that the rescheduling doesn't exist there
yet).

So while I don't disagree with the change, I don't think the
justification in the commit message is right for this part.

> Check for the aiocontext change in job_do_yield_locked because:
> 1) aio_co_reschedule_self requires to be in the running coroutine
> 2) since child_job_set_aio_context allows changing the aiocontext only
>    while the job is paused, this is the exact place where the coroutine
>    resumes, before running JobDriver's code.
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  job.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/job.c b/job.c
> index b0729e2bb2..ecec66b44e 100644
> --- a/job.c
> +++ b/job.c
> @@ -585,7 +585,9 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>      timer_del(&job->sleep_timer);
>      job->busy = true;
>      real_job_unlock();
> -    aio_co_enter(job->aio_context, job->co);
> +    job_unlock();
> +    aio_co_wake(job->co);
> +    job_lock();

The addition of job_unlock/lock is unrelated, this was necessary even
before this patch.

>  }
>  
>  void job_enter_cond(Job *job, bool(*fn)(Job *job))
> @@ -611,6 +613,8 @@ void job_enter(Job *job)
>   */
>  static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>  {
> +    AioContext *next_aio_context;
> +
>      real_job_lock();
>      if (ns != -1) {
>          timer_mod(&job->sleep_timer, ns);
> @@ -622,7 +626,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>      qemu_coroutine_yield();
>      job_lock();
>  
> -    /* Set by job_enter_cond() before re-entering the coroutine.  */
> +    next_aio_context = job->aio_context;
> +    /*
> +     * Coroutine has resumed, but in the meanwhile the job AioContext
> +     * might have changed via bdrv_try_set_aio_context(), so we need to move
> +     * the coroutine too in the new aiocontext.
> +     */
> +    while (qemu_get_current_aio_context() != next_aio_context) {
> +        job_unlock();
> +        aio_co_reschedule_self(next_aio_context);
> +        job_lock();
> +        next_aio_context = job->aio_context;
> +    }
> +
> +    /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
>      assert(job->busy);
>  }

The actual code changes look good.

Kevin


