Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE73B5528
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 22:42:02 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxbbN-0006iM-8p
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 16:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lxba9-0005hT-SU; Sun, 27 Jun 2021 16:40:45 -0400
Received: from mail.csgraf.de ([85.25.223.15]:32976 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lxbZq-0001Ov-3y; Sun, 27 Jun 2021 16:40:45 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-101-004.77.2.pool.telefonica.de [77.2.101.4])
 by csgraf.de (Postfix) with ESMTPSA id 706C860801CD;
 Sun, 27 Jun 2021 22:40:20 +0200 (CEST)
Subject: Re: [PATCH v8 13/19] hvf: Add Apple Silicon support
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-14-agraf@csgraf.de>
 <CAFEAcA_M6SB8f4X1z=P4+pZ0Q-H3vdhvgu8ZsQLxZFro5TuiVQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <30c30532-c84a-051d-825e-9da6da0b4dcf@csgraf.de>
Date: Sun, 27 Jun 2021 22:40:19 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_M6SB8f4X1z=P4+pZ0Q-H3vdhvgu8ZsQLxZFro5TuiVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
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
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 15.06.21 12:21, Peter Maydell wrote:
> On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>> With Apple Silicon available to the masses, it's a good time to add support
>> for driving its virtualization extensions from QEMU.
>>
>> This patch adds all necessary architecture specific code to get basic VMs
>> working. It's still pretty raw, but definitely functional.
>>
>> Known limitations:
>>
>>   - Vtimer acknowledgement is hacky
>>   - Should implement more sysregs and fault on invalid ones then
>>   - WFI handling is missing, need to marry it with vtimer
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> @@ -446,11 +454,17 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>>                         cpu, QEMU_THREAD_JOINABLE);
>>  }
>>
>> +__attribute__((weak)) void hvf_kick_vcpu_thread(CPUState *cpu)
>> +{
>> +    cpus_kick_thread(cpu);
>> +}
> Why is this marked 'weak' ? If there's a reason for it then
> it ought to have a comment describing the reason. If we can avoid
> it then we should do so -- past experience is that 'weak' refs
> are rather non-portable, though at least this one is in a
> host-OS-specific file.


Mostly because I wanted to keep the kick function in the generic file
for the generic case. ARM is special in that it requires different kick
mechanisms depending on which context we're in (in-vcpu or in-QEMU).

However, I agree that with 2 architectures, there's not really a
"default". I'm happy to move it into the x86 specific file.


>
>> +static void hvf_raise_exception(CPUARMState *env, uint32_t excp,
>> +                                uint32_t syndrome)
>> +{
>> +    unsigned int new_el = 1;
>> +    unsigned int old_mode = pstate_read(env);
>> +    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
>> +    target_ulong addr = env->cp15.vbar_el[new_el];
>> +
>> +    env->cp15.esr_el[new_el] = syndrome;
>> +    aarch64_save_sp(env, arm_current_el(env));
>> +    env->elr_el[new_el] = env->pc;
>> +    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
>> +    pstate_write(env, PSTATE_DAIF | new_mode);
>> +    aarch64_restore_sp(env, new_el);
>> +    env->pc = addr;
>> +}
> KVM does "raise an exception" by calling arm_cpu_do_interrupt()
> to do the "set ESR_ELx, save SPSR, etc etc" work (see eg
> kvm_arm_handle_debug()". Does that not work here ?


It works like a charm. I mostly did the dance because I was under the
impression you wanted to avoid me calling into any TCG code. And to me
arm_cpu_do_interrupt() seemed like TCG code. I'm absolutely happy to
change it though. Leaving things to generic code is good IMHO :).


