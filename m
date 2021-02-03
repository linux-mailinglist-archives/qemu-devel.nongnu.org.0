Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22B30DD19
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:43:02 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JMz-0000PO-N4
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7JLE-0007WA-Sg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:41:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:36114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7JLC-0007o7-Bg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:41:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65729ACB0;
 Wed,  3 Feb 2021 14:41:08 +0000 (UTC)
Subject: Re: [PATCH v15 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-16-cfontana@suse.de> <87im79s05m.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <df44fbe2-476b-f26d-0117-15dfa153e343@suse.de>
Date: Wed, 3 Feb 2021 15:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87im79s05m.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.178,
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 2:23 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> we cannot in principle make the TCG Operations field definitions
>> conditional on CONFIG_TCG in code that is included by both common_ss
>> and specific_ss modules.
>>
>> Therefore, what we can do safely to restrict the TCG fields to TCG-only
>> builds, is to move all tcg cpu operations into a separate header file,
>> which is only included by TCG, target-specific code.
>>
>> This leaves just a NULL pointer in the cpu.h for the non-TCG builds.
>>
>> This also tidies up the code in all targets a bit, having all TCG cpu
>> operations neatly contained by a dedicated data struct.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> <snip>
>>  
>> -/**
>> - * struct TcgCpuOperations: TCG operations specific to a CPU class
>> - */
>> -typedef struct TcgCpuOperations {
>> -    /**
>> -     * @initialize: Initalize TCG state
>> -     *
>> -     * Called when the first CPU is realized.
>> -     */
>> -    void (*initialize)(void);
>> -    /**
>> -     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
>> -     *
>> -     * This is called when we abandon execution of a TB before
>> -     * starting it, and must set all parts of the CPU state which
>> -     * the previous TB in the chain may not have updated. This
>> -     * will need to do more. If this hook is not implemented then
>> -     * the default is to call @set_pc(tb->pc).
>> -     */
>> -    void (*synchronize_from_tb)(CPUState *cpu,
>> -                                const struct TranslationBlock *tb);
>> -    /** @cpu_exec_enter: Callback for cpu_exec preparation */
>> -    void (*cpu_exec_enter)(CPUState *cpu);
>> -    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
>> -    void (*cpu_exec_exit)(CPUState *cpu);
>> -    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
>> -    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>> -    /** @do_interrupt: Callback for interrupt handling. */
>> -    void (*do_interrupt)(CPUState *cpu);
>> -    /**
>> -     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
>> -     *
>> -     * For system mode, if the access is valid, call tlb_set_page
>> -     * and return true; if the access is invalid, and probe is
>> -     * true, return false; otherwise raise an exception and do
>> -     * not return.  For user-only mode, always raise an exception
>> -     * and do not return.
>> -     */
>> -    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>> -                     MMUAccessType access_type, int mmu_idx,
>> -                     bool probe, uintptr_t retaddr);
>> -    /** @debug_excp_handler: Callback for handling debug exceptions */
>> -    void (*debug_excp_handler)(CPUState *cpu);
>> +/* see accel-cpu.h */
>> +struct AccelCPUClass;
> 
> This seems unrelated - wasn't AccelCPUClass already introduced. Or is
> this just catch up documentation.

Yep something to check, seems unnecessary.

> 
>>  
>> -    /**
>> -     * @do_transaction_failed: Callback for handling failed memory transactions
>> -     * (ie bus faults or external aborts; not MMU faults)
>> -     */
>> -    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>> -                                  unsigned size, MMUAccessType access_type,
>> -                                  int mmu_idx, MemTxAttrs attrs,
>> -                                  MemTxResult response, uintptr_t retaddr);
>> -    /**
>> -     * @do_unaligned_access: Callback for unaligned access handling
>> -     */
>> -    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>> -                                MMUAccessType access_type,
>> -                                int mmu_idx, uintptr_t retaddr);
>> -    /**
>> -     * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
>> -     */
>> -    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
>> -
>> -    /**
>> -     * @debug_check_watchpoint: return true if the architectural
>> -     * watchpoint whose address has matched should really fire, used by ARM
>> -     */
>> -    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
>> -
>> -} TcgCpuOperations;
>> +/* see tcg-cpu-ops.h */
>> +struct TCGCPUOps;
>>  
>>  /**
>>   * CPUClass:
>> @@ -256,7 +191,14 @@ struct CPUClass {
>>      int gdb_num_core_regs;
>>      bool gdb_stop_before_watchpoint;
>>  
>> -    TcgCpuOperations tcg_ops;
>> +    /*
>> +     * NB: this should be wrapped by CONFIG_TCG, but it is unsafe to do it here,
>> +     * as this header is included by both ss_specific and ss_common code,
>> +     * leading to potential differences in the data structure between modules.
>> +     * We could always keep it last, but it seems safer to just leave this
>> +     * pointer NULL for non-TCG.
>> +     */
>> +    struct TCGCPUOps *tcg_ops;
> 
> I suspect the editorial comment is better suited to the commit log
> rather than the comments. Maybe a simpler:
> 
>   As this header is included by both ss_specific and ss_common code we
>   cannot totally eliminate this field for non CONFIG_TCG builds although
>   the pointer will be NULL.
> 
> and move the justification to the commit comment.

