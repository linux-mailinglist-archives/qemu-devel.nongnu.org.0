Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2B2C6C21
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:48:42 +0100 (CET)
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijjV-0004Ui-EM
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kijhy-00042T-8X
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:47:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:60110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kijhw-0007zw-6C
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:47:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 500E0ABD7;
 Fri, 27 Nov 2020 19:47:02 +0000 (UTC)
Subject: Re: [RFC v6 07/11] i386: move TCG cpu class initialization out of
 helper.c
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-8-cfontana@suse.de>
 <20201127190424.GH2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c1d20b34-be23-bb42-9fc6-5395a390c037@suse.de>
Date: Fri, 27 Nov 2020 20:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127190424.GH2271382@habkost.net>
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
 Colin Xu <colin.xu@intel.com>, gengdongjiu@huawei.com,
 Olaf Hering <ohering@suse.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Bruce Rogers <brogers@suse.com>, "Emilio G . Cota" <cota@braap.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alex Bennee <alex.bennee@linaro.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

On 11/27/20 8:04 PM, Eduardo Habkost wrote:
> Now that I understand what you are doing here, I have specific
> questions about the functions you are moving, below:
> 
> On Thu, Nov 26, 2020 at 11:32:14PM +0100, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> [...]
>> @@ -1495,7 +1497,8 @@ static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
>>             cpu->env.features[FEAT_XSAVE_COMP_LO];
>>  }
>>  
>> -const char *get_register_name_32(unsigned int reg)
>> +/* Return name of 32-bit register, from a R_* constant */
>> +static const char *get_register_name_32(unsigned int reg)
>>  {
>>      if (reg >= CPU_NB_REGS32) {
>>          return NULL;
>> @@ -7012,13 +7015,6 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
>>      cpu->env.eip = value;
>>  }
>>  
>> -static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
>> -{
>> -    X86CPU *cpu = X86_CPU(cs);
>> -
>> -    cpu->env.eip = tb->pc - tb->cs_base;
>> -}
> 
> Question to be answered in the commit message: how can somebody
> be sure this code is not necessary for any other accelerators?
> The TranslationBlock* argument is a hint, but not a guarantee.


easiest is to just trace the calls, but there is a also helpful description of all these methods in hw/core/cpu.h.

$ mkid --include="C"
$ gid synchronize_from_tb

include/hw/core/cpu.h:110: *       also implement the synchronize_from_tb hook.
include/hw/core/cpu.h:111: * @synchronize_from_tb: Callback for synchronizing state from a TCG
include/hw/core/cpu.h:194:    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
accel/tcg/cpu-exec.c:195:        if (cc->synchronize_from_tb) {
accel/tcg/cpu-exec.c:196:            cc->synchronize_from_tb(cpu, last_tb);
target/arm/cpu.c:2245:    cc->synchronize_from_tb = arm_cpu_synchronize_from_tb;
target/avr/cpu.c:210:    cc->synchronize_from_tb = avr_cpu_synchronize_from_tb;
target/hppa/cpu.c:146:    cc->synchronize_from_tb = hppa_cpu_synchronize_from_tb;
target/microblaze/cpu.c:325:    cc->synchronize_from_tb = mb_cpu_synchronize_from_tb;
target/mips/cpu.c:241:    cc->synchronize_from_tb = mips_cpu_synchronize_from_tb;
target/riscv/cpu.c:546:    cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
target/rx/cpu.c:192:    cc->synchronize_from_tb = rx_cpu_synchronize_from_tb;
target/sh4/cpu.c:225:    cc->synchronize_from_tb = superh_cpu_synchronize_from_tb;
target/sparc/cpu.c:871:    cc->synchronize_from_tb = sparc_cpu_synchronize_from_tb;
target/tricore/cpu.c:165:    cc->synchronize_from_tb = tricore_cpu_synchronize_from_tb;
target/i386/tcg/cpu.c:129:    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;

> Maybe we should rename CPUClass.synchronize_from_tb to
> CPUClass.tcg_synchronize_from_tb?  Maybe we should have a

possibly, yes.

> separate TCGCpuOperations struct to carry TCG-specific methods?


interesting, will think about it.

> 
> (The same questions above apply to the other methods below)
> 
> 
>> -
>>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
>>  {
>>      X86CPU *cpu = X86_CPU(cs);
>> @@ -7252,17 +7248,18 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>      cc->class_by_name = x86_cpu_class_by_name;
>>      cc->parse_features = x86_cpu_parse_featurestr;
>>      cc->has_work = x86_cpu_has_work;
>> +
>>  #ifdef CONFIG_TCG
>> -    cc->do_interrupt = x86_cpu_do_interrupt;
>> -    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
> 
> These two are in seg_helper.c, so I agree it makes sense to keep
> it in tcg_cpu_common_class_init().
> 
> I'd like to understand why they are TCG-specific, though.  Are
> CPUClass.do_interrupt and CPUClass.cpu_exec_enter TCG-specific on
> all architectures, or only in x86?

cpu_exec_enter: yes, tcg only on all archs.

Traces as above, it is only called by

accel/tcg/cpu-exec.c

cc->do_interrupt() is very interesting, it _should_ be the same story,
the use of cc->do_interrupt() is normally relegated to accel/tcg/cpu-exec.c,
or to the various implementations of cpu_exec_interrupt (also tcg-specific).

_BUT_ there is an exception in arm64 where it seems to be (strangely) used for kvm64:

So in this case the arm kvm64 code is the outlier. There are two calls, one introduced in 2015 and one in 2020:

commit e24fd076a59604c4ba3c05fe9d19ea6fc5320a12
Author: Dongjiu Geng <gengdongjiu@huawei.com>
Date:   Tue May 12 11:06:08 2020 +0800

    target-arm: kvm64: handle SIGBUS signal from kernel or KVM


commit 34c45d53026d9c135415d034a8bc30c1a30acf1c
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Thu Dec 17 13:37:15 2015 +0000

    target-arm: kvm - re-inject guest debug exceptions


Maybe Alex and Dongjiu Geng (or maybe Peter?) can shed some light on whether this is intentional, or an oversight?

It is the one and only use of cc->do_interrupt outside of TCG. So strange.


> 
>> -#endif
>> +    tcg_cpu_common_class_init(cc);
>> +#endif /* CONFIG_TCG */
>> +
>>      cc->dump_state = x86_cpu_dump_state;
>>      cc->set_pc = x86_cpu_set_pc;
>> -    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
>>      cc->gdb_read_register = x86_cpu_gdb_read_register;
>>      cc->gdb_write_register = x86_cpu_gdb_write_register;
>>      cc->get_arch_id = x86_cpu_get_arch_id;
>>      cc->get_paging_enabled = x86_cpu_get_paging_enabled;
>> +
>>  #ifndef CONFIG_USER_ONLY
>>      cc->asidx_from_attrs = x86_asidx_from_attrs;
>>      cc->get_memory_mapping = x86_cpu_get_memory_mapping;
>> @@ -7273,7 +7270,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>      cc->write_elf32_note = x86_cpu_write_elf32_note;
>>      cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
>>      cc->vmsd = &vmstate_x86_cpu;
>> -#endif
>> +#endif /* !CONFIG_USER_ONLY */
>> +
>>      cc->gdb_arch_name = x86_gdb_arch_name;
>>  #ifdef TARGET_X86_64
>>      cc->gdb_core_xml_file = "i386-64bit.xml";
>> @@ -7281,15 +7279,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>  #else
>>      cc->gdb_core_xml_file = "i386-32bit.xml";
>>      cc->gdb_num_core_regs = 50;
>> -#endif
>> -#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>> -    cc->debug_excp_handler = breakpoint_handler;
> 
> That's in bpt_helper.c, also TCG-specific.  Makes sense to move
> it to tcg_cpu_common_class_init().
> 
> Is CPUClass.debug_excp_handler() TCG-specific in all
> architectures, or only in x86?
> 
>> -#endif
>> -    cc->cpu_exec_enter = x86_cpu_exec_enter;
>> -    cc->cpu_exec_exit = x86_cpu_exec_exit;
> 
> I have a question about those two functions below[1].
> 
>> -#ifdef CONFIG_TCG
>> -    cc->tcg_initialize = tcg_x86_init;
> 
> The name makes this is obviously TCG-specific, so it makes sense
> to move it to tcg_cpu_common_class_init().
> 
>> -    cc->tlb_fill = x86_cpu_tlb_fill;
> 
> This is in excp_helper.c (TCG-specific), so it makes sense to
> move it to tcg_cpu_common_class_init().
> 
> Is CPUClass.tlb_fill TCG-specific in all architectures, or only
> in x86?


TCG-specific on all, real CPU has its own real TLB.

Only accel/tcg/ uses the code.

> 
>>  #endif
>>      cc->disas_set_info = x86_disas_set_info;
>>  
> [...]
>> -/* Frob eflags into and out of the CPU temporary format.  */
>> -
>> -void x86_cpu_exec_enter(CPUState *cs)
>> -{
>> -    X86CPU *cpu = X86_CPU(cs);
>> -    CPUX86State *env = &cpu->env;
>> -
>> -    CC_SRC = env->eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
>> -    env->df = 1 - (2 * ((env->eflags >> 10) & 1));
>> -    CC_OP = CC_OP_EFLAGS;
>> -    env->eflags &= ~(DF_MASK | CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
>> -}
>> -
>> -void x86_cpu_exec_exit(CPUState *cs)
>> -{
>> -    X86CPU *cpu = X86_CPU(cs);
>> -    CPUX86State *env = &cpu->env;
>> -
>> -    env->eflags = cpu_compute_eflags(env);
>> -}
> 
> [1]
> 
> How exactly can we be 100% sure this is not used by other
> accelerators?


The only calls to these methods are from accel/tcg/cpu-exec.c .



> 
>> -
>>  #ifndef CONFIG_USER_ONLY
>>  uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
>>  {
> [...]
> 

I think that this exercise has been useful, and btw I am really interested about the possible comments from Alex or Geng DongJiu
on the extraordinary use of cc->do_interrupt for kvm64 on AArch64,

Thanks,

Ciao,

Claudio

