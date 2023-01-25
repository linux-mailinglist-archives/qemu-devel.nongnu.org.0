Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEF67BEA7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnRh-0004t5-Lh; Wed, 25 Jan 2023 16:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnRY-0004sW-Cm; Wed, 25 Jan 2023 16:36:32 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnRV-0004ES-Lk; Wed, 25 Jan 2023 16:36:31 -0500
Received: by mail-qt1-x835.google.com with SMTP id jr19so16102222qtb.7;
 Wed, 25 Jan 2023 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24FVvA2UhyVRsh9bm3pLR7jpP/pAh9nobO/rU9yqjqk=;
 b=oBaM4x1Hd2mxLsUTCF2nYU9FTsy5++gjJdn8PRDGB94OoPngEeoEz/eh7yVNxDJtsc
 jQj8v7oYiQ2cXHdCComMQtdttcOEmiaRHkAt9urP/bP5ol1EwLYo7k+VnnRmJ/yw7ujz
 tqSgJsfZVy3f4cILL5//JbXHN/GMzN+jbRj0G7NaSGg8tWez18xNM9u6RB8zEbpF6QJt
 Ibpem3InivjL8b2XyCxzbyvBFJm0u+xbn5QKpw+ZA9pN1eRlqwaZGW1PeRRvTvt7MuKm
 cXeOeKAtpzbWaDg5SrB8RYPMa/76Kjtk7h/pOU3OXON9PtaRbZld2UR0KwcpUcRHe1Ok
 azvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=24FVvA2UhyVRsh9bm3pLR7jpP/pAh9nobO/rU9yqjqk=;
 b=I6yqhve6teXwukfTnu3VdL0bcNDfYd4N7ZHKdxYpgHDqkaoXYCYT4d1aXTBcXRVUOR
 9XXECdG1drNpKhE0JVemAeFJeBZ2FUVc1JP446lJVyAbHYQHD7p0UAmXOSCSu3jTal7q
 HZzTOBwzLSyz167+aQ9NCzpkBJtPQ+oSmaNtC2OYlVMZjMY3fj7C750EEwWiPyuWU7Gw
 PztD+SpM5kLWCXOhMFcprjN1g/fo2hsp6PoRtdo031b7ptAWgdPd0FnkQciitUagTyco
 ln+Ca0BVIueh/BH+qtxKYFkpTl7sV6AyyersuKc2OoA0hWwNp4bQq32Mv1q00iHfN0Lq
 4GCg==
X-Gm-Message-State: AFqh2kpWYcGGqGJ0J/G5T9hvVswycAXlBVSHRCiF1fYUbDU/hQalO4C6
 bBU56fraHoRKuY1+YjAF0A==
X-Google-Smtp-Source: AMrXdXtj4FAiCytfZvnVP3xpvloj7xPmrDB8eRvhwUqZHFkjn3VMAeIFVkol7dzi4MWKgaAaQOtAMA==
X-Received: by 2002:a05:622a:178d:b0:3b6:35cb:b946 with SMTP id
 s13-20020a05622a178d00b003b635cbb946mr63652720qtk.14.1674682586525; 
 Wed, 25 Jan 2023 13:36:26 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 j129-20020a378787000000b00706a1551428sm4305025qkd.6.2023.01.25.13.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:36:25 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:7b7c:de0b:9a93:f5c2])
 by serve.minyard.net (Postfix) with ESMTPSA id 736971800BF;
 Wed, 25 Jan 2023 21:36:24 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:36:23 -0600
From: Corey Minyard <minyard@acm.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y9Gg15hBJ/aQgd3e@minyard.net>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-4-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118024214.14413-4-peter@pjd.dev>
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x835.google.com
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

On Tue, Jan 17, 2023 at 06:42:12PM -0800, Peter Delevoryas wrote:
> Allows users to specify binary data to initialize an EEPROM, allowing users to
> emulate data programmed at manufacturing time.
> 
> - Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
> - Added at24c_eeprom_init_rom helper function to initialize attributes
> - If -drive property is provided, it overrides init_rom data
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
>  include/hw/nvram/eeprom_at24c.h | 16 ++++++++++++++
>  2 files changed, 48 insertions(+), 5 deletions(-)
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

Why did you switch from using i2c_slave_new()?  Using it is more
documentation and future-proofing than convenience.

Other than that, looks good to me.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

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
> +    }
> +
>      if (ee->blk) {
>          int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
>  
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> index 196db309d451..acb9857b2add 100644
> --- a/include/hw/nvram/eeprom_at24c.h
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -20,4 +20,20 @@
>   */
>  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
>  
> +
> +/*
> + * Create and realize an AT24C EEPROM device on the heap with initial data.
> + * @bus: I2C bus to put it on
> + * @address: I2C address of the EEPROM slave when put on a bus
> + * @rom_size: size of the EEPROM
> + * @init_rom: Array of bytes to initialize EEPROM memory with
> + * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
> + *
> + * Create the device state structure, initialize it, put it on the specified
> + * @bus, and drop the reference to it (the device is realized). Copies the data
> + * from @init_rom to the beginning of the EEPROM memory buffer.
> + */
> +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> +                                const uint8_t *init_rom, uint32_t init_rom_size);
> +
>  #endif
> -- 
> 2.39.0
> 
> 

