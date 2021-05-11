Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB937A698
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:25:55 +0200 (CEST)
Received: from localhost ([::1]:37090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRSU-00015o-S5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRP5-00065H-3g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:22:23 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgROv-00025U-Si
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:22:22 -0400
Received: by mail-ej1-x62c.google.com with SMTP id j10so2389182ejb.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZbnj/pfbAYwixvdzIkaLzIvHt97LUdySIhv7rguSSw=;
 b=W1AG0fZURuZ56UXPVU6qk09L48cNhTmvA7LCSFOYjKFSAHJfZXQULrdfiyzKpE1i7+
 SWVqaZsTqh0O1kySjDVcm0TtJwqkR0SL/SIoqeiW8lSXPge4menuHwr6taNwHbsdbiL5
 CNmWnSTPXZIZj1W60Bcx8AdSyWznoo5Bi+QXjco/E8RyqYZfvad33ZerSg/WVYgJqJjP
 +l8ZaqN0d63+M/+yx1BrwY+SGUad36ydPrdBbGLRJ4OQAq8VfjeHCu3Z/glIwPDD8QPp
 g45V0ELKEfaHIg/FN1/HYnfA40AMYDFKtSFGM9N3XOJdONHK7ynGbUo4U8armb5kl0B9
 bjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZbnj/pfbAYwixvdzIkaLzIvHt97LUdySIhv7rguSSw=;
 b=M+XUfjvyHI9EjdTfHwJ9EYoMqN3knsND+RSWJeqB0SWcthPCMK+YnKuyKXQf0MFiEO
 L/zJ2vwkZJrzJJkROsJgLcphkeJ9RC0Ep8WYxDDzTViOZWSp6XoKzUcGy8XI1AprED0e
 D4lmLcZz2EpgfSmTFd9JrNsbv5O11Eq/t9RLEM2PcBXUXc5tBLGeYtpEWCfTSMdLaOsO
 dwMR/LCw+9L6Br2YYY8ZD0pfzFvIVjhTsLPZ2JXepDqduYV2sRtbDmX7ypNp0d4Z3kXp
 YHCOOyhqPj0Vybzq1ZdlslBETLRa92zGDW0UD27zGVY2wGFCu7NCrf672wxkWvuxyXc/
 dvsA==
X-Gm-Message-State: AOAM531LFMu34Gp/SDLhNM+Y59pDK7HL2A2D5jl/gpJyE0gcL2AnLl1p
 lzMiaJtv+nIzHslYnlWYKmw9bFvcxZgYaRC+cjokiQ==
X-Google-Smtp-Source: ABdhPJx9qeJ6gg9zQqChHz73sp2k9qNjO77qSLQ5mONtHzI1FqWKaHCeGi0JzLHfOi+SJR5a9C5UCexdtDeKUAzhGM4=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr9302163ejb.56.1620735732459; 
 Tue, 11 May 2021 05:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-14-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:21:00 +0100
Message-ID: <CAFEAcA-yz0d+vUwf+YaarNBXK4vbtCWAe3M_W03pn43=1OMh6g@mail.gmail.com>
Subject: Re: [PATCH v6 13/82] target/arm: Implement SVE2 integer multiply long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 30 Apr 2021 at 21:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Exclude PMULL from this category for the moment.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 15 +++++++++++++++
>  target/arm/sve.decode      |  9 +++++++++
>  target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  9 +++++++++
>  4 files changed, 64 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

