Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B84387733
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:12:43 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixeU-00009V-VY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixcr-0006Ad-RW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:11:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixcq-0002am-57
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:11:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id s6so10588232edu.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ujifz8r96MbSbstBWGtTzCM3QuTQgcct4fS4WWPXA28=;
 b=fCkJr1CRg5yKsRMkOz/R46z9RDnHvwVDZHr2dgGtqMK1SjBM70L/CQx30I9UA8JFhm
 8a3k2qNBsALkGnLjdDrEeA85p07q2ItiVW873Kj0EBMOMCxZJa41gwC71Z84EHKnXjKA
 tj776AR5SKUlzFDjUj6jXOhdmY3EdnWhQClD0yBw35OqRrveG+gd45iFBLkpK5WS83Bo
 mGCaouClxGmE3wWVD1mwJ/xnaJmT/p7Mfl1LsnSmDzcnz/N285Eo6nS1MylqDrwAeGrA
 DSsYMgRJxyRWXXmoA12RlBnKGXpQCR/OfKAIKesxZpy4H6Hyem4D+yj5XnI9vAvdG70Z
 UJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ujifz8r96MbSbstBWGtTzCM3QuTQgcct4fS4WWPXA28=;
 b=SYIAmRC48NjEt8tFh4OpvQYgPrLd77TYfA+zAug9id/U8MsE6PNiWn+7+3W+QVfY5a
 6Hwje0dr6XJ0tveVBdKS5CFIu/iuNTzC3PO3ge1kE1hF7srrHX4WOUgVTBmQNODqrh8i
 wViwf9EyAsklI3+k+18KbNRqMWy0tEgBZxgcEIXr671VAl04cgs6vx2mf+ZEOzRaYs2M
 TQTxklGuZWKW26yX7s+YggqKDE1ZjFDmnhfwz7DeY8t/g0xoStCx5JhDZZmPn7KCktcA
 DShro5ik6yZ65d8Vr5WHnHmUNmCYcjE1QlaDzih0XP/T5n88EKN1xDMqL5qb9tuJMFJM
 NlmQ==
X-Gm-Message-State: AOAM532NqcUr8CXyLuO6hYS+wmcm9CKZvzG4zCawgre6qdWivokaJpau
 V1UZhGEr8CbhYZZ/gboRECaFSoaB0tozSPS19zzGag==
X-Google-Smtp-Source: ABdhPJxRj1tYhRYRLzh9QWaXPkm2SbedcILQQPhxB4QCyASyXQk0S62nvJt5+eWprK8yw1jsfDKmutowrElmN87yQ+U=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr6330937edx.52.1621336258078; 
 Tue, 18 May 2021 04:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-5-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 12:10:41 +0100
Message-ID: <CAFEAcA_PwL-_=7REb_cCLtKK+=Un__ynVEus3GEoSi5p_c3caw@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] target/arm: Implement vector float32 to bfloat16
 conversion
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 01:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFCVT{N,T} for both AArch64 AdvSIMD and SVE,
> and VCVT.BF16.F32 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -7567,6 +7568,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
>  }
>
>  DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
> +DO_FCVTNT(sve_bfcvtnt,    uint32_t, uint16_t, H1_4, H1_2, float32_to_bfloat16)
>  DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)

Not related to this patch, but are the H macros for sve2_fcvtnt_ds definitely
right? Just noticed they're the same as the ones being used for the f32->f16
helpers despite the types being different sizes.

> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index f1893b1dc8..8cc53892d6 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -3413,6 +3413,51 @@ static bool trans_VSHLL(DisasContext *s, arg_2misc *a)
>      return true;
>  }
>
> +static bool trans_VCVT_B16_F32(DisasContext *s, arg_2misc *a)
> +{
> +    TCGv_ptr fpst;
> +    TCGv_i64 tmp;
> +    TCGv_i32 dst0, dst1;
> +
> +    if (!dc_isar_feature(aa32_bf16, s)) {
> +        return false;
> +    }

Do we need to also check ARM_FEATURE_NEON here ?

> +
> +    /* UNDEF accesses to D16-D31 if they don't exist. */
> +    if (!dc_isar_feature(aa32_simd_r32, s) &&
> +        ((a->vd | a->vm) & 0x10)) {
> +        return false;
> +    }
> +
> +    if ((a->vm & 1) || (a->size != 1)) {
> +        return false;
> +    }
> +
> +    if (!vfp_access_check(s)) {
> +        return true;
> +    }
> +
> +    fpst = fpstatus_ptr(FPST_STD);
> +    tmp = tcg_temp_new_i64();
> +    dst0 = tcg_temp_new_i32();
> +    dst1 = tcg_temp_new_i32();
> +
> +    read_neon_element64(tmp, a->vm, 0, MO_64);
> +    gen_helper_bfcvt_pair(dst0, tmp, fpst);
> +
> +    read_neon_element64(tmp, a->vm, 1, MO_64);
> +    gen_helper_bfcvt_pair(dst1, tmp, fpst);
> +
> +    write_neon_element32(dst0, a->vd, 0, MO_32);
> +    write_neon_element32(dst1, a->vd, 1, MO_32);
> +
> +    tcg_temp_free_i64(tmp);
> +    tcg_temp_free_i32(dst0);
> +    tcg_temp_free_i32(dst1);
> +    tcg_temp_free_ptr(fpst);
> +    return true;
> +}
> +
>  static bool trans_VCVT_F16_F32(DisasContext *s, arg_2misc *a)
>  {
>      TCGv_ptr fpst;
> --
> 2.25.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

