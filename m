Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6E58AB52
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:09:20 +0200 (CEST)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJx4p-0008Uc-AR
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJwxC-0000uO-IS
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJwx5-0005tL-BR
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659704477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Z1eHjahCZCYs3F2OZN/yFSpo2rIDnVLaHFQ99UGNqE=;
 b=VJ0xxOCasKdIqSmvAhlP17WpfJzmubsaqyS2EhLR7f562tZV1bOpPE7enIxL3V4EFpEK2b
 zTvHW7xfMi2sXkZsElrpMxwSijsPqUwoirWwPDgpFWnk5mUS/3kxDWuOM1oaaNHwzpgW4y
 xYhWA0MQdHWJGO7EGeTtn6DhzQd9kuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-xcI2AI_FNDisiGCHn_b5Gw-1; Fri, 05 Aug 2022 09:01:13 -0400
X-MC-Unique: xcI2AI_FNDisiGCHn_b5Gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2463804196;
 Fri,  5 Aug 2022 13:01:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E2F909FE;
 Fri,  5 Aug 2022 13:01:09 +0000 (UTC)
Date: Fri, 5 Aug 2022 15:01:07 +0200
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
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Message-ID: <Yu0Uk3PhxGC39mf0@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-19-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
> Change the job_{lock/unlock} and macros to use job_mutex.
> 
> Now that they are not nop anymore, remove the aiocontext
> to avoid deadlocks.

Okay, so this is the big bad patch where we need to verify the
completeness of all changes made so far. Let's see...

> Therefore:
> - when possible, remove completely the aiocontext lock/unlock pair
> - if it is used by some other function too, reduce the locking
>   section as much as possible, leaving the job API outside.
> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>   are not using the aiocontext lock anymore

Does this imply that there is a new rule that job_*() must not be called
with the AioContext lock held? Or is it optional now?

If it's a rule, it should be documented.


(Coming back after reviewing more of the patch:)


It doesn't seem to be a rule, or at least not a rule that is obeyed.

Actually each function in job.c belongs in one of at most three
categories: Must hold the AioContext (because it calls callbacks that
need it), may hold the AioContext optionally, and must not hold it
(everything that would cause the deadlocks you're alluding to, but not
explaining, in the commit message).

It is not obvious which function is in which category. So I maintain
that we need some documentation for the assumptions made.

All coroutine_fns (which are called from the job coroutine) should be in
the category that they still run with the AioContext locked, but that
covers only a small minority of functions.

The driver callbacks look mostly correct at least with respect to
AioContext locking, even if their status isn't documented. I suppose
this is the most important part.

> There is only one JobDriver callback, ->free() that assumes that
> the aiocontext lock is held (because it calls bdrv_unref), so for
> now keep that under aiocontext lock.
> 
> Also remove real_job_{lock/unlock}, as they are replaced by the
> public functions.

At least this part is easily verified. All real_job_lock() sections are
part of a larger job_lock() section.

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  blockdev.c                       | 74 +++++-----------------------
>  include/qemu/job.h               | 22 ++++-----
>  job-qmp.c                        | 46 +++--------------
>  job.c                            | 84 ++++++--------------------------
>  tests/unit/test-bdrv-drain.c     |  4 +-
>  tests/unit/test-block-iothread.c |  2 +-
>  tests/unit/test-blockjob.c       | 15 ++----
>  7 files changed, 52 insertions(+), 195 deletions(-)

> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index c144aabefc..676f69bb2e 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -75,13 +75,14 @@ typedef struct Job {
>      ProgressMeter progress;
>  
>  
> -    /** Protected by AioContext lock */
> +    /** Protected by job_mutex */
>  
>      /**
>       * AioContext to run the job coroutine in.
> -     * This field can be read when holding either the BQL (so we are in
> -     * the main loop) or the job_mutex.
> -     * It can be only written when we hold *both* BQL and job_mutex.
> +     * The job Aiocontext can be read when holding *either*
> +     * the BQL (so we are in the main loop) or the job_mutex.
> +     * It can only be written when we hold *both* BQL
> +     * and the job_mutex.

Old and new version seem to say the same apart from stylistic
differences, so this feels like unnecessary churn.

>       */
>      AioContext *aio_context;
>  
> @@ -106,7 +107,7 @@ typedef struct Job {
>      /**
>       * Set to false by the job while the coroutine has yielded and may be
>       * re-entered by job_enter(). There may still be I/O or event loop activity
> -     * pending. Accessed under block_job_mutex (in blockjob.c).
> +     * pending. Accessed under job_mutex.
>       *
>       * When the job is deferred to the main loop, busy is true as long as the
>       * bottom half is still pending.
> @@ -322,9 +323,9 @@ typedef enum JobCreateFlags {
>  
>  extern QemuMutex job_mutex;
>  
> -#define JOB_LOCK_GUARD() /* QEMU_LOCK_GUARD(&job_mutex) */
> +#define JOB_LOCK_GUARD() QEMU_LOCK_GUARD(&job_mutex)
>  
> -#define WITH_JOB_LOCK_GUARD() /* WITH_QEMU_LOCK_GUARD(&job_mutex) */
> +#define WITH_JOB_LOCK_GUARD() WITH_QEMU_LOCK_GUARD(&job_mutex)
>  
>  /**
>   * job_lock:
> @@ -672,7 +673,7 @@ void job_user_cancel_locked(Job *job, bool force, Error **errp);
>   * Returns the return value from the job if the job actually completed
>   * during the call, or -ECANCELED if it was canceled.
>   *
> - * Callers must hold the AioContext lock of job->aio_context.
> + * Called with job_lock held.
>   */
>  int job_cancel_sync(Job *job, bool force);

This doesn't make sense, it describes job_cancel_sync_locked().

>  
> @@ -697,8 +698,7 @@ void job_cancel_sync_all(void);
>   * function).
>   *
>   * Returns the return value from the job.
> - *
> - * Callers must hold the AioContext lock of job->aio_context.
> + * Called with job_lock held.

Same.

>   */
>  int job_complete_sync(Job *job, Error **errp);
>  
> @@ -734,7 +734,7 @@ void job_dismiss_locked(Job **job, Error **errp);
>   * Returns 0 if the job is successfully completed, -ECANCELED if the job was
>   * cancelled before completing, and -errno in other error cases.
>   *
> - * Callers must hold the AioContext lock of job->aio_context.
> + * Called with job_lock held.

Same.

>   */
>  int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
>                      Error **errp);
> diff --git a/job.c b/job.c
> index 0a857b1468..9797b934d9 100644
> --- a/job.c
> +++ b/job.c
> @@ -96,21 +96,11 @@ struct JobTxn {
>  };
>  
>  void job_lock(void)
> -{
> -    /* nop */
> -}
> -
> -void job_unlock(void)
> -{
> -    /* nop */
> -}
> -
> -static void real_job_lock(void)
>  {
>      qemu_mutex_lock(&job_mutex);
>  }
>  
> -static void real_job_unlock(void)
> +void job_unlock(void)
>  {
>      qemu_mutex_unlock(&job_mutex);
>  }
> @@ -185,7 +175,6 @@ static void job_txn_del_job_locked(Job *job)
>  /* Called with job_mutex held, but releases it temporarily. */
>  static int job_txn_apply_locked(Job *job, int fn(Job *))
>  {
> -    AioContext *inner_ctx;
>      Job *other_job, *next;
>      JobTxn *txn = job->txn;
>      int rc = 0;
> @@ -197,23 +186,14 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
>       * break AIO_WAIT_WHILE from within fn.
>       */
>      job_ref_locked(job);
> -    aio_context_release(job->aio_context);
>  
>      QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
> -        inner_ctx = other_job->aio_context;
> -        aio_context_acquire(inner_ctx);
>          rc = fn(other_job);
> -        aio_context_release(inner_ctx);

Okay, so fn() is now called without the AioContext lock while it was
called with it previously. This requires checking all callers.

What isn't immediately clear, but seems to be true, is that all notifiers
don't need the AioContext lock. Probably worth documenting in struct
Job. (Needed because of job_transition_to_pending_locked(), which is
passed as fn.)

>          if (rc) {
>              break;
>          }
>      }
>  
> -    /*
> -     * Note that job->aio_context might have been changed by calling fn, so we
> -     * can't use a local variable to cache it.
> -     */
> -    aio_context_acquire(job->aio_context);
>      job_unref_locked(job);
>      return rc;
>  }
> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)
>          assert(!job->txn);
>  
>          if (job->driver->free) {
> +            AioContext *aio_context = job->aio_context;
>              job_unlock();
> +            /* FIXME: aiocontext lock is required because cb calls blk_unref */
> +            aio_context_acquire(aio_context);
>              job->driver->free(job);
> +            aio_context_release(aio_context);

The documentation of JobDriver doesn't specify which callbacks are
called with the AioContext locked and which are called without it. It
probably should.

(A good part of the documentation clarifications I'm asking for in this
review should probably done in a patch before this one, so that
reviewing the documentation involves checking that the requirements of
the callback match what we're documenting, and then the review of this
patch can focus on that the documented contract is still obeyed.)

>              job_lock();
>          }
>  
> @@ -922,6 +900,7 @@ static void job_clean(Job *job)
>  static int job_finalize_single_locked(Job *job)
>  {
>      int job_ret;
> +    AioContext *ctx = job->aio_context;
>  
>      assert(job_is_completed_locked(job));
>  
> @@ -929,6 +908,7 @@ static int job_finalize_single_locked(Job *job)
>      job_update_rc_locked(job);
>  
>      job_unlock();
> +    aio_context_acquire(ctx);
>  
>      if (!job->ret) {
>          job_commit(job);
> @@ -937,6 +917,7 @@ static int job_finalize_single_locked(Job *job)
>      }
>      job_clean(job);
>  
> +    aio_context_release(ctx);
>      job_lock();

Let's add comments to job_commit(), job_abort() and job_clean() that
they are called with the AioContext lock held.

A few lines below we are now calling job->cb() without the AioContext
lock even though previously it was called with it. Which way is right?
The intended behaviour should be documented in struct Job.

>      if (job->cb) {
> @@ -1002,7 +983,6 @@ static void job_cancel_async_locked(Job *job, bool force)
>  /* Called with job_mutex held, but releases it temporarily. */
>  static void job_completed_txn_abort_locked(Job *job)
>  {
> -    AioContext *ctx;
>      JobTxn *txn = job->txn;
>      Job *other_job;
>  
> @@ -1015,54 +995,31 @@ static void job_completed_txn_abort_locked(Job *job)
>      txn->aborting = true;
>      job_txn_ref_locked(txn);
>  
> -    /*
> -     * We can only hold the single job's AioContext lock while calling
> -     * job_finalize_single() because the finalization callbacks can involve
> -     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
> -     * Note that the job's AioContext may change when it is finalized.
> -     */
>      job_ref_locked(job);
> -    aio_context_release(job->aio_context);
>  
>      /* Other jobs are effectively cancelled by us, set the status for
>       * them; this job, however, may or may not be cancelled, depending
>       * on the caller, so leave it. */
>      QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
>          if (other_job != job) {
> -            ctx = other_job->aio_context;
> -            aio_context_acquire(ctx);
>              /*
>               * This is a transaction: If one job failed, no result will matter.
>               * Therefore, pass force=true to terminate all other jobs as quickly
>               * as possible.
>               */
>              job_cancel_async_locked(other_job, true);

job_cancel_async_locked() calls job->driver->cancel() without the
AioContext lock now. Some implementations call bdrv_cancel_in_flight().
Generally bdrv_*() are called with the AioContext lock held.

If we want to make bdrv_cancel_in_flight() an exception, at the very
least this need to be documented.

The more obvious solution would be to acquire the AioContext lock in
job_cancel_async_locked() around the callback.

> -            aio_context_release(ctx);
>          }
>      }
>      while (!QLIST_EMPTY(&txn->jobs)) {
>          other_job = QLIST_FIRST(&txn->jobs);
> -        /*
> -         * The job's AioContext may change, so store it in @ctx so we
> -         * release the same context that we have acquired before.
> -         */
> -        ctx = other_job->aio_context;
> -        aio_context_acquire(ctx);
>          if (!job_is_completed_locked(other_job)) {
>              assert(job_cancel_requested_locked(other_job));
>              job_finish_sync_locked(other_job, NULL, NULL);
>          }
>          job_finalize_single_locked(other_job);
> -        aio_context_release(ctx);
>      }
>  
> -    /*
> -     * Use job_ref()/job_unref() so we can read the AioContext here
> -     * even if the job went away during job_finalize_single().
> -     */
> -    aio_context_acquire(job->aio_context);
>      job_unref_locked(job);
> -
>      job_txn_unref_locked(txn);
>  }
>  
> @@ -1070,15 +1027,20 @@ static void job_completed_txn_abort_locked(Job *job)
>  static int job_prepare_locked(Job *job)
>  {
>      int ret;
> +    AioContext *ctx = job->aio_context;
>  
>      GLOBAL_STATE_CODE();
> +
>      if (job->ret == 0 && job->driver->prepare) {
>          job_unlock();
> +        aio_context_acquire(ctx);
>          ret = job->driver->prepare(job);
> +        aio_context_release(ctx);
>          job_lock();
>          job->ret = ret;
>          job_update_rc_locked(job);
>      }
> +
>      return job->ret;
>  }
>  
> @@ -1183,11 +1145,8 @@ static void job_completed_locked(Job *job)
>  static void job_exit(void *opaque)
>  {
>      Job *job = (Job *)opaque;
> -    AioContext *ctx;
>      JOB_LOCK_GUARD();
> -
>      job_ref_locked(job);
> -    aio_context_acquire(job->aio_context);
>  
>      /* This is a lie, we're not quiescent, but still doing the completion
>       * callbacks. However, completion callbacks tend to involve operations that
> @@ -1197,16 +1156,7 @@ static void job_exit(void *opaque)
>      job_event_idle_locked(job);
>  
>      job_completed_locked(job);
> -
> -    /*
> -     * Note that calling job_completed can move the job to a different
> -     * aio_context, so we cannot cache from above. job_txn_apply takes care of
> -     * acquiring the new lock, and we ref/unref to avoid job_completed freeing
> -     * the job underneath us.
> -     */
> -    ctx = job->aio_context;
>      job_unref_locked(job);
> -    aio_context_release(ctx);
>  }
>  
>  /**
> @@ -1334,14 +1284,10 @@ int job_cancel_sync(Job *job, bool force)
>  void job_cancel_sync_all(void)
>  {
>      Job *job;
> -    AioContext *aio_context;
>      JOB_LOCK_GUARD();
>  
>      while ((job = job_next_locked(NULL))) {
> -        aio_context = job->aio_context;
> -        aio_context_acquire(aio_context);
>          job_cancel_sync_locked(job, true);
> -        aio_context_release(aio_context);
>      }
>  }
>  
> @@ -1401,8 +1347,8 @@ int job_finish_sync_locked(Job *job,
>      }
>  
>      job_unlock();
> -    AIO_WAIT_WHILE(job->aio_context,
> -                   (job_enter(job), !job_is_completed(job)));
> +    AIO_WAIT_WHILE_UNLOCKED(job->aio_context,
> +                            (job_enter(job), !job_is_completed(job)));
>      job_lock();
>  
>      ret = (job_is_cancelled_locked(job) && job->ret == 0)
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index 0db056ea63..4924ceb562 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -930,9 +930,9 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
>          tjob->prepare_ret = -EIO;
>          break;
>      }
> +    aio_context_release(ctx);
>  
>      job_start(&job->job);
> -    aio_context_release(ctx);
>  
>      if (use_iothread) {
>          /* job_co_entry() is run in the I/O thread, wait for the actual job
> @@ -1016,12 +1016,12 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
>          g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
>      }
>  
> -    aio_context_acquire(ctx);
>      WITH_JOB_LOCK_GUARD() {
>          ret = job_complete_sync_locked(&job->job, &error_abort);
>      }
>      g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
>  
> +    aio_context_acquire(ctx);
>      if (use_iothread) {
>          blk_set_aio_context(blk_src, qemu_get_aio_context(), &error_abort);
>          assert(blk_get_aio_context(blk_target) == qemu_get_aio_context());
> diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
> index 89e7f0fffb..9d7c8be00f 100644
> --- a/tests/unit/test-block-iothread.c
> +++ b/tests/unit/test-block-iothread.c
> @@ -455,10 +455,10 @@ static void test_attach_blockjob(void)
>          aio_poll(qemu_get_aio_context(), false);
>      }
>  
> -    aio_context_acquire(ctx);
>      WITH_JOB_LOCK_GUARD() {
>          job_complete_sync_locked(&tjob->common.job, &error_abort);
>      }
> +    aio_context_acquire(ctx);
>      blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
>      aio_context_release(ctx);
>  
> diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
> index b0cd06c529..8a9350078f 100644
> --- a/tests/unit/test-blockjob.c
> +++ b/tests/unit/test-blockjob.c
> @@ -228,10 +228,6 @@ static void cancel_common(CancelJob *s)
>      BlockJob *job = &s->common;
>      BlockBackend *blk = s->blk;
>      JobStatus sts = job->job.status;
> -    AioContext *ctx;
> -
> -    ctx = job->job.aio_context;
> -    aio_context_acquire(ctx);
>  
>      job_cancel_sync(&job->job, true);
>      WITH_JOB_LOCK_GUARD() {
> @@ -244,7 +240,6 @@ static void cancel_common(CancelJob *s)
>      }
>      destroy_blk(blk);
>  
> -    aio_context_release(ctx);

destroy_blk() requires the AioContext to be locked.

>  }
>  
>  static void test_cancel_created(void)
> @@ -384,12 +379,10 @@ static void test_cancel_concluded(void)
>      aio_poll(qemu_get_aio_context(), true);
>      assert_job_status_is(job, JOB_STATUS_PENDING);
>  
> -    aio_context_acquire(job->aio_context);
>      WITH_JOB_LOCK_GUARD() {
>          job_finalize_locked(job, &error_abort);
> +        assert(job->status == JOB_STATUS_CONCLUDED);
>      }
> -    aio_context_release(job->aio_context);
> -    assert_job_status_is(job, JOB_STATUS_CONCLUDED);
>  
>      cancel_common(s);
>  }
> @@ -482,13 +475,11 @@ static void test_complete_in_standby(void)
>  
>      /* Wait for the job to become READY */
>      job_start(job);
> -    aio_context_acquire(ctx);
>      /*
>       * Here we are waiting for the status to change, so don't bother
>       * protecting the read every time.
>       */
> -    AIO_WAIT_WHILE(ctx, job->status != JOB_STATUS_READY);
> -    aio_context_release(ctx);
> +    AIO_WAIT_WHILE_UNLOCKED(ctx, job->status != JOB_STATUS_READY);
>  
>      /* Begin the drained section, pausing the job */
>      bdrv_drain_all_begin();
> @@ -507,6 +498,7 @@ static void test_complete_in_standby(void)
>          job_complete_locked(job, &error_abort);
>  
>          /* The test is done now, clean up. */
> +        aio_context_release(ctx);

job_complete_locked() is not supposed to be called with the AioContext
locked (otherwise blockdev.c would be wrong).

>          job_finish_sync_locked(job, NULL, &error_abort);
>          assert(job->status == JOB_STATUS_PENDING);
>  
> @@ -516,6 +508,7 @@ static void test_complete_in_standby(void)
>          job_dismiss_locked(&job, &error_abort);
>      }
>  
> +    aio_context_acquire(ctx);
>      destroy_blk(blk);
>      aio_context_release(ctx);
>      iothread_join(iothread);

Kevin


