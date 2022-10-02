Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9205F2447
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:28:53 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2lo-0002fw-A8
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2jG-0007Iy-Hx
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:26:14 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2jA-0005TL-73
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:26:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id n7so7907663plp.1
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ZoH8mNaAGVOp5omPyNqjwdbfj4outd/c7q9Mv0n0W7s=;
 b=HSbzPxirMn8VVzy/FMA+bBPnqW6Bc+Fqlzn6oG+jWU4WeeQoPOZC+SAE49e2d1fDla
 TQre6uJ0NI0vG9fshyevYriHF6dWA7uBYvTLSvD3o2xlIIOXbwVTDq684UpFMSZ0x5x4
 04WwKlfEn7uThvcMczy/Qu1YLmRyyZAwOrM9tYzq5DjMQMrcj1IW553sghrp5fMVg739
 ZgNZdOUiewsFxcIf/5+xbIONtKQO+xVzZm7090UP6ci+qaksJ7hUmOMzBHbNOmJwDmk1
 8g/rQbAzDBZVXxRNAWbB29/wboxS42WZFlIgZqvqSC8+O0Lm7bLHpy9Sbk/yK2Jld8Bx
 sfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZoH8mNaAGVOp5omPyNqjwdbfj4outd/c7q9Mv0n0W7s=;
 b=J5VauPCHSQq47sofrZdDKI8K8dwv1V1fxwbjeRD953CXfiexHiIHf8iFuR9quEScJm
 dTSsHFG1fYc8JYDHMKN4T5OnaumpbCFn0noFiNKkfd87b6W/PdQ0WZabdapneftpFfD4
 VGhEbKDSyj78InAB9Gcef4Qgvu4jrdSp05t2Yj+CogSDtfvFEJ6egbFtlb9GMI5GCGpQ
 NbB1+HenJS2NFSu4w6s6HvlN5nTDqSTd6BQywvbExW2ZqWc3ONikcE/8Koa6+uWMB7sV
 zDryeV6fupcEZRmNUDDOv7403K4T37qIbFhTHhmwe8R1dCd//z9/iZ/bqqovnxPnJZ9H
 boOQ==
X-Gm-Message-State: ACrzQf3AOKM3EsI/NP4n1nKdO9umJLVQV5eHYNwk16zRUBWdRVsI/BlP
 SBUwOQyTV7+7eXPBTiUv6g1DXg==
X-Google-Smtp-Source: AMsMyM5Wrsw7FIgJXFsCsniK504BZ8O9p4c0SOmwqbaTiKUGM9EYAB6ISY2XVtmGnDfuQiWKU+Fztw==
X-Received: by 2002:a17:902:ec86:b0:177:f35c:e118 with SMTP id
 x6-20020a170902ec8600b00177f35ce118mr17949726plg.138.1664731564843; 
 Sun, 02 Oct 2022 10:26:04 -0700 (PDT)
