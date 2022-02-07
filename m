Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4BE4AC831
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:04:59 +0100 (CET)
Received: from localhost ([::1]:50942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8Nm-0003Vr-EI
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:04:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH8J1-0001Jy-CP
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:00:03 -0500
Received: from [2a00:1450:4864:20::433] (port=34570
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH8Ix-0003pV-KI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:00:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id f17so26336090wrx.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D+qmHieBxwVL4QpABlQBythkquE7Whfogd18rErZknQ=;
 b=D/m6ChSJlv5CCefkVlj99a0qy4lQ2q9xTVrAbkP1FOGvqUQVwt/IDMS1AAZ4zJR4IH
 qPD3tvQ7niQa+TMa1lQP7vaJMq+BEe4fom/aGCLV2XHDrXJNnbYxO0VRMMatWqKJW/yR
 OcTI/uKm7FRnYk27EZT8dpMYX8vP7SV1aQxhYtBMmfSZEofN/IJJ/KeSfsBIYVIhICkM
 w6q2kXxTK5jH+MWF27vtYY82GtlLE2F3DVasaqL14f/w0VKlaEIL90/8SQrl/HRPDTCB
 IptlQAvhPBJlOVICgicVDsLfvmFCITFaifnTvXKdFOH60DBu5hWC1ZlTP8JLr1vjypSi
 irEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+qmHieBxwVL4QpABlQBythkquE7Whfogd18rErZknQ=;
 b=ECfCUh0Vlz0WpmklCF0MyqtdAvybGueGMK95bOD5lNOP0jmEB1gRK0Cie9kc8jVpsC
 fpzz/HXj9amzu9PJ3Ggg/2pzW3c80yqVACDj8rpnL5GNEUaX199+pehAz+CG5oew08Pw
 ZWGGxFZIa21sKXl2IBKoKVlFKar/N7sJ3HBh0UVMuaDdGo4itzqES6/Nu85qVClWOlvA
 dsWTnLiGFPTZ5pB6OyxEqmtdE4qRrG9t7i2LpQ9cD5qnFXzpP8o7+DvsVhmHXuoPwDad
 P3wj2nvIO3k0de3y0zqxi4PdPnnxag4pBMb2sLZgty+ZLo+V09tDmWPyA2CuAUQdyxat
 YT3w==
X-Gm-Message-State: AOAM5337Tt0a+O8XCbtw5eHX7S9l/37mGCvmQtpbUp8ySG/Sx5SB6M90
 gn9X+s9v/XlAV1cWDVJli4c3jpwm6qveAgAViVB0yQ==
X-Google-Smtp-Source: ABdhPJyQZdB6y0/DiSAmp8LFJnTNzQz4Z5t7XUca+xXOWYnRq1BH61r8OdpaYj2XySZZMtBbLNHNhnYLmf7EXGi+bQE=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr540060wrz.2.1644256797918; 
 Mon, 07 Feb 2022 09:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20220206103138.36105-1-richard.henderson@linaro.org>
 <20220206103138.36105-2-richard.henderson@linaro.org>
In-Reply-To: <20220206103138.36105-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:59:47 +0000
Message-ID: <CAFEAcA-dW89Q829RBPEp+wuPXvpDp=UXa1xzf=qJirxExddtCQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] tcg/sparc: Add scratch argument to tcg_out_movi_int
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 10:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will allow us to control exactly what scratch register is
> used for loading the constant.  Also, fix a theoretical problem
> in recursing through tcg_out_movi, which may provide a different
> value for in_prologue.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 0c062c60eb..8c3671f56a 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -414,7 +414,8 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
>  }
>
>  static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
> -                             tcg_target_long arg, bool in_prologue)
> +                             tcg_target_long arg, bool in_prologue,
> +                             TCGReg scratch)
>  {
>      tcg_target_long hi, lo = (int32_t)arg;
>      tcg_target_long test, lsb;
> @@ -471,22 +472,25 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>      /* A 64-bit constant decomposed into 2 32-bit pieces.  */
>      if (check_fit_i32(lo, 13)) {
>          hi = (arg - lo) >> 32;
> -        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
> +        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
>          tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
>          tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
>      } else {
> +        tcg_debug_assert(scratch != TCG_REG_G0);
>          hi = arg >> 32;
> -        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
> -        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
> +        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
> +        tcg_out_movi_int(s, TCG_TYPE_I32, scratch, lo, in_prologue, TCG_REG_G0);
>          tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
> -        tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
> +        tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
>      }
>  }
>
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg)
>  {
> -    tcg_out_movi_int(s, type, ret, arg, false);
> +    /* When outputting to T2, we have no scratch available. */
> +    TCGReg scratch = ret != TCG_REG_T2 ? TCG_REG_T2 : TCG_REG_G0;

Why won't using G0 trip the assertion above that scratch != TCG_REG_G0 ?

> +    tcg_out_movi_int(s, type, ret, arg, false, scratch);
>  }
>

-- PMM

