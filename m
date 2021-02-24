Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C084323BBC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:01:04 +0100 (CET)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsql-0000Dv-8z
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsnq-0006n9-7H
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:58:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsnn-00068v-Km
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614167879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6JlI+oxSuFG6xjj3hCWW73ddZt1HoVC/bkiuBsWaAg=;
 b=M+BgAnzW8YkeJKoDi7LY7zET+7jqlf3CQ+4jq5i5svctVVeeZf3wp7HVXO6aWPjLYVE8rC
 FRoIvNZCEooM33UWquVOmZ4WkBFMbLArOK7ZQHLcHtmjZql05yjiGTLToI1megY3tpF+NH
 r7yRtmLqH9bBFEaICXbiut7J+OY/Mr4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-QWkmEzh1MRC6lUjCPDrxlw-1; Wed, 24 Feb 2021 06:57:56 -0500
X-MC-Unique: QWkmEzh1MRC6lUjCPDrxlw-1
Received: by mail-wm1-f69.google.com with SMTP id f18so185026wmq.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6JlI+oxSuFG6xjj3hCWW73ddZt1HoVC/bkiuBsWaAg=;
 b=PqDpvoCufVxtY+vSrXyLmkdivlMRQr6SYQguyy9DExYVBfupbMxLkCAy89A+4YoRlf
 Bb611LNji9R/o99OK8H+SV9hB2yCHji6kwz5930v/XnnJ8FbCZSUHXucS6rmej7HGNnj
 5c4EZ7MaQugAkBfeqPwDFSjoot319WSfqHDCd3CEVAXsggSf2imU13ipHRMnYfTASKUJ
 Sz01yIu1E7ZAKBVSK89lIFHr/CJ5+nG+PLlhuHZ/2W9Ak8ejmfhySxbZGcfXWW+q9QT7
 MA41xXKF69rtM8NPf3hoysjDrlNuoUKyoUHW1aT/5wNFgR/eBa08IVFyzW7iwnqLcwBO
 aPjw==
X-Gm-Message-State: AOAM532G0MPb+cHEa6NRJRs3WAp8XfamgstILQbjh5AhJygOVDCYi6iw
 bEUi38cRCSmshnRCNub3BaJ4gUpyIgOeg1TsIDLTG29/VkgSGZlqrQdxzbNM+lAmxr9mwlalize
 7WKEeS/w6d7N3GgM=
X-Received: by 2002:a1c:f702:: with SMTP id v2mr3298113wmh.131.1614167875111; 
 Wed, 24 Feb 2021 03:57:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjB45CW5/YGQC/pPSNGByTIuqTI0z7fivy0O4Th7/Uz8wR2dNkIMUXl7owDxJnd9HuyY/CIg==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr3298087wmh.131.1614167874808; 
 Wed, 24 Feb 2021 03:57:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q18sm3197336wrw.91.2021.02.24.03.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 03:57:53 -0800 (PST)
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: Cleber Rosa <crosa@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
 <20210223164718.GA987581@amachine.somewhere>
 <8de62a35-7e66-b182-a182-4d021b713b5a@redhat.com>
 <bf8a9dd0-c20f-7bef-ae65-2c3c1e10da68@redhat.com>
 <20210223180932.GF987581@amachine.somewhere>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b1ec9717-01bf-1e5e-a3f7-6c2d0f87d1a1@redhat.com>
