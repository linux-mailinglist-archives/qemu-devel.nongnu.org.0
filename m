Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36586EA7E3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppngV-0006gP-RL; Fri, 21 Apr 2023 06:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppngT-0006fp-6r
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:08:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppngR-0000VU-4v
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:08:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso958239f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682071681; x=1684663681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReHNjkIDoWkUpGRJS8gQsbm/eBQuxGHSsdTGePOJUGs=;
 b=QlIeXXiwV4WC+IGlPT1Z22kSn02uQtL9IAfm+jc2Lu6f5gHZVs2UsvwMMSxCdAAxeB
 EyUmH70ygTt7ik/UxE+jDJJhnMZ0FKN8lOxQICAE91NrcktWvvAaSJtR+Bq9pW7v46ZB
 WGPxXz3ZlHewz7MpXTH/xPlGd2OfN9OO+IZ6uTqHed9kuou22NY2R6w2V81AFc9t0Q7R
 J0NxKXmp7TXQivzAfZiEmnWDQj+XU5zZ50OiIcvW0FvUTkuZalpwopar6fZGDDvUw9ZM
 bXy+KFrUgv2L4GOfslQUVYStEnYK0EPxV0e/7vmv/g62QYMDbVp8RNkf5Hvar3bFEGDZ
 BKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682071681; x=1684663681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ReHNjkIDoWkUpGRJS8gQsbm/eBQuxGHSsdTGePOJUGs=;
 b=TaC1hht3YW7Ff8lTw5mxOoB+xP83GrueAXkJOSOlPzhd9NE0+Pugbnkyzb7mF5niAA
 ovDrkxB7lthV6Y3bpdsFGDbmqaa/tVgxi9PLOOQwVT2j6ONNvW2vDpS/lO0HrdrewHOI
 l2fQrjPaLY8wdh2o6K/BtneCJamPWjyHfScXWEMWHxurQwDTm0thUuHrB0Ttrs5MqCmv
 /BcH6RgTpiou2ZE3cVA4hJz3SZtXPQuXtDAxnUoabM63M85YOo8IuwFDgTi0HSEuAtoQ
 1PYWfgh62zLcZbzmLcQ0Oi3IpW5QRq8/iIC6tSYdscKbrNMM2QTsFHcs7UL1BmhVMZAQ
 u4zw==
X-Gm-Message-State: AAQBX9fdIYdf8iIBqm/eRC+E74eBo3iby+nBaxqVd0lti31jAmGrkQX6
 nk1hxhYYLp0ynFMrV2VNx43iIg==
X-Google-Smtp-Source: AKy350aElyiRgIp0WxW93eVSqUXG3mEip2ECwbk2smqtWJjcc3nfmH1LGGWoRF+9gIRsE/8BmnkhDQ==
X-Received: by 2002:a5d:540f:0:b0:2f9:4fe9:74df with SMTP id
 g15-20020a5d540f000000b002f94fe974dfmr3373180wrv.17.1682071681411; 
 Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003f1738d0d13sm10795048wmq.1.2023.04.21.03.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
Message-ID: <fb01dbfa-426a-f87c-620b-c5e7b6d6598e@linaro.org>
Date: Fri, 21 Apr 2023 12:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Richter <jarichte@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
 <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
 <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 21/4/23 06:09, Cleber Rosa wrote:
> 
> On 4/20/23 12:54, John Snow wrote:
>>
>>
>> On Thu, Apr 20, 2023, 5:19 AM Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>
>>     On 17/4/23 19:44, Alex Bennée wrote:
>>     >
>>     > John Snow <jsnow@redhat.com> writes:
>>     >
>>     >> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée
>>     <alex.bennee@linaro.org> wrote:

>>     >>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>     >>> index 0ba561b6bd..a6f73da681 100644
>>     >>> --- a/tests/requirements.txt
>>     >>> +++ b/tests/requirements.txt
>>     >>> @@ -2,5 +2,5 @@
>>     >>>   # in the tests/venv Python virtual environment. For more info,
>>     >>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>     >>>   # Note that qemu.git/python/ is always implicitly installed.
>>     >>> -avocado-framework==88.1
>>     >>> +avocado-framework==101.0
>>     >>>   pycdlib==1.11.0
>>     >>> --
>>     >>> 2.39.2
>>     >>>
>>     >>
>>     >> I thought there were test failures that prohibited us from
>>     bumping the
>>     >> Avocado-Framework version. Did those get rectified recently?
>>
>>     No, still not working on Darwin. At this point I'm thinking at 
>> sending
>>     a patch clarifying testing QEMU with Avocado is not supported on
>>     Darwin.
>>
>>
>> What's broken on Darwin?
>>
> Hi John,
> 
> IIRC, the main issue is that the legacy runner (the one active in 88.1) 
> pickles some stuff that do not play nice under Darwin.  It has never (to 
> the best of my knowledge) worked under Darwin.

