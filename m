Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0FE5230AF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:30:37 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojc3-0002BJ-VS
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nojWu-0000Hj-Og; Wed, 11 May 2022 06:25:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nojWm-0000b2-CO; Wed, 11 May 2022 06:25:13 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nojVi-0002Aj-Pa; Wed, 11 May 2022 11:24:03 +0100
Message-ID: <8b20e95a-33b3-929e-a94a-1d505ded174e@ilande.co.uk>
Date: Wed, 11 May 2022 11:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220505161805.11116-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/11] hw/rtc/mc146818rtc: Inline isa_connect_gpio_out()
 and remove it
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2022 17:17, Bernhard Beschow wrote:

> Commit 250263033c5343012b2cd6f01210ffb5b908a159 'isa: introduce wrapper
> isa_connect_gpio_out' introduced it in 2016. Since then, its only user
> remained mc146818rtc. Remove this one-off solution.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/isa-bus.c     | 6 ------
>   hw/rtc/mc146818rtc.c | 3 ++-
>   include/hw/isa/isa.h | 1 -
>   3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 0ad1c5fd65..59eb1af9e3 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -85,12 +85,6 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
>       return isabus->irqs[isairq];
>   }
>   
> -void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
> -{
> -    qemu_irq irq = isa_get_irq(isadev, isairq);
> -    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
> -}
> -
>   void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
>   {
>       assert(bus && dma8 && dma16);
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index f235c2ddbe..79c43391cb 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -972,7 +972,8 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
>       if (intercept_irq) {
>           qdev_connect_gpio_out(dev, 0, intercept_irq);
>       } else {
> -        isa_connect_gpio_out(isadev, 0, s->isairq);
> +        qemu_irq irq = isa_get_irq(isadev, s->isairq);
> +        qdev_connect_gpio_out(dev, 0, irq);
>       }
>   
>       object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isadev),
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 034d706ba1..1b758ae1ab 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
>                       MemoryRegion *address_space_io, Error **errp);
>   void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
>   qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
> -void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
>   void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
>   IsaDma *isa_get_dma(ISABus *bus, int nchan);
>   MemoryRegion *isa_address_space(ISADevice *dev);

Hi Bernhard,

I've been tinkering again with trying to improve QEMU's ISA implementation to use 
gpios, and actually I believe as per the comment in isa-bus.c that 
isa_connect_gpio_out() will be the preferred way to wire up ISA devices. So really we 
should be trying to use this function more rather than removing it.

BTW if you are interested in helping to work on ISA bus improvements, I can certainly 
come up with a TODO list of useful tasks :)


ATB,

Mark.

