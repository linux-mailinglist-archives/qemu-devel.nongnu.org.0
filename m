Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D673D53A6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 09:13:44 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7uo2-0006ZV-Oh
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 03:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m7ujn-0000oT-9J
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m7ujj-0003nn-Gi
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627283353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AC5sh76fji9HnI4qCN/z2UOCFxrDlsrik8pBs+C3jvk=;
 b=Qdh+fo63UfZT9u1zs0FF97UI5R4+Qk/Yjm37PG3CSKeu+7ivPm1XdqDd2wpjeM+I0AGT6f
 8a/76a/YtNi+1Vr2Ae+zPLt1o2HX7BZYr17WlhZM+cphqD3j/vy8zcXTMd2nUxV3b9AhJu
 EegXPXaYflJLlQ0jMgtdJdh/CgBwoYk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-pfZD6gvFMbuuyawVCYhiyw-1; Mon, 26 Jul 2021 03:09:12 -0400
X-MC-Unique: pfZD6gvFMbuuyawVCYhiyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r2-20020a05600c35c2b029023a3f081487so2802881wmq.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 00:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AC5sh76fji9HnI4qCN/z2UOCFxrDlsrik8pBs+C3jvk=;
 b=oUPXNGeVdu6QGfKk6PJaTUSSUl6rtvBSsTSjwDEgWesnEklPz8oaYm7+5UUU3zt3f5
 UNngN1gztjH8c9wAg6xyVcgVl62pCc8tTSNty5v1pEWftbDDIFiYLCecKjz+u1+acFfG
 DQwu7l5lKkGL1BKkWOL/DUolK+5nnitAuzVsWBTG3AOUNbGyg4ZaHlUdKPjyLr2LpLGj
 bYuNg55aF4ZpNj3rMbkl9PP51kK6d1q0Yjxdv1Msvi72tyTQbN4R9ZfkJlacXdE1kLGg
 YqX/nhYYfeNGUrx5gyIDo0dIDe5T4VNTT18xkKLO5cvT6eClV/G4MLqFszrga2ggu+v6
 3xLw==
X-Gm-Message-State: AOAM530KVJMI0d7Z/ZJZRuqjSDT6pmWIm0Pe+kAbcIUOUNktMIZSBLmw
 O0nReZnwQ3GtcNIOWkeN/kcxphoHu3SjYson95lBi1r6L/hnHv8XYj5YiKpQMGZsf2rCC1AR9Uy
 h4xDFk62D60ruzUs=
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr17977094wru.311.1627283351179; 
 Mon, 26 Jul 2021 00:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxub6ZdynZTHd/vZa1CUbbijAZ7mEOfaAmlJNgayT2076bpTf5P52GI/tLeCnATNffThR1oow==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr17977063wru.311.1627283350894; 
 Mon, 26 Jul 2021 00:09:10 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e6sm48631400wrg.18.2021.07.26.00.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:09:10 -0700 (PDT)
Subject: Re: [PATCH for-6.1? 4/6] job: Add job_cancel_requested()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-5-mreitz@redhat.com>
 <a6a675f1-4ca3-a657-9fe0-35b73a6f441a@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <32463d65-834c-64ba-aab4-36f1810ddb43@redhat.com>
Date: Mon, 26 Jul 2021 09:09:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a6a675f1-4ca3-a657-9fe0-35b73a6f441a@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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

On 22.07.21 19:58, Vladimir Sementsov-Ogievskiy wrote:
> 22.07.2021 15:26, Max Reitz wrote:
>> Most callers of job_is_cancelled() actually want to know whether the job
>> is on its way to immediate termination.  For example, we refuse to pause
>> jobs that are cancelled; but this only makes sense for jobs that are
>> really actually cancelled.
>>
>> A mirror job that is cancelled during READY with force=false should
>> absolutely be allowed to pause.  This "cancellation" (which is actually
>> a kind of completion) 
>
> You have to repeat that this "cancel" is not "cancel".
>
> So, the whole problem is that feature of mirror, on cancel in READY 
> state do not cancel but do some specific kind of completion.
>
> You try to make this thing correctly handled on generic layer..
>
> Did you consider instead just drop the feature from generic layer? So 
> that all *cancel* functions always do force-cancel. Then the internal 
> implementation become a lot clearer.

Yes, I considered that, and I’ve decided against it (for now), because 
such a change would obviously be an incompatible change.  It would 
require a deprecation period, and so we would need to fix this bug now 
anyway.

