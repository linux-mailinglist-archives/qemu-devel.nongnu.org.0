Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7B570653
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:56:50 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuq9-0002lO-VQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAtwq-0000Ly-F7; Mon, 11 Jul 2022 09:59:41 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:58260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAtwl-00038g-JU; Mon, 11 Jul 2022 09:59:37 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 64D2E2E1B27;
 Mon, 11 Jul 2022 16:59:24 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id iyb3ld9OTF-xMOiETtu; Mon, 11 Jul 2022 16:59:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657547963; bh=mdYNYp8lyaNFk4Hd1fDbtDJ8H7WuqPesZmKZ+HpqTJ0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=jZZosqDh+zaKapu/x0sBdqO4DXm+UENRjjsrpcPmbQiDuG6Hh6MfROmwRfl6SxuE1
 gQQB7Ut/CkAyzqrw/rtDkjTqTBfc7W5u1y/b+NjmRYurMy3EEIyh470BFc5NQJfDFl
 20bBy+kTLCShcL656EJRNcsFJRbVD+f0CJiSTxgo=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <402ade44-8309-aa69-682f-59560ddedd8d@yandex-team.ru>
Date: Mon, 11 Jul 2022 16:59:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 13/21] job: detect change of aiocontext within job
 coroutine
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-14-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
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
>    .drained_begin -> .set_aio_context -> .drained_end
> * in terms of child_job functions:
>    child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
> * in terms of job functions:
>    job_pause_locked -> job_set_aio_context -> job_resume_locked
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
>     while the job is paused, this is the exact place where the coroutine
>     resumes, before running JobDriver's code.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Seems reasonable to me, still I don't have the whole picture in mind. Weak:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   job.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/job.c b/job.c
> index 9c8792c9e8..405f39566b 100644
> --- a/job.c
> +++ b/job.c
> @@ -581,11 +581,12 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>           return;
>       }
>   
> -    assert(!job->deferred_to_main_loop);

why we remove this assertion?

>       timer_del(&job->sleep_timer);
>       job->busy = true;
>       real_job_unlock();
> -    aio_co_enter(job->aio_context, job->co);
> +    job_unlock();
> +    aio_co_wake(job->co);
> +    job_lock();
>   }
>   
>   void job_enter_cond(Job *job, bool(*fn)(Job *job))
> @@ -611,6 +612,8 @@ void job_enter(Job *job)
>    */
>   static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>   {
> +    AioContext *next_aio_context;
> +
>       real_job_lock();
>       if (ns != -1) {
>           timer_mod(&job->sleep_timer, ns);
> @@ -622,7 +625,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>       qemu_coroutine_yield();
>       job_lock();
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
>       assert(job->busy);
>   }
>   


-- 
Best regards,
Vladimir

