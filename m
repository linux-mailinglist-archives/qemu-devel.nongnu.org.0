Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F54755BB29
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:38:32 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rkt-0008H3-4i
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5rMG-0005nP-Is
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:13:04 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:40552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5rME-0001aZ-Ko
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:13:04 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-317a66d62dfso90475227b3.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BSvE1ZTuE+EoqToDl4loDG0Q8vp56zKQmic1ZPoEdvk=;
 b=KW21QLuZnWoreV8uf0759UCjf1r/hjM86l45HzlcpgXJ5gshQtPWeKqkgdqUXWJtzK
 GyrsWRa5n3pUmhrOhFfY35gosKXpzU9bjzW4X6Xh4iZowGsXQhuQjaFuk4aDEiORBH0o
 +erJKgYgv0FZW4ZSQ3zNmlDHT+cmf5GeDgrCT1Emd3OXltTPIaY+Kq43nD4y4IbMWD1S
 m2e2iCCNNZ8oljNgYQqiSjEXTraVDAfZg8tkM14I0Zs2XR/p9xAtFJ6QHvLtUywCDobx
 MAXxRt9aNUMp6lvQzwwJ0/DxOvIQ+YPf+yL/tMOrEid9Ftf//JzOROGj9/8Id45SWctC
 yZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BSvE1ZTuE+EoqToDl4loDG0Q8vp56zKQmic1ZPoEdvk=;
 b=TZjzgqkxMR91RA91IkMuxxwoCJmeEdrbPaWqOmkowsSddACk80dNjIiQyS8KZ+bJLO
 xiiKG60FhYcWv0bTVcpb+Ti/rQiQrS0gN7jW2d+Q4XV3K5QDuCcey9HbA30cRa5Nhjyx
 Ky4LjPjb312JzNwTFTU3qhjxxE8aN0MRrCtp544z423ZOstFQOIqx3bYPtWNsgRVm7HJ
 6M408ggZtmYR5AMeCyn3G8KCGdwN2wCjYtrNhE2uWZ4phZgCmSx03/wHFZSOn8QBaLPs
 Ox93IZfQbaJ+gLFZHoAhpJlHDAiSkYCaQpkRV563MYqG2tI/BhSmFuSwpZ2ovya4yJBQ
 c1AA==
X-Gm-Message-State: AJIora+uwQsabRa3TrNCeTSLQsnU8kno3JwrUrQGsNeGSwwmDMukeRRb
 XFfakTe+0AvXCHUW/3AnhOCCnZTdtqZOgKFCmNdQcA==
X-Google-Smtp-Source: AGRyM1tYoFKZ9L/uekiyGfMXATpGTvHkRBxcujVAp8Uhb2t9GISI3tmxjNlzIAa1BdXRr/68TJGekaWGSqoBVOaKnd4=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr15023264ywg.329.1656346381282; Mon, 27
 Jun 2022 09:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220627160734.749861-1-Jason@zx2c4.com>
In-Reply-To: <20220627160734.749861-1-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2022 17:12:23 +0100
Message-ID: <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
> kaslr-seed property was added, but the equally as important rng-seed
> property was forgotten about, which has identical semantics for a
> similar purpose. This commit implements it in exactly the same way as
> kaslr-seed.

Not an objection, since if this is what the dtb spec says we need
to provide then I guess we need to provide it, but:
Why do we need to give the kernel two separate random seeds?
Isn't one sufficient for the kernel to seed its RNG and generate
whatever randomness it needs for whatever purposes it wants it?

thanks
-- PMM

