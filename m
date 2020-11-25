Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133F2C362B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 02:17:23 +0100 (CET)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khjQv-0003Ws-W1
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 20:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1khjPE-0002zw-SX
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 20:15:37 -0500
Received: from mail.csgraf.de ([188.138.100.120]:41228
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1khjP8-0001h3-S1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 20:15:36 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 9ED7C3900384;
 Wed, 25 Nov 2020 02:15:24 +0100 (CET)
Subject: Re: [PATCH v5 6/7] tcg: implement JIT for iOS and Apple Silicon
To: Joelle van Dyne <j@getutm.app>
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-7-j@getutm.app>
 <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
 <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <781d6412-ff8a-ae33-3b00-d27e9fc9cd0a@csgraf.de>
Date: Wed, 25 Nov 2020 02:15:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 20.11.20 16:58, Joelle van Dyne wrote:
> On Fri, Nov 20, 2020 at 3:08 AM Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 09.11.20 00:24, Joelle van Dyne wrote:
>>> When entitlements are available (macOS or jailbroken iOS), a hardware
>>> feature called APRR exists on newer Apple Silicon that can cheaply mark JIT
>>> pages as either RX or RW. Reverse engineered functions from
>>> libsystem_pthread.dylib are implemented to handle this.
>>>
>>> The following rules apply for JIT write protect:
>>>     * JIT write-protect is enabled before tcg_qemu_tb_exec()
>>>     * JIT write-protect is disabled after tcg_qemu_tb_exec() returns
>>>     * JIT write-protect is disabled inside do_tb_phys_invalidate() but if it
>>>       is called inside of tcg_qemu_tb_exec() then write-protect will be
>>>       enabled again before returning.
>>>     * JIT write-protect is disabled by cpu_loop_exit() for interrupt handling.
>>>     * JIT write-protect is disabled everywhere else.
>>>
>>> See https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
>>>
>>> Signed-off-by: Joelle van Dyne <j@getutm.app>
>>> ---
>>>    include/exec/exec-all.h     |  2 +
>>>    include/tcg/tcg-apple-jit.h | 86 +++++++++++++++++++++++++++++++++++++
>>>    include/tcg/tcg.h           |  3 ++
>>>    accel/tcg/cpu-exec-common.c |  2 +
>>>    accel/tcg/cpu-exec.c        |  2 +
>>>    accel/tcg/translate-all.c   | 46 ++++++++++++++++++++
>>>    tcg/tcg.c                   |  4 ++
>>>    7 files changed, 145 insertions(+)
>>>    create mode 100644 include/tcg/tcg-apple-jit.h
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index aa65103702..3829f3d470 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -549,6 +549,8 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>>>                                       target_ulong cs_base, uint32_t flags,
>>>                                       uint32_t cf_mask);
>>>    void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
>>> +void tb_exec_lock(void);
>>> +void tb_exec_unlock(void);
>>>
>>>    /* GETPC is the true target of the return instruction that we'll execute.  */
>>>    #if defined(CONFIG_TCG_INTERPRETER)
>>> diff --git a/include/tcg/tcg-apple-jit.h b/include/tcg/tcg-apple-jit.h
>>> new file mode 100644
>>> index 0000000000..9efdb2000d
>>> --- /dev/null
>>> +++ b/include/tcg/tcg-apple-jit.h
>>> @@ -0,0 +1,86 @@
>>> +/*
>>> + * Apple Silicon functions for JIT handling
>>> + *
>>> + * Copyright (c) 2020 osy
>>> + *
>>> + * This library is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU Lesser General Public
>>> + * License as published by the Free Software Foundation; either
>>> + * version 2.1 of the License, or (at your option) any later version.
>>> + *
>>> + * This library is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> + * Lesser General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU Lesser General Public
>>> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#ifndef TCG_APPLE_JIT_H
>>> +#define TCG_APPLE_JIT_H
>>> +
>>> +/*
>>> + * APRR handling
>>> + * Credits to: https://siguza.github.io/APRR/
>>> + * Reversed from /usr/lib/system/libsystem_pthread.dylib
>>> + */
>>> +
>>> +#if defined(__aarch64__) && defined(CONFIG_DARWIN)
>>> +
>>> +#define _COMM_PAGE_START_ADDRESS        (0x0000000FFFFFC000ULL) /* In TTBR0 */
>>> +#define _COMM_PAGE_APRR_SUPPORT         (_COMM_PAGE_START_ADDRESS + 0x10C)
>>> +#define _COMM_PAGE_APPR_WRITE_ENABLE    (_COMM_PAGE_START_ADDRESS + 0x110)
>>> +#define _COMM_PAGE_APRR_WRITE_DISABLE   (_COMM_PAGE_START_ADDRESS + 0x118)
>>> +
>>> +static __attribute__((__always_inline__)) bool jit_write_protect_supported(void)
>>> +{
>>> +    /* Access shared kernel page at fixed memory location. */
>>> +    uint8_t aprr_support = *(volatile uint8_t *)_COMM_PAGE_APRR_SUPPORT;
>>> +    return aprr_support > 0;
>>> +}
>>> +
>>> +/* write protect enable = write disable */
>>> +static __attribute__((__always_inline__)) void jit_write_protect(int enabled)
>>> +{
>>> +    /* Access shared kernel page at fixed memory location. */
>>> +    uint8_t aprr_support = *(volatile uint8_t *)_COMM_PAGE_APRR_SUPPORT;
>>> +    if (aprr_support == 0 || aprr_support > 3) {
>>> +        return;
>>> +    } else if (aprr_support == 1) {
>>> +        __asm__ __volatile__ (
>>> +            "mov x0, %0\n"
>>> +            "ldr x0, [x0]\n"
>>> +            "msr S3_4_c15_c2_7, x0\n"
>>> +            "isb sy\n"
>>> +            :: "r" (enabled ? _COMM_PAGE_APRR_WRITE_DISABLE
>>> +                            : _COMM_PAGE_APPR_WRITE_ENABLE)
>>> +            : "memory", "x0"
>>> +        );
>>> +    } else {
>>> +        __asm__ __volatile__ (
>>> +            "mov x0, %0\n"
>>> +            "ldr x0, [x0]\n"
>>> +            "msr S3_6_c15_c1_5, x0\n"
>>> +            "isb sy\n"
>>> +            :: "r" (enabled ? _COMM_PAGE_APRR_WRITE_DISABLE
>>> +                            : _COMM_PAGE_APPR_WRITE_ENABLE)
>>> +            : "memory", "x0"
>>> +        );
>>> +    }
>>> +}
>>
>> Is there a particular reason you're not just calling
>> pthread_jit_write_protect_np()? That would remove the dependency on
>> anything reverse engineered.
> Those APIs are not available on iOS 13 or below, which has the same
> APRR requirements. If for legal reasons we cannot include this code,
> then it is fine to remove this file and replace the calls with the
> APIs, but we would lose support on lower iOS versions.


I don't think we realistically care about running QEMU on iOS13, do we? 
Let's just focus on making the code maintainable for anything going 
forward from now :).


Alex



