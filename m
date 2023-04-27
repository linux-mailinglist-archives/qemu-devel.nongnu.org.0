Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DBB6F05D3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:32:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0ma-0007sA-7R; Thu, 27 Apr 2023 08:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ps0mS-0007pm-Ty; Thu, 27 Apr 2023 08:31:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ps0mQ-0007oM-7J; Thu, 27 Apr 2023 08:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EIJmO+5XYurPQ0ORc6ac0RKUbSDpMmFMHPSmdsXHTvg=; b=1RLrYFDcOTJvXd7ZjXdidswVBh
 RkEAB1j+c0qOYUBpVGV82kUQvDFitblWeSnZrp9QaIHJBea9nHurWCXwyzjHdTW2l6OkkURy0BIbo
 Fz5kS9kDJ50gwxicleSO2I3b4YZUsc6oXaxtvQcrPf35rWcXg1qL6+oFCCvQO4LY7ympc5s7xGvkP
 SNh6medyBrdziyOLfwfX+Pqj5rQXEBXQrnlO/618HGGE/cB2JT/8vhwOUAzmFm21aMfdYiRzbZwAB
 i81LH3xYoCbZ6f/Z8E+41UTOhftb7hdwQmaIL8bBjilDbh/HE8AMi2BN+1PKaA9JnOAIvl9cHWzyo
 a7B9nhBLEKAjfmn+ZjLsjHIEbCNqdR5yNFHpHRRYTRWHgBuEck2idOSGeCVVf/GvXrA0ng0i02j9u
 u72MWplzledJ4LrBTxPQqj4pd1cFmss3RsUmMFpgvfzu81Vca0ZyNGzHtO2O6e8blKHGN/AT0Dmtv
 QqgQ1wxE1bJ5FMVit0rfPY7sFzg+ihcLiuaClHoXPnJYzls9bZ59GhmvMRBiCiB9+IgmC9LNoCUYB
 jhXMhyKznWqynR50vHhUMHKXYYBKx1VFn+5O+VhlIbCV1o8rQt9YgB+BiwY7hmkdfXBRnurMR/hNQ
 6qvKIjnWhTOo/Drx4dwTNW8f9w3vZx7maTc/KvB9k=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ps0lO-0003O6-UX; Thu, 27 Apr 2023 13:30:23 +0100
Message-ID: <e19d0811-2eac-aad5-2c91-de72d8bae7d6@ilande.co.uk>
Date: Thu, 27 Apr 2023 13:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-10-shentey@gmail.com>
 <32b3425c-737f-4889-9c87-67cd852032f6@ilande.co.uk>
 <8C48868C-4791-4B96-9C56-D4B4A63492F2@gmail.com>
Content-Language: en-US
In-Reply-To: <8C48868C-4791-4B96-9C56-D4B4A63492F2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 09/13] hw/ide/piix: Disuse isa_get_irq()
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

On 26/04/2023 19:25, Bernhard Beschow wrote:

> Am 26. April 2023 11:33:40 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>
>>> isa_get_irq() asks for an ISADevice which piix-ide doesn't provide.
>>> Passing a NULL pointer works but causes the isabus global to be used
>>> then. By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
>>> achieve the same as using isa_get_irq().
>>>
>>> This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
>>> crash when plugging a piix3-ide device into the x-remote machine' which
>>> allows for cleaning up the ISA API while keeping PIIX IDE functions
>>> user-createable.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>    hw/ide/piix.c | 23 ++++++++++++++++++++---
>>>    1 file changed, 20 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>> index 6942b484f9..a3a15dc7db 100644
>>> --- a/hw/ide/piix.c
>>> +++ b/hw/ide/piix.c
>>> @@ -104,7 +104,8 @@ static void piix_ide_reset(DeviceState *dev)
>>>        pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>    }
>>>    -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>>> +static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
>>> +                              Error **errp)
>>>    {
>>>        static const struct {
>>>            int iobase;
>>> @@ -124,7 +125,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>>>                             object_get_typename(OBJECT(d)), i);
>>>            return false;
>>>        }
>>> -    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
>>> +    ide_bus_init_output_irq(&d->bus[i],
>>> +                            isa_bus_get_irq(isa_bus, port_info[i].isairq));
>>
>> I don't think is the right solution here, since ultimately we want to move the IRQ routing out of the device itself and into the PCI-ISA bridge. I'd go for the same solution as you've done for VIA IDE in patch 2, i.e. update the PIIX interrupt handler to set the legacy_irqs in PCIIDEState, and then wire them up to the ISA IRQs 14 and 15 similar to as Phil as done in his patches:
> 
> The problem is user-creatable PIIX-IDE. IMO we should stick to our deprecation process before going this step because this will break it.

Thomas posted some links from previous discussions where it seems that this hack is 
still in use:

https://lists.nongnu.org/archive/html/qemu-block/2019-07/msg00780.html
https://lists.gnu.org/archive/html/qemu-block/2021-04/msg00746.html

So it seems we can't even deprecate this, as it's working around missing 
functionality in q35 :(

Certainly it seems that we should add a check that will fail the machine if there is 
more than one -device piix3-ide on the command line, since I can't see that could 
ever work properly.

I'm leaning towards adding a device property that must be set to enabled in order for 
PIIX IDE realize() to succeed, leave it disabled by default and only enable it for 
the q35 machine. Does that seem like a reasonable solution?

>> https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-4-philmd@linaro.org/
>>
>> https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-5-philmd@linaro.org/
>>
>> This also reminds me, given that the first patch above is doing wiring in pc_init1() then we are still missing part of your tidy-up series :/
>>
>>>        bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>        ide_bus_register_restart_cb(&d->bus[i]);
>>> @@ -136,14 +138,29 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>>>    {
>>>        PCIIDEState *d = PCI_IDE(dev);
>>>        uint8_t *pci_conf = dev->config;
>>> +    ISABus *isa_bus;
>>> +    bool ambiguous;
>>>          pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>>>          bmdma_init_ops(d, &piix_bmdma_ops);
>>>        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
>>>    +    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
>>> +    if (ambiguous) {
>>> +        error_setg(errp,
>>> +                   "More than one ISA bus found while %s supports only one",
>>> +                   object_get_typename(OBJECT(d)));
>>> +        return;
>>> +    }
>>> +    if (!isa_bus) {
>>> +        error_setg(errp, "No ISA bus found while %s requires one",
>>> +                   object_get_typename(OBJECT(d)));
>>> +        return;
>>> +    }
>>
>> Again I think this should go away with using PCIIDEState's legacy_irqs, since you simply let the board wire them up to the ISABus (or not) as required.
> 
> Same here: This breaks user-creatable PIIX-IDE.
> 
>>
>>>        for (unsigned i = 0; i < 2; i++) {
>>> -        if (!pci_piix_init_bus(d, i, errp)) {
>>> +        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>>                return;
>>>            }
>>>        }


ATB,

Mark.

