Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199F40C3BB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:42:28 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSN1-0004zR-Ax
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQSKO-0003DD-TB
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:39:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQSKK-0001IH-I4
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:39:44 -0400
Received: by mail-wr1-x430.google.com with SMTP id i23so3129240wrb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=po9NjBGlG437bJXCfFN/SAITvwfVJRnMggxoW64rpLY=;
 b=WTARl6uzgXKzx2ug1QL/PFSothX+QvgiHyHdiqlPJc+Lv7sMxrnajrEb8IbQAa4Q93
 MpwYlsGk9bAQvmPYEzWBa2+YmMYGyS0+ZWCn4ZXwFtVVYe/58nh/REj6vYjQEGN7ua2H
 nHefSmoSonZdc1t+nTvtYOppjc1PljPEZ+E7hg23eJ00ivK20WC0tH6DNJbeNFP8p/vx
 9xgS+YAC8TDNFqIFoCNS5Fb11RDLeKd3LQfQmrkc7R3Ueisl0SYGRyWufOLftmN9o5AD
 ADH+bzjb4SpOqBhiDrIKNiPUfhb0JDiC2WtQA5lJIY0/I3WAtEUsuG+RFfSPY5OX8p+s
 JIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=po9NjBGlG437bJXCfFN/SAITvwfVJRnMggxoW64rpLY=;
 b=HzjBvbZ1MUfMfxtis62PnwK7xpn/oj7h5Jc8z+301vNjlo+QGxXM6Xgy9nvKlRJc/l
 /RBg3CKKJAO3SB7KTz88S1C7nEn/3H+i5qCQP1Jo6z7E3shy7Lom90chX2475rOXY790
 f+qYLFoP8GYqx2JDz5Cu9ocjRcnq6OcCjxGkwHSaNjfO4MB15kznkztaiDpIYFRxWinf
 lKynZ5CRthS7QQcR/NX1ysVdcIZIrchTTj7zSmgTA7pnvOMPctaftJDqgu579eLXQn0z
 m8ATA1sTxNoGQguUsrTHv1vY5I1s5K2WHIfk4EPm6PcLXPxdstRF7Paq/GKWM/sPJtSs
 4Y+A==
X-Gm-Message-State: AOAM533e2LC+QIrVWICin0NzaW354ita0lg4RUZIQcldRSWvs7Fo7ftG
 GzvhTQwPUUwHW8ZOsuuLx5A=
X-Google-Smtp-Source: ABdhPJxaAfP1ub2HY5Nh0tRtt3tArOjrfjtaJe6HU7np82OL+2j1lLuSRY2/2alf2jtGsae37garHQ==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr4209352wrq.136.1631702378555; 
 Wed, 15 Sep 2021 03:39:38 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id f18sm7908514wrw.63.2021.09.15.03.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 03:39:37 -0700 (PDT)
Subject: Re: [PATCH v2 04/20] nubus: use bitmap to manage available slots
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
 <20210915101026.25174-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad44daa7-01c4-bb23-bf7e-1efb337169bc@amsat.org>
Date: Wed, 15 Sep 2021 12:39:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915101026.25174-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

On 9/15/21 12:10 PM, Mark Cave-Ayland wrote:
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line.
> 
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/mac-nubus-bridge.c |  3 +++
>  hw/nubus/nubus-bus.c        |  2 +-
>  hw/nubus/nubus-device.c     | 33 +++++++++++++++++++++++++++------
>  include/hw/nubus/nubus.h    |  4 ++--
>  4 files changed, 33 insertions(+), 9 deletions(-)

>  static void nubus_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index c1832f73da..f9f614cc01 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -160,14 +160,35 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      NubusDevice *nd = NUBUS_DEVICE(dev);
>      char *name;
>      hwaddr slot_offset;
> -
> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
> -            nubus->current_slot > NUBUS_LAST_SLOT) {
> -        error_setg(errp, "Cannot register nubus card, not enough slots");
> -        return;
> +    uint16_t s;
> +
> +    if (nd->slot == -1) {
> +        /* No slot specified, find first available free slot */
> +        s = ctz32(nubus->slot_available_mask);
> +        if (s != 32) {
> +            nd->slot = s;

Can't we have s >= NUBUS_LAST_SLOT here?

> +        } else {
> +            error_setg(errp, "Cannot register nubus card, no free slot "
> +                             "available");
> +            return;
> +        }
> +    } else {

If so, maybe better to move this code <...

> +        /* Slot specified, make sure the slot is available */
> +        if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
> +            error_setg(errp, "Cannot register nubus card, slot must be "
> +                             "between %d and %d", NUBUS_FIRST_SLOT,
> +                             NUBUS_LAST_SLOT);
> +            return;
> +        }

...> ...

> +
> +        if (!(nubus->slot_available_mask & (1UL << nd->slot))) {
> +            error_setg(errp, "Cannot register nubus card, slot %d is "
> +                             "unavailable or already occupied", nd->slot);
> +            return;
> +        }
>      }

... here?

>  
> -    nd->slot = nubus->current_slot++;
> +    nubus->slot_available_mask &= ~(1UL << nd->slot);
>  
>      /* Super */
>      slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 357f621d15..8ff4736259 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -19,7 +19,7 @@
>  #define NUBUS_SLOT_SIZE       0x01000000
>  #define NUBUS_SLOT_NB         0xF
>  
> -#define NUBUS_FIRST_SLOT      0x9
> +#define NUBUS_FIRST_SLOT      0x0
>  #define NUBUS_LAST_SLOT       0xF
>  
>  #define TYPE_NUBUS_DEVICE "nubus-device"
> @@ -36,7 +36,7 @@ struct NubusBus {
>      MemoryRegion super_slot_io;
>      MemoryRegion slot_io;
>  
> -    int current_slot;
> +    uint32_t slot_available_mask;
>  };
>  
>  struct NubusDevice {
> 


