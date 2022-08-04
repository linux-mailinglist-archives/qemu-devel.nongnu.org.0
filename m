Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96302589FD0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:23:17 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeZ1-0001s0-9i
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJeMY-00080j-62
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJeMV-0006z4-U5
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659633016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E1lHE4VUaJ/V0lBWXfcmFtEAozbM3AEwFBzN0dXFJwc=;
 b=Ntv/RyeTefwq1ORYWtOXPV9aWaR+lP4tz2BNj4PM0gw6weAouMDG8xroboM/5nWfDdDe1K
 qd18fg4eiPvByi+NaSme1jVKpdCE9t1WzyR6/En6QCA/goOmhAkpjE+ucMOISenDL+MnkH
 CPTL6YcT5tdisz8xngH1ybXYPcyURxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-I_7usP8jOaOgmoSAMnvZqw-1; Thu, 04 Aug 2022 13:10:13 -0400
X-MC-Unique: I_7usP8jOaOgmoSAMnvZqw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E605A3802BA6;
 Thu,  4 Aug 2022 17:10:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1BF1492CA2;
 Thu,  4 Aug 2022 17:10:10 +0000 (UTC)
Date: Thu, 4 Aug 2022 19:10:08 +0200
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
Subject: Re: [PATCH v10 11/21] jobs: group together API calls under the same
 job lock
Message-ID: <Yuv9cKJotWg0NEno@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-12-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> Now that the API offers also _locked() functions, take advantage
> of it and give also the caller control to take the lock and call
> _locked functions.
> 
> This makes sense especially when we have for loops, because it
> makes no sense to have:
> 
> for(job = job_next(); ...)
> 
> where each job_next() takes the lock internally.
> Instead we want
> 
> JOB_LOCK_GUARD();
> for(job = job_next_locked(); ...)
> 
> In addition, protect also direct field accesses, by either creating a
> new critical section or widening the existing ones.

"In addition" sounds like it should be a separate patch. I was indeed
surprised when after a few for loops where you just pulled the existing
locking up a bit, I saw some hunks that add completely new locking.

> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c            | 17 ++++++++++-------
>  blockdev.c         | 12 +++++++++---
>  blockjob.c         | 35 ++++++++++++++++++++++-------------
>  job-qmp.c          |  4 +++-
>  job.c              |  7 +++++--
>  monitor/qmp-cmds.c |  7 +++++--
>  qemu-img.c         | 37 +++++++++++++++++++++----------------
>  7 files changed, 75 insertions(+), 44 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 2c00dddd80..7559965dbc 100644
> --- a/block.c
> +++ b/block.c
> @@ -4978,8 +4978,8 @@ static void bdrv_close(BlockDriverState *bs)
>  
>  void bdrv_close_all(void)
>  {
> -    assert(job_next(NULL) == NULL);
>      GLOBAL_STATE_CODE();
> +    assert(job_next(NULL) == NULL);
>  
>      /* Drop references from requests still in flight, such as canceled block
>       * jobs whose AIO context has not been polled yet */
> @@ -6165,13 +6165,16 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
>          }
>      }
>  
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> -        GSList *el;
> +    WITH_JOB_LOCK_GUARD() {
> +        for (job = block_job_next_locked(NULL); job;
> +             job = block_job_next_locked(job)) {
> +            GSList *el;
>  
> -        xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
> -                           job->job.id);
> -        for (el = job->nodes; el; el = el->next) {
> -            xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
> +            xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
> +                                job->job.id);
> +            for (el = job->nodes; el; el = el->next) {
> +                xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
> +            }
>          }
>      }
>  
> diff --git a/blockdev.c b/blockdev.c
> index 71f793c4ab..5b79093155 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>          return;
>      }
>  
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> +    JOB_LOCK_GUARD();
> +
> +    for (job = block_job_next_locked(NULL); job;
> +         job = block_job_next_locked(job)) {
>          if (block_job_has_bdrv(job, blk_bs(blk))) {

Should this be renamed to block_job_has_bdrv_locked() now?

It looks to me like it does need the locking. (Which actually makes
this patch a fix and not just an optimisation as the commit message
suggests.)

>              AioContext *aio_context = job->job.aio_context;
>              aio_context_acquire(aio_context);
>  
> -            job_cancel(&job->job, false);
> +            job_cancel_locked(&job->job, false);
>  
>              aio_context_release(aio_context);
>          }
> @@ -3745,7 +3748,10 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>      BlockJobInfoList *head = NULL, **tail = &head;
>      BlockJob *job;
>  
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> +    JOB_LOCK_GUARD();
> +
> +    for (job = block_job_next_locked(NULL); job;
> +         job = block_job_next_locked(job)) {
>          BlockJobInfo *value;
>          AioContext *aio_context;

More context:

        BlockJobInfo *value;
        AioContext *aio_context;

        if (block_job_is_internal(job)) {
            continue;
        }
        aio_context = block_job_get_aio_context(job);
        aio_context_acquire(aio_context);
        value = block_job_query(job, errp);
        aio_context_release(aio_context);

This should become block_job_query_locked(). (You do that in patch 18,
but it looks a bit out of place there - which is precisely because it
really belongs in this one.)

> diff --git a/blockjob.c b/blockjob.c
> index 0d59aba439..96fb9d9f73 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -111,8 +111,10 @@ static bool child_job_drained_poll(BdrvChild *c)
>      /* An inactive or completed job doesn't have any pending requests. Jobs
>       * with !job->busy are either already paused or have a pause point after
>       * being reentered, so no job driver code will run before they pause. */
> -    if (!job->busy || job_is_completed(job)) {
> -        return false;
> +    WITH_JOB_LOCK_GUARD() {
> +        if (!job->busy || job_is_completed_locked(job)) {
> +            return false;
> +        }
>      }
>  
>      /* Otherwise, assume that it isn't fully stopped yet, but allow the job to

Assuming that the job status can actually change, don't we need the
locking for the rest of the function, too? Otherwise we might call
drv->drained_poll() for a job that has already paused or completed.

Of course, this goes against the assumption that all callbacks are
called without holding the job lock. Maybe it's not a good assumption.

> @@ -475,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>      job->ready_notifier.notify = block_job_event_ready;
>      job->idle_notifier.notify = block_job_on_idle;
>  
> -    notifier_list_add(&job->job.on_finalize_cancelled,
> -                      &job->finalize_cancelled_notifier);
> -    notifier_list_add(&job->job.on_finalize_completed,
> -                      &job->finalize_completed_notifier);
> -    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
> -    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
> -    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> +    WITH_JOB_LOCK_GUARD() {
> +        notifier_list_add(&job->job.on_finalize_cancelled,
> +                          &job->finalize_cancelled_notifier);
> +        notifier_list_add(&job->job.on_finalize_completed,
> +                          &job->finalize_completed_notifier);
> +        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
> +        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
> +        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> +    }
>  
>      error_setg(&job->blocker, "block device is in use by block job: %s",
>                 job_type_str(&job->job));

Why is this the right scope for the lock? It looks very arbitrary to
lock only here, but not for the assignments above or the function calls
below.

Given that job_create() already puts the job in the job_list so it
becomes visible for other code, should we not keep the job lock from the
moment that we create the job until it is fully initialised?

> @@ -558,10 +562,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>                                          action);
>      }
>      if (action == BLOCK_ERROR_ACTION_STOP) {
> -        if (!job->job.user_paused) {
> -            job_pause(&job->job);
> -            /* make the pause user visible, which will be resumed from QMP. */
> -            job->job.user_paused = true;
> +        WITH_JOB_LOCK_GUARD() {
> +            if (!job->job.user_paused) {
> +                job_pause_locked(&job->job);
> +                /*
> +                 * make the pause user visible, which will be
> +                 * resumed from QMP.
> +                 */
> +                job->job.user_paused = true;
> +            }
>          }
>          block_job_iostatus_set_err(job, error);

Why is this call not in the critical section? It accesses job->iostatus.

>      }
> diff --git a/job-qmp.c b/job-qmp.c
> index ac11a6c23c..cfaf34ffb7 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -194,7 +194,9 @@ JobInfoList *qmp_query_jobs(Error **errp)
>      JobInfoList *head = NULL, **tail = &head;
>      Job *job;
>  
> -    for (job = job_next(NULL); job; job = job_next(job)) {
> +    JOB_LOCK_GUARD();
> +
> +    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
>          JobInfo *value;
>          AioContext *aio_context;

Should job_query_single() be renamed to job_query_single_locked()?

> diff --git a/job.c b/job.c
> index ebaa4e585b..b0729e2bb2 100644
> --- a/job.c
> +++ b/job.c
> @@ -668,7 +668,7 @@ void coroutine_fn job_pause_point(Job *job)
>      job_pause_point_locked(job);
>  }
>  
> -void job_yield_locked(Job *job)
> +static void job_yield_locked(Job *job)
>  {
>      assert(job->busy);

It was already unused outside of job.c before this patch. Should it have
been static from the start?

> @@ -1041,11 +1041,14 @@ static void job_completed_txn_abort_locked(Job *job)
>  /* Called with job_mutex held, but releases it temporarily */
>  static int job_prepare_locked(Job *job)
>  {
> +    int ret;
> +
>      GLOBAL_STATE_CODE();
>      if (job->ret == 0 && job->driver->prepare) {
>          job_unlock();
> -        job->ret = job->driver->prepare(job);
> +        ret = job->driver->prepare(job);
>          job_lock();
> +        job->ret = ret;
>          job_update_rc_locked(job);
>      }
>      return job->ret;
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 1ebb89f46c..1897ed7a13 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -133,8 +133,11 @@ void qmp_cont(Error **errp)
>          blk_iostatus_reset(blk);
>      }
>  
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> -        block_job_iostatus_reset(job);
> +    WITH_JOB_LOCK_GUARD() {
> +        for (job = block_job_next_locked(NULL); job;
> +             job = block_job_next_locked(job)) {
> +            block_job_iostatus_reset_locked(job);
> +        }
>      }
>  
>      /* Continuing after completed migration. Images have been inactivated to
> diff --git a/qemu-img.c b/qemu-img.c
> index 4cf4d2423d..98c7662b0f 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **errp)
>      int ret = 0;
>  
>      aio_context_acquire(aio_context);
> -    job_ref(&job->job);
> -    do {
> -        float progress = 0.0f;
> -        aio_poll(aio_context, true);
> +    WITH_JOB_LOCK_GUARD() {
> +        job_ref_locked(&job->job);
> +        do {
> +            float progress = 0.0f;
> +            job_unlock();

This might be more a question of style, but mixing WITH_JOB_LOCK_GUARD()
with manual job_unlock()/job_lock() feels dangerous. What if someone
added a break between the unlock/lock pair? The lock guard would try to
unlock a mutex that is already unlocked, which probably means an
assertion failure.

I feel we should just use manual job_lock()/job_unlock() for everything
in this function.

> +            aio_poll(aio_context, true);
> +
> +            progress_get_snapshot(&job->job.progress, &progress_current,
> +                                &progress_total);
> +            if (progress_total) {
> +                progress = (float)progress_current / progress_total * 100.f;
> +            }
> +            qemu_progress_print(progress, 0);
> +            job_lock();
> +        } while (!job_is_ready_locked(&job->job) &&
> +                 !job_is_completed_locked(&job->job));
>  
> -        progress_get_snapshot(&job->job.progress, &progress_current,
> -                              &progress_total);
> -        if (progress_total) {
> -            progress = (float)progress_current / progress_total * 100.f;
> +        if (!job_is_completed_locked(&job->job)) {
> +            ret = job_complete_sync_locked(&job->job, errp);
> +        } else {
> +            ret = job->job.ret;
>          }
> -        qemu_progress_print(progress, 0);
> -    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
> -
> -    if (!job_is_completed(&job->job)) {
> -        ret = job_complete_sync(&job->job, errp);
> -    } else {
> -        ret = job->job.ret;
> +        job_unref_locked(&job->job);
>      }
> -    job_unref(&job->job);
>      aio_context_release(aio_context);
>  
>      /* publish completion progress only when success */

Kevin


