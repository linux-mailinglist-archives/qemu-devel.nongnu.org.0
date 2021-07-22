Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAEE3D3094
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 01:51:59 +0200 (CEST)
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6iTt-0005OM-Sm
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 19:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6iSl-0004hS-RU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 19:50:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6iSj-0005hD-Hm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 19:50:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id my10so8323357pjb.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 16:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oT42hVnlzZAIdTRORXvIEoLOhoXiMpixYT1u7GNVLW8=;
 b=PMFb0VSNscx5sUqoV/uzU9MWImGN20YCATCZyGwxV0wdyLL25Ji7LmZ/ti8BwPwQHJ
 dwQVfhNcu1fLUvXeE4j2rK2pei1ryvnvKTJKhOG0jG5nzY0/aruANjB92QEI/pzt81Dg
 CvHbV46/n1E00Hm7aebNUhza8FF2QAjmBVD7NASBi/icRQ1d6mdoe9NCn3O52LcdQaX9
 39mYA/SqcHd0k98JPFsF+DrGKTg58o+aFur5ny+aJldf2P/jIRIFjPZcJCwsXlpI2+TN
 NflkI10fjwFk2yKvJsVb67I+LbOAkFAdS7LTBL7tjkj3TFEWhCWajGV/2VPATNI8AGLX
 bMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oT42hVnlzZAIdTRORXvIEoLOhoXiMpixYT1u7GNVLW8=;
 b=jxNe+ivd3fc6HE0uFi3z9Y+vXAIBbthMu+FKbSeqZjQxjv15d1ocGVbicNljpQoclz
 xQbQ6Tg5f5/DrZBZAYXbhPEmaxYkuNZ6wBR86rejrzGSbz3jP3zSt0uzU5W9tsw3SIip
 c9kKImG9DjkQjUirnyguq2Euaofo+3Sh9DX4B8FdqXl08TXN8fSHi/MVfmOWaVMI/Qz4
 EVBANHwhflU1bLR3GDulOFISb7Y79f09UdAB+KSBgYamAmpSlOgMNUB0zIKf67SpDn1B
 bITwgFCQODVYUMm1XL6zcJFCXyCCQAQj/ncJ4HHLPQ24KqCTbveKxEJMbtaVI93xfZJm
 URcQ==
X-Gm-Message-State: AOAM532bwH0v4Up79NCWYzaM59M7xfx4/q9dxERNht7pM+stT6f7u+5s
 pbJaajGFCWMChGj+/kanzHG3kw==
X-Google-Smtp-Source: ABdhPJxa5/Rld9mIpeCEa+hDHipIgb1/Y1pWLqzYqIylyIWdBxB/vB2g10dg7cFCPgIvuTqaWoomLg==
X-Received: by 2002:a62:61c3:0:b029:35b:cb61:d2c3 with SMTP id
 v186-20020a6261c30000b029035bcb61d2c3mr2105660pfb.62.1626997843282; 
 Thu, 22 Jul 2021 16:50:43 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id c2sm34992037pgh.82.2021.07.22.16.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 16:50:42 -0700 (PDT)
Subject: Re: [PATCH v2 06/22] target/loongarch: Add main translation routines
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-7-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4780c1c-b6a8-c265-01ff-2825cfc9a9b0@linaro.org>
Date: Thu, 22 Jul 2021 13:50:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-7-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/20/21 11:53 PM, Song Gao wrote:
> +/* General purpose registers moves. */
> +void gen_load_gpr(TCGv t, int reg)
> +{
> +    if (reg == 0) {
> +        tcg_gen_movi_tl(t, 0);
> +    } else {
> +        tcg_gen_mov_tl(t, cpu_gpr[reg]);
> +    }
> +}

Please have a look at

https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org/

for a better way to handle the zero register.


> +static inline void save_cpu_state(DisasContext *ctx, int do_save_pc)
> +{
> +    if (do_save_pc && ctx->base.pc_next != ctx->saved_pc) {
> +        gen_save_pc(ctx->base.pc_next);
> +        ctx->saved_pc = ctx->base.pc_next;
> +    }
> +    if (ctx->hflags != ctx->saved_hflags) {
> +        tcg_gen_movi_i32(hflags, ctx->hflags);
> +        ctx->saved_hflags = ctx->hflags;
> +        switch (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
> +        case LOONGARCH_HFLAG_BR:
> +            break;
> +        case LOONGARCH_HFLAG_BC:
> +        case LOONGARCH_HFLAG_B:
> +            tcg_gen_movi_tl(btarget, ctx->btarget);
> +            break;
> +        }
> +    }
> +}

