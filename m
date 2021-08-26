Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B83F895B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:49:19 +0200 (CEST)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFks-0004Wl-4X
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFU5-0000lu-Ob
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:31:57 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFU2-0006IK-BZ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:31:57 -0400
Received: by mail-ed1-x52a.google.com with SMTP id q17so4725459edv.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6vXpH60FrqbEAmgek0+3fo9ZGa7cKL1PBz9TiK6Abg=;
 b=g25gu8WeMgLFhZEMaxtQH7ZvHFyXbQsUX7+MrUA+uEeMXByF5HSOX9Rz8EOYzaZSYR
 BJhYug5XTvZ+S52KMMjsuUxYFpvtCkU938HrPEoCBC+GLMRAM1G4EuU/6B7A6XL27NPK
 R5tw5h+okNaV/BQkM2tqhiIb6rjZOqEfY7XpZ5F7qnhxWf/KbaBuoLrK+LemAyrCHkps
 s10nBUOED3RFQ+vaFNRHOMFS4Sjh/UfOfxOPaRS/kuXzL6fx46QgjnSFioc3WlgnjrVd
 UkKCLvMvlaGS1e0Evgwrq9NJv3b7OjRojE1s+ZUH6O+QLMc/R/pHIeo8Evv1yGjmDj/u
 2Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6vXpH60FrqbEAmgek0+3fo9ZGa7cKL1PBz9TiK6Abg=;
 b=uHenZqRed0IxQdoqHZfrWBs3y+sVYnYwFRgLJmz4YdSweT5h0Hn5SNCRmllAY6yO0z
 KlKNeXWFqaTppJOwm18r9XW0otbPumgsMt52R0rRNYXGZkLXReTkOAbQA1SGeKz4HLCm
 UJlyIkMWRs+BhMMCREO+KfTtPNh3IYN0Uo7/jbpS37wdKBdQI3blzy3zNYXQ5kug/C49
 p3Cc5AkHZ68FzJRt7yhnqDqosw9tNnGvbk1jSVywKWMqU+g1z9IC8mKAUVDOrlNQ4oPX
 psvKPvCEjsT7k9KdlQ6zBpfe1CjIvZeCQ8023UGm1wj8oR5bCiqXyfqncH2HiQCgkUnQ
 7fRg==
X-Gm-Message-State: AOAM532qKzFsy8YGBblPjHB79OGhfB/wXjJ9uO9tczpiPsYZ4QvTzkRa
 PO1KSypdDTSnH3rAlldgLeIerTn05j0sgANuq+Qfrw==
X-Google-Smtp-Source: ABdhPJxb14xgxN+t8IVRMKTBiisaQYl0V4At0FWPOeUcSLsovTw7MzK9sO82Zt30fARq0aflJ8AAisQANsPZLPVPG7o=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4232988edw.44.1629984712863;
 Thu, 26 Aug 2021 06:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-5-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:31:05 +0100
Message-ID: <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Aug 2021 at 21:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pull the fault information from where we placed it, in
> arm_cpu_tlb_fill and arm_cpu_do_unaligned_access.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Pulled out from the larger unaligned data patch set.
> For short-form FSC, pc misalignment is reported in the same way.
> ---
>  linux-user/arm/cpu_loop.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c


> +            case 0x3: /* Access flag fault, level 1 */
> +            case 0x6: /* Access flag fault, level 2 */
> +            case 0x9: /* Domain fault, level 1 */
> +            case 0xb: /* Domain fault, level 2 */
> +            case 0xd: /* Permision fault, level 1 */
> +            case 0xf: /* Permision fault, level 2 */

"Permission"

> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            case 0x5: /* Translation fault, level 1 */
> +            case 0x7: /* Translation fault, level 2 */
> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_MAPERR;
> +                break;

Side note: for cases like this where we can tell MAPERR from
ACCERR based on info the exception handler passes to us, should
we prefer that or the "check the page flags" approach that
force_sigsegv_for_addr() takes ?  I feel like the former is
nicer, because in a multithreaded program some other thread
might have changed whether the page is mapped between our taking
the fault and getting here. But maybe that's always racy...

Anyway, other than the typo,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

