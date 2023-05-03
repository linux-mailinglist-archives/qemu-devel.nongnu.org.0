Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C06F501C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 08:30:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu5zR-0003Fn-IT; Wed, 03 May 2023 02:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pu5zK-0003FQ-HG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:29:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pu5zG-0008LP-BA
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:29:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30695695e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683095351; x=1685687351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VnoIXpQi3eMt6bM9y9/uf+B8Q9us1gmaMG3KuNIjemw=;
 b=eUS/o5BVWweijI0W2LvIiJ3KG5emfzMcXrvgMH37FmWqWQo0Pjf7CVjzl1whWlZi9S
 ADco9sdHXflEF29AKCWz3l/PZsli1Duj9stetx6kgu6dJs0xjKK1OiCP6qM2hg2+m2fw
 Dmmj/juY3yp3KMEXBbxP/BybLi2ydip/tLAMejfbyNoazRpFmx82BLKGOZWpw7t1+DYa
 49bhox1xr89FPJLJ+us7ZJ78Co9iT9TOgMKERpCLHtUb47c0Ycy9SSWZ1bW+t992hpXM
 Q15LfxahZpkr7tLvcEjLmiVAN8XrAui3qhv3Ra350Sa0J+h0IMLs9bNIUc6WSm6dIobC
 GpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683095351; x=1685687351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VnoIXpQi3eMt6bM9y9/uf+B8Q9us1gmaMG3KuNIjemw=;
 b=OX5NjQsV08LLwvWcLMkJX9B+CNeEYqvJ8YsLu8eNLDUHH9lRXzSLJG0XyKTTdv6olk
 OSa0XtnY07tjMw+cMcXOyiW8tNtrSZBhavjuADDje65TB+6G9+v2DDPOjKKM7sVvSj3P
 7geJ8T2XSCwnEbDzmldcAPTNtRH6SH9dWiVfo/iq+ooA7qNkn/jxaCA8QsC9ounx7im2
 1q4OTc4pBu+JjhzKBhOH9aDeV/DASIq8jbOQA5kKFz7Zg0HOpG2SBBHEH35wn3lfNntI
 iKwZV9rdaE+WUBE9Gc5jYb7H+6UW36lCMJAM2ICrdbXV646FOBqJT4Jeg0GGX+7SqEpW
 0hBg==
X-Gm-Message-State: AC+VfDwCtpX8MuPl5NVTAyMGNbFyKZg08JjhoNBVf+jiD4Iyq+ekJNrK
 rYAefQ4S0aJOwposwzlvmLSsHq4OqfU=
X-Google-Smtp-Source: ACHHUZ4uVK0Y6NL+3GBmnEQUwOl48KHnTcXdC/UdhRS8j696XMrZepV64oqsrISe0EQa4yoJ8ddWkQ==
X-Received: by 2002:a1c:740f:0:b0:3f2:5641:3d4 with SMTP id
 p15-20020a1c740f000000b003f2564103d4mr13028027wmc.33.1683095350298; 
 Tue, 02 May 2023 23:29:10 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 f23-20020a7bcd17000000b003ee443bf0c7sm827355wmj.16.2023.05.02.23.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:29:09 -0700 (PDT)
Date: Wed, 3 May 2023 07:29:04 +0100
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH 1/3] target/openrisc: Allow fpcsr access in user mode
Message-ID: <ZFH/ME9af8cQOeD6@antec>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-2-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502185731.3543420-2-shorne@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 02, 2023 at 07:57:29PM +0100, Stafford Horne wrote:
> As per OpenRISC spec 1.4 FPCSR can be read and written in user mode.
> 
> Update mtspr and mfspr helpers to support this by moving the is_user
> check into the helper.
> 
> There is a logic change here to no longer throw an illegal instruction
> exception when executing mtspr/mfspr in user mode.  The illegal
> instruction exception is not part of the spec, so this should be OK.

This is wrong, I considered doing it but left the exception in (moved to the
helper).  I will remove this bit of the commit messages in the next version.
But it is something we could consider doing.

Conversely, the architecture pec should be more clear as to what happens when
mfspr/mtspr privileges are violated.

-Stafford

