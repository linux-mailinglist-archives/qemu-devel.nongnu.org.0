Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E857238AFF9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:28:49 +0200 (CEST)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljijI-0006A2-F5
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljieK-0007oR-C2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:23:40 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljieG-0002B5-D2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:23:40 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u21so25204598ejo.13
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7nhkV8dR1gqqYkRQBangM/CVplsjsHm8X43lQFIaN4=;
 b=K5m6Af5EnC1QFJaTFu/+981ZG4I9HbnU83bNxHeQ9+p9+pNihO4m4Ob1pbZQX2JJ2/
 IR2PWJmU5wSEYB725LuewoX7BkxZD8Vc4QMfBDrJ4oufbdmAYO8jkOxY4BXfAwxP9DJs
 owcapw+Iz3c1t9p+QJNh7xoOWfgleFAHzwghx6gdZsGbQi76d4fA+bhTG7DobgSamQIs
 F4nbsa7V0gtzj7UB4LvVtXH+g4i0BSfj48PrjKu3GgkITZFOgb2U2SrsozTHE4p3A98l
 GA0DZdMMkVGJiVBiGZqjj18jNJeJLa/Z7dmivBB8dmcgRQmXG1lkktbnLjk8XaKcvqEW
 A4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7nhkV8dR1gqqYkRQBangM/CVplsjsHm8X43lQFIaN4=;
 b=nedx6TfBo8bWRw0qGfhz6zoPcSUIa48E7DfZ647ItakCZ2HtCTQ7ndCePXBWtE46Yk
 RRXDg9XyHIVC1eXs65HvEZNg6vfsLTpSqwkxeSEEdDUVJvmYo+aSau+jYg2VDXP3vQAk
 QmL0np82QMncygJrVhR9X8M0uhj7BmzHMdHbigzZVWuoQ2iaH0rwhdvc/Zgo5Lg6WiLb
 TR0mHUkGoSvaYOXo8aORudyf+5Rsg3HKBp0UYoReyt1PVy3Slfmgq2m7tSy0eTlzI+pc
 vbaxW5+pxQHssvElYDGsth7+2AKg9NMbbCUifJ5mO70i8YeQFxZ3ZNdzXYAzadajpAk5
 5WTQ==
X-Gm-Message-State: AOAM5305f2/NjNjmUFAIwMjiLbmKDqtnG7+I2t0lS/4SH328C4Xc3kz8
 EueSRSxcYOsXnnqES6HkYS+aMNyCN4v3/bo358IINw==
X-Google-Smtp-Source: ABdhPJy5YwrBemxujU1VKNwJGdyISTtAHZR/DhC0DHw/skItXmS7JPq5kbVBtMtISOIa2SHalelYwwDPlTDhsJq4Quw=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr4707742ejb.85.1621517014894; 
 Thu, 20 May 2021 06:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210510190844.17799-1-peter.maydell@linaro.org>
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:23:16 +0100
Message-ID: <CAFEAcA-WwZTSGx0tg1msLw2BeFvwdv9_45tEL1gtFntN2MDoTQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 May 2021 at 20:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes some bugs in how we were modelling the
> TCMs and the SRAM in the SSE-300 which were preventing
> Arm TF-M from booting on our AN547 model; there are also
> some fixes to things I noticed while I was in the code.
>
> The specific bugs preventing boot were:
>  * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
>    area was too small
>  * we were putting the SRAMs at the wrong address (0x2100_0000
>    for SSE-300, not 0x2000_0000 as for SSE-200)
>
> The other stuff I've fixed is:
>  * we were modelling the SRAM in the AN524 both in the SSE
>    and in the board model (harmlessly, as the board-model
>    memory was just always shadowed in the memory map and
>    unreachable)
>  * we were modelling the TCMs in the AN547 board model,
>    which is conceptually wrong because in hardware they're
>    part of the SSE-300. No guest-visible change, but it will
>    avoid problems if/when we add another SSE-300 board model
>
> thanks
> -- PMM

Ping for code review, please?

thanks
-- PMM

