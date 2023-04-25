Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E46EE613
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:49:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLqA-0006XW-3T; Tue, 25 Apr 2023 12:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1prLq0-0006Wq-Cm
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1prLpy-0002fe-C5
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682441294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0iiM27C4+HDFYDk/MvbR/vACVkIhpfU/9b2waoJHxw=;
 b=Rya+2ikz+3RnhsiDuoYGQESSeZbxbAo9U7YWvt+HZySa7CiXvp2QiKsUr+o4ongfcjIgcH
 0zCxB+85MSC/w6RP6mAtbdQEpnGCsINL+Rj22DsmPcjadZJqq+8NZMXrVpiNABd8fLp/To
 puSqZ4HbsRnOAAtczj8FiBSBObg8jOo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-9jd6uxSoOWa5iq92fIq4IA-1; Tue, 25 Apr 2023 12:48:13 -0400
X-MC-Unique: 9jd6uxSoOWa5iq92fIq4IA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50692ecb472so6968916a12.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 09:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682441291; x=1685033291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k0iiM27C4+HDFYDk/MvbR/vACVkIhpfU/9b2waoJHxw=;
 b=eR9WE5n9zMl1CgY7ch+F8109O5mBm069Ti/imJtiz8Lr2r0H0c5mSez19DymT4RmU+
 HueyQLYEuIyPYv15e4gIa4/LRc03q/ATNjlCml8IBKr7+ymQ4CRPNV0TgY1nbFHFPcBn
 LadjPSyOvu0n6Ay4jOVFS9je7Yh5/Y0GxlDL/hLCVJU8aRKC6hZEjX/fy9/X9wQYwXc0
 RG4ilq+iUJw4lPBi7U2a1gUspCcVF8LHbs0A9lupN4uIlMM1FtprTlfyI+ad/7WSzkni
 45K+xbQJroBm1ic7GQ1UuvM+BxJ+F3eYixPBwAZzaiqO3PAJRmfnwhUd6tlNc+qQvK77
 Lrpw==
X-Gm-Message-State: AAQBX9c1ZrHKHSiNPCU+mi64koV0l0YtPYFJnAC6QIZ8AZ8AkLYWRtGW
 GI+4JBuc4ltel/gN6mjvb8IZ+DqdfORXyPsYEHkgkPyUdIbm8G22rkiWDkQSubT0GdEAmLxpefQ
 VjUv9297t+Pi1uAc=
X-Received: by 2002:aa7:d913:0:b0:504:b177:3eee with SMTP id
 a19-20020aa7d913000000b00504b1773eeemr12944480edr.33.1682441290836; 
 Tue, 25 Apr 2023 09:48:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350ah1t3hQtCQ9b6HKgJVaKi+JQJ6RgRMIKntHhUvfbIp+1wiCKx4c2YmN+7RTM+p8+jiFjb31Q==
X-Received: by 2002:aa7:d913:0:b0:504:b177:3eee with SMTP id
 a19-20020aa7d913000000b00504b1773eeemr12944464edr.33.1682441290532; 
 Tue, 25 Apr 2023 09:48:10 -0700 (PDT)
Received: from ?IPV6:2003:cf:d741:bf09:7bd7:9744:2009:333a?
 (p200300cfd741bf097bd797442009333a.dip0.t-ipconnect.de.
 [2003:cf:d741:bf09:7bd7:9744:2009:333a])
 by smtp.gmail.com with ESMTPSA id
 bf18-20020a0564021a5200b00506b88e4f17sm5801146edb.68.2023.04.25.09.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 09:48:09 -0700 (PDT)
Message-ID: <78ad8ed0-e68a-5f4e-9627-454f0bd007fb@redhat.com>
Date: Tue, 25 Apr 2023 18:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
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
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <f3f2e92c-d357-4fb9-e765-7f89dc895247@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

