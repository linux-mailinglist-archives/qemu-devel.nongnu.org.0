Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAB32E763
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:47:26 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8vV-0006y6-8l
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8uM-0006Xe-Va
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:46:15 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8uL-0007Go-9L
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:46:14 -0500
Received: by mail-ej1-x636.google.com with SMTP id p8so2820371ejb.10
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rwaDuMG2kJ7I7wzgNYz42R9Ls+c3YhPcOZ4ZMpl1DQ=;
 b=xbj6daypf1QxpFCg7nX0/oIXVc7mftdRzxUemMNWsZ+X06WZm/sMZB+e+2uwIr3VjU
 pWRycGuf+SHjEuI7pRsCn9oBcTsDeG5IEmWyXqfbMIonopNpT0ft2Rj5+MKYJYMtlY4s
 i1t1tGSA3N0wWrzdvaRuo8wN4KIVfWE159TgEol/kCsi9RVxJDyMEeZ2yPT1PihYQpVr
 6TKSgGotgnstZ2OYQ3I++hlCsnIt2ZdSYWfXrEvFPMoO05qhS0uUDhCdBgMlh0eyQ1mV
 s9ajUdJrY4uEcSLRv02LKgGo9UV45gpLpPjCeklqV9XqXpAY8WpVZQFXHEWZibPLII2/
 bvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rwaDuMG2kJ7I7wzgNYz42R9Ls+c3YhPcOZ4ZMpl1DQ=;
 b=qY+m3aSqFVX260kV4U+uSS0wubnKsXRbq5BmCnNSR0syd09+aYD+ZeBZ2SEn1tUrUz
 3PEkYf7bPe3Jftf4bXA23RJldTiLbPK+6gERrgn5i54Y4Ps1Vj1ti+gG4jZn0onKnNvK
 BWTX3JV/9R3fB+mMXzVDuIgwYYEDAemwfZo7WVsv2B7Hvs2svgfmshZEGzR941p8Ba16
 CeB/jrxgWjpBEuh/bFQbqLB0JNj2qylrHS8OxqyZlfxBnd8kTWeHix/Dkf6aitEOz1TQ
 0dyifbu+TYhs+qhVUk+Gzr/h/AZbAFk8+bvswL0dxqe4SN3P4Sgr1/zb/naUE+kFHwyw
 yh6g==
X-Gm-Message-State: AOAM530FFCVGV1psreBjVGeFvsrtrRLS+Nn/cz55z5oB9sux1/EW/jP5
 IowYWBNhBuQW58D23Mqxf6vLcxD+HoLpNhCTMlSG2w==
X-Google-Smtp-Source: ABdhPJwo7tJ0yB7j+SMKxMOTklQnQXPVBxLXv5VxgYSZvj1HIUe9QTLffn89ax5bxbC8NTnRScWxmPU8xoZqULIcsG4=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr1859188ejj.4.1614944771472; 
 Fri, 05 Mar 2021 03:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20210228232847.322468-1-richard.henderson@linaro.org>
In-Reply-To: <20210228232847.322468-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:45:55 +0000
Message-ID: <CAFEAcA8bB+f7dvUU795Q-i7AhV_sru1LqgN1spyjT-AgaCySLQ@mail.gmail.com>
Subject: Re: [PATCH] tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Sun, 28 Feb 2021 at 23:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> An hppa guest executing
>
> 0x000000000000e05c:  ldil L%10000,r4
> 0x000000000000e060:  ldo 0(r4),r4
> 0x000000000000e064:  sub r3,r4,sp
>
> produces
>
>  ---- 000000000000e064 000000000000e068
>  sub2_i32 tmp0,tmp4,r3,$0x1,$0x10000,$0x0
>
> after folding and constant propagation.  Then we hit
>
> tcg-target.c.inc:640: tcg_out_insn_3401: Assertion `aimm <= 0xfff' failed.
>
> because aimm is in fact -16, but unsigned.
>
> The ((bl < 0) ^ sub) condition which negates bl is incorrect and will
> always lead to this abort.  If the constant is positive, sub will make
> it negative; if the constant is negative, sub will keep it negative.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> -static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
> -                                   TCGReg rh, TCGReg al, TCGReg ah,
> -                                   tcg_target_long bl, tcg_target_long bh,
> -                                   bool const_bl, bool const_bh, bool sub)
> +static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
> +                            TCGReg rh, TCGReg al, TCGReg ah,
> +                            tcg_target_long bl, tcg_target_long bh,
> +                            bool const_bl, bool const_bh, bool sub)
>  {
>      TCGReg orig_rl = rl;
>      AArch64Insn insn;

Seems like an unrelated change ?

> @@ -1423,11 +1423,13 @@ static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
>      }
>
>      if (const_bl) {
> -        insn = I3401_ADDSI;
> -        if ((bl < 0) ^ sub) {
> -            insn = I3401_SUBSI;
> +        if (bl < 0) {
>              bl = -bl;
> +            insn = sub ? I3401_ADDSI : I3401_SUBSI;
> +        } else {
> +            insn = sub ? I3401_SUBSI : I3401_ADDSI;
>          }
> +
>          if (unlikely(al == TCG_REG_XZR)) {
>              /* ??? We want to allow al to be zero for the benefit of
>                 negation via subtraction.  However, that leaves open the
> --
> 2.25.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

