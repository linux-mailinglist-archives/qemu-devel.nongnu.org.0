Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B1568469
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:59:49 +0200 (CEST)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91oz-0006Go-1x
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o91eK-0007IR-Lb; Wed, 06 Jul 2022 05:48:50 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o91eE-0001rM-VU; Wed, 06 Jul 2022 05:48:46 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 656352E12A7;
 Wed,  6 Jul 2022 12:48:28 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 M4oo4peCEa-mQO8eJQN; Wed, 06 Jul 2022 12:48:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657100907; bh=JF5OspPMvpTIjmVxAwvNcfOsuQCj6ksOKILUlO4WtY4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kQeRaVjzrmMSTVjVI3ivPO9tqHPWM6WVJu6nUYwMNvezL84BUnChFhVURBEFzhPdx
 3msVEFXDjaR7TjI1hDQFloPHC+CpQTUNGdjm8A51+eVqTeuYhdUtWSN8LHJzqlGNbB
 axocu6BGJ6IHO1/kFV85fr7rFfItq9ewJrenlNDQ=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <47f96f9c-d88b-454a-48bf-f87e00e4ad16@yandex-team.ru>
Date: Wed, 6 Jul 2022 12:48:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 06/20] job.h: define functions called without job lock
 held
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
 <20220629141538.3400679-7-eesposit@redhat.com>
 <b96f9001-66d3-3c4e-617b-c515982336de@yandex-team.ru>
 <a015b31a-a195-c146-576b-754517f3614a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <a015b31a-a195-c146-576b-754517f3614a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 7/6/22 11:22, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 05/07/2022 um 12:53 schrieb Vladimir Sementsov-Ogievskiy:
>> On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
>>> These functions don't need a _locked() counterpart, since
>>> they are all called outside job.c and take the lock only
>>> internally.
>>>
>>> Update also the comments in blockjob.c (and move them in job.c).
>>
>> Still, that would be better as a separate patch.
>>
>>>
>>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>>> are *nop*.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>    blockjob.c         | 20 --------------------
>>>    include/qemu/job.h | 37 ++++++++++++++++++++++++++++++++++---
>>>    job.c              | 15 +++++++++++++++
>>>    3 files changed, 49 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/blockjob.c b/blockjob.c
>>> index 4868453d74..7da59a1f1c 100644
>>> --- a/blockjob.c
>>> +++ b/blockjob.c
>>> @@ -36,21 +36,6 @@
>>>    #include "qemu/main-loop.h"
>>>    #include "qemu/timer.h"
>>>    -/*
>>> - * The block job API is composed of two categories of functions.
>>> - *
>>> - * The first includes functions used by the monitor.  The monitor is
>>> - * peculiar in that it accesses the block job list with
>>> block_job_get, and
>>> - * therefore needs consistency across block_job_get and the actual
>>> operation
>>> - * (e.g. block_job_set_speed).  The consistency is achieved with
>>> - * aio_context_acquire/release.  These functions are declared in
>>> blockjob.h.
>>> - *
>>> - * The second includes functions used by the block job drivers and
>>> sometimes
>>> - * by the core block layer.  These do not care about locking, because
>>> the
>>> - * whole coroutine runs under the AioContext lock, and are declared in
>>> - * blockjob_int.h.
>>> - */
>>> -
>>>    static bool is_block_job(Job *job)
>>>    {
>>>        return job_type(job) == JOB_TYPE_BACKUP ||
>>> @@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n,
>>> void *opaque)
>>>    }
>>>      -/*
>>> - * API for block job drivers and the block layer.  These functions are
>>> - * declared in blockjob_int.h.
>>> - */
>>> -
>>>    void *block_job_create(const char *job_id, const BlockJobDriver
>>> *driver,
>>>                           JobTxn *txn, BlockDriverState *bs, uint64_t
>>> perm,
>>>                           uint64_t shared_perm, int64_t speed, int flags,
>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>> index 99960cc9a3..b714236c1a 100644
>>> --- a/include/qemu/job.h
>>> +++ b/include/qemu/job.h
>>> @@ -363,6 +363,7 @@ void job_txn_unref_locked(JobTxn *txn);
>>>      /**
>>>     * Create a new long-running job and return it.
>>> + * Called with job_mutex *not* held.
>>>     *
>>>     * @job_id: The id of the newly-created job, or %NULL for internal jobs
>>>     * @driver: The class object for the newly-created job.
>>> @@ -400,6 +401,8 @@ void job_unref_locked(Job *job);
>>>     * @done: How much progress the job made since the last call
>>>     *
>>>     * Updates the progress counter of the job.
>>> + *
>>> + * Progress API is thread safe.
>>
>> This tell nothing for function user. Finally the whole job_ API will be
>> thread safe, isn't it?
>>
>> I think here we need simply "called with mutex not held". (Or even "may
>> be called with mutex held or not held" if we need it, or just nothing)
>>
>> and note about progress API should be somewhere in job.c, as that's
>> implementation details.
> 
> What about "Progress API is thread safe. Can be called with job mutex
> held or not"?

OK, if you like, that's not critical. Still, I think that after this series the whole job API should be thread safe, which make a comment about progress API misleading: user will think "hmm.. OK, progress related functions are thread safe. Others are not?"

> 
>>
> [...]
>>
>> I'd merge all new comments in job.h to the previous commit, as they are
>> related to the questions risen by it.
> 
> I disagree, I think it will be a mess of functions again if we mix these
> one that don't need the lock held and the ones that need it.
> 
> You understand it because you got the logic of this serie, but others
> may not.
> 

That's not critical.. Why it seems better in one patch for me:

For a patch like 05 I anyway have to review the whole job.c/job.h checking that everything is correct. When I see that something was not updated, it looks like a mistake to me. Than I find missed part in the next commit..


>>
>>
>>>    void job_cancel_sync_all(void);
>>>      /**
>>> diff --git a/job.c b/job.c
>>> index dd44fac8dd..7a3cc93f66 100644
>>> --- a/job.c
>>> +++ b/job.c
>>> @@ -32,12 +32,27 @@
>>>    #include "trace/trace-root.h"
>>>    #include "qapi/qapi-events-job.h"
>>>    +/*
>>> + * The job API is composed of two categories of functions.
>>> + *
>>> + * The first includes functions used by the monitor.  The monitor is
>>> + * peculiar in that it accesses the block job list with job_get, and
>>> + * therefore needs consistency across job_get and the actual operation
>>> + * (e.g. job_user_cancel). To achieve this consistency, the caller
>>> + * calls job_lock/job_unlock itself around the whole operation.
>>> + *
>>> + *
>>> + * The second includes functions used by the block job drivers and
>>> sometimes
>>> + * by the core block layer. These delegate the locking to the callee
>>> instead.
>>> + */
>>> +
>>>    /*
>>>     * job_mutex protects the jobs list, but also makes the
>>>     * struct job fields thread-safe.
>>>     */
>>>    QemuMutex job_mutex;
>>>    +/* Protected by job_mutex */
>>>    static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
>>>      /* Job State Transition Table */
>>
>>
>> So the logic is: the function that doesn't have public _locked
>> counterpart has explicit comment that mutex should be not held. OK.
>>
> 


-- 
Best regards,
Vladimir

