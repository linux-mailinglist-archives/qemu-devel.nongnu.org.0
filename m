Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B8435FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:57:18 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVl7-000327-4b
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mdViE-0000Xv-9O
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:54:18 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50184)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mdViA-0004Kp-0j
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:54:17 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1BD4340D3BFF;
 Thu, 21 Oct 2021 10:54:05 +0000 (UTC)
Subject: Re: [PATCH] softmmu: fix watchpoint processing in icount mode
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <163101424137.678744.18360776310711795413.stgit@pasha-ThinkPad-X280>
 <f103375f-9c3b-9b5b-6ef1-5437b4990c23@redhat.com>
 <9bbee49c-f175-fa6e-3bda-7d117f1459b1@linaro.org>
 <31e9ded8-6187-bced-51b8-45e35d2e9f06@redhat.com>
 <8096c13b-f87c-c8ae-70c7-499ee397850c@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <d4b65238-f998-cf64-13eb-b10cb74619d5@ispras.ru>
Date: Thu, 21 Oct 2021 13:54:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8096c13b-f87c-c8ae-70c7-499ee397850c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.09.2021 17:41, Richard Henderson wrote:
> On 9/10/21 3:46 PM, David Hildenbrand wrote:
>> On 10.09.21 15:34, Richard Henderson wrote:
>>> On 9/10/21 1:15 PM, David Hildenbrand wrote:
>>>> On 07.09.21 13:30, Pavel Dovgalyuk wrote:
>>>>> Watchpoint processing code restores vCPU state twice:
>>>>> in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
>>>>> Normally it does not affect anything, but in icount mode instruction
>>>>> counter is incremented twice and becomes incorrect.
>>>>> This patch eliminates unneeded CPU state restore.
>>>>>
>>>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>>>> ---
>>>>>    softmmu/physmem.c |    5 +----
>>>>>    1 file changed, 1 insertion(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>>> index 23e77cb771..4025dfab11 100644
>>>>> --- a/softmmu/physmem.c
>>>>> +++ b/softmmu/physmem.c
>>>>> @@ -941,14 +941,11 @@ void cpu_check_watchpoint(CPUState *cpu, 
>>>>> vaddr addr, vaddr len,
>>>>>                    if (wp->flags & BP_STOP_BEFORE_ACCESS) {
>>>>>                        cpu->exception_index = EXCP_DEBUG;
>>>>>                        mmap_unlock();
>>>>> -                    cpu_loop_exit_restore(cpu, ra);
>>>>> +                    cpu_loop_exit(cpu);
>>>>>                    } else {
>>>>>                        /* Force execution of one insn next time.  */
>>>>>                        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
>>>>>                        mmap_unlock();
>>>>> -                    if (ra) {
>>>>> -                        cpu_restore_state(cpu, ra, true);
>>>>> -                    }
>>>>>                        cpu_loop_exit_noexc(cpu);
>>>>>                    }
>>>>>                }
>>>>>
>>>>>
>>>>
>>>> I'm not an expert on that code, but it looks good to me.
>>>>
>>>> Maybe we could have added a comment above the tb_check_watchpoint() 
>>>> call to highlight that
>>>> the restore will happen in there.
>>>
>>> Hmm.  Curious.
>>>
>>> Looking at tb_check_watchpoint, I have trouble seeing how it could be 
>>> correct.
>>> Watchpoints can happen at any memory reference within the TB.  We 
>>> should be rolling back
>>> to the cpu state at the memory reference (cpu_retore_state) and not 
>>> the cpu state at the
>>> start of the TB (cpu_restore_state_from_tb).
>>
>> cpu_restore_state() ends up calling cpu_restore_state_from_tb() with 
>> essentially
>> the same parameters or what am I missing?
> 
> Whoops, yes.  I must have been thinking of a different function.
> 
>>> I'm also not sure why we're invalidating tb's.  Why does watchpoint 
>>> hit imply that we
>>> should want to ditch the TB?  If we want different behaviour from the 
>>> next execution, we
>>> should be adjusting cflags.
>>
>> It goes back to
>>
>> commit 06d55cc19ac84e799d2df8c750049e51798b00a4
>> Author: aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
>> Date:   Tue Nov 18 20:24:06 2008 +0000
>>
>>      Restore pc on watchpoint hits (Jan Kiszka)
>>      In order to provide accurate information about the triggering
>>      instruction, this patch adds the required bits to restore the pc 
>> if the
>>      access happened inside a TB. With the BP_STOP_BEFORE_ACCESS flag, 
>> the
>>      watchpoint user can control if the debug trap should be issued on or
>>      after the accessing instruction.
>>      Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>      Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
>>
>>
>> *trying to rememebr what we do on watchpoints* I think we want to
>> make sure that we end up with a single-instruction TB, right? So we
>> want to make sure to remove the old one.
> 
> When the watchpoint needs to trigger after the insn, we do indeed want 
> to execute a single insn, which we do with the cflags there in the patch 
> context.  But when we want to stop before the insn, we're already done 
> -- so what was the invalidate supposed to achieve?

Right, this really looks strange.
Do you think that this function also has to be rewritten?
Or this should be done with another patch?

> 
> (Then of course there's the problem that Phillipe filed (#245) in which 
> we set cflags as per above, then take an interrupt before using it, then 
> wind up with garbage.  Ho hum.)
> 
> 
> r~
> 
> r~


