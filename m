Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EA6BCD3F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclCO-000369-M8; Thu, 16 Mar 2023 06:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarichte@redhat.com>)
 id 1pclCN-00035q-2x
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarichte@redhat.com>)
 id 1pclCI-0002IO-7j
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678963860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExVqNwbEOa466PaR79uwxqNfKqXgU/frjqWmiQojZ3A=;
 b=AarsEg/FBHbS5B9JePBbfWrq3uTVtAiwGASJA5LGnqktIOjVkJPRqv24nLJVODp0dd5dsU
 YXEtNXAZUcGueZIYrTA60OgPBXpYMvMu2UX476J66e40dQzZ3BYkgqoze0QL9Q0Zw0i3w/
 65j+cYPCsmRtG72hjCiWU3T5IkUM8sI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-Lpgk4Pv_MT6q3R0ezso2GA-1; Thu, 16 Mar 2023 06:49:30 -0400
X-MC-Unique: Lpgk4Pv_MT6q3R0ezso2GA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so2429283wma.7
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678963769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExVqNwbEOa466PaR79uwxqNfKqXgU/frjqWmiQojZ3A=;
 b=cygdxre7C2cxOMD/1In5x6F6DEkzAZGrB36vv1m63/E5iGrMvC78iVdp9TNDOjQQSZ
 peFgL3SMnvVI1sNBvbvWzsga/iSh3R1OuWLmoD2qmIYST14cfsBX2bIs0saNrcSUqF56
 qUxxMoVfvwbyqkU5LHvqvHWV0QO3pZq6dWOk3vn1bcvreIVMG27votQ7Jaq5NYHUI8Ks
 4yH6CjWYgP+tcx32bblmnBtPMOoEX8W/9Ze0uyfwE/SZ7vVC9jpDGv7qmZ5gThEe1NYY
 L7sOJf6BLlXfZ3FjJSs16TZiBi/pEeqCvXr/Wut5gFYBOZtNDiLIOgvHLNxof7xmk7/c
 YvAA==
X-Gm-Message-State: AO0yUKVhrk1tBJjXCzGnCVQ4Q8LQJYd4xQ2VPIh7o4xDbBrCRoP6hkQn
 acE78/pDMwuBaVK5yGPUcMxOmpMeUJEAOfhWrVdKguTGv/275WQhB/mNsbIgBr7RB0U71q+Nohv
 3nSY87Rod2iIuGPc=
X-Received: by 2002:a5d:5962:0:b0:2ce:a7b3:1c70 with SMTP id
 e34-20020a5d5962000000b002cea7b31c70mr4024698wri.51.1678963768904; 
 Thu, 16 Mar 2023 03:49:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8cXL9zjcRFZLRrGFVEt/JRZgVBF2GZdbH2E+JaqRSi88xd+rlPO0tsoK1nNZc1lEnOeDDYA==
X-Received: by 2002:a5d:5962:0:b0:2ce:a7b3:1c70 with SMTP id
 e34-20020a5d5962000000b002cea7b31c70mr4024682wri.51.1678963768571; 
 Thu, 16 Mar 2023 03:49:28 -0700 (PDT)
Received: from [192.168.13.102] ([212.24.158.62])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b002cff0e213ddsm4408831wrr.14.2023.03.16.03.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 03:49:28 -0700 (PDT)
Message-ID: <da94e879-adc9-7e6c-2d06-7e5b32e32aa0@redhat.com>
Date: Thu, 16 Mar 2023 11:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/10] python: drop pipenv
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, thuth@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-3-pbonzini@redhat.com>
 <05c4478c-542e-2cb5-3443-f94f1b9dab6a@linaro.org>
 <CAFn=p-bDbwR5ccPXCbfNhtSwCot1_t9dr4BVw0aJyvVQ4VWJhw@mail.gmail.com>
 <6a416627-b4e1-4d23-09a5-ee330755eda6@linaro.org>
