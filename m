Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DD38789F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:23:13 +0200 (CEST)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyki-0006aj-Fd
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liydO-0002T0-5d
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:15:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liydG-0006xn-0f
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:15:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id r11so10786290edt.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRiX8c+8Oblbd5EcQiUjJ5u34Sy+NqJSfyKAwhrntws=;
 b=NE1KhUeaw9V0J4Dl7eI/msi3kwounv8XL5UQ6SPPYanSozi0NRgEeT+cXsrFvtVEAR
 Z2kpdI2lP7GqDohC3gvCI6Ybw/Ifl93Oms1XiRDmWlrQpWuES5sq/kpqUSbwMEoMlV1T
 LhlEuwMRmAk/EyJCcH8PfPKHOHfyhQpgx+Y7Pvp/vq7WjEKG65hHtS192/0wq7yFMwo0
 xUmh1rREcxUXhSjJuF09zG+AghaOddiZVl2+UijRC5wti+054IbaIE0wZMg7JsKTDAYV
 zNNGaM5NHAD1hJj2XKbOSEhj/ILJvJpEnmzlMrhu5ahMMI0xwDPPXHmqfvl7xcaw7Ybe
 nKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRiX8c+8Oblbd5EcQiUjJ5u34Sy+NqJSfyKAwhrntws=;
 b=hQXYwroox6VTCtU7YTOP8qEUBsTU869I35zMOkaL0VsHrjat8q4ajXs0DAHuUEhdBG
 zV4XFSp2MGg1NSZMl47B5I5qpfjNFtbXKLCnchjHyJHOJt17wqzSkRraHZYpETjZykzL
 4OkGvzkf5DHoxl3ksSszervSfG0Q2yAbUI9bu//hFUKcXW+RFGazVB+v1wClQgpA0ZD/
 5tmbWrZf88MJBSU6tl05GYQO188pbTYdhxzAHjBOjF80EHWVFLQcGm+ATCs7nBcSbMty
 UfRLHypf83hNZddTZ6YTJ9KBAG29pWM3Zfm7noduV/7cpNP6HixEUBiMavInpV06KKhw
 dJVg==
X-Gm-Message-State: AOAM533/aY1JT/2wftZQWZVvuYOxuqWJAnSbtC1TgP4ys4dmwas+cy2E
 OyK9L4dt6YDdRqN9Rd5S1D+JxkiaXQNpuPqZwGBEvA==
X-Google-Smtp-Source: ABdhPJx25ad5KsS7IfjnHQJiZPe4r0hZMg5Z1EbHM/gOiKF8i4ZqO2RGe07pDmHN8Xeakv37Yek9l31ekv6MzacuAok=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr6603496edt.36.1621340127713; 
 Tue, 18 May 2021 05:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-7-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:15:11 +0100
Message-ID: <CAFEAcA8xEJrECb9+nb_8Xn+ZHigJPQKP6pQgp=PqJsqT4tyrmg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] target/arm: Implement bfloat16 dot product
 (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 01:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFDOT for both AArch64 AdvSIMD and SVE,
> and VDOT.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -12326,6 +12336,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>          }
>          return;
>
> +    case 0xf: /* BFDOT */
> +        switch (size) {
> +        case 1:
> +            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        return;

The switch on size here seems unnecessary to me given we've already
decoded size earlier in the function.

> +
>      default:
>          g_assert_not_reached();
>      }
> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index 8cc53892d6..aed8a565e0 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -287,6 +287,15 @@ static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
>                          gen_helper_gvec_usdot_b);
>  }
>
> +static bool trans_VDOT_b16(DisasContext *s, arg_VDOT_b16 *a)
> +{
> +    if (!dc_isar_feature(aa32_bf16, s)) {
> +        return false;
> +    }

Again, not sure if we need a FEATURE_NEON check ?


> +    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
> +                        gen_helper_gvec_bfdot);
> +}
> +
>  static bool trans_VFML(DisasContext *s, arg_VFML *a)
>  {
>      int opr_sz;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

