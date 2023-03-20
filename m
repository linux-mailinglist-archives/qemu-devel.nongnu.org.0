Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C371A6C1443
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:02:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peG4g-0003in-8b; Mon, 20 Mar 2023 10:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peG4U-0003iR-N9
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:01:10 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peG4S-00012K-Ln
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:01:10 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DEDD01F86C;
 Mon, 20 Mar 2023 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679320866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYJlxT5kFY4LqDjjBAAm8ShGCO8xdsJA3sX4NjmBpYU=;
 b=kNZyMlVzb+W1EoLT8bvZwFk3/WbDlVTNVdTtai1k3HIgoDzhvSYjuNYsN17gPcDw0K1DUZ
 YLj+aGy52Rwk1REawajM5mXiaSmnMQYwmGdd0kM62zFR3Dc/YuXZo6e9frg4mOI2EeZJhZ
 O+OZEHDCBK26KdP0ZldtDgWED5bUYT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679320866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYJlxT5kFY4LqDjjBAAm8ShGCO8xdsJA3sX4NjmBpYU=;
 b=G3XYA45yZmBqkjTL9L6GhyHHU0Km7JU05adfshASs17IF5iIIRN1pFdA0iVdRi1GbyVQe9
 IFKP/2SDD4AJ4UBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CF3C13416;
 Mon, 20 Mar 2023 14:01:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ocXIJCJnGGQdFAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 20 Mar 2023 14:01:06 +0000
Message-ID: <34fc1e42-a0f7-c0fe-300f-3ad78deb8e6c@suse.de>
Date: Mon, 20 Mar 2023 15:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/10] accel/tcg: move cpu_reloading_memory_map into
 cpu-exec-softmmu
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <fabiano.rosas@suse.com>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-3-alex.bennee@linaro.org>
 <c6e1bf23-618f-410d-a53b-6f4cbd007e7b@suse.de> <87355z8ry2.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87355z8ry2.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/20/23 14:32, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> How is this conditional on CONFIG_TCG? To me it looks like this breaks !CONFIG_TCG.
>> Careful, the meson.build in accel/tcg/meson.build is always recursed.
> 
> Surely it shouldn't be in accel/tcg then?


Hi Alex,

maybe we did not understand each other.

What I mean is that accel/tcg/meson.build is not conditionally read, it is _always_ read.

Therefore TCG-specific code needs to be conditionally included using the CONFIG_TCG.

Ciao,

Claudio

