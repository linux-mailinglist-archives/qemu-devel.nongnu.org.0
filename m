Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F256D6EEF6A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 09:39:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prZk6-0006fw-U2; Wed, 26 Apr 2023 03:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1prZk4-0006cT-OO
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1prZk2-0003vm-DL
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682494744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xtr8x53TfTSZ9/HOmLj8GsqjZj7O3wMN/TpQPJ1Rt9w=;
 b=alGzrC2uj5RykDrAqrfiga/Cpf/LiFgyt4vABedsh7Txz/wo9QpSaNQq1/Oi7RMUgL8/xM
 JTplR54on0Z2pkruomtRrjyMu4elX8CJIbdWJLxEcZGCAinmpFfyBnrFrk8quaEL5mRV0d
 +Ji0XXjZPQMKrcdW+M5XdleiFXSNK9k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-OD5pxPuLOVmrTcxxjiw97w-1; Wed, 26 Apr 2023 03:39:03 -0400
X-MC-Unique: OD5pxPuLOVmrTcxxjiw97w-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef47299acdso39518426d6.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 00:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682494741; x=1685086741;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xtr8x53TfTSZ9/HOmLj8GsqjZj7O3wMN/TpQPJ1Rt9w=;
 b=H/7+qFqUYlh83GZwqgcQgy2bLOx0ShUhfQvcdl+K88V2N00ZSPECWxgDgSEH5F7J+4
 Wj3O1X8pjgnG6wU2X0IWdwnLgM4Gb322+FfjgzwRgr3xy/Hk8Qhkram4gJ2SsWLcYMMp
 6GAQsJDrYMt8Pu0hy5GT88WPiFH8l+Sj1Nj6i9EEC4HtE6B3cHF5PTMmQ0MbvPNa86jm
 nA2y/lLE/6iQ6KMbn5gfTraN+AZwb58iRt/zNBIBPoQ6RxvIDwVtBOjmLquKSV2FofrH
 +O7DaaLqLvzGPgu5e9Boy53lgo0Asz6Zwm+iuCwe41v/oLiE7ruN6wNVH3keDRQz7n4i
 +92w==
X-Gm-Message-State: AAQBX9dIqf9SQn9Fkx9hxVvLJNbDLREsmtjpgxDLQrmdzNW4m7hskz9c
 IGitlg4SwpYneTMtlBWU5/a5jXM7a2M7NPjdsMwDmkUmTCsK+dI4RJkglbR32PX/3ISY/ZFn8sT
 AAPq9Tm6665hObsU=
X-Received: by 2002:a05:6214:400a:b0:5ef:4837:cd3f with SMTP id
 kd10-20020a056214400a00b005ef4837cd3fmr31367404qvb.14.1682494741467; 
 Wed, 26 Apr 2023 00:39:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSwiqdPPLto2oaY51dFjB4gv5+wEzcKaikrN/FpQ2zeWwcjo6kKhLmtwWOX4laugdPysoQyQ==
X-Received: by 2002:a05:6214:400a:b0:5ef:4837:cd3f with SMTP id
 kd10-20020a056214400a00b005ef4837cd3fmr31367383qvb.14.1682494741129; 
 Wed, 26 Apr 2023 00:39:01 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a0ccb08000000b005f4964785b1sm4668653qvk.0.2023.04.26.00.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 00:39:00 -0700 (PDT)
Message-ID: <817ea28a-3fe8-d92e-5404-6bafc33fa67c@redhat.com>
Date: Wed, 26 Apr 2023 09:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
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
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <78ad8ed0-e68a-5f4e-9627-454f0bd007fb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



