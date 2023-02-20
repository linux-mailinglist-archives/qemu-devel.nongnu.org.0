Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07369D0B7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8BE-0005CX-6g; Mon, 20 Feb 2023 10:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU8B8-0005BO-Py
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:34:10 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU8B6-0006bv-Rj
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:34:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg25-20020a05600c3c9900b003e21af96703so678929wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAGp1Fca25AjtMSFyevj1vYFRNnC+hqUOORXKuYGNMo=;
 b=a9GkxIw+unp6rS81gQ4pkRRiR5fQKFOgzm/v/0IvqDp2PbYnbYOkre8S7OlnhczvNK
 GcezojK6jO8csrWTszXRXkVGgjl8O4uZepInZGKNe3vLbWRtAmue5xPY3NUSTmv0ek41
 wF53bwzx+u2DvXRaR+7ajOwsutlxcJRN7BkbhgEVgvlqNyLBJ3da7sWbY71JcUmuXVBi
 A4HBpqfxnMG8DuFOYPCV5tL3MhWOCZrTBsW4M2rmPVgsOBA0LwwiBg90oY26hNf5Srn2
 670SfoXpeG6tGzRYP2pZNWP30UqL1jIATPj6kXV7gdc2rPmfAQllVFXHoAeZPpZixDtP
 L9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jAGp1Fca25AjtMSFyevj1vYFRNnC+hqUOORXKuYGNMo=;
 b=dGhY4QyWB3Z1RKEQpIOcX0/Ut7ncnFplql3wgy1/iXAou+IwMFhN8mZg2XaEnzEN4f
 r/G5vwhE63rzJDmX1Eo7L8C+NYzqNYdLru8B8RQAt/BkrRFRKJOTmDojYvsMhCm1VpAq
 g7xOELaYA1RQACFkd1g4FIBdoD/BM9bKhBnwedbbYNPHzCAgT9ki0Fvrf6IgPL7TMPG/
 3fgTXz1ysmscsxfQNlYremBpHjJR01jv7ZPfITXdGul8zr+ctM8keCagf4lpvFfntBT6
 mhjXCihvE6FtNwxz8WEwYRjo5Xl5dliiVqQqaXmNJF2hRUKwpj+vYV4DYtq4htojWxrp
 W6jA==
X-Gm-Message-State: AO0yUKVAQjh0EBoPh6tF6AA2PP5J464ouS0sw82oTZsa9YGJ/3YSVgj4
 TKKm6FgPJiFBTNmHb92CyGEOZLPwr+LAt+8G
X-Google-Smtp-Source: AK7set+cYyWAHDj7EKV6wXjWyLgDvywD+PWZvMrLoYmLpXZIyLWVJcQsHxyBKhSQE4h0h7tzHhwd8Q==
X-Received: by 2002:a05:600c:755:b0:3e2:1fe9:8d1b with SMTP id
 j21-20020a05600c075500b003e21fe98d1bmr9034586wmn.6.1676907247146; 
 Mon, 20 Feb 2023 07:34:07 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c451000b003dc5b59ed7asm1717903wmo.11.2023.02.20.07.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:34:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70CE01FFB7;
 Mon, 20 Feb 2023 15:34:06 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-7-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/8] hw/char/cmsdk-apb-uart: Open-code
 cmsdk_apb_uart_create()
Date: Mon, 20 Feb 2023 15:33:00 +0000
In-reply-to: <20230220115114.25237-7-philmd@linaro.org>
Message-ID: <87cz64s64x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> cmsdk_apb_uart_create() is only used twice in the same
> file. Open-code it.

Hmm, you could just as easily make cmsdk_apb_uart_create a private
static function and avoid any copy paste snafus if something needs
changing.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/mps2.c                    | 41 +++++++++++++++++++++-----------
>  include/hw/char/cmsdk-apb-uart.h | 34 --------------------------
>  2 files changed, 27 insertions(+), 48 deletions(-)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index a86a994dba..d92fd60684 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -35,6 +35,7 @@
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/char/cmsdk-apb-uart.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
> @@ -282,6 +283,9 @@ static void mps2_common_init(MachineState *machine)
>          qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12=
));
>=20=20
>          for (i =3D 0; i < 5; i++) {
> +            DeviceState *dev;
> +            SysBusDevice *s;
> +
>              static const hwaddr uartbase[] =3D {0x40004000, 0x40005000,
>                                                0x40006000, 0x40007000,
>                                                0x40009000};
> @@ -294,12 +298,16 @@ static void mps2_common_init(MachineState *machine)
>                  rxovrint =3D qdev_get_gpio_in(orgate_dev, i * 2 + 1);
>              }
>=20=20
> -            cmsdk_apb_uart_create(uartbase[i],
> -                                  qdev_get_gpio_in(armv7m, uartirq[i] + =
1),
> -                                  qdev_get_gpio_in(armv7m, uartirq[i]),
> -                                  txovrint, rxovrint,
> -                                  NULL,
> -                                  serial_hd(i), SYSCLK_FRQ);
> +            dev =3D qdev_new(TYPE_CMSDK_APB_UART);
> +            s =3D SYS_BUS_DEVICE(dev);
> +            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> +            qdev_prop_set_uint32(dev, "pclk-frq", SYSCLK_FRQ);
> +            sysbus_realize_and_unref(s, &error_fatal);
> +            sysbus_mmio_map(s, 0, uartbase[i]);
> +            sysbus_connect_irq(s, 0, qdev_get_gpio_in(armv7m, uartirq[i]=
 + 1));
