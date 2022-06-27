Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282F55BA24
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:52:18 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pA0-0004eX-2q
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p78-0001pK-6j
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:49:18 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p75-0004iz-OM
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:49:17 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-318889e6a2cso85907897b3.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PrSSOU1MxC97YvB8zwD/+lVO9ZgziE4COhqGOgdk9eQ=;
 b=Fhgle95x9ZlmlXWLgoWMnQXRQod5n2wFdnycspWMSVD1bz0KOjtzl//BQ1sa2lsprV
 K/YQ0n9a1Qgsf0q8W7VYEASbcx+VKJlqktmoR53P2k/UhrqT5CdQVuFEKvY9auf13RS9
 y3LUc9Cw7fTF/RqyUuPSwsA1uAlw2pwNXKUZyfpKIH+uvPciYb9X9oXabfiD2RW2eu5T
 JtrLDXQPFsFyTHuswIZG38VtUAjZhxfdmkoqwyzJvwN17QaAIZ1YeoYAbH+CNvE3yN1Y
 YjCAVq/Pg945MzukQFXEpKmF0v9mFV8gYTUL6SeuqI1U/q2zF789+CIYVeAOOlM+ncEA
 1Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrSSOU1MxC97YvB8zwD/+lVO9ZgziE4COhqGOgdk9eQ=;
 b=2Ca0ehpbVup4GO2FEZWeomnETZ/kKYbstLh1wzvA0oPiJvuuWgFlv9hdEe03gn78yH
 Cn26PN4tE1wV9c8hWDNnPMuIlm/EPk1D0WqhWDL3w/xf7CAzpmDiWoaWn7G8TYoeWaeQ
 C5CfkQpUKSczrfxACt533EUTPgDL2jhaMna7rJGBGbsy9blI6LffxLKH5nSVEehu00AE
 JgBoke2LU0Umcg3YFRIwfxuwKSMGuqLXjKcffAONNojWi1HpvvMHj+4cIgwAzlLrvIYO
 OftlNNa4GTYxuGhQcxvG70FSiXSKDOxP/FBvgLHHvC9UlZa9q8P/AepMQ64vTxuDnSP8
 HKFw==
X-Gm-Message-State: AJIora/yzcNpKIsILJtBt5OT6AYJLOVrki2Zx7z0An83jCdS0EyXsq7q
 6ucnBVObQ612O2SGJabUd9+2vq6GDYPjIaIUbLGPPA==
X-Google-Smtp-Source: AGRyM1tY/C+VJYycQ3GiFFn1nNDsWVEcYyaSsZ/yFI7sXhuzrhjriIA4qIlWR/g/WEDbUowITm8UQa6/fv9kaJEJfY8=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr15190034ywd.64.1656337753031; Mon, 27
 Jun 2022 06:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220627134620.3190252-1-peter.maydell@linaro.org>
In-Reply-To: <20220627134620.3190252-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2022 14:48:35 +0100
Message-ID: <CAFEAcA9UE0P=gU9Q50y6OuZN_0tO6mFO7d-yJmUF+GvSCre9mw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix qemu-system-arm handling of LPAE block
 descriptors for highmem
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 He Zhe <zhe.he@windriver.com>, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

...forgot to actually cc qemu-stable. (I'm still not sure if
that's important to the stable-branch process...)

-- PMM

On Mon, 27 Jun 2022 at 14:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 39a1fd25287f5d we fixed a bug in the handling of LPAE block
> descriptors where we weren't correctly zeroing out some RES0 bits.
> However this fix has a bug because the calculation of the mask is
> done at the wrong width: in
>   descaddr &= ~(page_size - 1);
> page_size is a target_ulong, so in the 'qemu-system-arm' binary it is
> only 32 bits, and the effect is that we always zero out the top 32
> bits of the calculated address.  Fix the calculation by forcing the
> mask to be calculated with the same type as descaddr.
>
> This only affects 32-bit CPUs which support LPAE (e.g. cortex-a15)
> when used on board models which put RAM or devices above the 4GB
> mark and when the 'qemu-system-arm' executable is being used.
> It was also masked in 7.0 by the main bug reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1078 where the
> virt board incorrectly does not enable 'highmem' for 32-bit CPUs.
>
> The workaround is to use 'qemu-system-aarch64' with the same
> command line.
>
> Reported-by: He Zhe <zhe.he@windriver.com>
> Fixes: 39a1fd25287f5de
> ("target/arm: Fix handling of LPAE block descriptors")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index da478104f05..e71fc1f4293 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1257,7 +1257,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>           * clear the lower bits here before ORing in the low vaddr bits.
>           */
>          page_size = (1ULL << ((stride * (4 - level)) + 3));
> -        descaddr &= ~(page_size - 1);
> +        descaddr &= ~(hwaddr)(page_size - 1);
>          descaddr |= (address & (page_size - 1));
>          /* Extract attributes from the descriptor */
>          attrs = extract64(descriptor, 2, 10)
> --
> 2.25.1
>

