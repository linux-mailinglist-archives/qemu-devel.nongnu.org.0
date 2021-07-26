Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F403C3D56BB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:41:38 +0200 (CEST)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7x7C-000222-1P
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7x5L-0000NO-K3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:39:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45922 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7x5I-0004JC-8g
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:39:43 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxwOLUgv5gQQMkAA--.56698S3; 
 Mon, 26 Jul 2021 17:39:34 +0800 (CST)
Subject: Re: [PATCH v2 06/22] target/loongarch: Add main translation routines
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-7-git-send-email-gaosong@loongson.cn>
 <f4780c1c-b6a8-c265-01ff-2825cfc9a9b0@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <ee0c91d5-0b47-bd79-22e4-68560d2dcf0e@loongson.cn>
Date: Mon, 26 Jul 2021 17:39:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f4780c1c-b6a8-c265-01ff-2825cfc9a9b0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxwOLUgv5gQQMkAA--.56698S3
X-Coremail-Antispam: 1UD129KBjvAXoWfJrWrCFyfur4xJF4furyxAFb_yoW8Jw1kZo
 WUKr18Jr15Jr1UWr1UJr1UJr13JF1UJrnrJr1UGry7Jr1UAryUJ3yUJryUt3yUJr18GryU
 JF1UJryUtFyUJr15n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYt7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAF
 z4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
 8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
 x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 GVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
 62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6c
 x26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.091,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

On 07/23/2021 07:50 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +/* General purpose registers moves. */
>> +void gen_load_gpr(TCGv t, int reg)
>> +{
>> +    if (reg == 0) {
>> +        tcg_gen_movi_tl(t, 0);
>> +    } else {
>> +        tcg_gen_mov_tl(t, cpu_gpr[reg]);
>> +    }
>> +}
> 
> Please have a look at
> 
> https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org/
> 
> for a better way to handle the zero register.
> > 

OK, I'll look at it carefully.

>> +static inline void save_cpu_state(DisasContext *ctx, int do_save_pc)
>> +{
>> +    if (do_save_pc && ctx->base.pc_next != ctx->saved_pc) {
>> +        gen_save_pc(ctx->base.pc_next);
>> +        ctx->saved_pc = ctx->base.pc_next;
>> +    }
>> +    if (ctx->hflags != ctx->saved_hflags) {
>> +        tcg_gen_movi_i32(hflags, ctx->hflags);
>> +        ctx->saved_hflags = ctx->hflags;
>> +        switch (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
>> +        case LOONGARCH_HFLAG_BR:
>> +            break;
>> +        case LOONGARCH_HFLAG_BC:
>> +        case LOONGARCH_HFLAG_B:
>> +            tcg_gen_movi_tl(btarget, ctx->btarget);
>> +            break;
>> +        }
>> +    }
>> +}
> 
> Drop all the hflags handling.
> It's all copied from mips delay slot handling.
> 

OK.

>> +
>> +static inline void restore_cpu_state(CPULoongArchState *env, DisasContext *ctx)
>> +{
>> +    ctx->saved_hflags = ctx->hflags;
>> +    switch (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
>> +    case LOONGARCH_HFLAG_BR:
>> +        break;
>> +    case LOONGARCH_HFLAG_BC:
>> +    case LOONGARCH_HFLAG_B:
>> +        ctx->btarget = env->btarget;
>> +        break;
>> +    }
>> +}
> 
> Likewise.
> 
>> +static void gen_load_fpr32h(TCGv_i32 t, int reg)
>> +{
>> +    tcg_gen_extrh_i64_i32(t, fpu_f64[reg]);
>> +}
>> +
>> +static void gen_store_fpr32h(TCGv_i32 t, int reg)
>> +{
>> +    TCGv_i64 t64 = tcg_temp_new_i64();
>> +    tcg_gen_extu_i32_i64(t64, t);
>> +    tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 32, 32);
>> +    tcg_temp_free_i64(t64);
>> +}
> 
> There is no general-purpose high-part fpr stuff.  There's only movgr2frh and movfrh2gr, and you can simplify both if you drop the transition through TCGv_i32.
> 
OK.

