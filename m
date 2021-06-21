Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22963AEB56
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:32:13 +0200 (CEST)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKyC-0007WC-Oe
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKwc-0006l5-4o
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:30:34 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKwY-0003Rg-Lx
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:30:33 -0400
Received: by mail-ed1-x530.google.com with SMTP id d7so19322690edx.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VsdapRQ8GJml2Nw8lQQNmOw1ENO2X+UDnTW9ki7YQgI=;
 b=RZSwcay5Ef3iUgas6PQlAk67xNuCldPfl4H2G80uZCGN+SykOdHE/n8ydgR/aScAO8
 AxuZ1u2jgjT122mnQb8kHCSw+ClxMg8LxBfF1CFWIoPpboCT+nHftRSYRJOuaswEHWM/
 5ZClHQ2fIP5o4UhD9xnmbkElmlXxpPs3RdUoRGGUG8nvkI5+cgSyKKP6/80Bb0xAIT4G
 YnqUcPXxoWMegdFNcD4QAwIf3y+7DkUaF15Rfp0MZ1sNtILzSfSb6LyZ0xgiF9ZvigO1
 0lvEN0sQq/Grs9LTFN4bDypTcmy1/ANiVrnG6a8ikaJAfCLEZZpz5OCGWJVZCeXOB9y3
 NHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VsdapRQ8GJml2Nw8lQQNmOw1ENO2X+UDnTW9ki7YQgI=;
 b=fNdfeGiCZ5+gk/bGNGw+Lj7etKO8kZD+Ws8HWthEHUcGsd5jbZMw1ksVCpalBCnxm3
 09W14fa9aLsmlYlyFo3X4uK/MJp9tNky4/FpyHqZ20bxGrxGjUGJC8FH9ffhvxEbZrIO
 vDz6A9Yn6ldpB23z43bYEA7Gp5qLjvfvasHwTkIJeeLNiXKGf9/WVQ7+IZMmyPzqvfyD
 qjrCrdaownXcpgXbROGL+D4ZQ1+EwkdZ+UDqTk5KPJOAP/lcKmoOOAHBluxb3wHacslc
 C10aMhs5T1WUQIlF0vg4SeuTl0drn3nyfHmqmj9/9IH+v2MEJaC2UbT+aYdHjAoGGSCs
 mldQ==
X-Gm-Message-State: AOAM533PJ85r2VpugBKK4BOZncqTcMSYEwjf6F9r4CRHyX5iUYcirYDe
 6bZpxrBwyQ+apbPws+slGEih2wkS3bX7NocESsn95A==
X-Google-Smtp-Source: ABdhPJyTUljVGHKSarZgqLeb8359jGmYMf+pyhXGTuVKk6u4sc1UYa1RJfQaNyCkC0vvKTygrDg4QR7iVDTf0S2X3Co=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr21552337edt.100.1624285829203; 
 Mon, 21 Jun 2021 07:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-8-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:29:53 +0100
Message-ID: <CAFEAcA9zwAvHApV0LTfKwXO6qtV=FgbDAVT-AzVEP6tgYW_SDg@mail.gmail.com>
Subject: Re: [PATCH 07/28] tcg/ppc: Split out tcg_out_bswap16
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Mon, 14 Jun 2021 at 09:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With the use of a suitable temporary, we can use the same
> algorithm when src overlaps dst.  The result is the same
> number of instructions either way.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index b49204f707..64c24382a8 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -788,6 +788,16 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
>      tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
>  }
>
> +static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
> +{
> +    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
> +
> +                                                   /* src = abcd */
> +    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 000c */
> +    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 00dc */
> +    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
> +}

TCG_REG_R0 is implicitly available as a temp because it's not
listed in tcg_target_reg_alloc_order[], right? (There's a comment
in the definition of that array that says V0 and V1 are reserved
as temporaries, but not a comment about R0.)

>  /* Emit a move into ret of arg, if it can be done in one insn.  */
>  static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
>  {
> @@ -2779,21 +2789,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>
>      case INDEX_op_bswap16_i32:
>      case INDEX_op_bswap16_i64:
> -        a0 = args[0], a1 = args[1];
> -        /* a1 = abcd */
> -        if (a0 != a1) {
> -            /* a0 = (a1 r<< 24) & 0xff # 000c */
> -            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
> -            /* a0 = (a0 & ~0xff00) | (a1 r<< 8) & 0xff00 # 00dc */
> -            tcg_out_rlw(s, RLWIMI, a0, a1, 8, 16, 23);

Would be nice to keep these comments about what operations we think
the insns are doing, given that RLWINM and RLWIMI are pretty confusing.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

