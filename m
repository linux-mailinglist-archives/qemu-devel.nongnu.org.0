Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0703B02C5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:29:03 +0200 (CEST)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lveaU-0004fI-7f
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lveZH-0003yC-M5
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lveZ8-0004Is-RI
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624361257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzk9q+LuiY1hDqEDVrdDvf/o7Jhqva1xhLlazzqNquk=;
 b=XtnCGMl9J6+rdgk6WaPgHkkYDgt4EV/tZTf98XCrTNWJVbmbw8oreQ9ZW4zdg+mthoq2E4
 obt2MNhTwUG2izmrNRwJivOW0LFqV+XwW3s9fcNai8vbC1Ucf1uXa83N4GQWRIcndOUren
 A27jtHoZrAf1IY2wV4JNvacXUBqv/no=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-6hJRcbViMlmyidJw7Jsf4A-1; Tue, 22 Jun 2021 07:27:36 -0400
X-MC-Unique: 6hJRcbViMlmyidJw7Jsf4A-1
Received: by mail-wr1-f69.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so9615465wrc.16
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzk9q+LuiY1hDqEDVrdDvf/o7Jhqva1xhLlazzqNquk=;
 b=QxeRtF+AspVCfmnKlveXu1/qGg7w+pZ9deCd+TL7r/+B/z4ayiCvGrBoXFMSrZFE1O
 L1Mf821wR090ErO8lK1qoRPoJHrsFhdheAd+hoWquhNGnVES38s9tFdzW4pipakykgKB
 Lkpj3UMHrlJjHtF4F4RgICLkrHEsmVmNG2W9jvUSx5ZOn+WV3w02//ALSlu/Vqb/uWYX
 5vttiwSpnKsdLklKqdL9xcOMBQB9a2t0UGVEYxAc8Id2h1jI8bkY1ScA3dnH3B1BAxOJ
 NdQ9evCpnYCo8AhHyAo5xCrxqrb0rKX8toZMfSbO0dK3GmGXjqN3c/qdJun4+5a6fvl1
 RWcg==
X-Gm-Message-State: AOAM532v9IavSjbcjU2B0swmqVJyvnPECVis2Tqh2xLDI+Pn8wgtrGnQ
 BnOo9nEqpIPxrRC99h+o5LTt+/bwfnQoEiozljs0JiQoEBfacFdjMn3UITUpZs1peGy3tFZrv5k
 J1jkNgtb57GpWC5bidBIQaYGVW2Hk0RDyri+0COUv6Ba1BeQcs99W8hk7TaeL/9j+
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr4210346wrd.228.1624361254751; 
 Tue, 22 Jun 2021 04:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDsD4W+50nKqwJreiw3uOnzGwP16NyVjVxidXJylxpOHd2yqGOHvmjIL4aVQutKIWOo6wQKA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr4210320wrd.228.1624361254464; 
 Tue, 22 Jun 2021 04:27:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n16sm10892102wrx.85.2021.06.22.04.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 04:27:34 -0700 (PDT)
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
To: Igor Mammedov <imammedo@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <d10ba45f-c71c-f472-fac7-9f8e5770c735@suse.de>
 <20210618132647.07cf2008@redhat.com>
 <2f7ae379-92e0-3274-6944-84a5bce6e82e@suse.de>
 <20210618152943.2009ad82@redhat.com> <874kdqtj25.fsf@linaro.org>
 <ca74cc39-6e30-6588-aa5a-48f74d305b56@redhat.com>
 <20210622123648.07402d7c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <17250c14-ef94-6e09-7e86-b5148fadbe97@redhat.com>
Date: Tue, 22 Jun 2021 13:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622123648.07402d7c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Daniel (sorry Daniel)

