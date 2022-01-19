Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AB4938F1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:55:11 +0100 (CET)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8cQ-00086z-M2
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8Y9-0005lq-M0; Wed, 19 Jan 2022 05:50:48 -0500
Received: from [2a00:1450:4864:20::32b] (port=38764
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8Y6-0000c8-Iq; Wed, 19 Jan 2022 05:50:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6831623wmb.3; 
 Wed, 19 Jan 2022 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8pMNigShgKDNNfD/kwicRuT8TiImxvEAsxD+nV5jpYM=;
 b=ojsEqXAJxhaxbZxenEKScdxgK7LfHg46vH73foJyPIazgJmXmhz/JJcxnHV1rfamsm
 6cnYnmSKtav0ZpQAFIhpucFzQzRBDEg124Qq1UQG+ncJtDmdfGM4sWI7/BkfpkYgtU+c
 DVey8prtcz5dm3VzEo0cUXD4SC35bxSQ6kfkS2+xVkJVlqJQN4E9PfZ6GGjDkpVyfKCs
 6Vhg21WafaQ4FLmIynOqbsQKjB7J/O2IrS3QjvbrDA0Oc/omkOl0T+cLiS4MB0+aGdyf
 teVvh4mRl51YuU2rgICoL4uwGs5EWhks+aWOBE++NAJSRV8RUxM1a1u9z9v51tluNtnm
 YmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8pMNigShgKDNNfD/kwicRuT8TiImxvEAsxD+nV5jpYM=;
 b=DdWv44X1iJPGNufU0h6MvLUXxlU4tbCnAMd++6RHpZ9+ddAvhZA3nZTdaoEvL7aCGy
 HJ2KhalGY+XWz3Uw0U0WSoD2PHnTgEyvJqFvo732btniHPbYXq4IJCZb1oc7cCqUYp7h
 iFbgyvkv++mXwhQ3JB9C0V88FEus/eq2gcqx14/ARLK23j8gbjUnWicJ6FE4aNFvr+u1
 c/TwP/7dT4ZtGfXUcr45NEmwtqdxHW1JWzEUPTqyHpOKWx9wahAulvy82TJmglocn2Jv
 YI4+ipL3lyhAqbGCbhNqeOrsAOFHpAskUPpacNnQXCwyzjH5SIQenMUYSIwTf3CzLqGy
 joWw==
X-Gm-Message-State: AOAM532vYQcYULdv8yjGv3uZJoTZW6R6AFxB1ze4HvSzBr6sRPIYBY+l
 4uMv8F6AS/d8NXKDkQKduck=
X-Google-Smtp-Source: ABdhPJx3G57VVBw2M4MMJ3aofnTBP6ky5SDjmOuVV8P4HQelWXSINHfsWIE6ZarAPQUMrTNp/gPP8w==
X-Received: by 2002:adf:e643:: with SMTP id b3mr28431109wrn.288.1642589438579; 
 Wed, 19 Jan 2022 02:50:38 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id v13sm4621802wmh.45.2022.01.19.02.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:50:38 -0800 (PST)
Message-ID: <9cadc3db-3264-9752-afad-303a00de9d63@redhat.com>
Date: Wed, 19 Jan 2022 11:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 10/16] jobs: protect jobs with job_lock/unlock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-11-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-11-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 15:02, Emanuele Giuseppe Esposito wrote:
> Introduce the job locking mechanism through the whole job API,
> following the comments and requirements of job-monitor (assume
> lock is held) and job-driver (lock is not held).
> 
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c             |  18 +++---
>   block/replication.c |   8 ++-
>   blockdev.c          |  17 +++++-
>   blockjob.c          |  64 ++++++++++++++-------
>   job-qmp.c           |   2 +
>   job.c               | 132 +++++++++++++++++++++++++++++++-------------
>   monitor/qmp-cmds.c  |   6 +-
>   qemu-img.c          |  41 ++++++++------
>   8 files changed, 199 insertions(+), 89 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 8fcd525fa0..fac0759422 100644
> --- a/block.c
> +++ b/block.c
> @@ -4976,7 +4976,9 @@ static void bdrv_close(BlockDriverState *bs)
>   
>   void bdrv_close_all(void)
>   {
> -    assert(job_next_locked(NULL) == NULL);
> +    WITH_JOB_LOCK_GUARD() {
> +        assert(job_next_locked(NULL) == NULL);
> +    }
>       assert(qemu_in_main_thread());
>   
>       /* Drop references from requests still in flight, such as canceled block
> @@ -6154,13 +6156,15 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
>           }
>       }
>   
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> -        GSList *el;
> +    WITH_JOB_LOCK_GUARD() {
> +        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
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
>           }
>       }
>   
> diff --git a/block/replication.c b/block/replication.c
> index 5215c328c1..50ea778937 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>           commit_job = &s->commit_job->job;
>           assert(commit_job->aio_context == qemu_get_current_aio_context());
> -        job_cancel_sync_locked(commit_job, false);
> +        WITH_JOB_LOCK_GUARD() {
> +            job_cancel_sync_locked(commit_job, false);
> +        }
>       }
>   
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
> @@ -726,7 +728,9 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>            * disk, secondary disk in backup_job_completed().
>            */
>           if (s->backup_job) {
> -            job_cancel_sync_locked(&s->backup_job->job, true);
> +            WITH_JOB_LOCK_GUARD() {
> +                job_cancel_sync_locked(&s->backup_job->job, true);
> +            }
>           }
>   
>           if (!failover) {
> diff --git a/blockdev.c b/blockdev.c
> index ee35aff13a..099d57e0d2 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -155,6 +155,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>           return;
>       }
>   
> +    JOB_LOCK_GUARD();
> +
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           if (block_job_has_bdrv(job, blk_bs(blk))) {
>               AioContext *aio_context = job->job.aio_context;
> @@ -1832,7 +1834,9 @@ static void drive_backup_abort(BlkActionState *common)
>           aio_context = bdrv_get_aio_context(state->bs);
>           aio_context_acquire(aio_context);
>   
> -        job_cancel_sync_locked(&state->job->job, true);
> +        WITH_JOB_LOCK_GUARD() {
> +            job_cancel_sync_locked(&state->job->job, true);
> +        }
>   
>           aio_context_release(aio_context);
>       }
> @@ -1933,7 +1937,9 @@ static void blockdev_backup_abort(BlkActionState *common)
>           aio_context = bdrv_get_aio_context(state->bs);
>           aio_context_acquire(aio_context);
>   
> -        job_cancel_sync_locked(&state->job->job, true);
> +        WITH_JOB_LOCK_GUARD() {
> +            job_cancel_sync_locked(&state->job->job, true);
> +        }
>   
>           aio_context_release(aio_context);
>       }
> @@ -2382,7 +2388,10 @@ exit:
>       if (!has_props) {
>           qapi_free_TransactionProperties(props);
>       }
> -    job_txn_unref_locked(block_job_txn);
> +
> +    WITH_JOB_LOCK_GUARD() {
> +        job_txn_unref_locked(block_job_txn);
> +    }
>   }
>   
>   BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
> @@ -3705,6 +3714,8 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>       BlockJobInfoList *head = NULL, **tail = &head;
>       BlockJob *job;
>   
> +    JOB_LOCK_GUARD();
> +
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           BlockJobInfo *value;
>   
> diff --git a/blockjob.c b/blockjob.c
> index ce356be51e..e00c8d31d5 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -88,7 +88,9 @@ static char *child_job_get_parent_desc(BdrvChild *c)
>   static void child_job_drained_begin(BdrvChild *c)
>   {
>       BlockJob *job = c->opaque;
> -    job_pause_locked(&job->job);
> +    WITH_JOB_LOCK_GUARD() {
> +        job_pause_locked(&job->job);
> +    }
>   }
>   
>   static bool child_job_drained_poll(BdrvChild *c)
> @@ -100,8 +102,10 @@ static bool child_job_drained_poll(BdrvChild *c)
>       /* An inactive or completed job doesn't have any pending requests. Jobs
>        * with !job->busy are either already paused or have a pause point after
>        * being reentered, so no job driver code will run before they pause. */
> -    if (!job->busy || job_is_completed_locked(job)) {
> -        return false;
> +    WITH_JOB_LOCK_GUARD() {
> +        if (!job->busy || job_is_completed_locked(job)) {
> +            return false;
> +        }
>       }
>   
>       /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
> @@ -116,7 +120,9 @@ static bool child_job_drained_poll(BdrvChild *c)
>   static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
>   {
>       BlockJob *job = c->opaque;
> -    job_resume_locked(&job->job);
> +    WITH_JOB_LOCK_GUARD() {
> +        job_resume_locked(&job->job);
> +    }
>   }
>   
>   static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
> @@ -238,7 +244,13 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>   
>   static void block_job_on_idle(Notifier *n, void *opaque)
>   {
> +    /*
> +     * we can't kick with job_mutex held, but we also want
> +     * to protect the notifier list.
> +     */
> +    job_unlock();
>       aio_wait_kick();
> +    job_lock();
>   }
>   
>   bool block_job_is_internal(BlockJob *job)
> @@ -278,7 +290,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>       job->speed = speed;
>   
>       if (drv->set_speed) {
> +        job_unlock();
>           drv->set_speed(job, speed);
> +        job_lock();
>       }
>   
>       if (speed && speed <= old_speed) {
> @@ -458,13 +472,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       job->ready_notifier.notify = block_job_event_ready;
>       job->idle_notifier.notify = block_job_on_idle;
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
>       error_setg(&job->blocker, "block device is in use by block job: %s",
>                  job_type_str(&job->job));
> @@ -477,11 +493,14 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       blk_set_disable_request_queuing(blk, true);
>       blk_set_allow_aio_context_change(blk, true);
>   
> -    if (!block_job_set_speed(job, speed, errp)) {
> -        job_early_fail(&job->job);
> -        return NULL;
> +    WITH_JOB_LOCK_GUARD() {
> +        if (!block_job_set_speed(job, speed, errp)) {
> +            job_early_fail_locked(&job->job);
> +            return NULL;
> +        }
>       }
>   
> +
>       return job;
>   }
>   
> @@ -499,7 +518,9 @@ void block_job_user_resume(Job *job)
>   {
>       BlockJob *bjob = container_of(job, BlockJob, job);
>       assert(qemu_in_main_thread());
> -    block_job_iostatus_reset(bjob);
> +    WITH_JOB_LOCK_GUARD() {
> +        block_job_iostatus_reset(bjob);
> +    }
>   }
>   
>   BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
> @@ -532,10 +553,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>                                           action);
>       }
>       if (action == BLOCK_ERROR_ACTION_STOP) {
> -        if (!job->job.user_paused) {
> -            job_pause_locked(&job->job);
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
>           }
>           block_job_iostatus_set_err(job, error);
>       }
> diff --git a/job-qmp.c b/job-qmp.c
> index f6f9840436..9fa14bf761 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -171,6 +171,8 @@ JobInfoList *qmp_query_jobs(Error **errp)
>       JobInfoList *head = NULL, **tail = &head;
>       Job *job;
>   
> +    JOB_LOCK_GUARD();
> +
>       for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
>           JobInfo *value;
>   
> diff --git a/job.c b/job.c
> index 2ee7233763..56722a5043 100644
> --- a/job.c
> +++ b/job.c
> @@ -394,6 +394,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>   {
>       Job *job;
>   
> +    JOB_LOCK_GUARD();
> +
>       if (job_id) {
>           if (flags & JOB_INTERNAL) {
>               error_setg(errp, "Cannot specify job ID for internal job");
> @@ -467,7 +469,9 @@ void job_unref_locked(Job *job)
>           assert(!job->txn);
>   
>           if (job->driver->free) {
> +            job_unlock();
>               job->driver->free(job);
> +            job_lock();
>           }
>   
>           QLIST_REMOVE(job, job_list);
> @@ -551,11 +555,14 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>       timer_del(&job->sleep_timer);
>       job->busy = true;
>       real_job_unlock();
> +    job_unlock();
>       aio_co_enter(job->aio_context, job->co);
> +    job_lock();
>   }
>   
>   void job_enter(Job *job)
>   {
> +    JOB_LOCK_GUARD();
>       job_enter_cond_locked(job, NULL);
>   }
>   
> @@ -574,7 +581,9 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
>       job->busy = false;
>       job_event_idle(job);
>       real_job_unlock();
> +    job_unlock();
>       qemu_coroutine_yield();
> +    job_lock();
>   
>       /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
>       assert(job->busy);
> @@ -584,18 +593,23 @@ void coroutine_fn job_pause_point(Job *job)
>   {
>       assert(job && job_started(job));
>   
> +    job_lock();
>       if (!job_should_pause(job)) {
> +        job_unlock();
>           return;
>       }
> -    if (job_is_cancelled(job)) {
> +    if (job_is_cancelled_locked(job)) {
> +        job_unlock();
>           return;
>       }
>   
>       if (job->driver->pause) {
> +        job_unlock();
>           job->driver->pause(job);
> +        job_lock();
>       }
>   
> -    if (job_should_pause(job) && !job_is_cancelled(job)) {
> +    if (job_should_pause(job) && !job_is_cancelled_locked(job)) {
>           JobStatus status = job->status;
>           job_state_transition(job, status == JOB_STATUS_READY
>                                     ? JOB_STATUS_STANDBY
> @@ -605,6 +619,7 @@ void coroutine_fn job_pause_point(Job *job)
>           job->paused = false;
>           job_state_transition(job, status);
>       }
> +    job_unlock();
>   
>       if (job->driver->resume) {
>           job->driver->resume(job);
> @@ -613,15 +628,17 @@ void coroutine_fn job_pause_point(Job *job)
>   
>   void job_yield(Job *job)
>   {
> -    assert(job->busy);
> +    WITH_JOB_LOCK_GUARD() {
> +        assert(job->busy);
>   
> -    /* Check cancellation *before* setting busy = false, too!  */
> -    if (job_is_cancelled(job)) {
> -        return;
> -    }
> +        /* Check cancellation *before* setting busy = false, too!  */
> +        if (job_is_cancelled_locked(job)) {
> +            return;
> +        }
>   
> -    if (!job_should_pause(job)) {
> -        job_do_yield(job, -1);
> +        if (!job_should_pause(job)) {
> +            job_do_yield(job, -1);
> +        }
>       }
>   
>       job_pause_point(job);
> @@ -629,21 +646,23 @@ void job_yield(Job *job)
>   
>   void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
>   {
> -    assert(job->busy);
> +    WITH_JOB_LOCK_GUARD() {
> +        assert(job->busy);
>   
> -    /* Check cancellation *before* setting busy = false, too!  */
> -    if (job_is_cancelled(job)) {
> -        return;
> -    }
> +        /* Check cancellation *before* setting busy = false, too!  */
> +        if (job_is_cancelled_locked(job)) {
> +            return;
> +        }
>   
> -    if (!job_should_pause(job)) {
> -        job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
> +        if (!job_should_pause(job)) {
> +            job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
> +        }
>       }
>   
>       job_pause_point(job);
>   }
>   
> -/* Assumes the block_job_mutex is held */
> +/* Assumes the job_mutex is held */
>   static bool job_timer_not_pending(Job *job)
>   {
>       return !timer_pending(&job->sleep_timer);
> @@ -653,7 +672,7 @@ void job_pause_locked(Job *job)
>   {
>       job->pause_count++;
>       if (!job->paused) {
> -        job_enter(job);
> +        job_enter_cond_locked(job, NULL);
>       }
>   }
>   
> @@ -699,7 +718,9 @@ void job_user_resume_locked(Job *job, Error **errp)
>           return;
>       }
>       if (job->driver->user_resume) {
> +        job_unlock();
>           job->driver->user_resume(job);
> +        job_lock();
>       }
>       job->user_paused = false;
>       job_resume_locked(job);
> @@ -753,7 +774,7 @@ static void job_conclude(Job *job)
>   
>   static void job_update_rc(Job *job)
>   {
> -    if (!job->ret && job_is_cancelled(job)) {
> +    if (!job->ret && job_is_cancelled_locked(job)) {
>           job->ret = -ECANCELED;
>       }
>       if (job->ret) {
> @@ -769,7 +790,9 @@ static void job_commit(Job *job)
>       assert(!job->ret);
>       assert(qemu_in_main_thread());
>       if (job->driver->commit) {
> +        job_unlock();
>           job->driver->commit(job);
> +        job_lock();
>       }
>   }
>   
> @@ -778,7 +801,9 @@ static void job_abort(Job *job)
>       assert(job->ret);
>       assert(qemu_in_main_thread());
>       if (job->driver->abort) {
> +        job_unlock();
>           job->driver->abort(job);
> +        job_lock();
>       }
>   }
>   
> @@ -786,12 +811,15 @@ static void job_clean(Job *job)
>   {
>       assert(qemu_in_main_thread());
>       if (job->driver->clean) {
> +        job_unlock();
>           job->driver->clean(job);
> +        job_lock();
>       }
>   }
>   
>   static int job_finalize_single(Job *job)
>   {
> +    int job_ret;
>       AioContext *ctx = job->aio_context;
>   
>       assert(job_is_completed_locked(job));
> @@ -811,12 +839,15 @@ static int job_finalize_single(Job *job)
>       aio_context_release(ctx);
>   
>       if (job->cb) {
> -        job->cb(job->opaque, job->ret);
> +        job_ret = job->ret;
> +        job_unlock();
> +        job->cb(job->opaque, job_ret);
> +        job_lock();
>       }
>   
>       /* Emit events only if we actually started */
>       if (job_started(job)) {
> -        if (job_is_cancelled(job)) {
> +        if (job_is_cancelled_locked(job)) {
>               job_event_cancelled(job);
>           } else {
>               job_event_completed(job);
> @@ -832,7 +863,9 @@ static void job_cancel_async(Job *job, bool force)
>   {
>       assert(qemu_in_main_thread());
>       if (job->driver->cancel) {
> +        job_unlock();
>           force = job->driver->cancel(job, force);
> +        job_lock();
>       } else {
>           /* No .cancel() means the job will behave as if force-cancelled */
>           force = true;
> @@ -841,7 +874,9 @@ static void job_cancel_async(Job *job, bool force)
>       if (job->user_paused) {
>           /* Do not call job_enter here, the caller will handle it.  */
>           if (job->driver->user_resume) {
> +            job_unlock();
>               job->driver->user_resume(job);
> +            job_lock();
>           }
>           job->user_paused = false;
>           assert(job->pause_count > 0);
> @@ -911,7 +946,7 @@ static void job_completed_txn_abort(Job *job)
>           ctx = other_job->aio_context;
>           aio_context_acquire(ctx);
>           if (!job_is_completed_locked(other_job)) {
> -            assert(job_cancel_requested(other_job));
> +            assert(job_cancel_requested_locked(other_job));
>               job_finish_sync_locked(other_job, NULL, NULL);
>           }
>           job_finalize_single(other_job);
> @@ -930,13 +965,17 @@ static void job_completed_txn_abort(Job *job)
>   
>   static int job_prepare(Job *job)
>   {
> +    int ret;
>       AioContext *ctx = job->aio_context;
>       assert(qemu_in_main_thread());
>   
>       if (job->ret == 0 && job->driver->prepare) {
> +        job_unlock();
>           aio_context_acquire(ctx);
> -        job->ret = job->driver->prepare(job);
> +        ret = job->driver->prepare(job);
>           aio_context_release(ctx);
> +        job_lock();
> +        job->ret = ret;
>           job_update_rc(job);
>       }
>   
> @@ -982,6 +1021,7 @@ static int job_transition_to_pending(Job *job)
>   
>   void job_transition_to_ready(Job *job)
>   {
> +    JOB_LOCK_GUARD();
>       job_state_transition(job, JOB_STATUS_READY);
>       job_event_ready(job);
>   }
> @@ -1031,6 +1071,7 @@ static void job_exit(void *opaque)
>       Job *job = (Job *)opaque;
>       AioContext *ctx;
>   
> +    JOB_LOCK_GUARD();
>       job_ref_locked(job);
>       aio_context_acquire(job->aio_context);
>   
> @@ -1061,13 +1102,17 @@ static void job_exit(void *opaque)
>   static void coroutine_fn job_co_entry(void *opaque)
>   {
>       Job *job = opaque;
> +    int ret;
>   
>       assert(job->aio_context == qemu_get_current_aio_context());
>       assert(job && job->driver && job->driver->run);
>       job_pause_point(job);
> -    job->ret = job->driver->run(job, &job->err);
> -    job->deferred_to_main_loop = true;
> -    job->busy = true;
> +    ret = job->driver->run(job, &job->err);
> +    WITH_JOB_LOCK_GUARD() {
> +        job->ret = ret;
> +        job->deferred_to_main_loop = true;
> +        job->busy = true;
> +    }
>       aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
>   }
>   
> @@ -1083,16 +1128,20 @@ static int job_pre_run(Job *job)
>   
>   void job_start(Job *job)
>   {
> -    assert(job && !job_started(job) && job->paused &&
> -           job->driver && job->driver->run);
> -    job->co = qemu_coroutine_create(job_co_entry, job);
> +    WITH_JOB_LOCK_GUARD() {
> +        assert(job && !job_started(job) && job->paused &&
> +            job->driver && job->driver->run);
> +        job->co = qemu_coroutine_create(job_co_entry, job);
> +    }
>       if (job_pre_run(job)) {
>           return;
>       }
> -    job->pause_count--;
> -    job->busy = true;
> -    job->paused = false;
> -    job_state_transition(job, JOB_STATUS_RUNNING);
> +    WITH_JOB_LOCK_GUARD() {
> +        job->pause_count--;
> +        job->busy = true;
> +        job->paused = false;
> +        job_state_transition(job, JOB_STATUS_RUNNING);
> +    }
>       aio_co_enter(job->aio_context, job->co);
>   }
>   
> @@ -1116,11 +1165,11 @@ void job_cancel_locked(Job *job, bool force)
>            * choose to call job_is_cancelled() to show that we invoke
>            * job_completed_txn_abort() only for force-cancelled jobs.)
>            */
> -        if (job_is_cancelled(job)) {
> +        if (job_is_cancelled_locked(job)) {
>               job_completed_txn_abort(job);
>           }
>       } else {
> -        job_enter(job);
> +        job_enter_cond_locked(job, NULL);
>       }
>   }
>   
> @@ -1164,6 +1213,7 @@ void job_cancel_sync_all(void)
>       Job *job;
>       AioContext *aio_context;
>   
> +    JOB_LOCK_GUARD();
>       while ((job = job_next_locked(NULL))) {
>           aio_context = job->aio_context;
>           aio_context_acquire(aio_context);
> @@ -1185,13 +1235,15 @@ void job_complete_locked(Job *job, Error **errp)
>       if (job_apply_verb_locked(job, JOB_VERB_COMPLETE, errp)) {
>           return;
>       }
> -    if (job_cancel_requested(job) || !job->driver->complete) {
> +    if (job_cancel_requested_locked(job) || !job->driver->complete) {
>           error_setg(errp, "The active block job '%s' cannot be completed",
>                      job->id);
>           return;
>       }
>   
> +    job_unlock();
>       job->driver->complete(job, errp);
> +    job_lock();
>   }
>   
>   int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
> @@ -1211,10 +1263,12 @@ int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>           return -EBUSY;
>       }
>   
> -    AIO_WAIT_WHILE(job->aio_context,
> -                   (job_enter(job), !job_is_completed_locked(job)));
> +    job_unlock();
> +    AIO_WAIT_WHILE(job->aio_context, (job_enter(job), !job_is_completed(job)));
> +    job_lock();
>   
> -    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
> +    ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
> +           -ECANCELED : job->ret;
>       job_unref_locked(job);
>       return ret;
>   }
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 343353e27a..2f11d086a6 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -133,8 +133,10 @@ void qmp_cont(Error **errp)
>           blk_iostatus_reset(blk);
>       }
>   
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> -        block_job_iostatus_reset(job);
> +    WITH_JOB_LOCK_GUARD() {
> +        for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> +            block_job_iostatus_reset(job);
> +        }
>       }
>   
>       /* Continuing after completed migration. Images have been inactivated to
> diff --git a/qemu-img.c b/qemu-img.c
> index 09f3b11eab..95e2e33e61 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -906,25 +906,30 @@ static void run_block_job(BlockJob *job, Error **errp)
>       int ret = 0;
>   
>       aio_context_acquire(aio_context);
> -    job_ref_locked(&job->job);
> -    do {
> -        float progress = 0.0f;
> -        aio_poll(aio_context, true);
> +    WITH_JOB_LOCK_GUARD() {
> +        job_ref_locked(&job->job);
> +        do {
> +            float progress = 0.0f;
> +            job_unlock();
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
> +                !job_is_completed_locked(&job->job));
>   
> -        progress_get_snapshot(&job->job.progress, &progress_current,
> -                              &progress_total);
> -        if (progress_total) {
> -            progress = (float)progress_current / progress_total * 100.f;
> +        if (!job_is_completed_locked(&job->job)) {
> +            ret = job_complete_sync_locked(&job->job, errp);
> +        } else {
> +            ret = job->job.ret;
>           }
> -        qemu_progress_print(progress, 0);
> -    } while (!job_is_ready(&job->job) && !job_is_completed_locked(&job->job));
> -
> -    if (!job_is_completed_locked(&job->job)) {
> -        ret = job_complete_sync_locked(&job->job, errp);
> -    } else {
> -        ret = job->job.ret;
> +        job_unref_locked(&job->job);
>       }
> -    job_unref_locked(&job->job);
>       aio_context_release(aio_context);
>   
>       /* publish completion progress only when success */
> @@ -1077,7 +1082,9 @@ static int img_commit(int argc, char **argv)
>           bdrv_ref(bs);
>       }
>   
> -    job = block_job_get("commit");
> +    WITH_JOB_LOCK_GUARD() {
> +        job = block_job_get("commit");
> +    }
>       assert(job);
>       run_block_job(job, &local_err);
>       if (local_err) {

If meaningful, I'd either do this much earlier, or do the _locked rename 
much later.  Having such a large part of the series where _locked 
functions are *not* locked is confusing.

Paolo

