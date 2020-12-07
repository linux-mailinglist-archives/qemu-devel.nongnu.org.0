Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015BE2D1408
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:50:40 +0100 (CET)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHqZ-0007po-03
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1kmHoY-0006yR-PA
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:48:35 -0500
Received: from foss.arm.com ([217.140.110.172]:45430)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1kmHoQ-0008GG-AY
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:48:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 943EE1042;
 Mon,  7 Dec 2020 06:48:23 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F328B3F68F;
 Mon,  7 Dec 2020 06:48:20 -0800 (PST)
Subject: Re: [PATCH v6 1/2] arm64: kvm: Save/restore MTE registers
To: Marc Zyngier <maz@kernel.org>
References: <20201127152113.13099-1-steven.price@arm.com>
 <20201127152113.13099-2-steven.price@arm.com>
 <946b1e7b06c4d286a78cf61408e0fc8d@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <03566358-21b0-11d9-c4f6-d07d137a1009@arm.com>
Date: Mon, 7 Dec 2020 14:48:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <946b1e7b06c4d286a78cf61408e0fc8d@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
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
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/2020 17:07, Marc Zyngier wrote:
> 
>> diff --git a/arch/arm64/include/asm/sysreg.h 
>> b/arch/arm64/include/asm/sysreg.h
>> index e2ef4c2edf06..b6668ffa04d9 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -569,7 +569,8 @@
>>  #define SCTLR_ELx_M    (BIT(0))
>>
>>  #define SCTLR_ELx_FLAGS    (SCTLR_ELx_M  | SCTLR_ELx_A | SCTLR_ELx_C | \
>> -             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB)
>> +             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB | \
>> +             SCTLR_ELx_ITFSB)
>>
>>  /* SCTLR_EL2 specific flags. */
>>  #define SCTLR_EL2_RES1    ((BIT(4))  | (BIT(5))  | (BIT(11)) | 
>> (BIT(16)) | \
>> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> index cce43bfe158f..45255ba60152 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> @@ -18,6 +18,11 @@
>>  static inline void __sysreg_save_common_state(struct kvm_cpu_context 
>> *ctxt)
>>  {
>>      ctxt_sys_reg(ctxt, MDSCR_EL1)    = read_sysreg(mdscr_el1);
>> +    if (system_supports_mte()) {
> 
> Please move the per-VM predicate to this patch so that it can be used
> not to save/restore the MTE registers if we don't need to.

There isn't a valid struct kvm_vcpu or struct kvm here. I know there's 
ctx->__hyp_running_vcpu but AFAICT that is only valid with the host context.

> 
>> +        ctxt_sys_reg(ctxt, RGSR_EL1)    = read_sysreg_s(SYS_RGSR_EL1);
>> +        ctxt_sys_reg(ctxt, GCR_EL1)    = read_sysreg_s(SYS_GCR_EL1);
>> +        ctxt_sys_reg(ctxt, TFSRE0_EL1)    = 
>> read_sysreg_s(SYS_TFSRE0_EL1);
>> +    }
> 
> Overall, I still don't understand how this is going to work once
> we have MTE in the kernel. You mentioned having the ability to
> create turn off the tag checks at times, but I don't see that
> in this patch (and I'm not sure we want that either).

Given that this is now highly unlikely to be merged for v5.11, I'll 
rebase onto of the KASAN MTE series and double check exactly what 
happens. My thought was that it should be as simple as setting TCO, but 
your previous comment about moving the save/restore into assembler might 
be wise in case the compiler starts playing with TCO itself.

Steve

