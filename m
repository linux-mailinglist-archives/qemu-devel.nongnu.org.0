Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7F2C8148
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:45:12 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfk7-0005j2-He
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfcB-0002LQ-QK
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfc5-0003n0-4a
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606729010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FY4Xgs4PHioZfeOi6fTDufQbDsMTYnwF9VOG4VbFCdw=;
 b=RSTrjrXWEfcR7D1DhDF3xO3dJPisdPeRhw3lPlphkkZ6shaHwotkv2Bynw6KhaDaB6oJ3l
 g4/yLf927NWi8WdhtIXt3mAyja1kqaj3/VRREpV2rziA75ZlZPsj6LaPIQZSB3JtQRJlqP
 K1WTRWfAntElMElEARKJdhUUDLshUUE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-XxHqloigMUK6fyyeC_S3jA-1; Mon, 30 Nov 2020 04:36:47 -0500
X-MC-Unique: XxHqloigMUK6fyyeC_S3jA-1
Received: by mail-wm1-f69.google.com with SMTP id z16so4104983wma.1
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FY4Xgs4PHioZfeOi6fTDufQbDsMTYnwF9VOG4VbFCdw=;
 b=N2itSsNt8jlXH3YBt5FnqA5cCXs8Z/nmERtgsZjxsmnYiOJf7q+IqE+rUsIssi5yyJ
 1UKrDuBUYKEz5smIxbzq7EkIazK7WmJqpco6Yyx4ZXjkWfWJjlmEwvwfivBfifV24n/P
 FOvgVhl/aaUdw2ZH2yPZ9PT/M1l/e9RvDo43hWYoM2ZRcn1lXxHwVggCK8rENYJYG1LJ
 Fwc/12aY6+7kBoM8fY2FCBkXshhibLpVZDQG1ZIg3XNpamL1Xsg94gBpc+iFwhgdBbSl
 jzYnjSxfrz446X+UREPuywAsBVYjtzolSeUSrQG+XP0ngdnPFvePxkfhgT3HgoKs1/wF
 o2aQ==
X-Gm-Message-State: AOAM531WhOsOq8/fMdgG0FQLHh+XbDcE+3NHWMtMMLQLI3t7DHhg8EKA
 MLlo/ZFgBmJRVMYJmYxBuvueLpV9itcwGkbMb5qDR+bfWRiPtloUFy68naBS3BI+tRa5Kou7a9o
 5wuFZEhcnj/ArZQE=
X-Received: by 2002:a5d:488b:: with SMTP id g11mr28047775wrq.210.1606729005567; 
 Mon, 30 Nov 2020 01:36:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoc0p3EXIv0iMwWKXUlwdRwlniMfO58SIkgLFaYi7zrXKdessC2B/6lE7JgmUj3e8IcRuVzA==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr28047739wrq.210.1606729005294; 
 Mon, 30 Nov 2020 01:36:45 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w10sm27466075wra.34.2020.11.30.01.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:36:44 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: Cornelia Huck <cohuck@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
 <ec7e0016-7d10-49bf-0af2-69de8356bbed@redhat.com>
 <20201130091044.2b35fca4.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <36279d42-2312-adcf-2f83-51ec9ff64e0a@redhat.com>
Date: Mon, 30 Nov 2020 10:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130091044.2b35fca4.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, virt-ci-maint-team@redhat.com,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 9:10 AM, Cornelia Huck wrote:
> On Fri, 27 Nov 2020 19:46:29 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 11/27/20 7:29 PM, Thomas Huth wrote:
>>> On 27/11/2020 18.57, Philippe Mathieu-Daudé wrote:  
>>>> On 11/27/20 6:47 PM, Thomas Huth wrote:  
>>>>> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:  
>>>>>> We lately realized that the Avocado framework was not designed
>>>>>> to be regularly run on CI environments. Therefore, as of 5.2
>>>>>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
>>>>>> current users, it is possible to keep the current behavior by
>>>>>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
>>>>>> (see [*]).
>>>>>> From now on, using these jobs (or adding new tests to them)
>>>>>> is strongly discouraged.
>>>>>>
>>>>>> Tests based on Avocado will be ported to new job schemes during
>>>>>> the next releases, with better documentation and templates.  
>>>>>
>>>>> Why should we disable the jobs by default as long as there is no replacement
>>>>> available yet?  
>>>>
>>>> Why keep it enabled if it is failing randomly  
>>>
>>> We can still disable single jobs if they are not stable, but that's no
>>> reason to disable all of them by default, is it?
>>>   
>>>> if images hardcoded
>>>> in tests are being removed from public servers, etc...?  
>>>
>>> That's independent from Avocado, you'll always have that problem if you want
>>> to test with external images, unless you mirror them into a repository on
>>> the same server (ie. gitlab), which, however, might not always be possible...
>>>   
>>>> They are not disabled, they are still runnable manually or setting
>>>> QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...  
>>>
>>> And who do you think is going to set that variable? Hardly anybody, I guess.  
>>
>> Does that mean nobody cares about these tests?
> 
> If I first have to set some random config option before tests are run,
> that's an extra hurdle. I want a simple workflow where I just push to
> gitlab and don't have to care about extra configuration.

