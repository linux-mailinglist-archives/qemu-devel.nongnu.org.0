Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C281F329A8F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:40:38 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2SD-0001oo-Oy
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH2QG-0008O4-4M
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:38:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:55346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH2QD-0006Tv-3j
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:38:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3E33ABF4;
 Tue,  2 Mar 2021 10:38:29 +0000 (UTC)
Subject: Re: [RFC v2 04/24] target/arm: move psci.c into tcg/sysemu/
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-5-cfontana@suse.de>
 <3f51339c-27e6-ccdf-f470-5a987254df0e@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <66dd7bb1-ef42-6d36-9730-0f63408da9f8@suse.de>
Date: Tue, 2 Mar 2021 11:38:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3f51339c-27e6-ccdf-f470-5a987254df0e@linaro.org>
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 7:16 PM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index 05cebc8597..e18d475572 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -292,21 +292,15 @@ vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
>>   /* Callback function for when a watchpoint or breakpoint triggers. */
>>   void arm_debug_excp_handler(CPUState *cs);
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
> I don't see that removing this ifdef...
> 
>> @@ -10040,11 +10040,13 @@ void arm_cpu_do_interrupt(CPUState *cs)
>>                         env->exception.syndrome);
>>       }
>>   
>> +#ifndef CONFIG_USER_ONLY
>>       if (arm_is_psci_call(cpu, cs->exception_index)) {
>>           arm_handle_psci_call(cpu);
>>           qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
>>           return;
>>       }
>> +#endif /* CONFIG_USER_ONLY */
> 
> ... is an improvement on adding this one.  Just leave the static inline stub 
> alone.  At some point you move the do_interrupt pieces, and the stubs can be 
> removed completely, perhaps?
> 
> 
> r~
> 

Yes, agreed.

Thanks, C

