Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5792561DB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 22:11:38 +0200 (CEST)
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBkin-0001Wn-Au
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 16:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkhs-0000zI-CC
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 16:10:40 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkhp-0001bH-M8
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 16:10:40 -0400
Received: by mail-pg1-x544.google.com with SMTP id 67so941921pgd.12
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 13:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=khJkHNHtikGHDPRIWVieginrZpbl+J4Zmyy0VDJojLs=;
 b=Qtu8s/gabJLYDiUfosHriu2pdkd3Srv67nc+lWMktMffvhoK5UOK+HeoVyEPOfPsk1
 PlkmnIbQfDJZpvAjZ/eQIkAiMRtT2hoIorP4SCtsKkTRWXBZ4FArx8UMTioA4q4QkE3b
 +VbMBPC/nc0hzNzKqXoMfsSLcMTy/ESFzIfOC/L81+G30YH7pMW1238vFaFTboB4cISa
 k8lzzxQChCnNC353e+yD8dKep90SNjjUWR3HYZplB1ZvdbjfwrDro06qgawAaYshl37S
 ZjJllCaBS5bWpIMc8e0GL7UT0gn7SWehAe3IdQJkiqFnVTLZs94cXAbiJmxNPz9wohqy
 w80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=khJkHNHtikGHDPRIWVieginrZpbl+J4Zmyy0VDJojLs=;
 b=HPyp5E4s0G/FoKE5v8oKC2zkcV11D8e/4VnbO2TuucccMVlosTejekvS9VAf7ZbWWj
 RCCXsyBJJBTHsNUqV0ChE/wsmttfqGcWPJIvG46RA/PR809Mfdun8kP/+MyfHjrstH7Q
 nG5nyuqnmuMyNR+1z6E5p8IJXLgIo4iyoG4p02r8h6PrH09xUtUOoVgGeNutTsu6QRQp
 Mn5Gf6sAnTQptwZBNFgcUf4H2pD3XTYLvduD2UB/2NlRIVfOgXPyZ3tYf7wqG/DHf7pq
 O8zDu5ZyrmxfvyPhxqhh+uBeDtC+1JziPM0iTuYz/QM3+i3rOCAi8PKrGghYWx9/Aqlo
 qawQ==
X-Gm-Message-State: AOAM5315k5JfKlzOsxb/7lDSPFSiBwhaCt6rMam8mMzdo5G9DAizthc/
 M+dzlT/QdLXMZEqPYLFbp5Uu+V1VqLrVjg==
X-Google-Smtp-Source: ABdhPJzsH2EANjSSHa/M/rjBogCmESb+7BejJ5DnyswVCi6bX2Bp1XetZvB8684DSEia8G1y5SHgjQ==
X-Received: by 2002:a62:79c5:: with SMTP id u188mr554618pfc.270.1598645435785; 
 Fri, 28 Aug 2020 13:10:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g5sm150264pjx.53.2020.08.28.13.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:10:34 -0700 (PDT)
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55675521-a61c-186c-599f-7373e9165184@linaro.org>
Date: Fri, 28 Aug 2020 13:10:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/28/20 11:33 AM, Peter Maydell wrote:
> We already have gvec helpers for floating point VRECPE and
> VRQSRTE, so convert the Neon decoder to use them and
> add the fp16 support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index 9d0959517fa..872f093a1fc 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -3857,13 +3857,38 @@ static bool do_2misc_fp(DisasContext *s, arg_2misc *a,
>          return do_2misc_fp(s, a, FUNC);                         \
>      }
>  
> -DO_2MISC_FP(VRECPE_F, gen_helper_recpe_f32)
> -DO_2MISC_FP(VRSQRTE_F, gen_helper_rsqrte_f32)
>  DO_2MISC_FP(VCVT_FS, gen_helper_vfp_sitos)
>  DO_2MISC_FP(VCVT_FU, gen_helper_vfp_uitos)
>  DO_2MISC_FP(VCVT_SF, gen_helper_vfp_tosizs)
>  DO_2MISC_FP(VCVT_UF, gen_helper_vfp_touizs)
>  
> +#define DO_2MISC_FP_VEC(INSN, HFUNC, SFUNC)                             \
> +    static void gen_##INSN(unsigned vece, uint32_t rd_ofs,              \
> +                           uint32_t rm_ofs,                             \
> +                           uint32_t oprsz, uint32_t maxsz)              \
> +    {                                                                   \
> +        static gen_helper_gvec_2_ptr * const fns[4] = {                 \
> +            NULL, HFUNC, SFUNC, NULL,                                   \
> +        };                                                              \
> +        TCGv_ptr fpst;                                                  \
> +        fpst = fpstatus_ptr(vece == 1 ? FPST_STD_F16 : FPST_STD);       \

Perhaps clearer with MO_16 instead of 1.

> +        tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz, 0,       \
> +                           fns[vece]);                                  \
> +        tcg_temp_free_ptr(fpst);                                        \
> +    }                                                                   \
> +    static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
> +    {                                                                   \
> +        if (a->size == 0 ||                                             \
> +            (a->size == 1 && !dc_isar_feature(aa32_fp16_arith, s)))     \
> +        {                                                               \

Likewise, and the { is on the wrong line.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

