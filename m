Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A433721D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:11:29 +0100 (CET)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKA4-0007nG-3q
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK7k-00069z-UG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:09:04 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK7j-0007FX-9f
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:09:04 -0500
Received: by mail-ej1-x629.google.com with SMTP id ci14so45590283ejc.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 04:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUv/k0ojAsaGUDmDHU9JsLpEK89ntt/ZoFGbNC1QYcY=;
 b=OrDs9Psf6nVOhM0WVWXYK98qxm1CzssDb0RTMa3IjRXA1BXsx1g29oXpPAzRqP9g7W
 o+7F3tanP2qv7MUeywwD+PS0nr11cu0yLZegrIGNC3+Q5mQJQg76h6SPZokISHdhthpi
 PJRVEWHWoOD3HQwMPfu+gHRe3N236u0cQW1QzCv4k1aFWEcqZ6TYuJwthV0w2hiawLIC
 sgsdVswDQEFuj1S9yEoe4S0sY8BiTP0i+JQKW4xtI6CzebsHd3N/RO+sKRCFadvXs+74
 9WjvKc8+U6RPTvbVgMNaI4gO0LaXVgDmgtdbspsYUzSfQdHxs6rXRsuxDWGx/vJm7cE0
 TTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUv/k0ojAsaGUDmDHU9JsLpEK89ntt/ZoFGbNC1QYcY=;
 b=QIuPuEtxUjOCFjdAeORVwLtIZEEudX2QWngxfJaxoiCu9mtVZBtsIv3nDh+1Rbhyta
 Hk7DTUHPiJxpSCGrl5H+K2/pcnSNyGFNCSVbzY9zehc1eL57mJoiwTaFIJbXLojknC23
 Jm82aHHgwnPegBxOtF1FRbXQvx7jstTBySoy8IsWDR5Dh2yYmdTV7hUhZ0evqAlmOzIh
 +Vvxd3K29hWdI5y+zRhqG33d8rH+sxozl91Mub1Wx+VvIO4/K4Tr9eV2GxoPSUvvTFaI
 I8wD6elNcfJQ0ze3rWiz/BGi81ncp899hlTUTgeJV/SMsk2ciB6d6Hjs3mwd0F3+LEt0
 nOng==
X-Gm-Message-State: AOAM533109zI2jUC4kJ+CPZX5Wbpvpe/zlfvvLGzz21l0pUrr9NFPjb0
 IN+uqc60DJ+C1NMBtj2zCeyW2nNWRx3lsOKVaLw2Mw==
X-Google-Smtp-Source: ABdhPJxk9WZvYKSj60stcZrinXiDNbQ2jp2UNDcS2HtaBrsozjd05IBLFw7n75N0yyxpQ5ke2Y3ySbakTC7ZJ4ZWNI8=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2835455ejb.56.1615464541849; 
 Thu, 11 Mar 2021 04:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-4-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:08:43 +0000
Message-ID: <CAFEAcA-NqB8ngBVqSeF_pNH_-J6rn5nGaQw9zazFn2rTBtnJGQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Connect PWM fans in NPCM7XX boards
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
> This patch adds fan_splitters (split IRQs) in NPCM7XX boards. Each fan
> splitter corresponds to 1 PWM output and can connect to multiple fan
> inputs (MFT devices).
> In NPCM7XX boards(NPCM750 EVB and Quanta GSJ boards), we initializes
> these splitters and connect them to their corresponding modules
> according their specific device trees.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c  | 99 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm7xx.h | 11 ++++-
>  2 files changed, 109 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index fbf6ce8e02..e22fe4bf8f 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -21,6 +21,7 @@
>  #include "hw/core/cpu.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/loader.h"
> +#include "hw/qdev-core.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> @@ -116,6 +117,64 @@ static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
>      i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
>  }
>
> +static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
> +                                      NPCM7xxState *soc, const int *fan_counts)
> +{
> +    SplitIRQ *splitters = machine->fan_splitter;
> +
> +    /*
> +     * PWM 0~3 belong to module 0 output 0~3.
> +     * PWM 4~7 belong to module 1 output 0~3.
> +     */
> +    for (int i = 0; i < NPCM7XX_NR_PWM_MODULES; ++i) {
> +        for (int j = 0; j < NPCM7XX_PWM_PER_MODULE; ++j) {
> +            int splitter_no = i * NPCM7XX_PWM_PER_MODULE + j;
> +            DeviceState *splitter;
> +
> +            if (fan_counts[splitter_no] < 1) {
> +                continue;
> +            }
> +            object_initialize_child(OBJECT(machine), "fan-splitter[*]",
> +                                    &splitters[splitter_no], TYPE_SPLIT_IRQ);
> +            splitter = DEVICE(&splitters[splitter_no]);
> +            qdev_prop_set_uint16(splitter, "num-lines",
> +                                 fan_counts[splitter_no]);
> +            qdev_realize(splitter, NULL, &error_abort);
> +            qdev_connect_gpio_out_named(DEVICE(&soc->pwm[i]), "duty-gpio-out",
> +                                        j, qdev_get_gpio_in(splitter, 0));

This will rather pointlessly create a splitter with a single input
if fan_counts[n] is 1, but conveniently you never actually do
that, so it's not a big deal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

