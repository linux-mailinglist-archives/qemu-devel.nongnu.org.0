Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018BC2D44A0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:45:56 +0100 (CET)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0j5-0002ut-34
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0bw-0004xV-BY
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:38:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:48250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0bs-000707-KJ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:38:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4EC0AD2B;
 Wed,  9 Dec 2020 14:38:26 +0000 (UTC)
Subject: Re: [RFC v9 20/32] cpu: Move tlb_fill to tcg_ops
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-21-cfontana@suse.de> <87czzjdxsx.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ff41bd99-c5e8-c517-f7b0-5ab26a9a0e73@suse.de>
Date: Wed, 9 Dec 2020 15:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87czzjdxsx.fsf@linaro.org>
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 12:26 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> From: Eduardo Habkost <ehabkost@redhat.com>
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> [claudio: wrapped in CONFIG_TCG]
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  accel/tcg/cputlb.c              |  6 +++---
>>  accel/tcg/user-exec.c           |  6 +++---
>>  include/hw/core/cpu.h           |  9 ---------
>>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>>  target/alpha/cpu.c              |  2 +-
>>  target/arm/cpu.c                |  2 +-
>>  target/avr/cpu.c                |  2 +-
>>  target/cris/cpu.c               |  2 +-
>>  target/hppa/cpu.c               |  2 +-
>>  target/i386/tcg-cpu.c           |  2 +-
>>  target/lm32/cpu.c               |  2 +-
>>  target/m68k/cpu.c               |  2 +-
>>  target/microblaze/cpu.c         |  2 +-
>>  target/mips/cpu.c               |  2 +-
>>  target/moxie/cpu.c              |  2 +-
>>  target/nios2/cpu.c              |  2 +-
>>  target/openrisc/cpu.c           |  2 +-
>>  target/ppc/translate_init.c.inc |  2 +-
>>  target/riscv/cpu.c              |  2 +-
>>  target/rx/cpu.c                 |  2 +-
>>  target/s390x/cpu.c              |  2 +-
>>  target/sh4/cpu.c                |  2 +-
>>  target/sparc/cpu.c              |  2 +-
>>  target/tilegx/cpu.c             |  2 +-
>>  target/tricore/cpu.c            |  2 +-
>>  target/unicore32/cpu.c          |  2 +-
>>  target/xtensa/cpu.c             |  2 +-
>>  27 files changed, 41 insertions(+), 38 deletions(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 42ab79c1a5..2dc71b5528 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1286,7 +1286,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
>>       * This is not a probe, so only valid return is success; failure
>>       * should result in exception + longjmp to the cpu loop.
>>       */
>> -    ok = cc->tlb_fill(cpu, addr, size, access_type, mmu_idx, false, retaddr);
>> +    ok = cc->tcg_ops.tlb_fill(cpu, addr, size, access_type, mmu_idx, false, retaddr);
>>      assert(ok);
>>  }
>>  
>> @@ -1557,8 +1557,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>>              CPUState *cs = env_cpu(env);
>>              CPUClass *cc = CPU_GET_CLASS(cs);
>>  
>> -            if (!cc->tlb_fill(cs, addr, fault_size, access_type,
>> -                              mmu_idx, nonfault, retaddr)) {
>> +            if (!cc->tcg_ops.tlb_fill(cs, addr, fault_size, access_type,
>> +                                      mmu_idx, nonfault, retaddr)) {
>>                  /* Non-faulting page table read failed.  */
>>                  *phost = NULL;
>>                  return TLB_INVALID_MASK;
>> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
>> index 4ebe25461a..7f53992251 100644
>> --- a/accel/tcg/user-exec.c
>> +++ b/accel/tcg/user-exec.c
>> @@ -186,7 +186,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
>>      clear_helper_retaddr();
>>  
>>      cc = CPU_GET_CLASS(cpu);
>> -    cc->tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc);
>> +    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc);
>>      g_assert_not_reached();
>>  }
>>  
>> @@ -216,8 +216,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>>          } else {
>>              CPUState *cpu = env_cpu(env);
>>              CPUClass *cc = CPU_GET_CLASS(cpu);
>> -            cc->tlb_fill(cpu, addr, fault_size, access_type,
>> -                         MMU_USER_IDX, false, ra);
>> +            cc->tcg_ops.tlb_fill(cpu, addr, fault_size, access_type,
>> +                                 MMU_USER_IDX, false, ra);
>>              g_assert_not_reached();
>>          }
>>      }
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 52142e9094..c82ef261c6 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -110,12 +110,6 @@ struct TranslationBlock;
>>   *       If the target behaviour here is anything other than "set
>>   *       the PC register to the value passed in" then the target must
>>   *       also implement the synchronize_from_tb hook.
>> - * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
>> - *       address fault.  For system mode, if the access is valid, call
>> - *       tlb_set_page and return true; if the access is invalid, and
>> - *       probe is true, return false; otherwise raise an exception and
>> - *       do not return.  For user-only mode, always raise an exception
>> - *       and do not return.
>>   * @get_phys_page_debug: Callback for obtaining a physical address.
>>   * @get_phys_page_attrs_debug: Callback for obtaining a physical address and the
>>   *       associated memory transaction attributes to use for the access.
>> @@ -183,9 +177,6 @@ struct CPUClass {
>>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
>>                                 Error **errp);
>>      void (*set_pc)(CPUState *cpu, vaddr value);
>> -    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>> -                     MMUAccessType access_type, int mmu_idx,
>> -                     bool probe, uintptr_t retaddr);
>>      hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
>>      hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
>>                                          MemTxAttrs *attrs);
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index e12f32919b..2ea94acca0 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
>> @@ -37,6 +37,18 @@ typedef struct TcgCpuOperations {
>>      void (*cpu_exec_exit)(CPUState *cpu);
>>      /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
>>      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>> +    /**
>> +     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
>> +     *
>> +     * For system mode, if the access is valid, call tlb_set_page
>> +     * and return true; if the access is invalid, and probe is
>> +     * true, return false; otherwise raise an exception and do
>> +     * not return.  For user-only mode, always raise an exception
>> +     * and do not return.
>> +     */
>> +    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>> +                     MMUAccessType access_type, int mmu_idx,
>> +                     bool probe, uintptr_t retaddr);
> 
> As per previous patch, here is a chance to clean-up the comment.


Could you provide the text? I think you understand this better than I do...


> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

Thanks!

Claudio

