Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6D55B8A63
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:24:47 +0200 (CEST)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTJm-00012h-OI
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYSOl-0002Oz-QO; Wed, 14 Sep 2022 09:25:53 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:42022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYSOh-0000yc-Ek; Wed, 14 Sep 2022 09:25:50 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 018492E1E9E;
 Wed, 14 Sep 2022 16:25:37 +0300 (MSK)
Received: from [172.31.103.133] (172.31.103.133-vpn.dhcp.yndx.net
 [172.31.103.133])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 tB7bHz0D6P-PZPOebRd; Wed, 14 Sep 2022 16:25:36 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663161936; bh=Qc/3ix59WGsYlibwk6b4QojabNwOEClVf9xO2VDReyY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=xNlqSJlcy07Bx8J2Nan5cvm4W3d45AToXtKQFVI0j4Ryhn46uRhNZ/2kaA395bYa7
 D457NO67VV6s1PjjKWib+qSbAWDHTPEyVTkxVpVqtvdTSUA4codsShtiOqxE58CraZ
 pUqq9+8JxkvsWBPR4HNZ5GkYCl4hFQ+/cD8jAiXA=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <6c7d735c-b473-c540-5bf6-db29794450d0@yandex-team.ru>
Date: Wed, 14 Sep 2022 16:25:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 13/21] jobs: protect job.aio_context with BQL and
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
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220826132104.3678958-14-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 8/26/22 16:20, Emanuele Giuseppe Esposito wrote:
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
> ---
>   block/replication.c |  7 +++++--
>   blockjob.c          |  3 ++-
>   include/qemu/job.h  | 23 ++++++++++++++++++++---
>   job.c               | 12 ++++++++++++
>   4 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 55c8f894aa..6e02d98126 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -142,14 +142,17 @@ static void replication_close(BlockDriverState *bs)
>   {
>       BDRVReplicationState *s = bs->opaque;
>       Job *commit_job;
> +    GLOBAL_STATE_CODE();
>   
>       if (s->stage == BLOCK_REPLICATION_RUNNING) {
>           replication_stop(s->rs, false, NULL);
>       }
>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>           commit_job = &s->commit_job->job;
> -        assert(commit_job->aio_context == qemu_get_current_aio_context());
> -        job_cancel_sync(commit_job, false);
> +        WITH_JOB_LOCK_GUARD() {
> +            assert(commit_job->aio_context == qemu_get_current_aio_context());
> +            job_cancel_sync_locked(commit_job, false);
> +        }

As Kevin said, this hunk seems not needed.. Why to add locking for reading aio_context, when we have GLOBAL_STATE_CODE()?

>       }
>   
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
> diff --git a/blockjob.c b/blockjob.c
> index 96fb9d9f73..c8919cef9b 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -162,12 +162,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
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
> +    GLOBAL_STATE_CODE();
>   
>       return job->job.aio_context;
>   }
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 5709e8d4a8..cede227e67 100644
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
> + * be called when the coroutine is quiescent.

May be "job is quiscent" or "job is doing nothing", "no in-flight io operations in job".

For example, backup has several running coroutines in contest of block_copy process, and main coroutine of the job
is almost always "quescent"..

> + */
> +void job_set_aio_context(Job *job, AioContext *ctx);
> +
>   #endif
> diff --git a/job.c b/job.c
> index 85ae843f03..9f2fb2e73b 100644
> --- a/job.c
> +++ b/job.c
> @@ -396,6 +396,17 @@ Job *job_get(const char *id)
>       return job_get_locked(id);
>   }
>   
> +void job_set_aio_context(Job *job, AioContext *ctx)
> +{
> +    /* protect against read in job_finish_sync_locked and job_start */
> +    GLOBAL_STATE_CODE();
> +    /* protect against read in job_do_yield_locked */
> +    JOB_LOCK_GUARD();
> +    /* ensure the coroutine is quiescent while the AioContext is changed */

same not here.

> +    assert(job->paused || job_is_completed_locked(job));
> +    job->aio_context = ctx;
> +}
> +
>   /* Called with job_mutex *not* held. */
>   static void job_sleep_timer_cb(void *opaque)
>   {
> @@ -1379,6 +1390,7 @@ int job_finish_sync_locked(Job *job,
>   {
>       Error *local_err = NULL;
>       int ret;
> +    GLOBAL_STATE_CODE();
>   
>       job_ref_locked(job);
>   


-- 
Best regards,
Vladimir

