Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777D2E6FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 12:26:31 +0100 (CET)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuD94-0000UY-8s
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 06:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuD7Z-0008My-09
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:24:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49548
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuD7W-0004cz-QL
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:24:56 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuD7U-0006Kl-TI; Tue, 29 Dec 2020 11:24:53 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <466edf59-2024-7eb1-3bce-924353add977@ilande.co.uk>
Date: Tue, 29 Dec 2020 11:24:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.698,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/12/2020 20:50, BALATON Zoltan via wrote:

>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index be09912b33..7d54d7e829 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -26,6 +26,7 @@
>>>     #include "qemu/osdep.h"
>>>   #include "hw/pci/pci.h"
>>> +#include "hw/qdev-properties.h"
>>>   #include "migration/vmstate.h"
>>>   #include "qemu/module.h"
>>>   #include "sysemu/dma.h"
>>> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>>>                             &d->bus[1], "via-ide1-cmd", 4);
>>>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>>>   -    bmdma_setup_bar(d);
>>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
>>> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO mode */
>>> +        bmdma_setup_bar(d);
>>> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>> +    }
>>
>> Since the default value of the legacy mode parameter is false, then this means the 
>> device assumes native mode by default. Therefore PCI_CLASS_PROG should be set to 
>> 0x8f unless legacy mode is being used, in which case it should be 0x8a.
> 
> I think this casued problems before because if it's not set to 0x8a (legacy) at start 
> then guests may assume it's already switched to native mode by firmware and won't 
> program the BARs and it will not work. This way, even if it looks odd all guests I've 
> tested work so I don't want to touch this, because I don't want to test all guests 
> again.
> 
> Keep in mind we're not fully emulating this device so not every combination that may 
> work on real hardware work in this model. We really either only emulate "half-native" 
> mode (i.e. native mode with ISA IRQs) that's needed for pegasos2 guests or now again 
> only emulate legacy mode if property is set for Linux on fuloong2e. (My original 
> patch emulated half-native and native mode instead of legacy thinking that Linux on 
> fuloong2e would adapt.) All other combinations, including switching between these two 
> is expected to not work which is due to QEMU limitations as you've also discovered 
> now. I think this is still an improvement over only emulating legacy mode before even 
> if it does not yet fully model the chip and I've also cleaned up PCI IDE emulation 
> during implementing this so that code can be shared between via-ide, sii3112 and 
> CMD646 without much duplication.
> 
>>>       qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>>>       for (i = 0; i < 2; i++) {
>>>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>>> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
>>> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
>>> +                            i ? 0x376 : 0x3f6);
>>> +        }
>>
>> You could actually remove the if() here: PCI configuration always leaves a gap at 
>> the lower end of IO address space to avoid clashes with legacy ports. Therefore if 
>> a guest decides to switch to native mode and configure the BAR, it will never clash 
>> with the default legacy IDE ports. This has the advantage of minimising the parts 
>> protected by PCI_IDE_LEGACY_MODE whilst also providing the legacy ports if someone 
>> can devise a method to dynamically switch between compatible and native modes later.
> 
> I think leaving the legacy ports enabled is a bad idea for at least two reasons: 1) 
> It may clash with other io ports on other machines, e.g. I'm not sure on PPC where 
> firmware or OS does not expect to see legacy ISA ports won't map some io BAR of a PCI 
> card there. 2) If this is left enabled there would be two ports poking the same 
> registers so if that does not cause a problem by itself, writing to one accidentally 
> (like when something is mapped over it) could cause corruption of IDE state so I 
> think it's much better to protect this than later trying to debug such problems. (You 
> can't get rid of the flag without implementing mode switching that needs rewrite of 
> ISA and PCI emulation in QEMU so just get over it.)

Okay I'm getting confused now: I thought the original aim of this patchset was to 
allow a guest OS to switch VIA IDE to compatible mode by default? Then again 
whichever way you look at this, regardless of whether PCI_CLASS_PROG is set to 0x8a 
or 0x8f then QEMU's VIA IDE device is still advertising unsupported configurations to 
the guest OS.

0x8a means "I am currently in compatible mode but I can switch to native mode" so if 
this is the default then by definition the legacy IDE ioports *MUST* be accessible by 
the guest. Otherwise a guest OS will read PCI_CLASS_PROG and determine that the VIA 
IDE is in legacy mode, try to read the legacy IDE ioport and break which is what is 
happening now.

0x8f means "I am currently in native mode" but this is also a lie to the guest since 
whilst the BARs exist and can now be programmed thanks to your earlier patches, there 
is no PCI IRQ routing (i.e. no call to pci_set_irq()).

Fortunately with PCI_CLASS_PROG at 0x8a Linux will keep the VIA IDE in compatible 
mode and not attempt to switch to native mode: therefore if you keep this as-is and 
add the legacy IDE ioports back, that just leaves the problem with BAR4 (BMDMA). In 
effect your patch isn't setting compatible mode anymore, it is just disabling BMDMA.

Given that this is working around functionality currently missing in QEMU then you 
should rename the property "x-disable-bdma" to indicate it is experimental and add a 
comment explaining that this is a workaround for QEMU not being able to reset the 
BAR4 value to zero after reset. Hopefully one day the PCI bus will implement the 
Resettable interface at which point it should be possible to remove this hack.


ATB,

Mark.

