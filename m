Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF1407E79
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:14:30 +0200 (CEST)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPS7h-00027C-MC
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRu9-0005cn-5P
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:00:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRu7-0005Ff-4e
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:00:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so9934681wra.8
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cncsqUitNd51iTO0S1qIessY0AKPB5D5CFxZCQ8jNag=;
 b=lNamG9T5wXBrNEo9DJNsTKwGk4hdT9uANqkfY74OntTwuGBfzEMu/IWBJ+n8UTFL6y
 BJRe+Mgmlb5uONV7SlflXhAMbrCIFvgU5O/x+BxZb/mfHNqGUW1IHqw9Lfz/waxD0boD
 8gfKKcaDNgY4B7ficdDtaf9RXHSxGcJvQrk2VQ4K9KTOx18e0CSNCgRWtv+VgahseF3W
 lF+3dfi74dIEnHpjL9lWwQvPgxPcD1OXo3CqkQbTbAxN1sKn+Cn2J/5ShuvNZN0zOC9R
 KqHpIFi1OIBIEGfK9KWy42pSLvnjUdhhfY9abYko2NJcEysnkf8tdNmhRsRt2cOBEPvl
 uGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cncsqUitNd51iTO0S1qIessY0AKPB5D5CFxZCQ8jNag=;
 b=5rprVMAjSxZGJNYdclXMlsY2WYUYhg+QwY9zxbieJdore54k4VRSUMD+e5k9QN1FTx
 +eWyMUfhWPNPNUv2T0l1JDaLfVFs0bsmi6dFFX8UPAeVchiSVhrkpzRuVC4ZJPWxTgYb
 XdoK2A6dqhwCNrUS1cb9WU7LIDwuep+HBDk+/lCSmqh71+OWRO36mUlWa11SF1Vi88k8
 hfv1viZjASRfPgbHcT45EU7FBU37bo5ccXtVI4vTJGdIkLZGBuhTPPQlqMwSKDhpDcLw
 vjm70T5OaoaFsp/5/nUjNi53C6p/Hv4+W16RL20hP2wiPYnu9FLF3wfIIFZMmcpPnh0l
 poxQ==
X-Gm-Message-State: AOAM530A9QQqMNVVvoflCAF/989w+mM9kNKWs6+N6b8cgC9z6AbnrvBr
 e9uoXA6r+a4WQyLW7QcgFtA=
X-Google-Smtp-Source: ABdhPJwh+6FuwVa+JUp0I5i96O7tLOECUq2Xt7k9w506eWDShFzXayZusEkWQQ+r0r1zTQ0A72D09w==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr5250071wrq.146.1631462425370; 
 Sun, 12 Sep 2021 09:00:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n1sm4751601wrp.49.2021.09.12.09.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:00:24 -0700 (PDT)
Subject: Re: [PATCH 18/20] nubus: add support for slot IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-19-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1720db0e-5c49-09fa-b749-e7a7f69cbe6c@amsat.org>
Date: Sun, 12 Sep 2021 18:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-19-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> Each Nubus slot has an IRQ line that can be used to request service from the
> CPU. Connect the IRQs to the Nubus bridge so that they can be wired up using qdev
> gpios accordingly, and introduce a new nubus_set_irq() function that can be used
> by Nubus devices to control the slot IRQ.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bridge.c  | 2 ++
>  hw/nubus/nubus-device.c  | 8 ++++++++
>  include/hw/nubus/nubus.h | 6 ++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
> index 2c7c4ee121..0366d925a9 100644
> --- a/hw/nubus/nubus-bridge.c
> +++ b/hw/nubus/nubus-bridge.c
> @@ -19,6 +19,8 @@ static void nubus_bridge_init(Object *obj)
>      NubusBus *bus = &s->bus;
>  
>      qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
> +
> +    qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
>  }

I'm confused, the IRQs belong to the bus, but you create them
on the bridge device (I know, the bus is not a qdev)...

>  static Property nubus_bridge_properties[] = {
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index f316eb7789..67ab281943 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -10,12 +10,20 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/datadir.h"
> +#include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "hw/nubus/nubus.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  
>  
> +void nubus_set_irq(NubusDevice *nd, int level)
> +{
> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
> +
> +    qemu_set_irq(nubus->irqs[nd->slot], level);
> +}
> +
>  static void nubus_device_realize(DeviceState *dev, Error **errp)
>  {
>      NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 503ebf0c1c..2b9c4c77ac 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -24,6 +24,8 @@
>  #define NUBUS_FIRST_SLOT      0x0
>  #define NUBUS_LAST_SLOT       0xf
>  
> +#define NUBUS_IRQS            16
> +
>  #define TYPE_NUBUS_DEVICE "nubus-device"
>  OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
>  
> @@ -43,6 +45,8 @@ struct NubusBus {
>      MemoryRegion slot_io;
>  
>      uint32_t slot_available_mask;
> +
> +    qemu_irq irqs[NUBUS_IRQS];
>  };
>  
>  #define NUBUS_DECL_ROM_MAX_SIZE    0xffff
> @@ -58,6 +62,8 @@ struct NubusDevice {
>      MemoryRegion decl_rom;
>  };
>  
> +void nubus_set_irq(NubusDevice *nd, int level);

... then the API only involves a device and a bus, the
bridge is hidden.

