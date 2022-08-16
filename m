Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C6595EA2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 16:56:52 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNxzt-0005Iq-Nz
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 10:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNxxN-0003Yj-86
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 10:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNxxJ-0001rD-N8
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 10:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660661648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUN8H0fTk8DnBFLchTBcfbbGL60Id/CuMzcWWxm/OhY=;
 b=Pq91QC5Rw4O3NHmwRBAyZqxNeqqb143LY4jCizgrYkIYY+/lHucAwpqStIcY2xXxEWHfb4
 Xy/wI9GPbsuhOkVGKd5kFf5TCMkrDz4MZoe4TPH8U7hUnqDH5DKeUToJ/Ltbuj0dX/hpGo
 SuXz4wiG5yf1YyZ6YHU3eXuU0wUL3dk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-7AOUOO5OOUafpTjzMivGDg-1; Tue, 16 Aug 2022 10:54:07 -0400
X-MC-Unique: 7AOUOO5OOUafpTjzMivGDg-1
Received: by mail-qt1-f199.google.com with SMTP id
 g22-20020ac85816000000b00342b02072ceso8494631qtg.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 07:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LUN8H0fTk8DnBFLchTBcfbbGL60Id/CuMzcWWxm/OhY=;
 b=daIYjTFNFwjMbnxicvdW611mxWeFNQ7pbrXU5KWCrotxYtUZ/NMFU2s0xRPqF3+H1n
 dTkyUqW4wBExaMfyfF5ce/VuTGNCkQNmfpx9ibmQY1/LtLit1pYYywyxyZnv7y9upXFb
 fMh4EOXu620XsMQ9/egt6IbxJjt30y6Uj3BztsVvaBdT5ArE8B3NrLdo9DznB2ACpx3p
 eYphz4l141lOpE/ItyKfgkxrbLMYVCywHkKP0EzYKf3p6nN/HYm7lITHIQFguFN2e7vM
 j54hqPCXv+zwjBUOSMXm0yjjehq74biiiH20YrRrQhrPNUGakRnzxZpBbW8IblIDy3FP
 sV9Q==
X-Gm-Message-State: ACgBeo05A98DLGc+ELS6XRIvqZhdRqeKqcMk+V5P5curGqIyG97k8J5d
 /oiqgF3FtZDG9+zuctUlF75wwK33ItG09qcInXmwpwsqgr2jopHyX67CGdzVR/sQxl53FrnbdC0
 LHTrHqPdj+q0ggJ8=
X-Received: by 2002:ac8:7f83:0:b0:343:869a:7db9 with SMTP id
 z3-20020ac87f83000000b00343869a7db9mr14723499qtj.46.1660661646803; 
 Tue, 16 Aug 2022 07:54:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4jO2XWHCoe9D2HScNqiMHpEd145bf3egsmUBt6EX085ctRNcwoULOIUfrh866/H0ol3ybiMw==
X-Received: by 2002:ac8:7f83:0:b0:343:869a:7db9 with SMTP id
 z3-20020ac87f83000000b00343869a7db9mr14723471qtj.46.1660661646421; 
 Tue, 16 Aug 2022 07:54:06 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05620a2a0400b006ba9b2167a2sm11126649qkp.16.2022.08.16.07.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 07:54:05 -0700 (PDT)
Message-ID: <1ed3c1c5-8393-2dc8-c930-606b73778a6b@redhat.com>
Date: Tue, 16 Aug 2022 16:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 11/21] jobs: group together API calls under the same
 job lock
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-12-eesposit@redhat.com> <Yuv9cKJotWg0NEno@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yuv9cKJotWg0NEno@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 04/08/2022 um 19:10 schrieb Kevin Wolf:
> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>> Now that the API offers also _locked() functions, take advantage
>> of it and give also the caller control to take the lock and call
>> _locked functions.
>>
>> This makes sense especially when we have for loops, because it
>> makes no sense to have:
>>
>> for(job = job_next(); ...)
>>
>> where each job_next() takes the lock internally.
>> Instead we want
>>
>> JOB_LOCK_GUARD();
>> for(job = job_next_locked(); ...)
>>
>> In addition, protect also direct field accesses, by either creating a
>> new critical section or widening the existing ones.
> 
> "In addition" sounds like it should be a separate patch. I was indeed
> surprised when after a few for loops where you just pulled the existing
> locking up a bit, I saw some hunks that add completely new locking.