> But we have to support the qmp block-job-cancel of READY mirror (and 
> commit) with force=false.
>
> We can do it as an exclusion in qmp_block_job_cancel, something like:
>
> if (job is mirror or commit AND it's ready AND force = false)
>    mirror_soft_cancel(...);
> else
>    job_cancel(...);

I didn’t consider such a hack, though.  I don’t like it.  If we think 
that we should change our approach because mirror’s soft cancel is 
actually a completion mode, and the current situation is too confusing, 
such a change should be user-visible, too.  (I think there was this idea 
of having job-specific flags or parameters you could change at runtime, 
and so you’d just change the “pivot” parameter between true or false.)

Also, I don’t know whether this would really make anything “a lot” 
easier.  After this series job_is_cancelled() already tells the true 
story, so all we could really change is to drop force_cancel and unify 
the “s->should_complete || job_cancel_requested()” conditions in 
block/mirror.c into one variable.  So when I considered making cancel 
exclusively force-cancel jobs, I thought it wouldn’t actually be worth 
it in practice.

>> may take an indefinite amount of time, and so
>> should behave like any job during normal operation.  For example, with
>> on-target-error=stop, the job should stop on write errors.  (In
>> contrast, force-cancelled jobs should not get write errors, as they
>> should just terminate and not do further I/O.)
>>
>> Therefore, redefine job_is_cancelled() to only return true for jobs that
>> are force-cancelled (which as of HEAD^ means any job that interprets the
>> cancellation request as a request for immediate termination), and add
>> job_cancel_request() as the general variant, which returns true for any
>> jobs which have been requested to be cancelled, whether it be
>> immediately or after an arbitrarily long completion phase.
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>
> [..]
>
>> --- a/job.c
>> +++ b/job.c
>> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>>   }
>>     bool job_is_cancelled(Job *job)
>> +{
>> +    return job->cancelled && job->force_cancel;
>> +}
>> +
>> +bool job_cancel_requested(Job *job)
>>   {
>>       return job->cancelled;
>>   }
>> @@ -650,7 +655,7 @@ static void job_conclude(Job *job)
>>     static void job_update_rc(Job *job)
>>   {
>> -    if (!job->ret && job_is_cancelled(job)) {
>> +    if (!job->ret && job_cancel_requested(job)) {
>
> Why not job_is_cancelled() here?
>
> So in case of mirror other kind of completion we set ret to -ECANCELED?

I thought the return value is a user-visible thing, so I left it as-is.

Seems I was wrong, more below.

>>           job->ret = -ECANCELED;
>>       }
>>       if (job->ret) {
>> @@ -704,7 +709,7 @@ static int job_finalize_single(Job *job)
>>         /* Emit events only if we actually started */
>>       if (job_started(job)) {
>> -        if (job_is_cancelled(job)) {
>> +        if (job_cancel_requested(job)) {
>>               job_event_cancelled(job);
>
> Same question here.. Shouldn't mirror report COMPLETED event in case 
> of not-force cancelled in READY state?

Same here, I thought this is user-visible, nothing internal, so I should 
leave it as-is.

Now I see that cancelling mirror post-READY indeed should result in a 
COMPLETED event.  So I’m actually not exactly sure how mirror does that, 
despite this code here (which functionally isn’t changed by this patch), 
but it’s absolutely true that job_is_cancelled() would be more 
appropriate here.

(No iotest failed, so I thought this change was right.  Well.)

>>           } else {
>>               job_event_completed(job);
>> @@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
>>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>>           return;
>>       }
>> -    if (job_is_cancelled(job) || !job->driver->complete) {
>> +    if (job_cancel_requested(job) || !job->driver->complete) {
>>           error_setg(errp, "The active block job '%s' cannot be 
>> completed",
>>                      job->id);
>>           return;
>> @@ -1043,7 +1048,7 @@ int job_finish_sync(Job *job, void 
>> (*finish)(Job *, Error **errp), Error **errp)
>>       AIO_WAIT_WHILE(job->aio_context,
>>                      (job_enter(job), !job_is_completed(job)));
>>   -    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : 
>> job->ret;
>> +    ret = (job_cancel_requested(job) && job->ret == 0) ? -ECANCELED 
>> : job->ret;

So here it should probably stay a job_is_cancelled(), too.

Max

>>       job_unref(job);
>>       return ret;
>>   }
>>
>
>