> Link: https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.4-rev0.pdf
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  target/openrisc/sys_helper.c | 45 +++++++++++++++++-----
>  target/openrisc/translate.c  | 72 ++++++++++++++++--------------------
>  2 files changed, 67 insertions(+), 50 deletions(-)
> 
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index ec145960e3..8a0259c710 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -29,17 +29,37 @@
>  
>  #define TO_SPR(group, number) (((group) << 11) + (number))
>  
> +static inline bool is_user(CPUOpenRISCState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return true;
> +#else
> +    return (env->sr & SR_SM) == 0;
> +#endif
> +}
> +
>  void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
>  {
> -#ifndef CONFIG_USER_ONLY
>      OpenRISCCPU *cpu = env_archcpu(env);
> +#ifndef CONFIG_USER_ONLY
>      CPUState *cs = env_cpu(env);
>      target_ulong mr;
>      int idx;
>  #endif
>  
> +    /* Handle user accessible SPRs first.  */
>      switch (spr) {
> +    case TO_SPR(0, 20): /* FPCSR */
> +        cpu_set_fpcsr(env, rb);
> +        return;
> +    }
> +
> +    if (is_user(env)) {
> +        raise_exception(cpu, EXCP_ILLEGAL);
> +    }
> +
>  #ifndef CONFIG_USER_ONLY
> +    switch (spr) {
>      case TO_SPR(0, 11): /* EVBAR */
>          env->evbar = rb;
>          break;
> @@ -187,12 +207,8 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
>          cpu_openrisc_timer_update(cpu);
>          qemu_mutex_unlock_iothread();
>          break;
> -#endif
> -
> -    case TO_SPR(0, 20): /* FPCSR */
> -        cpu_set_fpcsr(env, rb);
> -        break;
>      }
> +#endif
>  }
>  
>  target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
> @@ -204,10 +220,22 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>      OpenRISCCPU *cpu = env_archcpu(env);
>      CPUState *cs = env_cpu(env);
>      int idx;
> +#else
> +    OpenRISCCPU *cpu = env_archcpu(env);
>  #endif
>  
> +    /* Handle user accessible SPRs first.  */
>      switch (spr) {
> +    case TO_SPR(0, 20): /* FPCSR */
> +        return env->fpcsr;
> +    }
> +
> +    if (is_user(env)) {
> +        raise_exception(cpu, EXCP_ILLEGAL);
> +    }
> +
>  #ifndef CONFIG_USER_ONLY
> +    switch (spr) {
>      case TO_SPR(0, 0): /* VR */
>          return env->vr;
>  
> @@ -324,11 +352,8 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>          cpu_openrisc_count_update(cpu);
>          qemu_mutex_unlock_iothread();
>          return cpu_openrisc_count_get(cpu);
> -#endif
> -
> -    case TO_SPR(0, 20): /* FPCSR */
> -        return env->fpcsr;
>      }
> +#endif
>  
>      /* for rd is passed in, if rd unchanged, just keep it back.  */
>      return rd;
> diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
> index 76e53c78d4..43ba0cc1ad 100644
> --- a/target/openrisc/translate.c
> +++ b/target/openrisc/translate.c
> @@ -819,45 +819,12 @@ static bool trans_l_xori(DisasContext *dc, arg_rri *a)
>  
>  static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
>  {
> -    check_r0_write(dc, a->d);
> -
> -    if (is_user(dc)) {
> -        gen_illegal_exception(dc);
> -    } else {
> -        TCGv spr = tcg_temp_new();
> -
> -        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -            if (dc->delayed_branch) {
> -                tcg_gen_mov_tl(cpu_pc, jmp_pc);
> -                tcg_gen_discard_tl(jmp_pc);
> -            } else {
> -                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
> -            }
> -            dc->base.is_jmp = DISAS_EXIT;
> -        }
> +    TCGv spr = tcg_temp_new();
>  
> -        tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
> -        gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
> -    }
> -    return true;
> -}
> -
> -static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
> -{
> -    if (is_user(dc)) {
> -        gen_illegal_exception(dc);
> -    } else {
> -        TCGv spr;
> +    check_r0_write(dc, a->d);
>  
> -        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
> -        /* For SR, we will need to exit the TB to recognize the new
> -         * exception state.  For NPC, in theory this counts as a branch
> -         * (although the SPR only exists for use by an ICE).  Save all
> -         * of the cpu state first, allowing it to be overwritten.
> -         */
> +    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
>          if (dc->delayed_branch) {
>              tcg_gen_mov_tl(cpu_pc, jmp_pc);
>              tcg_gen_discard_tl(jmp_pc);
> @@ -865,11 +832,36 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
>              tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
>          }
>          dc->base.is_jmp = DISAS_EXIT;
> +    }
> +
> +    tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
> +    gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
> +    return true;
> +}
> +
> +static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
> +{
> +    TCGv spr = tcg_temp_new();
>  
> -        spr = tcg_temp_new();
> -        tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
> -        gen_helper_mtspr(cpu_env, spr, cpu_R(dc, a->b));
> +    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
>      }
> +    /*
> +     * For SR, we will need to exit the TB to recognize the new
> +     * exception state.  For NPC, in theory this counts as a branch
> +     * (although the SPR only exists for use by an ICE).  Save all
> +     * of the cpu state first, allowing it to be overwritten.
> +     */
> +    if (dc->delayed_branch) {
> +        tcg_gen_mov_tl(cpu_pc, jmp_pc);
> +        tcg_gen_discard_tl(jmp_pc);
> +    } else {
> +        tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
> +    }
> +    dc->base.is_jmp = DISAS_EXIT;
> +
> +    tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
> +    gen_helper_mtspr(cpu_env, spr, cpu_R(dc, a->b));
>      return true;
>  }
>  
> -- 
> 2.39.1
> 

