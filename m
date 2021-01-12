Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B672F2E87
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:59:54 +0100 (CET)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIL3-0004mS-9k
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzIGd-0000aG-RE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:55:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzIGa-00022Z-VE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:55:19 -0500
Received: by mail-ej1-x62e.google.com with SMTP id jx16so3071548ejb.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEzhZCfrtTtH2u81Qqj+uLzON3bRIk4OeXsy2LlLF2w=;
 b=VCutpBU91tOwgT5Zr9RGMORAglY40JFgBR8csExIpHDLFHdfOyirZOmeKA+riw+Nr3
 zxbUqMQOKzG0t7d9sDsvjP2AFMYYlMY1Pjb+TUmOlIuykdEnaO/0iICFTYjEe7/Gqly5
 VF8ARMJnx2HpgsljDrjpQE4Oslq6XoaiwGtybhe0V6z1bk1qpqqr35qFWGtuPuTMJ4QQ
 zcl7caAyCjOgmEIFshdmjXbf9L/8NlG01BSTqEtuxiLQdQx4UdyDjTdIGYR35BqdhUHe
 KsXysuaJm7R71/LfKl8iRT9gUrVQlZpuueZZJF20gvxhx/RglQRkYEychjsurij518wy
 DwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEzhZCfrtTtH2u81Qqj+uLzON3bRIk4OeXsy2LlLF2w=;
 b=S5iPxAKAeWuUMmAZGsY73st6s9w4bBpKvNBmcdNS1DpODHeZpBEpf2bKX7o/hRb9xB
 LwQvpIijxArRldCgHp/2izdk7dmth5gYcFLUBBrPkBy8zeiEcw99ulnpO3RvRBCDNOGn
 He8zBTU7PZl/b+oHHTS7R6kieIE8a18amKxouhvfUoUpz+U1NtbjUyikNC58tHGBFDyQ
 HlQBcEsTnisiCtUgLQhuIsyLebESYe7uuvZlbAIQl4y3dMvfOkVk0eptYIxth3ApcchO
 JF5SwXWZ12eMLX+jCY2LlcLb6TyPvPFhobMvkwkCyuMBmb2LQMLK2x/bh4vLDoBhtr98
 LuzQ==
X-Gm-Message-State: AOAM533LW+xCjgQatw0I6X4DDDyKe4eC7XshczY15r//3LnuIVh9Vsr7
 3T0+GgxCIebKaNiE4T0dg81F1IPY4Dbc5HwWN6y2iQ==
X-Google-Smtp-Source: ABdhPJy4yIsCmAW8+Y2k4Zu03Zd0/G6OQDSlr8CuIWVSr8SIo/mGFU9UWg3TubMunDzwYjJG7JopHEz2jijzi6WuHLk=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr3002388ejr.482.1610452514641; 
 Tue, 12 Jan 2021 03:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-14-richard.henderson@linaro.org>
In-Reply-To: <20201223060204.576856-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 11:55:03 +0000
Message-ID: <CAFEAcA8RQpapqB11rza_yyi_XkEO2-tb41Mh9cvWfX_zKJLiJA@mail.gmail.com>
Subject: Re: [PATCH 13/22] tcg: Split out constraint sets to
 tcg-target-conset.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Wed, 23 Dec 2020 at 06:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This exports the constraint sets from tcg_target_op_def to
> a place we will be able to manipulate more in future.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target-conset.h |  44 ++++++++
>  tcg/i386/tcg-target.h        |   1 +
>  tcg/tcg.c                    | 126 +++++++++++++++++++++++
>  tcg/i386/tcg-target.c.inc    | 189 ++++++++++++-----------------------
>  4 files changed, 236 insertions(+), 124 deletions(-)
>  create mode 100644 tcg/i386/tcg-target-conset.h
>
> diff --git a/tcg/i386/tcg-target-conset.h b/tcg/i386/tcg-target-conset.h
> new file mode 100644
> index 0000000000..5a4f991d78
> --- /dev/null
> +++ b/tcg/i386/tcg-target-conset.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * i386 target-specific constaint sets.

"constraint"

> + * Copyright (c) 2020 Linaro
> + */
> +
> +C_O0_I1(r)
> +C_O0_I2(L, L)
> +C_O0_I2(qi, r)
> +C_O0_I2(re, r)
> +C_O0_I2(ri, r)
> +C_O0_I2(r, re)
> +C_O0_I2(x, r)

I'm afraid this is completely incomprehensible to me.
Can we have some documentation of what these macros are doing
(which we can then reference in the comment at the top of each
conset.h file)?

thanks
-- PMM

