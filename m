Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8533AF1FA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:28:14 +0200 (CEST)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNiX-0005Os-8E
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lvNWc-0004kp-Id
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:15:55 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lvNWa-0001gm-6T
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:15:54 -0400
Received: by mail-lj1-x235.google.com with SMTP id d2so26311493ljj.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AQNrBoAThoZM5BHoY5DFhXdF64bofvYH1dmLVvfiElw=;
 b=K2IpzpCueIVAvjQowP2eb+9N2pwp6fuujzZ6DVxs4nu4vC+WDvcAjz+/+HNVs1Nuz4
 sLZGrlt1dfijQ29GPONliGIb5p+M4dzIa6EIEtZeoQZ/xygEQv79KREj/bgnz0Iz+nkf
 da21GMS+kzkVtNQp/LJdXLZF1uj64ceWicDEjjh50IlDsz0lmXJ+T4j3WNOS5hFg+pfW
 AMSL5fnw4cf5Ss0Wa1109IJAUQEoWk9OqxAUGGN1yPtK2aAcdLrOdXGBcnSSaFiuPU+V
 z0BRN7kbDCaf/MfhD+/Y7grvpP/RaSME8j3EivBifCcTWtOdPvVXx66rTNlE2pg7bW+7
 ciLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AQNrBoAThoZM5BHoY5DFhXdF64bofvYH1dmLVvfiElw=;
 b=FP0S2iZqIpU9V9de6FosXUmMYsIwjp9+DgbgZQR+y35YZdufKTk0zPUi8qzJOM6OFI
 CYtDR0eyXUD/hgYRQQ38s2fR+VTMTZrsHhxGBtnoWH8VKI8sL+6k+oMTQUcBbYcbzE7Z
 /kMhiUQMakIr0mL77wPlK/Eok2PESTqnaGA9lElJnT7tu8K8vVuWRYDiqAP4NfxUsdeZ
 3rikYlU7YlNbrkU9JtPzqC7fdcF5A4/wRalxLM1eZn0n7IbAIW8ZFsE+32IdIk4FXLts
 XCqgCafaMnUKhd76rvy553MbPv5Y3TnMV5RxFuZbHYvkJN3vb9qcQS08dcj9xZ5yseDl
 504w==
X-Gm-Message-State: AOAM533Gjx9AYYEAOM5uOnvvbcnNOX/LrNFEnUmxQfOVL2k5P8cOMljJ
 nbRMXmbFxumglq1Yv+H3KQ8=
X-Google-Smtp-Source: ABdhPJwSJVJzFNoQkSIZ5hwYJS3MTNRc1RHjr3JSiHiYKLGiBYKywjSVRlhcGLzZu/1tDwc4vXpd1w==
X-Received: by 2002:a2e:891a:: with SMTP id d26mr22503033lji.392.1624295748561; 
 Mon, 21 Jun 2021 10:15:48 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h20sm638098lfu.212.2021.06.21.10.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 10:15:47 -0700 (PDT)
Date: Mon, 21 Jun 2021 19:15:47 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 09/11] target/cris: Move delayed branch handling to
 tb_stop
Message-ID: <20210621171547.GN477672@toto>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
 <20210620213249.1494274-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210620213249.1494274-10-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 20, 2021 at 02:32:47PM -0700, Richard Henderson wrote:
> By moving the code here, we can re-use other end-of-tb code,
> e.g. the evaluation of flags.  Honor single stepping.

Hi Richard,

Unfortunately this patch seems to break one of the CRIS tests.
tests/tcg/cris/bare/check_xarith.s

I have an old image with the test-case built in the rootfs...

Best regards,
Edgar


> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 82 ++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 37 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 83b20162f1..0e925320b3 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -55,6 +55,7 @@
>  /* is_jmp field values */
>  #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
>  #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
> +#define DISAS_DBRANCH DISAS_TARGET_2 /* pc update for delayed branch */
>  
>  /* Used by the decoder.  */
>  #define EXTRACT_FIELD(src, start, end) \
> @@ -3219,43 +3220,8 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>       * loop doing nothing for on this program location.
>       */
>      if (dc->delayed_branch && --dc->delayed_branch == 0) {
> -        if (dc->base.tb->flags & 7) {
> -            t_gen_movi_env_TN(dslot, 0);
> -        }
> -
> -        if (dc->cpustate_changed
> -            || !dc->flagx_known
> -            || (dc->flags_x != (dc->base.tb->flags & X_FLAG))) {
> -            cris_store_direct_jmp(dc);
> -        }
> -
> -        if (dc->clear_locked_irq) {
> -            dc->clear_locked_irq = 0;
> -            t_gen_movi_env_TN(locked_irq, 0);
> -        }
> -
> -        if (dc->jmp == JMP_DIRECT_CC) {
> -            TCGLabel *l1 = gen_new_label();
> -            cris_evaluate_flags(dc);
> -
> -            /* Conditional jmp.  */
> -            tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
> -            gen_goto_tb(dc, 1, dc->jmp_pc);
> -            gen_set_label(l1);
> -            gen_goto_tb(dc, 0, dc->pc);
> -            dc->base.is_jmp = DISAS_NORETURN;
> -            dc->jmp = JMP_NOJMP;
> -        } else if (dc->jmp == JMP_DIRECT) {
> -            cris_evaluate_flags(dc);
> -            gen_goto_tb(dc, 0, dc->jmp_pc);
> -            dc->base.is_jmp = DISAS_NORETURN;
> -            dc->jmp = JMP_NOJMP;
> -        } else {
> -            TCGv c = tcg_const_tl(dc->pc);
> -            t_gen_cc_jmp(env_btarget, c);
> -            tcg_temp_free(c);
> -            dc->base.is_jmp = DISAS_JUMP;
> -        }
> +        dc->base.is_jmp = DISAS_DBRANCH;
> +        return;
>      }
>  
>      /* Force an update if the per-tb cpu state has changed.  */
> @@ -3303,6 +3269,48 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>  
>      cris_evaluate_flags(dc);
>  
> +    /* Evaluate delayed branch destination and fold to another is_jmp case. */
> +    if (is_jmp == DISAS_DBRANCH) {
> +        if (dc->base.tb->flags & 7) {
> +            t_gen_movi_env_TN(dslot, 0);
> +        }
> +
> +        switch (dc->jmp) {
> +        case JMP_DIRECT:
> +            npc = dc->jmp_pc;
> +            is_jmp = DISAS_TOO_MANY;
> +            break;
> +
> +        case JMP_DIRECT_CC:
> +            /*
> +             * Use a conditional branch if either taken or not-taken path
> +             * can use goto_tb.  If neither can, then treat it as indirect.
> +             */
> +            if (likely(!dc->base.singlestep_enabled)
> +                && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
> +                TCGLabel *not_taken = gen_new_label();
> +
> +                tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, not_taken);
> +                gen_goto_tb(dc, 1, dc->jmp_pc);
> +                gen_set_label(not_taken);
> +
> +                /* not-taken case handled below. */
> +                is_jmp = DISAS_TOO_MANY;
> +                break;
> +            }
> +            tcg_gen_movi_tl(env_btarget, dc->jmp_pc);
> +            /* fall through */
> +
> +        case JMP_INDIRECT:
> +            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
> +            is_jmp = DISAS_JUMP;
> +            break;
> +
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +
>      if (unlikely(dc->base.singlestep_enabled)) {
>          switch (is_jmp) {
>          case DISAS_TOO_MANY:
> -- 
> 2.25.1
> 

