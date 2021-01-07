Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC42ED3F5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:10:37 +0100 (CET)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXrw-0006zK-Bt
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXq4-0005yK-BY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:08:40 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXpw-0001fd-HD
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:08:40 -0500
Received: by mail-ej1-x634.google.com with SMTP id ce23so10388210ejb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yjaq8juzB3Pr56RMdEXiqpkDQ0Ly57tB+Sk9DxkiTdc=;
 b=woXufm1YcY8K3lRBJMlSVegnqyjNfn5CofacC0marvups08ZKUTMYI/swVbTHmL0Ud
 CfZR9sP90jJcMDh74OFiPiMbRzYNHpHaIV/VSMkbOtd6NYR+o28uGnnOpWR7s+DOHHow
 EsasN5rI8P9PGdiu6+2cRBvNbBXjtQEX2q8ISD5VldTvvpkjV6086H4yR0cbUCua13UI
 2TpL+lqvZT5ZKp+JM5dio7AjhT2Eevkd1y9mUWfQqfQaOoaI5t0JzQNuYv7wqED/9ZUQ
 fShyPOFtoveufXIy1ZZ8lBg8oAQbIWRtjpbz3/ZGFDS6uiZ3fJ6zbnzEiBZHTOt0WmaQ
 V3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjaq8juzB3Pr56RMdEXiqpkDQ0Ly57tB+Sk9DxkiTdc=;
 b=A/CJ0FrMU2lojHbXyXKX6vhdeCKjZEm6EMnLQXAvIuLAjjCtZ9KSs9w7+QpcS9MTJs
 OAeJqEMPy/ounerzJ/8JJhkMoes5EABzgOz8YFcFUpyLPuJJmj2PPwYZ6xSwomL70etD
 /kUPD/F4hoPpB7rKPMKnS6GzBMleNQfXMAb5K58a6xmXiQ6pBy2jbprbeO4NgZ0XtQi1
 bAkeSMNwB/K2Y3jZ7ufDz93LXpjkNOXMLMcHHIDP3ULqJd6U5T1Led8vkqnya1gMnFJq
 dH88mHmv4gBwiljFTgL+T+mSBuWr2qJ3zTBKsrStDIBG8rYXweEA2oDu2JOFLXYKtcS1
 ZQQQ==
X-Gm-Message-State: AOAM533vS+Or+Ov+BNa/fFY1po1ZdazssLo8YroJJC7mRnwJVt0CU2qD
 YSrNVNGi4ng8sH7YDFEW+V2Rf2R412xC9xMsMePGhA==
X-Google-Smtp-Source: ABdhPJwlBx9472bnsDfZw45mOLE3UjSvi8jEiUSA7SZFiIgEOS2m/pslz9DANdGJW9BP2hkHP/HlIpaMwJiSLHaHxXg=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr6845576ejf.85.1610035711092; 
 Thu, 07 Jan 2021 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-8-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:08:19 +0000
Message-ID: <CAFEAcA9R7k+2H3ZKFxcdaofEQduYH2qObTyw-yp5b7=CUcCeHA@mail.gmail.com>
Subject: Re: [PATCH v2 07/24] target/arm: Enforce word alignment for LDRD/STRD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

