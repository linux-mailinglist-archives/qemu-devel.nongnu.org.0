Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7EE3E02E5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:16:32 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHh8-0005xG-VP
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBHfp-0005Ap-RM
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBHfn-0002v8-Oc
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628086507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44K5s9kAjRBHFB2IVlL3JZY9b8UjJZRqCA4hXIoEG3Q=;
 b=K8WKWadX9d2P7FMCBF7WnYwyanvyqCd4o2vCep2mFT8OR7tOEa+i8QeQIFJs4dydSn2koo
 GUKYlnpb6IgF7aXDvjhnzglbHOATqdfuwcar+v4fJnXKludNcYrW94kWPEUVswFF45gol3
 sBAnFDq+nWCr8UfdDZFUU6yUzaTqJAY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-jrO66OILMRembH07Uu-yYw-1; Wed, 04 Aug 2021 10:15:06 -0400
X-MC-Unique: jrO66OILMRembH07Uu-yYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 z10-20020adfdf8a0000b02901536d17cd63so871770wrl.21
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=44K5s9kAjRBHFB2IVlL3JZY9b8UjJZRqCA4hXIoEG3Q=;
 b=UgkXAIXhhayDDqqM3LHrIEFB4YqDzUvnrELYHS268bdjX0jS04iHz/ssnU2KNmva68
 n2jlPMlElsYEBbuLsby4vZov64H9EvQcEu+n9zn8vyzZfEjKcA5oyVFK14Cul5QZdImp
 +7iwHdQV7cOGOSV+6my8hgJKHg/CPxJz3U4wM3lFG8d/ZXrVp7csPglc+UCMsL7+psE5
 ZNxApB0xL/GupMRhKD79znzPgmtXoYzVmTTaA8xzG9TKfHgy6KULc3mTEn4QWyd/UNZo
 b1AVubbGSdsodi24Bxm+IOs7+j6Kqs1SJbIW0ssumaUQvlts7Bz9OETkWW7uVRuLvv3+
 Ugug==
X-Gm-Message-State: AOAM531FYgHcgo4lVCJIlx7Fjwth4B6XcXVRs6pVqd0jJD7cPKOX5+bE
 mBIB+uVMBlgJ8N0fPtiNqylsqKpOJiOkvs33B4UIjwXuTGnytF/NcPVt2f2fHigtOQUcUx41t+c
 tIkx5JT+01Bbx3No=
X-Received: by 2002:adf:df12:: with SMTP id y18mr29867275wrl.189.1628086504980; 
 Wed, 04 Aug 2021 07:15:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFKqHsk89kvHc1wpL27pF7Yo4UwlitRqZF8dNR1ZAgSKgei9SwlzWy0L52bx3tv6GuUfmzMg==
X-Received: by 2002:adf:df12:: with SMTP id y18mr29867220wrl.189.1628086504570; 
 Wed, 04 Aug 2021 07:15:04 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:7f32:c875:5231:fdf0])
 by smtp.gmail.com with ESMTPSA id w18sm2951690wrg.68.2021.08.04.07.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 07:15:04 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Kevin Wolf <kwolf@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com> <YQlRzOzXOxeBLb0B@redhat.com>
 <13d07f4b-9659-4576-1757-a7d75f7e16c2@redhat.com>
 <YQptN0CLpV5MN5kb@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ea243456-53c7-9642-529a-20628de4661a@redhat.com>
Date: Wed, 4 Aug 2021 16:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQptN0CLpV5MN5kb@redhat.com>
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
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 pkrempa@redhat.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.21 12:34, Kevin Wolf wrote:
> [ Peter, the question for you is at the end. ]
>
> Am 04.08.2021 um 10:07 hat Max Reitz geschrieben:
>> On 03.08.21 16:25, Kevin Wolf wrote:
>>> Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
>>>> Most callers of job_is_cancelled() actually want to know whether the job
>>>> is on its way to immediate termination.  For example, we refuse to pause
>>>> jobs that are cancelled; but this only makes sense for jobs that are
>>>> really actually cancelled.
>>>>
>>>> A mirror job that is cancelled during READY with force=false should
>>>> absolutely be allowed to pause.  This "cancellation" (which is actually
>>>> a kind of completion) may take an indefinite amount of time, and so
>>>> should behave like any job during normal operation.  For example, with
>>>> on-target-error=stop, the job should stop on write errors.  (In
>>>> contrast, force-cancelled jobs should not get write errors, as they
>>>> should just terminate and not do further I/O.)
>>>>
>>>> Therefore, redefine job_is_cancelled() to only return true for jobs that
>>>> are force-cancelled (which as of HEAD^ means any job that interprets the
>>>> cancellation request as a request for immediate termination), and add
>>>> job_cancel_request() as the general variant, which returns true for any
>>>> jobs which have been requested to be cancelled, whether it be
>>>> immediately or after an arbitrarily long completion phase.
>>>>
>>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>    include/qemu/job.h |  8 +++++++-
>>>>    block/mirror.c     | 10 ++++------
>>>>    job.c              |  7 ++++++-
>>>>    3 files changed, 17 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>>> index 8aa90f7395..032edf3c5f 100644
>>>> --- a/include/qemu/job.h
>>>> +++ b/include/qemu/job.h
>>>> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>>>>    /** Returns true if the job should not be visible to the management layer. */
>>>>    bool job_is_internal(Job *job);
>>>> -/** Returns whether the job is scheduled for cancellation. */
>>>> +/** Returns whether the job is being cancelled. */
>>>>    bool job_is_cancelled(Job *job);
>>>> +/**
>>>> + * Returns whether the job is scheduled for cancellation (at an
>>>> + * indefinite point).
>>>> + */
>>>> +bool job_cancel_requested(Job *job);
>>> I don't think non-force blockdev-cancel for mirror should actually be
>>> considered cancellation, so what is the question that this function
>>> answers?
>>>
>>> "Is this a cancelled job, or a mirror block job that is supposed to
>>> complete soon, but only if it doesn't switch over the users to the
>>> target on completion"?
>> Well, technically yes, but it was more intended as “Has the user ever
>> invoked (block-)job-cancel on this job?”.
> I understand this, but is this much more useful to know than "Has the
> user ever called HMP 'change'?", if you know what I mean?

