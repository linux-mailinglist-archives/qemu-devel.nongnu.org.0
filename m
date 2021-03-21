Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E234337D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 17:37:49 +0100 (CET)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO15H-0005vk-Pt
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 12:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lO13i-0005J0-1E; Sun, 21 Mar 2021 12:36:10 -0400
Received: from mail.csgraf.de ([85.25.223.15]:53588 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lO13g-0002pn-5Z; Sun, 21 Mar 2021 12:36:09 -0400
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 60BD56080612;
 Sun, 21 Mar 2021 17:36:04 +0100 (CET)
Message-ID: <23150257-0a69-ad38-799f-6c50306ddbef@csgraf.de>
Date: Sun, 21 Mar 2021 17:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:87.0)
 Gecko/20100101 Thunderbird/87.0
Subject: Re: [PATCH v6 10/11] hvf: arm: Add support for GICv3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-11-agraf@csgraf.de>
 <CAFEAcA9f+urL1ZnXY4wZMPfbd04afnpo0wKxVo4N=KYGjh0oNA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA9f+urL1ZnXY4wZMPfbd04afnpo0wKxVo4N=KYGjh0oNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 28.01.21 17:40, Peter Maydell wrote:
> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>> We currently only support GICv2 emulation. To also support GICv3, we will
>> need to pass a few system registers into their respective handler functions.
>>
>> This patch adds handling for all of the required system registers, so that
>> we can run with more than 8 vCPUs.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> So, how much of the GICv3 does Hypervisor.framework expect
> userspace to implement ?


All of it. There is absolutely 0 handling for anything GIC related in HVF.


> Currently we have two GICv3 implementations:
>   * hw/intc/arm_gicv3_kvm.c -- which is the stub device that
>     handles the KVM in-kernel GICv3
>   * hw/intc/arm_gicv3.c -- which is the full-emulation device
>     that assumes that it is working with a TCG CPU
>
> Support for HVF GICv3 needs either another one of these or
> some serious refactoring of the full-emulation device so that
> it doesn't assume that the CPU it's dealing with is a TCG one.
> (I suspect the right design is to bite the bullet and make the
> implementation follow the hardware in having "the GIC device proper"
> and "the GIC CPU interface" separate from each other and communicating
> via an API approximately equivalent to the GIC Stream Protocol
> as described in the GICv3 architecture specification; but that's
> a painful refactor and there might be some other approach less
> invasive but still reasonably clean.)


Happy to hear good suggestions on how to do a less painful refactor. At 
the end of the day, while I agree that the arm_gicv3*.c code does rely 
on the CPU env that usually related to TCG, I don't see why we shouldn't 
reuse that same data structure to transmit CPU state...


