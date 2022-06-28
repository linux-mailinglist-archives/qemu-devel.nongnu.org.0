Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CE55C066
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:50:56 +0200 (CEST)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68o3-00033Y-3z
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o68kg-00026D-Ti; Tue, 28 Jun 2022 06:47:28 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:60436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o68ka-0005FM-Sv; Tue, 28 Jun 2022 06:47:25 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id EEBEB2E2077;
 Tue, 28 Jun 2022 13:47:09 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 LP48UMs2pc-l8JuXJMH; Tue, 28 Jun 2022 13:47:09 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656413229; bh=CtGx/GoClcUC/MvOpsOQyO2MsAIZYW8eYr7EHclhgdk=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=RwXc/+wwa/tDhgfamAF/kvTsgPYu/n8MoPhH7naovyC3WpY40ks8tdsujMInMnE8t
 E4wR17gM4El72FKAtw1rGPzXr5z+E21wvMpR9cpNoDJjRW1H3ONvCt5pnqr7ouYDNV
 xZ6JbfvLcczqcUEgYvg0/EN/H6JBBYRAOi26OBvk=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b686::1:1f] (unknown
 [2a02:6b8:b081:b686::1:1f])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vTnXDz6t0t-l7MSfQ0I; Tue, 28 Jun 2022 13:47:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <98558a3e-3bd6-40b0-07da-1d022dfb0c0c@yandex-team.ru>
Date: Tue, 28 Jun 2022 13:47:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-11-eesposit@redhat.com>
 <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
 <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
 <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
 <8248df6b-3b48-6e09-5a5e-021cf65041dd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <8248df6b-3b48-6e09-5a5e-021cf65041dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/28/22 10:40, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 22/06/2022 um 20:38 schrieb Vladimir Sementsov-Ogievskiy:
