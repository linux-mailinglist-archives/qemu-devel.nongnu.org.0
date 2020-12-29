Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307242E7067
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 13:03:20 +0100 (CET)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuDig-0001lX-QY
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 07:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuDhW-0001H5-ND
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 07:02:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:16936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuDhS-0005Uh-TN
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 07:02:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4295F746552;
 Tue, 29 Dec 2020 13:01:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E872174646C; Tue, 29 Dec 2020 13:01:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E66A674645B;
 Tue, 29 Dec 2020 13:01:58 +0100 (CET)
Date: Tue, 29 Dec 2020 13:01:58 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
In-Reply-To: <466edf59-2024-7eb1-3bce-924353add977@ilande.co.uk>
Message-ID: <bc626ee4-f748-f1f-9a60-2477c35f752@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
 <466edf59-2024-7eb1-3bce-924353add977@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1298361242-1609243318=:96981"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1298361242-1609243318=:96981
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 29 Dec 2020, Mark Cave-Ayland wrote:
> On 28/12/2020 20:50, BALATON Zoltan via wrote:
>>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>>> index be09912b33..7d54d7e829 100644
>>>> --- a/hw/ide/via.c
>>>> +++ b/hw/ide/via.c
>>>> @@ -26,6 +26,7 @@
>>>>     #include "qemu/osdep.h"
>>>>   #include "hw/pci/pci.h"
>>>> +#include "hw/qdev-properties.h"
>>>>   #include "migration/vmstate.h"
>>>>   #include "qemu/module.h"
>>>>   #include "sysemu/dma.h"
>>>> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error 
>>>> **errp)
>>>>                             &d->bus[1], "via-ide1-cmd", 4);
>>>>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, 
>>>> &d->cmd_bar[1]);
>>>>   -    bmdma_setup_bar(d);
>>>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>>> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
>>>> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO 
>>>> mode */
>>>> +        bmdma_setup_bar(d);
>>>> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, 
>>>> &d->bmdma_bar);
>>>> +    }
>>> 
>>> Since the default value of the legacy mode parameter is false, then this 
>>> means the device assumes native mode by default. Therefore PCI_CLASS_PROG 
>>> should be set to 0x8f unless legacy mode is being used, in which case it 
>>> should be 0x8a.
>> 
>> I think this casued problems before because if it's not set to 0x8a 
>> (legacy) at start then guests may assume it's already switched to native 
>> mode by firmware and won't program the BARs and it will not work. This way, 
>> even if it looks odd all guests I've tested work so I don't want to touch 
>> this, because I don't want to test all guests again.
>> 
>> Keep in mind we're not fully emulating this device so not every combination 
>> that may work on real hardware work in this model. We really either only 
>> emulate "half-native" mode (i.e. native mode with ISA IRQs) that's needed 
>> for pegasos2 guests or now again only emulate legacy mode if property is 
>> set for Linux on fuloong2e. (My original patch emulated half-native and 
>> native mode instead of legacy thinking that Linux on fuloong2e would 
>> adapt.) All other combinations, including switching between these two is 
>> expected to not work which is due to QEMU limitations as you've also 
>> discovered now. I think this is still an improvement over only emulating 
>> legacy mode before even if it does not yet fully model the chip and I've 
>> also cleaned up PCI IDE emulation during implementing this so that code can 
>> be shared between via-ide, sii3112 and CMD646 without much duplication.
>> 
>>>>       qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>>>>       for (i = 0; i < 2; i++) {
>>>>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>>>> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
>>>> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
>>>> +                            i ? 0x376 : 0x3f6);
>>>> +        }
>>> 
>>> You could actually remove the if() here: PCI configuration always leaves a 
>>> gap at the lower end of IO address space to avoid clashes with legacy 
>>> ports. Therefore if a guest decides to switch to native mode and configure 
>>> the BAR, it will never clash with the default legacy IDE ports. This has 
>>> the advantage of minimising the parts protected by PCI_IDE_LEGACY_MODE 
>>> whilst also providing the legacy ports if someone can devise a method to 
>>> dynamically switch between compatible and native modes later.
>> 
>> I think leaving the legacy ports enabled is a bad idea for at least two 
>> reasons: 1) It may clash with other io ports on other machines, e.g. I'm 
>> not sure on PPC where firmware or OS does not expect to see legacy ISA 
>> ports won't map some io BAR of a PCI card there. 2) If this is left enabled 
>> there would be two ports poking the same registers so if that does not 
>> cause a problem by itself, writing to one accidentally (like when something 
>> is mapped over it) could cause corruption of IDE state so I think it's much 
>> better to protect this than later trying to debug such problems. (You can't 
>> get rid of the flag without implementing mode switching that needs rewrite 
>> of ISA and PCI emulation in QEMU so just get over it.)
>
> Okay I'm getting confused now: I thought the original aim of this patchset 
> was to allow a guest OS to switch VIA IDE to compatible mode by default? Then

