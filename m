Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFD3878BA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:29:46 +0200 (CEST)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyr3-0005i2-1s
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liymq-0002m6-Bt
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:25:26 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liymk-0003q3-Ih
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:25:23 -0400
Received: by mail-ej1-x632.google.com with SMTP id k14so10747157eji.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G19OkqwUkgire3A559su7oqUaORn7ssYN+F9ROgHlGg=;
 b=axNwHJpw7sg2Ks6sZQuOg4WglPaXPIj4p4+TkJaKLRrxW4ZpY+oeDrL5lYp/+ZXnth
 rqrjo3zQQVLD17BJdey/SfB1SQnk+36L2Px2IvsIMxVEOxenWjMvstJ+B11G3HB6B/C5
 Cn+9vKXnGcsFR/+PjDxkEzfeXusTSFNUe/E6T6U8+ZCO7K3w4M0gRqQZWtM287f4mVnj
 c9/JgN3M1UFy0bBhjmotpIqP8QPIt07ivi+6EPG1QwhlAezF7OzB65zJCp/nRwoHqjrz
 I0sV6Fw9F99CV3XxjV/Ytg5S7ORZWBvOo3M8annpEQmMqJycOivU9no2STaeTu/YwUCm
 gAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G19OkqwUkgire3A559su7oqUaORn7ssYN+F9ROgHlGg=;
 b=EaYee/KRDPQ8aQDZpAeDf6it+Ow3L4axJoxlf8zgjZ+J/ZV96jXyJFxGbA2aS6uUaY
 2IcD829bTR59FpgeO49oFYnBMOdb+WS5KQYFU1UE3E3vufWJyBrcjGDp16p8LjFn6XGl
 8RN1ivNYpzCwAizVm1gz2E4Sn3lnPHfbn5WJkb6ZfznN5AKyCDUu+25WbXZjqmEn8qYT
 VfpG69CW74H3RrPAG1kPnJGoCVutxNIaCbrfOOve4z9ISf7OgARELh2hBQQAP1jHjIdn
 3hEnXSTVNnA3PD9bxJtW+5MOKD2t+MBMHgU/tbcg+/tevpxboRnf9xulPB5TpNSW4M+v
 IMRg==
X-Gm-Message-State: AOAM532XKKIxvVOcJkAqFlrkLk53bd+9etbU/GSTU9Mt+8BV/Nm0YZP/
 CPnikmjT7i9HTQgKhuGcE4OK3AUqJ2NWg1j3dkA9xA==
X-Google-Smtp-Source: ABdhPJx6l46DLl8yABcDu+yTQLTlCefcS0HIEI0/itPPEbLHldxn9rvVD1Ah+poiu4CCbl3gWvccNtJdgFVmd+OCtIM=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr5839955ejb.85.1621340714276; 
 Tue, 18 May 2021 05:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-8-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:24:57 +0100
Message-ID: <CAFEAcA-casxqgg-GJEckyTxRp3c2=kguU7YcOhvSYiFrnBvt-Q@mail.gmail.com>
Subject: Re: [PATCH v1 07/11] target/arm: Implement bfloat16 dot product
 (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Sat, 17 Apr 2021 at 01:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFDOT for both AArch64 AdvSIMD and SVE,
> and VDOT.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |  2 ++
>  target/arm/neon-shared.decode   |  2 ++
>  target/arm/sve.decode           |  3 +++
>  target/arm/translate-a64.c      | 41 +++++++++++++++++++++++++--------
>  target/arm/translate-sve.c      | 12 ++++++++++
>  target/arm/vec_helper.c         | 20 ++++++++++++++++
>  target/arm/translate-neon.c.inc |  9 ++++++++
>  7 files changed, 80 insertions(+), 9 deletions(-)
>
> @@ -13578,13 +13592,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>                           u ? gen_helper_gvec_udot_idx_b
>                           : gen_helper_gvec_sdot_idx_b);
>          return;
> -    case 0x0f: /* SUDOT, USDOT */
> -        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
> -                         extract32(insn, 23, 1)
> -                         ? gen_helper_gvec_usdot_idx_b
> -                         : gen_helper_gvec_sudot_idx_b);
> -        return;
> -
> +    case 0x0f:
> +        switch (extract32(insn, 22, 2)) {

You already have bits [23:22] in 'size' at this point, I think.

> +        case 0: /* SUDOT */
> +            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
> +                             gen_helper_gvec_sudot_idx_b);
> +            return;
> +        case 1: /* BFDOT */
> +            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
> +                             gen_helper_gvec_bfdot_idx);
> +            return;
> +        case 2: /* USDOT */
> +            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
> +                             gen_helper_gvec_usdot_idx_b);
> +            return;
> +        }
> +        g_assert_not_reached();

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

