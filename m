Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84453CDA2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 19:02:01 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxAgS-0003PX-4E
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 13:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nxAdu-0002So-Eu
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nxAdr-0004Tr-E7
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654275551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DbiBVAyrHxAxK/QEy0ZwkTY8yyfM70jxWpQ1jGpyrC8=;
 b=RJC/29FDAwJBV73yfIfdWHwD9kHoj8P8GqwX4ndvnmlCinpHl922PoQRFAHFaCrYuMiFgW
 ZwisQPyhWodv0rUC1yBUK65GvxElubD8hUbaPT9iGc9I0q+B0r5q2/tcwFFKSs8LP145yT
 XRH9lyBcw/mLkLkx83tl8RIVBtHvlmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-mt114-A-NLejjcOU_j60fg-1; Fri, 03 Jun 2022 12:59:07 -0400
X-MC-Unique: mt114-A-NLejjcOU_j60fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B046185A7B2;
 Fri,  3 Jun 2022 16:59:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D47F2026D07;
 Fri,  3 Jun 2022 16:59:05 +0000 (UTC)
Date: Fri, 3 Jun 2022 18:59:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 15/18] job: detect change of aiocontext within job
 coroutine
Message-ID: <Ypo915liDsISLwuW@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-16-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-16-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.03.2022 um 14:37 hat Emanuele Giuseppe Esposito geschrieben:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> We want to make sure access of job->aio_context is always done
> under either BQL or job_mutex. The problem is that using
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
> 
> Check for the aiocontext change in job_do_yield_locked because:
> 1) aio_co_reschedule_self requires to be in the running coroutine
> 2) since child_job_set_aio_context allows changing the aiocontext only
>    while the job is paused, this is the exact place where the coroutine
>    resumes, before running JobDriver's code.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  job.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/job.c b/job.c
> index 89c0e6bed9..10a5981748 100644
> --- a/job.c
> +++ b/job.c
> @@ -543,11 +543,12 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>          return;
>      }
>  
> -    assert(!job->deferred_to_main_loop);

Why doesn't this assertion hold true any more?

>      timer_del(&job->sleep_timer);
>      job->busy = true;
>      real_job_unlock();
> -    aio_co_enter(job->aio_context, job->co);
> +    job_unlock();
> +    aio_co_wake(job->co);
> +    job_lock();
>  }
>  
>  void job_enter(Job *job)
> @@ -568,6 +569,8 @@ void job_enter(Job *job)
>   */
>  static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>  {
> +    AioContext *next_aio_context;
> +
>      real_job_lock();
>      if (ns != -1) {
>          timer_mod(&job->sleep_timer, ns);
> @@ -579,6 +582,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>      qemu_coroutine_yield();
>      job_lock();
>  
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
> +

Extra empty line.

>      /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
>      assert(job->busy);
>  }
> @@ -680,7 +697,6 @@ void job_resume_locked(Job *job)
>      if (job->pause_count) {
>          return;
>      }
> -
>      /* kick only if no timer is pending */
>      job_enter_cond_locked(job, job_timer_not_pending_locked);
>  }

This hunk looks unrelated.

Kevin


