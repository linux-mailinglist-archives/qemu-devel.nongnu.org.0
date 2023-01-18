Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46044671103
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHy06-0003fK-TN; Tue, 17 Jan 2023 21:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy00-0003eT-C5; Tue, 17 Jan 2023 21:16:27 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHxzy-0003Ij-2n; Tue, 17 Jan 2023 21:16:24 -0500
Received: by mail-ej1-x62a.google.com with SMTP id az20so60770411ejc.1;
 Tue, 17 Jan 2023 18:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8d2u9AO6X81EI8QrDKkPhhCyyMvf9q7KkYf0e7xSJQE=;
 b=bTUnmf2sr7MQsyTKyokrxe8TjZI3fKDoLx1eztyIdZ+P+lg+TzNWeWTi4BkO0WKhI2
 rFDzB2jNuN5miBXQCcf1q0s1aPcHPwnnJcATyeGdC9VSO5lOh96ILcYgfiy6BH5CW0u1
 PLO0DPqwUzBKFSc58NjDxO4V2RAbk+njaSEIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8d2u9AO6X81EI8QrDKkPhhCyyMvf9q7KkYf0e7xSJQE=;
 b=i5HW/N3FHwYHAqZh/D/HpcWzLHGg0aZwBbba3CByGAHBz7Rt/0CKMnxeVINQSt3q9D
 0N0AfFMxRnQ7XXXDy9ZBMmYc64pX9gNSKj5nJ9lrrt6DkXLf5c9MuhaOOcK2I/ZKkJ6+
 nLkP3ENikIZAwvOrG3gkaqIZw4rNnMGvUOl0lZArZZX9S3phmWcF4K7yHfKnpqW6myLk
 2fRKV8ndADlK6OqoSBDeUsc8RG3GzFKA4mjz6jzBDFcFMOqXPV2tfU4moGC7Gd8gS2aR
 CKmGt/uFa+pS9mH14Vxm4zNP5yNQn0KV0JHflBQmUim8aIIqzFezKMb6gT8iINBpy8kx
 5Z6g==
X-Gm-Message-State: AFqh2kr+ImE4LS4Wm+bLLyA8ttUI7MlrXAkDBJHPDMWTWcwpFQpNMGVU
 GE0e8VCzo1ha28KzrTkY7SCk/wpOxXCZbdyFERA=
X-Google-Smtp-Source: AMrXdXvUN+Km4pCN1AfvSeWsKXfJZx2EvuAjcspMBK7SepGINGuWmugjUNWzRWzq5ttDVCUAW3LML1kqxlcfMoMhDu8=
X-Received: by 2002:a17:906:8d06:b0:877:5dbc:da83 with SMTP id
 rv6-20020a1709068d0600b008775dbcda83mr2936ejc.245.1674008178658; Tue, 17 Jan
 2023 18:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20230117232427.74496-1-peter@pjd.dev>
 <20230117232427.74496-2-peter@pjd.dev>
In-Reply-To: <20230117232427.74496-2-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 02:16:05 +0000
Message-ID: <CACPK8XfxuGw9TE5aig0oji3+bt9Cahq7hXxqKpGyUYOuoUFhww@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/arm: Extract at24c_eeprom_init helper from
 Aspeed and Nuvoton boards
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, 
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, 17 Jan 2023 at 23:24, Peter Delevoryas <peter@pjd.dev> wrote:
>
> This helper is useful in board initialization because lets users initiali=
ze and
> realize an EEPROM on an I2C bus with a single function call.
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c                 | 10 +---------
>  hw/arm/npcm7xx_boards.c         | 20 +++++---------------
>  hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
>  include/hw/nvram/eeprom_at24c.h | 23 +++++++++++++++++++++++
>  4 files changed, 41 insertions(+), 24 deletions(-)
>  create mode 100644 include/hw/nvram/eeprom_at24c.h
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 55f114ef729f..1f9799d4321e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -17,6 +17,7 @@
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
> +#include "hw/nvram/eeprom_at24c.h"
>  #include "hw/sensor/tmp105.h"
>  #include "hw/misc/led.h"
>  #include "hw/qdev-properties.h"
> @@ -429,15 +430,6 @@ static void aspeed_machine_init(MachineState *machin=
e)
>      arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>  }
>
> -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev =3D DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}
> -
>  static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc =3D &bmc->soc;
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 6bc6f5d2fe29..9b31207a06e9 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -21,6 +21,7 @@
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/loader.h"
> +#include "hw/nvram/eeprom_at24c.h"
>  #include "hw/qdev-core.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> @@ -140,17 +141,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc=
, uint32_t num)
>      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus=
"));
>  }
>
> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> -                              uint32_t rsize)
> -{
> -    I2CBus *i2c_bus =3D npcm7xx_i2c_get_bus(soc, bus);
> -    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev =3D DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
> -}
> -
>  static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
>                                        NPCM7xxState *soc, const int *fan_=
counts)
>  {
> @@ -253,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c)=
;
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c)=
;
>
> -    at24c_eeprom_init(soc, 9, 0x55, 8192);
> -    at24c_eeprom_init(soc, 10, 0x55, 8192);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 0x55, 8192);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 0x55, 8192);
>
>      /*
>       * i2c-11:
> @@ -360,7 +350,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
>
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0=
x77);
>
> -    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192); /* mbfru=
 */
>
>      i2c_mux =3D i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
>                                        TYPE_PCA9548, 0x77);
> @@ -371,7 +361,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0=
x48);
>      i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0=
x49);
>
> -    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192); /* bmcf=
ru */
>
>      /* TODO: Add remaining i2c devices. */
>  }
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 2d4d8b952f38..98857e3626b9 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -12,6 +12,7 @@
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  #include "hw/i2c/i2c.h"
> +#include "hw/nvram/eeprom_at24c.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "sysemu/block-backend.h"
> @@ -128,6 +129,17 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>      return 0;
>  }
>
> +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_s=
ize)
> +{
> +    I2CSlave *i2c_dev =3D i2c_slave_new(TYPE_AT24C_EE, address);
> +    DeviceState *dev =3D DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +
> +    return i2c_dev;
> +}
> +
>  static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>  {
>      EEPROMState *ee =3D AT24C_EE(dev);
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at=
24c.h
> new file mode 100644
> index 000000000000..196db309d451
> --- /dev/null
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates.
> + *
> + * SPDX-License-Identifier: GPL-2.0-only
> + */
> +
> +#ifndef EEPROM_AT24C_H
> +#define EEPROM_AT24C_H
> +
> +#include "hw/i2c/i2c.h"
> +
> +/*
> + * Create and realize an AT24C EEPROM device on the heap.
> + * @bus: I2C bus to put it on
> + * @address: I2C address of the EEPROM slave when put on a bus
> + * @rom_size: size of the EEPROM
> + *
> + * Create the device state structure, initialize it, put it on the speci=
fied
> + * @bus, and drop the reference to it (the device is realized).
> + */
> +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_s=
ize);
> +
> +#endif
> --
> 2.39.0
>