Received: from [192.168.235.227]
 (50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id
 e68-20020a621e47000000b0055f8175aa85sm3354486pfe.214.2022.10.02.10.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 10:26:03 -0700 (PDT)
Message-ID: <47c53a72-919e-00c6-5cfe-1eb12a2b3593@linaro.org>
Date: Sun, 2 Oct 2022 10:23:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: qemu-devel@nongnu.org, balaton@eik.bme.hu
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <8735dbcha2.wl-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8735dbcha2.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.086,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping, or should I create a PR myself?

r~

On 9/1/22 07:15, Yoshinori Sato wrote:
> On Thu, 01 Sep 2022 19:15:09 +0900,
> Richard Henderson wrote:
>>
>> The value previously chosen overlaps GUSA_MASK.
>>
>> Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
>> that they are included in TB_FLAGs.  Add aliases for the
>> FPSCR and SR bits that are included in TB_FLAGS, so that
>> we don't accidentally reassign those bits.
>>
>> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/sh4/cpu.h        | 56 +++++++++++++------------
>>   linux-user/sh4/signal.c |  6 +--
>>   target/sh4/cpu.c        |  6 +--
>>   target/sh4/helper.c     |  6 +--
>>   target/sh4/translate.c  | 90 ++++++++++++++++++++++-------------------
>>   5 files changed, 88 insertions(+), 76 deletions(-)
>>
>> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
>> index 9f15ef913c..727b829598 100644
>> --- a/target/sh4/cpu.h
>> +++ b/target/sh4/cpu.h
>> @@ -78,26 +78,33 @@
>>   #define FPSCR_RM_NEAREST       (0 << 0)
>>   #define FPSCR_RM_ZERO          (1 << 0)
>>   
>> -#define DELAY_SLOT_MASK        0x7
>> -#define DELAY_SLOT             (1 << 0)
>> -#define DELAY_SLOT_CONDITIONAL (1 << 1)
>> -#define DELAY_SLOT_RTE         (1 << 2)
>> +#define TB_FLAG_DELAY_SLOT       (1 << 0)
>> +#define TB_FLAG_DELAY_SLOT_COND  (1 << 1)
>> +#define TB_FLAG_DELAY_SLOT_RTE   (1 << 2)
>> +#define TB_FLAG_PENDING_MOVCA    (1 << 3)
>> +#define TB_FLAG_GUSA_SHIFT       4                      /* [11:4] */
>> +#define TB_FLAG_GUSA_EXCLUSIVE   (1 << 12)
>> +#define TB_FLAG_UNALIGN          (1 << 13)
>> +#define TB_FLAG_SR_FD            (1 << SR_FD)           /* 15 */
>> +#define TB_FLAG_FPSCR_PR         FPSCR_PR               /* 19 */
>> +#define TB_FLAG_FPSCR_SZ         FPSCR_SZ               /* 20 */
>> +#define TB_FLAG_FPSCR_FR         FPSCR_FR               /* 21 */
>> +#define TB_FLAG_SR_RB            (1 << SR_RB)           /* 29 */
>> +#define TB_FLAG_SR_MD            (1 << SR_MD)           /* 30 */
>>   
>> -#define TB_FLAG_PENDING_MOVCA  (1 << 3)
>> -#define TB_FLAG_UNALIGN        (1 << 4)
>> -
>> -#define GUSA_SHIFT             4
>> -#ifdef CONFIG_USER_ONLY
>> -#define GUSA_EXCLUSIVE         (1 << 12)
>> -#define GUSA_MASK              ((0xff << GUSA_SHIFT) | GUSA_EXCLUSIVE)
>> -#else
>> -/* Provide dummy versions of the above to allow tests against tbflags
>> -   to be elided while avoiding ifdefs.  */
>> -#define GUSA_EXCLUSIVE         0
>> -#define GUSA_MASK              0
>> -#endif
>> -
>> -#define TB_FLAG_ENVFLAGS_MASK  (DELAY_SLOT_MASK | GUSA_MASK)
>> +#define TB_FLAG_DELAY_SLOT_MASK  (TB_FLAG_DELAY_SLOT |       \
>> +                                  TB_FLAG_DELAY_SLOT_COND |  \
>> +                                  TB_FLAG_DELAY_SLOT_RTE)
>> +#define TB_FLAG_GUSA_MASK        ((0xff << TB_FLAG_GUSA_SHIFT) | \
>> +                                  TB_FLAG_GUSA_EXCLUSIVE)
>> +#define TB_FLAG_FPSCR_MASK       (TB_FLAG_FPSCR_PR | \
>> +                                  TB_FLAG_FPSCR_SZ | \
>> +                                  TB_FLAG_FPSCR_FR)
>> +#define TB_FLAG_SR_MASK          (TB_FLAG_SR_FD | \
>> +                                  TB_FLAG_SR_RB | \
>> +                                  TB_FLAG_SR_MD)
>> +#define TB_FLAG_ENVFLAGS_MASK    (TB_FLAG_DELAY_SLOT_MASK | \
>> +                                  TB_FLAG_GUSA_MASK)
>>   
>>   typedef struct tlb_t {
>>       uint32_t vpn;		/* virtual page number */
>> @@ -258,7 +265,7 @@ static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
>>   {
>>       /* The instruction in a RTE delay slot is fetched in privileged
>>          mode, but executed in user mode.  */
>> -    if (ifetch && (env->flags & DELAY_SLOT_RTE)) {
>> +    if (ifetch && (env->flags & TB_FLAG_DELAY_SLOT_RTE)) {
>>           return 0;
>>       } else {
>>           return (env->sr & (1u << SR_MD)) == 0 ? 1 : 0;
>> @@ -366,11 +373,10 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
>>   {
>>       *pc = env->pc;
>>       /* For a gUSA region, notice the end of the region.  */
>> -    *cs_base = env->flags & GUSA_MASK ? env->gregs[0] : 0;
>> -    *flags = env->flags /* TB_FLAG_ENVFLAGS_MASK: bits 0-2, 4-12 */
>> -            | (env->fpscr & (FPSCR_FR | FPSCR_SZ | FPSCR_PR))  /* Bits 19-21 */
>> -            | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
>> -            | (env->sr & (1u << SR_FD))                        /* Bit 15 */
>> +    *cs_base = env->flags & TB_FLAG_GUSA_MASK ? env->gregs[0] : 0;
>> +    *flags = env->flags
>> +            | (env->fpscr & TB_FLAG_FPSCR_MASK)
>> +            | (env->sr & TB_FLAG_SR_MASK)
>>               | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
>>   #ifdef CONFIG_USER_ONLY
>>       *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
>> diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
>> index f6a18bc6b5..c4ba962708 100644
>> --- a/linux-user/sh4/signal.c
>> +++ b/linux-user/sh4/signal.c
>> @@ -161,7 +161,7 @@ static void restore_sigcontext(CPUSH4State *regs, struct target_sigcontext *sc)
>>       __get_user(regs->fpul, &sc->sc_fpul);
>>   
>>       regs->tra = -1;         /* disable syscall checks */
>> -    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
>> +    regs->flags = 0;
>>   }
>>   
>>   void setup_frame(int sig, struct target_sigaction *ka,
>> @@ -199,7 +199,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>>       regs->gregs[5] = 0;
>>       regs->gregs[6] = frame_addr += offsetof(typeof(*frame), sc);
>>       regs->pc = (unsigned long) ka->_sa_handler;
>> -    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
>> +    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
>>   
>>       unlock_user_struct(frame, frame_addr, 1);
>>       return;
>> @@ -251,7 +251,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>>       regs->gregs[5] = frame_addr + offsetof(typeof(*frame), info);
>>       regs->gregs[6] = frame_addr + offsetof(typeof(*frame), uc);
>>       regs->pc = (unsigned long) ka->_sa_handler;
>> -    regs->flags &= ~(DELAY_SLOT_MASK | GUSA_MASK);
>> +    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
>>   
>>       unlock_user_struct(frame, frame_addr, 1);
>>       return;
>> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
>> index 06b2691dc4..65643b6b1c 100644
>> --- a/target/sh4/cpu.c
>> +++ b/target/sh4/cpu.c
>> @@ -40,7 +40,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
>>       SuperHCPU *cpu = SUPERH_CPU(cs);
>>   
>>       cpu->env.pc = tb->pc;
>> -    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
>> +    cpu->env.flags = tb->flags;
>>   }
>>   
>>   #ifndef CONFIG_USER_ONLY
>> @@ -50,10 +50,10 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
>>       SuperHCPU *cpu = SUPERH_CPU(cs);
>>       CPUSH4State *env = &cpu->env;
>>   
>> -    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
>> +    if ((env->flags & (TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND))
>>           && env->pc != tb->pc) {
>>           env->pc -= 2;
>> -        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
>> +        env->flags &= ~(TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND);
>>           return true;
>>       }
>>       return false;
>> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
>> index 6a620e36fc..e02e7af607 100644
>> --- a/target/sh4/helper.c
>> +++ b/target/sh4/helper.c
>> @@ -147,11 +147,11 @@ void superh_cpu_do_interrupt(CPUState *cs)
>>       env->sr |= (1u << SR_BL) | (1u << SR_MD) | (1u << SR_RB);
>>       env->lock_addr = -1;
>>   
>> -    if (env->flags & DELAY_SLOT_MASK) {
>> +    if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
>>           /* Branch instruction should be executed again before delay slot. */
>>   	env->spc -= 2;
>>   	/* Clear flags for exception/interrupt routine. */
>> -        env->flags &= ~DELAY_SLOT_MASK;
>> +        env->flags &= ~TB_FLAG_DELAY_SLOT_MASK;
>>       }
>>   
>>       if (do_exp) {
>> @@ -786,7 +786,7 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>           CPUSH4State *env = &cpu->env;
>>   
>>           /* Delay slots are indivisible, ignore interrupts */
>> -        if (env->flags & DELAY_SLOT_MASK) {
>> +        if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
>>               return false;
>>           } else {
>>               superh_cpu_do_interrupt(cs);
>> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
>> index f1b190e7cf..68d539c7f6 100644
>> --- a/target/sh4/translate.c
>> +++ b/target/sh4/translate.c
>> @@ -175,13 +175,13 @@ void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>   		    i, env->gregs[i], i + 1, env->gregs[i + 1],
>>   		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
>>       }
>> -    if (env->flags & DELAY_SLOT) {
>> +    if (env->flags & TB_FLAG_DELAY_SLOT) {
>>           qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
>>   		    env->delayed_pc);
>> -    } else if (env->flags & DELAY_SLOT_CONDITIONAL) {
>> +    } else if (env->flags & TB_FLAG_DELAY_SLOT_COND) {
>>           qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
>>   		    env->delayed_pc);
>> -    } else if (env->flags & DELAY_SLOT_RTE) {
>> +    } else if (env->flags & TB_FLAG_DELAY_SLOT_RTE) {
>>           qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
>>                        env->delayed_pc);
>>       }
>> @@ -223,7 +223,7 @@ static inline void gen_save_cpu_state(DisasContext *ctx, bool save_pc)
>>   
>>   static inline bool use_exit_tb(DisasContext *ctx)
>>   {
>> -    return (ctx->tbflags & GUSA_EXCLUSIVE) != 0;
>> +    return (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) != 0;
>>   }
>>   
>>   static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>> @@ -276,12 +276,12 @@ static void gen_conditional_jump(DisasContext *ctx, target_ulong dest,
>>       TCGLabel *l1 = gen_new_label();
>>       TCGCond cond_not_taken = jump_if_true ? TCG_COND_EQ : TCG_COND_NE;
>>   
>> -    if (ctx->tbflags & GUSA_EXCLUSIVE) {
>> +    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
>>           /* When in an exclusive region, we must continue to the end.
>>              Therefore, exit the region on a taken branch, but otherwise
>>              fall through to the next instruction.  */
>>           tcg_gen_brcondi_i32(cond_not_taken, cpu_sr_t, 0, l1);
>> -        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~GUSA_MASK);
>> +        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~TB_FLAG_GUSA_MASK);
>>           /* Note that this won't actually use a goto_tb opcode because we
>>              disallow it in use_goto_tb, but it handles exit + singlestep.  */
>>           gen_goto_tb(ctx, 0, dest);
>> @@ -307,14 +307,14 @@ static void gen_delayed_conditional_jump(DisasContext * ctx)
>>       tcg_gen_mov_i32(ds, cpu_delayed_cond);
>>       tcg_gen_discard_i32(cpu_delayed_cond);
>>   
>> -    if (ctx->tbflags & GUSA_EXCLUSIVE) {
>> +    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
>>           /* When in an exclusive region, we must continue to the end.
>>              Therefore, exit the region on a taken branch, but otherwise
>>              fall through to the next instruction.  */
>>           tcg_gen_brcondi_i32(TCG_COND_EQ, ds, 0, l1);
>>   
>>           /* Leave the gUSA region.  */
>> -        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~GUSA_MASK);
>> +        tcg_gen_movi_i32(cpu_flags, ctx->envflags & ~TB_FLAG_GUSA_MASK);
>>           gen_jump(ctx);
>>   
>>           gen_set_label(l1);
>> @@ -361,8 +361,8 @@ static inline void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
>>   #define XHACK(x) ((((x) & 1 ) << 4) | ((x) & 0xe))
>>   
>>   #define CHECK_NOT_DELAY_SLOT \
>> -    if (ctx->envflags & DELAY_SLOT_MASK) {  \
>> -        goto do_illegal_slot;               \
>> +    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {  \
>> +        goto do_illegal_slot;                       \
>>       }
>>   
>>   #define CHECK_PRIVILEGED \
>> @@ -436,7 +436,7 @@ static void _decode_opc(DisasContext * ctx)
>>       case 0x000b:		/* rts */
>>   	CHECK_NOT_DELAY_SLOT
>>   	tcg_gen_mov_i32(cpu_delayed_pc, cpu_pr);
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	ctx->delayed_pc = (uint32_t) - 1;
>>   	return;
>>       case 0x0028:		/* clrmac */
>> @@ -458,7 +458,7 @@ static void _decode_opc(DisasContext * ctx)
>>   	CHECK_NOT_DELAY_SLOT
>>           gen_write_sr(cpu_ssr);
>>   	tcg_gen_mov_i32(cpu_delayed_pc, cpu_spc);
>> -        ctx->envflags |= DELAY_SLOT_RTE;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT_RTE;
>>   	ctx->delayed_pc = (uint32_t) - 1;
>>           ctx->base.is_jmp = DISAS_STOP;
>>   	return;
>> @@ -513,12 +513,15 @@ static void _decode_opc(DisasContext * ctx)
>>   	return;
>>       case 0xe000:		/* mov #imm,Rn */
>>   #ifdef CONFIG_USER_ONLY
>> -        /* Detect the start of a gUSA region.  If so, update envflags
>> -           and end the TB.  This will allow us to see the end of the
>> -           region (stored in R0) in the next TB.  */
>> +        /*
>> +         * Detect the start of a gUSA region (mov #-n, r15).
>> +         * If so, update envflags and end the TB.  This will allow us
>> +         * to see the end of the region (stored in R0) in the next TB.
>> +         */
>>           if (B11_8 == 15 && B7_0s < 0 &&
>>               (tb_cflags(ctx->base.tb) & CF_PARALLEL)) {
>> -            ctx->envflags = deposit32(ctx->envflags, GUSA_SHIFT, 8, B7_0s);
>> +            ctx->envflags =
>> +                deposit32(ctx->envflags, TB_FLAG_GUSA_SHIFT, 8, B7_0s);
>>               ctx->base.is_jmp = DISAS_STOP;
>>           }
>>   #endif
>> @@ -544,13 +547,13 @@ static void _decode_opc(DisasContext * ctx)
>>       case 0xa000:		/* bra disp */
>>   	CHECK_NOT_DELAY_SLOT
>>           ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	return;
>>       case 0xb000:		/* bsr disp */
>>   	CHECK_NOT_DELAY_SLOT
>>           tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
>>           ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	return;
>>       }
>>   
>> @@ -1194,7 +1197,7 @@ static void _decode_opc(DisasContext * ctx)
>>   	CHECK_NOT_DELAY_SLOT
>>           tcg_gen_xori_i32(cpu_delayed_cond, cpu_sr_t, 1);
>>           ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
>> -        ctx->envflags |= DELAY_SLOT_CONDITIONAL;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT_COND;
>>   	return;
>>       case 0x8900:		/* bt label */
>>   	CHECK_NOT_DELAY_SLOT
>> @@ -1204,7 +1207,7 @@ static void _decode_opc(DisasContext * ctx)
>>   	CHECK_NOT_DELAY_SLOT
>>           tcg_gen_mov_i32(cpu_delayed_cond, cpu_sr_t);
>>           ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
>> -        ctx->envflags |= DELAY_SLOT_CONDITIONAL;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT_COND;
>>   	return;
>>       case 0x8800:		/* cmp/eq #imm,R0 */
>>           tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, REG(0), B7_0s);
>> @@ -1388,14 +1391,14 @@ static void _decode_opc(DisasContext * ctx)
>>       case 0x0023:		/* braf Rn */
>>   	CHECK_NOT_DELAY_SLOT
>>           tcg_gen_addi_i32(cpu_delayed_pc, REG(B11_8), ctx->base.pc_next + 4);
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	ctx->delayed_pc = (uint32_t) - 1;
>>   	return;
>>       case 0x0003:		/* bsrf Rn */
>>   	CHECK_NOT_DELAY_SLOT
>>           tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
>>   	tcg_gen_add_i32(cpu_delayed_pc, REG(B11_8), cpu_pr);
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	ctx->delayed_pc = (uint32_t) - 1;
>>   	return;
>>       case 0x4015:		/* cmp/pl Rn */
>> @@ -1411,14 +1414,14 @@ static void _decode_opc(DisasContext * ctx)
>>       case 0x402b:		/* jmp @Rn */
>>   	CHECK_NOT_DELAY_SLOT
>>   	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	ctx->delayed_pc = (uint32_t) - 1;
>>   	return;
>>       case 0x400b:		/* jsr @Rn */
>>   	CHECK_NOT_DELAY_SLOT
>>           tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
>>   	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
>> -        ctx->envflags |= DELAY_SLOT;
>> +        ctx->envflags |= TB_FLAG_DELAY_SLOT;
>>   	ctx->delayed_pc = (uint32_t) - 1;
>>   	return;
>>       case 0x400e:		/* ldc Rm,SR */
>> @@ -1839,7 +1842,7 @@ static void _decode_opc(DisasContext * ctx)
>>       fflush(stderr);
>>   #endif
>>    do_illegal:
>> -    if (ctx->envflags & DELAY_SLOT_MASK) {
>> +    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
>>    do_illegal_slot:
>>           gen_save_cpu_state(ctx, true);
>>           gen_helper_raise_slot_illegal_instruction(cpu_env);
>> @@ -1852,7 +1855,7 @@ static void _decode_opc(DisasContext * ctx)
>>   
>>    do_fpu_disabled:
>>       gen_save_cpu_state(ctx, true);
>> -    if (ctx->envflags & DELAY_SLOT_MASK) {
>> +    if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
>>           gen_helper_raise_slot_fpu_disable(cpu_env);
>>       } else {
>>           gen_helper_raise_fpu_disable(cpu_env);
>> @@ -1867,23 +1870,23 @@ static void decode_opc(DisasContext * ctx)
>>   
>>       _decode_opc(ctx);
>>   
>> -    if (old_flags & DELAY_SLOT_MASK) {
>> +    if (old_flags & TB_FLAG_DELAY_SLOT_MASK) {
>>           /* go out of the delay slot */
>> -        ctx->envflags &= ~DELAY_SLOT_MASK;
>> +        ctx->envflags &= ~TB_FLAG_DELAY_SLOT_MASK;
>>   
>>           /* When in an exclusive region, we must continue to the end
>>              for conditional branches.  */
>> -        if (ctx->tbflags & GUSA_EXCLUSIVE
>> -            && old_flags & DELAY_SLOT_CONDITIONAL) {
>> +        if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE
>> +            && old_flags & TB_FLAG_DELAY_SLOT_COND) {
>>               gen_delayed_conditional_jump(ctx);
>>               return;
>>           }
>>           /* Otherwise this is probably an invalid gUSA region.
>>              Drop the GUSA bits so the next TB doesn't see them.  */
>> -        ctx->envflags &= ~GUSA_MASK;
>> +        ctx->envflags &= ~TB_FLAG_GUSA_MASK;
>>   
>>           tcg_gen_movi_i32(cpu_flags, ctx->envflags);
>> -        if (old_flags & DELAY_SLOT_CONDITIONAL) {
>> +        if (old_flags & TB_FLAG_DELAY_SLOT_COND) {
>>   	    gen_delayed_conditional_jump(ctx);
>>           } else {
>>               gen_jump(ctx);
>> @@ -2223,7 +2226,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
>>       }
>>   
>>       /* The entire region has been translated.  */
>> -    ctx->envflags &= ~GUSA_MASK;
>> +    ctx->envflags &= ~TB_FLAG_GUSA_MASK;
>>       ctx->base.pc_next = pc_end;
>>       ctx->base.num_insns += max_insns - 1;
>>       return;
>> @@ -2234,7 +2237,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
>>   
>>       /* Restart with the EXCLUSIVE bit set, within a TB run via
>>          cpu_exec_step_atomic holding the exclusive lock.  */
>> -    ctx->envflags |= GUSA_EXCLUSIVE;
>> +    ctx->envflags |= TB_FLAG_GUSA_EXCLUSIVE;
>>       gen_save_cpu_state(ctx, false);
>>       gen_helper_exclusive(cpu_env);
>>       ctx->base.is_jmp = DISAS_NORETURN;
>> @@ -2267,17 +2270,19 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>                     (tbflags & (1 << SR_RB))) * 0x10;
>>       ctx->fbank = tbflags & FPSCR_FR ? 0x10 : 0;
>>   
>> -    if (tbflags & GUSA_MASK) {
>> +#ifdef CONFIG_USER_ONLY
>> +    if (tbflags & TB_FLAG_GUSA_MASK) {
>> +        /* In gUSA exclusive region. */
>>           uint32_t pc = ctx->base.pc_next;
>>           uint32_t pc_end = ctx->base.tb->cs_base;
>> -        int backup = sextract32(ctx->tbflags, GUSA_SHIFT, 8);
>> +        int backup = sextract32(ctx->tbflags, TB_FLAG_GUSA_SHIFT, 8);
>>           int max_insns = (pc_end - pc) / 2;
>>   
>>           if (pc != pc_end + backup || max_insns < 2) {
>>               /* This is a malformed gUSA region.  Don't do anything special,
>>                  since the interpreter is likely to get confused.  */
>> -            ctx->envflags &= ~GUSA_MASK;
>> -        } else if (tbflags & GUSA_EXCLUSIVE) {
>> +            ctx->envflags &= ~TB_FLAG_GUSA_MASK;
>> +        } else if (tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
>>               /* Regardless of single-stepping or the end of the page,
>>                  we must complete execution of the gUSA region while
>>                  holding the exclusive lock.  */
>> @@ -2285,6 +2290,7 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>               return;
>>           }
>>       }
>> +#endif
>>   
>>       /* Since the ISA is fixed-width, we can bound by the number
>>          of instructions remaining on the page.  */
>> @@ -2309,8 +2315,8 @@ static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>   
>>   #ifdef CONFIG_USER_ONLY
>> -    if (unlikely(ctx->envflags & GUSA_MASK)
>> -        && !(ctx->envflags & GUSA_EXCLUSIVE)) {
>> +    if (unlikely(ctx->envflags & TB_FLAG_GUSA_MASK)
>> +        && !(ctx->envflags & TB_FLAG_GUSA_EXCLUSIVE)) {
>>           /* We're in an gUSA region, and we have not already fallen
>>              back on using an exclusive region.  Attempt to parse the
>>              region into a single supported atomic operation.  Failure
>> @@ -2330,9 +2336,9 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>>   {
>>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>   
>> -    if (ctx->tbflags & GUSA_EXCLUSIVE) {
>> +    if (ctx->tbflags & TB_FLAG_GUSA_EXCLUSIVE) {
>>           /* Ending the region of exclusivity.  Clear the bits.  */
>> -        ctx->envflags &= ~GUSA_MASK;
>> +        ctx->envflags &= ~TB_FLAG_GUSA_MASK;
>>       }
>>   
>>       switch (ctx->base.is_jmp) {
>> -- 
>> 2.34.1
>>
> 
> Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>


