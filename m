Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48B35EB83
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:44:14 +0200 (CEST)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWWRo-0007aU-SK
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWWQg-0006pE-51
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:43:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWWQZ-0006TV-OT
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:43:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id y32so13428673pga.11
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c/tBvia8P/03mauYxwyqqRkZjBzU6AlZVSqci8pjtIw=;
 b=LU414c1uq8ncezuAoCCNwu4tlmlymjo4oKkbx08RPD+uEYjvI0oyw5LXdGcWBeMlzR
 scv5kxUwMBdU1gmMxOm5CeFjGfZSmKRM7n9TvV6kIxDDLRb1a727tK/uC4dqYNy/duvs
 rVkG3gAHn+a9yLo2iOagiZq/XQf6WkbNV7ns/inlDt5v4uA6Kip+c3pDwbQkgk1I0LoQ
 V7tRokRV+4AfK9ejLGicKwyIp5Chl173bPtYrJLvz4NKLtvlbFScmDe4DfIPQJq7+o/Z
 HdJILypqCtzWWJy7ow/I+GEzxBhZHFFfsrR+4GTzBIzEjgUr/whyIpGSSBZo2pU45/4f
 7Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/tBvia8P/03mauYxwyqqRkZjBzU6AlZVSqci8pjtIw=;
 b=szyKG8M2CXhZyAskcz5qg3Lb025CU0Jwwcndq/3I8QVIs3SZbOVOrUEXOCeVEXfXFp
 g+64vDDgw7iV/LnHPLEozC1JPf1tgOoa5JpvDDB/j64qb55Iwrb8dbcioIUNPzXFC6NG
 UD6+3hIjChbPBSvgNwlqQoLvGOtQZqYC7fz1hSnDZmRpWGYR7PrY4H8lsf+Lyz/oBqjn
 RDQZyoLNVhiOgvOiCmSv1h6CKjrj+lVWdKTr8AHOrC1pK0mpnANgNQsi3P40DpaawWBA
 KR+/HRbrrlgX1JspLDbHUqYrAwSzjk/m0/RtcyfWQlM8VAVe1SyY5zdWqA4ugoN9Sbg7
 J9gw==
X-Gm-Message-State: AOAM533FIMNDbF7Xuu/8tBVmh3rSPZrehiME0KaodQ2VUzUFcwsebrGu
 9loheWAlPsX/dOoCBkldVwyJbg==
X-Google-Smtp-Source: ABdhPJxaYmy1lvzhG9XZ8TylWiNcg7/INS9e4ILS89Gi4CpAeNu4o1mUAiYST0HajzPBdKzPX2uXkg==
X-Received: by 2002:a63:91c4:: with SMTP id l187mr3069532pge.35.1618371774321; 
 Tue, 13 Apr 2021 20:42:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id np15sm3264801pjb.3.2021.04.13.20.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 20:42:53 -0700 (PDT)
Subject: Re: [PATCH v2 8/9] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <058e2779f8bcd25816bc2338a44ab6f1b2d549db.1618356725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77d3d314-a03e-e081-04c0-a22447fd2658@linaro.org>
Date: Tue, 13 Apr 2021 20:42:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <058e2779f8bcd25816bc2338a44ab6f1b2d549db.1618356725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 4:34 PM, Alistair Francis wrote:
> -#ifndef CONFIG_USER_ONLY
> -# ifdef TARGET_RISCV32
> -#  define is_32bit(ctx)  true
> -# else
> +#ifdef TARGET_RISCV32
> +# define is_32bit(ctx)  true
> +#else
>   static inline bool is_32bit(DisasContext *ctx)
>   {
> -    return !(ctx->misa & RV64);
> +    return (ctx->misa & RV32) == RV32;

Why the change here?  Also note the previous comment about fixing this to false 
for TARGET_RISCV64 && CONFIG_USER_ONLY.

>   static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
>   {
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_64BIT(ctx);

I think you should always put the 64-bit check first.
That way, on TARGET_RISCV32, the entire function folds away.

>   
> -    TCGv t0 = tcg_temp_new();
> +    TCGv_i64 t0 = tcg_temp_new_i64();
>       gen_set_rm(ctx, a->rm);
>       gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
> -    gen_set_gpr(a->rd, t0);
> -    tcg_temp_free(t0);
> +    gen_set_gpr(a->rd, (TCGv) t0);

So... I really don't like the cast.

This is fixable one of two ways.
(1) Change the real helper to use target_ulong.
(2) Use the gen_helper_* stubs that I talked about in reply to v1.

> @@ -390,8 +390,9 @@ static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
>   {
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_64BIT(ctx);
>   
> -    gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
> +    gen_set_gpr(a->rd, (TCGv) cpu_fpr[a->rs1]);

This one's different, and might be worth

#ifdef TARGET_RISCV64
   gen_set_gpr
#else
   qemu_build_not_reached
#endif

> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -303,11 +303,11 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>   
>       TCGv t0 = tcg_temp_new();
>   
> -#if defined(TARGET_RISCV64)
> -    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
> -#else
> -    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
> -#endif
> +    if (!is_32bit(ctx)) {
> +        tcg_gen_ext32s_tl((TCGv) t0, (TCGv) cpu_fpr[a->rs1]);
> +    } else {
> +        tcg_gen_extrl_i64_i32((TCGv_i32) t0, cpu_fpr[a->rs1]);
> +    }

I think you should leave this ifdef alone.  The ifdef has determined the size 
of target_ulong and thus the size of TCGv, and thus the correct move to use.

If TARGET_RISCV64 and is_32bit, the high bits are ignored; the fact that they 
happen to be copies of the sign bit is irrelevant.


r~

