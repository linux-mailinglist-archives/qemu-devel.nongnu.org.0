Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B287D3DD399
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:26:54 +0200 (CEST)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAV9p-0006Ib-90
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mAV79-0005DG-CV
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:24:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mAV75-0006js-4H
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627899841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pd2K7V//KRS7bbFEW/UAMmhskMSNq2K4zieKz1jBe8w=;
 b=UnibG3keboJ1wRYBDQCVGwS/ZKkKRno34eqnBt2iczAtMPu93X+TfTJN2itdyNQtWFkU/D
 IrNNfuS4WRFYHivk3Uw9b/x7513Yjl4wnW2xsP+zHdhN5/NjgvtFK1YkXsY76Xc7/bXGbm
 U+B8HP7peOHAWAjg0y/hyeqbyZQywms=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-J-EwGyIWNCyz6BKJ50Tokg-1; Mon, 02 Aug 2021 06:24:00 -0400
X-MC-Unique: J-EwGyIWNCyz6BKJ50Tokg-1
Received: by mail-wm1-f71.google.com with SMTP id
 q188-20020a1ca7c50000b0290241f054d92aso2764494wme.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 03:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Pd2K7V//KRS7bbFEW/UAMmhskMSNq2K4zieKz1jBe8w=;
 b=m/KJSsPzZ9UGzoExVOntom+6haOiUJlBb+cCqJsCASR67F+4sQd7BBlO6kUcn606Tp
 rgrQvX/vAVqjevgEUnrH7OlqDUNp3ANMIkOm+EULX1qxzQAVr6sbm+CWb6XINrmByjVa
 iwM4ciU3TEhzBbkZhaPFKVWOghPsdHtllM/LlR/E/Aci31hPblqdlvIME6JGrp8BRVHH
 COUgECn99wd3hz8YAiqv6VmB1edSNHtFFoQ8X7RTNnQ1Oyyp0VArCcBVenYzFRCor/td
 Wipm0BDeYOALc8gKXBzyUXkfbKIMCbQGEgl0hN3+30gEbpRz+cjteZY7cjGsrBLip4kx
 Ssjw==
X-Gm-Message-State: AOAM532d5pGNZ0Hm2E2dL4KStwQHjm6TpzM4aOig1Hfu+pjXibS+ljhP
 sf2r7yIYEApe4/j9I2Mj1Oc4eKhCqIwwTlPS8k8WTlQcE74FAmIR4YfmS2n4rDYOodjZll/ZQJh
 HhXnJ7qJgZ7ItCvg=
X-Received: by 2002:adf:b30a:: with SMTP id j10mr16158022wrd.43.1627899839086; 
 Mon, 02 Aug 2021 03:23:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3tR0qkYAa/PfKqDkH1stCMy8unDla5S/C3ctPoelxHpSRj9HO1jGj33Wn94ATEwjzV+39iw==
X-Received: by 2002:adf:b30a:: with SMTP id j10mr16158006wrd.43.1627899838750; 
 Mon, 02 Aug 2021 03:23:58 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z2sm9612113wma.45.2021.08.02.03.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 03:23:58 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
 <cf6bbb03-b9d6-c24e-3e0b-38d375c855a5@virtuozzo.com>
 <e8042bf7-713d-26d7-1ba1-502bb566db1f@redhat.com>
 <79105dcc-eaa3-086b-34ed-b66eef584a3b@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6ae8d39e-62cc-bd8c-c78e-d2747eb83715@redhat.com>