Would it be okay if we don't split it in two? There would be two
microscopical patches.

> 
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  block.c            | 17 ++++++++++-------
>>  blockdev.c         | 12 +++++++++---
>>  blockjob.c         | 35 ++++++++++++++++++++++-------------
>>  job-qmp.c          |  4 +++-
>>  job.c              |  7 +++++--
>>  monitor/qmp-cmds.c |  7 +++++--
>>  qemu-img.c         | 37 +++++++++++++++++++++----------------
>>  7 files changed, 75 insertions(+), 44 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 2c00dddd80..7559965dbc 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4978,8 +4978,8 @@ static void bdrv_close(BlockDriverState *bs)
>>  
>>  void bdrv_close_all(void)
>>  {
>> -    assert(job_next(NULL) == NULL);
>>      GLOBAL_STATE_CODE();
>> +    assert(job_next(NULL) == NULL);
>>  
>>      /* Drop references from requests still in flight, such as canceled block
>>       * jobs whose AIO context has not been polled yet */
>> @@ -6165,13 +6165,16 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
>>          }
>>      }
>>  
>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>> -        GSList *el;
>> +    WITH_JOB_LOCK_GUARD() {
>> +        for (job = block_job_next_locked(NULL); job;
>> +             job = block_job_next_locked(job)) {
>> +            GSList *el;
>>  
>> -        xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
>> -                           job->job.id);
>> -        for (el = job->nodes; el; el = el->next) {
>> -            xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
>> +            xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
>> +                                job->job.id);
>> +            for (el = job->nodes; el; el = el->next) {
>> +                xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
>> +            }
>>          }
>>      }
>>  
>> diff --git a/blockdev.c b/blockdev.c
>> index 71f793c4ab..5b79093155 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>>          return;
>>      }
>>  
>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>> +    JOB_LOCK_GUARD();
>> +
>> +    for (job = block_job_next_locked(NULL); job;
>> +         job = block_job_next_locked(job)) {
>>          if (block_job_has_bdrv(job, blk_bs(blk))) {
> 
> Should this be renamed to block_job_has_bdrv_locked() now?
> 
> It looks to me like it does need the locking. (Which actually makes
> this patch a fix and not just an optimisation as the commit message
> suggests.)

Nope, as GSList *nodes; is always read and written under BQL.

> 
>>              AioContext *aio_context = job->job.aio_context;
>>              aio_context_acquire(aio_context);
>>  
>> -            job_cancel(&job->job, false);
>> +            job_cancel_locked(&job->job, false);
>>  
>>              aio_context_release(aio_context);
>>          }
>> @@ -3745,7 +3748,10 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>>      BlockJobInfoList *head = NULL, **tail = &head;
>>      BlockJob *job;
>>  
>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>> +    JOB_LOCK_GUARD();
>> +
>> +    for (job = block_job_next_locked(NULL); job;
>> +         job = block_job_next_locked(job)) {
>>          BlockJobInfo *value;
>>          AioContext *aio_context;
> 
> More context:
> 
>         BlockJobInfo *value;
>         AioContext *aio_context;
> 
>         if (block_job_is_internal(job)) {
>             continue;
>         }
>         aio_context = block_job_get_aio_context(job);
>         aio_context_acquire(aio_context);
>         value = block_job_query(job, errp);
>         aio_context_release(aio_context);
> 
> This should become block_job_query_locked(). (You do that in patch 18,
> but it looks a bit out of place there - which is precisely because it
> really belongs in this one.)

Ok
> 
>> diff --git a/blockjob.c b/blockjob.c
>> index 0d59aba439..96fb9d9f73 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -111,8 +111,10 @@ static bool child_job_drained_poll(BdrvChild *c)
>>      /* An inactive or completed job doesn't have any pending requests. Jobs
>>       * with !job->busy are either already paused or have a pause point after
>>       * being reentered, so no job driver code will run before they pause. */
>> -    if (!job->busy || job_is_completed(job)) {
>> -        return false;
>> +    WITH_JOB_LOCK_GUARD() {
>> +        if (!job->busy || job_is_completed_locked(job)) {
>> +            return false;
>> +        }
>>      }
>>  
>>      /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
> 
> Assuming that the job status can actually change, don't we need the
> locking for the rest of the function, too? Otherwise we might call
> drv->drained_poll() for a job that has already paused or completed.
> 
> Of course, this goes against the assumption that all callbacks are
> called without holding the job lock. Maybe it's not a good assumption.
> 
>> @@ -475,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>>      job->ready_notifier.notify = block_job_event_ready;
>>      job->idle_notifier.notify = block_job_on_idle;
>>  
>> -    notifier_list_add(&job->job.on_finalize_cancelled,
>> -                      &job->finalize_cancelled_notifier);
>> -    notifier_list_add(&job->job.on_finalize_completed,
>> -                      &job->finalize_completed_notifier);
>> -    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
>> -    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
>> -    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
>> +    WITH_JOB_LOCK_GUARD() {
>> +        notifier_list_add(&job->job.on_finalize_cancelled,
>> +                          &job->finalize_cancelled_notifier);
>> +        notifier_list_add(&job->job.on_finalize_completed,
>> +                          &job->finalize_completed_notifier);
>> +        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
>> +        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
>> +        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
>> +    }
>>  
>>      error_setg(&job->blocker, "block device is in use by block job: %s",
>>                 job_type_str(&job->job));
> 
> Why is this the right scope for the lock? It looks very arbitrary to
> lock only here, but not for the assignments above or the function calls
> below.
> 
> Given that job_create() already puts the job in the job_list so it
> becomes visible for other code, should we not keep the job lock from the
> moment that we create the job until it is fully initialised?

I try to protect only what needs protection, nothing more. Otherwise
then it is not clear what are we protecting and why. According to the
split I made in job.h, things like job_type_str and whatever I did not
protect are not protected because they don't need the lock.

> 
>> @@ -558,10 +562,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>>                                          action);
>>      }
>>      if (action == BLOCK_ERROR_ACTION_STOP) {
>> -        if (!job->job.user_paused) {
>> -            job_pause(&job->job);
>> -            /* make the pause user visible, which will be resumed from QMP. */
>> -            job->job.user_paused = true;
>> +        WITH_JOB_LOCK_GUARD() {
>> +            if (!job->job.user_paused) {
>> +                job_pause_locked(&job->job);
>> +                /*
>> +                 * make the pause user visible, which will be
>> +                 * resumed from QMP.
>> +                 */
>> +                job->job.user_paused = true;
>> +            }
>>          }
>>          block_job_iostatus_set_err(job, error);
> 
> Why is this call not in the critical section? It accesses job->iostatus.

But the blockjob is not yet "classified". Comes after.
> 
>>      }
>> diff --git a/job-qmp.c b/job-qmp.c
>> index ac11a6c23c..cfaf34ffb7 100644
>> --- a/job-qmp.c
>> +++ b/job-qmp.c
>> @@ -194,7 +194,9 @@ JobInfoList *qmp_query_jobs(Error **errp)
>>      JobInfoList *head = NULL, **tail = &head;
>>      Job *job;
>>  
>> -    for (job = job_next(NULL); job; job = job_next(job)) {
>> +    JOB_LOCK_GUARD();
>> +
>> +    for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
>>          JobInfo *value;
>>          AioContext *aio_context;
> 
> Should job_query_single() be renamed to job_query_single_locked()?

Makes sense
> 
>> diff --git a/job.c b/job.c
>> index ebaa4e585b..b0729e2bb2 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -668,7 +668,7 @@ void coroutine_fn job_pause_point(Job *job)
>>      job_pause_point_locked(job);
>>  }
>>  
>> -void job_yield_locked(Job *job)
>> +static void job_yield_locked(Job *job)
>>  {
>>      assert(job->busy);
> 
> It was already unused outside of job.c before this patch. Should it have
> been static from the start?
> 
>> @@ -1041,11 +1041,14 @@ static void job_completed_txn_abort_locked(Job *job)
>>  /* Called with job_mutex held, but releases it temporarily */
>>  static int job_prepare_locked(Job *job)
>>  {
>> +    int ret;
>> +
>>      GLOBAL_STATE_CODE();
>>      if (job->ret == 0 && job->driver->prepare) {
>>          job_unlock();
>> -        job->ret = job->driver->prepare(job);
>> +        ret = job->driver->prepare(job);
>>          job_lock();
>> +        job->ret = ret;
>>          job_update_rc_locked(job);
>>      }
>>      return job->ret;
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 1ebb89f46c..1897ed7a13 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -133,8 +133,11 @@ void qmp_cont(Error **errp)
>>          blk_iostatus_reset(blk);
>>      }
>>  
>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>> -        block_job_iostatus_reset(job);
>> +    WITH_JOB_LOCK_GUARD() {
>> +        for (job = block_job_next_locked(NULL); job;
>> +             job = block_job_next_locked(job)) {
>> +            block_job_iostatus_reset_locked(job);
>> +        }
>>      }
>>  
>>      /* Continuing after completed migration. Images have been inactivated to
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 4cf4d2423d..98c7662b0f 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **errp)
>>      int ret = 0;
>>  
>>      aio_context_acquire(aio_context);
>> -    job_ref(&job->job);
>> -    do {
>> -        float progress = 0.0f;
>> -        aio_poll(aio_context, true);
>> +    WITH_JOB_LOCK_GUARD() {
>> +        job_ref_locked(&job->job);
>> +        do {
>> +            float progress = 0.0f;
>> +            job_unlock();
> 
> This might be more a question of style, but mixing WITH_JOB_LOCK_GUARD()
> with manual job_unlock()/job_lock() feels dangerous. What if someone
> added a break between the unlock/lock pair? The lock guard would try to
> unlock a mutex that is already unlocked, which probably means an
> assertion failure.
> 
> I feel we should just use manual job_lock()/job_unlock() for everything
> in this function.

As you wish, ok.

> 
>> +            aio_poll(aio_context, true);
>> +
>> +            progress_get_snapshot(&job->job.progress, &progress_current,
>> +                                &progress_total);
>> +            if (progress_total) {
>> +                progress = (float)progress_current / progress_total * 100.f;
>> +            }
>> +            qemu_progress_print(progress, 0);
>> +            job_lock();
>> +        } while (!job_is_ready_locked(&job->job) &&
>> +                 !job_is_completed_locked(&job->job));
>>  
>> -        progress_get_snapshot(&job->job.progress, &progress_current,
>> -                              &progress_total);
>> -        if (progress_total) {
>> -            progress = (float)progress_current / progress_total * 100.f;
>> +        if (!job_is_completed_locked(&job->job)) {
>> +            ret = job_complete_sync_locked(&job->job, errp);
>> +        } else {
>> +            ret = job->job.ret;
>>          }
>> -        qemu_progress_print(progress, 0);
>> -    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
>> -
>> -    if (!job_is_completed(&job->job)) {
>> -        ret = job_complete_sync(&job->job, errp);
>> -    } else {
>> -        ret = job->job.ret;
>> +        job_unref_locked(&job->job);
>>      }
>> -    job_unref(&job->job);
>>      aio_context_release(aio_context);
>>  
>>      /* publish completion progress only when success */
> 

Emanuele


