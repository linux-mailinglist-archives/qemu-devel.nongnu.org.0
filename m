Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE6967111A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHy5l-0006zr-I8; Tue, 17 Jan 2023 21:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy5j-0006z4-1q; Tue, 17 Jan 2023 21:22:19 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy5g-00044b-OR; Tue, 17 Jan 2023 21:22:18 -0500
Received: by mail-ej1-x634.google.com with SMTP id v6so36877737ejg.6;
 Tue, 17 Jan 2023 18:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xAq3Dh4ExjNggY9aYOuRjsxM6Z608GWVeYNBFZ4u9j8=;
 b=hOBGDSgpzPPA8xF1POjssKu0qDAnx87G2Sgn2XJF7RbOmmhrrl63B2mB5Qz1qFYneo
 heAhYK6w+t8jk+4SJEtJz9BwnjX1sa6+eFAJ7tCnLOX0a+1t16vMv5N3eM01JltjEnZc
 qmKLl8Gz8lJZeWM/kSHEA58o/CR1H88Pz7EsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAq3Dh4ExjNggY9aYOuRjsxM6Z608GWVeYNBFZ4u9j8=;
 b=kQzS01G9/j6/cY3q6twwdmKwhk6tBsv2LN9rfkkWL2LF6pZyrKiaAk7qskoacKyMiQ
 AUpHx335vp/N2vANJ2R5+JyCR0WObYNtw80MvTTLELkI+7ozPpWhl3yOSMi06+sklD9F
 OPeQGSxbff/25rg8atvQmD7qku+EfQpvhrSkqg3xBGCBX/ZQbHrKOt6wpqheDHU7lHNc
 oETUtYFPWAroQeumxJhn7EHfUegoiE9C0z6gtVvAWQDDBqOf4fMwVQHqz65Tonp7b+Fs
 ha/PywciyFwORpuogHpGT/L7OaM1qpVAgzTTpr1SZ45EuLCHAQJoAZTK0p7tBARip/ex
 hMrA==
X-Gm-Message-State: AFqh2ko3c9HdcMO+ebumm48v+vWUxfQ7un6hwwjx8ivfGDaaYVzaMZzv
 W42McbL3o9XxaomYf7ep4R3rIMCBde2hoL9jTGw=
X-Google-Smtp-Source: AMrXdXujlhZ0L482lIK4/pKhTbp2DsbFGLNTBsODfc91ZqNPercUN/t4WyQRhI8apw1F/dzcMHgWeyUtHQ6SvgMCV0c=
X-Received: by 2002:a17:906:ecb9:b0:86d:97d4:9fea with SMTP id
 qh25-20020a170906ecb900b0086d97d49feamr672886ejb.141.1674008533738; Tue, 17
 Jan 2023 18:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20230117232427.74496-1-peter@pjd.dev>
 <20230117232427.74496-4-peter@pjd.dev>
In-Reply-To: <20230117232427.74496-4-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 02:22:01 +0000
Message-ID: <CACPK8XefPV=TwomysZqzSLyQk77mBiWqz_+F3Vh5og7E179tyg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, 
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x634.google.com
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
> Allows users to specify binary data to initialize an EEPROM, allowing users to
> emulate data programmed at manufacturing time.

I like it. Is there somewhere sensible to add a description to the
code base? Perhaps as a comment to your new function?

>
> - Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
> - Added at24c_eeprom_init_rom helper function to initialize attributes
> - If -drive property is provided, it overrides init_rom data
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
>  include/hw/nvram/eeprom_at24c.h |  2 ++
>  2 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 98857e3626b9..f8d751fa278d 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -50,6 +50,9 @@ struct EEPROMState {
>      uint8_t *mem;
>
>      BlockBackend *blk;
> +
> +    const uint8_t *init_rom;
> +    uint32_t init_rom_size;
>  };
>
>  static
> @@ -131,19 +134,38 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>
>  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
>  {
> -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> -    DeviceState *dev = DEVICE(i2c_dev);
> +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
> +}
> +
> +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> +                                const uint8_t *init_rom, uint32_t init_rom_size)
> +{
> +    EEPROMState *s;
> +
> +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
> +
> +    qdev_prop_set_uint8(DEVICE(s), "address", address);
> +    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
>
> -    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +    /* TODO: Model init_rom with QOM properties. */
> +    s->init_rom = init_rom;
> +    s->init_rom_size = init_rom_size;
>
> -    return i2c_dev;
> +    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
> +
> +    return I2C_SLAVE(s);
>  }
>
>  static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>  {
>      EEPROMState *ee = AT24C_EE(dev);
>
> +    if (ee->init_rom_size > ee->rsize) {
> +        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
> +                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
> +        return;
> +    }
> +
>      if (ee->blk) {
>          int64_t len = blk_getlength(ee->blk);
>
> @@ -163,6 +185,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>      }
>
>      ee->mem = g_malloc0(ee->rsize);
> +
>  }
>
>  static
> @@ -176,6 +199,10 @@ void at24c_eeprom_reset(DeviceState *state)
>
>      memset(ee->mem, 0, ee->rsize);
>
> +    if (ee->init_rom) {
> +        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));

I like the MIN here; good usability feature. It's worth documenting too.

> +    }
> +
>      if (ee->blk) {
>          int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
>
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> index 196db309d451..5c9149331144 100644
> --- a/include/hw/nvram/eeprom_at24c.h
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -19,5 +19,7 @@
>   * @bus, and drop the reference to it (the device is realized).
>   */
>  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> +                                const uint8_t *init_rom, uint32_t init_rom_size);
>
>  #endif
> --
> 2.39.0
>

