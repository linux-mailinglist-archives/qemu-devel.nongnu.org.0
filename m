Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995643004D1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:06:21 +0100 (CET)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2x4u-0007Nv-9X
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x1D-0006HV-Tl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:02:31 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x1A-0002NQ-Q6
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:02:31 -0500
Received: by mail-ed1-x532.google.com with SMTP id bx12so6646444edb.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovmnVInjHZhWRkbSKOjIOLVvM+0ket6BTwAo/sK0J64=;
 b=bXrXGvaoN3Pi3F17SavZVCiGj753gq1nvEmqcmOZzIJ1JutIkDlj34nfk57mGNVxQI
 g6HW0ahIhd40i1O/SQQqoJBTE7TherXs1qN1xUDo+JcI+zpjzYcdbJcFyeFq0B6DRjQ8
 FUIrMVt/nIIhPk2hG+WcM0tULzrLhfNSTXIlvCgkG2urzvuUeZ/h+cCgM1gyDumR6ZrR
 VkKl9R/IihPcxMyLDjr4/wgkTvi1vmhIdm/Nqzq7bV4yuGAbNOgMni3OuFB80j8qVSte
 g8OHTR9bwTCqjcAXh8ASGXASyHpl+bng/EhJYpyrn+Gr+wahDbLhJt4AyJiIMLEO2VfP
 z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovmnVInjHZhWRkbSKOjIOLVvM+0ket6BTwAo/sK0J64=;
 b=pACaXzznGBuhDZQGDUPPlS0zMcLZrzC2dbXKEa7Vka0Nw0t+Im8Aa91n/YO1Myakcm
 cVOsQcvjLKmMWo1TLkmNN2gcDgmd2Avr7X7Kx44feTuLyn8kjELsWXBVavlToOhgyA8h
 SDfo4X5FRNPzxx8uxxAefbNVxIOABxUWs2pJ2adDWSW2dqPvfqEzCqJR5isSE6vlkkd+
 +b/0wpn0acqngtf/giyEOH9YKiycBBt+7aiSXh64RanO8IYsS9x/0GSCoVCr/qPfsz3y
 J8ZKwibf89v4+/ZsQm8KiA6+cQz+U4h/ZlYnH4KKemQUnNku4NWJcEmVPS22r5GmP28r
 iZBg==
X-Gm-Message-State: AOAM532Dka+MNkOgic5kmPulC7lUszvsgdRWgusUqszILFPifnGZ1Q/z
 CgMQzyu4H7ztn9cm1vImouOd/IKiZ6DRGjc3r+OFNw==
X-Google-Smtp-Source: ABdhPJyM6Ta22f/+xGBKUBsniswfOLV3aK2UkYt5Q9KgajDc8bSR0bLcZxbHKQ87WKU0l3tu+RsPZwDy4w56JY1HB9w=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr3264185edb.44.1611324147310; 
 Fri, 22 Jan 2021 06:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-21-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:02:16 +0000
Message-ID: <CAFEAcA-iTzra0m+xNQNuKA7uQ9Yv1=wqSUykYhSG44B4YkxDmw@mail.gmail.com>
Subject: Re: [PATCH v3 20/21] target/arm: Enable MTE for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index abc0affd00..5e613a747a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -208,6 +208,22 @@ static void arm_cpu_reset(DeviceState *dev)
>           * Do not modify this without other changes.
>           */
>          env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
> +
> +        /* Enable MTE */
> +        if (cpu_isar_feature(aa64_mte, cpu)) {
> +            /* Enable tag access, but leave TCF0 as No Effect (0). */
> +            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
> +            /*
> +             * Exclude all tags, so that tag 0 is always used.
> +             * This corresponds to Linux current->thread.gcr_incl = 0.
> +             *
> +             * Set RRND, so that helper_irg() will generate a seed later.
> +             * Here in cpu_reset(), the crypto subsystem has not yet been
> +             * initialized.
> +             */
> +            env->cp15.gcr_el1 = 0x1ffff;
> +        }
> +
>  # ifdef TARGET_TAGGED_ADDRESSES
>          env->untagged_addr_mask = -1;
>  # endif
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

