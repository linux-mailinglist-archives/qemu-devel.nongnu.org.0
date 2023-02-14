Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D76964AF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvLy-0006BK-Pd; Tue, 14 Feb 2023 08:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvLx-0006B7-30
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:28:13 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvLr-0001nq-AG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:28:12 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-16dcb07b805so12416276fac.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yZ/WEvF3pxDIWV5cr5tqmxr4guglU3WkSAZ9T/oPSxQ=;
 b=CMXQYrhold293al+g7SPlcyiaVcxir2FrzCkmkOVlVn1M+Bp6AXbuBxh3WBLvh8eCe
 XzPTHXtMeWIqnO7/qHT/yX30kmlfYCk/d5xYnN5CQchGFfkavgqq2Ol3hdtsxjBJH1Ll
 G876C+qW8+qveq4dPYkLbwPjI6icqTdTVA/6hwCEn27fSt8OwPxcEn0jIuy6fNtRbfTK
 /Qd1PBE0m2wehQGqaT6LEPWFQavk6ytAhadRQEERyTMznOEbhOnT0+CYQfRuL57WHkv2
 9oOcoNFJfKiA+y7JzHPNO6UHfwirYgSoGU5PMFiq5Nqfwl30+N5R72BcRr6rP/X+1Jm9
 M2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZ/WEvF3pxDIWV5cr5tqmxr4guglU3WkSAZ9T/oPSxQ=;
 b=BO3TwM7o00POw6JuZw7dtzejMFzjJMNzX137Fo4CBdpQ2Xl0ahwq4ClDab78Qm1pYU
 Yzw3/pCIO0dMrKsbwq0h2otocRKCm5QmlgAVHsZFDKyX08T2mGFm3IVS+iglIgPzuxH3
 r1C3jYx0sVSNrbnhwZyS4sqqHJF5PW/9nSugLRKY/5NTJVG2s7gRF53akyynfNv5FB+G
 sTvDaUJeJIAldrI3S3NcYNd1HESum0Ps+Vx0kzTaMUmm+NDxKdW/be6M5chBI6d0dM8Q
 8RnXLjXHsAeJsmCPetZt7gKS7GWlH2AH6TwcfnBv1idI6mAiFaZLgTXlJWwW7VL0uaKu
 CBqA==
X-Gm-Message-State: AO0yUKVRWafbCDLDMwAJm41BiD56tyIcI4JlomGIjDEioUjK9/Sa/8cc
 M3j94H5QRs5ss5IJCcSjP0y49Q==
X-Google-Smtp-Source: AK7set8b0pZjQyybMx+gGSYDKh2c6Zyxsu/tDKiIC5Pxlfn5fhBRzINdbOrue711gff7Qk2W4vkmQQ==
X-Received: by 2002:a05:6870:56a2:b0:16d:ff38:26 with SMTP id
 p34-20020a05687056a200b0016dff380026mr1197557oao.23.1676381285864; 
 Tue, 14 Feb 2023 05:28:05 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a056870c34300b0016dc6d38b16sm4069574oak.23.2023.02.14.05.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:28:05 -0800 (PST)
Message-ID: <72177b78-bdf9-bca2-98ad-4e93dd9e18c8@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:28:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 10/14] target/riscv: Remove rebundunt check for zve32f and
 zve64f
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-11-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-11-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

Nit: I believe you mean "redundant" in the title ^

