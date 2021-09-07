Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B717D402521
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:29:28 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWTv-0004jU-Iv
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWPX-0000CN-FP; Tue, 07 Sep 2021 04:24:55 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:41850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWPT-0005wy-QW; Tue, 07 Sep 2021 04:24:55 -0400
Received: by mail-qv1-xf29.google.com with SMTP id p17so5318209qvo.8;
 Tue, 07 Sep 2021 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4WdERIj4yJIC2Y4OE0YBud9k/nAUYxJqXzOQljQUMg=;
 b=ShuUjM68xxosBMmxc4VhUkUPIwc1rFJowKZhDPR+norBwHo0I8pxuUhov+sVkudK23
 CjlW3XOewEhLozIWUQbF2ox0R/mMx9xl+4E3+/YPbklwuAUSTIaP0zFBlidtN2pIKyMP
 z1ZXs6iYTRJvYeAuIoNMLJvoSZ2OJg8YwJCZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4WdERIj4yJIC2Y4OE0YBud9k/nAUYxJqXzOQljQUMg=;
 b=OnXPgyLSbYsa/r7E/KxobFVO9Pweu2WFrT++G7+glhEKulrzeo9lFxVO/ZHgrKQT71
 jcQ3gwx47Ji0TK2FWjg89Ua0LTR7IjdeFtFlh9x1cziV8X3aBXg6KsRf/6bO2IJYbcjf
 HtBLOIvbSkxObsq21mibMQwNEzuSVfVc0f6u3U0OxNTcnR0H0fuy4eCuOH6ATp8R9J3a
 1XgZU19oqNL5beW5PqcUU68FLwkzKz9E0gMEVFkf7+s83lPhI+dPRtvpnlSsbZ0bmnJy
 ikry4OsGimHRRxR7azDbuwHmVFJ/SSN69aIvy3jYcV2pyO9hm5eWDg9EtiZ+VTJqUPJZ
 +giA==
X-Gm-Message-State: AOAM531njguIuYEj3g7c25e6Y96ssXJfcoDTUy9326AOM4mm1pDF79Py
 hSRrmnS/m5e76FIID/G0hnlLe/RIsPxje248KZs=
X-Google-Smtp-Source: ABdhPJw6Zyy+m4m7ExsxypuPDKaKgAOeAeYL0LkJvWoU9nE9mTnHC2MX+orZ+ltEWY9isnLI0kW2U2BL7aNU+RgrFQg=
X-Received: by 2002:a0c:ec02:: with SMTP id y2mr16022934qvo.43.1631003089997; 
 Tue, 07 Sep 2021 01:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210906134023.3711031-1-pdel@fb.com>
 <20210906134023.3711031-2-pdel@fb.com>
In-Reply-To: <20210906134023.3711031-2-pdel@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Sep 2021 08:24:38 +0000
Message-ID: <CACPK8XfyxtB2v8i4hprSgJZj3Tm9P8e7a456UKv=64gHZs-jiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock
 selection registers
To: pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sept 2021 at 13:40, <pdel@fb.com> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> UART5 is typically used as the default debug UART on the AST2600, but
> UART1 is also designed to be a debug UART. All the AST2600 UART's have
> semi-configurable clock rates through registers in the System Control
> Unit (SCU), but only UART5 works out of the box with zero-initialized
> values. The rest of the UART's expect a few of the registers to be
> initialized to non-zero values, or else the clock rate calculation will
> yield zero or undefined (due to a divide-by-zero).
>
> For reference, the U-Boot clock rate driver here shows the calculation:
>
>     https://github.com/facebook/openbmc-uboot/blob/15f7e0dc01d8/drivers/clk/aspeed/clk_ast2600.c#L357
>
> To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
> 13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
> "low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
> are configurable themselves:
>
>     UARTCLK = UXCLK * R / (N * 2)
>     HUARTCLK = HUXCLK * HR / (HN * 2)
>
> UXCLK and HUXCLK are also configurable, and depend on the APLL and/or
> HPLL clock rates, which also derive from complicated calculations. Long
> story short, there's lots of multiplication and division from
> configurable registers, and most of these registers are zero-initialized
> in QEMU, which at best is unexpected and at worst causes this clock rate
> driver to hang from divide-by-zero's. This can also be difficult to
> diagnose, because it may cause U-Boot to hang before serial console
> initialization completes, requiring intervention from gdb.
>
> This change just initializes all of these registers with default values
> from the datasheet.
>
> To test this, I used Facebook's AST2600 OpenBMC image for "fuji", with
> the following diff applied (because fuji uses UART1 for console output,
> not UART5).
>
>   @@ -323,8 +323,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>        }
>
>       /* UART - attach an 8250 to the IO space as our UART5 */
>   -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>   -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>   +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART1], 2,
>   +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART1),
>                     38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>
>        /* I2C */
>
> Without these clock rate registers being initialized, U-Boot hangs in
> the clock rate driver from a divide-by-zero, because the UART1 clock
> rate register reads return zero, and there's no console output. After
> initializing them with default values, fuji boots successfully.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/misc/aspeed_scu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 05edebedeb..a95dca65f2 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -119,6 +119,8 @@
>  #define AST2600_CLK_SEL3          TO_REG(0x308)
>  #define AST2600_CLK_SEL4          TO_REG(0x310)
>  #define AST2600_CLK_SEL5          TO_REG(0x314)
> +#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
> +#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)

It would be consistent with the existing naming if we dropped the
_PARAM. Not worth re-spinning just for that though.

>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
> @@ -681,6 +683,8 @@ static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>      [AST2600_CLK_SEL3]          = 0x00000000,
>      [AST2600_CLK_SEL4]          = 0xF3F40000,
>      [AST2600_CLK_SEL5]          = 0x30000000,
> +    [AST2600_UARTCLK_PARAM]     = 0x00014506,
> +    [AST2600_HUARTCLK_PARAM]    = 0x000145C0,

These match v9 of the datasheet, so they look good to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>      [AST2600_CHIP_ID0]          = 0x1234ABCD,
>      [AST2600_CHIP_ID1]          = 0x88884444,
>  };
> --
> 2.30.2
>

