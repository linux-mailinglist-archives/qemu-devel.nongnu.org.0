Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FA6EF2E4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:56:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcoB-0008GX-Ah; Wed, 26 Apr 2023 06:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prco9-0008FY-7k; Wed, 26 Apr 2023 06:55:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prco6-0006Sr-UX; Wed, 26 Apr 2023 06:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gpmJkQDj4VBx4cZV6Q1FdMXBXDk2V62TeiYLEbj9b4w=; b=FUwllx9fOePbBzUhH5tiTf4dzw
 lVJ8S3OoeljRcyzbdzWpugchmSNLWFB5CQNmuQOczNGsTZZkdw2l21rdihR2OpZ7eXGPyiaLfuF3C
 I9aVXwYiza9QaQddI9i7xXC5FO+NZ95RQbBjVEKyoefnlzJjYmkccfLyM7qbJndfNFxJzPLUwJSET
 8fCsQNVAqSLfDfLBaLVS+zgZJK6jHiaBWKSln4ioO3iUUT+MxrEHlLa2zK6fA6nc4Qs463gRaWsau
 GR4xp+P+SDCEjNvksI1NhOLD6u5anC/M/S5BDzxzCSLgrsiMTGieekRVAKOP9vOh1pNMTsbupH4tw
 CaXL5Ve7z909J+OQiyxKHucr7Fy8GUIkm+k6849LXjDa0lKlJEo4CKOx1uq2L51T1MysvqXbB+Ufw
 zfR1BiWUypBvff4H5h+YNHD69Mw7K7wbRZYaoMpZFqPxPamHkuPWELWwllAt3CCymo5XtJIBHGgY/
 MBMrOeD6p64pq8AJNoHWjl0U5l/xsKtmBuCKCZZ7sxny2Qnvxbc6sk67F8S7IAO/kPEUCP+GnJ19i
 a5Voy5nsOmR+kFNM3i4R7AppF6vxWGYp8BGN4ZwVniYnJ7aozPBSMd4ZmvZ2jcaLuBS6AlfwqIRtH
 PEbZDiPFRVq9tlztLElHkTMsF5c+lIOQpfIaGUlqI=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcn3-0001kj-LH; Wed, 26 Apr 2023 11:54:29 +0100
Message-ID: <2be6c4e3-95f2-763f-073f-ee1b7efc324c@ilande.co.uk>
Date: Wed, 26 Apr 2023 11:55:17 +0100
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
 <20230422150728.176512-3-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 02/13] hw/ide/via: Implement ISA IRQ routing
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

> The VIA south bridge allows the legacy IDE interrupts to be routed to four
> different ISA interrupts. This can be configured through the 0x4a register in
> the PCI configuration space of the ISA function. The default routing matches
> the legacy ISA IRQs, that is 14 and 15.
> 
> Implement this missing piece of the VIA south bridge.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/via.c      |  6 ++++--
>   hw/isa/vt82c686.c | 17 +++++++++++++++++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 177baea9a7..0caae52276 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -31,6 +31,7 @@
>   #include "sysemu/dma.h"
>   #include "hw/isa/vt82c686.h"
>   #include "hw/ide/pci.h"
> +#include "hw/irq.h"
>   #include "trace.h"
>   
>   static uint64_t bmdma_read(void *opaque, hwaddr addr,
> @@ -104,7 +105,8 @@ static void bmdma_setup_bar(PCIIDEState *d)
>   
>   static void via_ide_set_irq(void *opaque, int n, int level)
>   {
> -    PCIDevice *d = PCI_DEVICE(opaque);
> +    PCIIDEState *s = opaque;
> +    PCIDevice *d = PCI_DEVICE(s);
>   
>       if (level) {
>           d->config[0x70 + n * 8] |= 0x80;
> @@ -112,7 +114,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>           d->config[0x70 + n * 8] &= ~0x80;
>       }
>   
> -    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
> +    qemu_set_irq(s->isa_irq[n], level);
>   }
>   
>   static void via_ide_reset(DeviceState *dev)
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index ca89119ce0..c7e29bb46a 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -568,9 +568,19 @@ static const VMStateDescription vmstate_via = {
>       }
>   };
>   
> +static void via_isa_set_ide_irq(void *opaque, int n, int level)
> +{
> +    static const uint8_t irqs[] = { 14, 15, 10, 11 };
> +    ViaISAState *s = opaque;
> +    uint8_t irq = irqs[(s->dev.config[0x4a] >> (n * 2)) & 0x3];
> +
> +    qemu_set_irq(s->isa_irqs_in[irq], level);
> +}
> +
>   static void via_isa_init(Object *obj)
>   {
>       ViaISAState *s = VIA_ISA(obj);
> +    DeviceState *dev = DEVICE(s);
>   
>       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>       object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
> @@ -578,6 +588,8 @@ static void via_isa_init(Object *obj)
>       object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
>       object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>       object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> +
> +    qdev_init_gpio_in_named(dev, via_isa_set_ide_irq, "ide", ARRAY_SIZE(s->ide.isa_irq));
>   }
>   
>   static const TypeInfo via_isa_info = {
> @@ -692,6 +704,10 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>           return;
>       }
> +    for (i = 0; i < 2; i++) {
> +        qdev_connect_gpio_out(DEVICE(&s->ide), i,
> +                              qdev_get_gpio_in_named(DEVICE(s), "ide", i));
> +    }
>   
>       /* Functions 2-3: USB Ports */
>       for (i = 0; i < ARRAY_SIZE(s->uhci); i++) {
> @@ -814,6 +830,7 @@ static void vt8231_isa_reset(DeviceState *dev)
>                    PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
>       pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
>   
> +    pci_conf[0x4a] = 0x04; /* IDE interrupt Routing */
>       pci_conf[0x58] = 0x40; /* Miscellaneous Control 0 */
>       pci_conf[0x67] = 0x08; /* Fast IR Config */
>       pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */

I see there is still some further discussion on the exact datasheet being used, 
however the basic mechanism of wiring up the IDE IRQs using 
qdev_connect_gpio_out{_named}() in via_isa_realize():

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

