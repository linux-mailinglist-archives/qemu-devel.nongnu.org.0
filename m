Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEA503220
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 03:06:51 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfWtm-00007R-Bc
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 21:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfWrQ-0006oF-6E
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 21:04:24 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfWrM-0005p7-L3
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 21:04:23 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso12903273pjb.5
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cnZbKC/kzqTc4WboWjp/P2hJd7CS9+C6Hw072Iqa1tM=;
 b=KWFW/8MzPMYjO5z2yP2K6bupd05xZ+cudzxVuh9ASdrt9gsCp2fgbLeBzSpVMASOdd
 MJKOwHDdCOLGtTM6J/Nn5BitQAU6TU45kRZH3oo3i5o5IoV1GIoUvhTsKfrpsVXiEGuU
 CG+BOAQkwhD0T0+IJsbddEA4EdViJA7fjZKohgYdrM9brpPl1vBX0IrSsWeZ06Zw0KeA
 ZgMr7JyV9xhOJWcbLlFiNKb0irepOW/pPlIybeMbuPgiCecwj4zjZQlnOwEJihWWrTu+
 t98/D0flE09Y1U0F7Is611Iwr+hUbTHJtcAA+B8ompdkslGHT+98dPE8Vmexiz3T/VVc
 UjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cnZbKC/kzqTc4WboWjp/P2hJd7CS9+C6Hw072Iqa1tM=;
 b=sfOv2n7mOyoMU5+InC2HlnXg3rzlYGPhdJRp1oKQ+dz1rbeCk/o9b2tj+RdoQZxhu8
 088dUDwBlKRgdAnQSKy0myaR84yhEGEHscmfMNGAsi6uLrGUgfMI3nQWAWZ9Lnsnd+Ul
 0co16V/C71LUbPlsrwU/nsu8cXquQNgWwtOX/54MJ73HSPS1OEhIRxkAacGsVnvcs2an
 2QOZ03YXHFnRiVw7vrnxIZz8Z6/NZpcwtXUKQ/In24lDrF9Cut3fxISOHSyELpgZmXMX
 yMhoQp7pfhvxwS0jiQICh9szVp0gptYeWTXEzBH+bmAvc1OETYQBTmz2xIfsV8bkqkbD
 NvNQ==
X-Gm-Message-State: AOAM532f4GU4vZJG8j5vdTimLTX5Vbzyv9lW1qdJsr1ov4960nr2+kYu
 Z7yNftnfsR/LS0+ydMkLvTY1tQ==
X-Google-Smtp-Source: ABdhPJyylSJddcGyCg5UwY+vospnlXSZHkyLnSzLUvqEABN8NN7Ngk0M9EFl36KDJvO0ygG4NaL+cQ==
X-Received: by 2002:a17:902:7d81:b0:14f:e18b:2b9e with SMTP id
 a1-20020a1709027d8100b0014fe18b2b9emr1544924plm.160.1650071058860; 
 Fri, 15 Apr 2022 18:04:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm4093610pfh.84.2022.04.15.18.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 18:04:18 -0700 (PDT)
Message-ID: <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
Date: Fri, 15 Apr 2022 18:04:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +int cpu_csr_offset(unsigned csr_num);
...
> +static const uint64_t csr_offsets[] = {

There's no reason for this array to be uint64_t.
It really should match the function.

> +target_ulong helper_csrwr_estat(CPULoongArchState *env, target_ulong val)
> +{
> +    int64_t old_v = env->CSR_ESTAT;
> +
> +    /* Only IS[1:0] can be written */
> +    env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, IS, val & 0x3);
> +
> +    return old_v;
> +}

This is incorrect.  You're writing to all 13 bits of ESTAT.IS with the low 2 bits of val 
-- i.e. clearing bits [12:2].

You want to use: env->CSR_ESTAT = deposit64(env->CSR_ESTAT, 0, 2, val);

> +target_ulong helper_csrwr_asid(CPULoongArchState *env, target_ulong val)
> +{
> +    int64_t old_v = env->CSR_ASID;
> +
> +    /* Only ASID filed of CSR_ASID can be written */
> +    env->CSR_ASID = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID,
> +                               val & R_CSR_ASID_ASID_MASK);

You do not need to mask the 4th argument of FIELD_DP64 -- that happens as part of the 
deposit operation.

> +    if (old_v != val) {
> +        tlb_flush(env_cpu(env));
> +    }