From: Jan Richter <jarichte@redhat.com>
In-Reply-To: <6a416627-b4e1-4d23-09a5-ee330755eda6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jarichte@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 3/16/23 09:54, Philippe Mathieu-Daudé wrote:
> On 16/3/23 00:02, John Snow wrote:
>> On Wed, Mar 15, 2023 at 5:17 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> +Jan
>>>
>>> On 22/2/23 15:37, Paolo Bonzini wrote:
>>>> From: John Snow <jsnow@redhat.com>
>>>>
>>>> The pipenv tool was nice in theory, but in practice it's just too hard
>>>> to update selectively, and it makes using it a pain. The qemu.qmp repo
>>>> dropped pipenv support a while back and it's been functioning just 
>>>> fine,
>>>> so I'm backporting that change here to qemu.git.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> ---
>>>>    .gitlab-ci.d/static_checks.yml         |   4 +-
>>>>    python/.gitignore                      |   4 +-
>>>>    python/Makefile                        |  53 ++--
>>>>    python/Pipfile                         |  13 -
>>>>    python/Pipfile.lock                    | 347 
>>>> -------------------------
>>>>    python/README.rst                      |   3 -
>>>>    python/setup.cfg                       |   4 +-
>>>>    python/tests/minreqs.txt               |  45 ++++
>>>>    tests/docker/dockerfiles/python.docker |   1 -
>>>>    9 files changed, 86 insertions(+), 388 deletions(-)
>>>>    delete mode 100644 python/Pipfile
>>>>    delete mode 100644 python/Pipfile.lock
>>>>    create mode 100644 python/tests/minreqs.txt
> 
> 
>>>> diff --git a/python/setup.cfg b/python/setup.cfg
>>>> index 564181570654..9e923d97628f 100644
>>>> --- a/python/setup.cfg
>>>> +++ b/python/setup.cfg
>>>> @@ -33,9 +33,7 @@ packages =
>>>>    * = py.typed
>>>>
>>>>    [options.extras_require]
>>>> -# For the devel group, When adding new dependencies or bumping the 
>>>> minimum
>>>> -# version, use e.g. "pipenv install --dev pylint==3.0.0".
>>>> -# Subsequently, edit 'Pipfile' to remove e.g. 'pylint = "==3.0.0'.
>>>> +# Remember to update tests/minreqs.txt if changing anything below:
>>>>    devel =
>>>>        avocado-framework >= 90.0
>>>
>>> Here >= 90,
>>
>> Yes. The "devel" group for the python packages here requires
>> avocado-framework 90.0 or better... to run the tests *on the python
>> package*.
>>
>>>
>>>>        flake8 >= 3.6.0
>>>> diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
>>>> new file mode 100644
>>>> index 000000000000..dfb8abb155f4
>>>> --- /dev/null
>>>> +++ b/python/tests/minreqs.txt
>>>> @@ -0,0 +1,45 @@
>>>> +# This file lists the ***oldest possible dependencies*** needed to run
>>>> +# "make check" successfully under ***Python 3.6***. It is used 
>>>> primarily
>>>> +# by GitLab CI to ensure that our stated minimum versions in setup.cfg
>>>> +# are truthful and regularly validated.
>>>> +#
>>>> +# This file should not contain any dependencies that are not expressed
>>>> +# by the [devel] section of setup.cfg, except for transitive
>>>> +# dependencies which must be enumerated here explicitly to eliminate
>>>> +# dependency resolution ambiguity.
>>>> +#
>>>> +# When adding new dependencies, pin the very oldest non-yanked version
>>>> +# on PyPI that allows the test suite to pass.
>>>> +
>>>> +# Dependencies for the TUI addon (Required for successful linting)
>>>> +urwid==2.1.2
>>>> +urwid-readline==0.13
>>>> +Pygments==2.9.0
>>>> +
>>>> +# Dependencies for FUSE support for qom-fuse
>>>> +fusepy==2.0.4
>>>> +
>>>> +# Test-runners, utilities, etc.
>>>> +avocado-framework==90.0
>>>
>>> ... and here == 90.
>>
>> Yes. This is the minimum requirements file for the purposes of testing
>> the python code via CI ("python-check-minreqs").
>> It installs *exactly* version 90.0 to ensure that there are no
>> avocado-framework features used in later versions that have
>> accidentally slipped in.
>>
>>>
>>> Anyhow I'm surprised by unreviewed commit 4320f7172f
>>> ("python: bump avocado to v90.0") and we still have:
>>
>> The implication being that it wouldn't have passed review?
> 
> I want to use Avocado 90+ since more than 1 year now as this
> would make my maintainer life easier, but "something" was missing
> and Cleber said he'd address that, then we could move to v90.

Right now in avocado team, we are working on preparations for avocado 
103LTS version which will be released in three months and AFAIK Cleber 
is preparing patch to enable the avocado nrunner and smooth migration of 
tests to avocado 103LTS.

> 
> I suppose the qemu.qmp package is not tested on Darwin/macOS,
> or is not tested with Avocado.
> 
>>> tests/requirements.txt:5:avocado-framework==88.1
>>
>> Developing the python code needs avocado >= 90,
> 
> What do you mean by "Developing the python code"?
> 
>> running the avocado tests needs avocado==88.1.
>>
>>>
>>> 1/ How do you run Avocado tests out of tests/ ?
>>
>> "make check-avocado", the same as anyone else, I assume.
>>
>>>
>>> 2/ Can we use Avocado on Darwin/macOS now? I thought we
>>> needed one series from Cleber [*] for that, which is why
>>> QEMU is the last project using the 'old' runner (as opposed
>>> to the 'new' runner which is the upstream /current/ one).
>>
>> I have no idea. I'm going to guess that you're wondering if you can
>> run the avocado *qemu* tests on Darwin/macOS, and I wouldn't know - I
>> don't develop avocado or those tests, and I don't have a mac.
> 
> Well currently we can not run Avocado on Darwin/macOS (at least since
> macOS Big Sur which is where I started).

Avocado doesn't official support macOS, but Cleber just have created a 
patch [1] which might make avocado tests available on macOS in the 
future. But unfortunately still without official support.

[1] https://github.com/avocado-framework/avocado/pull/5622


> 


