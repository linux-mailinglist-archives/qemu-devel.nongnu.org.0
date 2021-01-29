Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89185308997
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:43:52 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5V03-0003gB-Jh
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UyK-0003CH-H8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:42:04 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UyG-0008Pp-IV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:42:02 -0500
Received: by mail-wm1-x32c.google.com with SMTP id e15so7378847wme.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=roGIidkSXK1wljdwmOTsqwtWFtta29CPkLvGxgifUq0=;
 b=RD6MjjVeNvrJx6Hod5m1abOyJUACXIDcFEJnmp1sHUctTCk6EuT/7AxvTPytX9QaNu
 4Psz22Gu0C/JDTFyitsCgDnIzHWQCwumffsdcPfpt3yziuKIEnk1UmOvCpfmQCIGGMJI
 c3EDKBQ7QNvIKoxl8DepheI4losp84eMzfVBeRdgpUV0hDLRISpRKfdJ55LNxOV1MjTP
 3H5WT8RXFJyMtqlh2bA4xSZCKpgwBsULcWcZz/+lq6ReUF5Toa+nnpDr92TmVDBX4wdY
 lSMdJ14M2oheOLZN3DPhnPOsDkEgUyg8m+4pMuLJsutOodp851gA7kfEO1bkc8KaE1Kc
 Be/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=roGIidkSXK1wljdwmOTsqwtWFtta29CPkLvGxgifUq0=;
 b=pgWq+9BqZcqmaBACV++eVV974pd3ulA/EAxtAJfY+nr3+U4df9upjPKCyGpwdIAWW1
 sa3fma7v4XPSJmAAdR3eCzrypRHsTmJB3kA12jWz7u5EmS1EZ+DEIKk9+BNe4ywr0Fkb
 aLZ9TZ2nkFf/tTQi9TZXDulNSyiP4AZyWb84I0S0rjD828L219WKOb8tRlMwcDNlCOUy
 e3cIGE0uLI8L3smfVq6NqSNkaEBRQikGufAbtyrtKXVjtOfGhfREf3vaCm+3GHjca2b4
 H4U0P7roxXLafvcQqHNbP0McE7wVfjOuWT5jb4G5STwoEWHwuhJTF4KYihqTbd1QERCs
 /Hmg==
X-Gm-Message-State: AOAM531A4CZenRfv/60PIQW7ER+hdF7+A4lfjMT3DQ57O9mQvlGi7HVJ
 juDO7Ap2/iyu1UAzSUgy5dQ=
X-Google-Smtp-Source: ABdhPJzxtBob8k1TDM3WPb2nfTMWPHomgTU9K/oAEa8nb5ZBx7I2YbP2RsaqH0ZSCenakRFuCYzuwg==
X-Received: by 2002:a1c:4b19:: with SMTP id y25mr4177420wma.44.1611931318382; 
 Fri, 29 Jan 2021 06:41:58 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r25sm13385573wrr.64.2021.01.29.06.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 06:41:57 -0800 (PST)
Subject: Re: [PULL 17/21] hw/adc: Add an ADC module for NPCM7XX
To: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-18-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <461061a0-e516-9e98-308e-a8f270487d5c@amsat.org>
Date: Fri, 29 Jan 2021 15:41:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112165750.30475-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hao Wu,

On 1/12/21 5:57 PM, Peter Maydell wrote:
> From: Hao Wu <wuhaotsh@google.com>
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
> Message-id: 20210108190945.949196-4-wuhaotsh@google.com
> [PMM: Added missing hw/adc/trace.h file]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/nuvoton.rst    |   2 +-
>  meson.build                    |   1 +
>  hw/adc/trace.h                 |   1 +
>  include/hw/adc/npcm7xx_adc.h   |  69 ++++++
>  include/hw/arm/npcm7xx.h       |   2 +
>  hw/adc/npcm7xx_adc.c           | 301 ++++++++++++++++++++++++++
>  hw/arm/npcm7xx.c               |  24 ++-
>  tests/qtest/npcm7xx_adc-test.c | 377 +++++++++++++++++++++++++++++++++
>  hw/adc/meson.build             |   1 +
>  hw/adc/trace-events            |   5 +
>  tests/qtest/meson.build        |   3 +-
>  11 files changed, 783 insertions(+), 3 deletions(-)
>  create mode 100644 hw/adc/trace.h
>  create mode 100644 include/hw/adc/npcm7xx_adc.h
>  create mode 100644 hw/adc/npcm7xx_adc.c
>  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>  create mode 100644 hw/adc/trace-events
...

> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> new file mode 100644
> index 00000000000..870a6d50c27
> --- /dev/null
> +++ b/hw/adc/npcm7xx_adc.c
> @@ -0,0 +1,301 @@
> +/*
> + * Nuvoton NPCM7xx ADC Module
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/adc/npcm7xx_adc.h"
> +#include "hw/qdev-clock.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/registerfields.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/timer.h"
> +#include "qemu/units.h"
> +#include "trace.h"
> +
> +REG32(NPCM7XX_ADC_CON, 0x0)
> +REG32(NPCM7XX_ADC_DATA, 0x4)
> +
> +/* Register field definitions. */
> +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)
> +#define NPCM7XX_ADC_CON_INT_EN  BIT(21)
> +#define NPCM7XX_ADC_CON_REFSEL  BIT(19)
> +#define NPCM7XX_ADC_CON_INT     BIT(18)
> +#define NPCM7XX_ADC_CON_EN      BIT(17)
> +#define NPCM7XX_ADC_CON_RST     BIT(16)
> +#define NPCM7XX_ADC_CON_CONV    BIT(14)
> +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
> +
> +#define NPCM7XX_ADC_MAX_RESULT      1023
> +#define NPCM7XX_ADC_DEFAULT_IREF    2000000
> +#define NPCM7XX_ADC_CONV_CYCLES     20
> +#define NPCM7XX_ADC_RESET_CYCLES    10
> +#define NPCM7XX_ADC_R0_INPUT        500000
> +#define NPCM7XX_ADC_R1_INPUT        1500000
> +
> +static void npcm7xx_adc_reset(NPCM7xxADCState *s)
> +{
> +    timer_del(&s->conv_timer);
> +    s->con = 0x000c0001;

This initialize CON to:

NPCM7XX_ADC_CON_REFSEL | NPCM7XX_ADC_CON_INT | BIT(0)

What is bit 0?

> +    s->data = 0x00000000;
> +}