Am 25/04/2023 um 18:48 schrieb Hanna Czenczek:
> On 24.04.23 20:32, Vladimir Sementsov-Ogievskiy wrote:
>> On 24.04.23 16:36, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> Am 21/04/2023 um 12:13 schrieb Vladimir Sementsov-Ogievskiy:
>>>> On 17.03.23 15:35, Thomas Huth wrote:
>>>>> On 17/03/2023 11.17, Peter Maydell wrote:
>>>>>> On Mon, 6 Mar 2023 at 11:16, Peter Maydell <peter.maydell@linaro.org>
>>>>>> wrote:
>>>>>>>
>>>>>>> On Fri, 3 Mar 2023 at 18:36, Peter Maydell
>>>>>>> <peter.maydell@linaro.org> wrote:
>>>>>>>>
>>>>>>>> I've noticed that test-blockjob seems to fail intermittently
>>>>>>>> on the msys2-64bit job:
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
>>>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>>>>>>>>
>>>>>>>> Sample output:
>>>>>>>> | 53/89
>>>>>>>> ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
>>>>>>>> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
>>>>>>>> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
>>>>>>
>>>>>>> Here's an intermittent failure from my macos x86 machine:
>>>>>>>
>>>>>>> 172/621 qemu:unit / test-blockjob
>>>>>>>              ERROR           0.26s   killed by signal 6 SIGABRT
>>>>>>
>>>>>> And an intermittent on the freebsd 13 CI job:
>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3950667240
>>>>>>
>>>>>>>>> MALLOC_PERTURB_=197
>>>>>>>>> G_TEST_BUILDDIR=/tmp/cirrus-ci-build/build/tests/unit
>>>>>>>>> G_TEST_SRCDIR=/tmp/cirrus-ci-build/tests/unit
>>>>>>>>> /tmp/cirrus-ci-build/build/tests/unit/test-blockjob --tap -k
>>>>>> ▶ 178/650 /blockjob/ids
>>>>>>              OK
>>>>>> 178/650 qemu:unit / test-blockjob
>>>>>>              ERROR           0.31s   killed by signal 6 SIGABRT
>>>>>> ――――――――――――――――――――――――――――――――――――― ✀
>>>>>> ―――――――――――――――――――――――――――――――――――――
>>>>>> stderr:
>>>>>> Assertion failed: (job->status == JOB_STATUS_STANDBY), function
>>>>>> test_complete_in_standby, file ../tests/unit/test-blockjob.c, line
>>>>>> 499.
>>>>>>
>>>>>>
>>>>>> TAP parsing error: Too few tests run (expected 9, got 1)
>>>>>> (test program exited with status code -6)
>>>>>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>>>>>
>>>>>> Anybody in the block team looking at these, or shall we just
>>>>>> disable this test entirely ?
>>>>>
>>>>> I ran into this issue today, too:
>>>>>
>>>>>    https://gitlab.com/thuth/qemu/-/jobs/3954367101
>>>>>
>>>>> ... if nobody is interested in fixing this test, I think we should
>>>>> disable it...
>>>>>
>>>>>    Thomas
>>>>>
>>>>
>>>> I'm looking at this now, and seems that it's broken since
>>>> 6f592e5aca1a27fe1c1f6 "job.c: enable job lock/unlock and remove
>>>> Aiocontext locks", as it stops critical section by new
>>>> aio_context_release() call exactly after bdrv_drain_all_and(), so it's
>>>> not a surprise that job may start at that moment and the following
>>>> assertion fires.
>>>>
>>>> Emanuele could please look at it?
>>>>
>>> Well if I understood correctly, the only thing that was preventing the
>>> job from continuing was the aiocontext lock held.
>>>
>>> The failing assertion even mentions that:
>>> /* Lock the IO thread to prevent the job from being run */
>>> [...]
>>> /* But the job cannot run, so it will remain on standby */
>>> assert(job->status == JOB_STATUS_STANDBY);
>>>
>>> Essentially bdrv_drain_all_end() would wake up the job coroutine, but it
>>> would anyways block somewhere after since the aiocontext lock was taken
>>> by the test.
>>>
>>> Now that we got rid of aiocontext lock in job code, nothing prevents the
>>> test from resuming.
>>> Mixing job lock and aiocontext acquire/release is not a good idea, and
>>> it would anyways block job_resume() called by bdrv_drain_all_end(), so
>>> the test itself would deadlock.
>>>
>>> So unless @Kevin has a better idea, this seems to be just an "hack" to
>>> test stuff that is not possible to do now anymore. What I would suggest
>>> is to get rid of that test, or at least of that assert function. I
>>> unfortunately cannot reproduce the failure, but I think the remaining
>>> functions called by the test should run as expected.
>>>
>>
>> Thanks! I agree. Probably, alternatively we could just expand the
>> drained section, like
>>
>> @@ -488,12 +488,6 @@ static void test_complete_in_standby(void)
>>      bdrv_drain_all_begin();
>>      assert_job_status_is(job, JOB_STATUS_STANDBY);
>>
>> -    /* Lock the IO thread to prevent the job from being run */
>> -    aio_context_acquire(ctx);
>> -    /* This will schedule the job to resume it */
>> -    bdrv_drain_all_end();
>> -    aio_context_release(ctx);
>> -
>>      WITH_JOB_LOCK_GUARD() {
>>          /* But the job cannot run, so it will remain on standby */
>>          assert(job->status == JOB_STATUS_STANDBY);
>> @@ -511,6 +505,7 @@ static void test_complete_in_standby(void)
>>          job_dismiss_locked(&job, &error_abort);
>>      }
>>
>> +    bdrv_drain_all_end();
>>      aio_context_acquire(ctx);
>>      destroy_blk(blk);
>>      aio_context_release(ctx);
>>
>>
>> But, seems that test wanted to specifically test job, that still in
>> STANDBY exactly after drained section...
>>
>> [cc: Hanna]
>>
>> Hanna, it was your test (added in
>> c2c731a4d35062295cd3260e66b3754588a2fad4, two years ago). Don't you
>> remember was important to catch STANDBY job *after* a drained section?
> 
> I’m not quite sure, but I think the idea was that we basically try to
> get as close to something that might come in over QMP.  Over QMP, you
> can’t issue a job-complete while keeping everything drained, so I
> wouldn’t just extend the drained section.
> 
> Getting rid of the assert function also seems pointless.  If we want to
> test whether job-complete works on tests in standby, we must put the
> test in standby, and verify this.  We can get rid of the test, of
> course, but it is a regression test, so it isn’t like it was added just
> for fun.  Then again, it’s now already effectively commented out via
> environment variable, so it doesn’t seem like a loss in practice to to
> fully drop it.
> 
> Anyway – the thing I wonder about is, if this is to test whether jobs in
> standby can be completed…  Why don’t we just pause the job instead of
> going through the context lock hassle?  I.e. just put a job_pause()
> right after bdrv_drain_all_begin().
> 
> If I’m not mistaken, reproducing the bug in the test seems really simple
> by adding a sleep(1) right before WITH_JOB_LOCK_GUARD(); and doing that
> works just fine if only you have a job_pause() in the drained section. 
> (And dropping the aio_context_acquire()/release() calls, because they
> don’t do anything anymore.)
> 
Why sleep(1)? I have the patch ready:

diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index a130f6fefb..8054b72afa 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -488,11 +488,15 @@ static void test_complete_in_standby(void)
     bdrv_drain_all_begin();
     assert_job_status_is(job, JOB_STATUS_STANDBY);

+    /*
+     * Increase pause_count so that the counter is
+     * unbalanced and job won't resume
+     */
+    job_pause(job);
+
     /* Lock the IO thread to prevent the job from being run */
-    aio_context_acquire(ctx);
     /* This will schedule the job to resume it */
     bdrv_drain_all_end();
-    aio_context_release(ctx);

     WITH_JOB_LOCK_GUARD() {
         /* But the job cannot run, so it will remain on standby */

But I don't get why we should sleep additionally.

Emanuele