>
>>   static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>>   {
>>       ARMCPU *arm_cpu = ARM_CPU(cpu);
>> @@ -431,6 +491,39 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>>       case SYSREG_PMCCNTR_EL0:
>>           val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>           break;
>> +    case SYSREG_ICC_AP0R0_EL1:
>> +    case SYSREG_ICC_AP0R1_EL1:
>> +    case SYSREG_ICC_AP0R2_EL1:
>> +    case SYSREG_ICC_AP0R3_EL1:
>> +    case SYSREG_ICC_AP1R0_EL1:
>> +    case SYSREG_ICC_AP1R1_EL1:
>> +    case SYSREG_ICC_AP1R2_EL1:
>> +    case SYSREG_ICC_AP1R3_EL1:
>> +    case SYSREG_ICC_ASGI1R_EL1:
>> +    case SYSREG_ICC_BPR0_EL1:
>> +    case SYSREG_ICC_BPR1_EL1:
>> +    case SYSREG_ICC_DIR_EL1:
>> +    case SYSREG_ICC_EOIR0_EL1:
>> +    case SYSREG_ICC_EOIR1_EL1:
>> +    case SYSREG_ICC_HPPIR0_EL1:
>> +    case SYSREG_ICC_HPPIR1_EL1:
>> +    case SYSREG_ICC_IAR0_EL1:
>> +    case SYSREG_ICC_IAR1_EL1:
>> +    case SYSREG_ICC_IGRPEN0_EL1:
>> +    case SYSREG_ICC_IGRPEN1_EL1:
>> +    case SYSREG_ICC_PMR_EL1:
>> +    case SYSREG_ICC_SGI0R_EL1:
>> +    case SYSREG_ICC_SGI1R_EL1:
>> +    case SYSREG_ICC_SRE_EL1:
>> +        val = hvf_sysreg_read_cp(cpu, reg);
>> +        break;
>> +    case SYSREG_ICC_CTLR_EL1:
>> +        val = hvf_sysreg_read_cp(cpu, reg);
>> +
>> +        /* AP0R registers above 0 don't trap, expose less PRIs to fit */
>> +        val &= ~ICC_CTLR_EL1_PRIBITS_MASK;
>> +        val |= 4 << ICC_CTLR_EL1_PRIBITS_SHIFT;
>> +        break;
> Pretty sure you don't want to be trying to squeeze even the
> GICv3 cpuif implementation into this source file...
>
>>       default:
>>           DPRINTF("unhandled sysreg read %08x (op0=%d op1=%d op2=%d "
>>                   "crn=%d crm=%d)", reg, (reg >> 20) & 0x3,
>> @@ -442,6 +535,24 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>>       return val;
>>   }
>>
>> +static void hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
>> +{
>> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
>> +    CPUARMState *env = &arm_cpu->env;
>> +    const ARMCPRegInfo *ri;
>> +
>> +    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
>> +
>> +    if (ri) {
>> +        if (ri->writefn) {
>> +            ri->writefn(env, ri, val);
>> +        } else {
>> +            CPREG_FIELD64(env, ri) = val;
>> +        }
>> +        DPRINTF("vgic write to %s [val=%016llx]", ri->name, val);
>> +    }
>> +}
>> +
>>   static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>>   {
>>       ARMCPU *arm_cpu = ARM_CPU(cpu);
>> @@ -449,6 +560,36 @@ static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>>       switch (reg) {
>>       case SYSREG_CNTPCT_EL0:
>>           break;
>> +    case SYSREG_ICC_AP0R0_EL1:
>> +    case SYSREG_ICC_AP0R1_EL1:
>> +    case SYSREG_ICC_AP0R2_EL1:
>> +    case SYSREG_ICC_AP0R3_EL1:
>> +    case SYSREG_ICC_AP1R0_EL1:
>> +    case SYSREG_ICC_AP1R1_EL1:
>> +    case SYSREG_ICC_AP1R2_EL1:
>> +    case SYSREG_ICC_AP1R3_EL1:
>> +    case SYSREG_ICC_ASGI1R_EL1:
>> +    case SYSREG_ICC_BPR0_EL1:
>> +    case SYSREG_ICC_BPR1_EL1:
>> +    case SYSREG_ICC_CTLR_EL1:
>> +    case SYSREG_ICC_DIR_EL1:
>> +    case SYSREG_ICC_HPPIR0_EL1:
>> +    case SYSREG_ICC_HPPIR1_EL1:
>> +    case SYSREG_ICC_IAR0_EL1:
>> +    case SYSREG_ICC_IAR1_EL1:
>> +    case SYSREG_ICC_IGRPEN0_EL1:
>> +    case SYSREG_ICC_IGRPEN1_EL1:
>> +    case SYSREG_ICC_PMR_EL1:
>> +    case SYSREG_ICC_SGI0R_EL1:
>> +    case SYSREG_ICC_SGI1R_EL1:
>> +    case SYSREG_ICC_SRE_EL1:
>> +        hvf_sysreg_write_cp(cpu, reg, val);
>> +        break;
>> +    case SYSREG_ICC_EOIR0_EL1:
>> +    case SYSREG_ICC_EOIR1_EL1:
>> +        hvf_sysreg_write_cp(cpu, reg, val);
>> +        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 0);
>> +        hv_vcpu_set_vtimer_mask(cpu->hvf->fd, false);
> This definitely looks wrong. Not every interrupt is
> a timer interrupt, and writing to EOIR in the GIC doesn't
> squelch the underlying timer irq, that should happen somewhere
> else.


The official HVF documentation says that this should happen when the 
guest emits an EOI in the IRQ controller. The worst thing that can 
happen here is that the EOI was for someone else and we assert the timer 
(level!) IRQ line again, which isn't too bad IMHO.

So where else would you put it?


Alex



