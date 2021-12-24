Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5747F153
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 23:27:52 +0100 (CET)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0t2V-0004oP-9m
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 17:27:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t1V-0003rS-TC
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:26:49 -0500
Received: from [2607:f8b0:4864:20::529] (port=41639
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t1U-00084x-68
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:26:49 -0500
Received: by mail-pg1-x529.google.com with SMTP id k4so8509404pgb.8
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 14:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aIuP3jga9RUATKEROjXghAn0wVmzKak9+Y3NRLgVSCY=;
 b=oaYABInSfZvSVYmYurqyJ2Z4mA8k/UP81AtLnlFqyeGjwB3U5rj3zEQBNb4jFzGKgt
 y/FCS7YkAWeBhuYkbmPB3BQ9UVa/hfFkDhpR5EEeG1BcgI5dc8ABDO2EzAwqeXFDEFwn
 G2ExH7FpGSDepdLaaLQ8s8aE3flluD2zgqGLbSifbpoVel4DOPiC84VB4rHzyUa08r1V
 1cBtrXEG78G6+zjC2OkfpIy8K76E4NtskdkIDg0pu7vqFpMR7Aciu9bxZt81j3AEC/3G
 L9cGb7kknDlDBYd+IUI1lyCUcBdnXh1zRsMizdXxbdLbk0mpGP9FZ5eng984nNCldT1+
 1ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aIuP3jga9RUATKEROjXghAn0wVmzKak9+Y3NRLgVSCY=;
 b=qJSqQW3yWQphSuGOO3ZARdXdBiIYa84ZMkFENKKVYTLj0MXJQEw5mdlFh6+ztAPppK
 od5OMxW7g1gQz7Q3hMS7kOJ85dhziTgyrV+r12x00lW6bKyIFqmOK7+JQoe1NO8wocsg
 qKjH6g01l9Ks8MtOVahQg7GpxEYQJ7LYlcMFl3rX+/r6M98JGzjC3xbcU2/Xcg4YG+Pl
 LSgrzwPxs477T8sKKc2eHI/SBIcbzH48AMxwU2HPN8t156kp2B/RMz/r4Ve6Humo+lsI
 yeLuES9NH1Ti0UzZE72zft+xjN7W5L+pbteE0gkns4gBsKHUN3Q6IADlCWhlU3JH8gY1
 XWhg==
X-Gm-Message-State: AOAM5306bhPG4RrclhDo5chaIyyu1L0pLRrbHQ3ETw1JUHn/Rd6i6ckW
 DG3BM6QHfQtqPj47WpRyszU3Hw==
X-Google-Smtp-Source: ABdhPJwG4C+HzNJtgRuB0WiOq9oFypz0IkH4T3LPGNrtdL6m+uFzlYnUR1qFIUqtuxgCU7fl6FAWtw==
X-Received: by 2002:aa7:860d:0:b0:4bb:91cb:e9b9 with SMTP id
 p13-20020aa7860d000000b004bb91cbe9b9mr6154375pfn.17.1640384806622; 
 Fri, 24 Dec 2021 14:26:46 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id z2sm10375683pfh.188.2021.12.24.14.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 14:26:46 -0800 (PST)
Subject: Re: [PATCH 3/6] target/riscv: add support for zfinx
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a075e163-820e-d6ee-149d-1311af9dcc0a@linaro.org>
Date: Fri, 24 Dec 2021 14:26:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
>   static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
>   {
>       REQUIRE_FPU;
> -    REQUIRE_EXT(ctx, RVF);
> +    REQUIRE_ZFINX_OR_F(ctx);
>   
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>       if (a->rs1 == a->rs2) { /* FMOV */
> -        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
> +        TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +        if (ctx->ext_zfinx) {
> +            gen_nanbox_s(dest, src1);

Sign-extend, not nanbox.  Or, since you handle sign-extension in gen_set_gpr_hs, nothing 
at all -- just tcg_gen_mov_i64.

>       } else { /* FSGNJ */
> -        TCGv_i64 rs1 = tcg_temp_new_i64();
> -        TCGv_i64 rs2 = tcg_temp_new_i64();
> -
> -        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
> -        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
> -
> -        /* This formulation retains the nanboxing of rs2. */
> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
> -        tcg_temp_free_i64(rs1);
> -        tcg_temp_free_i64(rs2);
> +        TCGv_i64 rs1, rs2;
> +        if (!ctx->ext_zfinx) {
> +            TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
> +            TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
> +            rs1 = tcg_temp_new_i64();
> +            rs2 = tcg_temp_new_i64();
> +            gen_check_nanbox_s(rs1, src1);
> +            gen_check_nanbox_s(rs2, src2);
> +        } else {
> +            rs1 = get_fpr_hs(ctx, a->rs1);
> +            rs2 = get_fpr_hs(ctx, a->rs2);
> +        }
> +
> +        /* This formulation retains the nanboxing of rs2 in normal 'F'. */
> +        tcg_gen_deposit_i64(dest, rs2, rs1, 0, 31);
> +        if (!ctx->ext_zfinx) {
> +            tcg_temp_free_i64(rs1);
> +            tcg_temp_free_i64(rs2);
> +        } else {
> +            gen_nanbox_s(dest, dest);
> +        }

This is tangled enough that I think you should check zfinx at one higher indent level, and 
not do conditional allocate followed by conditional free.

> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 065e8162a2..9f3f3319f2 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -51,8 +51,12 @@ static inline uint64_t nanbox_s(float32 f)
>       return f | MAKE_64BIT_MASK(32, 32);
>   }
>   
> -static inline float32 check_nanbox_s(uint64_t f)
> +static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>   {
> +    /* Disable nanbox check when enable zfinx */
> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx)
> +        return (uint32_t)f;
> +

Braces.


r~

