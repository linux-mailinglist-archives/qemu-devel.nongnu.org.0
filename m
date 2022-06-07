Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352554000E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:31:24 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZIp-0006lN-4f
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZG6-0005JR-T2
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZG3-0008Bf-Ic
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654608510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pSif80N9AuD+E7v2YCuPaCV9ABrssjzv/aPpW78S/MQ=;
 b=Nib/fFrG8WnV2AicKYGEfrOoBBaPbdsq6bszWT37apZRBUz5Wr5Fr3x7a81EHpYxKmnbB7
 w0PbbuxQkJ+hQUPSqMZeC6NGcCPlwx89BXOJ0ru/5pEHGKc6gk6Q6pTk2mfuhx9unBzOtg
 s0zz3mD0A0OPUuDAF7H1IqjgtfACF+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-KE71WA7HMWSBdBVeJWwjnA-1; Tue, 07 Jun 2022 09:28:29 -0400
X-MC-Unique: KE71WA7HMWSBdBVeJWwjnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso1159133wmi.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 06:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pSif80N9AuD+E7v2YCuPaCV9ABrssjzv/aPpW78S/MQ=;
 b=zzYKF+3yddOLMrJMyqfca5IoK3igVwlzqy4qLAnSYvC4larjavAlkgPQqXUU1K/BXq
 YjAG5ZwKZ2uAQ+i5WoHEJ6Pcs2yuw/6XK/ARyb0OLWBxYNqyat+d6jdRlqkcwEUCwuoJ
 Q0RvCTcSW6HXD4IB6pLZ3PE5a9U3rkGtEY9SuxBw5c63Yt9/oOZ0invvGjvm7uL4KCxk
 Uql3JDqoQICUyzV4/Z5pSo5bF2OWpxsHf3LUhjPfxUQLP4uLBB+P/Oc8pOpAxDRqFpY2
 eQhamw+ubf4kYqaMiHBDIwXUggiGNTu8WotIneKWTTaqNBbqN7TjQdtliy4yCroXGNG2
 Omlg==
X-Gm-Message-State: AOAM530jtJynkmiXWBHRbW2gahP2dFYGmdBONt6wKhNyveSPJjlzZnec
 2jbjjp2uyWYjHYcku7EOda6sSIcfvuM0VRbWsm7MO1Ud/I1mf2hOdCDqsQFeycxIg4kghGS4nUv
 QIMoIO7moYXcP5MU=
X-Received: by 2002:a05:6000:156c:b0:218:5691:e72b with SMTP id
 12-20020a056000156c00b002185691e72bmr1103510wrz.95.1654608508495; 
 Tue, 07 Jun 2022 06:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymqjdkQZpbTdwFff8jZy4g6Jio89Xt56M+EiYdYzQt2iwEueFIIEatjZF9QR+wvhqFDqE8FA==
X-Received: by 2002:a05:6000:156c:b0:218:5691:e72b with SMTP id
 12-20020a056000156c00b002185691e72bmr1103477wrz.95.1654608508220; 
 Tue, 07 Jun 2022 06:28:28 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 t187-20020a1c46c4000000b0039c45fc58c4sm10933954wma.21.2022.06.07.06.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 06:28:27 -0700 (PDT)
