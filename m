Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D3553537
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:07:11 +0200 (CEST)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fTB-0000sz-N6
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3fPg-0006S3-Pq; Tue, 21 Jun 2022 11:03:33 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:35890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3fPa-0001oo-O3; Tue, 21 Jun 2022 11:03:29 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 906B72E12D4;
 Tue, 21 Jun 2022 18:03:14 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 D6ILpdtOK2-3DLu2QRK; Tue, 21 Jun 2022 18:03:14 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655823794; bh=eIRy0N5GC9wP1YPPq4Cuqq9tR9lI7l0eORriJZcOD2Y=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=xa3bL/u0Enwentayqa0GHx1r3O8JMFSPLorCcfFj3z/cir65M9RusVJyCx79C6ze2
 W7cCqh8oBvvpsg9e9lu+JStpXYap1/uPffhWUIlOpVl+AuOcX54IBsnkU9Bb56jfVh
 d2ANWjmpF4vzdoUQxjgDfIlnq7bCu8Q+uk9Wn38Y=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:23::1:8] (unknown [2a02:6b8:b081:23::1:8])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id HtxzhzEnV4-3DMe2I4K; Tue, 21 Jun 2022 18:03:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <09a6ad0c-8e18-9dd0-0cbb-a2ba0ecf33a9@yandex-team.ru>
Date: Tue, 21 Jun 2022 18:03:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 05/18] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220616131835.2004262-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
> In preparation to the job_lock/unlock usage, create _locked
> duplicates of some functions, since they will be sometimes called with
> job_mutex held (mostly within job.c),
> and sometimes without (mostly from JobDrivers using the job API).
> 
> Therefore create a _locked version of such function, so that it
> can be used in both cases.
> 
> List of functions duplicated as _locked:
> job_is_ready (both versions are public)
> job_is_completed (both versions are public)
> job_is_cancelled (_locked version is public, needed by mirror.c)
> job_pause_point (_locked version is static, purely done to simplify the code)
> job_cancel_requested (_locked version is static)
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.

Great description, thanks!

> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Hmm, after this patch, part of public API has "called with/without lock" comments. But there are still public job_* functions that doesn't have this mark. That look inconsistent. I think, all public API without _locked suffix, should be called without a lock? If so, we don't need to write it for each function. And only mark _locked() functions with "called with lock held" marks.

> ---
>   include/qemu/job.h | 25 +++++++++++++++++++++---
>   job.c              | 48 ++++++++++++++++++++++++++++++++++++++++------
>   2 files changed, 64 insertions(+), 9 deletions(-)
> 

[..]

>   
> -/** Returns whether the job is ready to be completed. */
> +/** Just like job_is_completed, but called between job_lock and job_unlock */

I'd prefer phrasing "called with job_lock held". You wording make me think about

job_lock()
...
job_unlock()

foo()

job_lock()
...
job_unlock()

- foo() actually called between job_lock and job_unlock :)

(it's a nitpicking, you may ignore it :)

> +bool job_is_completed_locked(Job *job);
> +
> +/**
> + * Returns whether the job is ready to be completed.
> + * Called with job_mutex *not* held.
> + */
>   bool job_is_ready(Job *job);
>   
> +/** Just like job_is_ready, but called between job_lock and job_unlock */
> +bool job_is_ready_locked(Job *job);
> +
>   /**
>    * Request @job to pause at the next pause point. Must be paired with
>    * job_resume(). If the job is supposed to be resumed by user action, call
> diff --git a/job.c b/job.c
> index cafd597ba4..c4776985c4 100644
> --- a/job.c
> +++ b/job.c
> @@ -236,19 +236,32 @@ const char *job_type_str(const Job *job)
>       return JobType_str(job_type(job));
>   }
>   
> -bool job_is_cancelled(Job *job)
> +bool job_is_cancelled_locked(Job *job)
>   {
>       /* force_cancel may be true only if cancelled is true, too */
>       assert(job->cancelled || !job->force_cancel);
>       return job->force_cancel;
>   }
>   
> -bool job_cancel_requested(Job *job)
> +bool job_is_cancelled(Job *job)
> +{
> +    JOB_LOCK_GUARD();
> +    return job_is_cancelled_locked(job);
> +}
> +
> +/* Called with job_mutex held. */
> +static bool job_cancel_requested_locked(Job *job)
>   {
>       return job->cancelled;
>   }
>   
> -bool job_is_ready(Job *job)
> +bool job_cancel_requested(Job *job)
> +{
> +    JOB_LOCK_GUARD();
> +    return job_cancel_requested_locked(job);
> +}
> +
> +bool job_is_ready_locked(Job *job)
>   {
>       switch (job->status) {
>       case JOB_STATUS_UNDEFINED:
> @@ -270,7 +283,13 @@ bool job_is_ready(Job *job)
>       return false;
>   }
>   
> -bool job_is_completed(Job *job)
> +bool job_is_ready(Job *job)
> +{
> +    JOB_LOCK_GUARD();
> +    return job_is_ready_locked(job);
> +}
> +
> +bool job_is_completed_locked(Job *job)
>   {
>       switch (job->status) {
>       case JOB_STATUS_UNDEFINED:
> @@ -292,6 +311,12 @@ bool job_is_completed(Job *job)
>       return false;
>   }
>   
> +bool job_is_completed(Job *job)
> +{
> +    JOB_LOCK_GUARD();
> +    return job_is_completed_locked(job);
> +}
> +
>   static bool job_started(Job *job)
>   {
>       return job->co;
> @@ -521,7 +546,8 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
>       assert(job->busy);
>   }
>   
> -void coroutine_fn job_pause_point(Job *job)
> +/* Called with job_mutex held, but releases it temporarily. */
> +static void coroutine_fn job_pause_point_locked(Job *job)
>   {
>       assert(job && job_started(job));

In this function, we should now use job_pause_point_locked(), otherwise it looks incorrect. (I remember that lock is noop for now, but still, let's keep think as correct as possible)


And job_do_yield() takes lock by itself. How to resolve it?

>   
> @@ -552,6 +578,12 @@ void coroutine_fn job_pause_point(Job *job)
>       }
>   }
>   
> +void coroutine_fn job_pause_point(Job *job)
> +{
> +    JOB_LOCK_GUARD();
> +    job_pause_point_locked(job);
> +}
> +
>   void job_yield(Job *job)
>   {
>       assert(job->busy);
> @@ -949,11 +981,15 @@ static void job_completed(Job *job)
>       }
>   }
>   
> -/** Useful only as a type shim for aio_bh_schedule_oneshot. */
> +/**
> + * Useful only as a type shim for aio_bh_schedule_oneshot.
> + * Called with job_mutex *not* held.
> + */
>   static void job_exit(void *opaque)
>   {
>       Job *job = (Job *)opaque;
>       AioContext *ctx;
> +    JOB_LOCK_GUARD();

That's not part of this patch.. Doesn't relate to "add _locked duplicates"

>   
>       job_ref(job);
>       aio_context_acquire(job->aio_context);


-- 
Best regards,
Vladimir

