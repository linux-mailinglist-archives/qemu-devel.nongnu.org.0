Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477762D759
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovbRX-0000f7-Qr; Thu, 17 Nov 2022 04:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovbRV-0000eU-7s
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:44:21 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovbRH-0000up-AT
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:44:20 -0500
Received: by mail-pl1-x629.google.com with SMTP id w23so1093796ply.12
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 01:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=feICBVa6HzB+NOmpDlu6B2rQruEtQtO389X4Kog/PA8=;
 b=y/MZWLT7ESh0FZJPhW9irKjXMkxE5ET8t+3WC7iqR2LmBBbEZ9xjWJht4669Px1Y+u
 VrlqfpchPsw5mfrtwEFnQJKx9P7uT7m3q0O78T7fWGfZApcMlRRcHvB3lAMWwSCJMrlk
 4oSOIPyacU2AYUZIB1QcSQaCSVTFYYcNCmF5yATB1cVpC1XZI26/n7TboCEun1/OrV2H
 og/ZLNQ0XBjBeTYqkp0xdmaAg2IG2zFfuSA3pwC4lzuGAidj/F2jGeYyY+PmuqVP9oWs
 KlYRX03wubHLf1FV/V1isCDYp0bo0cs1hc3aR+M/C+OlXrD5bCFQKQmoLbghncm3UQQU
 86DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=feICBVa6HzB+NOmpDlu6B2rQruEtQtO389X4Kog/PA8=;
 b=wqH131v/CfrDA45Rz3Y3aofkKeskarMKv7nmGIkSwQF2SYWgvNBftZwmz2iePON2uX
 tGbOZy1Cjxdxdqik2JGEXxPc+FSwNJQomT/rnZOSkhqy0IfaAlastjOl3wutbMxIViv9
 vzM+MVbqjXaPVOjAc5fARjRoNlxlMqli/q64qo2nV2P8t1iX+iB4ZPdlDxGl4USbRdT8
 UsUWTToBlTfh59W8uR6+QYCs5CZT+Shj0BwUZ7YJJB0kf2UZ53gJ7+ArWuacpMT5sn5z
 nRdZsob+lGrRtCqjBqp8+VlIGJLdnDrtfjn2m/rvrTNY1MF+9+nL34Tvi1n4Tv+FcVPZ
 Lo4w==
X-Gm-Message-State: ANoB5pkZb1eidD9quBO9tV5BwQTnUMl8u23qtqMx2AdvKD1X15psPg5i
 TxVcXD6LaQZX5pSpIwDX9J9KPQ==
X-Google-Smtp-Source: AA0mqf6VDmDc0/WcSIQJ1VlhgmaxZjg8EviInt1PYZHq12iTZaoHctbNZFjZ36D07xha1f2MoRO/bw==
X-Received: by 2002:a17:903:3304:b0:186:61fd:7446 with SMTP id
 jk4-20020a170903330400b0018661fd7446mr1886054plb.150.1668678245580; 
 Thu, 17 Nov 2022 01:44:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 e9-20020aa79809000000b0056c349f5c70sm651124pfl.79.2022.11.17.01.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 01:44:05 -0800 (PST)
Message-ID: <97ceaca3-109e-ba04-30b2-c7f55c6ed422@linaro.org>
Date: Thu, 17 Nov 2022 01:44:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/9] target/riscv: add support for Zcmp extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/16/22 23:03, Weiwei Li wrote:
> Add encode, trans* functions for Zcmp instructions
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode                |  18 ++
>   target/riscv/insn_trans/trans_rvzce.c.inc | 242 +++++++++++++++++++++-
>   target/riscv/translate.c                  |   5 +
>   3 files changed, 264 insertions(+), 1 deletion(-)

Better, though...

> +static bool gen_zcmp_check(DisasContext *ctx, arg_zcmp *a)
> +{
> +    /* rlist 0 to 3 are reserved for future EABI variant */
> +    if (a->zcmp_rlist < 4) {
> +        return false;
> +    }
> +
> +    /* rlist <= 6 when RV32E/RV64E */
> +    if (ctx->cfg_ptr->ext_e && a->zcmp_rlist > 6) {
> +        return false;
> +    }
> +
> +    return true;
> +}

This could be merged into...

> +
> +#define X_S0    8
> +#define X_S1    9
> +#define X_Sn    16
> +
> +static inline void update_push_pop_list(target_ulong rlist, bool *xreg_list)

... here.

For instance, one way is to return false when the list is invalid.
Better is to return a uint32_t bitmap of the registers in the list, with 0 indicating invalid.

Nit 1: Remove the inline.
Nit 2: A better name might be decode_push_pop_list.

> +static inline target_ulong caculate_stack_adj(int bytes, target_ulong rlist,
> +                                              target_ulong spimm)
> +{
> +    target_ulong stack_adj_base = 0;
> +    switch (rlist) {
> +    case 15:
> +        stack_adj_base = bytes == 4 ? 64 : 112;
> +        break;
> +    case 14:
> +        stack_adj_base = bytes == 4 ? 48 : 96;
> +        break;
> +    case 13:
> +    case 12:
> +        stack_adj_base = bytes == 4 ? 48 : 80;
> +        break;
> +    case 11:
> +    case 10:
> +        stack_adj_base = bytes == 4 ? 32 : 64;
> +        break;
> +    case 9:
> +    case 8:
> +        stack_adj_base = bytes == 4 ? 32 : 48;
> +        break;
> +    case 7:
> +    case 6:
> +        stack_adj_base = bytes == 4 ? 16 : 32;
> +        break;
> +    case 5:
> +    case 4:
> +        stack_adj_base = 16;
> +        break;
> +    }

I really dislike this, as it replicates the decoding done just above.
I think this ought to be simply:

     ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) + spimm


> +static bool gen_pop(DisasContext *ctx, arg_zcmp *a, bool ret, bool ret_val)
> +{
> +    REQUIRE_ZCMP(ctx);
> +
> +    if (!gen_zcmp_check(ctx, a)) {
> +        return false;
> +    }
> +
> +    bool xreg_list[32] = {false};
> +    int bytes = get_ol(ctx) == MXL_RV32 ? 4 : 8;

Better with

     MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TEUL : MO_TEUQ;
     int reg_size = memop_size(memop);

> +            switch (bytes) {
> +            case 4:
> +                tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, MO_32);
> +                break;
> +            case 8:
> +                tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, MO_64);
> +                break;
> +            default:
> +                break;
> +            }

These are incorrect in that they do not indicate the target endianness.
Better to merge the two using the common memop computed above:

     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);

> +static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
> +{
> +    REQUIRE_ZCMP(ctx);
> +
> +    TCGv a0 = get_gpr(ctx, xA0, EXT_NONE);
> +    TCGv a1 = get_gpr(ctx, xA1, EXT_NONE);
> +
> +    gen_set_gpr(ctx, a->rs1, a0);
> +    gen_set_gpr(ctx, a->rs2, a1);

rs1 must not equal rs2.


r~

