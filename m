Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1046EF538
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:12:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prevU-0007fH-Hz; Wed, 26 Apr 2023 09:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prevS-0007eB-K3; Wed, 26 Apr 2023 09:11:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prevQ-0000gE-Pk; Wed, 26 Apr 2023 09:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0uKVOFiC2nI4OGyAZyIanR6r5An0PhFH4mMxCU8fUSU=; b=d7DVIdHcE0/cCilmIdqdyODvhT
 X434IUq8VTnlpUapfMVt3/uZW0PRA+NQW+TcAyng+LNrTfpp+O7N6xk4hG1zMmiN17gyhcSVBB2r8
 GDW7hP0QdxtC2ZU/5yaI6nnGqUjKd7Q5nLcjMsAbVr/XNq/ssjCnONVUcSxdC9pB84OfR/Ri8lsDr
 9DyI/UQc0Bf4Z86QxpE42C4LMCa7uxiCdxfC+0V46L+709ooIeQegVYakELC+TM2Ks5nRhNyHgnaf
 80DynI6l3aCK+ikHr1DvmuUYWroca2yv3PNC0QpsyMelsNWPM3qKSp3JKsrE9Bay+sQNHIS7maBh9
 AyrIycxYtZTS20yagvPbyqnq73MTaK7uN2MTVGmsC/Ptoo1OkPO7a3q01HtyaqkGIp47tfbS323MO
 8omMh0oomgpYwR8x/uaeHtxWJ1a9k8vzO23JXS707mbzp0AR8AM1zdCKUqqevu/8y0nZnxFqT1tqQ
 LRUBt/Ro5GoB3VXrApxMalXcND9saxQ3ajwk7a09/9TNUA82IfZdsbARUxeq+TKMjfR1wjrAK66MY
 4OdcE1Io6lkN+qwndIA4zbKFTWiSB9aXSadclLIlqBYINu7ZlZPklPPScWGiiiAC99QSQNM9Xp76p
 c06i2j6FlCsL18+vOjKwL5agF9i3KD4ktD0CCoaVw=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preuK-0002Zi-Ab; Wed, 26 Apr 2023 14:10:08 +0100
Message-ID: <d9b87f7c-15be-0ba6-7d5d-7260a919517c@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-7-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 06/18] hw/ide/piix: Ensure IDE output IRQs are wired at
 realization
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> Ensure both IDE output IRQ lines are wired.
> 
> We can remove the last use of isa_get_irq(NULL).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/piix.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index cb527553e2..91424e5249 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -134,14 +134,17 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>       static const struct {
>           int iobase;
>           int iobase2;
> -        int isairq;
>       } port_info[] = {
> -        {0x1f0, 0x3f6, 14},
> -        {0x170, 0x376, 15},
> +        {0x1f0, 0x3f6},
> +        {0x170, 0x376},
>       };
>       int ret;
>   
> -    qemu_irq irq_out = d->isa_irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
> +    if (!d->isa_irq[i]) {
> +        error_setg(errp, "output IDE IRQ %u not connected", i);
> +        return false;
> +    }
> +
>       ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>       ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
>                                     port_info[i].iobase2);
> @@ -150,7 +153,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>                            object_get_typename(OBJECT(d)), i);
>           return false;
>       }
> -    ide_bus_init_output_irq(&d->bus[i], irq_out);
> +    ide_bus_init_output_irq(&d->bus[i], d->isa_irq[i]);
>   
>       bmdma_init(&d->bus[i], &d->bmdma[i], d);
>       d->bmdma[i].bus = &d->bus[i];

I'm not sure I agree with this, since an unwired IRQ/gpio is normally a no-op rather 
than an error - do we really want to change this just for one case? Plus wiring with 
legacy_irqs you should already have eliminated isa_get_irq() in the device itself.


ATB,

Mark.

