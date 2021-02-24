Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD43238F7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:49:14 +0100 (CET)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpr7-0007Kt-LO
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEpon-0006RG-FM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:46:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:45484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEpol-00073C-EB
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:46:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2C26AE72;
 Wed, 24 Feb 2021 08:46:45 +0000 (UTC)
Subject: Re: [PULL 38/46] cpu: move cc->transaction_failed to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <20210205225650.1330794-39-richard.henderson@linaro.org>
 <e3c017b9-9f3a-78bd-7406-41a02ca6a597@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <54652321-5183-4a50-b88c-14b4e480e62e@suse.de>
Date: Wed, 24 Feb 2021 09:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e3c017b9-9f3a-78bd-7406-41a02ca6a597@amsat.org>
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 10:43 PM, Philippe Mathieu-Daudé wrote:
> On 2/5/21 11:56 PM, Richard Henderson wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> [claudio: wrap target code around CONFIG_TCG and !CONFIG_USER_ONLY]
>>
>> avoiding its use in headers used by common_ss code (should be poisoned).
>>
>> Note: need to be careful with the use of CONFIG_USER_ONLY,
>> Message-Id: <20210204163931.7358-11-cfontana@suse.de>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/hw/core/cpu.h     | 28 +++++++++++++---------------
>>  hw/mips/jazz.c            |  9 +++++++--
>>  target/alpha/cpu.c        |  2 +-
>>  target/arm/cpu.c          |  4 ++--
>>  target/m68k/cpu.c         |  2 +-
>>  target/microblaze/cpu.c   |  2 +-
>>  target/mips/cpu.c         |  4 +++-
>>  target/riscv/cpu.c        |  2 +-
>>  target/riscv/cpu_helper.c |  2 +-
>>  target/sparc/cpu.c        |  2 +-
>>  target/xtensa/cpu.c       |  2 +-
>>  target/xtensa/helper.c    |  4 ++--
>>  12 files changed, 34 insertions(+), 29 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 60cf20bf05..41ce1daefc 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -122,6 +122,14 @@ typedef struct TcgCpuOperations {
>>      /** @debug_excp_handler: Callback for handling debug exceptions */
>>      void (*debug_excp_handler)(CPUState *cpu);
>>  
>> +    /**
>> +     * @do_transaction_failed: Callback for handling failed memory transactions
>> +     * (ie bus faults or external aborts; not MMU faults)
>> +     */
>> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>> +                                  unsigned size, MMUAccessType access_type,
>> +                                  int mmu_idx, MemTxAttrs attrs,
>> +                                  MemTxResult response, uintptr_t retaddr);
>>  } TcgCpuOperations;
>>  
>>  /**
>> @@ -133,8 +141,6 @@ typedef struct TcgCpuOperations {
>>   * @has_work: Callback for checking if there is work to do.
>>   * @do_unaligned_access: Callback for unaligned access handling, if
>>   * the target defines #TARGET_ALIGNED_ONLY.
>> - * @do_transaction_failed: Callback for handling failed memory transactions
>> - * (ie bus faults or external aborts; not MMU faults)
>>   * @virtio_is_big_endian: Callback to return %true if a CPU which supports
>>   * runtime configurable endianness is currently big-endian. Non-configurable
>>   * CPUs can use the default implementation of this method. This method should
>> @@ -203,10 +209,6 @@ struct CPUClass {
>>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>>                                  MMUAccessType access_type,
>>                                  int mmu_idx, uintptr_t retaddr);
>> -    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>> -                                  unsigned size, MMUAccessType access_type,
>> -                                  int mmu_idx, MemTxAttrs attrs,
>> -                                  MemTxResult response, uintptr_t retaddr);
>>      bool (*virtio_is_big_endian)(CPUState *cpu);
>>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>>                             uint8_t *buf, int len, bool is_write);
>> @@ -879,9 +881,6 @@ CPUState *cpu_by_arch_id(int64_t id);
>>  
>>  void cpu_interrupt(CPUState *cpu, int mask);
>>  
>> -#ifdef NEED_CPU_H
>> -
>> -#ifdef CONFIG_SOFTMMU
>>  static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>>                                          MMUAccessType access_type,
>>                                          int mmu_idx, uintptr_t retaddr)
>> @@ -900,14 +899,13 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>>  {
>>      CPUClass *cc = CPU_GET_CLASS(cpu);
>>  
>> -    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
>> -        cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
>> -                                  mmu_idx, attrs, response, retaddr);
>> +    if (!cpu->ignore_memory_transaction_failures &&
>> +        cc->tcg_ops.do_transaction_failed) {
>> +        cc->tcg_ops.do_transaction_failed(cpu, physaddr, addr, size,
>> +                                          access_type, mmu_idx, attrs,
>> +                                          response, retaddr);
>>      }
>>  }
>> -#endif
>> -
>> -#endif /* NEED_CPU_H */
>>  
>>  /**
>>   * cpu_set_pc:
>> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
>> index f9442731dd..46c71a0ac8 100644
>> --- a/hw/mips/jazz.c
>> +++ b/hw/mips/jazz.c
>> @@ -116,6 +116,8 @@ static const MemoryRegionOps dma_dummy_ops = {
>>  #define MAGNUM_BIOS_SIZE_MAX 0x7e000
>>  #define MAGNUM_BIOS_SIZE                                                       \
>>          (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
>> +
>> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>  static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr,
>>                                            vaddr addr, unsigned size,
>>                                            MMUAccessType access_type,
>> @@ -137,6 +139,7 @@ static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>>      (*real_do_transaction_failed)(cs, physaddr, addr, size, access_type,
>>                                    mmu_idx, attrs, response, retaddr);
>>  }
>> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>>  
>>  static void mips_jazz_init(MachineState *machine,
>>                             enum jazz_model_e jazz_model)
>> @@ -205,8 +208,10 @@ static void mips_jazz_init(MachineState *machine,
>>       * memory region that catches all memory accesses, as we do on Malta.
>>       */
>>      cc = CPU_GET_CLASS(cpu);
>> -    real_do_transaction_failed = cc->do_transaction_failed;
>> -    cc->do_transaction_failed = mips_jazz_do_transaction_failed;
>> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>> +    real_do_transaction_failed = cc->tcg_ops.do_transaction_failed;
>> +    cc->tcg_ops.do_transaction_failed = mips_jazz_do_transaction_failed;
>> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> 
> Why CONFIG_USER_ONLY isn't poisoned under hw/ ?
> 

As I can see, hw/ contains a wide variety of objects, which go into hw_arch, specific, softmmu or common.

There does not seem to be a common way to handle objects in hw/ .

In the case of hw/mips, it goes to hw_arch in meson.build, so it sees config target.

Other users of CONFIG_USER_ONLY in hw/ are arm semihosting:

semihosting/arm-compat-semi.c which goes to specific_ss

and hw/cpu.c, which uses CONFIG_USER_ONLY but does not see it, since it is a common_ss module.

So the uses of CONFIG_USER_ONLY in hw/cpu.c are wrong for sure, or at least until hw/cpu.c goes to common_ss.
It does not hurt because the tests are in the negative, and those sysemu-only / softmmu-only symbols are actually always visible, including for CONFIG_USER_ONLY.

Ciao,

Claudio