>
>> +
>> +static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>> +{
>> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
>> +    uint64_t val = 0;
>> +
>> +    switch (reg) {
>> +    case SYSREG_CNTPCT_EL0:
>> +        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
>> +              gt_cntfrq_period_ns(arm_cpu);
>> +        break;
> Does hvf handle the "EL0 access which should be denied because
> CNTKCTL_EL1.EL0PCTEN is 0" case for us, or should we have
> an access-check here ?


A quick test where I tried to access it in a VM in EL0 shows that either
the CPU or HVF already generates the trap. So no check needed.


>
>> +    case SYSREG_PMCCNTR_EL0:
>> +        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> This is supposed to be a cycle counter, not a timestamp...


At 1Ghz cycle frequency, what's the difference? Or are you concerned
about the lack of overflow and PMCR logic?


>
>> +        break;
>> +    default:
>> +        trace_hvf_unhandled_sysreg_read(reg,
>> +                                        (reg >> 20) & 0x3,
>> +                                        (reg >> 14) & 0x7,
>> +                                        (reg >> 10) & 0xf,
>> +                                        (reg >> 1) & 0xf,
>> +                                        (reg >> 17) & 0x7);
>> +        break;
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>> +{
>> +    switch (reg) {
>> +    case SYSREG_CNTPCT_EL0:
>> +        break;
> CNTPCT_EL0 is read-only (ie writes should fault) but this
> makes it writes-ignored, doesn't it ?


It does indeed, let me fix that.


>
>> +    default:
>> +        trace_hvf_unhandled_sysreg_write(reg,
>> +                                         (reg >> 20) & 0x3,
>> +                                         (reg >> 14) & 0x7,
>> +                                         (reg >> 10) & 0xf,
>> +                                         (reg >> 1) & 0xf,
>> +                                         (reg >> 17) & 0x7);
>> +        break;
>> +    }
>> +}
>> +    switch (ec) {
>> +    case EC_DATAABORT: {
>> +        bool isv = syndrome & ARM_EL_ISV;
>> +        bool iswrite = (syndrome >> 6) & 1;
>> +        bool s1ptw = (syndrome >> 7) & 1;
>> +        uint32_t sas = (syndrome >> 22) & 3;
>> +        uint32_t len = 1 << sas;
>> +        uint32_t srt = (syndrome >> 16) & 0x1f;
>> +        uint64_t val = 0;
>> +
>> +        trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
>> +                             hvf_exit->exception.physical_address, isv,
>> +                             iswrite, s1ptw, len, srt);
>> +
>> +        assert(isv);
> This seems dubious -- won't we just crash if the guest does
> a data access to a device or to unmapped memory with an insn that
> doesn't set ISV ? With KVM we feed this back to the guest as an
> external data abort (see the KVM_EXIT_ARM_NISV handling).


Hm, I can't say I'm a big fan of that behavior: It makes enabling OSs
that are not properly adapted for non-ISV behavior harder, because
understanding in-guest exception flows is usually harder than looking at
undesired code paths from the outside. And I highly doubt you'll find a
properly functional guest environment that gets external data aborts on
non-enlightened MMIO access.

But if you feel strongly about it, I'm happy to imitate the behavior of
today's KVM_EXIT_ARM_NISV handler.


>
>> +
>> +        if (iswrite) {
>> +            val = hvf_get_reg(cpu, srt);
>> +            address_space_write(&address_space_memory,
>> +                                hvf_exit->exception.physical_address,
>> +                                MEMTXATTRS_UNSPECIFIED, &val, len);
>> +        } else {
>> +            address_space_read(&address_space_memory,
>> +                               hvf_exit->exception.physical_address,
>> +                               MEMTXATTRS_UNSPECIFIED, &val, len);
>> +            hvf_set_reg(cpu, srt, val);
>> +        }
>> +
>> +        advance_pc = true;
>> +        break;
>> +    }
>> +    case EC_SYSTEMREGISTERTRAP: {
>> +        bool isread = (syndrome >> 0) & 1;
>> +        uint32_t rt = (syndrome >> 5) & 0x1f;
>> +        uint32_t reg = syndrome & SYSREG_MASK;
>> +        uint64_t val = 0;
>> +
>> +        if (isread) {
>> +            val = hvf_sysreg_read(cpu, reg);
>> +            trace_hvf_sysreg_read(reg,
>> +                                  (reg >> 20) & 0x3,
>> +                                  (reg >> 14) & 0x7,
>> +                                  (reg >> 10) & 0xf,
>> +                                  (reg >> 1) & 0xf,
>> +                                  (reg >> 17) & 0x7,
>> +                                  val);
>> +            hvf_set_reg(cpu, rt, val);
>> +        } else {
>> +            val = hvf_get_reg(cpu, rt);
>> +            trace_hvf_sysreg_write(reg,
>> +                                   (reg >> 20) & 0x3,
>> +                                   (reg >> 14) & 0x7,
>> +                                   (reg >> 10) & 0xf,
>> +                                   (reg >> 1) & 0xf,
>> +                                   (reg >> 17) & 0x7,
>> +                                   val);
>> +            hvf_sysreg_write(cpu, reg, val);
>> +        }
> This needs support for "this really was a bogus system register
> access, feed the guest an exception".


Yup. Added.


Thanks!

Alex