On 6/22/21 12:36 PM, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 10:22:19 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 6/22/21 10:07 AM, Alex Bennée wrote:
>>> Igor Mammedov <imammedo@redhat.com> writes:  
>>>> On Fri, 18 Jun 2021 14:43:46 +0200
>>>> Claudio Fontana <cfontana@suse.de> wrote:  
>>>>> On 6/18/21 1:26 PM, Igor Mammedov wrote:  
>>>>>> On Thu, 17 Jun 2021 18:49:17 +0200
>>>>>> Claudio Fontana <cfontana@suse.de> wrote:  
>>>>>>> On 6/16/21 5:24 PM, Igor Mammedov wrote:    
>>>>>>>>
>>>>>>>> Sometimes it's necessary to execute a test that depends on KVM,
>>>>>>>> however qtest is not aware if tested QEMU binary supports KVM
>>>>>>>> on the host it the test is executed.      
>>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> It seems to me that we are constantly re-implementing the same feature with slight variations?
>>>>>>>
>>>>>>> Didn't we have a generic series to introduce qtest_has_accel() from Philippe before?    
>>>>>> It's mentioned in cover letter (PS: part) and in [1/3] with rationale
>>>>>> why this was posted.    
>>>>>
>>>>> Thought it was separate, but now I see that it uses query-accel underneath.
>>>>>
>>>>> Seems strange to add another check to do the same thing, it may point to qtest_has_accel() needing some update?
>>>>> You mention it is time consuming to use qtest_has_accel(), have you measured an important overhead?
>>>>> With qtest_has_accel() not even being committed yet, is it already necessary to work around it because it's too slow?   
>>>>
>>>> Tests are already take a lot of time as is, so I'd try to avoid slowing
>>>> them down.
>>>>
>>>> proposed qtest_has_accel() requires spawning QEMU to probe, which is slow.
>>>> Worst case would be:
>>>>  = qemu startup time * number of checks * number of targets
>>>>
>>>> It's fine to run occasionally, I can take a coffee break while tests run.
>>>> But put it in context of CI and it multiplies by the number of push requests
>>>> and starts to eat not only time but also limited CI resources.
>>>>
>>>> In current form qtest_has_accel() is only marginally better functionality
>>>> wise, as it reports all built in accelerators while qtest_has_kvm() accounts
>>>> only for KVM.
>>>>
>>>> qtest_has_kvm() is collecting info about built-in accelerators at
>>>> configure/build time and that probably could be extended to other
>>>> accelerators (not a thing that I'm interested in at the moment).
>>>> So it could be extended to support the same accelerators
>>>> as currently proposed qtest_has_accel().  
>>>
>>> One minor downside is this forever ties the tests to the build. I have
>>> spoken with people before about the idea of separating the test
>>> artefacts from the build so they can be used either as a) cached test
>>> objects or b) other testing environments, for example verifying the
>>> kernel has not regressed. However we don't do either of those things at
>>> the moment so it's not a major concern.  
>>
>> This is the feature that is interesting RedHat QE too, run the latest
>> qtests on various released binaries to compare performances between
>> releases.
> 
> Currently qtest is only a build only and hard tied to concrete release tests.
> And it's usually mercilessly altered to fit any QEMU interface changes
> new version brings, which in turn breaks idea of testing other QEMU versions
> with it.
> 
> I'd guess it would take *a lot* of effort to make and maintain it
> as external test harness for various QEMU versions.

I had the understanding the outcome of the last 6 months discussions
was "do not tie testing with built binary, we have a machine protocol
to introspect the binary" and "tests should focus on the feature to
test, let's remove the build system burden".

> I think build time qtest used as public CI and external test suite
> are conflicting goals, for the former we probably minimize used
> compute resources while the later is probably run by QA in a more
> controlled manner (unless one integrates that into another CI)

I think we are mixing orthogonal topics here:

* CI time is a constraint, no doubt, we don't want to waste it.

* Tests being buildsys-agnostic

If CI can't run all our tests, it is certainly not a reason for
not adding more tests... We should be able to add as many tests
as we want to the repository. Then we should select which tests
we want to run, because we can't run them all.

Otherwise let's declare no more tests can be added in tests/qtest/
because our CI time is already full ;)

> If I needed something that were to be usable as external test suite,
> I'd look towards acceptance tests which are less depended on QEMU
> internals and versions.
>  
>>> If the worry is about extending test times by having an extra round trip
>>> of a spawn and query step for every test could we not consider caching
>>> the information somewhere? Really any given binary should only need to
>>> be queried once per run, not per test.  
>>
>> Good idea.
> 
> Yep, it should be less taxing, than the currently posted qtest_has_accel()
> version.
> It will reduce worst complexity little bit to
>    probbing_time * #test_binaries * number_targets * #push_req (all_forks)
> but that's still explosive path.