Message-ID: <c92bafb4-63e4-e748-c529-64adb1fa28b8@redhat.com>
Date: Tue, 7 Jun 2022 15:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 15/18] job: detect change of aiocontext within job
 coroutine
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-16-eesposit@redhat.com> <Ypo915liDsISLwuW@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ypo915liDsISLwuW@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 03/06/2022 um 18:59 schrieb Kevin Wolf:
> Am 14.03.2022 um 14:37 hat Emanuele Giuseppe Esposito geschrieben:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> We want to make sure access of job->aio_context is always done
>> under either BQL or job_mutex. The problem is that using
>> aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
>> makes the coroutine immediately resume, so we can't hold the job lock.
>> And caching it is not safe either, as it might change.
>>
>> job_start is under BQL, so it can freely read job->aiocontext, but
>> job_enter_cond is not. In order to fix this, use aio_co_wake():
>> the advantage is that it won't use job->aiocontext, but the
>> main disadvantage is that it won't be able to detect a change of
>> job AioContext.
>>
>> Calling bdrv_try_set_aio_context() will issue the following calls
>> (simplified):
>> * in terms of  bdrv callbacks:
>>   .drained_begin -> .set_aio_context -> .drained_end
>> * in terms of child_job functions:
>>   child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
>> * in terms of job functions:
>>   job_pause_locked -> job_set_aio_context -> job_resume_locked
>>
>> We can see that after setting the new aio_context, job_resume_locked
>> calls again job_enter_cond, which then invokes aio_co_wake(). But
>> while job->aiocontext has been set in job_set_aio_context,
>> job->co->ctx has not changed, so the coroutine would be entering in
>> the wrong aiocontext.
>>
>> Using aio_co_schedule in job_resume_locked() might seem as a valid
>> alternative, but the problem is that the bh resuming the coroutine
>> is not scheduled immediately, and if in the meanwhile another
>> bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
>> test-block-iothread.c), we would have the first schedule in the
>> wrong aiocontext, and the second set of drains won't even manage
>> to schedule the coroutine, as job->busy would still be true from
>> the previous job_resume_locked().
>>
>> The solution is to stick with aio_co_wake(), but then detect every time
>> the coroutine resumes back from yielding if job->aio_context
>> has changed. If so, we can reschedule it to the new context.
>>
>> Check for the aiocontext change in job_do_yield_locked because:
>> 1) aio_co_reschedule_self requires to be in the running coroutine
>> 2) since child_job_set_aio_context allows changing the aiocontext only
>>    while the job is paused, this is the exact place where the coroutine
>>    resumes, before running JobDriver's code.
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  job.c | 24 +++++++++++++++++++++---
>>  1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/job.c b/job.c
>> index 89c0e6bed9..10a5981748 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -543,11 +543,12 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>>          return;
>>      }
>>  
>> -    assert(!job->deferred_to_main_loop);
> 
> Why doesn't this assertion hold true any more?

Theoretically this is useless, since we are in the same critical section
once the new lock is used, right? I don't recall any other reason, I
will restore it, if I need to respin (depends on what we decide in the
other patches feedback you provided)

Thank you,
Emanuele

> 
>>      timer_del(&job->sleep_timer);
>>      job->busy = true;
>>      real_job_unlock();
>> -    aio_co_enter(job->aio_context, job->co);
>> +    job_unlock();
>> +    aio_co_wake(job->co);
>> +    job_lock();
>>  }
>>  
>>  void job_enter(Job *job)
>> @@ -568,6 +569,8 @@ void job_enter(Job *job)
>>   */
>>  static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>>  {
>> +    AioContext *next_aio_context;
>> +
>>      real_job_lock();
>>      if (ns != -1) {
>>          timer_mod(&job->sleep_timer, ns);
>> @@ -579,6 +582,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>>      qemu_coroutine_yield();
>>      job_lock();
>>  
>> +    next_aio_context = job->aio_context;
>> +    /*
>> +     * Coroutine has resumed, but in the meanwhile the job AioContext
>> +     * might have changed via bdrv_try_set_aio_context(), so we need to move
>> +     * the coroutine too in the new aiocontext.
>> +     */
>> +    while (qemu_get_current_aio_context() != next_aio_context) {
>> +        job_unlock();
>> +        aio_co_reschedule_self(next_aio_context);
>> +        job_lock();
>> +        next_aio_context = job->aio_context;
>> +    }
>> +
>> +
> 
> Extra empty line.
> 
>>      /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
>>      assert(job->busy);
>>  }
>> @@ -680,7 +697,6 @@ void job_resume_locked(Job *job)
>>      if (job->pause_count) {
>>          return;
>>      }
>> -
>>      /* kick only if no timer is pending */
>>      job_enter_cond_locked(job, job_timer_not_pending_locked);
>>  }
> 
> This hunk looks unrelated.
> 
> Kevin
> 


