Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC565400A8A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 13:06:24 +0200 (CEST)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMTV9-0006li-8q
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 07:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMTTV-0005qM-VT
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 07:04:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMTTT-0001gF-QL
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 07:04:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1198327wml.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5ZgDEAuShUzl/yA2R8s7RVA3GAoBcJg/kPszpOYzrw0=;
 b=CNPdkEPOP5W6irzrB2TcSOfV/w/PaVkuFCiARqSUIqamz9IXSshYpWMl2oKUmU2CmB
 4PS8zuuh637QO4ndfHJRZkFxwKcZyC1zGdHe38FqPtnigvIjcNFwq/j5AV+vrX+YPrhx
 GCuLl9n9F6E882875gTekxp62g/zBPXSLkw3o09vTvEjc5V0XoBL0jZYel6q4MTpcTew
 uaP8PbM7QdoKgJ61tkDR7fY7SHEn9uoKzeexyj9OuHadB+C0VbrMDksVr8rmlD9ar4zz
 tu1vpbWJJGx2WnDbJUKfCfkVlvFzmGuHmHoIfFX62oSaOTMwIZL87fmSqRs9RaL89kq6
 uN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ZgDEAuShUzl/yA2R8s7RVA3GAoBcJg/kPszpOYzrw0=;
 b=avkFuyquPgfXHffMA5mArTvoF6QeIvxRxxs0eCGFW3c+3/TKutnH6YJUVh9HWvJPUU
 UNYi5i3wGa0msJdz/mZjScabIQcRSeIZvxS28FVMnAEaoNvsENpT9dIjPvs6YFS/Ts5Z
 LQTspk7To19aDzutQ6iYPGFaPh1a+ijcFPcRyvdOZ5uXIBw66qZiU3iN9Alv616D1wVa
 nzK3Pq/8SIzIFOa3VIWhelw3FkRhRKLqb7KxNsovvOw7SP4B9ScFlOAYH4fIEQ7d/IrD
 6g2nxIzvFV+Rqu9F1WA98nNDgOxRvea+M7dLodmNZRVNGNVpUj04A96bcq7FylrADI06
 3rxg==
X-Gm-Message-State: AOAM530xtD5ZXZFE4DZdBR6d+fCyzBwvrNZDDQVo8JN93Kec32ADSurH
 nlfYmr4fjYCVnBBwjKmZ2QzjRA==
X-Google-Smtp-Source: ABdhPJy0foy8FYszLOaA4AxWnnHnxLVdoyo/DjhNL3RiujY4ATThQTAUB2BN2fQztf0dDyiSUsaBow==
X-Received: by 2002:a05:600c:4048:: with SMTP id
 j8mr2732980wmm.173.1630753477763; 
 Sat, 04 Sep 2021 04:04:37 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id n3sm1796821wmi.0.2021.09.04.04.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 04:04:37 -0700 (PDT)
Subject: Re: [PATCH v4 04/21] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-5-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0180cf32-a93c-191d-2e8e-2da9e27431eb@linaro.org>
Date: Sat, 4 Sep 2021 13:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-5-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +static bool gen_r2_si12(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
> +                        DisasExtend src_ext, DisasExtend dst_ext,
> +                        void (*func)(TCGv, TCGv, TCGv))
> +{
> +    ctx->dst_ext = dst_ext;
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
> +    TCGv src2 = tcg_constant_tl(a->si12);

Prefer to put declarations before statements, as per old C90 still.

> +    func(dest, src1, src2);
> +
> +    if (ctx->dst_ext) {

Given that func does not receive ctx, why store dst_ext into ctx and then read it back? 
It seems like you should just use the parameter directly.

> +static bool gen_pc(DisasContext *ctx, arg_fmt_rdsi20 *a,
> +                   void (*func)(DisasContext *ctx, TCGv, target_long))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +
> +    func(ctx, dest, a->si20);
> +    return true;
> +}

Perhaps clearer with:

   target_long (*func)(target_long pc, target_long si20)

   target_long addr = func(ctx->base.pc_next, a->si20);
   TCGv dest = gpr_dst(ctx, a->rd);

   tcg_gen_movi_tl(dest, addr);
   return true;




> +static bool gen_mulh(DisasContext *ctx, arg_add_w *a,
> +                     void(*func)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
> +    TCGv_i32 discard = tcg_temp_new_i32();
> +    TCGv_i32 t0 = tcg_temp_new_i32();
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +
> +    tcg_gen_trunc_tl_i32(t0, src1);
> +    tcg_gen_trunc_tl_i32(t1, src2);
> +    func(discard, t0, t0, t1);
> +    tcg_gen_ext_i32_tl(dest, t0);
> +
> +    tcg_temp_free_i32(discard);
> +    tcg_temp_free_i32(t0);
> +    tcg_temp_free_i32(t1);
> +    return true;
> +}

You should be able to use gen_r3 for these.

static void gen_mulh_w(TCGv dest, TCGv src1, TCGv src2)
{
     tcg_gen_mul_i64(dest, src1, src2);
     tcg_gen_sari_i64(dest, dest, 32);
}

static void gen_mulh_wu(TCGv dest, TCGv src1, TCGv src2)
{
     tcg_gen_mul_i64(dest, src1, src2);
     tcg_gen_sari_i64(dest, dest, 32);
}

static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
{
     TCGv discard = tcg_temp_new();
     tcg_gen_muls2_tl(discard, dest, src1, src2);
     tcg_temp_free(discard);
}

static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
{
     TCGv discard = tcg_temp_new();
     tcg_gen_mulu2_tl(discard, dest, src1, src2);
     tcg_temp_free(discard);
}

TRANS(mulh_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_NONE, gen_mulh_w)
TRANS(mulh_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_NONE, gen_mulh_wu)
TRANS(mulh_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_d)
TRANS(mulh_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_mulh_du)

> +static bool gen_mulw_d(DisasContext *ctx, arg_add_w *a,
> +                     void(*func)(TCGv_i64, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    func(src1, src1);
> +    func(src2, src2);
> +    tcg_gen_mul_i64(dest, src1, src2);
> +    return true;
> +}

The func parameter here serves the same purpose as DisasExtend, so again you can use gen_r3:

TRANS(mulw_d_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_NONE, tcg_gen_mul_tl)
TRANS(mulw_d_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_NONE, tcg_gen_mul_tl)



> +
> +static bool gen_div_w(DisasContext *ctx, arg_fmt_rdrjrk *a,
> +                      DisasExtend src_ext, DisasExtend dst_ext,
> +                      void(*func)(TCGv, TCGv, TCGv))
> +{
> +    ctx->dst_ext = dst_ext;
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
> +    TCGv src2 = gpr_src(ctx, a->rk, src_ext);
> +    TCGv t2 = tcg_temp_new();
> +    TCGv t3 = tcg_temp_new();
> +
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, src1, INT_MIN);
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, -1);
> +    tcg_gen_and_tl(t2, t2, t3);
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, src2, 0);
> +    tcg_gen_or_tl(t2, t2, t3);
> +    tcg_gen_movi_tl(t3, 0);
> +    tcg_gen_movcond_tl(TCG_COND_NE, src2, t2, t3, t2, src2);

