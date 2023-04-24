Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085136ECF57
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:40:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwND-0002mL-Qt; Mon, 24 Apr 2023 09:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqwNC-0002lI-6n
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqwN9-00035O-DS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682343410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WijPObEp/yT+owlXLmq5UsQZ5B64rirvy4mj04CRnyU=;
 b=BUGjG+v8w5G30U/pchZBFE61L5ZpVmQ3XXGiMC4lgVf9UrDbzcvFqx3MFY46tAK82Eujp1
 Jyq45A26MZ1Q1j4ackZsZu5SeQmxUfp+th4Jad9rjyQeFodhS0LjNu8V+bmcT8M0+X2yDg
 fI60V8xLgG5bb/GTj7DsG2HVNCDZQK4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-HVhfx_SbOECON6qW6wPtRQ-1; Mon, 24 Apr 2023 09:36:48 -0400
X-MC-Unique: HVhfx_SbOECON6qW6wPtRQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5efc80e8485so64587046d6.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 06:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682343406; x=1684935406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WijPObEp/yT+owlXLmq5UsQZ5B64rirvy4mj04CRnyU=;
 b=gYyPNNq4Peo121WVh5CLpXB66F7p69xzR4wS7VSYd4nSJJUgKY3LGgVnGb5gWrlD/2
 WUFbQxjS5AjZjT0fFK1UiI0lrEWzOFwcrshyU0lxfdhgSqn83iYrE4Jag2uwFZokVNrc
 Lla9Mt6Gj6mZl9oRpEODZhjxGhoQOkMoNfVMvtzH2lZTymKKVqSs24Kt+BaxfpB2no6R
 5cr4QuhjbNExVhXAdHVR/lD4s4WMJ5HylP3ovt5zBsITdDqn7j8svF3aW70hV6hVaQW9
 395LjLUKyMswYc/dMs3mQ8Cah28G4t3lRCVQdJnBcOO7JlEE/0FKSYR6PyCqoNNDZpnB
 gwrA==
X-Gm-Message-State: AAQBX9e1J2VZhQ7RPIqIH05vqooOBDIMNhXEfpNkvO9r2fg5U5ZfXeuZ
 fd2Bvyd8TTJBkeFUF0qv/GCLLDYMydY9Lq4wnyidg0Jcayvw20l4oHTe1UHdmppDvQpnRqlzVFv
 lGw4aeRRr1l5vkOw=
X-Received: by 2002:a05:6214:21cf:b0:5e9:46d:fb52 with SMTP id
 d15-20020a05621421cf00b005e9046dfb52mr26534915qvh.34.1682343406446; 
 Mon, 24 Apr 2023 06:36:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3nFogka8yKSOAJq7RAjuwhDeZZ4fLWU6mT9upUPDqOePzgpOjVx59UHUBjfhGSIMthBdY+g==
X-Received: by 2002:a05:6214:21cf:b0:5e9:46d:fb52 with SMTP id
 d15-20020a05621421cf00b005e9046dfb52mr26534853qvh.34.1682343405972; 
 Mon, 24 Apr 2023 06:36:45 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a0cd983000000b0060133179e06sm2914052qvj.43.2023.04.24.06.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 06:36:45 -0700 (PDT)
Message-ID: <e6eb754e-a825-f113-a9a7-0ca2006a00c6@redhat.com>
Date: Mon, 24 Apr 2023 15:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
Content-Language: de-CH
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Alberto Garcia <berto@igalia.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
 <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
 <CAFEAcA-n+9N+0ZuE6MSD1aMBeGYAJTbQe=j1-2K=SgD_Ly6nEA@mail.gmail.com>
 <df71d7b5-7723-eaff-3dcd-45f69186f6af@redhat.com>
 <68834b18-1fab-ca2a-d131-71f75fc374a1@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <68834b18-1fab-ca2a-d131-71f75fc374a1@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 21/04/2023 um 12:13 schrieb Vladimir Sementsov-Ogievskiy:
> On 17.03.23 15:35, Thomas Huth wrote:
>> On 17/03/2023 11.17, Peter Maydell wrote:
>>> On Mon, 6 Mar 2023 at 11:16, Peter Maydell <peter.maydell@linaro.org>
>>> wrote:
>>>>
>>>> On Fri, 3 Mar 2023 at 18:36, Peter Maydell
>>>> <peter.maydell@linaro.org> wrote:
>>>>>
>>>>> I've noticed that test-blockjob seems to fail intermittently
>>>>> on the msys2-64bit job:
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>>>>>
>>>>> Sample output:
>>>>> | 53/89
>>>>> ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
>>>>> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
>>>>> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
>>>
>>>> Here's an intermittent failure from my macos x86 machine:
>>>>
>>>> 172/621 qemu:unit / test-blockjob
>>>>             ERROR           0.26s   killed by signal 6 SIGABRT
>>>
>>> And an intermittent on the freebsd 13 CI job:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3950667240
>>>
>>>>>> MALLOC_PERTURB_=197
>>>>>> G_TEST_BUILDDIR=/tmp/cirrus-ci-build/build/tests/unit
>>>>>> G_TEST_SRCDIR=/tmp/cirrus-ci-build/tests/unit
>>>>>> /tmp/cirrus-ci-build/build/tests/unit/test-blockjob --tap -k
>>> ▶ 178/650 /blockjob/ids
>>>             OK
>>> 178/650 qemu:unit / test-blockjob
>>>             ERROR           0.31s   killed by signal 6 SIGABRT
>>> ――――――――――――――――――――――――――――――――――――― ✀ 
>>> ―――――――――――――――――――――――――――――――――――――
>>> stderr:
>>> Assertion failed: (job->status == JOB_STATUS_STANDBY), function
>>> test_complete_in_standby, file ../tests/unit/test-blockjob.c, line
>>> 499.
>>>
>>>
>>> TAP parsing error: Too few tests run (expected 9, got 1)
>>> (test program exited with status code -6)
>>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>>
>>> Anybody in the block team looking at these, or shall we just
>>> disable this test entirely ?
>>
>> I ran into this issue today, too:
>>
>>   https://gitlab.com/thuth/qemu/-/jobs/3954367101
>>
>> ... if nobody is interested in fixing this test, I think we should
>> disable it...
>>
>>   Thomas
>>
> 
> I'm looking at this now, and seems that it's broken since
> 6f592e5aca1a27fe1c1f6 "job.c: enable job lock/unlock and remove
> Aiocontext locks", as it stops critical section by new
> aio_context_release() call exactly after bdrv_drain_all_and(), so it's
> not a surprise that job may start at that moment and the following
> assertion fires.
> 
> Emanuele could please look at it?
> 
Well if I understood correctly, the only thing that was preventing the
job from continuing was the aiocontext lock held.

The failing assertion even mentions that:
/* Lock the IO thread to prevent the job from being run */
[...]
/* But the job cannot run, so it will remain on standby */
assert(job->status == JOB_STATUS_STANDBY);

Essentially bdrv_drain_all_end() would wake up the job coroutine, but it
would anyways block somewhere after since the aiocontext lock was taken
by the test.

Now that we got rid of aiocontext lock in job code, nothing prevents the
test from resuming.
Mixing job lock and aiocontext acquire/release is not a good idea, and
it would anyways block job_resume() called by bdrv_drain_all_end(), so
the test itself would deadlock.

So unless @Kevin has a better idea, this seems to be just an "hack" to
test stuff that is not possible to do now anymore. What I would suggest
is to get rid of that test, or at least of that assert function. I
unfortunately cannot reproduce the failure, but I think the remaining
functions called by the test should run as expected.

Thank you,
Emanuele


