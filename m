Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CC6EF281
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:45:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcaz-0007nw-PR; Wed, 26 Apr 2023 06:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcam-0007Sq-Qy; Wed, 26 Apr 2023 06:41:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcak-0003xG-Rs; Wed, 26 Apr 2023 06:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qhgb4tqfUP7KCzRIvnFq6PoAy8ivpziqP++JlhpYJMs=; b=TRUObwmNPaOsSZx6W69m/XvuWc
 pLPSRZV0+eloEAmm8enMKFEqh5ZO0lkcp8mW8Xs2gbtp24T0J60EyPW5742URd3wIyTSnr0JW+Dkd
 Y4VPLTqPpoaBXTUPicFLL3IJzS/lCHpkA20klCcnK5vdFuDjHYX0XN3zNJCIyXYwyl/esaVKQNE4a
 Q05mUokAiQzW6UV/YpHMhxLOEr8kj405M5vKY9zoEHUq/+7NSuqoo1UzdJLIMkZdrlaGSC+7bofeR
 h64aUFFdt7K8EJpFQZSVi1QERuux9jkTQWUZHt8+PhMBchM6vxXqu9MPc7X2k9VtQq//QsvcJnIRN
 F9L65UtbK3fpfDc2w3eno3a4WUF857gO+Bo7YO456+au3VNzAzEZ+QJhdI/pZ+MnVbWjdJ1f5IB+d
 788BomKlxOfLvrTnPUo0uj7GQdppCH+IUJ02kqGTMoFIT395B3sXqrnr+2V9QnxxUIwYMtXw4F4/q
 X8bpssLxwwoTE5XLYomUP6wwNf4GBxPyOSnsi2LTRcyp/68V/zPeHt6YOwJYvWJ/QO8ofiIxYh1dX
 8SiNxjn9lD659eTjuwUw1c6pyixpC+Ivz2/7sWrcnbDJqYKuKVJG/KL//Gckw7QcrhHlTweM0Wqvj
 IObS4lutzM/6Wlz9JqDHIgMmuZSU3kbmNMs2B3IWM=;
Received: from [81.151.114.25] (helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcZj-0001de-NH; Wed, 26 Apr 2023 11:40:43 +0100
Message-ID: <1a4c06ca-9300-dbdf-34b1-b499f936249e@ilande.co.uk>
Date: Wed, 26 Apr 2023 11:41:30 +0100
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
 <20230422150728.176512-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/13] hw/ide/pci: Expose legacy interrupts as GPIOs
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

> Exposing the legacy IDE interrupts as GPIOs allows them to be connected in the
> parent device through qdev_connect_gpio_out(), i.e. without accessing private
> data of TYPE_PCI_IDE.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/pci.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index fc9224bbc9..942e216b9b 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -522,10 +522,18 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
>       bm->pci_dev = d;
>   }
>   
> +static void pci_ide_init(Object *obj)
> +{
> +    PCIIDEState *d = PCI_IDE(obj);
> +
> +    qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));

Just one minor nit: can we make this qdev_init_gpio_out_named() and call it "isa-irq" 
to match? This is for 2 reasons: firstly these are PCI devices and so an unnamed 
IRQ/gpio could be considered to belong to PCI, and secondly it gives the gpio the 
same name as the struct field.

 From my previous email I think this should supercede Phil's patch at 
https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-2-philmd@linaro.org/.

> +}
> +
>   static const TypeInfo pci_ide_type_info = {
>       .name = TYPE_PCI_IDE,
>       .parent = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(PCIIDEState),
> +    .instance_init = pci_ide_init,
>       .abstract = true,
>       .interfaces = (InterfaceInfo[]) {
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },

Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

