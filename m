Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BA23446B7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:08:22 +0100 (CET)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLED-0001p4-LR
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL1L-0006If-MA
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:55:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL1J-0000jb-Ot
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:55:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39748AD4A;
 Mon, 22 Mar 2021 13:55:00 +0000 (UTC)
Subject: Re: [RFC] accel: add cpu_reset
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-2-cfontana@suse.de>
 <e7e0cfe6-d9c8-8cd4-39bc-65374771824a@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <a387d69e-f202-d4e4-476e-9452072fd238@suse.de>
Date: Mon, 22 Mar 2021 14:54:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e7e0cfe6-d9c8-8cd4-39bc-65374771824a@amsat.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> On 3/22/21 2:27 PM, Claudio Fontana wrote:
>> XXX
>> ---
>>  accel/accel-common.c        | 9 +++++++++
>>  hw/core/cpu.c               | 3 ++-
>>  include/hw/core/accel-cpu.h | 2 ++
>>  include/qemu/accel.h        | 6 ++++++
>>  target/i386/cpu.c           | 4 ----
>>  target/i386/kvm/kvm-cpu.c   | 6 ++++++
>>  6 files changed, 25 insertions(+), 5 deletions(-)
>>
>>
>> This surprisingly works without moving cpu_reset() to a
>> specific_ss module, even though
>>
>> accel-common.c is specific_ss,
>> hw/core/cpu.c  is common_ss.
>>
>> How come the call to accel_reset_cpu works?
> 
> Each CPU optionally calls cpu_reset() manually?

Hi Philippe, are you concerned about these calls?
Or what are you highlighting here?

They in turn call cpu_reset() so we should be good right?

Ciao,

Claudio

> 
> $ git grep register_reset.*cpu
> hw/arm/armv7m.c:334:    qemu_register_reset(armv7m_reset, cpu);
> hw/arm/boot.c:1290:        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
> hw/cris/boot.c:101:    qemu_register_reset(main_cpu_reset, cpu);
> hw/lm32/lm32_boards.c:162:    qemu_register_reset(main_cpu_reset,
> reset_info);
> hw/lm32/lm32_boards.c:289:    qemu_register_reset(main_cpu_reset,
> reset_info);
> hw/lm32/milkymist.c:238:    qemu_register_reset(main_cpu_reset, reset_info);
> hw/m68k/q800.c:247:    qemu_register_reset(main_cpu_reset, cpu);
> hw/m68k/virt.c:132:    qemu_register_reset(main_cpu_reset, cpu);
> hw/microblaze/boot.c:134:    qemu_register_reset(main_cpu_reset, cpu);
> hw/mips/cps.c:107:        qemu_register_reset(main_cpu_reset, cpu);
> hw/mips/fuloong2e.c:269:    qemu_register_reset(main_cpu_reset, cpu);
> hw/mips/jazz.c:195:    qemu_register_reset(main_cpu_reset, cpu);
> hw/mips/loongson3_virt.c:545:        qemu_register_reset(main_cpu_reset,
> cpu);
> hw/mips/malta.c:1185:        qemu_register_reset(main_cpu_reset, cpu);
> hw/mips/mipssim.c:170:    qemu_register_reset(main_cpu_reset, reset_info);
> hw/moxie/moxiesim.c:120:    qemu_register_reset(main_cpu_reset, cpu);
> hw/nios2/boot.c:138:    qemu_register_reset(main_cpu_reset, cpu);
> hw/openrisc/openrisc_sim.c:160:
> qemu_register_reset(main_cpu_reset, cpus[n]);
> hw/ppc/e500.c:903:            qemu_register_reset(ppce500_cpu_reset, cpu);
> hw/ppc/e500.c:907:            qemu_register_reset(ppce500_cpu_reset_sec,
> cpu);
> hw/ppc/mac_newworld.c:156:        qemu_register_reset(ppc_core99_reset,
> cpu);
> hw/ppc/mac_oldworld.c:118:
> qemu_register_reset(ppc_heathrow_reset, cpu);
> hw/ppc/ppc440_bamboo.c:192:    qemu_register_reset(main_cpu_reset, cpu);
> hw/ppc/ppc4xx_devs.c:75:    qemu_register_reset(ppc4xx_reset, cpu);
> hw/ppc/ppc_booke.c:369:
> qemu_register_reset(ppc_booke_timer_reset_handle, cpu);
> hw/ppc/prep.c:270:    qemu_register_reset(ppc_prep_reset, cpu);
> hw/ppc/sam460ex.c:306:    qemu_register_reset(main_cpu_reset, cpu);
> hw/ppc/spapr_cpu_core.c:245:
> qemu_unregister_reset(spapr_cpu_core_reset_handler, sc);
> hw/ppc/spapr_cpu_core.c:326:
> qemu_register_reset(spapr_cpu_core_reset_handler, sc);
> hw/ppc/virtex_ml507.c:233:    qemu_register_reset(main_cpu_reset, cpu);
> hw/riscv/riscv_hart.c:51:    qemu_register_reset(riscv_harts_cpu_reset,
> &s->harts[idx]);
> hw/sh4/r2d.c:251:    qemu_register_reset(main_cpu_reset, reset_info);
> hw/sparc/leon3.c:213:    qemu_register_reset(main_cpu_reset, reset_info);
> hw/sparc/sun4m.c:828:    qemu_register_reset(sun4m_cpu_reset, cpu);
> hw/sparc64/sparc64.c:357:    qemu_register_reset(main_cpu_reset,
> reset_info);
> hw/xtensa/sim.c:68:        qemu_register_reset(sim_reset, cpu);
> hw/xtensa/xtfpga.c:270:        qemu_register_reset(xtfpga_reset, cpu);
> target/i386/cpu.c:6859:    qemu_register_reset(x86_cpu_machine_reset_cb,
> cpu);
> target/i386/cpu.c:6942:
> qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
> target/i386/hax/hax-all.c:230:
> qemu_register_reset(hax_reset_vcpu_state, (CPUArchState *) (cpu->env_ptr));
> target/s390x/cpu.c:232:
> qemu_register_reset(s390_cpu_machine_reset_cb, cpu);
> target/s390x/cpu.c:319:
> qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
> 


