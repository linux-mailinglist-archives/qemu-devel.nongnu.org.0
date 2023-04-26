Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3E6EF32F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:16:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prd8L-0002Wm-75; Wed, 26 Apr 2023 07:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prd8C-0002TQ-7c; Wed, 26 Apr 2023 07:16:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prd8A-0001zZ-0K; Wed, 26 Apr 2023 07:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JAYYYnP/mirMnVc6D0P5pVGNA8HsyznsyYGefuUez8k=; b=yxiVjANXqE+UhdPaXm8y7oaEPt
 H2cVKZyyhGIqDQA9uDn4TWk1Z9uOFC5f51snnwT0xPPRnlgjBRIGjXQdRSkbTtJIKmx4/Ddo72Iyi
 JURE3vj+zfhNb6KEMo5ermDlr9kdbm3lotAcOG7O7TKeVpW5os82iO1WMNuECKKHNGjnVsapqiI1h
 BJHX3GqC1A73luWBio3y0CkzQs3N9naQGSRbI/EhMVFlf5rtK+PhwmpNB1xvn3033ZdvVLCn2ojNY
 ORZkrxhozmx0gBlDbFzv/KQ8qjG0yJB5HHscXLatuFDKWyTlSZ1UuKVqE3gR/vlfsNgbsWGbhju8L
 Q1YrMHTLws5cGO5Kp6OUs3DM9mOFJzIYikT9lwejApnDzHYj5myON5D95HhdY/1zAJiv1XiKDlyDV
 CSghByIr3DUAYkB8U57k0hDoppwBorNSHy73LfaLb8tr9XYxboESUTdIWZHBwBoqEDjOCDQofcdT3
 jRKq4lOmtUwxmQjG6e+bjUNQfiGkYBJv1yt69eGCHRdTuwxJ1UlH8Zk5+DTynmUYpAS9vRDGtRdri
 dPE1vN67k54R+fmPNsJiOHYPlHwN4Fhqq1TJ4/O3gLWt5g11JCcflWF27SwjqQIObftC7MzQlg/fJ
 Fn5vP82LgsThkwwdxDb6pncPcGu+RX/EcEzhViD5Y=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prd79-0001y5-5U; Wed, 26 Apr 2023 12:15:15 +0100
Message-ID: <eb4f9321-98dd-adbb-a3ac-cf834f7c74be@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:16:02 +0100
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
 <20230422150728.176512-8-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 07/13] hw/ide: Extract pci_ide_{cmd, data}_le_ops
 initialization into base class constructor
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

> There is redundant code in cmd646 and via which can be extracted into the base
> class. In case of piix and sii3112 this is currently unneccessary but shouldn't
> interfere since the memory regions aren't mapped by those devices. In few
> commits later this will be changed, i.e. those device models will also make use
> of these memory regions.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/cmd646.c | 11 -----------
>   hw/ide/pci.c    | 10 ++++++++++
>   hw/ide/via.c    | 11 -----------
>   3 files changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index 6fd09fe74e..85716aaf17 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -251,20 +251,9 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>       dev->wmask[MRDMODE] = 0x0;
>       dev->w1cmask[MRDMODE] = MRDMODE_INTR_CH0 | MRDMODE_INTR_CH1;
>   
> -    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
> -                          &d->bus[0], "cmd646-data0", 8);
>       pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
> -
> -    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
> -                          &d->bus[0], "cmd646-cmd0", 4);
>       pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
> -
> -    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
> -                          &d->bus[1], "cmd646-data1", 8);
>       pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
> -
> -    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
> -                          &d->bus[1], "cmd646-cmd1", 4);
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>   
>       bmdma_init_ops(d, &cmd646_bmdma_ops);
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 65ed6f7f72..a9194313bd 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -543,6 +543,16 @@ static void pci_ide_init(Object *obj)
>   {
>       PCIIDEState *d = PCI_IDE(obj);
>   
> +    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
> +                          &d->bus[0], "pci-ide0-data-ops", 8);
> +    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
> +                          &d->bus[0], "pci-ide0-cmd-ops", 4);
> +
> +    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
> +                          &d->bus[1], "pci-ide1-data-ops", 8);
> +    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
> +                          &d->bus[1], "pci-ide1-cmd-ops", 4);
> +
>       qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
>   }
>   
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 40704e2857..704a8024cb 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -154,20 +154,9 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>       dev->wmask[PCI_INTERRUPT_LINE] = 0;
>       dev->wmask[PCI_CLASS_PROG] = 5;
>   
> -    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
> -                          &d->bus[0], "via-ide0-data", 8);
>       pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
> -
> -    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
> -                          &d->bus[0], "via-ide0-cmd", 4);
>       pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
> -
> -    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
> -                          &d->bus[1], "via-ide1-data", 8);
>       pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
> -
> -    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
> -                          &d->bus[1], "via-ide1-cmd", 4);
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>   
>       bmdma_init_ops(d, &via_bmdma_ops);

I'd also be inclined to agree with Phil/Zoltan re: dropping the trailing "-ops" in 
the name, otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

