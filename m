Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9243419333
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:35:57 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUovN-0002At-15
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mUotQ-0001Jp-4T; Mon, 27 Sep 2021 07:33:56 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mUotO-0006k7-8E; Mon, 27 Sep 2021 07:33:55 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so21890893ota.13; 
 Mon, 27 Sep 2021 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=ZABFMlZ+xFhQevEZR1VwCTfiRtVAD3f0utQhT5tE/YE=;
 b=Esvb4tKgeDJFoGyg5LiEBAAw7ba0Cxp+AAsaqCO1MmsBneIeRp81OcHN7v7FsS/GuC
 M3R1PW7JmRDszVB2CeJlHa1fWy8GIAbVtFW6OjnRbdFdG75+ZAguU9hQ3p0TlchXpRPs
 1ZzXw0ufLjxQctDk/Wjv5c5/A9FBaegXOOaBJmIKtWrlIOGFIVLma1VC9uCKs77QevzK
 4QrU6/pI5iwvyNv+rnTBVOsuPPqy2OQMk2SD/4rIVuHC8EpezBIhd/4yqsWsQw+Gm4/O
 t34pW3iRJugP2sx2M9JqRfBW8IWIHvFNWIM8gNvRw47Iczg5DC6g5c9/88VJ+fajVrSA
 2XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ZABFMlZ+xFhQevEZR1VwCTfiRtVAD3f0utQhT5tE/YE=;
 b=QgMqWaGeluZ29962gDPQKcKCav87OisfjRtvT/oZxQknLOxQtpHAl8tK+gRwb0fDjB
 F6LSY5z3gYXPGs42yk+aMb5q6aBSPDYCRFd38VQxa9UZ4idPPlUEzU+QgjQX7NlTc+CY
 hjK0xPDwGn1Ve7a8ptgwoLfYOD1v53qzxzrO6z4JKZNawxYPqC+UUCB1g7gj6Bl1YglU
 FwAzXjka7hx4/dfFxyicVMPKdJ07Ahpn+J+Y754b/reXFJdRL4fxsUGOMrxHRDQFKkJk
 LjC5i6++nPRpkT/Xo/8OKtBZrRpK7CNm9qXVINxP5q6zEGIm0tgbSW+iR1uWsiDAepBL
 kU8A==
X-Gm-Message-State: AOAM531kpHZ5mybshSsdCnzl078KS1+pbvW5AYzBlPXLtIjAOGbB0U48
 qMEVB1DhS/sHdmVmXhDHDQ==
X-Google-Smtp-Source: ABdhPJwLuB2C2W73cgY/JZbqUPrxcFU7jqfnUKI99hUK0geU4gGT7gcm6wCzNRb2aRcaPGpXrz4/Ew==
X-Received: by 2002:a9d:711d:: with SMTP id n29mr16707215otj.304.1632742432222; 
 Mon, 27 Sep 2021 04:33:52 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id e16sm3775244oie.17.2021.09.27.04.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 04:33:51 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:85f0:c000:7345:d130])
 by serve.minyard.net (Postfix) with ESMTPSA id 744BE1800EF;
 Mon, 27 Sep 2021 11:33:50 +0000 (UTC)
