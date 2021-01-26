Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF33304D3C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 00:06:51 +0100 (CET)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4XQA-00047g-Sd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 18:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4XOd-0003U6-4g; Tue, 26 Jan 2021 18:05:15 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4XOb-0000iY-MU; Tue, 26 Jan 2021 18:05:14 -0500
Received: by mail-ot1-x32f.google.com with SMTP id 36so17974026otp.2;
 Tue, 26 Jan 2021 15:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=70wjpOoxSHNYu/4QktbvF2y/JLdTpdDsZuCErOKdUbw=;
 b=KXmBxIObxrqUxHeotVAPWmazWUu/K0K9sMlRr/DDzWeqtCQg9s6ICyb/OB04GfXJPc
 p0SY0xgVsca17Hi4ZCB37lNx7VMdrmRhQd/Pztx8XhXE97WAg1fCPx6wgfuOBcNjwzhc
 UMhaOi+bKbD8UOONkrdqGI5AvN34lBJYhu5HhEHPt3kcOt1oaWm5OsGZi+k0MYz0DhW0
 GpXuubTAcsSFdm3EJJ0en0iEghrglJSwWIRol4xf0yppjTbrsgT18WtCrob58SDEVBwy
 VXoJKwlyt4i+VYLRrzC/DRVBRq8GgCImtZ3qbTcV01ekz5GbZZ0dPTzH7ClQXherx8uv
 FVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=70wjpOoxSHNYu/4QktbvF2y/JLdTpdDsZuCErOKdUbw=;
 b=EkoCUUff7bfc2FOim47CRh1Mgy8ekWGSJMO2Xg2AJUgEj9IFrgfqZnbRElK9ABzMmV
 jh+dXtb5NRap3NILeVjSPuVMeozgOeghs/adHLawRyqIjzGdtO0w4DzrxBAuEU8BRdLP
 kL9diNPrTb3TcOTzb5sWDdgnw13VCn9EwiM+ed3wZOz+PXtgfRCtZb9SDnvG1Z5AwIa2
 kuawUVYiJ2PjcK9HHwESMYnTsveejPc8yqgxhnqeyFnWT1Gu5+unzqwP9OZA617y73LY
 U83imuEiRdNv939pQr7I09w5sVXw1HSXa3TNt3UoRv6jFXrLVBjoOKTgW1tgODMmAD1Y
 liaw==
X-Gm-Message-State: AOAM532kV9OnOSYbaXzzLupHm0ccPSI9Hs7I+vkBGfm+VkLh6xydEEBY
 kaPpAWNcE5Stnfox+7sKKw==
X-Google-Smtp-Source: ABdhPJwD1wXXHqoTc36wySdFYxFrVGPLoq+8600t7Iomd3BUyC/ZxmScxd6Pb8eZJQZuVFsLTQCOrA==
X-Received: by 2002:a9d:5d07:: with SMTP id b7mr2778080oti.368.1611702311956; 
 Tue, 26 Jan 2021 15:05:11 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id g195sm75104oib.10.2021.01.26.15.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 15:05:11 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2d17:e42b:3add:fd])
 by serve.minyard.net (Postfix) with ESMTPSA id 7911C18055B;
 Tue, 26 Jan 2021 23:05:10 +0000 (UTC)
Date: Tue, 26 Jan 2021 17:05:09 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 4/6] hw/arm: Add I2C device tree for Quanta GSJ
Message-ID: <20210126230509.GB2057975@minyard.net>
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-5-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126193237.1534208-5-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 11:32:35AM -0800, wuhaotsh--- via wrote:
> Add an I2C device tree for Quanta GSJ. We only included devices with
> existing QEMU implementation, including AT24 EEPROM and temperature
> sensors.
> 
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 2d82f48848..1418629e06 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -19,6 +19,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/arm/npcm7xx.h"
>  #include "hw/core/cpu.h"
> +#include "hw/i2c/smbus_eeprom.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> @@ -112,6 +113,21 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
>  }
>  
> +static void quanta_gsj_i2c_init(NPCM7xxState *soc)
> +{
> +    uint8_t *eeprom_buf0 = g_malloc0(32 * 1024);
> +    uint8_t *eeprom_buf1 = g_malloc0(32 * 1024);

This is kind of pointless because the smbus eeprom is 256 bytes.

It would be nice to modify the smbus eeprom code to take different
sizes, if you want to submit a patch.

-corey

> +
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x48);
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x48);
> +    smbus_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 9), 0x55, eeprom_buf0);
> +    smbus_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 10), 0x55, eeprom_buf1);
> +
> +    /* TODO: Add addtional i2c devices. */
> +}
> +
>  static void npcm750_evb_init(MachineState *machine)
>  {
>      NPCM7xxState *soc;
> @@ -137,6 +153,7 @@ static void quanta_gsj_init(MachineState *machine)
>      npcm7xx_load_bootrom(machine, soc);
>      npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
>                            drive_get(IF_MTD, 0, 0));
> +    quanta_gsj_i2c_init(soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>  
> -- 
> 2.30.0.365.g02bc693789-goog
> 
> 

