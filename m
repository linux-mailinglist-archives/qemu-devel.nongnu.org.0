Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746D43D7A03
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:41:01 +0200 (CEST)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PCV-0004mJ-VK
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8PB8-0003x5-2O
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m8PB4-0004eB-JE
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627400369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uJW7IaU/yV62EPYfL3+ZEJASsVpipC08zdo2Bq3DNI=;
 b=ES6USt1U212bwtkNOZQOb3xjrKi16Q5E6mY6et1+MZ7h7zw9/HL9ba0OeeuMCUwSm2hjY0
 /3/MyEoQTEBY6rg2LEYzt5sMAHLmmU3A7whYb86me/rMap7fSD1afNamz0/KvMz7nx9clU
 y7JZqbEPYNddFWfWs16Hpi7d7N4HnH8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-Xqis0vu6O-OaJaOR2DGPTA-1; Tue, 27 Jul 2021 11:39:25 -0400
X-MC-Unique: Xqis0vu6O-OaJaOR2DGPTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so1522819wmj.6
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 08:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6uJW7IaU/yV62EPYfL3+ZEJASsVpipC08zdo2Bq3DNI=;
 b=E/ZtfW8cjtWQ70JjrlhbUgboAui3KXAL0+FGlBVdOGczkidhpiI9yWxQBUueCI3YNo
 T9D609ugGulPXGmEqe86NAFFPwrKIxoEG4ajrl6RDr9OKOwqB2B4JBo+Ev7TxrRI09JP
 x3usCTc87Fvai1KjeuVrtrQ1g++LPYWpKKUdFr24+xUvZkzkVa2701LnnAXsI/MlR2qZ
 kwdX77tf4leSiYu8d2+GYg8Eo5U57Gt80gYMgIjsENTl9YnxahSdD0x/muARwWqLvRvU
 DUOrZQrgzLMybOtLuiwzI8SK5re0UWox8S1TkEy299KclWy0v0bS+mduR0NjAJmEA6gg
 Dzmw==
X-Gm-Message-State: AOAM532rtrAVYyo4ZfuCaAB43va4uN8tnn+XpvG03pNiSIicNWVCGXSI
 kARrfzzsQy0sW80jQb8TeHks3FipsRl4T5br9Mnz2vJbN+9qfnjyQbvn9ZaMM0xskBn1rG5O/hk
 Gi7H79lNcVr8WZ3o=
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr22349209wmb.39.1627400364464; 
 Tue, 27 Jul 2021 08:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1K7vq1ACTzx79zrg8UCgQoYvMJgzUFT0AjIilo0oWgpUbtGfaHzET/ZuPBTeLogjOjDLUwg==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr22349178wmb.39.1627400364181; 
 Tue, 27 Jul 2021 08:39:24 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h16sm3622989wre.52.2021.07.27.08.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 08:39:23 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
 <cf6bbb03-b9d6-c24e-3e0b-38d375c855a5@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e8042bf7-713d-26d7-1ba1-502bb566db1f@redhat.com>
