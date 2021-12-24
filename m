Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD247F143
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 23:02:15 +0100 (CET)
Received: from localhost ([::1]:52146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0sdi-0006bZ-9b
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 17:02:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0scI-0005qe-6n
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:00:46 -0500
Received: from [2607:f8b0:4864:20::432] (port=43930
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0scG-0003ha-Dn
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:00:45 -0500
Received: by mail-pf1-x432.google.com with SMTP id 196so8558939pfw.10
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 14:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5kn6PMf7F5C4hqbwWIGqIGDJ6njRQTCtUmipMPlGz7Q=;
 b=QLRVcYDE1nIPHjHiCDYNuFKYuuIeyrWPtqA4U03hgCgRJabX1bchRQp9MegMf28Luu
 MmDlZHKFiTcAnwnUIxaroF5N49DYx1etak0hYwOgELmoaVh6OGnr+GuQp7fY+7sN2bt0
 ocgP6h+FJBstZWvIWFHVSaNbxW02+C9RZ8jxYsQVqv00jXOmx1DdKiz9KodQhZQyKY5A
 KaneggTrIHroUcjsF7pgnCkdy7NEtbmqcT+Ghu4b/2xumqs7Wfs5+IucavkvZuRIPsLR
 x9f+mAzxeyfVp62R/VO6XW3PZxNkOCp85/ugsUjCzsNq4fMenOP4H4cgqOzBT/QWCP0p
 wrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5kn6PMf7F5C4hqbwWIGqIGDJ6njRQTCtUmipMPlGz7Q=;
 b=75LRnbF1nsVMFhOeReJcSTp+b7Z/4hOaun7wSFDT4lYjLDlsyLJIw9wVIWVT+R4bG6
 iYIk0A9kFI6YZxNZ6cgrLX4je9MSIdtPv4IY2+IRYzMMeoreK9WXHJFMjw4VF3apWM8K
 88/EA5AHH1QizcUyiCcr3QFEULmHKJSLGU2YFADOOJbA0yIdPjSAHTR1fm4O3Q++WBr1
 6x4yhKmtXE0ALepsqYStiw1XeH4wOOmtkR8iI2N/IpXWypiO3U1ifkapiFL878EZtmWv
 JjjY4JTYN+SUavrCzs3SAr2FdhWf+OpEsVAI4bXZp64DQAKnwHI/60fwg5OYfQRfE05f
 bRRg==
X-Gm-Message-State: AOAM532IP/4WTDzbBZxF4OEeao9xKXepCUoT+sJhC+jZpQgHAcMP66YI
 DOrEM5T3ko8eKNA1bpFGPpB39A==
X-Google-Smtp-Source: ABdhPJyWlkzGanh+fbGmWrpWwuVbG6NsSnwBtAOcdcGSbQY+3KbnRctZih8shbQmjPaFEv7WzE20WA==
X-Received: by 2002:a65:6411:: with SMTP id a17mr7593108pgv.203.1640383242874; 
 Fri, 24 Dec 2021 14:00:42 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id g9sm10166443pfj.123.2021.12.24.14.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 14:00:42 -0800 (PST)
Subject: Re: [PATCH 2/6] target/riscv: add support for unique fpr read/write
 with support for zfinx
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
Date: Fri, 24 Dec 2021 14:00:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 7:49 PM, liweiwei wrote:
> +static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
> +{
> +    if (ctx->ext_zfinx) {
> +        switch (get_ol(ctx)) {
> +        case MXL_RV32:
> +#ifdef TARGET_RISCV32
> +            if (reg_num == 0) {
> +                tcg_gen_concat_i32_i64(t, ctx->zero, ctx->zero);

return tcg_constant_i64(0);
You could hoist this above the switch.

> +                tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], ctx->zero);
tcg_gen_extu_i32_i64 -- though I would think a signed extraction would be more natural, as 
compared with the signed value you'll get from the RV64 case.

> +        case MXL_RV64:
> +            if (reg_num == 0) {
> +                return ctx->zero;
> +            } else {
> +                return cpu_gpr[reg_num];
> +            }
> +#endif
> +        default:
> +            g_assert_not_reached();
> +        }

> +    } else {
> +        return cpu_fpr[reg_num];
> +    }

It is tempting to reverse the sense of the zfinx if, to eliminate this case first, and 
keep the indentation level down.


> +static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
> +{
> +    if (ctx->ext_zfinx) {
> +        switch (get_ol(ctx)) {
> +        case MXL_RV32:
> +            if (reg_num & 1) {
> +                gen_exception_illegal(ctx);
> +                return NULL;

Not keen on checking this here.  It should be done earlier.

> +            } else {
> +#ifdef TARGET_RISCV32
> +                TCGv_i64 t = ftemp_new(ctx);
> +                if (reg_num == 0) {
> +                    tcg_gen_concat_i32_i64(t, ctx->zero, ctx->zero);
> +                } else {
> +                    tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
> +                }
> +                return t;
> +            }
> +#else
> +                if (reg_num == 0) {
> +                    return ctx->zero;
> +                } else {
> +                    TCGv_i64 t = ftemp_new(ctx);
> +                    tcg_gen_deposit_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1], 32, 32);
> +                    return t;
> +                }
> +            }
> +        case MXL_RV64:
> +            if (reg_num == 0) {
> +                return ctx->zero;
> +            } else {
> +                return cpu_gpr[reg_num];
> +            }
> +#endif
> +        default:
> +            g_assert_not_reached();
> +        }
> +    } else {
> +        return cpu_fpr[reg_num];
> +    }

Very similar comments to above.

> +static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
> +{
> +    if (ctx->ext_zfinx) {
> +        if (reg_num != 0) {
> +            switch (get_ol(ctx)) {
> +            case MXL_RV32:
> +                if (reg_num & 1) {
> +                    gen_exception_illegal(ctx);

This is *far* too late to diagnose illegal insn.  You've already modified global state in 
the FPSCR, or have taken an fpu exception in fpu_helper.c.

> +                } else {
> +#ifdef TARGET_RISCV32
> +                    tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
> +                    tcg_gen_extrh_i64_i32(cpu_gpr[reg_num + 1], t);
> +                }

tcg_gen_extr_i64_i32 does both at once.
Never split braces around ifdefs like this.


r~