Correct.

>> Is it broken with avocado-framework==88.1 too? (Is this a regression?)
>>
> It was already broken with avocado-framework==88.1,

Correct.

> but it should mostly 
> work with 101.0 (see previous reply).
> 
>> We might need to consider entirely separate issues:
>>
>> (1) We need to upgrade avocado-framework to a supported LTS version >= 
>> v90 for dependency harmony with qemu.git/python testing
>>
>> (2) We need to upgrade avocado-framework to >= v101.0 to fix the 
>> stated checksum issue in this patch
>>
>> (3) We would like avocado tests to work on Darwin. (Have they ever 
>> worked? When did they break? etc.)
>>
>> My understanding is that this patch helps with 1 and 2 but not 3, but 
>> if Darwin support isn't a regression, this is still a step forward.
>>
> To the best of my knowledge, this patch would help with 1, 2 and even 3.

As of today using v8.0.0:

$ make check-avocado
   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc
   MKDIR   /Users/philmd/source/qemu/build/tests/results
   AVOCADO Downloading avocado tests VM image for aarch64
The image was downloaded:
Provider Version Architecture File
fedora   31      aarch64 
/Users/philmd/avocado/data/cache/by_location/4f156e531446a679cbfe13caef8b7c9f9f79aafa/Fedora-Cloud-Base-31-1.9.aarch64.qcow2
   AVOCADO tests/avocado
Fetching asset from 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
Fetching asset from 
tests/avocado/boot_xen.py:BootXen.test_arm64_xen_411_and_dom0
Fetching asset from 
tests/avocado/boot_xen.py:BootXen.test_arm64_xen_414_and_dom0
Fetching asset from 
tests/avocado/boot_xen.py:BootXen.test_arm64_xen_415_and_dom0
Fetching asset from 
tests/avocado/machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
Fetching asset from 
tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
Fetching asset from 
tests/avocado/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
JOB ID     : 142a0b2d3960c7daccd657781d52f814e1617392
JOB LOG    : 
/Users/philmd/source/qemu/build/tests/results/job-2023-04-21T11.35-142a0b2/job.log

Avocado crashed: TypeError: cannot pickle '_thread.RLock' object
Traceback (most recent call last):

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/core/job.py", 
line 632, in run_tests
     summary |= suite.run(self)

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/core/suite.py", 
line 311, in run
     return self.runner.run_suite(job, self)

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/plugins/runner.py", 
line 390, in run_suite
     if not self.run_test(job, test_factory, queue, summary,

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/plugins/runner.py", 
line 170, in run_test
     proc.start()

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/process.py", 
line 121, in start
     self._popen = self._Popen(self)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/context.py", 
line 224, in _Popen
     return _default_context.get_context().Process._Popen(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/context.py", 
line 288, in _Popen
     return Popen(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/popen_spawn_posix.py", 
line 32, in __init__
     super().__init__(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/popen_fork.py", 
line 19, in __init__
     self._launch(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/popen_spawn_posix.py", 
line 47, in _launch
     reduction.dump(process_obj, fp)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/reduction.py", 
line 60, in dump
     ForkingPickler(file, protocol).dump(obj)

TypeError: cannot pickle '_thread.RLock' object

Please include the traceback info and command line used on your bug report
Report bugs visiting https://github.com/avocado-framework/avocado/issues/new
make: *** [check-avocado] Error 4

This is https://github.com/avocado-framework/avocado/issues/4888
which is still opened.

Manually using "avocado run --test-runner=nrunner" helps running the
tests but the console output is never displayed (see [*]) and once
finished Avocado lets various QEMU processes running in detached
mode, wasting resources.

[*] 
https://lore.kernel.org/qemu-devel/1d0baf8b-c757-265c-b206-07ca3f218b2a@linaro.org/