Date: Tue, 27 Jul 2021 17:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cf6bbb03-b9d6-c24e-3e0b-38d375c855a5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27.07.21 15:04, Vladimir Sementsov-Ogievskiy wrote:
> 26.07.2021 17:46, Max Reitz wrote:
>> Most callers of job_is_cancelled() actually want to know whether the job
>> is on its way to immediate termination.  For example, we refuse to pause
>> jobs that are cancelled; but this only makes sense for jobs that are
>> really actually cancelled.
>>
>> A mirror job that is cancelled during READY with force=false should
>> absolutely be allowed to pause.  This "cancellation" (which is actually
>> a kind of completion) may take an indefinite amount of time, and so
>> should behave like any job during normal operation.  For example, with
>> on-target-error=stop, the job should stop on write errors.  (In
>> contrast, force-cancelled jobs should not get write errors, as they
>> should just terminate and not do further I/O.)
>>
>> Therefore, redefine job_is_cancelled() to only return true for jobs that
>> are force-cancelled (which as of HEAD^ means any job that interprets the
>> cancellation request as a request for immediate termination), and add
>> job_cancel_request() as the general variant, which returns true for any
>
> job_cancel_requested()
>
>> jobs which have been requested to be cancelled, whether it be
>> immediately or after an arbitrarily long completion phase.
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   include/qemu/job.h |  8 +++++++-
>>   block/mirror.c     | 10 ++++------
>>   job.c              |  7 ++++++-
>>   3 files changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 8aa90f7395..032edf3c5f 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>>   /** Returns true if the job should not be visible to the management 
>> layer. */
>>   bool job_is_internal(Job *job);
>>   -/** Returns whether the job is scheduled for cancellation. */
>> +/** Returns whether the job is being cancelled. */
>>   bool job_is_cancelled(Job *job);
>>   +/**
>> + * Returns whether the job is scheduled for cancellation (at an
>> + * indefinite point).
>> + */
>> +bool job_cancel_requested(Job *job);
>> +
>>   /** Returns whether the job is in a completed state. */
>>   bool job_is_completed(Job *job);
>>   diff --git a/block/mirror.c b/block/mirror.c
>> index e93631a9f6..72e02fa34e 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -936,7 +936,7 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>           /* Transition to the READY state and wait for complete. */
>>           job_transition_to_ready(&s->common.job);
>>           s->actively_synced = true;
>> -        while (!job_is_cancelled(&s->common.job) && 
>> !s->should_complete) {
>> +        while (!job_cancel_requested(&s->common.job) && 
>> !s->should_complete) {
>>               job_yield(&s->common.job);
>>           }
>>           s->common.job.cancelled = false;
>> @@ -1043,7 +1043,7 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>               }
>>                 should_complete = s->should_complete ||
>> -                job_is_cancelled(&s->common.job);
>> +                job_cancel_requested(&s->common.job);
>>               cnt = bdrv_get_dirty_count(s->dirty_bitmap);
>>           }
>>   @@ -1087,7 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, 
>> Error **errp)
>>           trace_mirror_before_sleep(s, cnt, 
>> job_is_ready(&s->common.job),
>>                                     delay_ns);
>>           job_sleep_ns(&s->common.job, delay_ns);
>> -        if (job_is_cancelled(&s->common.job) && 
>> s->common.job.force_cancel) {
>> +        if (job_is_cancelled(&s->common.job)) {
>>               break;
>>           }
>>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>> @@ -1099,9 +1099,7 @@ immediate_exit:
>>            * or it was cancelled prematurely so that we do not 
>> guarantee that
>>            * the target is a copy of the source.
>>            */
>> -        assert(ret < 0 ||
>> -               (s->common.job.force_cancel &&
>> -                job_is_cancelled(&s->common.job)));
>> +        assert(ret < 0 || job_is_cancelled(&s->common.job));

(As a note, I hope this does the job regarding your suggestions for 
patch 4. :))

>>           assert(need_drain);
>>           mirror_wait_for_all_io(s);
>>       }
>> diff --git a/job.c b/job.c
>> index e78d893a9c..dba17a680f 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>>   }
>>     bool job_is_cancelled(Job *job)
>> +{
>> +    return job->cancelled && job->force_cancel;
>
> can job->cancelled be false when job->force_cancel is true ? I think 
> not and worth an assertion here. Something like
>
> if (job->force_cancel) {
>    assert(job->cancelled);
>    return true;
> }
>
> return false;

Sounds good, why not.

>
>> +}
>> +
>> +bool job_cancel_requested(Job *job)
>>   {
>>       return job->cancelled;
>>   }
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
>>
>
> I think it's a correct change, although there may be unexpected 
> side-effects, it's hard to imagine all consequences of changing 
> job_is_cancelled() semantics called in several places in job.c.

Yeah.  Targeting 6.2, I don’t have a bad feeling about it, though.

> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks for the review, by the way!

Max


