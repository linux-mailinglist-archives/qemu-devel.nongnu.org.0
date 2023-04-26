Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A76EF017
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:18:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praLQ-0005Mg-BG; Wed, 26 Apr 2023 04:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1praLM-0005Lx-0S
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1praLJ-0001pR-Az
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682497056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxRSuAXk9GJgD1bdT1s2G0Du30ZIfj1skBgccO1vre0=;
 b=f7pgdCtfP0PXOYNXPLZ0EKEObLeChkjCQyGVdqiTCPfjnqJ8tuzuE9Zr8FWzvmH68U03UR
 D+GASbBfD6Sqk/fc9lXEgeu2zLCR86p91s+tdqE/xiPkDzmuncTMHLscv2A03x+8CconH3
 OYt0FU85F04RHd/SJD9grz0YAmQId1g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-Rf6ooB4UNMmxeippi6TZDg-1; Wed, 26 Apr 2023 04:17:35 -0400
X-MC-Unique: Rf6ooB4UNMmxeippi6TZDg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74df1fa3064so536755285a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 01:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682497053; x=1685089053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nxRSuAXk9GJgD1bdT1s2G0Du30ZIfj1skBgccO1vre0=;
 b=i/y4KAxhTDCwVLGmnhea8JRL6lOjkK3+J4clJYMELiVxDLBnjpZtu4IsyNy3Zvzkc0
 px7cwLH5ebypDQs9muCsEnjJpP234YpP7Ko0J6DG37caqCCHh63Euabq8PqHE2gHWSBh
 PwIxtvdFSxMXW+WqgzEgnkggBLHmGVxzkpzpMUASsWhgbQSZvwfFIV+tYhm4uxyq0jpC
 qxWo3jH9MrtNDGsn2/EeNKk/2UcVprNb71cfu54w4zsmn8HnqFjNRqkEVCYHcMDVDzRS
 96xxqjRd+nT7piNxS+RYcClDFxY9IxJ3RrK06Zx9P3PRPH2WOuUP0ncLJ76wgLaWJRUi
 RzdQ==
X-Gm-Message-State: AAQBX9fqN6+SYXSaAoftLfAeXNRQnPlWy8TF6FrGie+k5BD2QTmlz3fK
 i/Pie5MMsEkji3h8uD93Mou8xQqjqdqZTqe2W1oWZbz7fBYtBru1uA9J6WI8LmcGQzOTjubI2C5
 GzzbOIXMmLT0P/5k=
X-Received: by 2002:a05:6214:407:b0:60d:a251:9e60 with SMTP id
 z7-20020a056214040700b0060da2519e60mr24424310qvx.32.1682497053380; 
 Wed, 26 Apr 2023 01:17:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aJyLTFjYp5aDHRWesP+kaejCLyhHE1bYV8NTcyhe9HuyKxYkidL8PRyz+oVZINaR6XYzeQ7Q==
X-Received: by 2002:a05:6214:407:b0:60d:a251:9e60 with SMTP id
 z7-20020a056214040700b0060da2519e60mr24424288qvx.32.1682497053031; 
 Wed, 26 Apr 2023 01:17:33 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a081000b007441b675e81sm4958375qks.22.2023.04.26.01.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 01:17:32 -0700 (PDT)
Message-ID: <74971238-70e5-7ffb-71da-6ccb5c8b1506@redhat.com>
Date: Wed, 26 Apr 2023 10:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
Content-Language: de-CH
To: Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Alberto Garcia <berto@igalia.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
 <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
 <CAFEAcA-n+9N+0ZuE6MSD1aMBeGYAJTbQe=j1-2K=SgD_Ly6nEA@mail.gmail.com>
 <df71d7b5-7723-eaff-3dcd-45f69186f6af@redhat.com>
 <68834b18-1fab-ca2a-d131-71f75fc374a1@yandex-team.ru>
 <e6eb754e-a825-f113-a9a7-0ca2006a00c6@redhat.com>
 <f3f2e92c-d357-4fb9-e765-7f89dc895247@yandex-team.ru>
 <78ad8ed0-e68a-5f4e-9627-454f0bd007fb@redhat.com>
 <817ea28a-3fe8-d92e-5404-6bafc33fa67c@redhat.com>
 <260c2fc7-df11-1de4-c0d3-fa5697d6a125@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <260c2fc7-df11-1de4-c0d3-fa5697d6a125@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 26/04/2023 um 10:03 schrieb Hanna Czenczek:
