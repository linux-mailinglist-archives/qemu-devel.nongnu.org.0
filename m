Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C469F43AD87
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:51:28 +0200 (CEST)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHF1-0006vB-Rm
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mfGae-0001lK-Af
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:09:44 -0400
Received: from mail.csgraf.de ([85.25.223.15]:49088 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mfGaZ-0007Jy-NX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:09:43 -0400
Received: from [192.168.106.118]
 (dynamic-077-007-071-240.77.7.pool.telefonica.de [77.7.71.240])
 by csgraf.de (Postfix) with ESMTPSA id E0D346080126;
 Tue, 26 Oct 2021 09:09:35 +0200 (CEST)
Message-ID: <1d84fe5e-1933-8798-ff42-e752ea4e5943@csgraf.de>
Date: Tue, 26 Oct 2021 09:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] hvf: arm: Ignore cache operations on MMIO
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
References: <20211025191349.52992-1-agraf@csgraf.de>
 <f17a2693-0c1a-d41e-5218-1117d2636425@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <f17a2693-0c1a-d41e-5218-1117d2636425@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.846,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kettenis@openbsd.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26.10.21 02:14, Richard Henderson wrote:
> On 10/25/21 12:13 PM, Alexander Graf wrote:
>> +    /*
>> +     * We ran into an instruction that traps for data, but is not
>> +     * hardware predecoded. This should not ever happen for well
>> +     * behaved guests. Let's try to see if we can somehow rescue
>> +     * the situation.
>> +     */
>> +
>> +    cpu_synchronize_state(cpu);
>> +    if (cpu_memory_rw_debug(cpu, env->pc, &insn, 4, 0)) {
>
> This isn't correct, since this would be a physical address access, and 
> env->pc is virtual.


Yes, hence cpu_memory_rw_debug which accesses virtual memory:

https://git.qemu.org/?p=qemu.git;a=blob;f=softmmu/physmem.c#l3418


>
> Phil's idea of cpu_ldl_data may be correct, and cpu_ldl_code may be 
> slightly more so, because we got EC_DATAABORT not EC_INSNABORT, which 
> means that the virtual address at env->pc is mapped and executable.
>
> However, in the event that there's some sort of race condition in 
> between this data abort and hvf stopping all threads for the vm exit, 
> by which the page tables could have been modified between here and 
> there, then cpu_ldl_code *could* produce another exception.
>
> In which case the interface that gdbstub uses, cc->memory_rw_debug, 
> will be most correct.


I don't believe that one is implemented for arm, correct?


>
>
>> @@ -1156,6 +1183,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>> hvf_exit->exception.physical_address, isv,
>>                                iswrite, s1ptw, len, srt);
>>   +        if (!isv) {
>> +            g_assert(hvf_emulate_insn(cpu));
>> +            advance_pc = true;
>> +            break;
>> +        }
>>           assert(isv);
>
> Ouch.  HVF really passes along an invalid syndrome?  I was expecting 
> that you'd be able to avoid all of the instruction parsing and check 
> syndrome.cm (bit 8) for a cache management instruction.


That's a very subtle way of telling me I'm stupid :). Thanks for the 
catch! Using the CM bit is obviously way better. Let me build v2.


Alex



