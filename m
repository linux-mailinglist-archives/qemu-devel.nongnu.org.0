Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6286D3BDC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 04:40:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjA64-0004dl-NA; Sun, 02 Apr 2023 22:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjA62-0004d2-DN; Sun, 02 Apr 2023 22:39:02 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjA5y-00071V-Nv; Sun, 02 Apr 2023 22:39:02 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAB3kNQ3PCpk41NQGg--.43571S2;
 Mon, 03 Apr 2023 10:38:48 +0800 (CST)
Message-ID: <2260a477-b361-8697-eae0-c12da3f2968d@iscas.ac.cn>
Date: Mon, 3 Apr 2023 10:38:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND PATCH v5 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230401124935.20997-1-liweiwei@iscas.ac.cn>
 <20230401124935.20997-5-liweiwei@iscas.ac.cn>
 <15b60df7-40ca-330c-faa9-daaa78b2000d@linux.alibaba.com>
 <7e87df52-cc1d-4a85-a83b-f12b80b7f040@iscas.ac.cn>
 <e0dc20a2-1a93-6c3d-b3e1-f62c7d1d61c9@linux.alibaba.com>
 <5a8936e1-03c5-58c0-9c88-5b4bec18534c@iscas.ac.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <5a8936e1-03c5-58c0-9c88-5b4bec18534c@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3kNQ3PCpk41NQGg--.43571S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGr1xGF1rXFW5CF13XFWrXwb_yoW8Gw4ruo
 WUKr1fJr1rXr1Ygr1UJ3yUJryav3WUJrnrtryUGr9rGr10yw1UJ3y8Jry8t3y7JF18WrWU
 J3WxXF1jyFyUXr15n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYS7k0a2IF6w4xM7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0
 x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
 1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
 I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x07j04E_UUUUU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.37,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2023/4/2 21:53, liweiwei wrote:
