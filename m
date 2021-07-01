Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9FC3B8E0D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:09:51 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqpZ-0005ok-PJ
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1lyqoD-000569-VM
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:08:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56642 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1lyqoB-0006GT-1Z
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:08:25 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxUOLXad1gwSMbAA--.11001S3; 
 Thu, 01 Jul 2021 15:08:08 +0800 (CST)
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
 <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
 <87y2arpu7u.fsf@linaro.org>
 <32f41893-ac70-1138-94b8-ca09748d2b69@loongson.cn>
 <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <16929a18-3e91-4c82-41d0-081f1cdb0954@loongson.cn>
Date: Thu, 1 Jul 2021 15:08:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxUOLXad1gwSMbAA--.11001S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1kCw4DXw1UZw4rKr4Durg_yoW7WFWfpr
 yrAF15JryUJr1xJr12qr1UJryFqr18Jw1UXr1fJF18Jr1Dtr1jqr1UWryjgF1UJr4rGF1j
 qr1DJr17ur1DXrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021年07月01日 14:47, Thomas Huth 写道:
> On 01/07/2021 03.07, maobibo wrote:
>>
>>
>> 在 2021年06月30日 17:36, Alex Bennée 写道:
>>>
>>> maobibo <maobibo@loongson.cn> writes:
>>>
>>>> 在 2021年06月29日 21:42, Peter Maydell 写道:
>>>>> On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>>>>>>
>>>>>> Add files to linux-user/loongarch64
>>>>>> Add file to default-configs
>>>>>> Add loongarch to target/meson.build
>>>>>>
>>>>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>>>>> ---
>>>>>>   MAINTAINERS                                        |   1 +
>>>>>>   default-configs/targets/loongarch64-linux-user.mak |   4 +
>>>>>>   include/elf.h                                      |   2 +
>>>>>>   linux-user/elfload.c                               |  58 ++++
>>>>>>   linux-user/loongarch64/cpu_loop.c                  | 177 ++++++++++++
>>>>>>   linux-user/loongarch64/signal.c                    | 193 +++++++++++++
>>>>>>   linux-user/loongarch64/sockbits.h                  |   1 +
>>>>>>   linux-user/loongarch64/syscall_nr.h                | 307 +++++++++++++++++++++
>>>>>>   linux-user/loongarch64/target_cpu.h                |  36 +++
>>>>>>   linux-user/loongarch64/target_elf.h                |  14 +
>>>>>>   linux-user/loongarch64/target_fcntl.h              |  12 +
>>>>>>   linux-user/loongarch64/target_signal.h             |  28 ++
>>>>>>   linux-user/loongarch64/target_structs.h            |  49 ++++
>>>>>>   linux-user/loongarch64/target_syscall.h            |  46 +++
>>>>>>   linux-user/loongarch64/termbits.h                  | 229 +++++++++++++++
>>>>>>   linux-user/syscall_defs.h                          |   8 +-
>>>>>>   meson.build                                        |   2 +-
>>>>>>   qapi/machine-target.json                           |   4 +-
>>>>>>   target/loongarch/meson.build                       |  19 ++
>>>>>>   target/meson.build                                 |   1 +
>>>>>>   20 files changed, 1185 insertions(+), 6 deletions(-)
>>>>>
>>>>> This is a massive patch that would benefit from being split up
>>>>> into multiple smaller patches.
>>>>>
>>>>> I'm told by a kernel developer that loongarch hasn't yet been
>>>>> accepted into the Linux kernel mainline. Until it has been, the
>>>>> syscall ABI for it is not yet stable, so we won't be able to take
>>>>> the linux-user patches for it yet. (We have been burned in the
>>>>> past by taking linux-user architecture support patches without
>>>>> realizing they weren't for a stable ABI, and then being out of
>>>>> sync with the eventual upstream kernel ABI that was accepted.)
>>>>>
>>>>> We can certainly do code review in the meantime, though.
>>>> Thanks for reviewing the big series patches. It is understandable that
>>>> there should be linux kernel merged for one new architecture support
>>>> firstly, and then there will be linux-user simulator later.
>>>>
>>>> We are planning to submit patch to linux kernel for LoongArch support,
>>>> there is the link:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next
>>>>
>>>> And we will continueto  submit softmmu support for LoongArch. And is there
>>>> any extra requirements for softmmu simulation for new architecture,
>>>> such as gcc/binutils/bios?
>>>
>>> Ideally if there are some pre-built toolchains either as part of a
>>> distro (we've used Debian Sid before for some) or easily to install in a
>>> docker container as binary tarballs (like we do for tricore) then we can
>>> enable basic check-tcg functionality.
>>>
>>> Going forward having stable URLs for test images of distros means we can
>>> also enable check-acceptance tests.
>> Thanks for guidance, it requires that linux kernel/gcc/glibc are submitted
>> already. My meaning is that linux-user emulation depends on kernel
>> syscall ABI, softmmu emulation does not have such dependency, on the contrast
>> system emulation can be used to verify linux kernel. Is there any requirement
>> for system emulation of new architecture?
> 
> I think we'd need some way of automatic regression testing for new targets. If your board has a serial UART that is easy to use, then please add a test in tests/qtest/boot-serial-test.c. And if there are any public Linux kernel binaries for (reliable) download anywhere, please add a test in tests/acceptance/, see for example the various machine_*.py files or boot_linux_console.py there.
> 
Got it, thanks for kindly help.

Regards
bibo, mao

>  HTH,
>   Thomas


