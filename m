Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4492DDAB6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:18:47 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0fe-00033z-UJ
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq0cg-0001Vg-LZ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 16:15:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:55430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq0cR-0003zk-2l
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 16:15:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CB3DAC7F;
 Thu, 17 Dec 2020 21:15:25 +0000 (UTC)
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <71c2c316-38ab-3f27-0147-fbe01446dde2@suse.de>
Date: Thu, 17 Dec 2020 22:15:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

thanks for your answer,

On 12/17/20 9:15 PM, Peter Maydell wrote:
> On Thu, 17 Dec 2020 at 19:46, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> Hi,
>>
>> I would like to highlight the current dangerous state of NEED_CPU_H / CONFIG_SOFTMMU / CONFIG_USER_ONLY.
> 
>> So our struct TcgCpuOperations in include/hw/core/cpu.h,
>> which contains after this series:
>>
>> #ifndef CONFIG_USER_ONLY
>>     /**
>>      * @do_transaction_failed: Callback for handling failed memory transactions
>>      * (ie bus faults or external aborts; not MMU faults)
>>      */
>>     void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>>                                   unsigned size, MMUAccessType access_type,
>>                                   int mmu_idx, MemTxAttrs attrs,
>>                                   MemTxResult response, uintptr_t retaddr);
>>     /**
>>      * @do_unaligned_access: Callback for unaligned access handling
>>      */
>>     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>>                                 MMUAccessType access_type,
>>                                 int mmu_idx, uintptr_t retaddr);
>> #endif /* !CONFIG_USER_ONLY */
> 
> Yeah, don't try to ifdef out struct fields in common-compiled code...
> 
>> Note that include/hw/core/cpu.h already uses CONFIG_USER_ONLY in other parts of the header file, and we might have hidden problems as a result we (or at least I) don't know about,
>> because code is being compiled in for linux-user which explicitly should not be compiled there.
> 
> The other CONFIG_USER_ONLY checks in that file are only
> ifdeffing out prototypes for functions that exist only in
> the softmmu build, or providing do-nothing stubs for functions
> that are softmmu only. I think they're safe.

right, in cpu.h the extra prototypes do not cause immediate harm, but they lead to believe someone editing the file that CONFIG_USER_ONLY can be used and is effective in the file;
if CONFIG_USER_ONLY is ineffective, why use it?

In the same file, in other places

#ifdef NEED_CPU_H
#ifdef CONFIG_SOFTMMU

is used. Should this pattern be used instead consistently in header files? Is this guaranteed to always do the right thing, from wherever the header file is included?

Also in hw/core/cpu.c we see this:

#if !defined(CONFIG_USER_ONLY)
GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
{
    CPUClass *cc = CPU_GET_CLASS(cpu);
    GuestPanicInformation *res = NULL;

    if (cc->get_crash_info) {
        res = cc->get_crash_info(cpu);
    }
    return res;
}
#endif

If !CONFIG_USER_ONLY is always ineffective, why have it there? This code should probably then be in $(top_srcdir)/cpu.c ?

These things may be harmless by themselves, but it takes very little to make a false step,
using the existing uses as a reference, as there is no other documentation (I know of).

CONFIG_USER_ONLY is used in a few other places outside of target/, including in other header files,
as you noted in a follow up email.
Are all these uses harmless? Not sure how to determine that for sure..


> 
>> There are multiple workarounds / fixes possible for my short term problem,
>> but would it not be a good idea to fix this problem at its root once and for all?
> 
> What's your proposal for fixing things ?


I don't think I have the full picture yet, so I think the optimal solution can only be figured out together;

I will try to flail in the dark hoping to hit on something that sparks an idea.


- do we need both CONFIG_SOFTMMU and CONFIG_USER_ONLY? (I always wondered about the "ONLY" part of it, why not just CONFIG_USER?)
  Based on previous comments from Richard we might need both in the future, but I fail to detect which places are meaningful for the one or the other.


- Is the NEED_CPU_H + CONFIG_SOFTMMU check always the right thing to do? Is it always right in header files? ...


- is it possible to define very clearly where in the codebase they should be used?
  As an ignorant example from my side: only use CONFIG_USER_ONLY inside of target/,

  Making the rule "don't use this for common_ss" is very difficult to stick to in practice,
  with header files that end up being used from multiple sources, some in common_ss and some not, and it's so hidden from the day to day activities,
  one need to explicitly check.

  Instead if it's something obvious like: only in this subtree, then it is at least realistic to try to stick to it.
  

- is it possible to check the [in]correct use of CONFIG_USER_ONLY and CONFIG_SOFTMMU during compilation or with a script in scripts/ ?
  I think you answered that already, adding it to "poison". Any downside to that?
  Does it still make sense to restrict the uses more, in favor of clarity?


- once we figure out the solution, I would try to document the result of the whole experience clearly, in doc/devel/ for example?


> 
> Incidentally, this should not be a problem for CONFIG_SOFTMMU,
> because that is listed in include/exec/poison.h so trying to
> use it in a common (not compiled-per-target) file will give you
> a compile error. (So in theory we could make CONFIG_USER_ONLY
> a poisoned identifier but that will require some work to
> adjust places where we currently use it in "safe" ways...)
> 
> thanks
> -- PMM

 
Thanks!

Claudio


