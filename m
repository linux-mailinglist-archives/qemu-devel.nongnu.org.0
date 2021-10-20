Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74581434496
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:18:34 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3zl-00029P-Jz
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md3yc-0001S4-5i
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:17:22 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md3ya-0004mP-8R
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:17:21 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f5so21436715pgc.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 22:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bEbxsL6ri7/izx+Tbhj+kECrM2FbCazMmMcNDiBZ0A8=;
 b=ajmFuFM96JSmZDMqj4v9agN2rowpkYCvgB3Xuj/p0houq8n8jZ9YNaeFOoB3wkF/B3
 KAP4iPeFDljXA4IFL6EhkZPr0iusIaytHEmrdKzre0UR4b0TWEDT1NDNvCe6bPu7xNW4
 grKzYWID7uY9VBPmPMoXPLuDdHsE1RV1AN5m9g4abH5I1Nc1i66zm5Pm9eS0MVz18/p4
 ZmS1zYUeOvFCijJM/anW33xONlQ1fL8j4eC/3qrMPHyi111mJ0VbPlaBmWRpresyKbPw
 2tolN3cb8J4C8A+un2AfX6H7hDiJEM6lx8SZD8HKalCtHfvE4S50z7wAlL3OfLDSpSe8
 ecCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bEbxsL6ri7/izx+Tbhj+kECrM2FbCazMmMcNDiBZ0A8=;
 b=gAtxni56Vq+pb+ZlKZplNm0e9UfTFy6LYkvWq9wYccrQFWxFR1wLUmfu+vK6QIyizo
 cKkc2Mvu5ozBiZLYVdFEkRfj4yo3Pl8F+BTcYJwbybl5B4HeBxI33WYoAhFu/Q3cXLUA
 EMR4uIFVOkHllkOcCMHHI0Pzkbt0Uj2Xfux4AgMA3inJRccJVVLmqlDPal/ZulC88DuM
 Hitm+IbcxBrG9bMvZNkiALZC62Nayt88LBMYuuupnq6tGTfBF/k0YosXyaHeo4g/E3mE
 r2tH9mvzsgXbTjws1SZ0GK9FsreJOXSohuD1UhQy5KES/ffy0FwD6nld3HO/VxUfr5tj
 +o8A==
X-Gm-Message-State: AOAM532dapcxgEH6c/3UunaDs5+Dy7JFvquHhxniSdufaVU5PeKJuS4u
 yFPjsp/aUd4dBiNkajCx0qrwKg==
X-Google-Smtp-Source: ABdhPJyDndFO4iWAVKmhbQYvXqfdqjY/EBSuqmqABuTDnXeHs/eeJ+6mqL/d8MepZh9ol0UuN4dPsg==
X-Received: by 2002:aa7:991e:0:b0:44c:a172:e670 with SMTP id
 z30-20020aa7991e000000b0044ca172e670mr4143833pff.10.1634707038179; 
 Tue, 19 Oct 2021 22:17:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id nr14sm804203pjb.24.2021.10.19.22.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 22:17:17 -0700 (PDT)
Subject: Re: [PATCH 12/31] target/loongarch: Add timer related instructions
 support.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-13-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31f9d679-2354-64bc-7fbb-a6bc84caab11@linaro.org>
Date: Tue, 19 Oct 2021 22:17:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-13-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> This includes:
> -RDTIME{L/H}.W
> -RDTIME.D
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/helper.h                 |  2 ++
>   target/loongarch/insn_trans/trans_core.c  | 23 +++++++++++++++++++++
>   target/loongarch/insn_trans/trans_extra.c |  2 ++
>   target/loongarch/op_helper.c              | 25 +++++++++++++++++++++++
>   4 files changed, 52 insertions(+)
> 
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index 8544771790..b4ed62896f 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -116,4 +116,6 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
>   DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
>   DEF_HELPER_1(ertn, void, env)
>   DEF_HELPER_1(idle, void, env)
> +DEF_HELPER_4(rdtime_w, void, env, tl, tl, i64)
> +DEF_HELPER_3(rdtime_d, void, env, tl, tl)
>   #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/loongarch/insn_trans/trans_core.c b/target/loongarch/insn_trans/trans_core.c
> index 7fa13e65b9..24eb12b97a 100644
> --- a/target/loongarch/insn_trans/trans_core.c
> +++ b/target/loongarch/insn_trans/trans_core.c
> @@ -276,4 +276,27 @@ static bool trans_idle(DisasContext *ctx, arg_idle *a)
>       return true;
>   }
>   
> +static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
> +{
> +    TCGv t0 = tcg_constant_tl(a->rd);
> +    TCGv t1 = tcg_constant_tl(a->rj);
> +    gen_helper_rdtime_w(cpu_env, t0, t1, tcg_constant_tl(0));
> +    return true;
> +}

Missing icount boilerplate:

     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
         ctx->base.is_jmp = DISAS_TOO_MANY;
     }

Something similar is probably required before some of the other instructions that always 
result in i/o.

> diff --git a/target/loongarch/insn_trans/trans_extra.c b/target/loongarch/insn_trans/trans_extra.c
> index 8da3b404f3..426b67f154 100644
> --- a/target/loongarch/insn_trans/trans_extra.c
> +++ b/target/loongarch/insn_trans/trans_extra.c
> @@ -36,6 +36,7 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
>       return true;
>   }
>   
> +#ifdef CONFIG_USER_ONLY
>   static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
>   {
>       tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
> @@ -53,6 +54,7 @@ static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
>       tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
>       return true;
>   }
> +#endif

You shouldn't have two copies of these.

> +void helper_rdtime_w(CPULoongArchState *env, target_ulong rd,
> +                     target_ulong rj, target_ulong high)
> +{
> +    if (rd) {
> +        if (high) {
> +            env->gpr[rd] = cpu_loongarch_get_stable_counter(env) >> 32;
> +        } else {
> +            env->gpr[rd] = cpu_loongarch_get_stable_counter(env) & 0xffffffff;
> +        }

This is incorrect -- the result should be sign-extended in RD.

> +void helper_rdtime_d(CPULoongArchState *env, target_ulong rd, target_ulong rj)
> +{
> +    if (rd) {
> +        env->gpr[rd] = cpu_loongarch_get_stable_counter(env);
> +    }
> +    if (rj) {
> +        env->gpr[rj] = env->CSR_TMID;
> +    }

You shouldn't need two functions.  Just return the full 64-bit result, placing that into 
RD, then read TMID separately.

     rd = gpr_dst(ctx, a->rd, EXT_NONE);
     gen_helper_rdtime_d(rd, cpu_env);
     if (word) {
         tcg_gen_sextract_tl(rd, rd, high ? 32 : 0, 32);
     }

     rj = gpr_dst(ctx, a->rj, EXT_NONE);
     tcg_gen_ld_i64(rj, cpu_env, offsetof(CPULoongArchState, CSR_TMID));


r~

