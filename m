Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ACD3CD455
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:07:08 +0200 (CEST)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5S39-0001qb-El
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5S2L-0001Bk-N8
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:06:17 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5S2K-0006Yh-8o
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:06:17 -0400
Received: by mail-ej1-x630.google.com with SMTP id hr1so28317608ejc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RU6sNoiXg71PuiuZIuboyApMKmYESAurN93gwyyPj+c=;
 b=P63sq0EHjCK+OLIz/LRhhf8h2JJRn6Ke3voMPrO0NkLQA5kZB0muOZcs4DX1OxfFi0
 NzWJM+trQkSHsqOL1Q9FMyhYigntPqUMha7oFuaPxgBo4kFuyDnBc8zZU+2K5gYvtX7z
 Sp6XuzU2BWxpsMrK2MgAP74lrKhFZR5lYdiD16LJmGBSl6IylAWeG6CwQXwHBIR32Wze
 1rvfFhBxRv/2Uqs76Rz6LFiRVd5Hl4/SqITrpG/kMBpHAFoTX6Nms5dwXg/F4CoYjUFs
 qrnEE0nna07MtF16c1tdpNBXf4++aPtJhmIYHS70J4xUb7lDVRr1P9wyCq8Xz9FyirjQ
 jMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RU6sNoiXg71PuiuZIuboyApMKmYESAurN93gwyyPj+c=;
 b=Xg8aF47Kes+s7hiJMzU333BMyfzLknT9dSW7i6mFgdgsrR+5DFZUyutAJNwtArZEZQ
 fi/3t7dln27mqDE5lvCls/fShJTR9E0jOmi7CI1O1e6/shwWyGI1Vh/Fb6z8YMbgcU86
 nlo3J8EDDz5Lots1w07qArq+xa7ysv00bJRJtYNh8jtws0tiQfJiNdYnr+PKvf3H6YeJ
 FJ1L72JB+uzlzQ2TEJdQ3olETQL5kKD/CPbZk89F78ThIAPurDZH5LF/wgK+kpvSblfC
 oSBOlkU+nvzC7BNp0EOBIxCHeUYenKCurty+xZdVVrubLO5pMX0nGApngEFnz9cDT23m
 taEA==
X-Gm-Message-State: AOAM530ihCYJbZSnzOEwmExuxCCnyaBj2ewwRbW/rnZeujzAahfI0FKz
 +5vpjdwICauFgXL4UcpTkQlhSlS0R6LwjYBr/Ym4Dg==
X-Google-Smtp-Source: ABdhPJwOLlETSzDLHqeignvNsSjBj+vpjJVdWWj8aJzsQhqCYCOtpbQ1T4LBZF7UoO7pjGo1XbMinqc1pJHYAOmPhL0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr26376532ejy.407.1626696374482; 
 Mon, 19 Jul 2021 05:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-3-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:05:34 +0100
Message-ID: <CAFEAcA9+w9iFi0vtb_2BPSC87jziTdzxn6kmgupEkBJ2fc9rcw@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] qemu/atomic: Remove pre-C11 atomic fallbacks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We now require c11, so the fallbacks are now dead code
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure             |   7 --
>  include/qemu/atomic.h | 204 +++---------------------------------------
>  2 files changed, 10 insertions(+), 201 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