> On 26.04.23 09:38, Emanuele Giuseppe Esposito wrote:
>>
>> Am 25/04/2023 um 18:48 schrieb Hanna Czenczek:
>>> On 24.04.23 20:32, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 24.04.23 16:36, Emanuele Giuseppe Esposito wrote:
>>>>>
>>>>> Am 21/04/2023 um 12:13 schrieb Vladimir Sementsov-Ogievskiy:
>>>>>> On 17.03.23 15:35, Thomas Huth wrote:
>>>>>>> On 17/03/2023 11.17, Peter Maydell wrote:
>>>>>>>> On Mon, 6 Mar 2023 at 11:16, Peter Maydell
>>>>>>>> <peter.maydell@linaro.org>
>>>>>>>> wrote:
>>>>>>>>> On Fri, 3 Mar 2023 at 18:36, Peter Maydell
>>>>>>>>> <peter.maydell@linaro.org> wrote:
>>>>>>>>>> I've noticed that test-blockjob seems to fail intermittently
>>>>>>>>>> on the msys2-64bit job:
>>>>>>>>>>
>>>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
>>>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
>>>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>>>>>>>>>>
>>>>>>>>>> Sample output:
>>>>>>>>>> | 53/89
>>>>>>>>>> ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
>>>>>>>>>> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
>>>>>>>>>> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
>>>>>>>>> Here's an intermittent failure from my macos x86 machine:
>>>>>>>>>
>>>>>>>>> 172/621 qemu:unit / test-blockjob
>>>>>>>>>               ERROR           0.26s   killed by signal 6 SIGABRT
>>>>>>>> And an intermittent on the freebsd 13 CI job:
>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3950667240
>>>>>>>>
>>>>>>>>>>> MALLOC_PERTURB_=197
>>>>>>>>>>> G_TEST_BUILDDIR=/tmp/cirrus-ci-build/build/tests/unit
>>>>>>>>>>> G_TEST_SRCDIR=/tmp/cirrus-ci-build/tests/unit
>>>>>>>>>>> /tmp/cirrus-ci-build/build/tests/unit/test-blockjob --tap -k
>>>>>>>> ▶ 178/650 /blockjob/ids
>>>>>>>>               OK
>>>>>>>> 178/650 qemu:unit / test-blockjob
>>>>>>>>               ERROR           0.31s   killed by signal 6 SIGABRT
>>>>>>>> ――――――――――――――――――――――――――――――――――――― ✀
>>>>>>>> ―――――――――――――――――――――――――――――――――――――
>>>>>>>> stderr:
>>>>>>>> Assertion failed: (job->status == JOB_STATUS_STANDBY), function
>>>>>>>> test_complete_in_standby, file ../tests/unit/test-blockjob.c, line
>>>>>>>> 499.
>>>>>>>>
>>>>>>>>
>>>>>>>> TAP parsing error: Too few tests run (expected 9, got 1)
>>>>>>>> (test program exited with status code -6)
>>>>>>>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>>>>>>>
>>>>>>>> Anybody in the block team looking at these, or shall we just
>>>>>>>> disable this test entirely ?
>>>>>>> I ran into this issue today, too:
>>>>>>>
>>>>>>>     https://gitlab.com/thuth/qemu/-/jobs/3954367101
>>>>>>>
>>>>>>> ... if nobody is interested in fixing this test, I think we should
>>>>>>> disable it...
>>>>>>>
>>>>>>>     Thomas
>>>>>>>
>>>>>> I'm looking at this now, and seems that it's broken since
>>>>>> 6f592e5aca1a27fe1c1f6 "job.c: enable job lock/unlock and remove
>>>>>> Aiocontext locks", as it stops critical section by new
>>>>>> aio_context_release() call exactly after bdrv_drain_all_and(), so
>>>>>> it's
>>>>>> not a surprise that job may start at that moment and the following
>>>>>> assertion fires.
>>>>>>
>>>>>> Emanuele could please look at it?
>>>>>>
>>>>> Well if I understood correctly, the only thing that was preventing the
>>>>> job from continuing was the aiocontext lock held.
>>>>>
>>>>> The failing assertion even mentions that:
>>>>> /* Lock the IO thread to prevent the job from being run */
>>>>> [...]
>>>>> /* But the job cannot run, so it will remain on standby */
>>>>> assert(job->status == JOB_STATUS_STANDBY);
>>>>>
>>>>> Essentially bdrv_drain_all_end() would wake up the job coroutine,
>>>>> but it
>>>>> would anyways block somewhere after since the aiocontext lock was
>>>>> taken
>>>>> by the test.
>>>>>
>>>>> Now that we got rid of aiocontext lock in job code, nothing
>>>>> prevents the
>>>>> test from resuming.
>>>>> Mixing job lock and aiocontext acquire/release is not a good idea, and
>>>>> it would anyways block job_resume() called by bdrv_drain_all_end(), so
>>>>> the test itself would deadlock.
>>>>>
>>>>> So unless @Kevin has a better idea, this seems to be just an "hack" to
>>>>> test stuff that is not possible to do now anymore. What I would
>>>>> suggest
>>>>> is to get rid of that test, or at least of that assert function. I
>>>>> unfortunately cannot reproduce the failure, but I think the remaining
>>>>> functions called by the test should run as expected.
>>>>>
>>>> Thanks! I agree. Probably, alternatively we could just expand the
>>>> drained section, like
>>>>
>>>> @@ -488,12 +488,6 @@ static void test_complete_in_standby(void)
>>>>       bdrv_drain_all_begin();
>>>>       assert_job_status_is(job, JOB_STATUS_STANDBY);
>>>>
>>>> -    /* Lock the IO thread to prevent the job from being run */
>>>> -    aio_context_acquire(ctx);
>>>> -    /* This will schedule the job to resume it */
>>>> -    bdrv_drain_all_end();
>>>> -    aio_context_release(ctx);
>>>> -
>>>>       WITH_JOB_LOCK_GUARD() {
>>>>           /* But the job cannot run, so it will remain on standby */
>>>>           assert(job->status == JOB_STATUS_STANDBY);
>>>> @@ -511,6 +505,7 @@ static void test_complete_in_standby(void)
>>>>           job_dismiss_locked(&job, &error_abort);
>>>>       }
>>>>
>>>> +    bdrv_drain_all_end();
>>>>       aio_context_acquire(ctx);
>>>>       destroy_blk(blk);
>>>>       aio_context_release(ctx);
>>>>
>>>>
>>>> But, seems that test wanted to specifically test job, that still in
>>>> STANDBY exactly after drained section...
>>>>
>>>> [cc: Hanna]
>>>>
>>>> Hanna, it was your test (added in
>>>> c2c731a4d35062295cd3260e66b3754588a2fad4, two years ago). Don't you
>>>> remember was important to catch STANDBY job *after* a drained section?
>>> I’m not quite sure, but I think the idea was that we basically try to
>>> get as close to something that might come in over QMP.  Over QMP, you
>>> can’t issue a job-complete while keeping everything drained, so I
>>> wouldn’t just extend the drained section.
>>>
>>> Getting rid of the assert function also seems pointless.  If we want to
>>> test whether job-complete works on tests in standby, we must put the
>>> test in standby, and verify this.  We can get rid of the test, of
>>> course, but it is a regression test, so it isn’t like it was added just
>>> for fun.  Then again, it’s now already effectively commented out via
>>> environment variable, so it doesn’t seem like a loss in practice to to
>>> fully drop it.
>>>
>>> Anyway – the thing I wonder about is, if this is to test whether jobs in
>>> standby can be completed…  Why don’t we just pause the job instead of
>>> going through the context lock hassle?  I.e. just put a job_pause()
>>> right after bdrv_drain_all_begin().
>>>
>>> If I’m not mistaken, reproducing the bug in the test seems really simple
>>> by adding a sleep(1) right before WITH_JOB_LOCK_GUARD(); and doing that
>>> works just fine if only you have a job_pause() in the drained section.
>>> (And dropping the aio_context_acquire()/release() calls, because they
>>> don’t do anything anymore.)
>>>
>> Why sleep(1)? I have the patch ready:
>>
>> diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
>> index a130f6fefb..8054b72afa 100644
>> --- a/tests/unit/test-blockjob.c
>> +++ b/tests/unit/test-blockjob.c
>> @@ -488,11 +488,15 @@ static void test_complete_in_standby(void)
>>       bdrv_drain_all_begin();
>>       assert_job_status_is(job, JOB_STATUS_STANDBY);
>>
>> +    /*
>> +     * Increase pause_count so that the counter is
>> +     * unbalanced and job won't resume
>> +     */
>> +    job_pause(job);
>> +
>>       /* Lock the IO thread to prevent the job from being run */
>> -    aio_context_acquire(ctx);
>>       /* This will schedule the job to resume it */
>>       bdrv_drain_all_end();
>> -    aio_context_release(ctx);
>>
>>       WITH_JOB_LOCK_GUARD() {
>>           /* But the job cannot run, so it will remain on standby */
>>
>> But I don't get why we should sleep additionally.
> 
> Yep, that’s the patch.  The sleep was just a note on how to get it to
> reproduce 100 %.
> 
> Hanna
> 

Patch sent, thanks!
https://patchew.org/QEMU/20230426081601.2567990-1-eesposit@redhat.com/

Thank you,
Emanuele


