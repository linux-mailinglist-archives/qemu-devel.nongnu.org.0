Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D82CF5C6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:42:35 +0100 (CET)
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHuU-0001tu-N0
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klFUS-0005r4-7b
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:07:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:53450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klFUA-0000ml-6g
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:07:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3B91ACB5;
 Fri,  4 Dec 2020 18:07:10 +0000 (UTC)
Subject: Re: [RFC v7 12/22] cpu: Introduce TCGCpuOperations struct
From: Claudio Fontana <cfontana@suse.de>
To: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-13-cfontana@suse.de>
 <fb02985a-010f-5a68-7444-b214e97f9050@redhat.com>
 <20201204172814.GO3836@habkost.net>
 <28f2a43d-5148-8104-9873-1ce91be4e468@suse.de>
Message-ID: <f8682afb-6791-303a-367a-28cc46b13e66@suse.de>
Date: Fri, 4 Dec 2020 19:07:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <28f2a43d-5148-8104-9873-1ce91be4e468@suse.de>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Emilio G . Cota" <cota@braap.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 7:04 PM, Claudio Fontana wrote:
> On 12/4/20 6:28 PM, Eduardo Habkost wrote:
>> On Fri, Dec 04, 2020 at 06:10:49PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 11/30/20 3:35 AM, Claudio Fontana wrote:
>>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>>
>>>> The TCG-specific CPU methods will be moved to a separate struct,
>>>> to make it easier to move accel-specific code outside generic CPU
>>>> code in the future.  Start by moving tcg_initialize().
>>>
>>> Good idea! One minor comment below.
>>>
>>>>
>>>> The new CPUClass.tcg_opts field may eventually become a pointer,
>>>> but keep it an embedded struct for now, to make code conversion
>>>> easier.
>>>>
>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> ---
>>>>  MAINTAINERS                     |  1 +
>>>>  cpu.c                           |  2 +-
>>>>  include/hw/core/cpu.h           |  9 ++++++++-
>>>>  include/hw/core/tcg-cpu-ops.h   | 25 +++++++++++++++++++++++++
>>>>  target/alpha/cpu.c              |  2 +-
>>>>  target/arm/cpu.c                |  2 +-
>>>>  target/avr/cpu.c                |  2 +-
>>>>  target/cris/cpu.c               | 12 ++++++------
>>>>  target/hppa/cpu.c               |  2 +-
>>>>  target/i386/tcg-cpu.c           |  2 +-
>>>>  target/lm32/cpu.c               |  2 +-
>>>>  target/m68k/cpu.c               |  2 +-
>>>>  target/microblaze/cpu.c         |  2 +-
>>>>  target/mips/cpu.c               |  2 +-
>>>>  target/moxie/cpu.c              |  2 +-
>>>>  target/nios2/cpu.c              |  2 +-
>>>>  target/openrisc/cpu.c           |  2 +-
>>>>  target/ppc/translate_init.c.inc |  2 +-
>>>>  target/riscv/cpu.c              |  2 +-
>>>>  target/rx/cpu.c                 |  2 +-
>>>>  target/s390x/cpu.c              |  2 +-
>>>>  target/sh4/cpu.c                |  2 +-
>>>>  target/sparc/cpu.c              |  2 +-
>>>>  target/tilegx/cpu.c             |  2 +-
>>>>  target/tricore/cpu.c            |  2 +-
>>>>  target/unicore32/cpu.c          |  2 +-
>>>>  target/xtensa/cpu.c             |  2 +-
>>>>  27 files changed, 63 insertions(+), 30 deletions(-)
>>>>  create mode 100644 include/hw/core/tcg-cpu-ops.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index f53f2678d8..d876f504a6 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1535,6 +1535,7 @@ F: qapi/machine.json
>>>>  F: qapi/machine-target.json
>>>>  F: include/hw/boards.h
>>>>  F: include/hw/core/cpu.h
>>>> +F: include/hw/core/tcg-cpu-ops.h
>>>>  F: include/hw/cpu/cluster.h
>>>>  F: include/sysemu/numa.h
>>>>  T: git https://github.com/ehabkost/qemu.git machine-next
>>>> diff --git a/cpu.c b/cpu.c
>>>> index 0be5dcb6f3..d02c2a17f1 100644
>>>> --- a/cpu.c
>>>> +++ b/cpu.c
>>>> @@ -180,7 +180,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>>>>  
>>>>      if (tcg_enabled() && !tcg_target_initialized) {
>>>>          tcg_target_initialized = true;
>>>> -        cc->tcg_initialize();
>>>> +        cc->tcg_ops.initialize();
>>>>      }
>>>>      tlb_init(cpu);
>>>>  
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index 3d92c967ff..c93b08a0fb 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -76,6 +76,10 @@ typedef struct CPUWatchpoint CPUWatchpoint;
>>>>  
>>>>  struct TranslationBlock;
>>>>  
>>>> +#ifdef CONFIG_TCG
>>>> +#include "tcg-cpu-ops.h"
>>>> +#endif /* CONFIG_TCG */
>>>> +
>>>>  /**
>>>>   * CPUClass:
>>>>   * @class_by_name: Callback to map -cpu command line model name to an
>>>> @@ -221,12 +225,15 @@ struct CPUClass {
>>>>  
>>>>      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
>>>>      vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
>>>> -    void (*tcg_initialize)(void);
>>>>  
>>>>      const char *deprecation_note;
>>>>      /* Keep non-pointer data at the end to minimize holes.  */
>>>>      int gdb_num_core_regs;
>>>>      bool gdb_stop_before_watchpoint;
>>>> +
>>>> +#ifdef CONFIG_TCG
>>>> +    TcgCpuOperations tcg_ops;
>>>> +#endif /* CONFIG_TCG */
>>>>  };
>>
>> I'm not a fan of #ifdefs in struct definitions (especially in
>> generic code like hw/cpu), because there's risk the same header
>> generate different struct layout when used by different .c files.
>> I would prefer to gradually refactor the code so that tcg_ops is
>> eventually removed from CPUClass.
>>
>> This is not a dealbreaker, because both approaches are steps in
>> the same direction.  But the #ifdef here makes review harder and
>> has more risks of unwanted side effects.
>>
>>>>  
>>>>  /*
>>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>>>> new file mode 100644
>>>> index 0000000000..4475ef0996
>>>> --- /dev/null
>>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>>> @@ -0,0 +1,25 @@
>>>> +/*
>>>> + * TCG-Specific operations that are not meaningful for hardware accelerators
>>>> + *
>>>> + * Copyright 2020 SUSE LLC
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>>> + * See the COPYING file in the top-level directory.
>>>> + */
>>>> +
>>>> +#ifndef TCG_CPU_OPS_H
>>>> +#define TCG_CPU_OPS_H
>>>> +
>>>> +/**
>>>> + * struct TcgCpuOperations: TCG operations specific to a CPU class
>>>> + */
>>>> +typedef struct TcgCpuOperations {
>>>> +    /**
>>>> +     * @initialize: Initalize TCG state
>>>> +     *
>>>> +     * Called when the first CPU is realized.
>>>> +     */
>>>> +    void (*initialize)(void);
>>>> +} TcgCpuOperations;
>>>> +
>>>> +#endif /* TCG_CPU_OPS_H */
>>> ...
>>>
>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>> index 07492e9f9a..1fa9382a7c 100644
>>>> --- a/target/arm/cpu.c
>>>> +++ b/target/arm/cpu.c
>>>> @@ -2261,7 +2261,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>>>      cc->gdb_stop_before_watchpoint = true;
>>>>      cc->disas_set_info = arm_disas_set_info;
>>>>  #ifdef CONFIG_TCG
>>>> -    cc->tcg_initialize = arm_translate_init;
>>>> +    cc->tcg_ops.initialize = arm_translate_init;
>>>
>>> This one is correctly guarded by '#ifdef CONFIG_TCG'.
>>>
>>> For the other targets, can you either place it within
>>> the '#ifdef CONFIG_TCG' block or if there is none, add
>>> one please?
>>
>> As a new #ifdef risks having additional unwanted side effects, I
>> would prefer to do it in separate patch, just in case.
>>
>> This also applies to the #ifdef Claudio added to hw/core/cpu.h
>> above.  In case we really want to do it, I would do it in a
>> separate patch.
> 
> Hi Eduardo,
> 
> yes, once things are settling we should dispose of as many #ifdefs are possible


By that I mean, as targets are adapted (arm, s390, ...) things can be refactored in a similar was as for x86,
so that the ifdefs disappear, and meson instead controls which pieces are built.

When it comes to the extra field, it was already very useful to have it #ifdef ed,
because it identified quite a few problem with the existing patches, ie, code that was trying to use the field even though it was not there.

So this step helps with finding all the right pieces to refactor away,
and then once things are in their proper place, we can take away the ifdef I think.

Ciao,

Claudio


> 
> Ciao,
> 
> Claudio
> 
>>
>>>
>>> With that change:
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Thanks!
>>
> 


