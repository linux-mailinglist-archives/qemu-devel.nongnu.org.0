Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8040248B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:41:40 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVjf-0005On-Nb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNViJ-0004MK-4E; Tue, 07 Sep 2021 03:40:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNViG-000208-IU; Tue, 07 Sep 2021 03:40:14 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so2250154wrb.0;
 Tue, 07 Sep 2021 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E6QQ3UkRbMqWYtLmsDkeHMbtHaQV2gUUpN4hYEzdVYU=;
 b=BZfKQ/n0tN3m+abPZmvQ8UmgwDY961HbMTy33IhHXLHxju24uOfFK67dQQa6IDBbzo
 KGeaze/YIEvelllecIleXbdB9CDiQ7l+VIH8D4buRiHi5krFnBBb4FdIaI5QzYJhelmL
 t1yvHVaOeETN4gJaJ2XsHOmf7MgPCCQwbnTOFYxKkh8hF254aizqlR9jV88+CuNakvJt
 o2oHijvHmQ3NzphUxTCQ2rJZI4PsMuxwKb9DILnH77mPdjZz1YOkcr3Mun1EsXlG2lj1
 xBN+kLrESbuXN/rXLb5mIOKMrDAnVpWbAAnQBdo5yopTLABzZHRpuqRJdqNxJDuBgBuI
 ysNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E6QQ3UkRbMqWYtLmsDkeHMbtHaQV2gUUpN4hYEzdVYU=;
 b=Vfxz1DZFaQ6lJhbkgfn6LT30rKAWjIsOzqcoWtZV8Hi3ew7fEQE+m1FTQ5r+O+3CZl
 TlTJpbS0dph4gKQA/ggo/mKn9k2Ttd4/ci7zOpqOdP3Lwo5Q2rNzPgO8pufBYL7IYVsL
 FoGQa6BPdJP5JlLrZl36S3G4hGK63b+Dmab0o6NO5YqAjRpyHWYRwRpppc8HZZ/JtciD
 pUW9qCO7YFVeWYehu6PT8AB5xySN5GqUmhuW+j/00yFUsoPw3FegEzQK6rL2Tg0yruYG
 ditThgOiu5cHvbThc+MvXWauYzGIqNmcvYYqzE2iOBJAziR7Ob0jeCimheSSZ3AwQDbX
 MtnQ==
X-Gm-Message-State: AOAM532BO7foiwz+hX77+URS2HhMvnKbVs+RHMfQF7FRfKwsBFtRD7wJ
 meoh9Bcjjb6MInaHB1GmIobw6f1FaS0=
X-Google-Smtp-Source: ABdhPJy/A9S+6XAQnl867YvSioqpLqPcdtX3eP/BSmSv2N+8S95IBQul17PEuGc9mtt8Zzhzw4It7w==
X-Received: by 2002:adf:c506:: with SMTP id q6mr17460346wrf.78.1631000410170; 
 Tue, 07 Sep 2021 00:40:10 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s15sm9945324wrb.22.2021.09.07.00.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:40:09 -0700 (PDT)
Subject: Re: [PATCH] aspeed/i2c: QOMify AspeedI2CBus
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907073059.1155224-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8f13efb2-2b60-929e-3ed6-a3edcee1ab3d@amsat.org>
Date: Tue, 7 Sep 2021 09:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907073059.1155224-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 9:30 AM, Cédric Le Goater wrote:
> The AST2600 SoC realize routine needs to be adapted when connecting
> the I2C bus IRQs because the bus IRQs have moved to the AspeedI2CBus
> SysBus device, one level below the Aspeed I2C controller SysBus
> device.

When did they move?

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/i2c/aspeed_i2c.h |   8 ++-
>  hw/arm/aspeed_ast2600.c     |   7 +--
>  hw/i2c/aspeed_i2c.c         | 103 +++++++++++++++++++++++++++++-------
>  3 files changed, 93 insertions(+), 25 deletions(-)

> +static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
> +    char name[32];
> +    AspeedI2CClass *aic;
> +
> +    if (!s->controller) {
> +        error_setg(errp, TYPE_ASPEED_I2C_BUS ": 'controller' link not set");
> +        return;
> +    }
> +
> +    aic = ASPEED_I2C_GET_CLASS(s->controller);
> +
> +    snprintf(name, sizeof(name), TYPE_ASPEED_I2C_BUS ".%d", s->id);

Even if this particular case is safe, it is better to use:

  g_autofree char *name = g_strdup_printf(TYPE_ASPEED_I2C_BUS ".%d",
                                          s->id);

So future developer copying your device code will be safe if they
modify the format :)

> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> +
> +    s->bus = i2c_init_bus(dev, name);
> +
> +    memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
> +                          s, name, aic->reg_size);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
> +}

