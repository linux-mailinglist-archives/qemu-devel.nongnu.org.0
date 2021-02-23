Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BC322739
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:46:32 +0100 (CET)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETKx-0004pM-57
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETIz-0004AD-Ay
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:44:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETIx-0007t7-7J
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:44:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B06EFADE3;
 Tue, 23 Feb 2021 08:44:25 +0000 (UTC)
Subject: Re: [RFC v1 04/38] target/arm: move psci.c into tcg/softmmu/
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-5-cfontana@suse.de> <87eeh857xf.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f6aafba9-600f-59a1-9dac-d3b88e82fc82@suse.de>
Date: Tue, 23 Feb 2021 09:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87eeh857xf.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:22 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/internals.h              | 23 ++++++++++-------------
>>  target/arm/tcg/helper.c             |  2 ++
>>  target/arm/{ => tcg/softmmu}/psci.c |  0
>>  target/arm/tcg/user/psci.c          | 26 ++++++++++++++++++++++++++
>>  target/arm/meson.build              |  1 -
>>  target/arm/tcg/meson.build          |  3 +++
>>  target/arm/tcg/softmmu/meson.build  |  4 ++++
>>  target/arm/tcg/user/meson.build     |  4 ++++
>>  8 files changed, 49 insertions(+), 14 deletions(-)
>>  rename target/arm/{ => tcg/softmmu}/psci.c (100%)
>>  create mode 100644 target/arm/tcg/user/psci.c
>>  create mode 100644 target/arm/tcg/softmmu/meson.build
>>  create mode 100644 target/arm/tcg/user/meson.build
>>
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index 05cebc8597..6384461177 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -292,21 +292,18 @@ vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
>>  /* Callback function for when a watchpoint or breakpoint triggers. */
>>  void arm_debug_excp_handler(CPUState *cs);
>>  
>> -#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_TCG)
>> -static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
>> -{
>> -    return false;
>> -}
>> -static inline void arm_handle_psci_call(ARMCPU *cpu)
>> -{
>> -    g_assert_not_reached();
>> -}
>> -#else
> 
> I'm not sure I'm a fan of pushing these #ifdef tweaks down into the main
> code when the compiler is good an eliding them away. I guess we need
> this because the helper.o wants to be a shared object between both user
> and softmmu/sysemu mode?


Hi Alex,

yes, but will try to clean this up, I agree that this is too much preprocessor stuff.

Ciao,

CLaudio

> 
>> -/* Return true if the r0/x0 value indicates that this SMC/HVC is a PSCI call. */
>> +#ifdef CONFIG_TCG
>> +/*
>> + * Return true only for softmmu, if the r0/x0 value indicates that this
>> + * SMC/HVC is a PSCI call.
>> + */
>>  bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
>> -/* Actually handle a PSCI call */
>> +
>> +#ifndef CONFIG_USER_ONLY
>>  void arm_handle_psci_call(ARMCPU *cpu);
>> -#endif
>> +#endif /* !CONFIG_USER_ONLY */
>> +
>> +#endif /* CONFIG_TCG */
>>  
>>  /**
>>   * arm_clear_exclusive: clear the exclusive monitor
>> diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
>> index 0e1a3b9421..beb8a5deed 100644
>> --- a/target/arm/tcg/helper.c
>> +++ b/target/arm/tcg/helper.c
>> @@ -10040,11 +10040,13 @@ void arm_cpu_do_interrupt(CPUState *cs)
>>                        env->exception.syndrome);
>>      }
>>  
>> +#ifndef CONFIG_USER_ONLY
>>      if (arm_is_psci_call(cpu, cs->exception_index)) {
>>          arm_handle_psci_call(cpu);
>>          qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
>>          return;
>>      }
>> +#endif /* CONFIG_USER_ONLY */
>>  
>>      /*
>>       * Semihosting semantics depend on the register width of the code
>> diff --git a/target/arm/psci.c b/target/arm/tcg/softmmu/psci.c
>> similarity index 100%
>> rename from target/arm/psci.c
>> rename to target/arm/tcg/softmmu/psci.c
>> diff --git a/target/arm/tcg/user/psci.c b/target/arm/tcg/user/psci.c
>> new file mode 100644
>> index 0000000000..f3e293c516
>> --- /dev/null
>> +++ b/target/arm/tcg/user/psci.c
>> @@ -0,0 +1,26 @@
>> +/*
>> + * Copyright (C) 2014 - Linaro
>> + * Author: Rob Herring <rob.herring@linaro.org>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License as published by
>> + *  the Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful,
>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *  GNU General Public License for more details.
>> + *
>> + *  You should have received a copy of the GNU General Public License
>> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "internals.h"
>> +
>> +bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
>> +{
>> +    return false;
>> +}
>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index 0172937b40..3d23a6c687 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -19,7 +19,6 @@ arm_softmmu_ss.add(files(
>>    'arm-powerctl.c',
>>    'machine.c',
>>    'monitor.c',
>> -  'psci.c',
>>  ))
>>  arm_user_ss = ss.source_set()
>>  
>> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
>> index 3b4146d079..4d9ed4b9cf 100644
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -36,3 +36,6 @@ arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
>>    'pauth_helper.c',
>>    'sve_helper.c',
>>  ))
>> +
>> +subdir('user')
>> +subdir('softmmu')
>> diff --git a/target/arm/tcg/softmmu/meson.build b/target/arm/tcg/softmmu/meson.build
>> new file mode 100644
>> index 0000000000..f136c8bb8b
>> --- /dev/null
>> +++ b/target/arm/tcg/softmmu/meson.build
>> @@ -0,0 +1,4 @@
>> +
>> +arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
>> +  'psci.c',
>> +))
>> diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
>> new file mode 100644
>> index 0000000000..f18d08c52c
>> --- /dev/null
>> +++ b/target/arm/tcg/user/meson.build
>> @@ -0,0 +1,4 @@
>> +
>> +arm_user_ss.add(when: ['CONFIG_TCG','CONFIG_USER_ONLY'], if_true: files(
>> +  'psci.c',
>> +))
> 
> 


