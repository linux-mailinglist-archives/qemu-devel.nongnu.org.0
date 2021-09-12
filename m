Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7F407F22
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:08:27 +0200 (CEST)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTty-0000FO-Qp
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTaY-0000FA-JV
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:48:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTaV-0000mJ-PW
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:48:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so3948277wme.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NXJ2mkMbkYS0Vwt+J6iI9DfhwOn/KKFaa6rYnFl2Mj0=;
 b=FzmFLMGmr1yZi+v35W9F2NkayIQ/w3/uMgFpN/KpFkwXjgKFi2Flljwv7nG10bvRWx
 ybCvieXFEdFnmvqYzQe6Zssr5xI1+9oeEyoKRJy/u06BC6SO6KLNUwTmXPIAZOuzz2bt
 63roUBlWOn8pyCLeoXN9+tXC9QrYUW/cWx/lWC7QG5KgxoPjQirF7yZLZEjP3VDKxJfK
 ZLJjIJxZQ5Dsn5f/ACoElhtXfkzj5wuPPu71gwAaoAftBKfiUrGTHyAXYuVqRBunA96U
 NPjbvEWi7rb1GO/wd1jeELuGo2KYyEtVXi/DUcP11EJHfZlCm+57abhDjeUM8Ot5nInJ
 6T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NXJ2mkMbkYS0Vwt+J6iI9DfhwOn/KKFaa6rYnFl2Mj0=;
 b=zldMwu/b1of74NgsleFUwVnaJhVSF5GPAplT4f1ptqoEveaFWQ2+WbwCRTuJ/ptvkH
 ixPkgxrfYRicJ3jriHofgn4dm/X5GBCD23V/0XDfVYhMILjUGhFgL7AHV5DfdpK7MDm1
 bdW6/ZJRyC3QblVHJKrjyglIZY2+5yis52IXR+unFd15lABdyU+LM5kig3VYWEhMnenh
 2K7NInY6tTIFDQh4RSDCwNYLtNGWa5qArlB+dreUcYFsoVnejrnbhqTB+OxVhUU1UvKX
 jiUe/Jw2D+40ZkQAx93f8kI5PJ00RMA1TTMBGjfFWmeWwfHrxwKnFcp5EJpbadnhdlzb
 dKug==
X-Gm-Message-State: AOAM533AkdkvOPKY66a5KqpUwpwR8En9R7YN0rjQ5iEca2GZxVtHna03
 iskuJ9HkpQ0v6u3RbpIzpuU=
X-Google-Smtp-Source: ABdhPJyMzLbBYLGwFFB6uBc/pcZaYgFjOd58NfCSIHby6TDZWo7AscGD+5SZxjfIGaohzWAqgFinFA==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr5051454wmi.77.1631468898065; 
 Sun, 12 Sep 2021 10:48:18 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v8sm3376622wrt.12.2021.09.12.10.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 10:48:17 -0700 (PDT)
Subject: Re: [PATCH 04/20] nubus: use bitmap to manage available slots
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <10394c05-6cb4-3851-e9fc-967c400061ba@amsat.org>
Date: Sun, 12 Sep 2021 19:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
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
> 
> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
> index 7c329300b8..6e78f4c0b3 100644
> --- a/hw/nubus/mac-nubus-bridge.c
> +++ b/hw/nubus/mac-nubus-bridge.c
> @@ -18,6 +18,9 @@ static void mac_nubus_bridge_init(Object *obj)
>  
>      s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
>  
> +    /* Macintosh only has slots 0x9 to 0xe available */
> +    s->bus->slot_available_mask = 0x7e00;

So MAKE_64BIT_MASK(9, 6),

>      sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>      sysbus_init_mmio(sbd, &s->bus->slot_io);
>  }
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 5c13452308..f6d3655f51 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -84,7 +84,7 @@ static void nubus_init(Object *obj)
>                            nubus, "nubus-slots",
>                            NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
>  
> -    nubus->current_slot = NUBUS_FIRST_SLOT;
> +    nubus->slot_available_mask = 0xffff;

and MAKE_64BIT_MASK(0, 16)?

>  }