Drop all the hflags handling.
It's all copied from mips delay slot handling.

> +
> +static inline void restore_cpu_state(CPULoongArchState *env, DisasContext *ctx)
> +{
> +    ctx->saved_hflags = ctx->hflags;
> +    switch (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
> +    case LOONGARCH_HFLAG_BR:
> +        break;
> +    case LOONGARCH_HFLAG_BC:
> +    case LOONGARCH_HFLAG_B:
> +        ctx->btarget = env->btarget;
> +        break;
> +    }
> +}

Likewise.

> +static void gen_load_fpr32h(TCGv_i32 t, int reg)
> +{
> +    tcg_gen_extrh_i64_i32(t, fpu_f64[reg]);
> +}
> +
> +static void gen_store_fpr32h(TCGv_i32 t, int reg)
> +{
> +    TCGv_i64 t64 = tcg_temp_new_i64();
> +    tcg_gen_extu_i32_i64(t64, t);
> +    tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 32, 32);
> +    tcg_temp_free_i64(t64);
> +}

There is no general-purpose high-part fpr stuff.  There's only movgr2frh and movfrh2gr, 
and you can simplify both if you drop the transition through TCGv_i32.

> +void gen_op_addr_add(TCGv ret, TCGv arg0, TCGv arg1)
> +{
> +    tcg_gen_add_tl(ret, arg0, arg1);
> +}

No point in this, since loongarch has no 32-bit address mode.

> +void gen_base_offset_addr(TCGv addr, int base, int offset)
> +{
> +    if (base == 0) {
> +        tcg_gen_movi_tl(addr, offset);
> +    } else if (offset == 0) {
> +        gen_load_gpr(addr, base);
> +    } else {
> +        tcg_gen_movi_tl(addr, offset);
> +        gen_op_addr_add(addr, cpu_gpr[base], addr);
> +    }
> +}

Using the interfaces I quote above from my riscv cleanup,
this can be tidied to

     tcg_gen_addi_tl(addr, gpr_src(base), offset);

> +static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> +{
> +    return true;
> +}

You must now use translate_use_goto_tb, which will not always return true.  You will see 
assertion failures otherwise.

> +static inline void clear_branch_hflags(DisasContext *ctx)
> +{
> +    ctx->hflags &= ~LOONGARCH_HFLAG_BMASK;
> +    if (ctx->base.is_jmp == DISAS_NEXT) {
> +        save_cpu_state(ctx, 0);
> +    } else {
> +        /*
> +         * It is not safe to save ctx->hflags as hflags may be changed
> +         * in execution time.
> +         */
> +        tcg_gen_andi_i32(hflags, hflags, ~LOONGARCH_HFLAG_BMASK);
> +    }
> +}

Not required.

> +static void gen_branch(DisasContext *ctx, int insn_bytes)
> +{
> +    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
> +        int proc_hflags = ctx->hflags & LOONGARCH_HFLAG_BMASK;
> +        /* Branches completion */
> +        clear_branch_hflags(ctx);
> +        ctx->base.is_jmp = DISAS_NORETURN;
> +        switch (proc_hflags & LOONGARCH_HFLAG_BMASK) {
> +        case LOONGARCH_HFLAG_B:
> +            /* unconditional branch */
> +            gen_goto_tb(ctx, 0, ctx->btarget);
> +            break;
> +        case LOONGARCH_HFLAG_BC:
> +            /* Conditional branch */
> +            {
> +                TCGLabel *l1 = gen_new_label();
> +
> +                tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
> +                gen_goto_tb(ctx, 1, ctx->base.pc_next + insn_bytes);
> +                gen_set_label(l1);
> +                gen_goto_tb(ctx, 0, ctx->btarget);
> +            }
> +            break;
> +        case LOONGARCH_HFLAG_BR:
> +            /* unconditional branch to register */
> +            tcg_gen_mov_tl(cpu_PC, btarget);
> +            tcg_gen_lookup_and_goto_ptr();
> +            break;
> +        default:
> +            fprintf(stderr, "unknown branch 0x%x\n", proc_hflags);
> +            abort();
> +        }
> +    }
> +}