Ok, I'd still keep also a comment with the code, as it's read more than commit logs, at the minimum a: "this is NULL when TCG code is not available".

> 
> <snip>
>>  
>> +#ifdef CONFIG_TCG
>> +/*
>> + * NB: cannot be const, as some elements are changed for specific
>> + * arm cpu classes.
>> + */
> 
> This comment seems wrong. I don't see arm_tcg_ops being changed after
> the fact. We have a separate arm_v7m_tcg_ops which we use instead.
> Indeed the following seemed to work:


You are right, the comment is obsolete.

This is a leftover comment from when I thought that there was no way to remove the last place where the tcg ops where changed in arm,
which was the part I removed here:

@@ -805,10 +808,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
 
-#ifdef CONFIG_TCG
-    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
-#endif /* CONFIG_TCG */
-


I then figured out that this code was completely unnecessary.


> 
> --8<---------------cut here---------------start------------->8---
> modified   include/hw/core/cpu.h
> @@ -199,7 +199,7 @@ struct CPUClass {
>       * We could always keep it last, but it seems safer to just leave this
>       * pointer NULL for non-TCG.
>       */
> -    struct TCGCPUOps *tcg_ops;
> +    const struct TCGCPUOps *tcg_ops;


Yes, I really wanted to do this.
Mips is the only blocker left that I can remember.


>  };
>  
>  /*
> modified   target/arm/cpu.c
> @@ -2248,7 +2248,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
>   * NB: cannot be const, as some elements are changed for specific
>   * arm cpu classes.
>   */
> -static struct TCGCPUOps arm_tcg_ops = {
> +static const struct TCGCPUOps arm_tcg_ops = {
>      .initialize = arm_translate_init,
>      .synchronize_from_tb = arm_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt = arm_cpu_exec_interrupt,
> --8<---------------cut here---------------end--------------->8---
> 
> This does later break MIPS jazz:
> 
> p/hw_mips_jazz.c.o -c ../../hw/mips/jazz.c
> ../../hw/mips/jazz.c: In function ‘mips_jazz_init’:
> ../../hw/mips/jazz.c:216:40: error: assignment of member ‘do_transaction_failed’ in read-only object
>      cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
> 
> which...
> 
> <snip>
>>  
>> +#ifdef CONFIG_TCG
>> +#include "hw/core/tcg-cpu-ops.h"
>> +/*
>> + * NB: cannot be const, as some elements are changed for specific
>> + * mips hardware (see hw/mips/jazz.c).
>> + */
> 
> does have a valid comment. So guess keep it as static and just don't
> claim ARM hacks around with it or find a more elegant solution for the
> Jazz hack (I'm not sure there is one).

Yep, the ARM claim was true when I started looking at this, but now it's not anymore after the changes.

However, I haven't found a way to remove the mips jazz hack.

Maybe Philippe knows?


> 
> <snip>
> 
> These minor trivialities aside:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

Thanks Alex,

Claudio

