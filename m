Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA4568842
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 14:26:52 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o947H-0000uJ-Cd
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o944F-00089P-53; Wed, 06 Jul 2022 08:23:43 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:54032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o944A-0006Vu-Lx; Wed, 06 Jul 2022 08:23:41 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2D9122E0DB3;
 Wed,  6 Jul 2022 15:23:28 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 pUsoWUroaz-NPP4KXO0; Wed, 06 Jul 2022 15:23:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657110207; bh=ve//8m/s4rsGO2Rzm7zmV4Y9OHVDnLYZQs8vdJIasXI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=wuJO3bd2APO8+BZfkStNGFrx7P/qUXg/uz8ph0co6hDInwQkCyChE21QOAG5R7G7s
 URMpMUn1CuZT+XCMWgkmGKNPJadTnsOPiJcvwf6dG9j8VnGYsAxCYy91BWrg0auaOh
 vow+1WrrPSuz2P6HngrdJgM6ld1C/OFuXX+rKyn0=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a48ea347-3a44-28c7-b154-ce3dadbae23c@yandex-team.ru>
Date: Wed, 6 Jul 2022 15:23:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 08/20] blockjob.h: introduce block_job _locked() APIs
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-9-eesposit@redhat.com>
 <6c02430a-a8d8-0be3-18b4-1709e601cbf9@yandex-team.ru>
 <95c3dae0-a8dd-1ec6-0ba1-5a4b1e92c1a3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <95c3dae0-a8dd-1ec6-0ba1-5a4b1e92c1a3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/6/22 15:05, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 05/07/2022 um 17:01 schrieb Vladimir Sementsov-Ogievskiy:
>> On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
>>> Just as done with job.h, create _locked() functions in blockjob.h
>>
>> We modify not only blockjob.h, I'd s/blockjob.h/blockjob/ in subject.
>>
>> Also, we start to introduce _locked block_job_* APIs.
>>
>> Does it mean that BlockJob and Job share the global mutex to protect
>> themselves? Than I think we should document in BlockJob struct what is
>> protected by job_mutex.
> 
> There is nothing in the struct (apart from Job) that is protected by the
> job lock. I can add a comment "Protected by job mutex" on top of Job job
> field?

Yes, I think that's worth doing.

Other fields doesn't need the lock?

> 
>>
>> And please, let's be consistent on whether we add or not add "with mutex
>> held" / "with mutex not held" comments. For job API you mostly add it
>> for each function.. Let's do same here? Same for "temporary unlock"
>> comments.
> 
> Where did I miss the mutex lock/unlock comments? Yes I forgot the
> "temporary unlock" thing but apart from that all functions have a
> comment saying if they take the lock or not.

Probably that's my impression because you add some comments in separate patches. OK.

