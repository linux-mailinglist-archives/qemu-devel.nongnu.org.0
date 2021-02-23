Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85293322EF0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:41:12 +0100 (CET)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEakJ-0001vl-0T
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEah9-0000cZ-8q
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEagr-0001wJ-1M
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614098255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyU6KVGXqMAP46/Wj3ApNP5H1Wuw8mZraGX+slkwLy4=;
 b=g8sRAEUA3PzgflpwxAA6giOdmdWafZho2+fPUsoVA7WluMNUFfxK2Z3wm9toAQnbE+rqZW
 ISatrI/Pj6RcYwRLGrN3k4OTZw3rdm6vWijii9KnPuh8rTpemZ+EJB1a8ftYqtebWufu4K
 EgopNF2LiMK7ySvWcexupN9qQHMGSYY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-9sA5K4TmM6G0vyr2e3Aqiw-1; Tue, 23 Feb 2021 11:37:07 -0500
X-MC-Unique: 9sA5K4TmM6G0vyr2e3Aqiw-1
Received: by mail-ed1-f71.google.com with SMTP id c7so1880106ede.17
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RyU6KVGXqMAP46/Wj3ApNP5H1Wuw8mZraGX+slkwLy4=;
 b=XXDzkqQ0Ear3hWRnHOBdTguz4hL+fbM+AAaimrchyHUAtGlbg9a/yMAlR8aScOZ6IZ
 SK9pI/YlqIScpyOo5XQvalAmoZUJL3lCLE66xJF/p1i3zcAzIubP7alQ8wim9hi+jNVN
 IuewTN+dlxlMlkvMWcW44PwhNGMVdyOT2VD5lB8k/YdraEFxZR5a1q1OyxEZ3jBwQsfb
 a1y4PI6v7LY7rz3ykrt2sfmYu8SCc+TCROBIj6px32mBXnH/gNaqgsTHzbIc0XEm5xXB
 zWEQoQBkx06BY4EYQQRWO3PSe61o1atmI15Xe/M9fYhFBQC6lym7bf1jVrXR4y+g6Y7D
 lc/w==
X-Gm-Message-State: AOAM530DwRePwuedDf6XfSL0C+OvpGKuJ55axjmytt+A/LHdtqB0D8Cj
 P6g43ggOg5e4zug2grkKOvLFIVsNlpjClE876X4msIS+nJ/UU/JwZjUnGPtHCLV9rwUtm0TLPL+
 Z4NfHUm1lq3xYMdk=
X-Received: by 2002:a05:6402:3589:: with SMTP id
 y9mr29363439edc.344.1614098226540; 
 Tue, 23 Feb 2021 08:37:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlhHGeChSNyuI9w7ZWrFvZHxGbg12PKXD3313m4xvC5Zk+pIYyYPuPId3oXdfQudtGburHbQ==
X-Received: by 2002:a05:6402:3589:: with SMTP id
 y9mr29363402edc.344.1614098226262; 
 Tue, 23 Feb 2021 08:37:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hc40sm12203277ejc.50.2021.02.23.08.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 08:37:05 -0800 (PST)
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
Date: Tue, 23 Feb 2021 17:37:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 12:25 PM, Thomas Huth wrote:
> On 19/02/2021 22.58, Cleber Rosa wrote:
>> As described in the included documentation, the "custom runner" jobs
>> extend the GitLab CI jobs already in place.  One of their primary
>> goals of catching and preventing regressions on a wider number of host
>> systems than the ones provided by GitLab's shared runners.
>>
>> This sets the stage in which other community members can add their own
>> machine configuration documentation/scripts, and accompanying job
>> definitions.  As a general rule, those newly added contributed jobs
>> should run as "non-gating", until their reliability is verified (AKA
>> "allow_failure: true").
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>>   .gitlab-ci.yml                  |  1 +
>>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>>   docs/devel/index.rst            |  1 +
>>   4 files changed, 44 insertions(+)
>>   create mode 100644 .gitlab-ci.d/custom-runners.yml
>>   create mode 100644 docs/devel/ci.rst
>>
>> diff --git a/.gitlab-ci.d/custom-runners.yml
>> b/.gitlab-ci.d/custom-runners.yml
>> new file mode 100644
>> index 0000000000..3004da2bda
>> --- /dev/null
>> +++ b/.gitlab-ci.d/custom-runners.yml
>> @@ -0,0 +1,14 @@
>> +# The CI jobs defined here require GitLab runners installed and
>> +# registered on machines that match their operating system names,
>> +# versions and architectures.  This is in contrast to the other CI
>> +# jobs that are intended to run on GitLab's "shared" runners.
>> +
>> +# Different than the default approach on "shared" runners, based on
>> +# containers, the custom runners have no such *requirement*, as those
>> +# jobs should be capable of running on operating systems with no
>> +# compatible container implementation, or no support from
>> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
>> +# reusing the GIT repository, let's enable the recursive submodule
>> +# strategy.
>> +variables:
>> +  GIT_SUBMODULE_STRATEGY: recursive
> 
> Is it really necessary? I thought our configure script would take care
> of the submodules?

Well, if there is a failure during the first clone (I got one network
timeout in the middle) then next time it doesn't work:

