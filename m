Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2C3EC8F4
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 14:17:56 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFF5O-0003TK-NN
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 08:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFF3V-0002Tt-7j
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 08:15:57 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFF3T-0006XS-Et
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 08:15:56 -0400
Received: by mail-ej1-x635.google.com with SMTP id w5so26773733ejq.2
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NjtzEy5kdsbMSIT6Rm48GKTdsvBAKX2DaNw8avj0cog=;
 b=VXCBJiHoas/RrTXW0wQxqOnjHpaonnw6Ztp+udiZh9WI718ZHoN8xcJ19odLd46KyK
 1k8CqkDsG7MQbxZq+Y921sfnARQrfBZpT0qpTWLSKKWHqxmmYqL4JP2auOEb7qrKOwwP
 YkiZIk+U09iW4LEDwn0pfWq/7NWQYsNXaT7TPen9BX+lQqPxYG++djynCsQD4wovyOBX
 8ED4tjNmfdS6xvE7TWKdwHo90oCkU43oU/iN1uazaaJdLBwAuwPc/yQECX+OjkVENYX0
 ppI9t5v+i1/3aO1VeHMxwbXNq1iYEzTy0HAQ/H/7y2FOFEcmaWFSq80GaAGyAtN58oXf
 Bmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NjtzEy5kdsbMSIT6Rm48GKTdsvBAKX2DaNw8avj0cog=;
 b=AwvidP0aP1MC+YLeRe8PjYtg+7gzQfyHgW+B3kRNor9YPybVYzbHovfDrEw4W3ZsUO
 QgGHOAz58EnW/DMxEnjbVBuyogv2vmGd11C1y9s8P3+qpU6W56K6M96KmgSBbMlD7kCa
 C+slVonqVlzK4bkjPbHYaaZA5dUkwddFc71GhvhaHIl5lbcksoS1XnjQW9HxAx6mLmcG
 enn1NRmVDakms8Ww323pK6+0XxWcY/fbzQOrJtaOeAmOueWya65lkKZZPFT9s5BcdIJM
 AvMTTmraZgkvGIYIjqxCihl3u7oCAKLv5moe0C+d5jLMQj3UZZi95kLmWt4QmiHVyEpa
 /cQw==
X-Gm-Message-State: AOAM533+KsIaNOLWivq6opWIaoE0yO618UXzVEy7Se6K7as9HhmzI3FT
 XMDrvESOHZmUNcTjx80VfU9J0j8A0Vdv2f0ndD4x/Q==
X-Google-Smtp-Source: ABdhPJySldZBlm7bZYne2Ky28S4yeXZFc8PHPBcx8b6qVbtKO4Bs8+0sxaWM1N8l527QpZlQgkk2l3peg8VQtBs1NtI=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr7836742ejf.85.1629029753581; 
 Sun, 15 Aug 2021 05:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Aug 2021 13:15:08 +0100
Message-ID: <CAFEAcA_w6uujB56dxT=i85TFEHBNfKK4m9cgxkPRHpHo-azQ6w@mail.gmail.com>
Subject: Re: [PULL 0/1] Hexagon (disas/hexagon) fix memory leak for early exit
To: Taylor Simpson <tsimpson@quicinc.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Aug 2021 at 04:07, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>
>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210812
>
> for you to fetch changes up to a7686d5d8528469b596e98eff098a5d3f8328fb3:
>
>   Hexagon (disas/hexagon.c) fix memory leak for early exit cases (2021-08-12 09:06:05 -0500)
>
> ----------------------------------------------------------------
>
> Don't allocate the string until error conditions have been checked
>
> Fixes: a00cfed0e ("Hexagon (disas) disassembler")
> Eliminate Coverity CID 1460121 (Resource leak)
>
> ----------------------------------------------------------------
> Taylor Simpson (1):
>       Hexagon (disas/hexagon.c) fix memory leak for early exit cases


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

