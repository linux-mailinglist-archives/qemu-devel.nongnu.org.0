Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140E3E1E85
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:18:15 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlgs-0002Kv-Am
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBlfz-0001eq-0G
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:17:19 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBlfx-0005aD-5G
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:17:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id nh14so12416995pjb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 15:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KqCkH3tgZRA7AcC7ENRyfj5iXPhzk9y5YCjpKSv8Fik=;
 b=CPaBgUXnw5OhZubUqHvRV+e9JR5vTiw3pWKwZfHC15y3KOa6Pto0NfNGuRymgRPxtj
 u867dnQ41fSKmJKHktqoXuv0v7M+0G4HjmFNiT1D+lCmJgWXUtRYyD+VMhfhCPNE6KiS
 Tux4eNUC/BPdKx8MRrLBxjeMrzQd7hXHa05/d1uaDnACkzWGuBPzKcpFwY/BIs936NNn
 x0zRBYK33+ZCJfRUD1K087YlB0Qkrwz0yOJ7cKX9S2pDI1alp3cJzgWRenPQzzjgJV33
 zq7iN3YYwAjW7IuPjGLbN3sa/Mkx7cVBSwnpSgXu39wF0msdi4F9AtsOYyNrEsxbdSIQ
 YFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KqCkH3tgZRA7AcC7ENRyfj5iXPhzk9y5YCjpKSv8Fik=;
 b=XAeelqDiwyM69cER2hCzn30VKe3ZO3Ed2oE3yo5YZqOwqhugTAzeLJ/sP++BZ/56Ok
 F0CSR3SJMgbruCFxJMbcVxHNEMb3cZsacqkmyl1xcfMauuXk+GfoZbjJ5fJf0qHGQxcL
 Hb6tVwh/BVtIZ1R8ZO+Hylv/VmhCZfKPazqYTmvE09zTPJLx/+VeTbEnTwRmNiTx1Nnm
 0lWpg4i0cq/ZraWK3cMvKy02bGUcRds/Sx99zNCuLjH4sMnY6iworWP0G5GiHm+GPa8R
 Q/5pfbjNz2OMUID76pBdN64sMDc7Cs0P+qNESSJSlIF3fDNerIRYbGQzUHvw2NgZsAra
 7KuA==
X-Gm-Message-State: AOAM5302fnWKxPgcczsvaSZZii2YW9BjqbUdhvvHes/q5IcLWn6JWMe9
 dtYak5BDAWSK4pPfLS6RZ1LoexhP6UfIgg==
X-Google-Smtp-Source: ABdhPJwVwW1NVjKl1nKzIHkPI0C2+sDWn++jFnkUSHfGW2RmyfxgShVoDd3MK+eUCELudrSrpnsVow==
X-Received: by 2002:a65:6493:: with SMTP id e19mr2701596pgv.218.1628201834238; 
 Thu, 05 Aug 2021 15:17:14 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d2sm9409815pgk.57.2021.08.05.15.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 15:17:13 -0700 (PDT)
Subject: Re: [RFC PATCH 05/13] target/riscv: Support UXL32 for shift
 instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78383182-7c74-72dc-7bf6-e45c54b97a7e@linaro.org>
Date: Thu, 5 Aug 2021 12:17:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>   static bool trans_srli(DisasContext *ctx, arg_srli *a)
>   {
> +    if (ctx->uxl32) {
> +        return trans_srliw(ctx, a);
> +    }
>       return gen_shifti(ctx, a, tcg_gen_shr_tl);
>   }

First, trans_srliw begins with REQUIRE_64BIT, which *should* fail when RV32 is in effect. 
  This means there's a missing change to is_32bit().

Second, the current decode for srli allows 7 bits of shift, while srilw only allows 5.  As 
a consequence, gen_shifti contains a check for TARGET_LONG_BITS and trans_srliw does not 
contain a check at all.  We need to diagnose an out-of-range shift for RV32 somewhere.

I recommend extending the gen_shift* family of helpers.

static bool gen_shifti_imm(DisasContext *ctx, arg_shift *a, int width,
                            void (*func)(TCGv, TCGv, target_long))
{
     TCGv dest, src1;

     if (a->shamt >= width) {
         return false;
     }
     dest = gpr_dst(ctx, a->rd);
     src1 = gpr_src(ctx, a->rs1);
     func(dest, src1, a->shamt);
     return true;
}

static bool gen_shifti(DisasContext *ctx, arg_shift *a, int width,
                        void (*func)(TCGv, TCGv, TCGv))
{...}

static void gen_srliw(TCGv dest, TCGv src1, target_long shamt)
{
     tcg_gen_extract_tl(dest, src1, shamt, 32 - shamt);
     tcg_gen_ext32s_tl(dest, dest);
}

static bool trans_srliw(DisasContext *ctx, arg_shift *a)
{
     REQUIRE_64BIT(ctx);
     return gen_shifti_imm(ctx, a, 32, gen_srliw);
}

static bool trans_srli(DisasContext *ctx, arg_shift *a)
{
     int xlen = is_32bit(ctx) ? 32 : 64;
     return gen_shifti_imm(ctx, a, xlen,
                           xlen == TARGET_LONG_BITS
                           ? tcg_gen_shri_tl : gen_srliw);
}

etc.  Perhaps that is_32bit() check above could be consolidated into some macro/inline.


r~

