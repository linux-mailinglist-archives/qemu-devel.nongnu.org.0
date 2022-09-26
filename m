Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD75EA5A8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:10:29 +0200 (CEST)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmwN-0003pT-Qc
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocmft-00087b-4B; Mon, 26 Sep 2022 07:53:25 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:32846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocmfo-0005Cq-Dl; Mon, 26 Sep 2022 07:53:23 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 4BCFC2E1AD9;
 Mon, 26 Sep 2022 14:53:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b683::1:39] (unknown
 [2a02:6b8:b081:b683::1:39])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 j6bod2yFTC-r6O472Sr; Mon, 26 Sep 2022 14:53:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664193187; bh=BH/J/oKrko9qPT3wrmkmh9Ca/4oodKwtzNvq68nAcc0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kDPKk6eRHurWUdZCPWtTSxCXs7NO/zHhZF0kMaLOOm0bsD6/Xp6vCqh+xjJx9C+5d
 NU36Zf0HeqZBeWiS8vEvfsFqmppGTIq/j8brsmCCSNp8LG/2nq+0BlV3qSYYBu4FWK
 SFGE31tiwpMpLFrmp2BrBVwcKF9wpXIl/1KsPmsw=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <46fb1b12-08cb-eddc-ea0e-e500a791dee9@yandex-team.ru>
Date: Mon, 26 Sep 2022 14:53:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 13/21] jobs: protect job.aio_context with BQL and
 job_mutex
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220926093214.506243-1-eesposit@redhat.com>
 <20220926093214.506243-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220926093214.506243-14-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/26/22 12:32, Emanuele Giuseppe Esposito wrote:
> In order to make it thread safe, implement a "fake rwlock",
> where we allow reads under BQL *or* job_mutex held, but
> writes only under BQL *and* job_mutex.
> 
> The only write we have is in child_job_set_aio_ctx, which always
> happens under drain (so the job is paused).
> For this reason, introduce job_set_aio_context and make sure that
> the context is set under BQL, job_mutex and drain.
> Also make sure all other places where the aiocontext is read
> are protected.
> 
> The reads in commit.c and mirror.c are actually safe, because always
> done under BQL.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   block/replication.c |  1 +
>   blockjob.c          |  3 ++-

[..]

> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -74,11 +74,17 @@ typedef struct Job {
>       /* ProgressMeter API is thread-safe */
>       ProgressMeter progress;
>   
> +    /**
> +     * AioContext to run the job coroutine in.
> +     * The job Aiocontext can be read when holding *either*
> +     * the BQL (so we are in the main loop) or the job_mutex.
> +     * It can only be written when we hold *both* BQL
> +     * and the job_mutex.
> +     */
> +    AioContext *aio_context;
>   
> -    /** Protected by AioContext lock */
>   
> -    /** AioContext to run the job coroutine in */
> -    AioContext *aio_context;
> +    /** Protected by AioContext lock */
>   
>       /** Reference count of the block job */
>       int refcnt;
> @@ -741,4 +747,15 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
>   int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>                              Error **errp);
>   
> +/**
> + * Sets the @job->aio_context.
> + * Called with job_mutex *not* held.
> + *
> + * This function must run in the main thread to protect against
> + * concurrent read in job_finish_sync_locked(), takes the job_mutex
> + * lock to protect against the read in job_do_yield_locked(), and must
> + * be called when the job is quiescent.

I'd also add "set only by job_set_aio_context()".

> + */
> +void job_set_aio_context(Job *job, AioContext *ctx);
> +
>   #endif


-- 
Best regards,
Vladimir

