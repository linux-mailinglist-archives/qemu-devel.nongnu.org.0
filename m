Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A66CEF53
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:27:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYdn-0002R2-LC; Wed, 29 Mar 2023 12:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYdg-0002Q8-Ox
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:27:09 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phYde-0001LJ-6P
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:27:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id l7so14542691pjg.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680107224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6hcjGeFwyWzDQBXrN7UOz6rgEZeLPt8WlZcS1gj1tKY=;
 b=HOvmvsju4g/vSq62A9HjW8ejL7pmYzZ9dLaxg8hBFsyK5014WiXwuYr13jLVrIb00M
 lNJ1Q/p5RYwmmJTvl11rtFxyoIT227nFQ7HD+bSAi9/evua1SpXwKPpIti2v9qsYC3IR
 25LK/AJpDLGvbP0t+q4YQHIwrgTrMYBVUZb5T2rBantIY50TrJvJ/fj1qVuh0xQexjxJ
 Y/W1fX04sDSyUT0K0QKIAFzfoz1+UYHDT50ZVXzfhgdATZPyjm1MQ4bcNmwltWY1Vt67
 KwN9Q17tMCDoHGkyAbBNFksKSc/d23bEr1PSqAgplRsnTgsCYcWg1F97YZguIvqigW05
 esqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6hcjGeFwyWzDQBXrN7UOz6rgEZeLPt8WlZcS1gj1tKY=;
 b=W89gi050e4EKYaov2tZckruJQb7iSw3f0YTPjHME7y63bsFZ/wFxukLrjDXWb6l6a2
 XGS/INWI5vcnIdlnxgxFQk3/lGp3VFXPPRglNNktmLBtHckwyk5Qyx/MPd/wOyu0jza3
 7dk5TOhgEPYCl6itNMznS5S6wIWz8NAcgXBSzpn2CHU37cnYnroe3P65G0JlddiQ/EzC
 o+fpvm/WSHCHonjbiMRRauhq1mmH1vWshf7+ts7a62ygmxlHg2AXDmLVA/d89u9Y55kn
 gTGUCoZvm1kyGz+1NLSQIra6O5W2kQCYTUvI0O0qluIbpgcj5tWja4361BoG7YJKyFcZ
 OaGw==
X-Gm-Message-State: AAQBX9efNoEq5lOz7hYG7BMz4Vz98ZOek8OwEzq9apnV805VzlNqVPEo
 ezig2YUVLiV2Cs5oUW733bq1TA==
X-Google-Smtp-Source: AKy350aWo19WWERVM/sXvt2mJy4TQamql8THq1NzSD1oxaBjt7dmfMNEEsx+6yD+zPlgM2sZiWVV2Q==
X-Received: by 2002:a17:903:22cb:b0:1a1:b174:8363 with SMTP id
 y11-20020a17090322cb00b001a1b1748363mr24206700plg.59.1680107224345; 
 Wed, 29 Mar 2023 09:27:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1709027c0800b001a258041049sm4700633pll.32.2023.03.29.09.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:27:03 -0700 (PDT)
Message-ID: <08b81942-a356-51c2-9de1-6e057a2ca8b1@linaro.org>
Date: Wed, 29 Mar 2023 09:27:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/5] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230329032346.55185-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/28/23 20:23, Weiwei Li wrote:
>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>   {
> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> +    assert(ctx->pc_save != -1);
> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +        TCGv target_pc = tcg_temp_new();

dest_gpr(s, a->rd)

> @@ -51,26 +59,43 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
>   static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>   {
>       TCGLabel *misaligned = NULL;
> +    TCGv succ_pc = tcg_temp_new();

succ_pc can by null for !CF_PCREL...

> +    TCGv target_pc = tcg_temp_new();
> +
> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - ctx->pc_save);
> +    }

... or initialized like

        } else {
            succ_pc = tcg_constant_tl(ctx->pc_succ_insn);
        }

> -    gen_set_pc(ctx, cpu_pc);
>       if (!has_ext(ctx, RVC)) {
>           TCGv t0 = tcg_temp_new();
>   
>           misaligned = gen_new_label();
> -        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
> +        tcg_gen_andi_tl(t0, target_pc, 0x2);
>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>       }
...
>       if (misaligned) {
>           gen_set_label(misaligned);
> -        gen_exception_inst_addr_mis(ctx);
> +        gen_exception_inst_addr_mis(ctx, target_pc);
>       }

This is what I expected from patch 3: cpu_pc is unchanged, with the new (incorrect) 
address passed to inst_addr_mis for assigning to badaddr.  Bug being fixed here, thus 
should really be a separate patch.

> @@ -172,7 +197,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>       if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>           /* misaligned */
>           gen_set_pc_imm(ctx, ctx->base.pc_next + a->imm);
> -        gen_exception_inst_addr_mis(ctx);
> +        gen_exception_inst_addr_mis(ctx, cpu_pc);

But this one's different and (probably) incorrect.

> @@ -552,13 +567,21 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>       if (!has_ext(ctx, RVC)) {
>           if ((next_pc & 0x3) != 0) {
>               gen_set_pc_imm(ctx, next_pc);
> -            gen_exception_inst_addr_mis(ctx);
> +            gen_exception_inst_addr_mis(ctx, cpu_pc);

Likewise.

> +    assert(ctx->pc_save != -1);
> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +        TCGv succ_pc = tcg_temp_new();
> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - ctx->pc_save);
> +        gen_set_gpr(ctx, rd, succ_pc);

dest_gpr.



r~

