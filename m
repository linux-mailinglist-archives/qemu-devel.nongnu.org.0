Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF9294A89
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 11:29:25 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVAQu-0007ph-GH
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 05:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kVAPd-0007Oa-Lk
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 05:28:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39792
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kVAPc-0004KW-3A
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 05:28:05 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kVAPb-0005kW-UY; Wed, 21 Oct 2020 10:28:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, atar4qemu@gmail.com
References: <20201011081347.2146-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <eee17b95-c1ba-cb6b-f687-2ef6e87c80e0@ilande.co.uk>
Date: Wed, 21 Oct 2020 10:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201011081347.2146-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] sabre: increase number of PCI bus IRQs from 32 to 64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/2020 09:13, Mark Cave-Ayland wrote:

> The rework of the sabre IRQs in commit 6864fa3897 "sun4u: update PCI topology to
> include simba PCI bridges" changed the IRQ routing so that both PCI and legacy
> OBIO IRQs are routed through the sabre PCI host bridge to the CPU.
> 
> Unfortunately this commit failed to increase the number of PCI bus IRQs
> accordingly meaning that access to the legacy IRQs OBIO (irqnum >= 0x20) would
> overflow the PCI bus IRQ array causing strange failures running qemu-system-sparc64
> in NetBSD.
> 
> Reported-by: Harold Gutch <logix@foobar.franken.de>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1838658
> Fixes: 6864fa3897 ("sun4u: update PCI topology to include simba PCI bridges")
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/pci-host/sabre.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
> index 5ac6283623..ffdba1d865 100644
> --- a/hw/pci-host/sabre.c
> +++ b/hw/pci-host/sabre.c
> @@ -396,7 +396,7 @@ static void sabre_realize(DeviceState *dev, Error **errp)
>                                        pci_sabre_set_irq, pci_sabre_map_irq, s,
>                                        &s->pci_mmio,
>                                        &s->pci_ioport,
> -                                     0, 32, TYPE_PCI_BUS);
> +                                     0, 0x40, TYPE_PCI_BUS);
>   
>       pci_create_simple(phb->bus, 0, TYPE_SABRE_PCI_DEVICE);

Applied to my qemu-sparc branch.


ATB,

Mark.

