Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B683B7B5B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:43:15 +0200 (CEST)
Received: from localhost ([::1]:33932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyPFy-00012k-0e
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1lyPEt-0000LG-Fj
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:42:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54090 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1lyPEp-0006bs-JQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:42:06 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0LHy9tgbJEaAA--.10009S3; 
 Wed, 30 Jun 2021 09:41:28 +0800 (CST)
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
To: Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
Date: Wed, 30 Jun 2021 09:41:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0LHy9tgbJEaAA--.10009S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy5AFyUZr1kAF13XF48Crg_yoW5Jw47p3
 yrCr13Wr4rJrW7J3ZxX34UZ3Z5Zr1kWFnxWa4fKry8ArW8uF10vw1kWF90g3W3Xw1rKFWF
 qFykK34UWF4DXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021年06月29日 21:42, Peter Maydell 写道:
> On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>>
>> Add files to linux-user/loongarch64
>> Add file to default-configs
>> Add loongarch to target/meson.build
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  MAINTAINERS                                        |   1 +
>>  default-configs/targets/loongarch64-linux-user.mak |   4 +
>>  include/elf.h                                      |   2 +
>>  linux-user/elfload.c                               |  58 ++++
>>  linux-user/loongarch64/cpu_loop.c                  | 177 ++++++++++++
>>  linux-user/loongarch64/signal.c                    | 193 +++++++++++++
>>  linux-user/loongarch64/sockbits.h                  |   1 +
>>  linux-user/loongarch64/syscall_nr.h                | 307 +++++++++++++++++++++
>>  linux-user/loongarch64/target_cpu.h                |  36 +++
>>  linux-user/loongarch64/target_elf.h                |  14 +
>>  linux-user/loongarch64/target_fcntl.h              |  12 +
>>  linux-user/loongarch64/target_signal.h             |  28 ++
>>  linux-user/loongarch64/target_structs.h            |  49 ++++
>>  linux-user/loongarch64/target_syscall.h            |  46 +++
>>  linux-user/loongarch64/termbits.h                  | 229 +++++++++++++++
>>  linux-user/syscall_defs.h                          |   8 +-
>>  meson.build                                        |   2 +-
>>  qapi/machine-target.json                           |   4 +-
>>  target/loongarch/meson.build                       |  19 ++
>>  target/meson.build                                 |   1 +
>>  20 files changed, 1185 insertions(+), 6 deletions(-)
> 
> This is a massive patch that would benefit from being split up
> into multiple smaller patches.
> 
> I'm told by a kernel developer that loongarch hasn't yet been
> accepted into the Linux kernel mainline. Until it has been, the
> syscall ABI for it is not yet stable, so we won't be able to take
> the linux-user patches for it yet. (We have been burned in the
> past by taking linux-user architecture support patches without
> realizing they weren't for a stable ABI, and then being out of
> sync with the eventual upstream kernel ABI that was accepted.)
> 
> We can certainly do code review in the meantime, though.
Thanks for reviewing the big series patches. It is understandable that
there should be linux kernel merged for one new architecture support
firstly, and then there will be linux-user simulator later.

We are planning to submit patch to linux kernel for LoongArch support,
there is the link:
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next

And we will continueto  submit softmmu support for LoongArch. And is there
any extra requirements for softmmu simulation for new architecture,
such as gcc/binutils/bios?

regards
bibo, mao


> 
> thanks
> -- PMM
> 


