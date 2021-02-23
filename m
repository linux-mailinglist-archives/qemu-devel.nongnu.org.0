Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D0322FB5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:35:19 +0100 (CET)
Received: from localhost ([::1]:52408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbag-0000Ht-Ec
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEbZt-0008J4-UG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEbZq-0001lU-1W
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614101662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g3jgm/26vjkE8ubyuQ/5FAIu9NQCykI566mOWHLqc4=;
 b=ScaW1jroReabbsCRiDyaq085SftgYbBHC06QIdliGRjuNoiMhc9kuNz/XarutnqnxCF7tD
 e/FguyeggI1mqZVopGImxUYspmKuXTDJSyA1POZLNqJumkD0j0sTE2kOSDduuuJJ/RasV8
 ykm83XcZXdsliCFu4cE0Pu9FwXlVCmI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-iLGzs_NpMjiP-LKiwx7Zgg-1; Tue, 23 Feb 2021 12:34:12 -0500
X-MC-Unique: iLGzs_NpMjiP-LKiwx7Zgg-1
Received: by mail-ej1-f70.google.com with SMTP id m4so5655940ejc.14
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 09:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8g3jgm/26vjkE8ubyuQ/5FAIu9NQCykI566mOWHLqc4=;
 b=cfqMR6ADMgACLfNGHyYIF7vINejNWwxDgCGsTn1pPj2MvtyWMmCBfrZzPfcK+kyXGe
 Ja1i/xHV/RfH4umG72dGMF0mEcpE4ZPRK0bsnBXJLFMrWPwQy9yhcNP+40teeCLZwtfi
 8Hp9VxgnFP8fQksZVMofuUJuJkUio5tPshLD4F64NsgUIQFr//HvVJTTeolwmJgQtYbg
 b5cBA9W0fYAPrpHq2jYumSlBgMPkGTffP4zCN4V3DGiF9ttq7oTdoKy0UdmOwH/MCBlf
 abugW2r9sNgynW3Z4z6hVZ9kl5bgVchYayo+JIW9DMPhooFteE8t/XPVI90K0b4piFBT
 OpEA==
X-Gm-Message-State: AOAM530C43tgzKuW8U1S6t+0SRb9p0foi/YlM7hyqdal6MGyV2ScmixX
 ThwnEa3MTBEFCMbK4eXvCzqT8MzhtEnPKT2op7mNkptW3SWtbl3pnvem0Wlu0TGTaqM461gtWYT
 ZyjitOyL5oYUBI+M=
X-Received: by 2002:a50:e14d:: with SMTP id i13mr28917686edl.106.1614101650211; 
 Tue, 23 Feb 2021 09:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvTDhTmimm7Cb8yDTkuPq57pmk4k9KeyScLQTa0kTZrAnU1fbl+kTv4+2jcdB3aGcNa34ZgA==
X-Received: by 2002:a50:e14d:: with SMTP id i13mr28917652edl.106.1614101649988; 
 Tue, 23 Feb 2021 09:34:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m26sm8029373eja.6.2021.02.23.09.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 09:34:09 -0800 (PST)
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
 <20210223164718.GA987581@amachine.somewhere>
 <8de62a35-7e66-b182-a182-4d021b713b5a@redhat.com>
Message-ID: <bf8a9dd0-c20f-7bef-ae65-2c3c1e10da68@redhat.com>
Date: Tue, 23 Feb 2021 18:34:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8de62a35-7e66-b182-a182-4d021b713b5a@redhat.com>
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 6:24 PM, Philippe Mathieu-Daudé wrote:
> On 2/23/21 5:47 PM, Cleber Rosa wrote:
>> On Tue, Feb 23, 2021 at 05:37:04PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 2/23/21 12:25 PM, Thomas Huth wrote:
>>>> On 19/02/2021 22.58, Cleber Rosa wrote:
>>>>> As described in the included documentation, the "custom runner" jobs
>>>>> extend the GitLab CI jobs already in place.  One of their primary
>>>>> goals of catching and preventing regressions on a wider number of host
>>>>> systems than the ones provided by GitLab's shared runners.
>>>>>
>>>>> This sets the stage in which other community members can add their own
>>>>> machine configuration documentation/scripts, and accompanying job
>>>>> definitions.  As a general rule, those newly added contributed jobs
>>>>> should run as "non-gating", until their reliability is verified (AKA
>>>>> "allow_failure: true").
>>>>>
>>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>>>> ---
>>>>>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>>>>>   .gitlab-ci.yml                  |  1 +
>>>>>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>>>>>   docs/devel/index.rst            |  1 +
>>>>>   4 files changed, 44 insertions(+)
>>>>>   create mode 100644 .gitlab-ci.d/custom-runners.yml
>>>>>   create mode 100644 docs/devel/ci.rst
>>>>>
>>>>> diff --git a/.gitlab-ci.d/custom-runners.yml
>>>>> b/.gitlab-ci.d/custom-runners.yml
>>>>> new file mode 100644
>>>>> index 0000000000..3004da2bda
>>>>> --- /dev/null
>>>>> +++ b/.gitlab-ci.d/custom-runners.yml
>>>>> @@ -0,0 +1,14 @@
>>>>> +# The CI jobs defined here require GitLab runners installed and
>>>>> +# registered on machines that match their operating system names,
>>>>> +# versions and architectures.  This is in contrast to the other CI
>>>>> +# jobs that are intended to run on GitLab's "shared" runners.
>>>>> +
>>>>> +# Different than the default approach on "shared" runners, based on
>>>>> +# containers, the custom runners have no such *requirement*, as those
>>>>> +# jobs should be capable of running on operating systems with no
>>>>> +# compatible container implementation, or no support from
>>>>> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
>>>>> +# reusing the GIT repository, let's enable the recursive submodule
>>>>> +# strategy.
>>>>> +variables:
>>>>> +  GIT_SUBMODULE_STRATEGY: recursive
>>>>
>>>> Is it really necessary? I thought our configure script would take care
>>>> of the submodules?
>>>
>>
>> I've done a lot of testing on bare metal systems, and the problems
>> that come from reusing the same system and failed cleanups can be very
>> frustrating.  It's unfortunate that we need this, but it was the
>> simplest and most reliable solution I found.  :/
>>
>> Having said that, I noticed after I posted this series that this is
>> affecting all other jobs.  We don't need it that in the jobs based
>> on containers (for obvious reasons), so I see two options:
>>
>> 1) have it enabled on all jobs for consistency
>>
>> 2) have it enabled only on jobs that will reuse the repo
>>
>>> Well, if there is a failure during the first clone (I got one network
>>> timeout in the middle) 
> 
> [This network failure is pasted at the end]
> 
>>> then next time it doesn't work:
>>>
>>> Updating/initializing submodules recursively...
>>> Synchronizing submodule url for 'capstone'
>>> Synchronizing submodule url for 'dtc'
>>> Synchronizing submodule url for 'meson'
>>> Synchronizing submodule url for 'roms/QemuMacDrivers'
>>> Synchronizing submodule url for 'roms/SLOF'
>>> Synchronizing submodule url for 'roms/edk2'
>>> Synchronizing submodule url for
>>> 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
>>> Synchronizing submodule url for
>>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
>>> Synchronizing submodule url for
>>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
>>> Synchronizing submodule url for
>>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsort'
>>> Synchronizing submodule url for
>>> 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
>>> Synchronizing submodule url for
>>> 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
>>> Synchronizing submodule url for
>>> 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
>>> Synchronizing submodule url for
>>> 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'

So far, beside the repository useful for QEMU, I cloned:

- boringssl
- krb5
- pyca-cryptography
- esaxx
- libdivsufsort
- oniguruma
- openssl
- brotli
- cmocka

But reach the runner time limit of 2h.

The directory reports 3GB of source code.

I don't think the series has been tested enough before posting,
I'm stopping here my experiments.

Regards,

Phil.