Split this up into the various trans_* branch routines, without the setting of HFLAG.

> +static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
> +                                            CPUState *cs)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    CPULoongArchState *env = cs->env_ptr;
> +
> +    ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
> +    ctx->saved_pc = -1;
> +    ctx->btarget = 0;
> +    /* Restore state from the tb context.  */
> +    ctx->hflags = (uint32_t)ctx->base.tb->flags;
> +    restore_cpu_state(env, ctx);
> +    ctx->mem_idx = LOONGARCH_HFLAG_UM;

This is not an mmu index.  You didn't notice the error because you're only doing user-mode.

You're missing a check for page crossing.
Generally, for fixed-width ISAs like this, we do

     /* Bound the number of insns to execute to those left on the page.  */
     int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);

here in init_disas_context.

> +static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +
> +    tcg_gen_insn_start(ctx->base.pc_next, ctx->hflags & LOONGARCH_HFLAG_BMASK,
> +                       ctx->btarget);

No hflags/btarget stuff.  Drop TARGET_INSN_START_EXTRA_WORDS.

> +static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
> +                                          CPUState *cs,
> +                                          const CPUBreakpoint *bp)
> +{
> +    return true;
> +}

Broken, but now handled generically, so remove it.


> +static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    CPULoongArchState *env = cs->env_ptr;
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    int insn_bytes = 4;
> +
> +    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> +
> +    if (!decode(ctx, ctx->opcode)) {
> +        fprintf(stderr, "Error: unkown opcode. 0x%lx: 0x%x\n",
> +                ctx->base.pc_next, ctx->opcode);

No fprintfs.  Use qemu_log_mask with LOG_UNIMP or LOG_GUEST_ERROR.

> +    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
> +        gen_branch(ctx, insn_bytes);
> +    }

Drop this, as I mentioned above.

> +static void fpu_dump_state(CPULoongArchState *env, FILE * f, int flags)
> +{
> +    int i;
> +    int is_fpu64 = 1;
> +
> +#define printfpr(fp)                                              \
> +    do {                                                          \
> +        if (is_fpu64)                                             \
> +            qemu_fprintf(f, "w:%08x d:%016" PRIx64                \
> +                        " fd:%13g fs:%13g psu: %13g\n",           \
> +                        (fp)->w[FP_ENDIAN_IDX], (fp)->d,          \
> +                        (double)(fp)->fd,                         \
> +                        (double)(fp)->fs[FP_ENDIAN_IDX],          \
> +                        (double)(fp)->fs[!FP_ENDIAN_IDX]);        \
> +        else {                                                    \
> +            fpr_t tmp;                                            \
> +            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];        \
> +            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX]; \
> +            qemu_fprintf(f, "w:%08x d:%016" PRIx64                \
> +                        " fd:%13g fs:%13g psu:%13g\n",            \
> +                        tmp.w[FP_ENDIAN_IDX], tmp.d,              \
> +                        (double)tmp.fd,                           \
> +                        (double)tmp.fs[FP_ENDIAN_IDX],            \
> +                        (double)tmp.fs[!FP_ENDIAN_IDX]);          \
> +        }                                                         \
> +    } while (0)

This is broken.  You're performing an integer to fp conversion of something that is 
already a floating-point value, not printing the floating-point value itself.  It's broken 
in the mips code as well.

In addition, is_fpu64 is pointless for loongarch.

> +void loongarch_tcg_init(void)
> +{
> +    int i;
> +
> +    for (i = 0; i < 32; i++)
> +        cpu_gpr[i] = tcg_global_mem_new(cpu_env,
> +                                        offsetof(CPULoongArchState,
> +                                                 active_tc.gpr[i]),
> +                                        regnames[i]);

Missing braces.
Do not create a temp for the zero register.

> +    bcond = tcg_global_mem_new(cpu_env,
> +                               offsetof(CPULoongArchState, bcond), "bcond");
> +    btarget = tcg_global_mem_new(cpu_env,
> +                                 offsetof(CPULoongArchState, btarget),
> +                                 "btarget");
> +    hflags = tcg_global_mem_new_i32(cpu_env,
> +                                    offsetof(CPULoongArchState, hflags),
> +                                    "hflags");

Drop these.


r~

