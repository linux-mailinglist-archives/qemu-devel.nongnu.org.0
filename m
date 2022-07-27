Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CC582A0E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:56:17 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjOS-0001Eu-P8
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGjLl-0006iO-Ij; Wed, 27 Jul 2022 11:53:29 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:54904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGjLg-0001HD-KC; Wed, 27 Jul 2022 11:53:27 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 287962E0A91;
 Wed, 27 Jul 2022 18:53:13 +0300 (MSK)
Received: from [10.211.19.155] (10.211.19.155-vpn.dhcp.yndx.net
 [10.211.19.155])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Ag60TXN0up-rAPSsDwX; Wed, 27 Jul 2022 18:53:12 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658937192; bh=5M9M4q3ZyGbFY53z3X2h7Wns/YhCjOv2utDH/iqqUcE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kGXh6WT9di4iPe3cMxX7/BUT+hG0MSHZ33zVAvrrP5sut2FpZ7hI3f+njjoKzZkDC
 Y9EgbVvV5V8/pxwWRMk9xP1tk2Dlm3iak6QiOpQ2KvJBkRbZ9NPsF2wvU6xbpp0NEG
 z14zAXug6REfjhc/tG5CFlnNSYqIHfxpOeeVbk4U=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
Date: Wed, 27 Jul 2022 18:53:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220725073855.76049-19-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 7/25/22 10:38, Emanuele Giuseppe Esposito wrote:
> Change the job_{lock/unlock} and macros to use job_mutex.
> 
> Now that they are not nop anymore, remove the aiocontext
> to avoid deadlocks.
> 
> Therefore:
> - when possible, remove completely the aiocontext lock/unlock pair
> - if it is used by some other function too, reduce the locking
>    section as much as possible, leaving the job API outside.
> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>    are not using the aiocontext lock anymore
> 
> There is only one JobDriver callback, ->free() that assumes that
> the aiocontext lock is held (because it calls bdrv_unref), so for
> now keep that under aiocontext lock.
> 
> Also remove real_job_{lock/unlock}, as they are replaced by the
> public functions.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   blockdev.c                       | 74 +++++-----------------------
>   include/qemu/job.h               | 22 ++++-----
>   job-qmp.c                        | 46 +++--------------
>   job.c                            | 84 ++++++--------------------------
>   tests/unit/test-bdrv-drain.c     |  4 +-
>   tests/unit/test-block-iothread.c |  2 +-
>   tests/unit/test-blockjob.c       | 15 ++----
>   7 files changed, 52 insertions(+), 195 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index 5b79093155..2cd84d206c 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -155,12 +155,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>       for (job = block_job_next_locked(NULL); job;
>            job = block_job_next_locked(job)) {
>           if (block_job_has_bdrv(job, blk_bs(blk))) {
> -            AioContext *aio_context = job->job.aio_context;
> -            aio_context_acquire(aio_context);
> -
>               job_cancel_locked(&job->job, false);
> -
> -            aio_context_release(aio_context);
>           }
>       }
>   
> @@ -1836,14 +1831,7 @@ static void drive_backup_abort(BlkActionState *common)
>       DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
>   
>       if (state->job) {
> -        AioContext *aio_context;
> -
> -        aio_context = bdrv_get_aio_context(state->bs);
> -        aio_context_acquire(aio_context);
> -
>           job_cancel_sync(&state->job->job, true);
> -
> -        aio_context_release(aio_context);
>       }
>   }
>   
> @@ -1937,14 +1925,7 @@ static void blockdev_backup_abort(BlkActionState *common)
>       BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
>   
>       if (state->job) {
> -        AioContext *aio_context;
> -
> -        aio_context = bdrv_get_aio_context(state->bs);
> -        aio_context_acquire(aio_context);
> -
>           job_cancel_sync(&state->job->job, true);
> -
> -        aio_context_release(aio_context);
>       }
>   }
>   
> @@ -3306,19 +3287,14 @@ out:
>   }
>   
>   /*
> - * Get a block job using its ID and acquire its AioContext.
> - * Called with job_mutex held.
> + * Get a block job using its ID. Called with job_mutex held.
>    */
> -static BlockJob *find_block_job_locked(const char *id,
> -                                       AioContext **aio_context,
> -                                       Error **errp)
> +static BlockJob *find_block_job_locked(const char *id, Error **errp)
>   {
>       BlockJob *job;
>   
>       assert(id != NULL);
>   
> -    *aio_context = NULL;
> -
>       job = block_job_get_locked(id);
>   
>       if (!job) {
> @@ -3327,36 +3303,30 @@ static BlockJob *find_block_job_locked(const char *id,
>           return NULL;
>       }
>   
> -    *aio_context = block_job_get_aio_context(job);
> -    aio_context_acquire(*aio_context);
> -
>       return job;
>   }
>   
>   void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *job;
>   
>       JOB_LOCK_GUARD();
> -    job = find_block_job_locked(device, &aio_context, errp);
> +    job = find_block_job_locked(device, errp);
>   
>       if (!job) {
>           return;
>       }
>   
>       block_job_set_speed_locked(job, speed, errp);
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_block_job_cancel(const char *device,
>                             bool has_force, bool force, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *job;
>   
>       JOB_LOCK_GUARD();
> -    job = find_block_job_locked(device, &aio_context, errp);
> +    job = find_block_job_locked(device, errp);
>   
>       if (!job) {
>           return;
> @@ -3369,22 +3339,19 @@ void qmp_block_job_cancel(const char *device,
>       if (job_user_paused_locked(&job->job) && !force) {
>           error_setg(errp, "The block job for device '%s' is currently paused",
>                      device);
> -        goto out;
> +        return;
>       }
>   
>       trace_qmp_block_job_cancel(job);
>       job_user_cancel_locked(&job->job, force, errp);
> -out:
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_block_job_pause(const char *device, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *job;
>   
>       JOB_LOCK_GUARD();
> -    job = find_block_job_locked(device, &aio_context, errp);
> +    job = find_block_job_locked(device, errp);
>   
>       if (!job) {
>           return;
> @@ -3392,16 +3359,14 @@ void qmp_block_job_pause(const char *device, Error **errp)
>   
>       trace_qmp_block_job_pause(job);
>       job_user_pause_locked(&job->job, errp);
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_block_job_resume(const char *device, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *job;
>   
>       JOB_LOCK_GUARD();
> -    job = find_block_job_locked(device, &aio_context, errp);
> +    job = find_block_job_locked(device, errp);
>   
>       if (!job) {
>           return;
> @@ -3409,16 +3374,14 @@ void qmp_block_job_resume(const char *device, Error **errp)
>   
>       trace_qmp_block_job_resume(job);
>       job_user_resume_locked(&job->job, errp);
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_block_job_complete(const char *device, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *job;
>   
>       JOB_LOCK_GUARD();
> -    job = find_block_job_locked(device, &aio_context, errp);
> +    job = find_block_job_locked(device, errp);
>   
>       if (!job) {
>           return;
> @@ -3426,16 +3389,14 @@ void qmp_block_job_complete(const char *device, Error **errp)
>   
>       trace_qmp_block_job_complete(job);
>       job_complete_locked(&job->job, errp);
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_block_job_finalize(const char *id, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *job;
>   
>       JOB_LOCK_GUARD();
> -    job = find_block_job_locked(id, &aio_context, errp);
> +    job = find_block_job_locked(id, errp);
>   
>       if (!job) {
>           return;
> @@ -3445,24 +3406,16 @@ void qmp_block_job_finalize(const char *id, Error **errp)
>       job_ref_locked(&job->job);
>       job_finalize_locked(&job->job, errp);
>   
> -    /*
> -     * Job's context might have changed via job_finalize (and job_txn_apply
> -     * automatically acquires the new one), so make sure we release the correct
> -     * one.
> -     */
> -    aio_context = block_job_get_aio_context(job);
>       job_unref_locked(&job->job);
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_block_job_dismiss(const char *id, Error **errp)
>   {
> -    AioContext *aio_context;
>       BlockJob *bjob;
>       Job *job;
>   
>       JOB_LOCK_GUARD();
> -    bjob = find_block_job_locked(id, &aio_context, errp);
> +    bjob = find_block_job_locked(id, errp);
>   
>       if (!bjob) {
>           return;
> @@ -3471,7 +3424,6 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
>       trace_qmp_block_job_dismiss(bjob);
>       job = &bjob->job;
>       job_dismiss_locked(&job, errp);
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_change_backing_file(const char *device,
> @@ -3753,15 +3705,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>       for (job = block_job_next_locked(NULL); job;
>            job = block_job_next_locked(job)) {
>           BlockJobInfo *value;
> -        AioContext *aio_context;
>   
>           if (block_job_is_internal(job)) {
>               continue;
>           }
> -        aio_context = block_job_get_aio_context(job);
> -        aio_context_acquire(aio_context);
> -        value = block_job_query(job, errp);
> -        aio_context_release(aio_context);
> +        value = block_job_query_locked(job, errp);
>           if (!value) {
>               qapi_free_BlockJobInfoList(head);
>               return NULL;
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index c144aabefc..676f69bb2e 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -75,13 +75,14 @@ typedef struct Job {
>       ProgressMeter progress;
>   
>   
> -    /** Protected by AioContext lock */
> +    /** Protected by job_mutex */
>   
>       /**
>        * AioContext to run the job coroutine in.
> -     * This field can be read when holding either the BQL (so we are in
> -     * the main loop) or the job_mutex.
> -     * It can be only written when we hold *both* BQL and job_mutex.
> +     * The job Aiocontext can be read when holding *either*
> +     * the BQL (so we are in the main loop) or the job_mutex.
> +     * It can only be written when we hold *both* BQL
> +     * and the job_mutex.

You reword comment you've added some patches ago. Could you please merge this to original patch?

>        */
>       AioContext *aio_context;
>   
> @@ -106,7 +107,7 @@ typedef struct Job {
>       /**
>        * Set to false by the job while the coroutine has yielded and may be
>        * re-entered by job_enter(). There may still be I/O or event loop activity
> -     * pending. Accessed under block_job_mutex (in blockjob.c).
> +     * pending. Accessed under job_mutex.
>        *
>        * When the job is deferred to the main loop, busy is true as long as the
>        * bottom half is still pending.
> @@ -322,9 +323,9 @@ typedef enum JobCreateFlags {
>   
>   extern QemuMutex job_mutex;
>   
> -#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
> +#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
>   
> -#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
> +#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
>   
>   /**
>    * job_lock:
> @@ -672,7 +673,7 @@ void job_user_cancel_locked(Job *job, bool force, Error **errp);
>    * Returns the return value from the job if the job actually completed
>    * during the call, or -ECANCELED if it was canceled.
>    *
> - * Callers must hold the AioContext lock of job->aio_context.
> + * Called with job_lock held.

That's wrong, it should be called with job_lock not held :)

>    */
>   int job_cancel_sync(Job *job, bool force);
>   
> @@ -697,8 +698,7 @@ void job_cancel_sync_all(void);
>    * function).
>    *
>    * Returns the return value from the job.
> - *
> - * Callers must hold the AioContext lock of job->aio_context.
> + * Called with job_lock held.

and this,

>    */
>   int job_complete_sync(Job *job, Error **errp);
>   
> @@ -734,7 +734,7 @@ void job_dismiss_locked(Job **job, Error **errp);
>    * Returns 0 if the job is successfully completed, -ECANCELED if the job was
>    * cancelled before completing, and -errno in other error cases.
>    *
> - * Callers must hold the AioContext lock of job->aio_context.
> + * Called with job_lock held.

and this.

>    */
>   int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
>                       Error **errp);
> diff --git a/job-qmp.c b/job-qmp.c
> index cfaf34ffb7..96d67246d2 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -30,36 +30,27 @@

[..]

>   }
> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)>           assert(!job->txn);
>   
>           if (job->driver->free) {
> +            AioContext *aio_context = job->aio_context;
>               job_unlock();
> +            /* FIXME: aiocontext lock is required because cb calls blk_unref */
> +            aio_context_acquire(aio_context);
>               job->driver->free(job);
> +            aio_context_release(aio_context);

So, job_unref_locked() must be called with aio_context not locked, otherwise we dead-lock here? That should be documented in function declaration comment.

For example in qemu-img.c in run_block_job() we do exactly that: call job_unref_locked()  inside aio-context lock critical seaction..


>               job_lock();
>           }
>   
> @@ -581,21 +565,17 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>           return;
>       }
>   
> -    real_job_lock();
>       if (job->busy) {
> -        real_job_unlock();
>           return;
>       }
>   
>       if (fn && !fn(job)) {
> -        real_job_unlock();
>           return;
>       }
>   
>       assert(!job->deferred_to_main_loop);
>       timer_del(&job->sleep_timer);
>       job->busy = true;
> -    real_job_unlock();
>       job_unlock();
>       aio_co_wake(job->co);
>       job_lock();
> @@ -626,13 +606,11 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>   {
>       AioContext *next_aio_context;
>   
> -    real_job_lock();
>       if (ns != -1) {
>           timer_mod(&job->sleep_timer, ns);
>       }
>       job->busy = false;
>       job_event_idle_locked(job);
> -    real_job_unlock();
>       job_unlock();
>       qemu_coroutine_yield();
>       job_lock();
> @@ -922,6 +900,7 @@ static void job_clean(Job *job)
>   static int job_finalize_single_locked(Job *job)
>   {
>       int job_ret;
> +    AioContext *ctx = job->aio_context;
>   
>       assert(job_is_completed_locked(job));
>   
> @@ -929,6 +908,7 @@ static int job_finalize_single_locked(Job *job)
>       job_update_rc_locked(job);
>   
>       job_unlock();
> +    aio_context_acquire(ctx);

Hmm, and this function and all its callers now should be called with aio-context lock not locked?

For example job_exit is scheduled as as BH. Aren't BHs called with aio-context lock held?

>   
>       if (!job->ret) {
>           job_commit(job);
> @@ -937,6 +917,7 @@ static int job_finalize_single_locked(Job *job)
>       }
>       job_clean(job);
>   
> +    aio_context_release(ctx);
>       job_lock();
>   
>       if (job->cb) {

[..]


-- 
Best regards,
Vladimir

