Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD32C8179
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:54:37 +0100 (CET)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjftE-0004CD-PC
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfrN-0002jX-Rx
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfrK-0000cc-9P
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606729956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g11VK0gTGLEg7rNzqtjLiszxokMdQuwFCxWw/RSu7b8=;
 b=FZ1EtkkTX08Wa/go7GtpU8KiOmXXoU6av3D530C5wenrw+hE1AhwjTpbZd2gS3tqOpayhV
 NUldoAS4sqguthCgWdkU9hTy9KDOAxE10Yj23Dlrg+hzg3/s+BXkXVDoIyCIQPhwoUd+Iu
 e/AZzjTqbISF9ulR4+FMNd0q39nz4ak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-DbvYJnlHNn-AijjBvU1vAg-1; Mon, 30 Nov 2020 04:52:34 -0500
X-MC-Unique: DbvYJnlHNn-AijjBvU1vAg-1
Received: by mail-wm1-f71.google.com with SMTP id v5so7215248wmj.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g11VK0gTGLEg7rNzqtjLiszxokMdQuwFCxWw/RSu7b8=;
 b=sCx3tzZs7Dv7M1bIMYof4jVzlfEVrnQbigOJbxsMCOBgIoj6uJTjgnZ+vrcGYNoJuc
 a3F9CZnSoM8N7tJIGP++8+leiEbi1RuNU+6fpBUzz2NctQkkwximquTj99hqT5wkrS2P
 BfodmHeQfanAoG84PSoX2rbQXcMv6fblGwMsBK/svLnLdp5w5whk3qGCZEAm8XPffRqj
 SlWgc6j2kWPfVxOaIIMq0yxVhqdQSNFTV+YRK4yxVknpqSbXe4XmB3K9Pj0+MafmILlD
 //oBwEy1xfUg6xyA/goYN+3fxa/1kFzs37kWRBI/UzAUgTmA9iHmb6CnRHWs1r+b9c/p
 R7tQ==
X-Gm-Message-State: AOAM5311wyO7R75ow1WH2wzPTSGyITQdvemEDe4UT2iV9jgMqvI4yqTx
 XpQiqk+QlVDPwpX2KW+4nX3JYNtGzeID/Nyygyv9z7BHPbEDKyqkA/PQr2pxjZ3AhGdDJvv3GTK
 46j3wwpVDp9vRMAo=
X-Received: by 2002:a1c:9c53:: with SMTP id f80mr22207704wme.19.1606729953112; 
 Mon, 30 Nov 2020 01:52:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5U80urM9NUKyqgZJ3pW+CKFR6mlKjqm6gP1gpWLqz85XrJbkqi5GTqq2fvaBd+WhxPSLC/Q==
X-Received: by 2002:a1c:9c53:: with SMTP id f80mr22207677wme.19.1606729952816; 
 Mon, 30 Nov 2020 01:52:32 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id q12sm25764954wrx.86.2020.11.30.01.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:52:32 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
 <ec7e0016-7d10-49bf-0af2-69de8356bbed@redhat.com>
 <5a854d27-ac95-76ff-5014-be80239de796@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e3809d7-8342-6578-d6aa-f1e7bccdaf95@redhat.com>
Date: Mon, 30 Nov 2020 10:52:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5a854d27-ac95-76ff-5014-be80239de796@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 10:03 AM, Thomas Huth wrote:
> On 27/11/2020 19.46, Philippe Mathieu-Daudé wrote:
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
> It's like with all the other tests: Most of the people do not really care
> about them (if they are not the author of a test) unless the test fails
> during "make check" / the gating CI of Peter. So IMHO the right way to go is
> to finally get these in the gating CI, otherwise, if you now even disable
> them in the gitlab-CI by default, they will bitrot completely.

Maybe it is up to each maintainer? Some tests are hard to reproduce,
I'd prefer have them committed in the repository to allow someone to
run it later and eventually fix it if it bitrot, rather than having
pieces of code we don't know if they are tested, who use them, and
we are scared to remove.

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
> I don't think this is related to the fact that we've seen some failures in
> the gitlab-CI.
> 
> People might rather be either not aware of the "acceptance" tests yet, or
> might be uncomfortable with Python, or might just not be interested in
> writing tests at all.
> 
> Same problem also exists e.g. with the new qos-test framework since it was
> introduced in 2018. Only very few people contributed new tests here, though
> it is quite a powerful frameworks to test various combinations of devices.
> 
> I think if you want to promote a testing framework, you have to do some
> lobby work ... advertise it in blog posts, make sure that there is proper
> documentation and easy examples which can be used as a base for new tests, etc.

I certainly don't want to promote any particular framework. I don't
care what is used. What I want is to add more tests. And I would like
developers to focus on what feature they want to test, and not on
fixing refcount leak in the test itself.

If qos-test is sufficient to replace what we have in Python, I'm happy
if someone port the Python tests to it.

> 
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
> Well, maybe you should follow-up on that series instead?

OK.

> 
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
> Well, but we do not have any other framework in place yet which could
> replace the current one, so simply disabling the tests now will only allow
> more regressions to creep in, and then you'll have a hard time to get to the
> state again where we were before.
> 
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
> 
> Actually, that's true for me for all tests that are written in Python ...
> <sarcasm>Maybe we should simply ditch all python code in the QEMU
> repo?</sarcasm>

Also true with Perl and Rust. The community is wide, hard
to include everybody and keep people happy.
>> Thus the removal suggestion, so we can "fix" the missing Avocado parts
>> before it is used heavily.
> 
> Now you somewhat contradict yourself. You just claimed that there are hardly
> any contributions to this part of the test suite, and now you're afraid that
> it might get used too heavily before it can be replaced with something else?
> No, sorry, that does not make much sense to me. Thus please make sure to
> provide a better framework first before disabling the stuff that we
> currently have.

Fine, I'll follow the other alternatives:

- provide a better framework,
- do nothing.

Thanks,

Phil.


