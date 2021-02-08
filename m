Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA9314262
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:56:27 +0100 (CET)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EWA-0002ES-K9
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9BAt-0000tY-P1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:22:15 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9BAr-0005QR-Jo
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:22:15 -0500
Received: by mail-ed1-x52c.google.com with SMTP id g10so19750031eds.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w5B1pkZXnSIgQ1zydgFTjLv4p8OBmt9JOwo2w1rzMks=;
 b=OITTN5zs06XKxzCyjcXPHOfOU1hiUjtvmaIWS6W2lW4m1mGF8Uxv86MGXVNTxPGGEY
 wOyhTBkFBbiZDyuP6H41F8JcAZm7VIsTny7tWNHaXsBY/Bkg2nY/rQTCDGiU5PET4r1y
 qTNL88sDTsKsJDklLZtRNTko7G+m5CANW7QzqZJCFy+fG21Kgq7G8mC/YgCb7rmVqlIM
 Mx6vnwxrQYKXvwcwYS11lyM2oHZue8xHjS5Bz5rY3uUCRLigL6N4fDtJn6fDeHqsqKnV
 zG2ii2J+OS29N5W97+lJ/4C2Zsjs+F5+aOWzWPxaVH5rL5m0PDasnMXrFj2lBx+Tslop
 aufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5B1pkZXnSIgQ1zydgFTjLv4p8OBmt9JOwo2w1rzMks=;
 b=dQphRJQLcNgEmATqdeQgktfpQFbk3ZMWAbf44MQE8l0f49ZMkeTGYY8run0dVJqPNq
 IzgK/35+DFXyiezcvd8GJ2qSqSaSHfrELhaG1u0j4MgLNs1ABvDsbf3JRj1+o/bunpbR
 HKCRjIYYRf+rg6a8vuLelKuwlYjOSzHabu6CRT2xWv/+zd2tur6eg13Mbles22+ai9TX
 hvGOLPkl3nmiyPBX7NhlhkxdqnI7k18r9/VbpZrPxUWM5W31Mg3BQ0PEadcvZBJir91c
 +aTmqSMavQoIWJfhU6Qxkm5sEFygPPoHcFkpaH6ThwC93MgtPgDYcjSD2P/6nMKC7coF
 vxrg==
X-Gm-Message-State: AOAM533Dfm/HbwaSLTt/t99gDSDgg/jGh1eqDZp1LtvdeZ8eLrLbEN4A
 XBePH5LLYa+LBAQAtxXkuk1W4A9y9aVDOqAx7kxTpg==
X-Google-Smtp-Source: ABdhPJy1FloxLwTCa5+ug5/d2k13MsxGo86KWnFdktgyHxjWmLfd+h7z3uirNsJxH21L9+kTt25IrTq0WKur3F7pTEo=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr18915701edc.146.1612808531248; 
 Mon, 08 Feb 2021 10:22:11 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-8-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 18:22:00 +0000
Message-ID: <CAFEAcA8Fg+y-KB4VksMZTTMeZSrRjpUwz2Z8f3EXPzOyeoQBYQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] tcg/arm: Implement andc, orc, abs, neg, not
 vector operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These logical and arithmetic operations are optional, but are
> trivial to accomplish with the existing infrastructure.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target-con-set.h |  1 +
>  tcg/arm/tcg-target.h         | 10 +++++-----
>  tcg/arm/tcg-target.c.inc     | 38 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

