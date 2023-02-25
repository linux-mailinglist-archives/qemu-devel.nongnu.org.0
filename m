Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C66A2918
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrsL-00061q-5L; Sat, 25 Feb 2023 05:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrsF-0005vO-I0
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:33:51 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrs9-0001Su-L9
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:33:47 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-172b0ba97b0so2416557fac.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nStfNo55gbgJ1TtVdCf4wvXnTas1uEWK/T8mJhQUSks=;
 b=cAHra1IiS9m0t53v7x1zB/wFKcZWe/U3zNqReljZGrXujym2VbTJGDxfzzX3JywCM/
 5lFuxSD8CradGcoorsOBNtp4omhyyIjojQe3AiMpnm9+/GiIYHWLny4LUdfZm1IwQsmt
 iOuDYhFjYqoWJHRcqShMJkCgAasViXiEL9KDe8dIZJGhUdOx885yf41ChDwBIMIEOPUM
 ra1IoBHVig0XCddXwxNCRS6tX6WJ1VATJGws0qp5FOHpTaLqBT32/3B26xc3c3BQd3Nw
 U73bo/tnsANeRAGZxiApfBkAVck6YUp1FKaX27+XPUVS2TQVk8lQerjdPJQXK0QX3mnq
 6c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nStfNo55gbgJ1TtVdCf4wvXnTas1uEWK/T8mJhQUSks=;
 b=6Q3UZeDhMj+ovB960k2DE1/rrPzdXtLnRTS7xLt2PBZsBf/mtYfN+2XXtzUYe1FkdK
 ZQkErTLYRESzKPwCuLHTEGof3Pfghxu9lFKhmF8U60a892SXkChjv4d4Te1S+A86w5jz
 UcFAsN6yj7JqKtx7TEPwVaA6Nk6EFj9OMQOUPT6rPgVybamjQ1pyDLFvUP6qdBaEz9Nr
 JEkbc2o2tu29jMFqW3Ow95Q6C2Kyk+8saVopyOccBmqNZn9rqve7y/7F0URz5GERaLQG
 +N45igZsWCOCj4UPBB+FyVHhaDD52CA+ouDZES/INh+19ykD0Ut1/JkrwJY0OkaxhKMd
 p04Q==
X-Gm-Message-State: AO0yUKWZXCcF86ZKPtZNwDVemfaDgvavHb55NxIEanprZ8ypDQsnynFU
 08bp0sDvymW76YV6vvcWV8kvmw==
X-Google-Smtp-Source: AK7set/8gk1I2DkdFvha/DW/4m2MbCGXVL8NHJu+JiTkMoM3IxLlGiQENe6kvCWdopj5HHFi5JZCKg==
X-Received: by 2002:a05:6870:d205:b0:172:a2e9:cbe8 with SMTP id
 g5-20020a056870d20500b00172a2e9cbe8mr2884882oac.18.1677321223848; 
 Sat, 25 Feb 2023 02:33:43 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056830140200b006864b5f4650sm489424otp.46.2023.02.25.02.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:33:43 -0800 (PST)
Message-ID: <5f589147-8796-4c8c-3d41-60b08781bb47@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:33:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 52/76] target/riscv: Drop temp_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-53-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/25/23 06:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c                  | 30 +++++------------------
>   target/riscv/insn_trans/trans_rvzfh.c.inc |  2 +-
>   2 files changed, 7 insertions(+), 25 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 273e566d66..b5d8080a6f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -101,11 +101,8 @@ typedef struct DisasContext {
>       bool cfg_vta_all_1s;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
> -    uint8_t ntemp;
>       CPUState *cs;
>       TCGv zero;
> -    /* Space for 3 operands plus 1 extra for address computation. */
> -    TCGv temp[4];
>       /* PointerMasking extension */
>       bool pm_mask_enabled;
>       bool pm_base_enabled;
> @@ -312,12 +309,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>    *
>    * Further, we may provide an extension for word operations.
>    */
> -static TCGv temp_new(DisasContext *ctx)
> -{
> -    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
> -    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
> -}
> -
>   static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
>   {
>       TCGv t;
> @@ -332,11 +323,11 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
>           case EXT_NONE:
>               break;
>           case EXT_SIGN:
> -            t = temp_new(ctx);
> +            t = tcg_temp_new();
>               tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
>               return t;
>           case EXT_ZERO:
> -            t = temp_new(ctx);
> +            t = tcg_temp_new();
>               tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
>               return t;
>           default:
> @@ -364,7 +355,7 @@ static TCGv get_gprh(DisasContext *ctx, int reg_num)
>   static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>   {
>       if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
> -        return temp_new(ctx);
> +        return tcg_temp_new();
>       }
>       return cpu_gpr[reg_num];
>   }
> @@ -372,7 +363,7 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>   static TCGv dest_gprh(DisasContext *ctx, int reg_num)
>   {
>       if (reg_num == 0) {
> -        return temp_new(ctx);
> +        return tcg_temp_new();
>       }
>       return cpu_gprh[reg_num];
>   }
> @@ -575,7 +566,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   /* Compute a canonical address from a register plus offset. */
>   static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>   {
> -    TCGv addr = temp_new(ctx);
> +    TCGv addr = tcg_temp_new();
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_addi_tl(addr, src1, imm);
> @@ -593,7 +584,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>   /* Compute a canonical address from a register plus reg offset. */
>   static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>   {
> -    TCGv addr = temp_new(ctx);
> +    TCGv addr = tcg_temp_new();
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_add_tl(addr, src1, offs);
> @@ -1196,8 +1187,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->misa_mxl_max = env->misa_mxl_max;
>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>       ctx->cs = cs;
> -    ctx->ntemp = 0;
> -    memset(ctx->temp, 0, sizeof(ctx->temp));
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> @@ -1222,18 +1211,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>       CPURISCVState *env = cpu->env_ptr;
>       uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
> -    int i;
>   
>       ctx->ol = ctx->xl;
>       decode_opc(env, ctx, opcode16);
>       ctx->base.pc_next = ctx->pc_succ_insn;
>   
> -    for (i = ctx->ntemp - 1; i >= 0; --i) {
> -        tcg_temp_free(ctx->temp[i]);
> -        ctx->temp[i] = NULL;
> -    }
> -    ctx->ntemp = 0;
> -
>       /* Only the first insn within a TB is allowed to cross a page boundary. */
>       if (ctx->base.is_jmp == DISAS_NEXT) {
>           if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 2ad5716312..5024e6ecab 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -52,7 +52,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>       decode_save_opc(ctx);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>       if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> +        TCGv temp = tcg_temp_new();
>           tcg_gen_addi_tl(temp, t0, a->imm);
>           t0 = temp;
>       }

