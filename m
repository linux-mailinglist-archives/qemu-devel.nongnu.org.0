Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259632D5C2C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:45:45 +0100 (CET)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMGO-0007Dd-0q
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knLlz-0004BU-I3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:14:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:52116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knLlx-0008B4-IT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:14:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFF2FAB91;
 Thu, 10 Dec 2020 13:14:14 +0000 (UTC)
Subject: Re: [PATCH v10 25/32] cpu: move do_unaligned_access to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
 <20201210121226.19822-26-cfontana@suse.de>
 <a69f4101-5b0f-7ca5-d39a-7ad8b68a92bf@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <a7ce2d59-2177-e873-8a2c-40e3682923c8@suse.de>
Date: Thu, 10 Dec 2020 14:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a69f4101-5b0f-7ca5-d39a-7ad8b68a92bf@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:01 PM, Philippe Mathieu-Daudé wrote:
> On 12/10/20 1:12 PM, Claudio Fontana wrote:
>> make it consistently SOFTMMU-only.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  include/hw/core/cpu.h           | 17 +++--------------
>>  include/hw/core/tcg-cpu-ops.h   |  7 +++++++
>>  target/alpha/cpu.c              |  2 +-
>>  target/arm/cpu.c                |  2 +-
>>  target/hppa/cpu.c               |  4 +++-
>>  target/microblaze/cpu.c         |  2 +-
>>  target/mips/cpu.c               |  3 ++-
>>  target/nios2/cpu.c              |  2 +-
>>  target/riscv/cpu.c              |  2 +-
>>  target/s390x/cpu.c              |  2 +-
>>  target/sh4/cpu.c                |  2 +-
>>  target/sparc/cpu.c              |  2 +-
>>  target/xtensa/cpu.c             |  2 +-
>>  target/ppc/translate_init.c.inc |  2 +-
>>  14 files changed, 25 insertions(+), 26 deletions(-)
> ...
> 
>> -#ifdef CONFIG_SOFTMMU
>> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>>  static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>>                                          MMUAccessType access_type,
>>                                          int mmu_idx, uintptr_t retaddr)
>>  {
>>      CPUClass *cc = CPU_GET_CLASS(cpu);
>>  
>> -    cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>> +    cc->tcg_ops.do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>>  }
>> -#ifdef CONFIG_TCG
>>  static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>>                                            vaddr addr, unsigned size,
>>                                            MMUAccessType access_type,
>> @@ -858,10 +850,7 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>>                                            mmu_idx, attrs, response, retaddr);
>>      }
>>  }
>> -#endif /* CONFIG_TCG */
>> -#endif /* CONFIG_SOFTMMU */
>> -
>> -#endif /* NEED_CPU_H */
>> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>>  
>>  /**
>>   * cpu_set_pc:
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index 3cc2733410..bac0165db6 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
>> @@ -50,6 +50,13 @@ typedef struct TcgCpuOperations {
>>                                    unsigned size, MMUAccessType access_type,
>>                                    int mmu_idx, MemTxAttrs attrs,
>>                                    MemTxResult response, uintptr_t retaddr);
>> +    /**
>> +     * @do_unaligned_access: Callback for unaligned access handling, if
>> +     * the target defines #TARGET_ALIGNED_ONLY.
>> +     */
>> +    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>> +                                MMUAccessType access_type,
>> +                                int mmu_idx, uintptr_t retaddr);
> 
> Similarly to previous patch, don't we want to restrict this
> to system-mode?

In theory yes, (and what about exec_interrupt..?)
but we need to triple check the targets, because they tend to set these unconditionally.

Same concern about CONFIG_USER_ONLY vs NEED_CPU_H / CONFIG_SOFTMMU, would use CONFIG_USER_ONLY for consistency with the other targets?



> 
>>  
>>      /**
>>       * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
> 