>> On 6/22/22 17:26, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> Am 21/06/2022 um 19:26 schrieb Vladimir Sementsov-Ogievskiy:
>>>> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>>>>> With the*nop*  job_lock/unlock placed, rename the static
>>>>> functions that are always under job_mutex, adding "_locked" suffix.
>>>>>
>>>>> List of functions that get this suffix:
>>>>> job_txn_ref           job_txn_del_job
>>>>> job_txn_apply           job_state_transition
>>>>> job_should_pause       job_event_cancelled
>>>>> job_event_completed       job_event_pending
>>>>> job_event_ready           job_event_idle
>>>>> job_do_yield           job_timer_not_pending
>>>>> job_do_dismiss           job_conclude
>>>>> job_update_rc           job_commit
>>>>> job_abort           job_clean
>>>>> job_finalize_single       job_cancel_async
>>>>> job_completed_txn_abort       job_prepare
>>>>> job_needs_finalize       job_do_finalize
>>>>> job_transition_to_pending  job_completed_txn_success
>>>>> job_completed           job_cancel_err
>>>>> job_force_cancel_err
>>>>>
>>>>> Note that "locked" refers to the*nop*  job_lock/unlock, and not
>>>>> real_job_lock/unlock.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
>>>>
>>>>
>>>> Hmm. Maybe it was already discussed.. But for me it seems, that it would
>>>> be simpler to review previous patches, that fix job_ API users to use
>>>> locking properly, if this renaming go earlier.
>>>>
>>>> Anyway, in this series, we can't update everything at once. So patch to
>>>> patch, we make the code more and more correct. (yes I remember that
>>>> lock() is a noop, but I should review thinking that it real, otherwise,
>>>> how to review?)
>>>>
>>>> So, I'm saying about formal correctness of using lock() unlock()
>>>> function in connection with introduced _locked prifixes and in
>>>> connection with how it should finally work.
>>>>
>>>> You do:
>>>>
>>>> 05. introduce some _locked functions, that just duplicates, and
>>>> job_pause_point_locked() is formally inconsistent, as I said.
>>>>
>>>> 06. Update a lot of places, to give them their final form (but not
>>>> final, as some functions will be renamed to _locked, some not, hard to
>>>> imagine)
>>>>
>>>> 07,08,09. Update some more, and even more places. very hard to track
>>>> formal correctness of using locks
>>>>
>>>> 10-...: rename APIs.
>>>>
>>>>
>>>> What do you think about the following:
>>>>
>>>> 1. Introduce noop lock, and some internal _locked() versions, and keep
>>>> formal consistency inside job.c, considering all public interfaces as
>>>> unlocked:
>>>>
>>>>    at this point:
>>>>     - everything correct inside job.c
>>>>     - no public interfaces with _locked prefix
>>>>     - all public interfaces take mutex internally
>>>>     - no external user take mutex by hand
>>>>
>>>> We can rename all internal static functions at this step too.
>>>>
>>>> 2. Introduce some public _locked APIs, that we'll use in next patches
>>>>
>>>> 3. Now start fixing external users in several patches:
>>>>       - protect by mutex direct use of job fields
>>>>     - make wider locks and move to _locked APIs inside them where needed
>>>>
>>>>
>>>> In this scenario, every updated unit becomes formally correct after
>>>> update, and after all steps everything is formally correct, and we can
>>>> move to turning-on the mutex.
>>>>
>>>
>>> I don't understand your logic also here, sorry :(
>>>
>>> I assume you want to keep patch 1-4, then the problem is assing job_lock
>>> and renaming functions in _locked.
>>> So I would say the problem is in patch 5-6-10-11-12-13. All the others
>>> should be self contained.
>>>
>>> I understand patch 5 is a little hard to follow.
>>>
>>> Now, I am not sure what you propose here but it seems that the end goal
>>> is to just have the same result, but with additional intermediate steps
>>> that are just "do this just because in the next patch will be useful".
>>> I think the problem is that we are going to miss the "why we need the
>>> lock" logic in the patches if we do so.
>>>
>>> The logic I tried to convey in this order is the following:
>>> - job.h: add _locked duplicates for job API functions called with and
>>> without job_mutex
>>>      Just create duplicates of functions
>>>
>>> - jobs: protect jobs with job_lock/unlock
>>>      QMP and monitor functions call APIs that assume lock is taken,
>>>      drivers must take explicitly the lock
>>>
>>> - jobs: rename static functions called with job_mutex held
>>> - job.h: rename job API functions called with job_mutex held
>>> - block_job: rename block_job functions called with job_mutex held
>>>      *given* that some functions are always under lock, transform
>>>      them in _locked. Requires the job_lock/unlock patch
>>>
>>> - job.h: define unlocked functions
>>>      Comments on the public functions that are not _locked
>>>
>>>
>>> @Kevin, since you also had some feedbacks on the patch ordering, do you
>>> agree with this ordering or you have some other ideas?
>>>
>>> Following your suggestion, we could move patches 10-11-12-13 before
>>> patch 6 "jobs: protect jobs with job_lock/unlock".
>>>
>>> (Apologies for changing my mind, but being the second complain I am
>>> starting to reconsider reordering the patches).
>>>
>>
>> In two words, what I mean: let's keep the following invariant from patch
>> to patch:
>>
>> 1. Function that has _locked() prefix is always called with lock held
>> 2. Function that has _locked() prefix never calls functions that take
>> lock by themselves so that would dead-lock
>> 3. Function that is documented as "called with lock not held" is never
>> called with lock held
>>
>> That what I mean by "formal correctness": yes, we know that lock is
>> noop, but still let's keep code logic to correspond function naming and
>> comments that we add.
>>
>>
> 
> Ok so far I did the following:
> 
> - duplicated each public function as static {function}_locked()

They shouldn't be duplicates: function without _locked suffix should take the mutex.

> - made sure all functions in job.c call only _locked() functions, since
> the lock is always taken internally
> 
> Now, we need to do the same also for blockjob API in blockjob.h
> The only problem is that in order to use and create functions like
> block_job_get_locked(), we need:
> - job_get_locked() to be public, and can't be just replacing job_get()
> because it is still used everywhere
> - block_job_get_locked() to be public too, since it is used in other
> files like blockdev.c
> 
> so we will have:
> Job *job_get()
> Job *job_get_locked()
> 
> BlockJob *block_job_get(const char *id)
> BlockJob *block_job_get_locked(const char *id)
> 
> 
> Therefore with this approach I need to make all _locked() functions
> public, duplicating the API. Is that what you want?
> 

I don't see any problem in it. After the whole update we can drop public APIs that are unused.


-- 
Best regards,
Vladimir

