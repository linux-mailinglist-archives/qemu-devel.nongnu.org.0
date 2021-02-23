Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F66322898
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:09:16 +0100 (CET)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUd1-0006uj-3e
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEUbf-0006RI-3U
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:07:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:41136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEUba-0002sQ-MD
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:07:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9140AEBE;
 Tue, 23 Feb 2021 10:07:44 +0000 (UTC)
Subject: Re: [RFC v1 24/38] target/arm: move aa64_va_parameter_tbi,tbid,tcma
 and arm_rebuild_hflags
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-25-cfontana@suse.de>
 <d7bca535-d6eb-780b-7248-d6810652c76d@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <cc67b97a-1456-c232-3bfd-91902973ce5e@suse.de>
Date: Tue, 23 Feb 2021 11:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d7bca535-d6eb-780b-7248-d6810652c76d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Alex Bennee <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 7:02 AM, Richard Henderson wrote:
> On 2/21/21 1:24 AM, Claudio Fontana wrote:
>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>
>> they are needed for KVM too, move them out of TCG helpers.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/internals.h      |  37 +++++
>>  target/arm/tcg/helper-tcg.h |  32 -----
>>  target/arm/cpu-common.c     | 252 ++++++++++++++++++++++++++++++++++
>>  target/arm/tcg/helper.c     | 264 +-----------------------------------
>>  4 files changed, 293 insertions(+), 292 deletions(-)
>>
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index 6589b63ebc..9eb5d7fd79 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -1196,6 +1196,43 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
>>      return ptr;
>>  }
>>  
>> +/*
>> + * Convert a possible stage1+2 MMU index into the appropriate
>> + * stage 1 MMU index
>> + */
>> +static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
>> +{
>> +    switch (mmu_idx) {
>> +    case ARMMMUIdx_SE10_0:
>> +        return ARMMMUIdx_Stage1_SE0;
>> +    case ARMMMUIdx_SE10_1:
>> +        return ARMMMUIdx_Stage1_SE1;
>> +    case ARMMMUIdx_SE10_1_PAN:
>> +        return ARMMMUIdx_Stage1_SE1_PAN;
>> +    case ARMMMUIdx_E10_0:
>> +        return ARMMMUIdx_Stage1_E0;
>> +    case ARMMMUIdx_E10_1:
>> +        return ARMMMUIdx_Stage1_E1;
>> +    case ARMMMUIdx_E10_1_PAN:
>> +        return ARMMMUIdx_Stage1_E1_PAN;
>> +    default:
>> +        return mmu_idx;
>> +    }
>> +}
>> +
>> +int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
>> +int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
> 
> I can see these being needed for get-phys-addr -- and that probably answers my
> arm_mmu_idx_el question earlier too.
> 
> 
>> +uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>> +                            ARMMMUIdx mmu_idx);
>> +uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx);
>> +uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx);
> 
> However these really really shouldn't be used for !tcg.  I would even wrap
> CPUARMState::hflags in #ifdef CONFIG_TCG to enforce that.
> 
> I think maybe the best option is
> 
>     if (tcg_enabled()) {
>         rebuild_hflags();
>     }
> 
> so that we don't spend the time on the rebuild for a regular build that has
> both tcg and kvm enabled, and the symbol gets
> compiled out when tcg is disabled.

is the code elimination for "if (0)" a guarantee, ie, we won't encounter compiler or compiler-options differences,
for the compilers we support?

This is a doubt that is bothering me since some time, since I remember I encountered problems like this before,
with my compiler behaving differently than Paolo's in particular.

Is there some way to force the compilers to not even look at what is in the if (0) block?
That should work also with --enable-debug?

This way we could avoid a lot of boilerplate/stubs...

Ciao,

Claudio


> 
> 
> r~
> 