>> +void gen_op_addr_add(TCGv ret, TCGv arg0, TCGv arg1)
>> +{
>> +    tcg_gen_add_tl(ret, arg0, arg1);
>> +}
> 
> No point in this, since loongarch has no 32-bit address mode.
> 
OK.

>> +void gen_base_offset_addr(TCGv addr, int base, int offset)
>> +{
>> +    if (base == 0) {
>> +        tcg_gen_movi_tl(addr, offset);
>> +    } else if (offset == 0) {
>> +        gen_load_gpr(addr, base);
>> +    } else {
>> +        tcg_gen_movi_tl(addr, offset);
>> +        gen_op_addr_add(addr, cpu_gpr[base], addr);
>> +    }
>> +}
> 
> Using the interfaces I quote above from my riscv cleanup,
> this can be tidied to
> 
>     tcg_gen_addi_tl(addr, gpr_src(base), offset);
> 

'riscv cleanup' series at https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org/ , Right?


>> +static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>> +{
>> +    return true;
>> +}
> 
> You must now use translate_use_goto_tb, which will not always return true.  You will see assertion failures otherwise.
> 

I see the patch already.

>> +static inline void clear_branch_hflags(DisasContext *ctx)
>> +{
>> +    ctx->hflags &= ~LOONGARCH_HFLAG_BMASK;
>> +    if (ctx->base.is_jmp == DISAS_NEXT) {
>> +        save_cpu_state(ctx, 0);
>> +    } else {
>> +        /*
>> +         * It is not safe to save ctx->hflags as hflags may be changed
>> +         * in execution time.
>> +         */
>> +        tcg_gen_andi_i32(hflags, hflags, ~LOONGARCH_HFLAG_BMASK);
>> +    }
>> +}
> 
> Not required.
> 
>> +static void gen_branch(DisasContext *ctx, int insn_bytes)
>> +{
>> +    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
>> +        int proc_hflags = ctx->hflags & LOONGARCH_HFLAG_BMASK;
>> +        /* Branches completion */
>> +        clear_branch_hflags(ctx);
>> +        ctx->base.is_jmp = DISAS_NORETURN;
>> +        switch (proc_hflags & LOONGARCH_HFLAG_BMASK) {
>> +        case LOONGARCH_HFLAG_B:
>> +            /* unconditional branch */
>> +            gen_goto_tb(ctx, 0, ctx->btarget);
>> +            break;
>> +        case LOONGARCH_HFLAG_BC:
>> +            /* Conditional branch */
>> +            {
>> +                TCGLabel *l1 = gen_new_label();
>> +
>> +                tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
>> +                gen_goto_tb(ctx, 1, ctx->base.pc_next + insn_bytes);
>> +                gen_set_label(l1);
>> +                gen_goto_tb(ctx, 0, ctx->btarget);
>> +            }
>> +            break;
>> +        case LOONGARCH_HFLAG_BR:
>> +            /* unconditional branch to register */
>> +            tcg_gen_mov_tl(cpu_PC, btarget);
>> +            tcg_gen_lookup_and_goto_ptr();
>> +            break;
>> +        default:
>> +            fprintf(stderr, "unknown branch 0x%x\n", proc_hflags);
>> +            abort();
>> +        }
>> +    }
>> +}
> 
> Split this up into the various trans_* branch routines, without the setting of HFLAG.
> 
>> +static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
>> +                                            CPUState *cs)
>> +{
>> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
>> +    CPULoongArchState *env = cs->env_ptr;
>> +
>> +    ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
>> +    ctx->saved_pc = -1;
>> +    ctx->btarget = 0;
>> +    /* Restore state from the tb context.  */
>> +    ctx->hflags = (uint32_t)ctx->base.tb->flags;
>> +    restore_cpu_state(env, ctx);
>> +    ctx->mem_idx = LOONGARCH_HFLAG_UM;
> 
> This is not an mmu index.  You didn't notice the error because you're only doing user-mode.
> 
> You're missing a check for page crossing.
> Generally, for fixed-width ISAs like this, we do
> 
>     /* Bound the number of insns to execute to those left on the page.  */
>     int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
>     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
> 
> here in init_disas_context.
> 
>> +static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>> +{
>> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
>> +
>> +    tcg_gen_insn_start(ctx->base.pc_next, ctx->hflags & LOONGARCH_HFLAG_BMASK,
>> +                       ctx->btarget);
> 
> No hflags/btarget stuff.  Drop TARGET_INSN_START_EXTRA_WORDS.
> 
>> +static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
>> +                                          CPUState *cs,
>> +                                          const CPUBreakpoint *bp)
>> +{
>> +    return true;
>> +}
> 
> Broken, but now handled generically, so remove it.
> 
> 
OK.

>> +static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>> +{
>> +    CPULoongArchState *env = cs->env_ptr;
>> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
>> +    int insn_bytes = 4;
>> +
>> +    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
>> +
>> +    if (!decode(ctx, ctx->opcode)) {
>> +        fprintf(stderr, "Error: unkown opcode. 0x%lx: 0x%x\n",
>> +                ctx->base.pc_next, ctx->opcode);
> 
> No fprintfs.  Use qemu_log_mask with LOG_UNIMP or LOG_GUEST_ERROR.
> 
OK.
>> +    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
>> +        gen_branch(ctx, insn_bytes);
>> +    }
> 
> Drop this, as I mentioned above.
> 
OK.

>> +static void fpu_dump_state(CPULoongArchState *env, FILE * f, int flags)
>> +{
>> +    int i;
>> +    int is_fpu64 = 1;
>> +
>> +#define printfpr(fp)                                              \
>> +    do {                                                          \
>> +        if (is_fpu64)                                             \
>> +            qemu_fprintf(f, "w:%08x d:%016" PRIx64                \
>> +                        " fd:%13g fs:%13g psu: %13g\n",           \
>> +                        (fp)->w[FP_ENDIAN_IDX], (fp)->d,          \
>> +                        (double)(fp)->fd,                         \
>> +                        (double)(fp)->fs[FP_ENDIAN_IDX],          \
>> +                        (double)(fp)->fs[!FP_ENDIAN_IDX]);        \
>> +        else {                                                    \
>> +            fpr_t tmp;                                            \
>> +            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];        \
>> +            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX]; \
>> +            qemu_fprintf(f, "w:%08x d:%016" PRIx64                \
>> +                        " fd:%13g fs:%13g psu:%13g\n",            \
>> +                        tmp.w[FP_ENDIAN_IDX], tmp.d,              \
>> +                        (double)tmp.fd,                           \
>> +                        (double)tmp.fs[FP_ENDIAN_IDX],            \
>> +                        (double)tmp.fs[!FP_ENDIAN_IDX]);          \
>> +        }                                                         \
>> +    } while (0)
> 
> This is broken.  You're performing an integer to fp conversion of something that is already a floating-point value, not printing the floating-point value itself.  It's broken in the mips code as well.
> 
> In addition, is_fpu64 is pointless for loongarch.
> 
Yes.
>> +void loongarch_tcg_init(void)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < 32; i++)
>> +        cpu_gpr[i] = tcg_global_mem_new(cpu_env,
>> +                                        offsetof(CPULoongArchState,
>> +                                                 active_tc.gpr[i]),
>> +                                        regnames[i]);
> 
> Missing braces.
> Do not create a temp for the zero register.
> 
>> +    bcond = tcg_global_mem_new(cpu_env,
>> +                               offsetof(CPULoongArchState, bcond), "bcond");
>> +    btarget = tcg_global_mem_new(cpu_env,
>> +                                 offsetof(CPULoongArchState, btarget),
>> +                                 "btarget");
>> +    hflags = tcg_global_mem_new_i32(cpu_env,
>> +                                    offsetof(CPULoongArchState, hflags),
>> +                                    "hflags");
> 
> Drop these.
OK.

Thanks for you kindly help.

Thanks
Song Gao.