Bug, writing back to src2.

> +    func(dest, src1, src2);

You can split this out differently so that you can use gen_r3.

static TCGv prep_divisor_d(TCGv src1, TCGv src2)
{
     TCGv t0 = temp_new();
     TCGv t1 = tcg_temp_new();
     TCGv t2 = tcg_temp_new();
     TCGv zero = tcg_constant_tl(0);

     /*
      * If min / -1, set the divisor to 1.
      * This avoids potential host overflow trap and produces min.
      * If x / 0, set the divisor to 1.
      * This avoids potential host overflow trap;
      * the required result is undefined.
      */
     tcg_gen_setcondi_tl(TCG_COND_EQ, t0, src1, INT64_MIN);
     tcg_gen_setcondi_tl(TCG_COND_EQ, t1, src2, -1);
     tcg_gen_setcondi_tl(TCG_COND_EQ, t2, src2, 0);
     tcg_gen_and_tl(t0, t0, t1);
     tcg_gen_or_tl(t0, t0, t2);
     tcg_gen_movcond_tl(TCG_COND_NE, t0, t0, zero, t0, src2);

     tcg_temp_free(t1);
     tcg_temp_free(t2);
     return t0;
}

static TCGv prep_divisor_du(TCGv src2)
{
     TCGv t0 = temp_new();
     TCGv zero = tcg_constant_tl(0);
     TCGv one = tcg_constant_tl(1);

     /*
      * If x / 0, set the divisor to 1.
      * This avoids potential host overflow trap;
      * the required result is undefined.
      */
     tcg_gen_movcond_tl(TCG_COND_EQ, t0, src2, zero, one, src2);
     return t0;
}

static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
{
     src2 = prep_divisor_d(src1, src2);
     tcg_gen_div_tl(dest, src1, src2);
}

static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
{
     src2 = prep_divisor_d(src1, src2);
     tcg_gen_rem_tl(dest, src1, src2);
}

static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
{
     src2 = prep_divisor_du(src2);
     tcg_gen_divu_tl(dest, src1, src2);
}

static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
{
     src2 = prep_divisor_du(src2);
     tcg_gen_remu_tl(dest, src1, src2);
}

static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
{
     /* We need not check for integer overflow for div_w. */
     src2 = prep_divisor_du(src2);
     tcg_gen_div_tl(dest, src1, src2);
}

static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
{
     /* We need not check for integer overflow for rem_w. */
     src2 = prep_divisor_du(src2);
     tcg_gen_rem_tl(dest, src1, src2);
}

TRANS(div_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_div_w)
TRANS(mod_w, gen_r3, EXT_SIGN, EXT_SIGN, EXT_SIGN, gen_rem_w)
TRANS(div_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_div_du)
TRANS(mod_wu, gen_r3, EXT_ZERO, EXT_ZERO, EXT_SIGN, gen_div_du)
TRANS(div_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_d)
TRANS(mod_d, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_d)
TRANS(div_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_div_du)
TRANS(mod_du, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_rem_du)

> --- a/target/loongarch/internals.h
> +++ b/target/loongarch/internals.h
> @@ -9,7 +9,6 @@
>   #ifndef LOONGARCH_INTERNALS_H
>   #define LOONGARCH_INTERNALS_H
>   
> -
>   void loongarch_translate_init(void);
>   
>   void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);

Fold this back to a previous patch.

> -static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> -{
> -    return true;
> -}

Yes indeed, fold this patch to a previous patch.


r~

