Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09432CB50B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 07:32:47 +0100 (CET)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkLh0-0006AP-AJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 01:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kkLg3-0005jX-Hl
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 01:31:47 -0500
Received: from mail.ispras.ru ([83.149.199.84]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kkLg1-00085Q-0t
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 01:31:47 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 533C940A1DA4;
 Wed,  2 Dec 2020 06:31:38 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: fix timeout for vm.wait
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
 <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
 <ce6360ce-d640-8a4a-96e8-294dd5f04f0b@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <f9fe07b1-78e1-76ca-3c02-d6bf77d827d8@ispras.ru>
Date: Wed, 2 Dec 2020 09:31:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ce6360ce-d640-8a4a-96e8-294dd5f04f0b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.12.2020 22:15, John Snow wrote:
> On 11/16/20 6:13 AM, Philippe Mathieu-Daudé wrote:
>> Cc'ing John.
>>
>> On Mon, Nov 16, 2020 at 11:08 AM Pavel Dovgalyuk
>> <pavel.dovgalyuk@ispras.ru> wrote:
>>>
>>> This patch adds timeout parameter to vm.wait() calls, because the 
>>> default
>>> value is just 30 seconds, and tests may last for more time.
>>>
> 
> This doesn't sound right -- the timeout isn't meant to be for the entire 
> duration of the test, the timeout is from the time of issuing a shutdown 
> command until the time the VM actually shuts down. Ideally, that should 
> not take a particularly long time in a well-behaved test.
> 
> Why is it lasting longer than 30 seconds?

These are complex Linux boot&execution tests.
Such loading process could take more than 30 seconds.
E.g., BootLinux tests have timeout of 900 seconds.

> How long is it actually taking, do we know?
> 
> And, are you SURE you want to have *no* timeout for all of these calls? 
> (Will something else kill them if they take too long? Ideally before 
> gitlab itself kills the job for running too long?)
> 
> Cleber?
> 
>>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>> ---
>>>   tests/acceptance/boot_linux_console.py |    8 ++++----
>>>   tests/acceptance/replay_kernel.py      |    2 +-
>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/tests/acceptance/boot_linux_console.py 
>>> b/tests/acceptance/boot_linux_console.py
>>> index cb6086ca6f..1cb8cb7a2a 100644
>>> --- a/tests/acceptance/boot_linux_console.py
>>> +++ b/tests/acceptance/boot_linux_console.py
>>> @@ -208,7 +208,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>>                                                   'reboot: Restarting 
>>> system')
>>>           # Wait for VM to shut down gracefully
>>> -        self.vm.wait()
>>> +        self.vm.wait(None)
>>>
>>>       @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 
>>> 'untrusted code')
>>>       def test_mips64el_malta_5KEc_cpio(self):
>>> @@ -250,7 +250,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>>                                                   'reboot: Restarting 
>>> system')
>>>           # Wait for VM to shut down gracefully
>>> -        self.vm.wait()
>>> +        self.vm.wait(None)
>>>
>>>       def do_test_mips_malta32el_nanomips(self, kernel_url, 
>>> kernel_hash):
>>>           kernel_path_xz = self.fetch_asset(kernel_url, 
>>> asset_hash=kernel_hash)
>>> @@ -725,7 +725,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>>                                                   'reboot: Restarting 
>>> system')
>>>           # Wait for VM to shut down gracefully
>>> -        self.vm.wait()
>>> +        self.vm.wait(None)
>>>
>>>       @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>>                   'Test artifacts fetched from unreliable 
>>> apt.armbian.com')
>>> @@ -778,7 +778,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>>           exec_command_and_wait_for_pattern(self, 'reboot',
>>>                                                   'reboot: Restarting 
>>> system')
>>>           # Wait for VM to shut down gracefully
>>> -        self.vm.wait()
>>> +        self.vm.wait(None)
>>>
>>>       @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>>                   'Test artifacts fetched from unreliable 
>>> dl.armbian.com')
>>> diff --git a/tests/acceptance/replay_kernel.py 
>>> b/tests/acceptance/replay_kernel.py
>>> index c8b043ac31..02a52b1d72 100644
>>> --- a/tests/acceptance/replay_kernel.py
>>> +++ b/tests/acceptance/replay_kernel.py
>>> @@ -60,7 +60,7 @@ class ReplayKernelBase(LinuxKernelTest):
>>>               logger.info('finished the recording with log size %s 
>>> bytes'
>>>                           % os.path.getsize(replay_path))
>>>           else:
>>> -            vm.wait()
>>> +            vm.wait(None)
>>>               logger.info('successfully finished the replay')
>>>           elapsed = time.time() - start_time
>>>           logger.info('elapsed time %.2f sec' % elapsed)
>>>
>>
> 