No, switching is still not supported and as you also discovered it's not 
easy to implement in QEMU so aim is to have property to set if we want to 
emulate legacy mode only or (half) native mode only.

> again whichever way you look at this, regardless of whether PCI_CLASS_PROG is 
> set to 0x8a or 0x8f then QEMU's VIA IDE device is still advertising 
> unsupported configurations to the guest OS.

Yes, we're not fully emulating this device (see above) but advertise 
configurations that work WITH THE GUESTS! Pegasos2 guests will read 
PCI_CLASS_PROG and then switch to native mode (but still expecting 
interrupts on IRQ 14/15) so nothing will actually try to use legacy mode 
there but if it's not in that mode at the start it may not correctly 
program native mode. This may confuse other guests but I don't care as 
long as those we do care about work. Once I finish with all other 
outstanding issues I may come back and polish this model further but for 
now it looks unnecessary push back and this would be enough to continue.

> 0x8a means "I am currently in compatible mode but I can switch to native 
> mode" so if this is the default then by definition the legacy IDE ioports 
> *MUST* be accessible by the guest. Otherwise a guest OS will read 
> PCI_CLASS_PROG and determine that the VIA IDE is in legacy mode, try to read 
> the legacy IDE ioport and break which is what is happening now.

In theory. In practice guests don't really care about this flag or ports 
but have all kinds of assumptions and expectations how this is set up at 
the start or how it works on diffent boards. At least AmigaOS or MorphOS I 
think did not look at any of these just poked some regs and expected this 
to get to the state that's on real hardware. Which now works with these 
patches and also keeps fuloong2e work. What else do you want here?

> 0x8f means "I am currently in native mode" but this is also a lie to the 
> guest since whilst the BARs exist and can now be programmed thanks to your 
> earlier patches, there is no PCI IRQ routing (i.e. no call to pci_set_irq()).

Still this is what native mode means on pegasos2. It may be different on 
different boards this chip appears on but we don't emulate any of those in 
QEMU so it would be enough to address that when such a board is ever 
added. (I doubt that will happen so likely no need for more complete model 
at least for now.)

> Fortunately with PCI_CLASS_PROG at 0x8a Linux will keep the VIA IDE in 
> compatible mode and not attempt to switch to native mode: therefore if you 
> keep this as-is and add the legacy IDE ioports back, that just leaves the 
> problem with BAR4 (BMDMA). In effect your patch isn't setting compatible mode 
> anymore, it is just disabling BMDMA.

It's actually Guenter's patch so you're now bashing him not me...

> Given that this is working around functionality currently missing in QEMU 
> then you should rename the property "x-disable-bdma" to indicate it is 
> experimental and add a comment explaining that this is a workaround for QEMU 
> not being able to reset the BAR4 value to zero after reset. Hopefully one day 
> the PCI bus will implement the Resettable interface at which point it should 
> be possible to remove this hack.

Yes it's a hack and I did not claim it fully implements the device and I 
don't plan to do that because it would need more extensive clean ups in 
other parts of QEMU I'm not ready to take up. My goal is to get guests 
work with pegasos2 and maybe improve fuloong2e along the way (or at least 
not break it) but that's it. I did try to impmlement both modes first but 
gave up when saw it's not really possible with current ISA and PCI IDE 
code so the result is this compromise that's still achieves what I need.

Unless Philippe also thinks these changes are needed I don't really want 
to make any more changes to this. I think the commit message and these 
messages in list archives already describe this more than enough. But as 
I've said if you or someone else provides an alternative or make this 
change I'm OK with it as long as it still works with pegasos2. (I think 
Guenter's stance was the same with Linux and fuloong2e.)

(But I also think your time could be better spent than getting rid of this 
hack when there are much more hacks or missing functionalities to get rid 
of in the part you maintain.)

Regards,
BALATON Zoltan
--3866299591-1298361242-1609243318=:96981--

