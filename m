Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CA33721E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:11:32 +0100 (CET)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKA7-0007pj-0C
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK8A-0006S7-CG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:09:31 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK88-0007Wt-Ul
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:09:30 -0500
Received: by mail-ej1-x62b.google.com with SMTP id lr13so45756980ejb.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=InM5Ul8/R5Z3x3QWyfQ7yVu/DSyjbnIlDrDBDgt6Qrk=;
 b=QE3lZUHB5xRAiYbfsE4Zz0qOXrM2fPBp4fzTcPXU39C/H8eGHHcZ6JVCjvKp9v+Y+C
 OmOOwWv19My+qa8AXSCq6Xec2E4lZFDj0MyjOoGFe7TD5UBP/T9uVA8VHoLSYG3WCNsA
 k7z0zOM/a5eCsuZVBen63S/szsYwsG/mH14/PXYAoczfidTTJA2ziRS/xOA2Cznvh+6k
 a8UvKVHLq2VI28cSg85ZCyg22Z4px6mDGoKnK8hLhNsvROMAekQQCezRV+dfPRPkyi1A
 iHwlsAZ07JKYlIRGKYMg3JLc8C9oess+/RAKpIj4/znEkCQM1QDmv61nChO9VRpddPvJ
 8Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InM5Ul8/R5Z3x3QWyfQ7yVu/DSyjbnIlDrDBDgt6Qrk=;
 b=c1HN3KOD0iUs8TINkqawBy8Hg+n1fWA9cDCeInS8J1+p+b6K37NmpHjJg8qAlR5d7N
 teDr+wxpQSO2aSdE5cvkFttyWVsrewh5yzpcMa5d/OjB/+Q7XuHF+R5ceM6+qt0ANvpU
 uF82VkbXruGEb3ALt28YACSWy2cnJK1n2ZiN1rS+SJhq66vpn3IKj6hst4kIHE4xrsbz
 mtz6gKbWmIm0bcwBVE2fBrOs7jnjGHnqxINTvqBdvKO7i34+2sni+Z2yuVrWiiLhjfVL
 xEe7LIoGY0aHzht6IhHplrtxHja2tJ0X5WLlrF3a4l8xZ2XpeNPi/P9d6r7/phNKJeUf
 oKZQ==
X-Gm-Message-State: AOAM533MtlUsMiIAbQc4s4mlfjOy1DEcwaZqKMiOKF5xg4ITF/h95srS
 Fg6QhOAQQnbQzxaKJPyXIBKVnKaqO5Bd4ly+8NvQVw==
X-Google-Smtp-Source: ABdhPJwKOajgifDGo9hMW5JOqqarimxLcjEYHaco0AoULgUEBl/MpJn5Hp0IIZBj2r0phkq0/VCgILlZPGWZXMw9jvU=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr2743410ejb.407.1615464567635; 
 Thu, 11 Mar 2021 04:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-5-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:09:09 +0000
Message-ID: <CAFEAcA_Pe9NG4oDD+bp7=-TonBqH51GcnEF8gCkfGxHQBLFc8w@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/qtest: Test PWM fan RPM using MFT in PWM test
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds testing of PWM fan RPMs in the existing npcm7xx pwm
> test. It tests whether the MFT module can measure correct fan values
> for a PWM fan in NPCM7XX boards.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++++++++++++++++++++++-
>  1 file changed, 199 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