Date: Mon, 27 Sep 2021 06:33:49 -0500
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw: Add a 'Sensor devices' qdev category
Message-ID: <20210927113349.GH5381@minyard.net>
References: <20210926221518.1726267-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210926221518.1726267-1-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Titus Rwantare <titusr@google.com>, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Wang <wangzhiqiang.bj@bytedance.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 12:15:18AM +0200, Philippe Mathieu-Daudé wrote:
> Sensors models are listed in the 'Misc devices' category.
> Move them to their own category.
> 
> For the devices in the hw/sensor/ directory, the category
> is obvious.
> 
> hw/arm/z2.c models the AER915 model which is described
> on [*] as:
> 
>   The 14-pin chip marked AER915 just below the expansion
>   port is a 80C51-type microcontroller, similar to Philips
>   P89LPC915. It has an 8-bit A/D which is used to determine
>   which of six buttons are pressed on the resistor-network
>   wired remote.  It communicates with the main cpu via I2C.
> 
> It was introduced in commit 3bf11207c06 ("Add support for
> Zipit Z2 machine") with this comment:
> 
>   248 static uint8_t aer915_recv(I2CSlave *slave)
>   249 {
>   ...
>   253     switch (s->buf[0]) {
>   254     /* Return hardcoded battery voltage,
>   255      * 0xf0 means ~4.1V
>   256      */
>   257     case 0x02:
>   258         retval = 0xf0;
>   259         break;
> 
> For QEMU the AER915 is a very simple sensor model.
> 
> [*] https://www.bealecorner.org/best/measure/z2/index.html
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

This makes sense to me.  I'd like to hear from others on this.

-corey

> ---
>  include/hw/qdev-core.h | 1 +
>  hw/arm/z2.c            | 1 +
>  hw/sensor/adm1272.c    | 1 +
>  hw/sensor/dps310.c     | 1 +
>  hw/sensor/emc141x.c    | 1 +
>  hw/sensor/max34451.c   | 2 ++
>  hw/sensor/tmp105.c     | 1 +
>  hw/sensor/tmp421.c     | 1 +
>  softmmu/qdev-monitor.c | 1 +
>  9 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 34c8a7506a1..f6241212247 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -26,6 +26,7 @@ typedef enum DeviceCategory {
>      DEVICE_CATEGORY_SOUND,
>      DEVICE_CATEGORY_MISC,
>      DEVICE_CATEGORY_CPU,
> +    DEVICE_CATEGORY_SENSOR,
>      DEVICE_CATEGORY_MAX
>  } DeviceCategory;
>  
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 9c1e876207b..62db9741106 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -288,6 +288,7 @@ static void aer915_class_init(ObjectClass *klass, void *data)
>      k->recv = aer915_recv;
>      k->send = aer915_send;
>      dc->vmsd = &vmstate_aer915_state;
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>  }
>  
>  static const TypeInfo aer915_info = {
> diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
> index 7310c769be2..2942ac75f90 100644
> --- a/hw/sensor/adm1272.c
> +++ b/hw/sensor/adm1272.c
> @@ -518,6 +518,7 @@ static void adm1272_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->desc = "Analog Devices ADM1272 Hot Swap controller";
>      dc->vmsd = &vmstate_adm1272;
>      k->write_data = adm1272_write_data;
> diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
> index d60a18ac41b..1e24a499b38 100644
> --- a/hw/sensor/dps310.c
> +++ b/hw/sensor/dps310.c
> @@ -208,6 +208,7 @@ static void dps310_class_init(ObjectClass *klass, void *data)
>      k->send = dps310_tx;
>      dc->reset = dps310_reset;
>      dc->vmsd = &vmstate_dps310;
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>  }
>  
>  static const TypeInfo dps310_info = {
> diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c
> index 7ce8f4e9794..4202d8f185a 100644
> --- a/hw/sensor/emc141x.c
> +++ b/hw/sensor/emc141x.c
> @@ -270,6 +270,7 @@ static void emc141x_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->reset = emc141x_reset;
>      k->event = emc141x_event;
>      k->recv = emc141x_rx;
> diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
> index a91d8bd487c..8300bf4ff43 100644
> --- a/hw/sensor/max34451.c
> +++ b/hw/sensor/max34451.c
> @@ -751,6 +751,8 @@ static void max34451_class_init(ObjectClass *klass, void *data)
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->desc = "Maxim MAX34451 16-Channel V/I monitor";
>      dc->vmsd = &vmstate_max34451;
>      k->write_data = max34451_write_data;
> diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
> index 20564494899..43d79b9eeec 100644
> --- a/hw/sensor/tmp105.c
> +++ b/hw/sensor/tmp105.c
> @@ -305,6 +305,7 @@ static void tmp105_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->realize = tmp105_realize;
>      k->event = tmp105_event;
>      k->recv = tmp105_rx;
> diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
> index a3db57dcb5a..c328978af9c 100644
> --- a/hw/sensor/tmp421.c
> +++ b/hw/sensor/tmp421.c
> @@ -343,6 +343,7 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>      TMP421Class *sc = TMP421_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->realize = tmp421_realize;
>      k->event = tmp421_event;
>      k->recv = tmp421_rx;
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 0705f008466..db56f328228 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -162,6 +162,7 @@ static void qdev_print_devinfos(bool show_no_user)
>          [DEVICE_CATEGORY_SOUND]   = "Sound",
>          [DEVICE_CATEGORY_MISC]    = "Misc",
>          [DEVICE_CATEGORY_CPU]     = "CPU",
> +        [DEVICE_CATEGORY_SENSOR]  = "Sensor",
>          [DEVICE_CATEGORY_MAX]     = "Uncategorized",
>      };
>      GSList *list, *elt;
> -- 
> 2.31.1
> 
> 

