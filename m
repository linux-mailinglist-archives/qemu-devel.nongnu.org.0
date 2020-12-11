Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC032D7DE1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:18:09 +0100 (CET)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmzY-0002A0-QS
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knmx6-0000WZ-QL
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:15:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knmx4-0008WM-J0
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:15:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC6DDAE4A;
 Fri, 11 Dec 2020 18:15:32 +0000 (UTC)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
Message-ID: <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
Date: Fri, 11 Dec 2020 19:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 6:47 PM, Claudio Fontana wrote:
> On 12/11/20 6:28 PM, Richard Henderson wrote:
>> On 12/11/20 11:10 AM, Claudio Fontana wrote:
>>> On 12/11/20 6:05 PM, Richard Henderson wrote:
>>>> On 12/11/20 2:31 AM, Claudio Fontana wrote:
>>>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>>>
>>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>>> [claudio: wrapped in CONFIG_TCG]
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>  include/hw/core/cpu.h         |  8 --------
>>>>>  include/hw/core/tcg-cpu-ops.h | 12 ++++++++++++
>>>>>  accel/tcg/cpu-exec.c          |  4 ++--
>>>>>  target/arm/cpu.c              |  4 +++-
>>>>>  target/avr/cpu.c              |  2 +-
>>>>>  target/hppa/cpu.c             |  2 +-
>>>>>  target/i386/tcg/tcg-cpu.c     |  2 +-
>>>>>  target/microblaze/cpu.c       |  2 +-
>>>>>  target/mips/cpu.c             |  4 +++-
>>>>>  target/riscv/cpu.c            |  2 +-
>>>>>  target/rx/cpu.c               |  2 +-
>>>>>  target/sh4/cpu.c              |  2 +-
>>>>>  target/sparc/cpu.c            |  2 +-
>>>>>  target/tricore/cpu.c          |  2 +-
>>>>>  14 files changed, 29 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>>> index ea648d52ad..83007d262c 100644
>>>>> --- a/include/hw/core/cpu.h
>>>>> +++ b/include/hw/core/cpu.h
>>>>> @@ -110,13 +110,6 @@ struct TranslationBlock;
>>>>>   *       If the target behaviour here is anything other than "set
>>>>>   *       the PC register to the value passed in" then the target must
>>>>>   *       also implement the synchronize_from_tb hook.
>>>>> - * @synchronize_from_tb: Callback for synchronizing state from a TCG
>>>>> - *       #TranslationBlock. This is called when we abandon execution
>>>>> - *       of a TB before starting it, and must set all parts of the CPU
>>>>> - *       state which the previous TB in the chain may not have updated.
>>>>> - *       This always includes at least the program counter; some targets
>>>>> - *       will need to do more. If this hook is not implemented then the
>>>>> - *       default is to call @set_pc(tb->pc).
>>>>>   * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
>>>>>   *       address fault.  For system mode, if the access is valid, call
>>>>>   *       tlb_set_page and return true; if the access is invalid, and
>>>>> @@ -193,7 +186,6 @@ struct CPUClass {
>>>>>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
>>>>>                                 Error **errp);
>>>>>      void (*set_pc)(CPUState *cpu, vaddr value);
>>>>> -    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>>>>>      bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>>>>>                       MMUAccessType access_type, int mmu_idx,
>>>>>                       bool probe, uintptr_t retaddr);
>>>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>>>>> index 4475ef0996..e1d50b3c8b 100644
>>>>> --- a/include/hw/core/tcg-cpu-ops.h
>>>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>>>> @@ -10,6 +10,8 @@
>>>>>  #ifndef TCG_CPU_OPS_H
>>>>>  #define TCG_CPU_OPS_H
>>>>>  
>>>>> +#include "hw/core/cpu.h"
>>>>
>>>> This include is circular.
>>>
>>> Yes, it's protected though, it was asked that way.
>>
>> Well, in my strong opinion, someone asked incorrectly.  It's "harmless" because
>> of the protection ifdefs, but it's Wrong because it has the potential to hide bugs.
>>
>> What is it that you thought you needed from core/cpu.h anyway?
>>
>>>> Are you sure that splitting out hw/core/tcg-cpu-ops.h from hw/core/cpu.h in
>>>> patch 15 is even useful?
>>>
>>> it avoids a huge #ifdef CONFIG_TCG
>>
>> So?  The question should be: is it useful on its own, and I think the answer to
>> that is clearly not.  Thus it should not pretend to be a standalone header file.
>>
>>
>> r~
>>
> 
> The whole point of the exercise is to sort out what is tcg specific and only compile it under CONFIG_TCG.
> 
> Having everything inside cpu.h wrapped in a 100 line #ifdef is not particularly readable or discoverable,
> so I think it is actually useful for understanding purposes to have it separate,
> but that said, I don't feel strongly on this, as I intend to improve this in later series.
> 


Should I return this file to the original state (without the extra #includes that pretend it to be a standalone header file,
and call it

tcg-cpu-ops.h.inc

?

Ciao,

Claudio