You shouldn't be comparing val to old_v, but old_v to the updated CSR_ASID.

> +void  helper_csr_update(CPULoongArchState *env, target_ulong new_val,
> +                        target_ulong csr_offset)
> +{
> +    uint64_t *csr = (void *)env + csr_offset;
> +
> +    *csr = new_val;
> +}

This function should not exist.


> +static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
> +                         const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, %d", a->rd, a->csr);
> +}
> +
> +static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
> +                          const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, r%d, %d", a->rd, a->rj, a->csr);
> +}

While this is fine, it would be nicer to print the name of CSR, when valid.

> +static void gen_disas_exit(DisasContext *ctx)
> +{
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +    ctx->base.is_jmp = DISAS_EXIT;
> +}

Why this function, and not simply place the movi in loongarch_tr_tb_stop too?
Or even just put the tcg_gen_exit_tb() here, and set DISAS_NORETURN.
I would say: one way or the other but not this mix...

> +static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +
> +    unsigned csr_offset = cpu_csr_offset(a->csr);

This is incorrect -- csr_offset must be signed, 'int', to match cpu_csr_offset and the 
single negative value that exists within (CPUID).

> +static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
> +
> +    if (check_plv(ctx) || ro_csr(a->csr)) {
> +        return false;
> +    }
> +
> +    unsigned csr_offset = cpu_csr_offset(a->csr);

Again, 'int'.

> +    if (csr_offset == 0) {
> +        /* CSR is undefined: write ignored. */
> +        return true;
> +    }
> +
> +    switch (a->csr) {
> +    case LOONGARCH_CSR_ESTAT:
> +        gen_helper_csrwr_estat(dest, cpu_env, src1);
> +        break;
> +    case LOONGARCH_CSR_ASID:
> +        gen_helper_csrwr_asid(dest, cpu_env, src1);
> +        gen_disas_exit(ctx);
> +        break;
> +    case LOONGARCH_CSR_TCFG:
> +        gen_helper_csrwr_tcfg(dest, cpu_env, src1);
> +        break;
> +    case LOONGARCH_CSR_TICLR:
> +        gen_helper_csrwr_ticlr(dest, cpu_env, src1);
> +        break;
> +    default:
> +        {
> +            TCGv temp = tcg_temp_new();
> +            tcg_gen_ld_tl(temp, cpu_env, csr_offset);
> +            tcg_gen_st_tl(src1, cpu_env, csr_offset);
> +            tcg_gen_mov_tl(dest, temp);
> +            tcg_temp_free(temp);
> +
> +            /* Cpu state may be changed, need exit */
> +            if ((a->csr == LOONGARCH_CSR_CRMD) ||
> +                (a->csr == LOONGARCH_CSR_EUEN)) {
> +                gen_disas_exit(ctx);
> +            }
> +        }
> +    }

I said before that you needed to split out the body of this function for re-use by csrxchg.

> +    tcg_gen_not_tl(t1, mask);
> +    tcg_gen_and_tl(t1, old_val, t1);

This is tcg_gen_andc_t1 (t1, old_val, mask).

> +    switch (a->csr) {
> +    case LOONGARCH_CSR_ESTAT:
> +        gen_helper_csrwr_estat(dest, cpu_env, new_val);
> +        break;
> +    case LOONGARCH_CSR_ASID:
> +        gen_helper_csrwr_asid(dest, cpu_env, new_val);
> +        break;
> +    case LOONGARCH_CSR_TCFG:
> +        gen_helper_csrwr_tcfg(dest, cpu_env, new_val);
> +        break;
> +    case LOONGARCH_CSR_TICLR:
> +        gen_helper_csrwr_ticlr(dest, cpu_env, new_val);
> +        break;
> +    default:
> +        tcg_gen_mov_tl(dest, old_val);
> +    }
> +
> +    gen_helper_csr_update(cpu_env, new_val, tcg_constant_tl(csr_offset));

Note that helper_csr_update is nothing more than the store to csr_offset.

> +
> +    if ((a->csr == LOONGARCH_CSR_ASID) || (a->csr == LOONGARCH_CSR_CRMD) ||
> +        (a->csr == LOONGARCH_CSR_EUEN)) {
> +        gen_disas_exit(ctx);
> +    }

Note that this list does not match the list in trans_csrwr.  This is *exactly* why I said 
that you should split out a function for use between csrwr and csrxchg.



r~

