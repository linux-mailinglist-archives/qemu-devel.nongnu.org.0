Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F53AEABA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:04:56 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKXn-0001Z0-55
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKVO-00086y-9Z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:02:26 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKVL-0006Ei-PQ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:02:25 -0400
Received: by mail-ej1-x629.google.com with SMTP id g20so29053865ejt.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L3Wj4UEcGQCzlBsRIZs3WYCSR+Lp/i36Px8vlqTyweQ=;
 b=JaJ3/7WkaliiYt7J1fSi1JvTeTf5G6zNVNus17kpb+ZE+F8d4VsNVuVZQNlHOEhCBJ
 bm4g3Pd3ucQlkpKbCHA9WpbIPXb5Q/TSSpOZL9TCmvlZj6PuPB+sdeW6uMrwHHhmf/zu
 0t/ABYQ/PQqWvqnkOYnA2n9eU72WM/EXMJGhh27siWubQFqQZjDdtV3cz7YNe0Cel7XO
 08Owrmy8tTI0Y1Zfog/tm5wL4Sp6gCLzhtKaSE1mb7nThizQAelfcnaAMjD43e7FL0hd
 GsrvF1HJDpMgfWvgTWUi53zAnMG5z++4/KRec2LG88Ue21ShxIA6RzuA1d5OWZyl/t0C
 AYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3Wj4UEcGQCzlBsRIZs3WYCSR+Lp/i36Px8vlqTyweQ=;
 b=OvHB+VzSgr/PonO5Bp9fYgQTX+lqUYs1mUTn2z1nLT123LORK9yl5daXrxPy8DCu5i
 luTAaNVzWUbQbDQDl1iyXSSWiIQCy28F3vFv2MfSb/bw6MkiPFFlUUf5QbMUIpPhtd4e
 ErzKRip+zktmbxKpXk6CQoEQFoFc3Whcr6XBZvXOp33dpUydj9uR/XKToRC9HrZkmr9+
 QQvNHb3Ck+q6fXswVqVHYZ0Enp4fnDNtHb2D5yeM9hhwUL2/vjeu0wa7DT7+d/iVdeJ4
 2yyHNcH6+gug1TDWgiHbGU8EcEBLeJk9lkDxvBOzEVsOvRtPa+hb97UqnG05w6f6Tgfy
 YTdw==
X-Gm-Message-State: AOAM530dDqg1y7Srn3usDqQTamW6zAaJediiosQRlDN3vVzVEkMSOdPq
 D2svDOV9Llf+5HJGROedVDm6wDf7hVRo0s2FOcBZHA==
X-Google-Smtp-Source: ABdhPJx869pbkjg3w5J61sqyD8cu/YA9XbyiYYODUZVvidUp0YPvJ/jSWB5edrZLNvLTqksttlO4to/VIHpdheURLOo=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr24708146ejy.407.1624284141805; 
 Mon, 21 Jun 2021 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-4-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:01:46 +0100
Message-ID: <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
Subject: Re: [PATCH 03/28] tcg/aarch64: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Mon, 14 Jun 2021 at 09:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 27cde314a9..f72218b036 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -2187,12 +2187,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          tcg_out_rev64(s, a0, a1);
>          break;
>      case INDEX_op_bswap32_i64:
> +        tcg_out_rev32(s, a0, a1);
> +        if (a2 & TCG_BSWAP_OS) {
> +            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
> +        }

Side note: it's rather confusing that tcg_out_rev32() doesn't
emit a REV32 insn (it emits REV with sf==0).

> +        break;
>      case INDEX_op_bswap32_i32:
>          tcg_out_rev32(s, a0, a1);
>          break;
>      case INDEX_op_bswap16_i64:
>      case INDEX_op_bswap16_i32:
>          tcg_out_rev16(s, a0, a1);
> +        if (a2 & TCG_BSWAP_OS) {
> +            /* Output must be sign-extended. */
> +            tcg_out_sxt(s, ext, MO_16, a0, a0);
> +        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
> +            /* Output must be zero-extended, but input isn't. */
> +            tcg_out_uxt(s, MO_16, a0, a0);
> +        }
>          break;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

