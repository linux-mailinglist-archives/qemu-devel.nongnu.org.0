Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558CD2E31A9
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:19:48 +0100 (CET)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXpi-0000wA-Ug
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXol-0000Uc-R6
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:18:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXoj-000875-U2
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:18:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 190so7419350wmz.0
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ihEh+66RDrlAeqbFLP+FLA0QLHiw+HTgaJjrSxkb3X8=;
 b=IeCytoYZ6uksMzH/T4RjREYCfs3lvR02kEiGZ+f9JnrvCrawYrg+yFmaKCjtsqWh6E
 Lum5NKoNjeIu8N2Xg44BRnpr72H0X8bqRWnSSzgI4NPYQ2ydr8ogzC2jyuRN3aM0DGbg
 sG50wPSQQGnfoNWby535IyjIZIdCTxBV/aNvoITQJagGBxS6XmKh2m2uz96ijruc61Uu
 l6bz1CYDbMIW1BqPFOvEXagIsmXSlwqBNTKfsl4ulxFjGN/Dq/pvrwUWOw8g3iFP3dJG
 ILr8dK8Q3qIGz2BQS0kBX9+HgNnqEDyHtaMmHmsvjKplubTM7RqiWbskO4EirFBkjcYM
 CWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ihEh+66RDrlAeqbFLP+FLA0QLHiw+HTgaJjrSxkb3X8=;
 b=Rj4/8kLZE/eh2QIPPZnT15M+A9Y/ALhQIm+j87+C0JEbrHzDII5YitcNj/IXI8Ui3s
 57sT79rmsagf4rLmTR0ZWhZbG4MECdYtcAvguayrNSNXBILJRIXCvdWXb/t/zJEQAToJ
 RsnjFotxrZsYhLOEQbkX/I3LZ+fa9ZyfavgJ3JlW/0Oh7W3INrMkY1WDrbh5lhZN/fzy
 W+rc9lVII5LC56sZWjbxpOW84B9e0TNFugdTNc/mfV5R9CE9clD6/B31LgIIdcxJSjmi
 pw7Arwc3xvPwnFnssduJOXlMPM5b4vCISVO/IHR+bmrDfqYbSWBhm4TZGmOukBileLB3
 MwXw==
X-Gm-Message-State: AOAM5312wPtypr2uINEI598wIctxYzcjPo9rRYEvywajaHnvaC4z5RAE
 xMS+oHFDaSE9kyoOfqJAz+I=
X-Google-Smtp-Source: ABdhPJy0t73lNNDe+YL4ywFCZl5jcRqj1NEpk5CyuOoxXnRdJEEO5imnSohau09IYu5By3pfL0H3VA==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr16660051wmi.128.1609082324402; 
 Sun, 27 Dec 2020 07:18:44 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id w8sm51091568wrl.91.2020.12.27.07.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:18:43 -0800 (PST)
Subject: Re: [PATCH 2/2] via-ide: Fix fuloong2e support
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
References: <cover.1608852217.git.balaton@eik.bme.hu>
 <796292ea92f3f00e696b1eea33ef0c6815002bf0.1608852217.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <00c994c9-99d8-5b34-3976-4e6617b794a2@amsat.org>
Date: Sun, 27 Dec 2020 16:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <796292ea92f3f00e696b1eea33ef0c6815002bf0.1608852217.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/20 12:23 AM, BALATON Zoltan wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Fuloong2e needs to use legacy mode for IDE support to work with Linux.
> Add property to via-ide driver to make the mode configurable, and set
> legacy mode for Fuloong2e.
> 

Fixes: 4ea98d317eb ("ide/via: Implement and use native PCI IDE mode")?

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [balaton: Use bit in flags for property, add comment for missing BAR4]
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ide/via.c        | 19 +++++++++++++++++--
>  hw/mips/fuloong2e.c |  4 +++-
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b33..7d54d7e829 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -26,6 +26,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "sysemu/dma.h"
> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>                            &d->bus[1], "via-ide1-cmd", 4);
>      pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>  
> -    bmdma_setup_bar(d);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO mode */
> +        bmdma_setup_bar(d);
> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    }
>  
>      qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>      for (i = 0; i < 2; i++) {
>          ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
> +                            i ? 0x376 : 0x3f6);
> +        }
>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>  
>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
> @@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>      }
>  }
>  
> +static Property via_ide_properties[] = {
> +    DEFINE_PROP_BIT("legacy_mode", PCIIDEState, flags, PCI_IDE_LEGACY_MODE,
> +                    false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void via_ide_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
>      k->device_id = PCI_DEVICE_ID_VIA_IDE;
>      k->revision = 0x06;
>      k->class_id = PCI_CLASS_STORAGE_IDE;
> +    device_class_set_props(dc, via_ide_properties);
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 45c596f4fe..f0733e87b7 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>      /* Super I/O */
>      isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>  
> -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> +    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
> +    qdev_prop_set_bit(&dev->qdev, "legacy_mode", true);
> +    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>      pci_ide_create_devs(dev);
>  
>      pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


