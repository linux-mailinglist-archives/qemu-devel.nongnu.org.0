Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC23EF389
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 22:28:48 +0200 (CEST)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG5hX-0000xE-J9
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 16:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5gS-00089R-Om
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:27:40 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5gR-0007m3-4c
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:27:40 -0400
Received: by mail-ej1-x635.google.com with SMTP id z20so102239ejf.5
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DSMNVCgBSQr/zYMbuai5x9ZefYjxqBmZYkewd68wZT0=;
 b=zNefOs4jbDG/mq/juIEWVVbXcWAK/mQ1eziaQVIz9+sP0/yoO7WDWDu65vt7gKp2Hn
 DedfzUcNRGEo0Dy7sysKyX9LjgjEDB1/npYA5hx2yCmLZcJvkl6oKFHF3ipK2dBSBI6d
 I9xWOrGfCYw+NBQO7K4PaS6Kfy6nHCsVa4IK/UzaNg9hEe48m5YfIAUMpx22iXGVqovu
 weD1BqqclqvVjYeQALm3pqX3UTk1t6iRVX7Bq+c8GNJ/PIGSX7BXYv5srXVQRXkofYUP
 j4GdtlwWdt9VB/7KNG1KxFvQA0zA6A+xllANZPSMFh3xknL48klPSPc0aY7A5//4GYSP
 rmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DSMNVCgBSQr/zYMbuai5x9ZefYjxqBmZYkewd68wZT0=;
 b=U9qUhDVw49ovPuDucHpKEdkyJRIBE22hu+2IytNzq/YmaeXIf4AkZzEwbPnyCtczG3
 bLwF8X70e33J992kZ/zAKtxsKX1z5gU5IC5JU/KkHEslz7gkJLCJb3MXugOOS5YdrPVG
 I8Px1rHT8OSVuNyfZJ+Xl7x8+9w8ZDnqFzQBB4vFMhwLHQcsKLAGnyAG1AOLgrhZyUzU
 PUl3DKbstLSfUMwmNw+pFluDy4bfFi+0yGB2kOz1ljFsi+Ib6NwcvStZCk0EEh6B0hn/
 JCFJGnhvEq2BKukLuFsMgRpkre1PtijzhHMeRZ1b8x6S2INnX2Q+ysKldzWH7lqiC4rl
 5E0Q==
X-Gm-Message-State: AOAM531Y2t7ZHPCXxah45eySLb2Fe4/PCkgOrc1Fn7eh1f0/aKOaye1X
 l5zsXF+Ma/RizRTG28368K0zEC8d0QQPxxI9Vj6jXw==
X-Google-Smtp-Source: ABdhPJx7QtN/DGhX8SVz1nrroGw3CkbaGgLIttpheq63kGN8SjsrM1Fc1sPKwHfdbT9RlvPHKBm3PHivVso1GZKwHYE=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr5715363ejb.382.1629232057350; 
 Tue, 17 Aug 2021 13:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210817201843.3829-1-peter.maydell@linaro.org>
In-Reply-To: <20210817201843.3829-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 21:26:51 +0100
Message-ID: <CAFEAcA_AXV5zvhWoyxmB03tN_UcTwJhp0V3rRD0Z7VcRMHM+KQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Do hflags rebuild in cpsr_write()
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 21:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we rely on all the callsites of cpsr_write() to rebuild the
> cached hflags if they change one of the CPSR bits which we use as a
> TB flag and cache in hflags.  This is a bit awkward when we want to
> change the set of CPSR bits that we cache, because it means we need
> to re-audit all the cpsr_write() callsites to see which flags they
> are writing and whether they now need to rebuild the hflags.
>
> Switch instead to making cpsr_write() call arm_rebuild_hflags()
> itself if one of the bits being changed is a cached bit.
>
> We don't do the rebuild for the CPSRWriteRaw write type,

Doh. I said this, but then...

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 201ecf8c67f..cdd6e0858fc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9215,6 +9215,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>                  CPSRWriteType write_type)
>  {
>      uint32_t changed_daif;
> +    bool rebuild_hflags = mask & (CPSR_M | CPSR_E | CPSR_IL);

...forgot to actually check the write type.

Should be:

    bool rebuild_hflags = (write_type != CPSRWriteRaw) &&
        (mask & (CPSR_M | CPSR_E | CPSR_IL));

>      if (mask & CPSR_NZCV) {
>          env->ZF = (~val) & CPSR_Z;
> @@ -9334,6 +9335,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>      }
>      mask &= ~CACHED_CPSR_BITS;
>      env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
> +    if (rebuild_hflags) {
> +        arm_rebuild_hflags(env);
> +    }
>  }
>
>  /* Sign/zero extend */
> --

-- PMM

