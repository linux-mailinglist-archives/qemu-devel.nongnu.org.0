Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42E3AEBEC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:03:21 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLSK-0001mD-Oi
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLRL-000166-3J
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:02:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLRJ-0005c9-7e
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:02:18 -0400
Received: by mail-ej1-x62d.google.com with SMTP id my49so29246008ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVfMLPlQ9hy2FdA1OvvvmBoovNiM1NMbpUOAZ6syESY=;
 b=cOT4t4CSlvfunf/pvJsTPPi2BV17CotilEeYky2sS036gbWgSLpqmclOM6OhX98MNu
 UP+eZuICZgRyisN1gYeMjd/ejbcfvt3+s33mKIpBWihPCA7ded4tCzlB8P4el//rLoHN
 wFmgElXFjUAazr4DG3WZuUje1P5/z1ylH56hDsSFn+riU76rxIEdjGRR4Kr9e2OJd3et
 SQubX3T5wglqJbJ5VTC+ubpXxqTxzmqNtQ6lWrxGtQA0anCa1Fc8hcyXAqnzB5HdCE6G
 fO91tV2n107DQyV5cvVK92NCDnrioyyn/m/B1zs17qYr3caa3mvGB9CCcJbr77qMCQ+b
 RMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVfMLPlQ9hy2FdA1OvvvmBoovNiM1NMbpUOAZ6syESY=;
 b=Tc1aQxV4qcgFZAQxkmCjCtIUwS8rkI1P1y9MJ12eZtu9SFqhxzKEECdxOsQzy52S1z
 uh9lJp7P9Uz0Z5zJxYM8w/S3WvsyG/vygWeTKkA8Wkpasor7QkodPKIMQW3K4HbwOB58
 rQORldVlncQqMQsNKfHzsI7q0FenVEhxJmnTOqjkkiY425oH2yRHc37xyeD9TTvpXAEj
 oP0hN7nOqaWeBMp6ZArwwbAuIJs47eb5ymx1TEoZcKA5UDVFXcG+lvKCOFjJIYNaQJmB
 /l/gO2s0woqJykmGY891867uXu9MeOmY+QRf84aBKYFisatlnXM7hu1QP8BvqvSVURz6
 +Mpw==
X-Gm-Message-State: AOAM533cCnJprEe5BgW85tn7Bc5fPJPMQKrtLG0QuZNXoXN1SnmWlIuS
 0NyBZCrNMXQ2CLiMR7jqmDBK9eq4/EJ0LajZoG896mDGgtTk5A==
X-Google-Smtp-Source: ABdhPJwVykJWCw6TChmRajNYmYEVYxDXenW8Olm4x/Wvi8NijDHd0ZUOEnr/eiw9IQYoJbvDX19HOYu6Nt9BMYul2j8=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr5387617ejb.56.1624287735141; 
 Mon, 21 Jun 2021 08:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-18-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:01:39 +0100
Message-ID: <CAFEAcA9O6qPDsGsHg=sMkZcfSp5vOdibxHeyhr_OD1PueG7hsw@mail.gmail.com>
Subject: Re: [PATCH 17/28] tcg: Add flags argument to tcg_gen_bswap16_*,
 tcg_gen_bswap32_i64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement the new semantics in the fallback expansion.
> Change all callers to supply the flags that keep the
> semantics unchanged locally.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index dc65577e2f..3763285bb0 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -1001,20 +1001,35 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg)
>      }
>  }
>
> -/* Note: we assume the two high bytes are set to zero */
> -void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
> +void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags)
>  {
> +    /* Only one extension flag may be present. */
> +    tcg_debug_assert(!(flags & TCG_BSWAP_OS) || !(flags & TCG_BSWAP_OZ));
> +
>      if (TCG_TARGET_HAS_bswap16_i32) {
> -        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
> -                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
> +        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg, flags);
>      } else {
>          TCGv_i32 t0 = tcg_temp_new_i32();
> +        TCGv_i32 t1 = tcg_temp_new_i32();
>
> -        tcg_gen_ext8u_i32(t0, arg);
> -        tcg_gen_shli_i32(t0, t0, 8);
> -        tcg_gen_shri_i32(ret, arg, 8);
> -        tcg_gen_or_i32(ret, ret, t0);
> +        tcg_gen_shri_i32(t0, arg, 8);
> +        if (!(flags & TCG_BSWAP_IZ)) {
> +            tcg_gen_ext8u_i32(t0, t0);
> +        }
> +
> +        if (flags & TCG_BSWAP_OS) {
> +            tcg_gen_shli_i32(t1, t1, 24);

t1 hasn't been initialized yet. Should this be "tcg_gen_shli_i32(t1, arg, 24)" ?

> +            tcg_gen_sari_i32(t1, t1, 16);
> +        } else if (flags & TCG_BSWAP_OZ) {
> +            tcg_gen_ext8u_i32(t1, arg);
> +            tcg_gen_shli_i32(t1, t1, 8);
> +        } else {
> +            tcg_gen_shli_i32(t1, arg, 8);
> +        }
> +
> +        tcg_gen_or_i32(ret, t0, t1);
>          tcg_temp_free_i32(t0);
> +        tcg_temp_free_i32(t1);
>      }

>      } else {
>          TCGv_i64 t0 = tcg_temp_new_i64();
> +        TCGv_i64 t1 = tcg_temp_new_i64();
>
> -        tcg_gen_ext8u_i64(t0, arg);
> -        tcg_gen_shli_i64(t0, t0, 8);
> -        tcg_gen_shri_i64(ret, arg, 8);
> -        tcg_gen_or_i64(ret, ret, t0);
> +        tcg_gen_shri_i64(t0, arg, 8);
> +        if (!(flags & TCG_BSWAP_IZ)) {
> +            tcg_gen_ext8u_i64(t0, t0);
> +        }
> +
> +        if (flags & TCG_BSWAP_OS) {
> +            tcg_gen_shli_i64(t1, t1, 56);

Similarly here.

> +            tcg_gen_sari_i64(t1, t1, 48);
> +        } else if (flags & TCG_BSWAP_OZ) {
> +            tcg_gen_ext8u_i64(t1, arg);
> +            tcg_gen_shli_i64(t1, t1, 8);
> +        } else {
> +            tcg_gen_shli_i64(t1, arg, 8);
> +        }
> +
> +        tcg_gen_or_i64(ret, t0, t1);
>          tcg_temp_free_i64(t0);
> +        tcg_temp_free_i64(t1);
>      }
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

