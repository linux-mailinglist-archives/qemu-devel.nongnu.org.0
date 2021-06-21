Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A953AEB91
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:40:54 +0200 (CEST)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvL6b-0006Uw-OA
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvL52-0005g0-7y
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:39:16 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvL50-0000IL-Hq
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:39:15 -0400
Received: by mail-ed1-x52d.google.com with SMTP id m14so2585487edp.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKG3AhJsalJMKC1e6c8rrVhna9Vj2025UhS5wtyg2/0=;
 b=x61gplDp3ONy7SE1y5I12V5t5EIqyfUCQLxt0svgByOQ7lErJB7iSxu6pUr6z/+1Fu
 6ENRDCy63mMTw+EMcuovQbyqmRcDmocC7RXyLYamt+A5tx4jCzCjUmcsa+iunp0sVU1p
 I1JfJLBujqeoY4jlAKFMJA2h+V0LtKr9NebY4ski45E2lenOmeN2wY9RuF4ZyIm0u9PB
 ivACjPNjYHwrEM1pIIlSERjyaiUJJMfh7b1QXRueTkk9Q9ifNsxNgEHJqHGuKCTt9axz
 IqZM8615ucOX7N308VGPuqovPqN5SBLCvLMq6AvVbCX/MZOiUir6eBdaLpLJItze7Ohn
 C8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKG3AhJsalJMKC1e6c8rrVhna9Vj2025UhS5wtyg2/0=;
 b=s62poJtdTZvfcWQdFSPG0C5vz9F7c9tB9h+NbdYhkR+As+/fA+utF9WEzG54ujrY0i
 jzfXrRnmVZ692UmWVD8XD2Mpdd6IeULz2RQG+cFQEONFjHTx7HYxeY5yHP9rv4H63ymk
 kN9iQRL2woE8Dd5tdnKBBu+444+AuPZFpV5qK9KT8VohIDX7vcKB5iM+RuEyL4lPiCR6
 H4oxaEeUYPRdfw03fQWbtXaDo31HP295r0VC7kfrX1cUDycx3X+t2tfDr8Ka6f0GsxAL
 xAGKcPGDhsfmOqdHsw/nnl09BN4PnLTVTIOeiNZLzk4ErvKoGodKu+dCmbKjrz8S+pLp
 5ctA==
X-Gm-Message-State: AOAM532vzmuEPaYoFONPgkO451pbbzoGU0wGtBqH3QsQUxJyChY32RZT
 a4RyH2czkeGe6FmEGFX16i/WHkUU9rgRz7mQkuLYLw==
X-Google-Smtp-Source: ABdhPJw4gRcpfUY8yRUsVcOi1Fj5c7AJ9cz0wYQ3jN3LsdH3np3zBzN+O6jiM+CcwB5KzxwrNEilIChTT9JZctAhl8w=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr20777018eds.36.1624286353060; 
 Mon, 21 Jun 2021 07:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-11-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:38:37 +0100
Message-ID: <CAFEAcA-Eeg7kkQyFrGd1xw0pkC2vAkJvHteHy+WkhVp2CZK=Mg@mail.gmail.com>
Subject: Re: [PATCH 10/28] tcg/ppc: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Mon, 14 Jun 2021 at 09:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For INDEX_op_bswap32_i32, pass 0 for flags: input not zero-extended,
> output does not need extension within the host 64-bit register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 690c77b4da..e868417168 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -788,25 +788,35 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
>      tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
>  }
>
> -static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
> +static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
>  {
>      TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
>
> -                                                   /* src = abcd */
> -    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 000c */
> -    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 00dc */
> -    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
> +                                                   /* src = xxxx abcd */
> +    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 0000 000c */
> +    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 0000 00dc */
> +
> +    if (flags & TCG_BSWAP_OS) {
> +        tcg_out_ext16s(s, dst, tmp);
> +    } else {
> +        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
> +    }
>  }
>
> -static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
> +static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
>  {
>      TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
>
> -    /* Stolen from gcc's builtin_bswap32.             src = abcd */
> -    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = bcda */
> -    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = dcda */
> -    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);  /* tmp = dcba */
> -    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
> +    /* Stolen from gcc's builtin_bswap32.             src = xxxx abcd */
> +    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = 0000 bcda */
> +    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = 0000 dcda */
> +    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);  /* tmp = 0000 dcba */

I'm going to come back for v2 and review the version of this that has
the comments describing what the insns are doing, so I don't have
to try to cross-reference back to the earlier patch.

-- PMM

