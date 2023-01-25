Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A448F67BEAB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:38:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnSc-0005kZ-Hy; Wed, 25 Jan 2023 16:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnSZ-0005bt-RF; Wed, 25 Jan 2023 16:37:35 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnSX-0004P9-OA; Wed, 25 Jan 2023 16:37:35 -0500
Received: by mail-qt1-x82a.google.com with SMTP id s4so17337253qtx.6;
 Wed, 25 Jan 2023 13:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=qwXwJYSX0vF/qSTj7XMNuTU48PnldSS0p261AAAVKRE=;
 b=kTIGpiOA+hA39Kk3arP0K7c6xFFweQ/MiM6W8gBwCIPUtjhqgyZ4o0/aqtxdwh37tJ
 JFYfyxRGICjYgwhv/1+RMbXYVl4HcPWsJjOMTHzagnCTD4pQ19/0lm0sQFTOJ/k4vul4
 AbZRjO+AC8ucDrlxZfZMdULP38MtVfJktisiMDKN8Dbrds8EwO+8WbY7qneh4iJMe3oN
 VIIvZ0U/pHxi8ktnpaqrLsVjl+qDqQmm1C7E1UPF885m82y2DRsA1sxq3vsy59CfLWYB
 QOs8MATCpUaQcEkweBoJcp38oQFJ1yQ3IIf6TKwgogy0z9m1Rnh08KqSc686TtLd7zFI
 anGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwXwJYSX0vF/qSTj7XMNuTU48PnldSS0p261AAAVKRE=;
 b=msCzDeOS2s5mrZ2dm7g8SbdNI+1J90wwvDGypXToRmFbBILRmTRlCmXvgjocPPOKvQ
 ZokLHz/bsXqU1XmnfYvxvN1Y5lO2EzUCHYJfzK/r+eQ9G4S8YlKLCxphbe7gCfqknGuk
 rsJkOfdTwmjcrSh5pT9fC9jP1MkK9vaTMvVL7SfWs0wcsn4qVC4gStUVDt/+DKqfzKHs
 Y22SZ7lJbUnsxSGB5CbxHLFnPmlbpkoR68srRq9FoZ7RB/0FKXuHH3T8I0ipQIWrRNvO
 UihP9LhBG9Z53wkTLEx638rFokNX5vsIINMwxpLXvxUFJPYl9hri0HbBoxWMMM4a7bXF
 uDMg==
X-Gm-Message-State: AFqh2kptE10z+ZsxtyrE2YCfrysCjNsdMEv9ouiraveD9+M5JMAVpwmN
 CLIb5TY7wOUzcnspYRBcaQ==
X-Google-Smtp-Source: AMrXdXvsKXryODBoOS8dYr8LQ1gTD2/O5d1ZBXYlJq4B3zLgvrA3ZMSS1ZCnch+1yg0wYQPHS9F36g==
X-Received: by 2002:ac8:6b88:0:b0:3b0:4084:d6ad with SMTP id
 z8-20020ac86b88000000b003b04084d6admr48466610qts.58.1674682650183; 
 Wed, 25 Jan 2023 13:37:30 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 d83-20020a376856000000b00706b6ce386fsm4238364qkc.70.2023.01.25.13.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:37:29 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:7b7c:de0b:9a93:f5c2])
 by serve.minyard.net (Postfix) with ESMTPSA id 856271800BF;
 Wed, 25 Jan 2023 21:37:28 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:37:27 -0600
From: Corey Minyard <minyard@acm.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 2/5] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Message-ID: <Y9GhF/YzlP6HmHPk@minyard.net>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-3-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230118024214.14413-3-peter@pjd.dev>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82a.google.com
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

On Tue, Jan 17, 2023 at 06:42:11PM -0800, Peter Delevoryas wrote:
> aspeed_eeprom_init is an exact copy of at24c_eeprom_init, not needed.

Reviewed-by: Corey Minyard <cminyard@mvista.com>
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
>  1 file changed, 43 insertions(+), 52 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1f9799d4321e..c929c61d582a 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -660,15 +660,6 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
>                            eeprom_buf);
>  }
>  
> -static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}
> -
>  static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -701,7 +692,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      AspeedSoCState *soc = &bmc->soc;
>      I2CSlave *i2c_mux;
>  
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
>  
>      create_pca9552(soc, 3, 0x61);
>  
> @@ -714,9 +705,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                       0x4a);
>      i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
>      create_pca9552(soc, 4, 0x60);
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
> @@ -727,8 +718,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      create_pca9552(soc, 5, 0x61);
>      i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
>                       0x48);
> @@ -738,10 +729,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                       0x4b);
>      i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
>  
>      create_pca9552(soc, 7, 0x30);
>      create_pca9552(soc, 7, 0x31);
> @@ -754,15 +745,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                       0x4a);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
>      create_pca9552(soc, 8, 0x60);
>      create_pca9552(soc, 8, 0x61);
>      /* Bus 8: ucd90320@11 */
> @@ -771,11 +762,11 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
>                       0x48);
> @@ -783,18 +774,18 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                       0x49);
>      i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
>                                        "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
>      create_pca9552(soc, 11, 0x60);
>  
>  
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
>      create_pca9552(soc, 13, 0x60);
>  
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
>      create_pca9552(soc, 14, 0x60);
>  
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
>      create_pca9552(soc, 15, 0x60);
>  }
>  
> @@ -838,45 +829,45 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
>  
> -    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> -    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
>  
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
>      i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>  
> -    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
>      i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
>  
>      i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> -    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
>      i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
>  
>      i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
>  
> -    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
>  
> -    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
>  
>      for (int i = 0; i < 8; i++) {
> -        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> +        at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
>          i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
>          i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
>          i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
> @@ -947,11 +938,11 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
>      i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
>  
> -    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
> -    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
> +    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
> +    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
>  
>      /*
>       * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
> -- 
> 2.39.0
> 
> 

