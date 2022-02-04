Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AED4A9FD1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 20:13:14 +0100 (CET)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG41A-000819-PL
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 14:13:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG3Ag-0004o7-J3
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 13:18:58 -0500
Received: from [2a00:1450:4864:20::432] (port=41928
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG3AF-0000IU-QH
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 13:18:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id j16so12790548wrd.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 10:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ilaCvhI8LN7LFnBfr5DtV8orBzPH2VNvuZ9aTcwMYqE=;
 b=qYthD/ju+/VxbKhAq1i/FQ8De834QCWGw+krfnIb5xpAy5jQlq/X7UoQGl+Bf2GXFG
 /+3U9QrUIJAr80oQ8CuCfB6gqCqPbNQKMsNLwGzX0ImuYC+TSjAvamNEikd8oHZkdEWW
 KQW+4DCgXp0Wrtax02vxCyFn5NYUfRZ55HUDGqoA5ok3LqUTFj1cTNNgSEQ9gIDGgdP6
 JvNdgQeFtHxY/Du3bAIsAMDvhKARxtv2dlltEXysWRjSlk1n83pdFEfSBZhlGoA1u4a+
 CbbiJoXzT4jfh91nzTBt3iHmiRwpPH3ZOJ3G9R08Uc/7G6hJgi2c1tumJtZOiiTzpmnp
 TF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilaCvhI8LN7LFnBfr5DtV8orBzPH2VNvuZ9aTcwMYqE=;
 b=lsz5i47/3+/cCEpWPCXjsW3rim+4xWeHs1dpnniimNrjRFODfKL+SvVytcYz8Z+oZM
 0KJqd/5JCdhdEK6zDRbC258EZ0ft8zsjPSibbllpqlPOrjBjfyNMKfLYFzkEe6nSzzNY
 WIgOQFC0GaWSwk7u80VwOo/62mN6PDAApcDbGWtTfE1MGn4bDat3lrK2mN9+cQXxnN6x
 IEERN5FIbgcMpeJMx1h0bKMMqBep8pzE28v1NtITW/mHpHD/zqHJw5812MoK8guK/X0P
 M1+peMBHK4dCbDU1miE3axHZaaTYnGs2ag7WfF2pveHq4OJU2Vcm1XKZ3N745Jzzmz83
 gCMw==
X-Gm-Message-State: AOAM532ukxNWBpe2VDX4LPjcli3qCrSFA3vW2JVjD/yWIs9qwkgCj6R7
 SekMQtfhvhZQcmCXWfIbKL3nz7mMp2/4ABQdzpcafA==
X-Google-Smtp-Source: ABdhPJyVNnBwTzaRPFKx01a1w31l3miB2RQpEmGBumZ/65D/Q2m9bnzCfSFTzKFN1jnzB5TbjtSHIPh6H/9TqIr8ynU=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr141977wrz.2.1643998709187; 
 Fri, 04 Feb 2022 10:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-4-richard.henderson@linaro.org>
In-Reply-To: <20220204070011.573941-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 18:18:18 +0000
Message-ID: <CAFEAcA8YyrASZw7Wj1c5fLg-60KUKPsC7eVA8+YhNTsVM4t2kg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] tcg/sparc: Use the constant pool for 64-bit
 constants
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 07:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 6349f750cc..47bdf314a0 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -332,6 +332,13 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
>          insn &= ~INSN_OFF19(-1);
>          insn |= INSN_OFF19(pcrel);
>          break;
> +    case R_SPARC_13:
> +        if (!check_fit_ptr(value, 13)) {
> +            return false;
> +        }

This code seems to contemplate that the offset might not fit
into the 13-bit immediate field (unlike the other two reloc
cases in this function, which just assert() that it fits)...

> +        insn &= ~INSN_IMM13(-1);
> +        insn |= INSN_IMM13(value);
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -469,6 +476,14 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>          return;
>      }
>
> +    /* Use the constant pool, if possible. */
> +    if (!in_prologue && USE_REG_TB) {
> +        new_pool_label(s, arg, R_SPARC_13, s->code_ptr,
> +                       tcg_tbrel_diff(s, NULL));
> +        tcg_out32(s, LDX | INSN_RD(ret) | INSN_RS1(TCG_REG_TB));
> +        return;
> +    }

...but this code doesn't seem to have any mechanism for
falling back to something else if it won't fit.

> +
>      /* A 64-bit constant decomposed into 2 32-bit pieces.  */
>      if (check_fit_i32(lo, 13)) {
>          hi = (arg - lo) >> 32;
> --
> 2.25.1

thanks
-- PMM

