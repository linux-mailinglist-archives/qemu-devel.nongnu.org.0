Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013EC3F2D39
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:36:25 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4h5-0006hk-MF
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH4gE-0005xl-KJ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:35:32 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH4gC-0006zl-DA
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:35:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id e21so4417686ejz.12
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfFMVdk/O9doC8hwVkbP4x7afoOO3wRuiwMkaptdrBE=;
 b=lXNRrjyE1hGBpK4fxLyphXOhiFXGFDx1Rnrqt5xtLd//GTKn9U81BPIuaJBEXIREzV
 KgDKg5qX1oje8l5EPbawmVzaaCDbqErhmBh/8kDqemwon0J+n3QNCgzBhR5e/e+vPR/C
 Kevj+YK1enNIBAHLwIgo335WuqTOCS7vHFnGs47rcBsw6ck1J+mHG8m6Hbo9t+MpU3c+
 7z2pUcZCZuqWyG/tMyQEgOJMMQlvl+ej/98ueRNR6LOdC1kq47XVhXulsp4hq/x3+5e/
 o2cXYXLedTWYTbqSs+9FKThMwqMTEYxLhGSUhGp0aKayauDMWDQ0Kjo6w9GNxPXeYz69
 0/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfFMVdk/O9doC8hwVkbP4x7afoOO3wRuiwMkaptdrBE=;
 b=sQeGy087e8Fnm6pF08qvgguostek9iOnAbW0PHtmwllbUeDPMAjJ5+hxPI31TOHEo4
 ok1uC9Ycw7rm9vEhMpkCqIcYid8dAyT4LtywhkPunbrrpycbbF+KTO2nNgR2+O5eHoYE
 vLaAIlmW5wFB1Ngz+lHNMUz//9gvwMKzWxBUBvhsa+FqLjCQUaOD4MKI4GKxMAqkqzjj
 es9vP+F5Mq7cx3XKFpm+3KE5DC5Dbka/J6WdWmyYGiPHiCj0Vos+96KhOT7VdzgO3aXP
 Quk6hHfBKFWgxR3TtMjABm1ahLNyFQiABGqAlwfuYblOPNy964Bri9W7woxjsFIVPi+n
 60ng==
X-Gm-Message-State: AOAM530JPnBMbwdyUf6JlBEYkfVHg8dBZZKPc6m8ZNpANxzC5SLovm+0
 LHd1S/CBOWSPKrXEG2WeAP5/1dspsUQI0ktx+5jAAg==
X-Google-Smtp-Source: ABdhPJzZlxQaXyjEUuUDLDRQMDinSaujTxb8NZHSO/BCi6sMIvuLwUngWdKxbu9nlDZTyjUbRqq1uh06uwcVx3C3dw4=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr21692939ejy.407.1629466524734; 
 Fri, 20 Aug 2021 06:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-7-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 14:34:38 +0100
Message-ID: <CAFEAcA9KYVCwOR8ExCQqw-gcM=7EfEpdiRwSP+GGH3rNMh4zFQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] tcg/arm: Support unaligned access for softmmu
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

On Wed, 18 Aug 2021 at 22:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From armv6, the architecture supports unaligned accesses.
> All we need to do is perform the correct alignment check
> in tcg_out_tlb_read and not use LDRD/STRD when the access
> is not aligned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> @@ -1578,27 +1576,32 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
>
>      /*
>       * Check alignment, check comparators.
> -     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
> +     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
>       * to reduce the number of sequential conditional instructions.
>       * Almost all guests have at least 4k pages, which means that we need
>       * to clear at least 9 bits even for an 8-byte memory, which means it
>       * isn't worth checking for an immediate operand for BIC.
>       */
> +    /* For unaligned accesses, test the page of the last byte. */
> +    t_addr = addrlo;
> +    if (a_mask < s_mask) {
> +        t_addr = TCG_REG_R0;
> +        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
> +                        addrlo, s_mask - a_mask);
> +    }

I don't understand what this comment means or why we're doing the
addition. If we know we need to check eg whether the address is 2-aligned,
why aren't we just checking whether it's 2-aligned ? Could you
expand on the explanation a bit?


thanks
-- PMM