> 
>>
>>>
>>> These functions will be later useful when caller has already taken
>>> the lock. All blockjob _locked functions call job _locked functions.
>>>
>>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>>> are *nop*.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>    blockjob.c               | 52 ++++++++++++++++++++++++++++++++--------
>>>    include/block/blockjob.h | 15 ++++++++++++
>>>    2 files changed, 57 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/blockjob.c b/blockjob.c
>>> index 7da59a1f1c..0d59aba439 100644
>>> --- a/blockjob.c
>>> +++ b/blockjob.c
>>> @@ -44,21 +44,27 @@ static bool is_block_job(Job *job)
>>>               job_type(job) == JOB_TYPE_STREAM;
>>>    }
>>>    -BlockJob *block_job_next(BlockJob *bjob)
>>> +BlockJob *block_job_next_locked(BlockJob *bjob)
>>>    {
>>>        Job *job = bjob ? &bjob->job : NULL;
>>>        GLOBAL_STATE_CODE();
>>>          do {
>>> -        job = job_next(job);
>>> +        job = job_next_locked(job);
>>>        } while (job && !is_block_job(job));
>>>          return job ? container_of(job, BlockJob, job) : NULL;
>>>    }
>>>    -BlockJob *block_job_get(const char *id)
>>> +BlockJob *block_job_next(BlockJob *bjob)
>>>    {
>>> -    Job *job = job_get(id);
>>> +    JOB_LOCK_GUARD();
>>> +    return block_job_next_locked(bjob);
>>> +}
>>> +
>>> +BlockJob *block_job_get_locked(const char *id)
>>> +{
>>> +    Job *job = job_get_locked(id);
>>>        GLOBAL_STATE_CODE();
>>>          if (job && is_block_job(job)) {
>>> @@ -68,6 +74,12 @@ BlockJob *block_job_get(const char *id)
>>>        }
>>>    }
>>>    +BlockJob *block_job_get(const char *id)
>>> +{
>>> +    JOB_LOCK_GUARD();
>>> +    return block_job_get_locked(id);
>>> +}
>>> +
>>>    void block_job_free(Job *job)
>>>    {
>>>        BlockJob *bjob = container_of(job, BlockJob, job);
>>> @@ -256,14 +268,14 @@ static bool job_timer_pending(Job *job)
>>>        return timer_pending(&job->sleep_timer);
>>>    }
>>>    -bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>>> +bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error
>>> **errp)
>>>    {
>>>        const BlockJobDriver *drv = block_job_driver(job);
>>>        int64_t old_speed = job->speed;
>>>          GLOBAL_STATE_CODE();
>>>    -    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
>>> +    if (job_apply_verb_locked(&job->job, JOB_VERB_SET_SPEED, errp) <
>>> 0) {
>>>            return false;
>>>        }
>>>        if (speed < 0) {
>>> @@ -277,7 +289,9 @@ bool block_job_set_speed(BlockJob *job, int64_t
>>> speed, Error **errp)
>>>        job->speed = speed;
>>>          if (drv->set_speed) {
>>> +        job_unlock();
>>>            drv->set_speed(job, speed);
>>> +        job_lock();
>>>        }
>>>          if (speed && speed <= old_speed) {
>>> @@ -285,18 +299,24 @@ bool block_job_set_speed(BlockJob *job, int64_t
>>> speed, Error **errp)
>>>        }
>>>          /* kick only if a timer is pending */
>>> -    job_enter_cond(&job->job, job_timer_pending);
>>> +    job_enter_cond_locked(&job->job, job_timer_pending);
>>>          return true;
>>>    }
>>>    +bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>>> +{
>>> +    JOB_LOCK_GUARD();
>>> +    return block_job_set_speed_locked(job, speed, errp);
>>> +}
>>> +
>>>    int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
>>>    {
>>>        IO_CODE();
>>>        return ratelimit_calculate_delay(&job->limit, n);
>>>    }
>>>    -BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>>> +BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
>>>    {
>>>        BlockJobInfo *info;
>>>        uint64_t progress_current, progress_total;
>>> @@ -320,7 +340,7 @@ BlockJobInfo *block_job_query(BlockJob *job, Error
>>> **errp)
>>>        info->len       = progress_total;
>>>        info->speed     = job->speed;
>>>        info->io_status = job->iostatus;
>>> -    info->ready     = job_is_ready(&job->job),
>>> +    info->ready     = job_is_ready_locked(&job->job),
>>>        info->status    = job->job.status;
>>>        info->auto_finalize = job->job.auto_finalize;
>>>        info->auto_dismiss  = job->job.auto_dismiss;
>>> @@ -333,6 +353,12 @@ BlockJobInfo *block_job_query(BlockJob *job,
>>> Error **errp)
>>>        return info;
>>>    }
>>>    +BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>>> +{
>>> +    JOB_LOCK_GUARD();
>>> +    return block_job_query_locked(job, errp);
>>> +}
>>> +
>>>    static void block_job_iostatus_set_err(BlockJob *job, int error)
>>>    {
>>>        if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>>> @@ -478,7 +504,7 @@ fail:
>>>        return NULL;
>>>    }
>>>    -void block_job_iostatus_reset(BlockJob *job)
>>> +void block_job_iostatus_reset_locked(BlockJob *job)
>>>    {
>>>        GLOBAL_STATE_CODE();
>>>        if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>>> @@ -488,6 +514,12 @@ void block_job_iostatus_reset(BlockJob *job)
>>>        job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
>>>    }
>>>    +void block_job_iostatus_reset(BlockJob *job)
>>> +{
>>> +    JOB_LOCK_GUARD();
>>> +    block_job_iostatus_reset_locked(job);
>>> +}
>>> +
>>>    void block_job_user_resume(Job *job)
>>>    {
>>>        BlockJob *bjob = container_of(job, BlockJob, job);
>>> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
>>> index 6525e16fd5..3959a98612 100644
>>> --- a/include/block/blockjob.h
>>> +++ b/include/block/blockjob.h
>>> @@ -92,6 +92,9 @@ typedef struct BlockJob {
>>>     */
>>>    BlockJob *block_job_next(BlockJob *job);
>>>    +/* Same as block_job_next(), but called with job lock held. */
>>> +BlockJob *block_job_next_locked(BlockJob *job);
>>> +
>>>    /**
>>>     * block_job_get:
>>>     * @id: The id of the block job.
>>> @@ -102,6 +105,9 @@ BlockJob *block_job_next(BlockJob *job);
>>>     */
>>>    BlockJob *block_job_get(const char *id);
>>>    +/* Same as block_job_get(), but called with job lock held. */
>>> +BlockJob *block_job_get_locked(const char *id);
>>> +
>>>    /**
>>>     * block_job_add_bdrv:
>>>     * @job: A block job
>>> @@ -145,6 +151,9 @@ bool block_job_has_bdrv(BlockJob *job,
>>> BlockDriverState *bs);
>>>     */
>>>    bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
>>>    +/* Same as block_job_set_speed(), but called with job lock held. */
>>> +bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error
>>> **errp);
>>> +
>>>    /**
>>>     * block_job_query:
>>>     * @job: The job to get information about.
>>> @@ -153,6 +162,9 @@ bool block_job_set_speed(BlockJob *job, int64_t
>>> speed, Error **errp);
>>>     */
>>>    BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
>>>    +/* Same as block_job_query(), but called with job lock held. */
>>> +BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp);
>>> +
>>>    /**
>>>     * block_job_iostatus_reset:
>>>     * @job: The job whose I/O status should be reset.
>>> @@ -162,6 +174,9 @@ BlockJobInfo *block_job_query(BlockJob *job, Error
>>> **errp);
>>>     */
>>>    void block_job_iostatus_reset(BlockJob *job);
>>>    +/* Same as block_job_iostatus_reset(), but called with job lock
>>> held. */
>>> +void block_job_iostatus_reset_locked(BlockJob *job);
>>> +
>>>    /*
>>>     * block_job_get_aio_context:
>>>     *
>>
>>
> 


-- 
Best regards,
Vladimir

