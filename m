Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F667BEA8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnSM-00059j-QB; Wed, 25 Jan 2023 16:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnSF-00058e-8l; Wed, 25 Jan 2023 16:37:15 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnSC-0004KC-Kp; Wed, 25 Jan 2023 16:37:14 -0500
Received: by mail-qv1-xf35.google.com with SMTP id h10so32112qvq.7;
 Wed, 25 Jan 2023 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=f6yybHF2IsW8PyY4adLHibeoLcwqThxZKMkkz/FffSQ=;
 b=Gii3f7rHhGhCkbRnyEp6i0RH0ZUUpwH21LMVm8OG9ojpBFZbcI/MOaE1f2G1uEg8nu
 g0PhOXn0d2o9wR0B+ojmufShCTmsOenBUfPFBBqGE6W3gXVf9yLgeYsEUcmLU9RQhnd8
 KfPsE8n4cW19e8FdcHEAZN+UOThrW4FpEVFD5jcGwc/h8hYFM45M+N6q+7M5QZVhckPb
 lWLi/SWMPWQIPSN3C5SABITKuSWhtDahHWtmdB9CuLpNhfbLhiPOVieLK/4/K2mpyA5D
 GwjAZivMhEAuSUKZftTPLiFvrWah2f9l5OOXSTY4xaWQg3G42Y02Lh3xXwEZINBRFnW0
 WY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6yybHF2IsW8PyY4adLHibeoLcwqThxZKMkkz/FffSQ=;
 b=BntgJm/JlMxmlUInxSqnKI25iff0IBhX0tkpq41epk8CixmZIu6+Mbrpg0PafJf1d+
 V9dxcePfat7lhRCAl2XMECX8uvKcdN7PUuGbzZygsWuGoMQdDgt4fJIpSXX0xrd+Dzy5
 SSfT/EAXG1rfT+xipnssRjG5FN3UCst9gDYqAgGYwHNw1gsIVEEi+Oog58qyUoUn/qTQ
 jkSIaCUVKMYtO7oS0I6syDDdtAvpPAgESNe5JUVsjMzgpsH9w6Jxs7OTO3PXg3XQMgnF
 j7BJh1xc9uCDS75XVZPX9xNsDk3znBoQ6j41Rmr+iVrhvLaETz/jB+ivUwgmQdy3eekb
 tu1Q==
X-Gm-Message-State: AO0yUKW2Wcn6C8ExFUYODTdx1bL4Tv8xB4GQPiZoRwTRw9VDF/k7PvNe
 br8c8Eo6vOqMS//0OnnI4w==
X-Google-Smtp-Source: AK7set9SdzCYGQC95i9CKcGytWYBl0jwrRSrAXhrPb4A9irHNVM6IiaF0ttuJnrGIOun0Jr/j49E8w==
X-Received: by 2002:a05:6214:aa2:b0:537:6f8c:2c2c with SMTP id
 ew2-20020a0562140aa200b005376f8c2c2cmr8381955qvb.41.1674682631130; 
 Wed, 25 Jan 2023 13:37:11 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 d83-20020a376856000000b00706b6ce386fsm4237876qkc.70.2023.01.25.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:37:10 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:7b7c:de0b:9a93:f5c2])
 by serve.minyard.net (Postfix) with ESMTPSA id 974361800BF;
 Wed, 25 Jan 2023 21:37:09 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:37:08 -0600
From: Corey Minyard <minyard@acm.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 1/5] hw/arm: Extract at24c_eeprom_init helper from
 Aspeed and Nuvoton boards
Message-ID: <Y9GhBFiBHYyQTdur@minyard.net>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-2-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230118024214.14413-2-peter@pjd.dev>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.091,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 06:42:10PM -0800, Peter Delevoryas wrote:
> This helper is useful in board initialization because lets users initialize and
> realize an EEPROM on an I2C bus with a single function call.

This is a good improvement.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
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
> @@ -429,15 +430,6 @@ static void aspeed_machine_init(MachineState *machine)
>      arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>  }
>  
> -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}
> -
>  static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
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
> @@ -140,17 +141,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
>      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
>  }
>  
> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> -                              uint32_t rsize)
> -{
> -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
> -}
> -
>  static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
>                                        NPCM7xxState *soc, const int *fan_counts)
>  {
> @@ -253,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
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
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
>  
> -    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192); /* mbfru */
>  
>      i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
>                                        TYPE_PCA9548, 0x77);
> @@ -371,7 +361,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
>      i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
>  
> -    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192); /* bmcfru */
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
> +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +
> +    return i2c_dev;
> +}
> +
>  static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>  {
>      EEPROMState *ee = AT24C_EE(dev);
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
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
> + * Create the device state structure, initialize it, put it on the specified
> + * @bus, and drop the reference to it (the device is realized).
> + */
> +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> +
> +#endif
> -- 
> 2.39.0
> 
> 