Good, that means you are not particularly interested by
this specific test, so you don't need to set
QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE.

> 
>>
>>> So you could also simply remove the stuff from the yml file completely instead.  
>>
>> Yes, I'd prefer that too, but Alex objected.
>>
>>>> We realized by default Avocado runs all tests on the CI jobs,
>>>> triggering failures and complains. Developer stopped to contribute/
>>>> review integration tests because of that.  
>>>
>>> Did anybody really stop contributing "acceptance" test since they were
>>> afraid of the gitlab-CI running them? That's new to me, do you have a pointer?  
>>
>> No, but alternatively, how many tests were contributed / reviewed
>> last year?
> 
> I added one, just last week... plan to do more, but there's always less
> time than things I want/need to do. Maybe this just needs more
> advertising?

I noticed your test. Do you plan it to be run regularly on CI too
(a.k.a. a gating test)?

It is small, simple, run fast, it got quickly reviewed.

Nobody cared to review the COLO test 3 months, because it is
more complex:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg727381.html

> 
>>
>>>> We want developers be
>>>> able to contribute tests to the repository fearlessly.  
>>>
>>> You can always mark your test with @skipIf(os.getenv('GITLAB_CI')) if you
>>> don't want to see it running in the gitlab-CI, so that's not a reason to be
>>> afraid.  
>>
>> This was the idea here (opposite, tag jobs with 'gating-ci' to run
>> them on GitLab):
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg756464.html
> 
> I guess you want all of that:
> - tag tests that you know to not work, so they're not run
> - tag tests that you know to be stable, so they can be gating
> - all non-tagged tests are expected to work usually, but there might be
>   an occasional failure
> ?

Yes, but IIUC Alex didn't agree to use a gating tag for stable
tests, he wants everything to be run on GitLab.

> 
>>
>>>   
>>>> If we don't change anything, we'll keep having CI failures due
>>>> to Avocado design issues (artifacts removed from remote servers,
>>>> etc...).  
>>>
>>> I fail to see the relation between Avocado and vanishing artifacts from 3rd
>>> party servers... what do you plan to do instead if something gets (re-)moved
>>> from a server that is not under our control?  
>>
>> Avocado tests and CI are orthogonal, but it will be painful to
>> fix Avocado tests with the current Avocado CI jobs.
> 
> What's the problem? Cryptic error messages when artifacts cannot be
> fetched?

More importantly to display a reproducible command line on failure.

But there are some design issue (Avocado was not design to run on
CI environment at all) that will be hard to solve if we have to keep
what we current have.

> 
>>
>>>   
>>>> I haven't seen any attempt on this list to improve the current
>>>> fragile situation, but better suggestions are certainly welcome.  
>>>
>>> At least I am hoping that the "check-acceptance" tests will break a little
>>> bit less often once Peter uses the gitlab-CI for his gating tests, too. That
>>> will at least prevent that one of the tests gets completely broken by a new
>>> merged pull request. Of course there's still the risk that tests only fail
>>> occasionally due to new bugs, but that can also happen for all other test
>>> suites (unit, qtest, iotests, ...), too.  
>>
>> Or Peter (as other users) will get grumpy at these tests because they
>> are unreliable, hard to understand what fail and debug.
>>
>> Thus the removal suggestion, so we can "fix" the missing Avocado parts
>> before it is used heavily.
> 
> I think disabling _all_ of them is way too harsh.

I'm looking for ways to:

- allow developers to contribute integration tests easily,
  not being blocked by CI.
- allow maintainers to expand their default tests set (by
  marking non-gating tests as gating for their workflow).
- allow developers to disable tests they are not interested
  in to reduce how many CI minutes they burn on each pipeline
- figure out who to contact in case a job failed (runner
  owner? test owner? breaking patch author?)

I thought marking our current jobs as optional would be simpler
that introducing an Avocado2 framework and duplicating the tests,
so I wanted to try the fast path first.

Regards,

Phil.


