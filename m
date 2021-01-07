Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0C42ED426
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:17:20 +0100 (CET)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXyR-00051x-BY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvU-0003O2-OM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:14:16 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvT-0003WA-Ar
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:14:16 -0500
Received: by mail-ed1-x52e.google.com with SMTP id j16so8336722edr.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3gyNTpmVb+gvZKLlJXsEf2FO0mbO3KnktSmyqB9OPRA=;
 b=a3K7tRkT5kJ57aYGXZZ9r7TYUz0X+CphM9gF9io/GtoxkgH6odSqCfD6dTER3Yy65M
 CufUrYD/71WbnTwjXA7LjV+qrFaNWNZMdKxbcbpxf8JZLqdO8wlVQ4h91GboH2UwF4km
 cg4vRLXR71Uk+r/vl7f2LCuA9eYEpdBDJNegneJUrE0RAQHjXSD73/3KXb/0AhT1jmPj
 kwRjMlafHdAkRvPXOgMWPzl2t9MS/grwbXLKWyHmUTGTlEaYeNtMUQYqqi8tXT7HUz04
 78InKTm4A0N91Riys3J1+xE8PpWXaTZlhMVFMm74RXGFM9urhcG6FwQ2UJOOitLLH665
 0nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gyNTpmVb+gvZKLlJXsEf2FO0mbO3KnktSmyqB9OPRA=;
 b=UXg2VdEDKBfu3Hg+Zu6NlvblG8qeRccFX5JZlzHN7S2vTJUOf1wcr+dEIxBmw8pAkh
 mCDzdl865Q+7oK+qPJVKHXqgj0keT1+TnhlqakUquir2Va0sEz6ta5TdLVfdKJzBNdJm
 +KX/eCyRzYCkjpSHEoyHncHOkfjsVdN3Wzwu1BG9p02BQFWzuioIGEY2CAZcdTQjttff
 UjWDFFsod7yJwFxzss+hYb9eJvThOMbq3loT6rBjKmtJC3DqhrZrktFUKJGuwUnc++cO
 Ji30bXtSrtFACU4jRlmgbDxNDbe2Fpp03yy8g59AdtxRbsyLC2Wo5xM1vHu1XqePhsGN
 ZOzQ==
X-Gm-Message-State: AOAM531WR6saVv5UbpeVAz9fRBX/H+Tb3VzGDBekIT2sPFbNTdZveGDg
 JVmqfWgBjHt5ZCMeynzHZaq+qOLtydG11UziDurtzA==
X-Google-Smtp-Source: ABdhPJy7//NV6oA1u6S69fYlCELc/Lu4GC8Y4sHIN7lWi68YsMFAMA/hXRUA1AynV0d0eETX749/ET4Pg71sJWQePJ0=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2207303edr.204.1610036053978; 
 Thu, 07 Jan 2021 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-14-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:14:02 +0000
Message-ID: <CAFEAcA9RyrqDuSyoL=G2xJyzvs=vy_2h7OGWzsW68Xan9B9v_Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] target/arm: Enforce alignment for VLDR/VSTR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

