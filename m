Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1551357063E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:52:55 +0200 (CEST)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAumM-0003xG-5s
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAuHH-00036L-FF; Mon, 11 Jul 2022 10:20:50 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:52236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAuH7-00087r-AQ; Mon, 11 Jul 2022 10:20:42 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 487A52E127C;
 Mon, 11 Jul 2022 17:19:54 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 0ugp8aYUkz-JpOeUWs7; Mon, 11 Jul 2022 17:19:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657549193; bh=d7BbwfXOMELSro9Sw+3OWlZXEdTcyWHcbIaDPnue//s=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=GIfMFU9PPX8oj74iRpUgkWzcdYIz6UBnJRi6EXX9exPZsv9b7TkJ/HykYHi34w7vy
 lW+uZ1DXc7RNmvoG2KgFTYgh0Pb6IsqbRvOlFri4HHsdiIJwKQhkf2taC8v8P//lO6
 1euaExZx+19dV4SSKnoW5eyINWz+5eb6DrFq+c18=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <07e652a7-a56a-4097-469a-94899140cf8a@yandex-team.ru>
Date: Mon, 11 Jul 2022 17:19:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 14/21] jobs: protect job.aio_context with BQL and
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
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-15-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-15-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
> In order to make it thread safe, implement a "fake rwlock",
> where we allow reads under BQL *or* job_mutex held, but
> writes only under BQL *and* job_mutex.
> 
> The only write we have is in child_job_set_aio_ctx

also in job_create of course, but it seems safe anyway

> , which always
> happens under drain (so the job is paused).
> For this reason, introduce job_set_aio_context and make sure that
> the context is set under BQL, job_mutex and drain.
> Also make sure all other places where the aiocontext is read
> are protected.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/replication.c |  6 ++++--
>   blockjob.c          |  3 ++-
>   include/qemu/job.h  | 19 ++++++++++++++++++-
>   job.c               | 12 ++++++++++++
>   4 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 55c8f894aa..2189863df1 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -148,8 +148,10 @@ static void replication_close(BlockDriverState *bs)
>       }
>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>           commit_job = &s->commit_job->job;
> -        assert(commit_job->aio_context == qemu_get_current_aio_context());
> -        job_cancel_sync(commit_job, false);
> +        WITH_JOB_LOCK_GUARD() {
> +            assert(commit_job->aio_context == qemu_get_current_aio_context());
> +            job_cancel_sync_locked(commit_job, false);
> +        }
>       }
>   
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
> diff --git a/blockjob.c b/blockjob.c
> index bce05a9096..0d120ed126 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -166,12 +166,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
>           bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>       }
>   
> -    job->job.aio_context = ctx;
> +    job_set_aio_context(&job->job, ctx);
>   }
>   
>   static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>   {
>       BlockJob *job = c->opaque;
> +    assert(qemu_in_main_thread());
>   
>       return job->job.aio_context;
>   }
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 5709e8d4a8..c144aabefc 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -77,7 +77,12 @@ typedef struct Job {
>   
>       /** Protected by AioContext lock */
>   
> -    /** AioContext to run the job coroutine in */
> +    /**
> +     * AioContext to run the job coroutine in.
> +     * This field can be read when holding either the BQL (so we are in
> +     * the main loop) or the job_mutex.
> +     * It can be only written when we hold *both* BQL and job_mutex.
> +     */
>       AioContext *aio_context;
>   
>       /** Reference count of the block job */
> @@ -741,4 +746,16 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
>   int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>                              Error **errp);
>   
> +/**
> + * Sets the @job->aio_context.
> + * Called with job_mutex *not* held.
> + *
> + * This function must run in the main thread to protect against
> + * concurrent read in job_finish_sync_locked(),
> + * takes the job_mutex lock to protect against the read in
> + * job_do_yield_locked(), and must be called when the coroutine
> + * is quiescent.
> + */
> +void job_set_aio_context(Job *job, AioContext *ctx);
> +
>   #endif
> diff --git a/job.c b/job.c
> index 405f39566b..66cae82593 100644
> --- a/job.c
> +++ b/job.c
> @@ -394,6 +394,17 @@ Job *job_get(const char *id)
>       return job_get_locked(id);
>   }
>   
> +void job_set_aio_context(Job *job, AioContext *ctx)
> +{
> +    /* protect against read in job_finish_sync_locked and job_start */
> +    assert(qemu_in_main_thread());
> +    /* protect against read in job_do_yield_locked */
> +    JOB_LOCK_GUARD();
> +    /* ensure the coroutine is quiescent while the AioContext is changed */
> +    assert(job->pause_count > 0);
> +    job->aio_context = ctx;
> +}
> +
>   /* Called with job_mutex *not* held. */
>   static void job_sleep_timer_cb(void *opaque)
>   {
> @@ -1380,6 +1391,7 @@ int job_finish_sync_locked(Job *job,
>   {
>       Error *local_err = NULL;
>       int ret;
> +    assert(qemu_in_main_thread());
>   
>       job_ref_locked(job);
>   


Missed update of block_job_add_bdrv(), block_job_get_aio_context(). Should they have an assertion too?

Also some occurences in test, but that doesn't seem significant.


-- 
Best regards,
Vladimir