On 2/14/23 05:38, Weiwei Li wrote:
> Require_zve32/64f have been overlapped by require_rvf/require_scale_rvf
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 128 ++++--------------------
>   1 file changed, 21 insertions(+), 107 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 9b2711b94b..9053759546 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -66,50 +66,6 @@ static bool require_scale_rvf(DisasContext *s)
>       }
>   }
>   
> -static bool require_zve32f(DisasContext *s)
> -{
> -    /* RVV + Zve32f = RVV. */
> -    if (has_ext(s, RVV)) {
> -        return true;
> -    }
> -
> -    /* Zve32f doesn't support FP64. (Section 18.2) */
> -    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
> -}
> -
> -static bool require_scale_zve32f(DisasContext *s)
> -{
> -    /* RVV + Zve32f = RVV. */
> -    if (has_ext(s, RVV)) {
> -        return true;
> -    }
> -
> -    /* Zve32f doesn't support FP64. (Section 18.2) */
> -    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
> -}
> -
> -static bool require_zve64f(DisasContext *s)
> -{
> -    /* RVV + Zve64f = RVV. */
> -    if (has_ext(s, RVV)) {
> -        return true;
> -    }
> -
> -    /* Zve64f doesn't support FP64. (Section 18.2) */
> -    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
> -}
> -
> -static bool require_scale_zve64f(DisasContext *s)
> -{
> -    /* RVV + Zve64f = RVV. */
> -    if (has_ext(s, RVV)) {
> -        return true;
> -    }
> -
> -    /* Zve64f doesn't support FP64. (Section 18.2) */
> -    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
> -}
> -
>   /* Destination vector register group cannot overlap source mask register. */
>   static bool require_vm(int vm, int vd)
>   {
> @@ -2331,9 +2287,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
>   /* OPFVV without GVEC IR */
> @@ -2421,9 +2375,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           vext_check_ss(s, a->rd, a->rs2, a->vm);
>   }
>   
>   /* OPFVF without GVEC IR */
> @@ -2461,9 +2413,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>              require_scale_rvf(s) &&
>              (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
>   /* OPFVV with WIDEN */
> @@ -2506,9 +2456,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>              require_scale_rvf(s) &&
>              (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           vext_check_ds(s, a->rd, a->rs2, a->vm);
>   }
>   
>   /* OPFVF with WIDEN */
> @@ -2540,9 +2488,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
>              require_scale_rvf(s) &&
>              (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
>   /* WIDEN OPFVV with WIDEN */
> @@ -2585,9 +2531,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
>              require_scale_rvf(s) &&
>              (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           vext_check_dd(s, a->rd, a->rs2, a->vm);
>   }
>   
>   /* WIDEN OPFVF with WIDEN */
> @@ -2664,9 +2608,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
>              /* OPFV instructions ignore vs1 check */
> -           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           vext_check_ss(s, a->rd, a->rs2, a->vm);
>   }
>   
>   static bool do_opfv(DisasContext *s, arg_rmr *a,
> @@ -2731,9 +2673,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           vext_check_mss(s, a->rd, a->rs1, a->rs2);
>   }
>   
>   GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
> @@ -2746,9 +2686,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ms(s, a->rd, a->rs2) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           vext_check_ms(s, a->rd, a->rs2);
>   }
>   
>   GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
> @@ -2769,9 +2707,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>       if (require_rvv(s) &&
>           require_rvf(s) &&
>           vext_check_isa_ill(s) &&
> -        require_align(a->rd, s->lmul) &&
> -        require_zve32f(s) &&
> -        require_zve64f(s)) {
> +        require_align(a->rd, s->lmul)) {
>           gen_set_rm(s, RISCV_FRM_DYN);
>   
>           TCGv_i64 t1;
> @@ -2856,18 +2792,14 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
>   static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_widen_check(s, a) &&
> -           require_rvf(s) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           require_rvf(s);
>   }
>   
>   static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_widen_check(s, a) &&
>              require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           (s->sew != MO_8);
>   }
>   
>   #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
> @@ -2918,9 +2850,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
>              require_scale_rvf(s) &&
>              vext_check_isa_ill(s) &&
>              /* OPFV widening instructions ignore vs1 check */
> -           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           vext_check_ds(s, a->rd, a->rs2, a->vm);
>   }
>   
>   #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
> @@ -2975,18 +2905,14 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_narrow_check(s, a) &&
>              require_rvf(s) &&
> -           (s->sew != MO_64) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           (s->sew != MO_64);
>   }
>   
>   static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_narrow_check(s, a) &&
>              require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           (s->sew != MO_8);
>   }
>   
>   #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
> @@ -3035,9 +2961,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>              require_scale_rvf(s) &&
>              vext_check_isa_ill(s) &&
>              /* OPFV narrowing instructions ignore vs1 check */
> -           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
> -           require_scale_zve32f(s) &&
> -           require_scale_zve64f(s);
> +           vext_check_sd(s, a->rd, a->rs2, a->vm);
>   }
>   
>   #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
> @@ -3111,9 +3035,7 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
>   static bool freduction_check(DisasContext *s, arg_rmrr *a)
>   {
>       return reduction_check(s, a) &&
> -           require_rvf(s) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           require_rvf(s);
>   }
>   
>   GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
> @@ -3540,9 +3462,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>   {
>       if (require_rvv(s) &&
>           require_rvf(s) &&
> -        vext_check_isa_ill(s) &&
> -        require_zve32f(s) &&
> -        require_zve64f(s)) {
> +        vext_check_isa_ill(s)) {
>           gen_set_rm(s, RISCV_FRM_DYN);
>   
>           unsigned int ofs = (8 << s->sew);
> @@ -3568,9 +3488,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>   {
>       if (require_rvv(s) &&
>           require_rvf(s) &&
> -        vext_check_isa_ill(s) &&
> -        require_zve32f(s) &&
> -        require_zve64f(s)) {
> +        vext_check_isa_ill(s)) {
>           gen_set_rm(s, RISCV_FRM_DYN);
>   
>           /* The instructions ignore LMUL and vector register group. */
> @@ -3621,17 +3539,13 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
>   static bool fslideup_check(DisasContext *s, arg_rmrr *a)
>   {
>       return slideup_check(s, a) &&
> -           require_rvf(s) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           require_rvf(s);
>   }
>   
>   static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
>   {
>       return slidedown_check(s, a) &&
> -           require_rvf(s) &&
> -           require_zve32f(s) &&
> -           require_zve64f(s);
> +           require_rvf(s);
>   }
>   
>   GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)

