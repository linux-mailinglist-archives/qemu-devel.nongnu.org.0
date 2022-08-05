Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742B58A89E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:17:43 +0200 (CEST)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtSf-00019c-NU
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJtNW-00075u-OP
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJtNT-0005Ix-LV
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659690739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GGqtG2J1JZraC0IgN8RgUPhg10NCUKiUeIC9FYGhBfk=;
 b=J0xRzdV8Z5tns5dK4yaREH7YB6QaAguM5tUumJtYbF4P7GxzFWR+w1Ekh0igRZI4+fZUCF
 40svAjR66ZlbgNatFFTeo9J3BEK3fcZTw06lBoxyYBjgF7wc4O6ait/I9X4gu9k9wq4mWR
 Ft8yzGOm7rc2GsndpZv0JMs6rf2nFTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-tr-VrffZPieNy4DtnCJghg-1; Fri, 05 Aug 2022 05:12:15 -0400
X-MC-Unique: tr-VrffZPieNy4DtnCJghg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 969AC101A588;
 Fri,  5 Aug 2022 09:12:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFEE2166B26;
 Fri,  5 Aug 2022 09:12:11 +0000 (UTC)
Date: Fri, 5 Aug 2022 11:12:10 +0200
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
Subject: Re: [PATCH v10 14/21] jobs: protect job.aio_context with BQL and
 job_mutex
Message-ID: <Yuze6ldui3LtEcZm@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-15-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-15-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
> In order to make it thread safe, implement a "fake rwlock",
> where we allow reads under BQL *or* job_mutex held, but
> writes only under BQL *and* job_mutex.

Oh, so the "or BQL" part is only for job.aio_context? Okay.

> The only write we have is in child_job_set_aio_ctx, which always
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
>  block/replication.c |  6 ++++--
>  blockjob.c          |  3 ++-
>  include/qemu/job.h  | 19 ++++++++++++++++++-
>  job.c               | 12 ++++++++++++
>  4 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 55c8f894aa..2189863df1 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -148,8 +148,10 @@ static void replication_close(BlockDriverState *bs)
>      }
>      if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>          commit_job = &s->commit_job->job;
> -        assert(commit_job->aio_context == qemu_get_current_aio_context());
> -        job_cancel_sync(commit_job, false);
> +        WITH_JOB_LOCK_GUARD() {
> +            assert(commit_job->aio_context == qemu_get_current_aio_context());
> +            job_cancel_sync_locked(commit_job, false);
> +        }
>      }

.bdrv_close runs under the BQL, so why is this needed? Maybe a
GLOBAL_STATE_CODE() annotation would be helpful, though.

>      if (s->mode == REPLICATION_MODE_SECONDARY) {
> diff --git a/blockjob.c b/blockjob.c
> index 96fb9d9f73..9ff2727025 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -162,12 +162,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
>          bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>      }
>  
> -    job->job.aio_context = ctx;
> +    job_set_aio_context(&job->job, ctx);
>  }
>  
>  static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>  {
>      BlockJob *job = c->opaque;
> +    assert(qemu_in_main_thread());

Any reason not to use GLOBAL_STATE_CODE()?

>      return job->job.aio_context;
>  }
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 5709e8d4a8..c144aabefc 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -77,7 +77,12 @@ typedef struct Job {
>  
>      /** Protected by AioContext lock */

I think this section comment should move down below aio_context now.

> -    /** AioContext to run the job coroutine in */
> +    /**
> +     * AioContext to run the job coroutine in.
> +     * This field can be read when holding either the BQL (so we are in
> +     * the main loop) or the job_mutex.
> +     * It can be only written when we hold *both* BQL and job_mutex.
> +     */
>      AioContext *aio_context;
>  
>      /** Reference count of the block job */
> @@ -741,4 +746,16 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
>  int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>                             Error **errp);
>  
> +/**
> + * Sets the @job->aio_context.
> + * Called with job_mutex *not* held.
> + *
> + * This function must run in the main thread to protect against
> + * concurrent read in job_finish_sync_locked(),

Odd line break here in the middle of a sentence.

> + * takes the job_mutex lock to protect against the read in
> + * job_do_yield_locked(), and must be called when the coroutine
> + * is quiescent.
> + */
> +void job_set_aio_context(Job *job, AioContext *ctx);
> +
>  #endif
> diff --git a/job.c b/job.c
> index ecec66b44e..0a857b1468 100644
> --- a/job.c
> +++ b/job.c
> @@ -394,6 +394,17 @@ Job *job_get(const char *id)
>      return job_get_locked(id);
>  }
>  
> +void job_set_aio_context(Job *job, AioContext *ctx)
> +{
> +    /* protect against read in job_finish_sync_locked and job_start */
> +    assert(qemu_in_main_thread());

Same question about GLOBAL_STATE_CODE().

> +    /* protect against read in job_do_yield_locked */
> +    JOB_LOCK_GUARD();
> +    /* ensure the coroutine is quiescent while the AioContext is changed */
> +    assert(job->pause_count > 0);

job->pause_count only shows that pausing was requested. The coroutine is
only really quiescent if job->busy == false, too.

Or maybe job->paused is actually the one you want here.

> +    job->aio_context = ctx;
> +}
> +
>  /* Called with job_mutex *not* held. */
>  static void job_sleep_timer_cb(void *opaque)
>  {
> @@ -1376,6 +1387,7 @@ int job_finish_sync_locked(Job *job,
>  {
>      Error *local_err = NULL;
>      int ret;
> +    assert(qemu_in_main_thread());
>  
>      job_ref_locked(job);

Another GLOBAL_STATE_CODE()?

Kevin