On 24.04.23 20:32, Vladimir Sementsov-Ogievskiy wrote:
> On 24.04.23 16:36, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 21/04/2023 um 12:13 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 17.03.23 15:35, Thomas Huth wrote:
>>>> On 17/03/2023 11.17, Peter Maydell wrote:
>>>>> On Mon, 6 Mar 2023 at 11:16, Peter Maydell <peter.maydell@linaro.org>
>>>>> wrote:
>>>>>>
>>>>>> On Fri, 3 Mar 2023 at 18:36, Peter Maydell
>>>>>> <peter.maydell@linaro.org> wrote:
>>>>>>>
>>>>>>> I've noticed that test-blockjob seems to fail intermittently
>>>>>>> on the msys2-64bit job:
>>>>>>>
>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>>>>>>>
>>>>>>> Sample output:
>>>>>>> | 53/89
>>>>>>> ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
>>>>>>> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
>>>>>>> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
>>>>>
>>>>>> Here's an intermittent failure from my macos x86 machine:
>>>>>>
>>>>>> 172/621 qemu:unit / test-blockjob
>>>>>>              ERROR           0.26s   killed by signal 6 SIGABRT
>>>>>
>>>>> And an intermittent on the freebsd 13 CI job:
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3950667240
>>>>>
>>>>>>>> MALLOC_PERTURB_=197
>>>>>>>> G_TEST_BUILDDIR=/tmp/cirrus-ci-build/build/tests/unit
>>>>>>>> G_TEST_SRCDIR=/tmp/cirrus-ci-build/tests/unit
>>>>>>>> /tmp/cirrus-ci-build/build/tests/unit/test-blockjob --tap -k
>>>>> ▶ 178/650 /blockjob/ids
>>>>>              OK
>>>>> 178/650 qemu:unit / test-blockjob
>>>>>              ERROR           0.31s   killed by signal 6 SIGABRT
>>>>> ――――――――――――――――――――――――――――――――――――― ✀
>>>>> ―――――――――――――――――――――――――――――――――――――
>>>>> stderr:
>>>>> Assertion failed: (job->status == JOB_STATUS_STANDBY), function
>>>>> test_complete_in_standby, file ../tests/unit/test-blockjob.c, line
>>>>> 499.
>>>>>
>>>>>
>>>>> TAP parsing error: Too few tests run (expected 9, got 1)
>>>>> (test program exited with status code -6)
>>>>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
>>>>>
>>>>>
>>>>> Anybody in the block team looking at these, or shall we just
>>>>> disable this test entirely ?
>>>>
>>>> I ran into this issue today, too:
>>>>
>>>>    https://gitlab.com/thuth/qemu/-/jobs/3954367101
>>>>
>>>> ... if nobody is interested in fixing this test, I think we should
>>>> disable it...
>>>>
>>>>    Thomas
>>>>
>>>
>>> I'm looking at this now, and seems that it's broken since
>>> 6f592e5aca1a27fe1c1f6 "job.c: enable job lock/unlock and remove
>>> Aiocontext locks", as it stops critical section by new
>>> aio_context_release() call exactly after bdrv_drain_all_and(), so it's
>>> not a surprise that job may start at that moment and the following
>>> assertion fires.
>>>
>>> Emanuele could please look at it?
>>>
>> Well if I understood correctly, the only thing that was preventing the
>> job from continuing was the aiocontext lock held.
>>
>> The failing assertion even mentions that:
>> /* Lock the IO thread to prevent the job from being run */
>> [...]
>> /* But the job cannot run, so it will remain on standby */
>> assert(job->status == JOB_STATUS_STANDBY);
>>
>> Essentially bdrv_drain_all_end() would wake up the job coroutine, but it
>> would anyways block somewhere after since the aiocontext lock was taken
>> by the test.
>>
>> Now that we got rid of aiocontext lock in job code, nothing prevents the
>> test from resuming.
>> Mixing job lock and aiocontext acquire/release is not a good idea, and
>> it would anyways block job_resume() called by bdrv_drain_all_end(), so
>> the test itself would deadlock.
>>
>> So unless @Kevin has a better idea, this seems to be just an "hack" to
>> test stuff that is not possible to do now anymore. What I would suggest
>> is to get rid of that test, or at least of that assert function. I
>> unfortunately cannot reproduce the failure, but I think the remaining
>> functions called by the test should run as expected.
>>
>
> Thanks! I agree. Probably, alternatively we could just expand the 
> drained section, like
>
> @@ -488,12 +488,6 @@ static void test_complete_in_standby(void)
>      bdrv_drain_all_begin();
>      assert_job_status_is(job, JOB_STATUS_STANDBY);
>
> -    /* Lock the IO thread to prevent the job from being run */
> -    aio_context_acquire(ctx);
> -    /* This will schedule the job to resume it */
> -    bdrv_drain_all_end();
> -    aio_context_release(ctx);
> -
>      WITH_JOB_LOCK_GUARD() {
>          /* But the job cannot run, so it will remain on standby */
>          assert(job->status == JOB_STATUS_STANDBY);
> @@ -511,6 +505,7 @@ static void test_complete_in_standby(void)
>          job_dismiss_locked(&job, &error_abort);
>      }
>
> +    bdrv_drain_all_end();
>      aio_context_acquire(ctx);
>      destroy_blk(blk);
>      aio_context_release(ctx);
>
>
> But, seems that test wanted to specifically test job, that still in 
> STANDBY exactly after drained section...
>
> [cc: Hanna]
>
> Hanna, it was your test (added in 
> c2c731a4d35062295cd3260e66b3754588a2fad4, two years ago). Don't you 
> remember was important to catch STANDBY job *after* a drained section?

I’m not quite sure, but I think the idea was that we basically try to 
get as close to something that might come in over QMP.  Over QMP, you 
can’t issue a job-complete while keeping everything drained, so I 
wouldn’t just extend the drained section.

Getting rid of the assert function also seems pointless.  If we want to 
test whether job-complete works on tests in standby, we must put the 
test in standby, and verify this.  We can get rid of the test, of 
course, but it is a regression test, so it isn’t like it was added just 
for fun.  Then again, it’s now already effectively commented out via 
environment variable, so it doesn’t seem like a loss in practice to to 
fully drop it.

Anyway – the thing I wonder about is, if this is to test whether jobs in 
standby can be completed…  Why don’t we just pause the job instead of 
going through the context lock hassle?  I.e. just put a job_pause() 
right after bdrv_drain_all_begin().

If I’m not mistaken, reproducing the bug in the test seems really simple 
by adding a sleep(1) right before WITH_JOB_LOCK_GUARD(); and doing that 
works just fine if only you have a job_pause() in the drained section.  
(And dropping the aio_context_acquire()/release() calls, because they 
don’t do anything anymore.)

Hanna