> 
>> This code was in tcg_ss before, why not simply add it to tcg_ss and
>> then to specific_ss along with the other tcg pieces?
> 
> tcg_ss is rebuilt for every target. So far the code in cpu-exec-softmmu
> should only need to for softmmu targets and hopefully share the same
> binary for all variants.
> 
> I guess I'll have to do something more in line with the recent
> re-factoring of gdbstub:
> 
>   # We build two versions of gdbstub, one for each mode
>   gdb_user_ss.add(files('gdbstub.c', 'user.c'))
>   gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))
> 
>   gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
>   gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
> 
>   libgdb_user = static_library('gdb_user',
>                                gdb_user_ss.sources() + genh,
>                                name_suffix: 'fa',
>                                c_args: '-DCONFIG_USER_ONLY')
> 
>   libgdb_softmmu = static_library('gdb_softmmu',
>                                   gdb_softmmu_ss.sources() + genh,
>                                   name_suffix: 'fa')
> 
>   gdb_user = declare_dependency(link_whole: libgdb_user)
>   user_ss.add(gdb_user)
>   gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
>   softmmu_ss.add(gdb_softmmu)
> 
> 
>>
>> Ciao,
>>
>> C
>>
>>
>> On 3/20/23 11:10, Alex Bennée wrote:
>>> This doesn't save much as cpu-exec-common still needs to be built
>>> per-target for its knowledge of CPUState but this helps with keeping
>>> things organised.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  accel/tcg/cpu-exec-common.c  | 30 ----------------------
>>>  accel/tcg/cpu-exec-softmmu.c | 50 ++++++++++++++++++++++++++++++++++++
>>>  accel/tcg/meson.build        | 10 ++++++++
>>>  3 files changed, 60 insertions(+), 30 deletions(-)
>>>  create mode 100644 accel/tcg/cpu-exec-softmmu.c
>>>
>>> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
>>> index e7962c9348..c6b0ad303e 100644
>>> --- a/accel/tcg/cpu-exec-common.c
>>> +++ b/accel/tcg/cpu-exec-common.c
>>> @@ -32,36 +32,6 @@ void cpu_loop_exit_noexc(CPUState *cpu)
>>>      cpu_loop_exit(cpu);
>>>  }
>>>  
>>> -#if defined(CONFIG_SOFTMMU)
>>> -void cpu_reloading_memory_map(void)
>>> -{
>>> -    if (qemu_in_vcpu_thread() && current_cpu->running) {
>>> -        /* The guest can in theory prolong the RCU critical section as long
>>> -         * as it feels like. The major problem with this is that because it
>>> -         * can do multiple reconfigurations of the memory map within the
>>> -         * critical section, we could potentially accumulate an unbounded
>>> -         * collection of memory data structures awaiting reclamation.
>>> -         *
>>> -         * Because the only thing we're currently protecting with RCU is the
>>> -         * memory data structures, it's sufficient to break the critical section
>>> -         * in this callback, which we know will get called every time the
>>> -         * memory map is rearranged.
>>> -         *
>>> -         * (If we add anything else in the system that uses RCU to protect
>>> -         * its data structures, we will need to implement some other mechanism
>>> -         * to force TCG CPUs to exit the critical section, at which point this
>>> -         * part of this callback might become unnecessary.)
>>> -         *
>>> -         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
>>> -         * only protects cpu->as->dispatch. Since we know our caller is about
>>> -         * to reload it, it's safe to split the critical section.
>>> -         */
>>> -        rcu_read_unlock();
>>> -        rcu_read_lock();
>>> -    }
>>> -}
>>> -#endif
>>> -
>>>  void cpu_loop_exit(CPUState *cpu)
>>>  {
>>>      /* Undo the setting in cpu_tb_exec.  */
>>> diff --git a/accel/tcg/cpu-exec-softmmu.c b/accel/tcg/cpu-exec-softmmu.c
>>> new file mode 100644
>>> index 0000000000..2318dd8c7d
>>> --- /dev/null
>>> +++ b/accel/tcg/cpu-exec-softmmu.c
>>> @@ -0,0 +1,50 @@
>>> +/*
>>> + *  Emulator main CPU execution loop, softmmu bits
>>> + *
>>> + *  Copyright (c) 2003-2005 Fabrice Bellard
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
>>> +#include "qemu/osdep.h"
>>> +#include "hw/core/cpu.h"
>>> +#include "sysemu/cpus.h"
>>> +
>>> +void cpu_reloading_memory_map(void)
>>> +{
>>> +    if (qemu_in_vcpu_thread() && current_cpu->running) {
>>> +        /* The guest can in theory prolong the RCU critical section as long
>>> +         * as it feels like. The major problem with this is that because it
>>> +         * can do multiple reconfigurations of the memory map within the
>>> +         * critical section, we could potentially accumulate an unbounded
>>> +         * collection of memory data structures awaiting reclamation.
>>> +         *
>>> +         * Because the only thing we're currently protecting with RCU is the
>>> +         * memory data structures, it's sufficient to break the critical section
>>> +         * in this callback, which we know will get called every time the
>>> +         * memory map is rearranged.
>>> +         *
>>> +         * (If we add anything else in the system that uses RCU to protect
>>> +         * its data structures, we will need to implement some other mechanism
>>> +         * to force TCG CPUs to exit the critical section, at which point this
>>> +         * part of this callback might become unnecessary.)
>>> +         *
>>> +         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
>>> +         * only protects cpu->as->dispatch. Since we know our caller is about
>>> +         * to reload it, it's safe to split the critical section.
>>> +         */
>>> +        rcu_read_unlock();
>>> +        rcu_read_lock();
>>> +    }
>>> +}
>>> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
>>> index aeb20a6ef0..bdc086b90d 100644
>>> --- a/accel/tcg/meson.build
>>> +++ b/accel/tcg/meson.build
>>> @@ -1,3 +1,9 @@
>>> +#
>>> +# Currently most things here end up in specific_ss eventually because
>>> +# they need knowledge of CPUState. Stuff that that doesn't can live in
>>> +# common user, softmmu or overall code
>>> +#
>>> +
>>>  tcg_ss = ss.source_set()
>>>  tcg_ss.add(files(
>>>    'tcg-all.c',
>>> @@ -9,6 +15,7 @@ tcg_ss.add(files(
>>>    'translate-all.c',
>>>    'translator.c',
>>>  ))
>>> +
>>>  tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
>>>  tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
>>>  tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
>>> @@ -27,3 +34,6 @@ tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
>>>    'tcg-accel-ops-icount.c',
>>>    'tcg-accel-ops-rr.c',
>>>  ))
>>> +
>>> +# Common softmmu code
>>> +softmmu_ss.add(files('cpu-exec-softmmu.c'))
> 
> 