>
> On 2023/4/2 21:17, LIU Zhiwei wrote:
>>
>> On 2023/4/2 16:17, liweiwei wrote:
>>>
>>> On 2023/4/2 08:34, LIU Zhiwei wrote:
>>>>
>>>> On 2023/4/1 20:49, Weiwei Li wrote:
>>>>> Add a base save_pc For
>>>> pc_save for
>>>>> PC-relative translation(CF_PCREL).
>>>>> Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
>>>>> Sync pc before it's used or updated from tb related pc:
>>>>>     real_pc = (old)env->pc + target_pc(from tb) - ctx->save_pc
>>>> pc_save in the code.
>>> OK. I'll fix this.
>>>>> Use gen_get_target_pc to compute target address of auipc and 
>>>>> successor
>>>>> address of jalr.
>>>>>
>>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> ---
>>>>>   target/riscv/cpu.c                      | 29 +++++++++-----
>>>>>   target/riscv/insn_trans/trans_rvi.c.inc | 14 +++++--
>>>>>   target/riscv/translate.c                | 53 
>>>>> +++++++++++++++++++++----
>>>>>   3 files changed, 75 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>>> index 1e97473af2..646fa31a59 100644
>>>>> --- a/target/riscv/cpu.c
>>>>> +++ b/target/riscv/cpu.c
>>>>> @@ -658,16 +658,18 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>>>>>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>>>>                                             const TranslationBlock 
>>>>> *tb)
>>>>>   {
>>>>> -    RISCVCPU *cpu = RISCV_CPU(cs);
>>>>> -    CPURISCVState *env = &cpu->env;
>>>>> -    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>>>> +    if (!(tb_cflags(tb) & CF_PCREL)) {
>>>>> +        RISCVCPU *cpu = RISCV_CPU(cs);
>>>>> +        CPURISCVState *env = &cpu->env;
>>>>> +        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>>>>   -    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>>>>> +        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>>>>>   -    if (xl == MXL_RV32) {
>>>>> -        env->pc = (int32_t) tb->pc;
>>>>> -    } else {
>>>>> -        env->pc = tb->pc;
>>>>> +        if (xl == MXL_RV32) {
>>>>> +            env->pc = (int32_t) tb->pc;
>>>>> +        } else {
>>>>> +            env->pc = tb->pc;
>>>>> +        }
>>>>>       }
>>>>>   }
>>>>>   @@ -693,11 +695,18 @@ static void 
>>>>> riscv_restore_state_to_opc(CPUState *cs,
>>>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>>>>       CPURISCVState *env = &cpu->env;
>>>>>       RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>>>>> +    target_ulong pc;
>>>>> +
>>>>> +    if (tb_cflags(tb) & CF_PCREL) {
>>>>> +        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
>>>>> +    } else {
>>>>> +        pc = data[0];
>>>>> +    }
>>>>>         if (xl == MXL_RV32) {
>>>>> -        env->pc = (int32_t)data[0];
>>>>> +        env->pc = (int32_t)pc;
>>>>>       } else {
>>>>> -        env->pc = data[0];
>>>>> +        env->pc = pc;
>>>>>       }
>>>>>       env->bins = data[1];
>>>>>   }
>>>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>>>>> b/target/riscv/insn_trans/trans_rvi.c.inc
>>>>> index 48c73cfcfe..52ef260eff 100644
>>>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>>>> @@ -38,7 +38,9 @@ static bool trans_lui(DisasContext *ctx, arg_lui 
>>>>> *a)
>>>>>     static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>>>>>   {
>>>>> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>>>>> +    TCGv target_pc = dest_gpr(ctx, a->rd);
>>>>> +    gen_get_target_pc(target_pc, ctx, a->imm + ctx->base.pc_next);
>>>>> +    gen_set_gpr(ctx, a->rd, target_pc);
>>>>>       return true;
>>>>>   }
>>>>>   @@ -52,6 +54,7 @@ static bool trans_jalr(DisasContext *ctx, 
>>>>> arg_jalr *a)
>>>>>   {
>>>>>       TCGLabel *misaligned = NULL;
>>>>>       TCGv target_pc = tcg_temp_new();
>>>>> +    TCGv succ_pc = dest_gpr(ctx, a->rd);
>>>>>         tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), 
>>>>> a->imm);
>>>>>       tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
>>>>> @@ -68,7 +71,9 @@ static bool trans_jalr(DisasContext *ctx, 
>>>>> arg_jalr *a)
>>>>>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>>>>>       }
>>>>>   -    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
>>>>> +    gen_get_target_pc(succ_pc, ctx, ctx->pc_succ_insn);
>>>>> +    gen_set_gpr(ctx, a->rd, succ_pc);
>>>>> +
>>>>>       tcg_gen_mov_tl(cpu_pc, target_pc);
>>>>>       lookup_and_goto_ptr(ctx);
>>>>>   @@ -159,6 +164,7 @@ static bool gen_branch(DisasContext *ctx, 
>>>>> arg_b *a, TCGCond cond)
>>>>>       TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
>>>>>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
>>>>>       target_ulong next_pc;
>>>>> +    target_ulong orig_pc_save = ctx->pc_save;
>>>>>         if (get_xl(ctx) == MXL_RV128) {
>>>>>           TCGv src1h = get_gprh(ctx, a->rs1);
>>>>> @@ -175,6 +181,7 @@ static bool gen_branch(DisasContext *ctx, 
>>>>> arg_b *a, TCGCond cond)
>>>>>         gen_set_label(l); /* branch taken */
>>>>>   +    ctx->pc_save = orig_pc_save;
>>>>>       next_pc = ctx->base.pc_next + a->imm;
>>>>>       if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
>>>>>           /* misaligned */
>>>>> @@ -182,8 +189,9 @@ static bool gen_branch(DisasContext *ctx, 
>>>>> arg_b *a, TCGCond cond)
>>>>>           gen_get_target_pc(target_pc, ctx, next_pc);
>>>>>           gen_exception_inst_addr_mis(ctx, target_pc);
>>>>>       } else {
>>>>> -        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
>>>>> +        gen_goto_tb(ctx, 0, next_pc);
>>>>>       }
>>>>> +    ctx->pc_save = -1;
>>>>>       ctx->base.is_jmp = DISAS_NORETURN;
>>>>>         return true;
>>>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>>>> index 7b5223efc2..2dd594ddae 100644
>>>>> --- a/target/riscv/translate.c
>>>>> +++ b/target/riscv/translate.c
>>>>> @@ -59,6 +59,7 @@ typedef struct DisasContext {
>>>>>       DisasContextBase base;
>>>>>       /* pc_succ_insn points to the instruction following 
>>>>> base.pc_next */
>>>>>       target_ulong pc_succ_insn;
>>>>> +    target_ulong pc_save;
>>>>>       target_ulong priv_ver;
>>>>>       RISCVMXL misa_mxl_max;
>>>>>       RISCVMXL xl;
>>>>> @@ -225,15 +226,24 @@ static void decode_save_opc(DisasContext *ctx)
>>>>>   static void gen_get_target_pc(TCGv target, DisasContext *ctx,
>>>>>                                 target_ulong dest)
>>>>>   {
>>>>> -    if (get_xl(ctx) == MXL_RV32) {
>>>>> -        dest = (int32_t)dest;
>>>>> +    assert(ctx->pc_save != -1);
>>>>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>>>>> +        tcg_gen_addi_tl(target, cpu_pc, dest - ctx->pc_save);
>>>>> +        if (get_xl(ctx) == MXL_RV32) {
>>>>> +            tcg_gen_ext32s_tl(target, target);
>>>>> +        }
>>>>> +    } else {
>>>>> +        if (get_xl(ctx) == MXL_RV32) {
>>>>> +            dest = (int32_t)dest;
>>>>> +        }
>>>>> +        tcg_gen_movi_tl(target, dest);
>>>>>       }
>>>>> -    tcg_gen_movi_tl(target, dest);
>>>>>   }
>>>>>     static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>>>>>   {
>>>>>       gen_get_target_pc(cpu_pc, ctx, dest);
>>>>> +    ctx->pc_save = dest;
>>>>
>>>> Why set pc_save here?  IMHO, pc_save is a constant.
>>>
>>> pc_save is a value which is strictly related to the value of env->pc.
>>> real_pc = (old)env->pc + target_pc(from tb) - ctx->pc_save
>>
>> In this formula, the meaning of target_pc(from tb) doesn't match with 
>> gen_get_target_pc in the code. Its meaning in the code matches the 
>> real_pc in the formula. I think we should rename the 
>> gen_get_target_pc to gen_get_real_pc.
> gen_get_target_pc()  is usually used to generate the target pc of 
> branch instruction, or successor instruction. So it's called target_pc 
> in last patch. Maybe we can change it to gen_get_real_target_pc in 
> this patch when PC-relative translation is introduced.
>>
>> We should also move the comment in patch 5 to this patch. That will 
>> help us understand what we are doing here.
> OK.
>>
>> Absolute field in DisasContext used in translation should be replaced 
>> with a relative representation. For example, ctx->base.pc_next should 
>> replace with (cpu_pc + ctx->base.pc_next - ctx->base.pc_first).
>
> Yeah. pc_next have been changed to a relative pc address after 
> PC-relative translation is introduced.
>
> However, we can remain the original logic, and transform it to the 
> real pc by the above formula before we use to affect the architecture 
> state.
>
>>
>> So the formula can be described as,
>>
>> real_pc =  env->pc + abs_dest_pc - abs_first_pc
>>
>>>
>>> So it also needs update when cpu_pc is updated.
>>
>> When cpu_pc updates (usually a jmp or branch instruction), we end the 
>> block at the same time.  Does a field in DisasContext, i.e., the 
>> ctx->pc_save still have some meaning after a block has been translated?
>
> cpu_pc may need be updated twice in original logic when instruction 
> mis exception is triggered before gen_get_target_pc() is introduced in 
> the new version of patch 3:
>
> the first time  is to get the wrong branch target address to fill into 
> badaddr,  the second time is to restore the current pc in 
> generate_exception() to get the right epc.
>
> I'm not sure whether there is other corner case currently.

Another corner case is wfi instruction, we should udpate env->pc to the 
next instruction before trigger EXCP_HLT. However, this instruction will 
not exit tb.

Regards,

Weiwei Li

>
> Regards,
>
> Weiwei Li
>
>>
>> Zhiwei
>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>>
>>>> Zhiwei
>>>>
>>>>>   }
>>>>>     static void generate_exception(DisasContext *ctx, int excp)
>>>>> @@ -287,8 +297,21 @@ static void gen_goto_tb(DisasContext *ctx, 
>>>>> int n, target_ulong dest)
>>>>>         * direct block chain benefits will be small.
>>>>>         */
>>>>>       if (translator_use_goto_tb(&ctx->base, dest) && 
>>>>> !ctx->itrigger) {
>>>>> -        tcg_gen_goto_tb(n);
>>>>> -        gen_set_pc_imm(ctx, dest);
>>>>> +        /*
>>>>> +         * For pcrel, the pc must always be up-to-date on entry to
>>>>> +         * the linked TB, so that it can use simple additions for 
>>>>> all
>>>>> +         * further adjustments.  For !pcrel, the linked TB is 
>>>>> compiled
>>>>> +         * to know its full virtual address, so we can delay the
>>>>> +         * update to pc to the unlinked path.  A long chain of links
>>>>> +         * can thus avoid many updates to the PC.
>>>>> +         */
>>>>> +        if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>>>>> +            gen_set_pc_imm(ctx, dest);
>>>>> +            tcg_gen_goto_tb(n);
>>>>> +        } else {
>>>>> +            tcg_gen_goto_tb(n);
>>>>> +            gen_set_pc_imm(ctx, dest);
>>>>> +        }
>>>>>           tcg_gen_exit_tb(ctx->base.tb, n);
>>>>>       } else {
>>>>>           gen_set_pc_imm(ctx, dest);
>>>>> @@ -555,8 +578,16 @@ static void gen_jal(DisasContext *ctx, int 
>>>>> rd, target_ulong imm)
>>>>>           }
>>>>>       }
>>>>>   -    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
>>>>> -    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use 
>>>>> this for safety */
>>>>> +    assert(ctx->pc_save != -1);
>>>>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>>>>> +        TCGv succ_pc = dest_gpr(ctx, rd);
>>>>> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - 
>>>>> ctx->pc_save);
>>>>> +        gen_set_gpr(ctx, rd, succ_pc);
>>>>> +    } else {
>>>>> +        gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
>>>>> +    }
>>>>> +
>>>>> +    gen_goto_tb(ctx, 0, next_pc); /* must use this for safety */
>>>>>       ctx->base.is_jmp = DISAS_NORETURN;
>>>>>   }
>>>>>   @@ -1150,6 +1181,7 @@ static void 
>>>>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>>>>       uint32_t tb_flags = ctx->base.tb->flags;
>>>>>   +    ctx->pc_save = ctx->base.pc_first;
>>>>>       ctx->pc_succ_insn = ctx->base.pc_first;
>>>>>       ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>>>>>       ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
>>>>> @@ -1195,8 +1227,13 @@ static void 
>>>>> riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>>>>>   static void riscv_tr_insn_start(DisasContextBase *dcbase, 
>>>>> CPUState *cpu)
>>>>>   {
>>>>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>>>> +    target_ulong pc_next = ctx->base.pc_next;
>>>>> +
>>>>> +    if (tb_cflags(dcbase->tb) & CF_PCREL) {
>>>>> +        pc_next &= ~TARGET_PAGE_MASK;
>>>>> +    }
>>>>>   -    tcg_gen_insn_start(ctx->base.pc_next, 0);
>>>>> +    tcg_gen_insn_start(pc_next, 0);
>>>>>       ctx->insn_start = tcg_last_op();
>>>>>   }
>


