Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D62D8CC0
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:30:59 +0100 (CET)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koPab-0001j1-GY
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koPYg-00018Q-Vb; Sun, 13 Dec 2020 06:28:59 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koPYf-0004Lw-BZ; Sun, 13 Dec 2020 06:28:58 -0500
Received: by mail-wr1-x441.google.com with SMTP id a12so13535227wrv.8;
 Sun, 13 Dec 2020 03:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lybk7XaClP2JemyhFrS8HW8CbAKsRUfWFVVDPHrbpgc=;
 b=ilObLoG1DJlOENJ4sPbCesDN56eOG/yd411cnKcti9Q2YgKMmPA5YNaq+a6lKzpvph
 nxHpKyTdqdcYHROmRhUonfC+sdtX48V1Vx9fnXXaa5uD+VdthdxY63QxHcotJotOeqLY
 OrYmRJd5+RC1TwrajxQr43I/tdXspw75Sy8goMmD9Jen+pkaSUP8BW+q7tKsrZUdhqqC
 tkFtXNghe7w306Z1N0G8hsfK4IAtJ3Bqy2Lw5PJs73yrMdaFZPRD3IDW6aIXnLPAZMF7
 kYssbZc8qkuM6md0NF3QIo18TUloBcsr1+/9n54bULj9cs2ySgtcqubKSuGBVggSwMfr
 5PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lybk7XaClP2JemyhFrS8HW8CbAKsRUfWFVVDPHrbpgc=;
 b=fMSvYUN+jdMSP3xqLZw47yI68ZFbS1ueOI9bxVl1DK6PvNUd85ETqbHeR9xUfW5faX
 AJRzHhvV4Bsts3ovMssj3H4d/zV+IWyweR91R9nq6c30O31LlkDbrJn7r7ymair95xb6
 u65gbn59W0idpp9wARr7BaE8oWaLIudRnKXGBE8yHk3aSPTgMoCFb5wzpsx8ZTTFZvLv
 zJTPv7fvuUPCz6oHJ2vuOhNoJc+qkccQcBqbw83nj6EAdXTBsK4DPyR7kqxUUppUgCDd
 ibTL+ce+ktl+VnrG0Cqj+EnBUutnFwEff7PGGPEplO+/5b8d5TtxoX6CXbs9SZRRbCth
 Nddw==
X-Gm-Message-State: AOAM531yx3mHtYwoi1+3Nep974Tno4+u4IuYOGovKLDcWt7fPrBRZ045
 cOnrMivgAqJRXAs+utdveHY=
X-Google-Smtp-Source: ABdhPJyup1xZMVOet0+27eEXGRs97bOy6K/MKRRosvWJh+8Sq/7LJPWMo93dXP4SEfI+WTbqsuYthQ==
X-Received: by 2002:adf:97ce:: with SMTP id t14mr23817522wrb.368.1607858935427; 
 Sun, 13 Dec 2020 03:28:55 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o83sm25128218wme.21.2020.12.13.03.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:28:54 -0800 (PST)
Subject: Re: [PATCH v2 2/4] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
References: <20201211222223.2252172-1-wuhaotsh@google.com>
 <20201211222223.2252172-3-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b089845f-636e-2cef-ff31-9367a99ff80a@amsat.org>
Date: Sun, 13 Dec 2020 12:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211222223.2252172-3-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wu,

[The list is mangling your From: ...]

On 12/11/20 11:22 PM, Hao Wu via wrote:
> This patch makes NPCM7XX Timer to use a the timer clock generated by the
> CLK module instead of the magic nubmer TIMER_REF_HZ.

Typo "number".

> 
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx.c                 |  5 +++++
>  hw/timer/npcm7xx_timer.c         | 25 +++++++++++++++----------
>  include/hw/misc/npcm7xx_clk.h    |  6 ------
>  include/hw/timer/npcm7xx_timer.h |  1 +
>  4 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 47e2b6fc40..fabfb1697b 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -22,6 +22,7 @@
>  #include "hw/char/serial.h"
>  #include "hw/loader.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/units.h"
> @@ -420,6 +421,10 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>          int first_irq;
>          int j;
>  
> +        /* Connect the timer clock. */
> +        qdev_connect_clock_in(DEVICE(&s->tim[i]), "clock", qdev_get_clock_out(
> +                    DEVICE(&s->clk), "timer-clock"));
> +
>          sysbus_realize(sbd, &error_abort);
>          sysbus_mmio_map(sbd, 0, npcm7xx_tim_addr[i]);
>  
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index d24445bd6e..9469c959e2 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -17,8 +17,8 @@
>  #include "qemu/osdep.h"
>  
>  #include "hw/irq.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/misc/npcm7xx_clk.h"
>  #include "hw/timer/npcm7xx_timer.h"
>  #include "migration/vmstate.h"
>  #include "qemu/bitops.h"
> @@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
>  {
>      int64_t ns = count;
>  
> -    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
> +    ns *= NANOSECONDS_PER_SECOND / clock_get_hz(t->ctrl->clock);

Why not use clock_get_ns()?

