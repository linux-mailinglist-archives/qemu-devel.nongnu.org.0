Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF01D67FB5F
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 23:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLtko-0003YP-Lc; Sat, 28 Jan 2023 17:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pLtkm-0003XZ-5g; Sat, 28 Jan 2023 17:32:56 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pLtkk-0003g0-7O; Sat, 28 Jan 2023 17:32:55 -0500
Received: from [172.18.100.158] (unknown [46.183.103.8])
 by csgraf.de (Postfix) with ESMTPSA id 632AC60801B9;
 Sat, 28 Jan 2023 23:32:43 +0100 (CET)
Message-ID: <2311549f-2db6-d5aa-9055-5c57d786f6dd@csgraf.de>
Date: Sat, 28 Jan 2023 23:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221219220808.26392-1-agraf@csgraf.de>
 <CAFEAcA-bp_r07s7VQDMbWm=f1iV0rfB8XsZUUqpxENnn5fTe+g@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA-bp_r07s7VQDMbWm=f1iV0rfB8XsZUUqpxENnn5fTe+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


On 06.01.23 17:37, Peter Maydell wrote:
> On Mon, 19 Dec 2022 at 22:08, Alexander Graf <agraf@csgraf.de> wrote:
>> We currently only support GICv2 emulation. To also support GICv3, we will
>> need to pass a few system registers into their respective handler functions.
>>
>> This patch adds support for HVF to call into the TCG callbacks for GICv3
>> system register handlers. This is safe because the GICv3 TCG code is generic
>> as long as we limit ourselves to EL0 and EL1 - which are the only modes
>> supported by HVF.
>>
>> To make sure nobody trips over that, we also annotate callbacks that don't
>> work in HVF mode, such as EL state change hooks.
>>
>> With GICv3 support in place, we can run with more than 8 vCPUs.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>   hw/intc/arm_gicv3_cpuif.c   |   8 +-
>>   target/arm/hvf/hvf.c        | 151 ++++++++++++++++++++++++++++++++++++
>>   target/arm/hvf/trace-events |   2 +
>>   3 files changed, 160 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
>> index b17b29288c..b4e387268c 100644
>> --- a/hw/intc/arm_gicv3_cpuif.c
>> +++ b/hw/intc/arm_gicv3_cpuif.c
>> @@ -21,6 +21,7 @@
>>   #include "hw/irq.h"
>>   #include "cpu.h"
>>   #include "target/arm/cpregs.h"
>> +#include "sysemu/tcg.h"
>>
>>   /*
>>    * Special case return value from hppvi_index(); must be larger than
>> @@ -2810,6 +2811,8 @@ void gicv3_init_cpuif(GICv3State *s)
>>            * which case we'd get the wrong value.
>>            * So instead we define the regs with no ri->opaque info, and
>>            * get back to the GICv3CPUState from the CPUARMState.
>> +         *
>> +         * These CP regs callbacks can be called from either TCG or HVF code.
>>            */
>>           define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
>>
>> @@ -2905,6 +2908,9 @@ void gicv3_init_cpuif(GICv3State *s)
>>                   define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
>>               }
>>           }
>> -        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
>> +        if (tcg_enabled()) {
>> +            /* We can only trap EL changes with TCG for now */
> We could expand this a bit:
>
>   We can only trap EL changes with TCG. However the GIC interrupt
>   state only changes on EL changes involving EL2 or EL3, so for
>   the non-TCG case this is OK, as EL2 and EL3 can't exist.
>
> and assert:
>   assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
>   assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));


Good idea! Let me add that.


>
>> +static uint32_t hvf_reg2cp_reg(uint32_t reg)
>> +{
>> +    return ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
>> +                              (reg >> 10) & 0xf,
>> +                              (reg >> 1) & 0xf,
>> +                              (reg >> 20) & 0x3,
>> +                              (reg >> 14) & 0x7,
>> +                              (reg >> 17) & 0x7);
> This file has #defines for these shift and mask constants
> (SYSREG_OP0_SHIFT etc).


Ugh, thanks for catching that!


>
>> +}
>> +
>> +static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
>> +{
>> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
>> +    CPUARMState *env = &arm_cpu->env;
>> +    const ARMCPRegInfo *ri;
>> +
>> +    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
>> +    if (ri) {
>> +        if (ri->accessfn) {
>> +            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
>> +                return false;
>> +            }
>> +        }
>> +        if (ri->type & ARM_CP_CONST) {
>> +            *val = ri->resetvalue;
>> +        } else if (ri->readfn) {
>> +            *val = ri->readfn(env, ri);
>> +        } else {
>> +            *val = CPREG_FIELD64(env, ri);
>> +        }
>> +        trace_hvf_vgic_read(ri->name, *val);
>> +        return true;
>> +    }
> Can we get here for attempts by EL0 to access EL1-only
> sysregs, or does hvf send the exception to EL1 without
> trapping out to us? If we can get here for EL0 accesses we
> need to check against ri->access as well as ri->accessfn.


I just validated, GICv3 EL1 registers trap to EL1 inside the guest:


$ cat a.S
.global start
.global _main
_main:
start:
         mrs x0, ICC_AP0R0_EL1
         mov x0, #0x1234
         msr ICC_AP0R0_EL1, x0
         mov x0, #0
         ret
$ gcc -nostdlib a.S
$ gdb ./a.out
(gdb) r
Program received signal SIGILL, Illegal instruction.
0x00000000004000d4 in start ()
(gdb) x/i $pc
=> 0x4000d4 <start>:        mrs     x0, icc_ap0r0_el1


So no need to check ri->access :)


Alex