Date: Wed, 24 Feb 2021 12:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223180932.GF987581@amachine.somewhere>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 7:09 PM, Cleber Rosa wrote:
> On Tue, Feb 23, 2021 at 06:34:07PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/23/21 6:24 PM, Philippe Mathieu-Daudé wrote:
>>> On 2/23/21 5:47 PM, Cleber Rosa wrote:
>>>> On Tue, Feb 23, 2021 at 05:37:04PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 2/23/21 12:25 PM, Thomas Huth wrote:
>>>>>> On 19/02/2021 22.58, Cleber Rosa wrote:
>>>>>>> As described in the included documentation, the "custom runner" jobs
>>>>>>> extend the GitLab CI jobs already in place.  One of their primary
>>>>>>> goals of catching and preventing regressions on a wider number of host
>>>>>>> systems than the ones provided by GitLab's shared runners.
>>>>>>>
>>>>>>> This sets the stage in which other community members can add their own
>>>>>>> machine configuration documentation/scripts, and accompanying job
>>>>>>> definitions.  As a general rule, those newly added contributed jobs
>>>>>>> should run as "non-gating", until their reliability is verified (AKA
>>>>>>> "allow_failure: true").
>>>>>>>
>>>>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>>>>>> ---
>>>>>>>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>>>>>>>   .gitlab-ci.yml                  |  1 +
>>>>>>>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>>>>>>>   docs/devel/index.rst            |  1 +
>>>>>>>   4 files changed, 44 insertions(+)
>>>>>>>   create mode 100644 .gitlab-ci.d/custom-runners.yml
>>>>>>>   create mode 100644 docs/devel/ci.rst
>>>>>>>
>>>>>>> diff --git a/.gitlab-ci.d/custom-runners.yml
>>>>>>> b/.gitlab-ci.d/custom-runners.yml
>>>>>>> new file mode 100644
>>>>>>> index 0000000000..3004da2bda
>>>>>>> --- /dev/null
>>>>>>> +++ b/.gitlab-ci.d/custom-runners.yml
>>>>>>> @@ -0,0 +1,14 @@
>>>>>>> +# The CI jobs defined here require GitLab runners installed and
>>>>>>> +# registered on machines that match their operating system names,
>>>>>>> +# versions and architectures.  This is in contrast to the other CI
>>>>>>> +# jobs that are intended to run on GitLab's "shared" runners.
>>>>>>> +
>>>>>>> +# Different than the default approach on "shared" runners, based on
>>>>>>> +# containers, the custom runners have no such *requirement*, as those
>>>>>>> +# jobs should be capable of running on operating systems with no
>>>>>>> +# compatible container implementation, or no support from
>>>>>>> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
>>>>>>> +# reusing the GIT repository, let's enable the recursive submodule
>>>>>>> +# strategy.
>>>>>>> +variables:
>>>>>>> +  GIT_SUBMODULE_STRATEGY: recursive
>>>>>>
>>>>>> Is it really necessary? I thought our configure script would take care
>>>>>> of the submodules?
>>>>>
>>>>
>>>> I've done a lot of testing on bare metal systems, and the problems
>>>> that come from reusing the same system and failed cleanups can be very
>>>> frustrating.  It's unfortunate that we need this, but it was the
>>>> simplest and most reliable solution I found.  :/
>>>>
>>>> Having said that, I noticed after I posted this series that this is
>>>> affecting all other jobs.  We don't need it that in the jobs based
>>>> on containers (for obvious reasons), so I see two options:
>>>>
>>>> 1) have it enabled on all jobs for consistency
>>>>
>>>> 2) have it enabled only on jobs that will reuse the repo
>>>>
>>>>> Well, if there is a failure during the first clone (I got one network
>>>>> timeout in the middle) 
>>>
>>> [This network failure is pasted at the end]
>>>
>>>>> then next time it doesn't work:
>>>>>
>>>>> Updating/initializing submodules recursively...
>>>>> Synchronizing submodule url for 'capstone'
>>>>> Synchronizing submodule url for 'dtc'
>>>>> Synchronizing submodule url for 'meson'
>>>>> Synchronizing submodule url for 'roms/QemuMacDrivers'
>>>>> Synchronizing submodule url for 'roms/SLOF'
>>>>> Synchronizing submodule url for 'roms/edk2'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsort'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
>>>>> Synchronizing submodule url for
>>>>> 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
>>
>> So far, beside the repository useful for QEMU, I cloned:
>>
>> - boringssl
>> - krb5
>> - pyca-cryptography
>> - esaxx
>> - libdivsufsort
>> - oniguruma
>> - openssl
>> - brotli
>> - cmocka
>>
> 
> Hi Phil,
> 
> I'm not following what you meant by "I cloned"... Are you experimenting
> with this on a machine of your own and manually cloning the submodules?

I meant "my test runner has been cloning ..."

>> But reach the runner time limit of 2h.

The first failure was 1h, I raised the job limit to the maximum
I could use for this runner, 2h.

>> The directory reports 3GB of source code.
>>
>> I don't think the series has been tested enough before posting,
> 
> Please take into consideration that this series, although simple in
> content, touches and interacts with a lot of moving pieces, and
> possibly with personal systems that I did not have, or will have,
> access to.  As far as public testing proof goes, you can see a
> pipeline here with this version of this series here:
> 
>    https://gitlab.com/cleber.gnu/qemu/-/pipelines/258982039/builds

Expand the timeout and retry the same job on the same runner
various times:

diff --git a/.gitlab-ci.d/custom-runners.yml
b/.gitlab-ci.d/custom-runners.yml
@@ -17,6 +17,7 @@ variables:
 # setup by the scripts/ci/setup/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
 ubuntu-18.04-s390x-all-linux-static:
+ timeout: 2h 30m
  allow_failure: true
  needs: []
  stage: build

Each time it will clone more submodules.

I stopped at the 3rd intent.

> As I said elsewhere, I only noticed the recursive submodule being
> applied to the existing jobs after I submitted the series.  Mea culpa.
> But:
> 
>  * none of the jobs took noticeably longer than the previous baseline
>  * there was one *container build failure* (safe to say it's not
>    related)
>  * all other jobs passed successfully

I had less luck then (see the docker-dind jobs started on the custom
runner commented elsewhere in this thread).

> And, along with the previous versions, this series were tested on all
> the previously included architectures and operating systems.  It's
> unfortunate that because of your experience at this time (my
> apologies), you don't realize the amount of testing done so far.

As I commented to Erik on IRC, the single difference I did
is use the distribution runner, not the official one:

$ sudo apt-get install gitlab-runner docker.io

Then registered changing the path (/usr/bin/gitlab-runner instead
of /usr/local/bin/gitlab-runner). Everything else left unchanged.

>> I'm stopping here my experiments.
>>
>> Regards,
>>
>> Phil.
>>
> 
> I honestly appreciate your help here up to this point.
> 
> Regards,
> - Cleber.
> 