Hm.  Not really.  It’s still a crutch that shouldn’t be there ideally.

But I like this crutch for this series so I can get this batch done, and 
then worry about all the other bugs that keep popping up (and where 
job_cancel_requested() is a nice sign that something’s off).

>>> Is this ever a reasonable question to ask, except maybe inside the
>>> mirror implementation itself?
>> I asked myself the same for v3, but found two places in job.c where I
>> would like to keep it:
>>
>> First, there’s an assertion in job_completed_txn_abort().  All jobs
>> other than @job have been force-cancelled, and so job_is_cancelled()
>> would be true for them.  As for @job itself, the function is mostly
>> called when the job’s return value is not 0, but a soft-cancelled
>> mirror does have a return value of 0 and so would not end up in that
>> function.
>> But job_cancel() invokes job_completed_txn_abort() if the job has been
>> deferred to the main loop, which mostly correlates with the job having
>> been completed (in which case the assertion is skipped), but not 100 %
>> (there’s a small window between setting deferred_to_main_loop and the
>> job changing to a completed state).
>> So I’d prefer to keep the assertion as-is functionally, i.e. to only
>> check job->cancelled.
> Well, you don't. It's still job_is_cancelled() after this patch.

No: I didn’t. O:)

For v3, I had absolutely planned to use job_cancel_requested(), and I 
wanted to put the above explanation into the commit message.

> So the scenario you're concerned about is a job that has just finished
> successfully (job->ret = 0) and then gets a cancel request?

Yes.

> With force=false, I'm pretty sure the code is wrong anyway because
> calling job_completed_txn_abort() is not the right response.

Absolutely possible, I just didn’t want to deal with this, too… :/

> It should
> return an error because you're trying to complete twice, possibly with
> conflicting completion modes. Second best is just ignoring the cancel
> request because we obviously already fulfilled the request of completing
> the job (the completion mode might be different, though).
>
> With force=true, arguably still letting the job fail is correct.
> However, letting it fail involves more than just letting the transaction
> fail. We would have to call job_update_rc() as well so that instead of
> reporting success for the job, ECANCELED is returned and the job
> transitions to JOB_STATUS_ABORTING (after which job_is_completed()
> returns true).
>
> So, just bugs to be fixed.

Yep.  The question is, when/where; in this series or later?

> After this, I think we could even assert(job->ret != 0 ||
> job->status == JOB_STATUS_PENDING) in job_completed_txn_abort().
> ret == 0 can only happen when called from job_do_finalize(), when the
> job is only failing because other jobs in the same transaction have
> failed in their .prepare callback.

Sounds right.

>> Second, job_complete() refuses to let a job complete that has been
>> cancelled.  This function is basically only invoked by the user
>> (through qmp_block_job_complete()/qmp_job_complete(), or
>> job_complete_sync(), which comes from qemu-img), so I believe that it
>> should correspond to the external interface we have right now; i.e.,
>> if the user has invoked (block-)job-cancel at one point,
>> job_complete() should generally return an error.
> True. But it should also return an error if the user has invoked
> job-complete at some point. The distinction between complete and
> non-force cancel doesn't make sense there.

Yes, that’s true, it’s just that having double complete be a failure 
would be a change in behavior, and it would require another patch. Which 
is why I didn’t do it.

> And cancelling with force=false should fail, too, when either job-cancel
> or job-complete was called for the job before.

Yes.  At least for force=true, force=false is just a no-op, I believe.  
(.force_cancel is never reset to false.)

I’d like to defer this for the design series that Vladimir is planning 
to write, though.

>>> job_complete() is the only function outside of mirror that seems to use
>>> it. But even there, it feels wrong to make a difference. Either we
>>> accept redundant completion requests, or we don't. It doesn't really
>>> matter how the job reconfigures the graph on completion. (Also, I feel
>>> this should really have been part of the state machine, but I'm not sure
>>> if we want to touch it now...)
>> Well, yes, I don’t think it makes a difference because I don’t think
>> anyone will first tell the job via block-job-cancel to complete
>> without pivoting, and then change their mind and call
>> block-job-complete after all.  (Not least because that’s an error
>> pre-series.)
> Right, I'm just arguing that we shouldn't allow the opposite order
> either. Currently I think we do, and it's buggy, as explained above.

I agree.

>> Also, I’m not even sure whether completing after a soft cancel request
>> works.  I don’t think any of our code accounts for such a case, so I’d
>> rather avoid allowing it if there’s no need to allow it anyway.
> Yes, definitely avoid it. We should allow only one completion request
> (be it with job-complete or block-job-cancel) and return an error for
> all future completion requests for the same job.
>
> We could in theory keep allowing redundant completion requests when the
> completion mode doesn't conflict, but I don't see the point of that.

OK.  I personally think this need not be part of this series, though, so 
I’d like to defer it for now. O:)

(And since Vladimir is planning on turning soft cancel into a completion 
mode, I think we’re unlikely to forget about the problem.)

> Unless libvirt can actually issue multiple completion requests (again,
> this includes both (block-)job-complete and non-force block-job-cancel
> for mirror) for the same block job - Peter, I hope it doesn't?
>
> Kevin
>