> +            sysbus_connect_irq(s, 1, qdev_get_gpio_in(armv7m, uartirq[i]=
));
> +            sysbus_connect_irq(s, 2, txovrint);
> +            sysbus_connect_irq(s, 3, rxovrint);
>          }
>          break;
>      }
> @@ -324,7 +332,8 @@ static void mps2_common_init(MachineState *machine)
>                                                0x4002c000, 0x4002d000,
>                                                0x4002e000};
>              Object *txrx_orgate;
> -            DeviceState *txrx_orgate_dev;
> +            DeviceState *txrx_orgate_dev, *dev;
> +            SysBusDevice *s;
>=20=20
>              txrx_orgate =3D object_new(TYPE_OR_IRQ);
>              object_property_set_int(txrx_orgate, "num-lines", 2, &error_=
fatal);
> @@ -332,13 +341,17 @@ static void mps2_common_init(MachineState *machine)
>              txrx_orgate_dev =3D DEVICE(txrx_orgate);
>              qdev_connect_gpio_out(txrx_orgate_dev, 0,
>                                    qdev_get_gpio_in(armv7m, uart_txrx_irq=
no[i]));
> -            cmsdk_apb_uart_create(uartbase[i],
> -                                  qdev_get_gpio_in(txrx_orgate_dev, 0),
> -                                  qdev_get_gpio_in(txrx_orgate_dev, 1),
> -                                  qdev_get_gpio_in(orgate_dev, i * 2),
> -                                  qdev_get_gpio_in(orgate_dev, i * 2 + 1=
),
> -                                  NULL,
> -                                  serial_hd(i), SYSCLK_FRQ);
> +
> +            dev =3D qdev_new(TYPE_CMSDK_APB_UART);
> +            s =3D SYS_BUS_DEVICE(dev);
> +            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> +            qdev_prop_set_uint32(dev, "pclk-frq", SYSCLK_FRQ);
> +            sysbus_realize_and_unref(s, &error_fatal);
> +            sysbus_mmio_map(s, 0, uartbase[i]);
> +            sysbus_connect_irq(s, 0, qdev_get_gpio_in(txrx_orgate_dev, 0=
));
> +            sysbus_connect_irq(s, 1, qdev_get_gpio_in(txrx_orgate_dev, 1=
));
> +            sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2)=
);
> +            sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 =
+ 1));
>          }
>          break;
>      }
> diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb=
-uart.h
> index 64b0a3d534..7de8f8d1b9 100644
> --- a/include/hw/char/cmsdk-apb-uart.h
> +++ b/include/hw/char/cmsdk-apb-uart.h
> @@ -12,10 +12,8 @@
>  #ifndef CMSDK_APB_UART_H
>  #define CMSDK_APB_UART_H
>=20=20
> -#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
> -#include "qapi/error.h"
>  #include "qom/object.h"
>=20=20
>  #define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
> @@ -45,36 +43,4 @@ struct CMSDKAPBUART {
>      uint8_t rxbuf;
>  };
>=20=20
> -/**
> - * cmsdk_apb_uart_create - convenience function to create TYPE_CMSDK_APB=
_UART
> - * @addr: location in system memory to map registers
> - * @chr: Chardev backend to connect UART to, or NULL if no backend
> - * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating ba=
ud rate)
> - */
> -static inline DeviceState *cmsdk_apb_uart_create(hwaddr addr,
> -                                                 qemu_irq txint,
> -                                                 qemu_irq rxint,
> -                                                 qemu_irq txovrint,
> -                                                 qemu_irq rxovrint,
> -                                                 qemu_irq uartint,
> -                                                 Chardev *chr,
> -                                                 uint32_t pclk_frq)
> -{
> -    DeviceState *dev;
> -    SysBusDevice *s;
> -
> -    dev =3D qdev_new(TYPE_CMSDK_APB_UART);
> -    s =3D SYS_BUS_DEVICE(dev);
> -    qdev_prop_set_chr(dev, "chardev", chr);
> -    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_mmio_map(s, 0, addr);
> -    sysbus_connect_irq(s, 0, txint);
> -    sysbus_connect_irq(s, 1, rxint);
> -    sysbus_connect_irq(s, 2, txovrint);
> -    sysbus_connect_irq(s, 3, rxovrint);
> -    sysbus_connect_irq(s, 4, uartint);
> -    return dev;
> -}
> -
>  #endif


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