Updating/initializing submodules recursively...
Synchronizing submodule url for 'capstone'
Synchronizing submodule url for 'dtc'
Synchronizing submodule url for 'meson'
Synchronizing submodule url for 'roms/QemuMacDrivers'
Synchronizing submodule url for 'roms/SLOF'
Synchronizing submodule url for 'roms/edk2'
Synchronizing submodule url for
'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
Synchronizing submodule url for
'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
Synchronizing submodule url for
'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
Synchronizing submodule url for
'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsort'
Synchronizing submodule url for
'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
Synchronizing submodule url for
'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
Synchronizing submodule url for
'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
Synchronizing submodule url for
'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
Synchronizing submodule url for 'roms/ipxe'
Synchronizing submodule url for 'roms/openbios'
Synchronizing submodule url for 'roms/opensbi'
Synchronizing submodule url for 'roms/qboot'
Synchronizing submodule url for 'roms/qemu-palcode'
Synchronizing submodule url for 'roms/seabios'
Synchronizing submodule url for 'roms/seabios-hppa'
Synchronizing submodule url for 'roms/sgabios'
Synchronizing submodule url for 'roms/skiboot'
Synchronizing submodule url for 'roms/u-boot'
Synchronizing submodule url for 'roms/u-boot-sam460ex'
Synchronizing submodule url for 'roms/vbootrom'
Synchronizing submodule url for 'slirp'
Synchronizing submodule url for 'tests/fp/berkeley-softfloat-3'
Synchronizing submodule url for 'tests/fp/berkeley-testfloat-3'
Synchronizing submodule url for 'ui/keycodemapdb'
Entering 'capstone'
Entering 'dtc'
Entering 'meson'
Entering 'roms/QemuMacDrivers'
Entering 'roms/SLOF'
Entering 'roms/edk2'
Entering 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
Entering
'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsort'
Entering 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
Entering 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
Entering 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
Entering 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
Entering 'roms/ipxe'
Entering 'roms/openbios'
Entering 'roms/opensbi'
Entering 'roms/qboot'
Entering 'roms/qemu-palcode'
Entering 'roms/seabios'
Entering 'roms/seabios-hppa'
Entering 'roms/sgabios'
Entering 'roms/skiboot'
Entering 'roms/u-boot'
Entering 'roms/u-boot-sam460ex'
Entering 'roms/vbootrom'
Entering 'slirp'
Entering 'tests/fp/berkeley-softfloat-3'
Entering 'tests/fp/berkeley-testfloat-3'
Entering 'ui/keycodemapdb'
Entering 'capstone'
HEAD is now at f8b1b833 fix CS_ mips_ OP structure comment error (#1674)
Entering 'dtc'
HEAD is now at 85e5d83 Makefile: when building libfdt only, do not add
unneeded deps
Entering 'meson'
HEAD is now at 776acd2a8 Bump versions to 0.55.3 for release
Entering 'roms/QemuMacDrivers'
HEAD is now at 90c488d Merge pull request #3 from
mcayland/fix/unbreak-256-color-mode
Entering 'roms/SLOF'
HEAD is now at e18ddad version: update to 20200717
Entering 'roms/edk2'
HEAD is now at 06dc822d04 Revert ".pytool/EccCheck: Disable Ecc error
code 10014 for open CI"
Entering 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
HEAD is now at b64af41 Fix typo in function
'softfloat_propagateNaNF128M' for RISC-V.
Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
HEAD is now at 666c328 Make types of variable match (#796)
Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
HEAD is now at ca7cb33 move to git
Entering
'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsort'
HEAD is now at 5f60d6f Merge pull request #7 from kloetzl/master
Entering 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
Entering 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
HEAD is now at 63be8a9 unichr was removed in Python 3 because all str
are Unicode (#877)
Entering 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
HEAD is now at b2c1da6 add ONIG_OPTION_CALLBACK_EACH_MATCH test
Entering 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
HEAD is now at 160dffe Don't use non-literal format strings
Entering 'roms/ipxe'
HEAD is now at 4bd064de [build] Fix building on older versions of gcc
Entering 'roms/openbios'
HEAD is now at 7f28286 PPC: mark first 4 pages of physical and virtual
memory as unavailable
Entering 'roms/opensbi'
HEAD is now at a98258d include: Bump-up version to 0.8
Entering 'roms/qboot'
HEAD is now at a5300c4 qboot: Disable PIE for ELF binary build step
Entering 'roms/qemu-palcode'
HEAD is now at bf0e136 Report machine checks to the kernel
Entering 'roms/seabios'
HEAD is now at 155821a docs: Note v1.14.0 release
Entering 'roms/seabios-hppa'
HEAD is now at 73b740f7 parisc: Set text planes and used_bits in STI fields
Entering 'roms/sgabios'
HEAD is now at cbaee52 SGABIOS: fix wrong video attrs for int 10h, ah==13h
Entering 'roms/skiboot'
HEAD is now at 3a6fdede skiboot v6.4 release notes
Entering 'roms/u-boot'
HEAD is now at d3689267f9 Prepare v2019.01
Entering 'roms/u-boot-sam460ex'
HEAD is now at 60b3916 Add README to clarify relation to U-Boot and
ACube's version
Entering 'roms/vbootrom'
HEAD is now at 0c37a43 Merge pull request #1 from google/disable-build-id
Entering 'slirp'
HEAD is now at 8f43a99 Merge branch 'stable-4.2' into 'stable-4.2'
Entering 'tests/fp/berkeley-softfloat-3'
HEAD is now at b64af41 Fix typo in function
'softfloat_propagateNaNF128M' for RISC-V.
Entering 'tests/fp/berkeley-testfloat-3'
HEAD is now at 5a59dce fail: constify fail_programName
Entering 'ui/keycodemapdb'
HEAD is now at 6119e6e Fix scan codes for Korean keys
fatal: Needed a single revision
Unable to find current revision in submodule path
'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
Failed to recurse into submodule path 'roms/edk2'
ERROR: Job failed: exit status 1


