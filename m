Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF552B92BB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:48:01 +0100 (CET)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjM0-0002vQ-Ua
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1kfjKa-0001if-8w
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:46:32 -0500
Received: from foss.arm.com ([217.140.110.172]:49020)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1kfjKX-0003qW-De
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:46:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6039A1396;
 Thu, 19 Nov 2020 04:46:28 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFEED3F718;
 Thu, 19 Nov 2020 04:46:25 -0800 (PST)
Subject: Re: [PATCH v4 1/2] arm64: kvm: Save/restore MTE registers
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20201026155727.36685-1-steven.price@arm.com>
 <20201026155727.36685-2-steven.price@arm.com>
 <b8f2fe15e0cab5c24094915b8c000930@kernel.org>
 <98eaa539-0ae8-ce4c-8886-3040542ede80@arm.com> <X7VTsaO/7+Izqm8/@trantor>
From: Steven Price <steven.price@arm.com>
Message-ID: <f5e9fe3a-2147-4326-5e78-5eaf88c72789@arm.com>
Date: Thu, 19 Nov 2020 12:45:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X7VTsaO/7+Izqm8/@trantor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 07:45:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 17:02, Catalin Marinas wrote:
> On Wed, Nov 18, 2020 at 04:01:18PM +0000, Steven Price wrote:
>> On 17/11/2020 19:20, Marc Zyngier wrote:
>>> On 2020-10-26 15:57, Steven Price wrote:
>>>> diff --git a/arch/arm64/include/asm/sysreg.h
>>>> b/arch/arm64/include/asm/sysreg.h
>>>> index d52c1b3ce589..7727df0bc09d 100644
>>>> --- a/arch/arm64/include/asm/sysreg.h
>>>> +++ b/arch/arm64/include/asm/sysreg.h
>>>> @@ -565,7 +565,8 @@
>>>> ï¿½#define SCTLR_ELx_Mï¿½ï¿½ï¿½ (BIT(0))
>>>>
>>>> ï¿½#define SCTLR_ELx_FLAGSï¿½ï¿½ï¿½ (SCTLR_ELx_Mï¿½ | SCTLR_ELx_A | SCTLR_ELx_C | \
>>>> -ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB)
>>>> +ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB | \
>>>> +ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ SCTLR_ELx_ITFSB)
>>>>
>>>> ï¿½/* SCTLR_EL2 specific flags. */
>>>> ï¿½#define SCTLR_EL2_RES1ï¿½ï¿½ï¿½ ((BIT(4))ï¿½ | (BIT(5))ï¿½ | (BIT(11)) |
>>>> (BIT(16)) | \
>>>> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>>> b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>>> index 7a986030145f..a124ffa49ba3 100644
>>>> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>>> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>>> @@ -18,6 +18,11 @@
>>>> ï¿½static inline void __sysreg_save_common_state(struct
>>>> kvm_cpu_context *ctxt)
>>>> ï¿½{
>>>> ï¿½ï¿½ï¿½ï¿½ ctxt_sys_reg(ctxt, MDSCR_EL1)ï¿½ï¿½ï¿½ = read_sysreg(mdscr_el1);
>>>> +ï¿½ï¿½ï¿½ if (system_supports_mte()) {
>>>> +ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ctxt_sys_reg(ctxt, RGSR_EL1)ï¿½ï¿½ï¿½ = read_sysreg_s(SYS_RGSR_EL1);
>>>> +ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ctxt_sys_reg(ctxt, GCR_EL1)ï¿½ï¿½ï¿½ = read_sysreg_s(SYS_GCR_EL1);
>>>> +ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ctxt_sys_reg(ctxt, TFSRE0_EL1)ï¿½ï¿½ï¿½ =
>>>> read_sysreg_s(SYS_TFSRE0_EL1);
>>>
>>> As far as I can tell, HCR_EL2.ATA is still clear when running a guest.
>>> So why, do we save/restore this state yet?
>>>
>>> Also, I wonder whether we should keep these in the C code. If one day
>>> we enable MTE in the kernel, we will have to move them to the assembly
>>> part, much like we do for PAuth. And I fear that "one day" is pretty
>>> soon:
>>>
>>> https://lore.kernel.org/linux-arm-kernel/cover.1605046192.git.andreyknvl@google.com/
>>
>> Good point. Although for MTE we do have the option of setting TCO in PSTATE
>> so this could remain in C if we're not bothered about the 'gap' in KASAN
>> coverage. I haven't yet got my head around how (or indeed if) that series
>> handles guests.
> 
> I think we should be fine with the currently proposed in-kernel MTE
> support. However, setting GCR_EL1 can get in the way if stack tagging is
> ever enabled (it breaks single image). The compiler uses GCR_EL1 to
> generate different colours for variables on the stack and changing it in
> the middle of a function may cause confusion. You'd have to set
> PSTATE.TCO for the whole function, either from the caller or, if the
> compiler gets smarter, some function attribute.
> 

If the compiler might start playing with TCO then this could also be an 
issue for VMMs which will (at least with the current design) need to use 
TCO to safely access guest memory. Especially if we enforce PROT_MTE 
mappings for the VMM.

Steve

