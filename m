Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6FD2F2E33
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:44:06 +0100 (CET)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI5l-0004bq-TY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHsF-0004kM-2c
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:30:07 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHs8-0001Rh-52
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:30:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id g20so3047591ejb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/fRAJM1ajfNwQd5upbxc/igAiZlzPCEuC0QiXaTWaI=;
 b=z3V/2afBjagaqzONjYB9cmQBojWCWLmj6w8hpySF5No9Jkiw4LXWsEuErh9joXeSAl
 c8kTkR/AamYBRuzflismdda8rgcsdKtFRTFN03GhW8AmjrR8MMyvk9+mGRo3g1sQx7qI
 hI6lKZteUAN42LJoRtb2KYggvDqKYZlJc/aWTAKbgKNKaLSsRYYND1Zi4c+OpV7G7FYH
 6ExRIkoNKHq/Q86jB5ngKKoteAoYDTHzs1cepXgEQRrwo3cFsOpO1DQTY0MR7MTAZAjs
 hRaxCKEz/rYBTW3g7UBNpOJStCiw4Elj03rzjdilATbhF2ON2kOoDGR923Cd/LtnxWt0
 JJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/fRAJM1ajfNwQd5upbxc/igAiZlzPCEuC0QiXaTWaI=;
 b=MHYCerQ23Sg+sBGvcCSn6gj1e4iD6tHLoauSzD5856gfEpyDMSXCmwG4FKwNRuUeai
 9zt9+8LkObb//RlznHwd7FX4Oa4h6dfrSIUc4+1gSom0R4q//goofuMbQ7/XadbDNlHD
 yMQ5ZN0Z+1A0BeNrKULrYZJX7gsTPtptAx5YxRSaL1lxoDMWaAHrS1Vlxs3Dti6iG3wD
 KHlwvs9QAgAd6FkJyEldvtb+xBUcp3YDJiC5nYdEFUJNGSMJhmuwQAyWPRutuVmp2sVf
 1soshZ62DZFEZSQd7rNwLTMcxqVvThVdTwkmXCxrg+JrEYxiKPVH6JwnpjKWRGzaaVVX
 c+dA==
X-Gm-Message-State: AOAM531H+Qpoa6LSGQL8ZPdqdKGuxdKft8Iraf6ex0lSsX8/+fJxlqlF
 XCAc3NxPiP7iXwZfwJ39cwaSnJ+29Xsf7t5Oq4nHcw==
X-Google-Smtp-Source: ABdhPJw4eMYSiv8BN0ZFKMfV0Ak99x6j7RISLBBhNH3pY76s6gX0+MsdbkOY8rADDVFChgDBdUtABTaXOKwlhjHzl4E=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr2907537ejf.85.1610450998050; 
 Tue, 12 Jan 2021 03:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
 <20210108190945.949196-4-wuhaotsh@google.com>
In-Reply-To: <20210108190945.949196-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 11:29:46 +0000
Message-ID: <CAFEAcA9LCEwjDfG-Gq+jokZtOjs6J_B_jJaazsRpYY0FVL9dww@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] hw/adc: Add an ADC module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 19:10, Hao Wu <wuhaotsh@google.com> wrote:
>
> The ADC is part of NPCM7XX Module. Its behavior is controled by the
> ADC_CON register. It converts one of the eight analog inputs into a
> digital input and stores it in the ADC_DATA register when enabled.
>
> Users can alter input value by using qom-set QMP command.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/adc/meson.build             |   1 +
>  hw/adc/npcm7xx_adc.c           | 301 ++++++++++++++++++++++++++
>  hw/adc/trace-events            |   5 +
>  hw/arm/npcm7xx.c               |  24 ++-
>  include/hw/adc/npcm7xx_adc.h   |  69 ++++++
>  include/hw/arm/npcm7xx.h       |   2 +
>  meson.build                    |   1 +
>  tests/qtest/meson.build        |   3 +-
>  tests/qtest/npcm7xx_adc-test.c | 377 +++++++++++++++++++++++++++++++++

Adding trace events to a directory for the first time
requires also adding the hw/adc/trace.h file (which just has
a single line '#include "trace/trace-hw_adc.h"'), otherwise
this doesn't compile. I think that's the only issue with this
patchset, though, so I'll just fix it up locally.

(Stefan is going to send a patch fixing docs/devel/tracing.txt,
which failed to mention the need for this step when adding
a new subdir to tracing.)

thanks
-- PMM

