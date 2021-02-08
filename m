Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71931426E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:58:34 +0100 (CET)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EYD-0004re-Ga
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99i6-00016W-FV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:48:28 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99i2-0006sQ-4B
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:48:26 -0500
Received: by mail-ej1-x631.google.com with SMTP id w1so25859886ejf.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YpNMf/vQgOhm8vShHXOBQ4/tqWujyxbJR+mfN+8T5k=;
 b=VadEkwefAXoXGpiAozeJFlEBMXXdtukmEOVSVz+RtS2sHMtrUOGHPII3cAU8XrVKvx
 8FKsU3uu9ijdJBZsdmxxXiKRRg+f7tn92Jygog4pk8AvdOT/vG9tqht0htXnU3af0LQf
 6Wg3XB1hEXRZ6Dzglt78kismYKmJwZ4buA2+ASBw6UC2oFVLPZV8U0p1Qjz/AtEeUMZL
 zP/mDpOGQ/FOvzVVoJRtthlAXkb4nzLK+ocwNjunmreYUzd2vHeK8Ttu+/yzGt3jjMLV
 QzpVlNtSMTDWqZN1q/HHDd4qFbiyjsKS4BE1IfDEPDPMDGevE3y/QA9y6bmkLcNJBNbP
 Sc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YpNMf/vQgOhm8vShHXOBQ4/tqWujyxbJR+mfN+8T5k=;
 b=tEqVAzhuVeNYORE/HTM4ZHTtMSL2EE1xYXccPiCStzcH12WN6vqqk+PnO7Ror9prHc
 bhlJBOLnkdxEfPFodFEwV4aPf50WIL7le3dZZm1tgEW7Vg1DXIYU6sJeLrzyNGAtalMO
 z8/XIGPDcR05RYLyTaG1aYEQzImtGfyzu0+ZfOf0EHjg7sgrJveUNCitUuGpFFg+2c6u
 NHdIY8f9abxtlzNHwG6o3aSApj8FOrv8bw7TCmO/QNzxtF4yVADpc5co/Cmrj7lhf2Tl
 pthQ8Budlgal61MKghsjvIBl4blJeqn01tfwQLnBlvEiGDm/PTPwTlzEupfPVoqeVk1m
 FZ/Q==
X-Gm-Message-State: AOAM531sv40FTmqPYvTWLa/onuyTnO2jw0417wdKow23paIN9kLcQ4B8
 5T0jZVWOO5cmJ1I1YkPwmkXIpA296kYdCNI34GAwdA==
X-Google-Smtp-Source: ABdhPJwNN+tNBWUcMcT9CJ7uW/c9eW6Gw9Nu30kTGlKcJk9nPdHYtnWZeRfzCA3nlizmE2WmalBlEE6x5vjAm0eN30E=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr13453618ejg.382.1612802900354; 
 Mon, 08 Feb 2021 08:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-2-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:48:08 +0000
Message-ID: <CAFEAcA-i7z1CMiHD1QMWHvdqta_ZtAWHJtjsaejUKfNg86zq5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/arm: Remove GPIO from unimplemented NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM7XX GPIO devices have been implemented in hw/gpio/npcm7xx-gpio.c. So
> we removed them from the unimplemented devices list.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu<wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

