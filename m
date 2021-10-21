Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DEF435BAE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:28:55 +0200 (CEST)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSVS-000285-Ov
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdSSf-0007sC-Fm; Thu, 21 Oct 2021 03:26:02 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:45744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdSSd-0003nj-CH; Thu, 21 Oct 2021 03:26:01 -0400
Received: by mail-lf1-x12a.google.com with SMTP id x192so2784775lff.12;
 Thu, 21 Oct 2021 00:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=aao0X1U4XkCnJ8Vlzgu4peZ7AEk4N0M5pU+Fam7g71g=;
 b=TtIQWd/7jXkfenk79Np65yRODgh4hySyuh8kqGtK2Q6jjh0axTjxZnuKZFZxcswNtx
 XVYyMHT7DQ/sc1HahYXvcUq2EBkdaGqoc7xPyvKcTzX+s9cIhqBD2q7T6kfpDYmbDYxa
 TWiljjBbUiR2M7mQfPG6fHVFCX+m9uEPWZAL4RPcAc63NCn75wRXNHvyni6+DGUWkyw2
 wNYNV8lDGtlfjEgCV58kARHlCRZILlljAuccRkLaCIl77yEkQ2N7fGqY7Vc3scqiWEBK
 OXhlg2aarykIQYU/mxEbI+2++To2KoCPGykR+0TK3V4T1XPz0hhpp0vxCeFoUhAJsxx+
 f1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=aao0X1U4XkCnJ8Vlzgu4peZ7AEk4N0M5pU+Fam7g71g=;
 b=mWwRUe2sQngeWWFUk4KTkdMp7U16386pQ5Wgs1a+Ubnnrn8cz8uCZxz/38P5Qw7h6R
 7RPEBrfkPbCMDiX6jz/MeyGL450lbliD2fZFkaYVavznGrMeSav3T1onDRtusXNrXJXR
 412NZfNCg2xu8Ns0qKcHpuZV26jqsndaXvxYW5K0WamW7FfeAGKKwovS19wIaWzWyaUe
 fF4b0jz7ixbX+7seuwDJIjIdSeB6+BqZXEiKikCajCu/adSzpa8pA1Su7wft1JYZ1XbV
 NSUuumDihIM3gcY/C8DfJwt7djaDmvOiq2zFguuPB+mlzOzYIZQ3hitpwoF5wkGOG78p
 ByJw==
X-Gm-Message-State: AOAM531wdPjf794daSLsDTyR8z9H1ZtQnB2GbubddFn0WcYBq26rbrFK
 /kqgWK2++rM3M8udGnfUcNE=
X-Google-Smtp-Source: ABdhPJwnLSC9WlCkeYdtwmr8LPsXEyo5XroTe4o1fH9ySCci9KMG798+sa/8sEpNZdPrlUf9T09PzQ==
X-Received: by 2002:a05:6512:3192:: with SMTP id
 i18mr3923124lfe.135.1634801156252; 
 Thu, 21 Oct 2021 00:25:56 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 s12sm382776lfc.256.2021.10.21.00.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:25:55 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:25:54 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 2/5] aspeed: Initialize the watchdog device models
 before the FMC models
Message-ID: <20211021072553.GH23846@fralle-msi>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018132609.160008-3-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2021 Oct 18] Mon 15:26:06, Cédric Le Goater wrote:
> Next changes will map the WDT2 registers in the AST2600 FMC memory
> region. Make sure the MemoryRegion pointers are correctly initialized
> before setting the object links.
> 
> Do the same in the Aspeed AST2400 and AST2500 SoC models for
> consistency.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++------------------
>  hw/arm/aspeed_soc.c     | 36 ++++++++++++++++++------------------
>  2 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 0384357a9510..3a7aa910b157 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -148,6 +148,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
>      snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>      object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>  
> +    for (i = 0; i < sc->wdts_num; i++) {
> +        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
> +        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
> +    }
> +
>      snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
>      object_initialize_child(obj, "adc", &s->adc, typename);
>  
> @@ -175,11 +180,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
>      object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
>                                "max-ram-size");
>  
> -    for (i = 0; i < sc->wdts_num; i++) {
> -        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
> -        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
> -    }
> -
>      for (i = 0; i < sc->macs_num; i++) {
>          object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
>                                  TYPE_FTGMAC100);
> @@ -325,6 +325,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>  
> +    /* Watch dog */
> +    for (i = 0; i < sc->wdts_num; i++) {
> +        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> +
> +        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
> +                                 &error_abort);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +    }
> +
>      /* ADC */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
>          return;
> @@ -395,19 +408,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
>  
> -    /* Watch dog */
> -    for (i = 0; i < sc->wdts_num; i++) {
> -        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> -
> -        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
> -                                 &error_abort);
> -        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> -            return;
> -        }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> -    }
> -
>      /* Net */
>      for (i = 0; i < sc->macs_num; i++) {
>          object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 7d53cf2f5133..2eb30d14cf94 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -162,6 +162,11 @@ static void aspeed_soc_init(Object *obj)
>      snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>      object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>  
> +    for (i = 0; i < sc->wdts_num; i++) {
> +        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
> +        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
> +    }
> +
>      snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
>      object_initialize_child(obj, "adc", &s->adc, typename);
>  
> @@ -189,11 +194,6 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
>                                "max-ram-size");
>  
> -    for (i = 0; i < sc->wdts_num; i++) {
> -        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
> -        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
> -    }
> -
>      for (i = 0; i < sc->macs_num; i++) {
>          object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
>                                  TYPE_FTGMAC100);
> @@ -290,6 +290,19 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>  
> +    /* Watch dog */
> +    for (i = 0; i < sc->wdts_num; i++) {
> +        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> +
> +        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
> +                                 &error_abort);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +    }
> +
>      /* ADC */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
>          return;
> @@ -354,19 +367,6 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
>  
> -    /* Watch dog */
> -    for (i = 0; i < sc->wdts_num; i++) {
> -        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> -
> -        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
> -                                 &error_abort);
> -        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> -            return;
> -        }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> -    }
> -
>      /* Net */
>      for (i = 0; i < sc->macs_num; i++) {
>          object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
> -- 
> 2.31.1
> 
> 