Date: Mon, 2 Aug 2021 12:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79105dcc-eaa3-086b-34ed-b66eef584a3b@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.21 17:47, Vladimir Sementsov-Ogievskiy wrote:
> 27.07.2021 18:39, Max Reitz wrote:
>> On 27.07.21 15:04, Vladimir Sementsov-Ogievskiy wrote:
>>> 26.07.2021 17:46, Max Reitz wrote:
>>>> Most callers of job_is_cancelled() actually want to know whether 
>>>> the job
>>>> is on its way to immediate termination.  For example, we refuse to 
>>>> pause
>>>> jobs that are cancelled; but this only makes sense for jobs that are
>>>> really actually cancelled.
>>>>
>>>> A mirror job that is cancelled during READY with force=false should
>>>> absolutely be allowed to pause.  This "cancellation" (which is 
>>>> actually
>>>> a kind of completion) may take an indefinite amount of time, and so
>>>> should behave like any job during normal operation.  For example, with
>>>> on-target-error=stop, the job should stop on write errors. (In
>>>> contrast, force-cancelled jobs should not get write errors, as they
>>>> should just terminate and not do further I/O.)
>>>>
>>>> Therefore, redefine job_is_cancelled() to only return true for jobs 
>>>> that
>>>> are force-cancelled (which as of HEAD^ means any job that 
>>>> interprets the
>>>> cancellation request as a request for immediate termination), and add
>>>> job_cancel_request() as the general variant, which returns true for 
>>>> any
>>>
>>> job_cancel_requested()
>>>
>>>> jobs which have been requested to be cancelled, whether it be
>>>> immediately or after an arbitrarily long completion phase.
>>>>
>>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>   include/qemu/job.h |  8 +++++++-
>>>>   block/mirror.c     | 10 ++++------
>>>>   job.c              |  7 ++++++-
>>>>   3 files changed, 17 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>>> index 8aa90f7395..032edf3c5f 100644
>>>> --- a/include/qemu/job.h
>>>> +++ b/include/qemu/job.h
>>>> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>>>>   /** Returns true if the job should not be visible to the 
>>>> management layer. */
>>>>   bool job_is_internal(Job *job);
>>>>   -/** Returns whether the job is scheduled for cancellation. */
>>>> +/** Returns whether the job is being cancelled. */
>>>>   bool job_is_cancelled(Job *job);
>>>>   +/**
>>>> + * Returns whether the job is scheduled for cancellation (at an
>>>> + * indefinite point).
>>>> + */
>>>> +bool job_cancel_requested(Job *job);
>>>> +
>>>>   /** Returns whether the job is in a completed state. */
>>>>   bool job_is_completed(Job *job);
>>>>   diff --git a/block/mirror.c b/block/mirror.c
>>>> index e93631a9f6..72e02fa34e 100644
>>>> --- a/block/mirror.c
>>>> +++ b/block/mirror.c
>>>> @@ -936,7 +936,7 @@ static int coroutine_fn mirror_run(Job *job, 
>>>> Error **errp)
>>>>           /* Transition to the READY state and wait for complete. */
>>>>           job_transition_to_ready(&s->common.job);
>>>>           s->actively_synced = true;
>>>> -        while (!job_is_cancelled(&s->common.job) && 
>>>> !s->should_complete) {
>>>> +        while (!job_cancel_requested(&s->common.job) && 
>>>> !s->should_complete) {
>>>>               job_yield(&s->common.job);
>>>>           }
>>>>           s->common.job.cancelled = false;
>>>> @@ -1043,7 +1043,7 @@ static int coroutine_fn mirror_run(Job *job, 
>>>> Error **errp)
>>>>               }
>>>>                 should_complete = s->should_complete ||
>>>> -                job_is_cancelled(&s->common.job);
>>>> + job_cancel_requested(&s->common.job);
>>>>               cnt = bdrv_get_dirty_count(s->dirty_bitmap);
>>>>           }
>>>>   @@ -1087,7 +1087,7 @@ static int coroutine_fn mirror_run(Job 
>>>> *job, Error **errp)
>>>>           trace_mirror_before_sleep(s, cnt, 
>>>> job_is_ready(&s->common.job),
>>>>                                     delay_ns);
>>>>           job_sleep_ns(&s->common.job, delay_ns);
>>>> -        if (job_is_cancelled(&s->common.job) && 
>>>> s->common.job.force_cancel) {
>>>> +        if (job_is_cancelled(&s->common.job)) {
>>>>               break;
>>>>           }
>>>>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>>>> @@ -1099,9 +1099,7 @@ immediate_exit:
>>>>            * or it was cancelled prematurely so that we do not 
>>>> guarantee that
>>>>            * the target is a copy of the source.
>>>>            */
>>>> -        assert(ret < 0 ||
>>>> -               (s->common.job.force_cancel &&
>>>> -                job_is_cancelled(&s->common.job)));
>>>> +        assert(ret < 0 || job_is_cancelled(&s->common.job));
>>
>> (As a note, I hope this does the job regarding your suggestions for 
>> patch 4. :))
>>
>>>>           assert(need_drain);
>>>>           mirror_wait_for_all_io(s);
>>>>       }
>>>> diff --git a/job.c b/job.c
>>>> index e78d893a9c..dba17a680f 100644
>>>> --- a/job.c
>>>> +++ b/job.c
>>>> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>>>>   }
>>>>     bool job_is_cancelled(Job *job)
>>>> +{
>>>> +    return job->cancelled && job->force_cancel;
>>>
>>> can job->cancelled be false when job->force_cancel is true ? I think 
>>> not and worth an assertion here. Something like
>>>
>>> if (job->force_cancel) {
>>>    assert(job->cancelled);
>>>    return true;
>>> }
>>>
>>> return false;
>>
>> Sounds good, why not.
>>
>>>
>>>> +}
>>>> +
>>>> +bool job_cancel_requested(Job *job)
>>>>   {
>>>>       return job->cancelled;
>>>>   }
>>>> @@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
>>>>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>>>>           return;
>>>>       }
>>>> -    if (job_is_cancelled(job) || !job->driver->complete) {
>>>> +    if (job_cancel_requested(job) || !job->driver->complete) {
>>>>           error_setg(errp, "The active block job '%s' cannot be 
>>>> completed",
>>>>                      job->id);
>>>>           return;
>>>>
>>>
>>> I think it's a correct change, although there may be unexpected 
>>> side-effects, it's hard to imagine all consequences of changing 
>>> job_is_cancelled() semantics called in several places in job.c.
>
> For example: so we now don't set -ECANCELED in job_update_rc for 
> soft-cancel..
>
> This mean that job_finalize_single() will call job_commit instead of 
> job_abort, and job_commit may do some graph changes, which shouldn't 
> happen for soft-cancel

So the question is when these two conditions come into play.

There are two places that set job->ret to ECANCELED if the job is 
cancelled, namely job_update_rc(), and job_finish_sync().

job_finish_sync() will do so only after the job has been completed, 
which requires the job to either have been aborted (i.e. ret is non-zero 
anyway) or job_completed() to have been called. job_completed() is 
called by job_exit(), which is run after the job’s main loop has 
exited.  If mirror is soft-cancelled, mirror_run() will clear 
s->common.job.cancelled before returning, so job_finish_sync() will not 
see the job as cancelled.

job_update_rc() is called from three places:

job_finalize_single(): Asserts that job_is_completed(), so the same 
reasoning as for job_finish_sync() applies.

job_prepare(): Called by job_do_finalize(), which can only happen when 
the job is completed.  (JobVerbTable only allows finalization when the 
job is PENDING, which is a state where job_is_completed() is true, i.e. 
after mirror_run().)

job_completed(): Same reasoning as for job_finish_sync().


So it looks to me like these places that set job->ret to ECANCELED if 
the job has been cancelled do not consider a soft-cancelled mirror job 
to have been cancelled, which makes using job_is_cancelled() instead of 
job_cancel_requested() correct there. (And most likely, we can drop the 
`.cancelled = false` statements from the mirror job in turn.)

Max


