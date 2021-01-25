Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E493302369
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:57:34 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ycn-0003yL-6O
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l3yZx-0002cn-S6
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:54:37 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:53776 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l3yZv-0006iZ-OY
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:54:37 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 562F3415F6;
 Mon, 25 Jan 2021 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1611568470; x=1613382871; bh=BA0ptQ+qYqHfDVjvA6ykIK
 C/mkaa0xsk0XsetCEHQvo=; b=BzrVDiU26kdp7ds0RAMefMLNjUONz6xqfAEjON
 +qZoqqFDBBL02EsowbzIC+8khu+DR9zwlmYE5hC4W9lVVaxlLoCArUpd3IuZUpXd
 lRw3Lf8Fxb3/e+fWeUvlnKJpBagMlDHbc1oUMjOi2mSxIgaeaXGPAPTgIbsyH5bn
 JGjJs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAz_XXWccmTL; Mon, 25 Jan 2021 12:54:30 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A7F71415EC;
 Mon, 25 Jan 2021 12:15:20 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 25
 Jan 2021 12:15:20 +0300
Date: Mon, 25 Jan 2021 12:15:19 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL v2 10/10] tcg: Restart code generation when we run out of
 temps
Message-ID: <YA6MJ1r+GRUXvVQJ@SPB-NB-133.local>
References: <20210124181122.5447-1-richard.henderson@linaro.org>
 <20210124181122.5447-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210124181122.5447-2-richard.henderson@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 24, 2021 at 08:11:22AM -1000, Richard Henderson wrote:
> Some large translation blocks can generate so many unique
> constants that we run out of temps to hold them.  In this
> case, longjmp back to the start of code generation and
> restart with a smaller translation block.
> 
> Buglink: https://bugs.launchpad.net/bugs/1912065
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h         |  3 +++
>  accel/tcg/translate-all.c | 15 ++++++++++++++-
>  tcg/tcg.c                 | 11 ++++++++---
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index c5a9d65d5f..0f0695e90d 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -680,6 +680,9 @@ struct TCGContext {
>  
>      uint16_t gen_insn_end_off[TCG_MAX_INSNS];
>      target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
> +
> +    /* Exit to translator on overflow. */
> +    sigjmp_buf jmp_trans;
>  };
>  
>  static inline bool temp_readonly(TCGTemp *ts)
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index d09c187e0f..81d4c83f22 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1926,11 +1926,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      ti = profile_getclock();
>  #endif
>  
> +    gen_code_size = sigsetjmp(tcg_ctx->jmp_trans, 0);
> +    if (unlikely(gen_code_size != 0)) {
> +        goto error_return;
> +    }
> +
>      tcg_func_start(tcg_ctx);
>  
>      tcg_ctx->cpu = env_cpu(env);
>      gen_intermediate_code(cpu, tb, max_insns);
>      tcg_ctx->cpu = NULL;
> +    max_insns = tb->icount;
>  
>      trace_translate_block(tb, tb->pc, tb->tc.ptr);
>  
> @@ -1955,6 +1961,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  
>      gen_code_size = tcg_gen_code(tcg_ctx, tb);
>      if (unlikely(gen_code_size < 0)) {
> + error_return:
>          switch (gen_code_size) {
>          case -1:
>              /*
> @@ -1966,6 +1973,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>               * flush the TBs, allocate a new TB, re-initialize it per
>               * above, and re-do the actual code generation.
>               */
> +            qemu_log_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT,
> +                          "Restarting code generation for "
> +                          "code_gen_buffer overflow\n");
>              goto buffer_overflow;
>  
>          case -2:
> @@ -1978,9 +1988,12 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>               * Try again with half as many insns as we attempted this time.
>               * If a single insn overflows, there's a bug somewhere...
>               */
> -            max_insns = tb->icount;
>              assert(max_insns > 1);
>              max_insns /= 2;
> +            qemu_log_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT,
> +                          "Restarting code generation with "
> +                          "smaller translation block (max %d insns)\n",
> +                          max_insns);
>              goto tb_overflow;
>  
>          default:
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 67b08f708d..9e1b0d73c7 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1205,18 +1205,23 @@ void tcg_func_start(TCGContext *s)
>      QSIMPLEQ_INIT(&s->labels);
>  }
>  
> -static inline TCGTemp *tcg_temp_alloc(TCGContext *s)
> +static TCGTemp *tcg_temp_alloc(TCGContext *s)
>  {
>      int n = s->nb_temps++;
> -    tcg_debug_assert(n < TCG_MAX_TEMPS);
> +
> +    if (n >= TCG_MAX_TEMPS) {
> +        /* Signal overflow, starting over with fewer guest insns. */
> +        siglongjmp(s->jmp_trans, -2);
> +    }
>      return memset(&s->temps[n], 0, sizeof(TCGTemp));
>  }
>  
> -static inline TCGTemp *tcg_global_alloc(TCGContext *s)
> +static TCGTemp *tcg_global_alloc(TCGContext *s)
>  {
>      TCGTemp *ts;
>  
>      tcg_debug_assert(s->nb_globals == s->nb_temps);
> +    tcg_debug_assert(s->nb_globals < TCG_MAX_TEMPS);
>      s->nb_globals++;
>      ts = tcg_temp_alloc(s);
>      ts->kind = TEMP_GLOBAL;
> -- 
> 2.25.1
> 
> 

Hi Richard,

Thanks for providing the fix.

Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Regards,
Roman

