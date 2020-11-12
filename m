Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE42B0886
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:37:47 +0100 (CET)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEfS-0001hq-76
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEcS-0000Jf-6g
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:34:40 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEcP-0006wG-IJ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:34:39 -0500
Received: by mail-ej1-x643.google.com with SMTP id oq3so8418883ejb.7
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OKoPeZwiLqIh4N7f5OVbuo6h/Zc0LfCvpFgOreWJoKw=;
 b=F9i5FzCvhdN38Bp08sn8S80LwKEkStrNpqiNB/CbxW/IGOEUitCq65JEbrWD2gdlZV
 hiGzRGuhdKu99HtakRXzJfAMHv5EGy2E6VQBXxLNXeZli7gINljH8iwJlXsDN28Twye1
 SY2iAcbYV+4TYswyvrENNjAjrsOMgLG7yBdmi7Ok4V4gTOymdk9/LwNFTEHefY2VI428
 PnBe2lkC96NJ+gaeAaRsxQNXt7RCZAEbNxwgOfusa/bmoaE+FcpuDwLWJU65FBNAStDY
 VLV1HWRVTGI69Pxpi4Yuqvy8LvlQiSRLhqvmJwsHf6xva/VTKZNDLWl263CdgKlnNNCe
 POQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKoPeZwiLqIh4N7f5OVbuo6h/Zc0LfCvpFgOreWJoKw=;
 b=FrwP6sgtmGUz0fcWkNC0AAGAtqKfQ/VVtE1UIPdxsCerP+ONdZ1IFBaEPgUnJ1kL8x
 c28saYi5YD39WR9sxzlXzSLzOmixg3MaZtPK/Xyz6Nnc/df7qovAwM4V6gIL4+KKN6/0
 IjyyulxemWsr2Gsh0WOpTkwNUnovTnBviSQnBTh/P5ScjRhQMZTHgjRYy3I0Bb9xtSAa
 HIri4BO9U5cG7VFwpBUgckgvh8FVMEaurIZ8GDqYtn/c9zrzp77+MT4D80syWc38odwd
 qdcuKBauFAbliSPF5YG/ozC1dra2JfVIF1gnlsAypi52QfoSEr5UBpOpcqdEy44uIyer
 C/Uw==
X-Gm-Message-State: AOAM53146n64x3xN/vGaxgUU3NpYNpqaTwlpMLIVSMnPIzGCJYLEQNN6
 zkDBc53ty1Z9igEmmfuoSCAGtuppeRyjhyefkoSJ/Q==
X-Google-Smtp-Source: ABdhPJzcIJe7E6t20Sv8nzYOILNFcp0OPnaO9lH4tTzYc4MYbQGJ5rCI3/pyRSLbXJvwd2LqP7i+0O8VydM4Eng+rNw=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr29810213ejb.85.1605195275707; 
 Thu, 12 Nov 2020 07:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20201111073651.72804-1-alex.chen@huawei.com>
In-Reply-To: <20201111073651.72804-1-alex.chen@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:34:24 +0000
Message-ID: <CAFEAcA_RL3otj-p+_eUXri-TNwrCqQv1ppHhY8X7BX5zpGVR-w@mail.gmail.com>
Subject: Re: [PATCH] exynos: Fix bad printf format specifiers
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 07:48, Alex Chen <alex.chen@huawei.com> wrote:
>
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/timer/exynos4210_mct.c | 4 ++--
>  hw/timer/exynos4210_pwm.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

