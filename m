Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05743413445
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:33:41 +0200 (CEST)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSftz-00068l-DH
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mSfqh-0004MP-KC; Tue, 21 Sep 2021 09:30:15 -0400
Received: from mail.csgraf.de ([85.25.223.15]:54060 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mSfqe-0002ZZ-17; Tue, 21 Sep 2021 09:30:14 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-007-123-111.77.7.pool.telefonica.de [77.7.123.111])
 by csgraf.de (Postfix) with ESMTPSA id 59BC36080369;
 Tue, 21 Sep 2021 15:30:07 +0200 (CEST)
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
 <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
 <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
 <27a265d5-2e7c-f234-0d09-f40a731e588d@csgraf.de>
 <bdeef51c-901b-f5a8-0415-03c464255b1f@amsat.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <60aac468-973b-daee-49ce-71829c234af8@csgraf.de>
Date: Tue, 21 Sep 2021 15:30:08 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bdeef51c-901b-f5a8-0415-03c464255b1f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.09.21 11:29, Philippe Mathieu-Daudé wrote:
> On 9/20/21 22:21, Alexander Graf wrote:
>> On 20.09.21 18:17, Philippe Mathieu-Daudé wrote:
>>> On 9/20/21 15:15, Peter Maydell wrote:
>>>> On Mon, 20 Sept 2021 at 11:11, Peter Maydell
>>>> <peter.maydell@linaro.org> wrote:
>>>>> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de>
>>>>> wrote:
>>>>>> Now that Apple Silicon is widely available, people are obviously
>>>>>> excited
>>>>>> to try and run virtualized workloads on them, such as Linux and
>>>>>> Windows.
>>>>>>
>>>>>> This patch set implements a fully functional version to get the ball
>>>>>> going on that. With this applied, I can successfully run both
>>>>>> Linux and
>>>>>> Windows as guests. I am not aware of any limitations specific to
>>>>>> Hypervisor.framework apart from:
>>>>>>
>>>>>>    - gdbstub debugging (breakpoints)
>>>>>>    - missing GICv3 support
>>>>>>    - Windows will not work due to UDEF SMC implementation
>>>>>>
>>>>>> To use hvf support, please make sure to run -M virt,highmem=off
>>>>>> to fit
>>>>>> in M1's physical address space limits and use -cpu host.
>>>>> Applied to target-arm.next, thanks (with the unnecessary #include
>>>>> in patch 6 removed).
>>>> Turns out that the final patch breaks "make check-acceptance".
>>>> All the orangepi boot tests timeout:
>>>>
>>>>   (15/58)
>>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>>> '15-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi',
>>>>
>>>> 'logdir':
>>>> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/...
>>>> (90.24 s)
>>>>   (16/58)
>>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
>>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>>> '16-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd',
>>>>
>>>> 'logdir':
>>>> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang...
>>>> (90.24 s)
>>>>   (17/58)
>>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
>>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>>> '17-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd',
>>>>
>>>> 'logdir':
>>>> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes...
>>>> (90.24 s)
>>> Works for me on x86_64 Fedora 34 built with
>>> --enable-trace-backends=log --enable-debug:
>>>
>>> $ ./tests/venv/bin/avocado run
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
>>>
>>> Fetching asset from
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
>>>
>>> JOB ID     : b19f151f7320def3a432255f3a99c0dde3da95c0
>>> JOB LOG    :
>>> /home/phil/avocado/job-results/job-2021-09-20T18.12-b19f151/job.log
>>>   (1/5)
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>>>
>>> PASS (6.29 s)
>>>   (2/5)
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
>>>
>>> PASS (51.23 s)
>>>   (3/5)
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
>>>
>>> PASS (76.53 s)
>>>   (4/5)
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
>>>
>>> SKIP: storage limited
>>>   (5/5)
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
>>>
>>> SKIP: storage limited
>>> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT
>>> 0 |
>>> CANCEL 0
>>> JOB TIME   : 135.18 s
>>>
>>
>> The OrangePi kernel goes into an endless loop here:
>>
>>  
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/compressed/head.S?h=v5.10#n637
>
> As you said, this is a Linux specific behavior, ...


It's not really Linux specific behavior. Linux just includes preloader
code that moves it into HYP mode when booted in SVC mode.


>
>> The reason is simple: It tries to install its own HYP code using the old
>> "install HYP handler, then invoke it" trick based on SPSR's indication
>> that HYP is available, but fails to do so because HYP calls get handled
>> by QEMU instead because the PSCI conduit is configured to HVC.
>>
>> The patch below seems to fix it for me. Please advise how you want to
>> proceed.
>>
>>
>> Alex
>>
>>
>> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> index 27f1070145..f9b7ed1871 100644
>> --- a/hw/arm/allwinner-h3.c
>> +++ b/hw/arm/allwinner-h3.c
>> @@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev,
>> Error **errp)
>>
>>           /* Provide Power State Coordination Interface */
>>           qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
>> -                            QEMU_PSCI_CONDUIT_HVC);
>> +                            QEMU_PSCI_CONDUIT_SMC);
>
> ... so I'd rather follow the approach taken on the Versal board,
> see versal_virt_init() in commit 6f16da53ffe ("hw/arm: versal:
> Add a virtual Xilinx Versal board"):
>
> 1/ add "psci-conduit" property in TYPE_AW_H3,
>    forward this property to each core in allwinner_h3_realize()
>
> 2/ set property in orangepi_init():
>
>    object_property_set_int(OBJECT(h3), "psci-conduit",
>                            machine->kernel_filename
>                            ? QEMU_PSCI_CONDUIT_SMC
>                            : QEMU_PSCI_CONDUIT_HVC,
>                            &error_abort);
>
> That way we don't break non-Linux firmwares.


This doesn't make sense to me. We need to decide what we want from the
OrangePi emulation:

  1) Guest owns USR, SVC. HYP's PSCI is emulated by QEMU
  2) Guest owns USR, SVC, HYP. MON's PSCI is emulated by QEMU
  3) Guest owns USR, SVC, HYP, MON. PSCI is handled 100% inside the guest.

We currently advertise to the guest that it can use HYP, but don't allow
it to run anything in MON (option 2), but then at the same time override
parts of HYP with QEMU code. That's just plain wrong - we're breaking
hypervisors running on OrangePi :).

So if the goal of that board is to run OrangePi ATF (does it do ATF?)
code or any other "full firmware", then we would need to move QEMU
completely out of the conduit picture, implement option 3 and ship
pre-HYP firmware with QEMU.

If the goal is to just make HYP and below work, the fix above is the
best path forward IMHO.

Option 1 would require us to tell the guest that it can not make use of
HYP. That's possible, but why should we?

I don't really see why we should even consider option 1. 2 and 3 make
sense. 3 is a lot of work. 2 is a one line fix that makes the board at
least do what it's supposed to do :).


Alex


