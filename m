Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F86EF2EE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:57:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcpj-0001UM-Jf; Wed, 26 Apr 2023 06:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcpf-0001Nn-Ju; Wed, 26 Apr 2023 06:57:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcpd-0006fb-SA; Wed, 26 Apr 2023 06:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLz3etrqKlv/nrgGCD0DJxmaDKvu/FeWqFTr96QQ4iM=; b=jL0KNSmEl2kcO1gNKsVhK+38WA
 TBK9ugLd3UdqGjgBODnVzKMaZNiyfTsGho6tIJ9YoF2M0fOdbe/XyiiIvszi015P8cRCSOiEbyfv8
 dsF+yxvbDCWVb294UZ8Yooi58pyL9FF/qSj9UV84UaT+yCSFXPXrDSlqKDBeX6sgYHhGnYkHbMMkV
 5apQD/PlJw61PxpBCv1oaYigwT/6I3+sfscIViMxPQrVdOAUr635K+1Hs/C948Yw+r09wfN224PXE
 lCTJjlQS/H/KRwxBilyu75Nfj6poI1jxu9bQti4RJTqEkvW1OUMWTucKbA4ZtToiscJmbVs6HtQxp
 NM2zoCurQVwIgtMmr2B3cTElI/3HYokmb3/586a6yKEIc1h9ikVcM74xMeiJl891gCxswR0G4CFMU
 h16N7crkcTiKS5BBEEXVFleBm1Fiui93nrHSQcoMM97eGAPP1HABC5KNtdlqFbdf6V3zsqMRfavqS
 svhOGkeOZ9LBv+uoiVgieMAb8kmCLhZruxmRemeCKtmLw0JUJ5UB6NdoJV3tX7wT4DD9k0MdtFE9Q
 UVeLALQ7nHBSE9Dm8Yyrnm49G9Ny0KLXGlNAzXhsLCli0EQZcjPZBsKYBazd22AJjV0howYdLbRrB
 um76JPzV422GIr2d2l6Ligt0JHfb+lHiyCKtnD/Tg=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcoc-0001mP-TV; Wed, 26 Apr 2023 11:56:08 +0100
Message-ID: <2b338da3-501b-1a88-1890-cda508c3512f@ilande.co.uk>
Date: Wed, 26 Apr 2023 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-5-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 04/13] hw/ide: Extract IDEBus assignment into bmdma_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/04/2023 16:07, Bernhard Beschow wrote:

> Every invocation of bmdma_init() is followed by `d->bmdma[i].bus = &d->bus[i]`.
> Resolve this redundancy by extracting it into bmdma_init().
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/cmd646.c  | 1 -
>   hw/ide/pci.c     | 1 +
>   hw/ide/piix.c    | 1 -
>   hw/ide/sii3112.c | 1 -
>   hw/ide/via.c     | 1 -
>   5 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index a68357c1c5..a094a6e12a 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -297,7 +297,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>           ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
>   
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
> -        d->bmdma[i].bus = &d->bus[i];
>           ide_bus_register_restart_cb(&d->bus[i]);
>       }
>   }
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 942e216b9b..67e0998ff0 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -519,6 +519,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>       bus->dma = &bm->dma;
>       bm->irq = bus->irq;
>       bus->irq = qemu_allocate_irq(bmdma_irq, bm, 0);
> +    bm->bus = bus;
>       bm->pci_dev = d;
>   }
>   
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 41d60921e3..a32f7ccece 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -144,7 +144,6 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>       ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
>   
>       bmdma_init(&d->bus[i], &d->bmdma[i], d);
> -    d->bmdma[i].bus = &d->bus[i];
>       ide_bus_register_restart_cb(&d->bus[i]);
>   
>       return true;
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index f9becdff8e..5dd3d03c29 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -287,7 +287,6 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>           ide_bus_init_output_irq(&s->bus[i], qdev_get_gpio_in(ds, i));
>   
>           bmdma_init(&s->bus[i], &s->bmdma[i], s);
> -        s->bmdma[i].bus = &s->bus[i];
>           ide_bus_register_restart_cb(&s->bus[i]);
>       }
>   }
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 0caae52276..91253fa4ef 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -196,7 +196,6 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>           ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
>   
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
> -        d->bmdma[i].bus = &d->bus[i];
>           ide_bus_register_restart_cb(&d->bus[i]);
>       }
>   }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

