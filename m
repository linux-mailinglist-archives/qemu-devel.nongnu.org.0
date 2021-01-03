Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1032E8DC8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 19:35:11 +0100 (CET)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw8De-0006bM-Ae
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 13:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw89v-0004OY-Ni; Sun, 03 Jan 2021 13:31:21 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw89r-00006I-8u; Sun, 03 Jan 2021 13:31:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B01E4747601;
 Sun,  3 Jan 2021 19:31:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 546487470DD; Sun,  3 Jan 2021 19:31:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 51D9F74645F;
 Sun,  3 Jan 2021 19:31:09 +0100 (CET)
Date: Sun, 3 Jan 2021 19:31:09 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 2/5] via-ide: Fix fuloong2e support
In-Reply-To: <3b45dfea-0534-b61f-8fef-a38b1b1a4236@ilande.co.uk>
Message-ID: <c10343b-315f-8861-d67d-94413053b1a7@eik.bme.hu>
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-3-f4bug@amsat.org>
 <3b45dfea-0534-b61f-8fef-a38b1b1a4236@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-553687379-1609698669=:62321"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-553687379-1609698669=:62321
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 3 Jan 2021, Mark Cave-Ayland wrote:
> On 01/01/2021 23:12, Philippe Mathieu-Daudé wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>> 
>> The IDE legacy mode emulation has been removed in commit 4ea98d317eb
>> ("ide/via: Implement and use native PCI IDE mode") but some Linux
>> kernels (probably including def_config) require legacy mode on the
>> Fuloong2e so only emulating native mode did not turn out feasible.
>> Add property to via-ide model to make the mode configurable, and set
>> legacy mode for Fuloong2e.
>> 
>> [balaton: Use bit in flags for property, add comment for missing BAR4]
>> 
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Message-Id: 
>> <17a50e58e6baa26440c7dac83f07fdbba1595439.1609191252.git.balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/ide/via.c        | 19 +++++++++++++++++--
>>   hw/mips/fuloong2e.c |  4 +++-
>>   2 files changed, 20 insertions(+), 3 deletions(-)
>> 
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index be09912b334..2d935b910f8 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -26,6 +26,7 @@
>>     #include "qemu/osdep.h"
>>   #include "hw/pci/pci.h"
>> +#include "hw/qdev-properties.h"
>>   #include "migration/vmstate.h"
>>   #include "qemu/module.h"
>>   #include "sysemu/dma.h"
>> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error 
>> **errp)
>>                             &d->bus[1], "via-ide1-cmd", 4);
>>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>>   -    bmdma_setup_bar(d);
>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
>> +        /* Missing BAR4 will make Linux driver fall back to legacy PIO 
>> mode */
>> +        bmdma_setup_bar(d);
>> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, 
>> &d->bmdma_bar);
>> +    }
>>         qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>>       for (i = 0; i < 2; i++) {
>>           ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>> +        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
>> +            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
>> +                            i ? 0x376 : 0x3f6);
>> +        }
>>           ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>
> The if() here needs to be removed because the VIA IDE device starts up in 
> legacy mode. If you look at the PCI bus master specification [1] the table at 
> the top of page 3 is the breakdown of the PCI_CLASS_PROG byte: the configured 
> value of 0x8a clearly indicates both channels are in legacy mode, which means 
> that the PCI BARs are disabled and the controller is fixed to use the legacy 
> IDE ioports with the option to switch up to native mode.

This if says that these ports are enabled when the legacy-mode flag is 
set, i.e. we only emulate legacy-mode. It is disabled when we only emulate 
half-native mode for pegasos2. If we leave it there unconditionally as you 
suggest then we'll emulate (half-)native mode with the PCI BARs containing 
these regs as well as having legacy ioports enabled at the same time. I 
can't see how that's cleaner or more like what real hardware does.

> This is the main reason that the fuloong2e kernel panics on startup because 
> its reads PCI_CLASS_PROG, discovers the controller is in legacy mode and then 
> tries to access the legacy IDE ioports. Since the ioports are no longer 
> mapped then the kernel crashes.
>
> (Fun fact: you can change PCI_CLASS_PROG to 0x8f and watch Linux configure 
> the VIA IDE controller in native mode: it gets quite far before it decides to 
> eventually panic)
>
> The fix here is simple: always enable the legacy IDE ioports. Zoltan 
> mentioned he was concerned about having multiple IDE ports available, but 
> this is not an issue for 2 reasons:
>
> 1) Before any of Zoltan's patches were applied, the VIA IDE driver set 
> PCI_CLASS_PROG to 0x8a with the legacy IDE ports always enabled, and there 
> were no issues

It did not run with pegasos2 back then, only with fuloong2e Linux and even 
that wasn't tested very much, that's why my patches were needed in the 
first place so of course there were no issues as it did not work at all 
once something tried to use native mode like pegasos2 guests.

> 2) PCI bus enumeration always leaves the low end of IO space free so that 
> there are no clashes with legacy ISA devices which can't be freely relocated 
> in IO space

I don't know if that's a valid assumption to expect to be generally true 
but I've tested pegasos2 with MorphOS after removing the if around 
ide_init_ioport() above as you say and only leaving it around BAR4 and it 
still boots, we end up with this memory map:

memory-region: pci1-io
   0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
     0000000000000000-0000000000000007 (prio 0, i/o): dma-chan
     0000000000000008-000000000000000f (prio 0, i/o): dma-cont
     0000000000000020-0000000000000021 (prio 0, i/o): pic
     0000000000000040-0000000000000043 (prio 0, i/o): pit
     0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
     0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
     0000000000000070-0000000000000071 (prio 0, i/o): rtc
       0000000000000070-0000000000000070 (prio 0, i/o): rtc-index
     0000000000000081-0000000000000083 (prio 0, i/o): dma-page
     0000000000000087-0000000000000087 (prio 0, i/o): dma-page
     0000000000000089-000000000000008b (prio 0, i/o): dma-page
     000000000000008f-000000000000008f (prio 0, i/o): dma-page
     00000000000000a0-00000000000000a1 (prio 0, i/o): pic
     00000000000000b2-00000000000000b3 (prio 0, i/o): apm-io
     00000000000000c0-00000000000000cf (prio 0, i/o): dma-chan
     00000000000000d0-00000000000000df (prio 0, i/o): dma-cont
*   0000000000000170-0000000000000177 (prio 0, i/o): ide
     00000000000001ce-00000000000001d1 (prio 0, i/o): vbe
*   00000000000001f0-00000000000001f7 (prio 0, i/o): ide
     00000000000002f8-00000000000002ff (prio 0, i/o): serial
*   0000000000000376-0000000000000376 (prio 0, i/o): ide
     0000000000000378-000000000000037f (prio 0, i/o): parallel
     00000000000003b4-00000000000003b5 (prio 0, i/o): vga
     00000000000003ba-00000000000003ba (prio 0, i/o): vga
     00000000000003c0-00000000000003cf (prio 0, i/o): vga
     00000000000003d4-00000000000003d5 (prio 0, i/o): vga
     00000000000003da-00000000000003da (prio 0, i/o): vga
     00000000000003f1-00000000000003f5 (prio 0, i/o): fdc
*   00000000000003f6-00000000000003f6 (prio 0, i/o): ide
     00000000000003f7-00000000000003f7 (prio 0, i/o): fdc
     00000000000004d0-00000000000004d0 (prio 0, i/o): elcr
     00000000000004d1-00000000000004d1 (prio 0, i/o): elcr
     0000000000000f00-0000000000000fff (prio 0, i/o): via-pm
       0000000000000f00-0000000000000f03 (prio 0, i/o): acpi-evt
       0000000000000f04-0000000000000f05 (prio 0, i/o): acpi-cnt
       0000000000000f08-0000000000000f0b (prio 0, i/o): acpi-tmr
     0000000000001000-00000000000010ff (prio 1, i/o): alias ati.io @ati.mmregs 0000000000000000-00000000000000ff
     0000000000002000-0000000000002007 (prio 1, i/o): via-ide0-data
     0000000000003004-0000000000003007 (prio 1, i/o): via-ide0-cmd
     0000000000005000-0000000000005007 (prio 1, i/o): via-ide1-data
     0000000000006004-0000000000006007 (prio 1, i/o): via-ide1-cmd
     0000000000008000-000000000000800f (prio 1, i/o): via-bmdma-container
       0000000000008000-0000000000008003 (prio 0, i/o): via-bmdma
       0000000000008004-0000000000008007 (prio 0, i/o): bmdma
       0000000000008008-000000000000800b (prio 0, i/o): via-bmdma
       000000000000800c-000000000000800f (prio 0, i/o): bmdma
     0000000000009000-000000000000901f (prio 1, i/o): uhci
     000000000000a000-000000000000a01f (prio 1, i/o): uhci

memory-region: system
   0000000000000000-ffffffffffffffff (prio 0, i/o): system
     0000000000000000-000000001fffffff (prio 0, ram): pegasos2.ram
     0000000080000000-00000000bfffffff (prio 0, i/o): alias pci1-mem0-win @pci1-mem 0000000080000000-00000000bfffffff
     00000000c0000000-00000000dfffffff (prio 0, i/o): alias pci0-mem0-win @pci0-mem 00000000c0000000-00000000dfffffff
     00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
     00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pci0-io-win @pci0-io 0000000000000000-0000000000ffffff
     00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pci0-mem1-win @pci0-mem 0000000000000000-0000000000ffffff
     00000000fd000000-00000000fdffffff (prio 0, i/o): alias pci1-mem1-win @pci1-mem 0000000000000000-0000000000ffffff
     00000000fe000000-00000000feffffff (prio 0, i/o): alias pci1-io-win @pci1-io 0000000000000000-0000000000ffffff
     00000000ff800000-00000000ffffffff (prio 0, i/o): alias pci1-mem3-win @pci1-mem 00000000ff800000-00000000ffffffff
     00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2.rom

MorphOS uses the via-ide* BARs mapped at 2000-800f and hopefully does not 
want to put anything or accidentally write to the legacy ide ports marked 
with "*" above that I think should not be there (and with the if they are 
not registered in this case) which I think is more like what real hardware 
does because data sheet says in native mode it ignores legacy ports which 
is not what your patch with removed if does.

>>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
>> @@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>>       }
>>   }
>>   +static Property via_ide_properties[] = {
>> +    DEFINE_PROP_BIT("legacy-mode", PCIIDEState, flags, 
>> PCI_IDE_LEGACY_MODE,
>> +                    false),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>
> The other issue with the patch is that the legacy-mode property doesn't have 
> anything to do with legacy mode: once the legacy IDE ioports are always 
> enabled, the only thing this property controls is whether PCI BAR 4 is 
> enabled. It doesn't select legacy mode since this is already the default, and 
> neither does it force it by fixing the relevant bits in PCI_CLASS_PROG.

So then just rename it to break-native-mode or whatever you want, this is 
not a problem with the patch itself, it's only broken after you remove the 
if.

> PCI BAR 4 is for configuring BMDMA and Linux checks to see if BAR 4 is 
> non-zero: if it is, then it tries to use BMDMA which is the feature that 
> actually crashes the fuloong2e Linux kernel. Hence my suggestion to rename

That probably means it's not expecting to use anything but legacy mode on 
fuloong2e but hard to tell without seeing it run on real machine.

> the property to "x-disable-bdma": the x- prefix convention clearly marks this 
> out as an experimental property whilst also correctly describing what is is 
> used for, just in case it leaks into external qdev configuration.

It's ok to change the property name, I think that can be done during 
merging without having to test everything again as it can't break it but 
for any other change please provide an alternative patch with your 
suggestion, but also test it with both fuloong2e and pegasos2, The MorphOS 
iso is freely downloadable and should work with -device 
ati-vga,romfile=VGABIOS-lgpl-latest.bin as described on my qmiga.osdn.net 
page. You can find a working version of pegasos2 emulation here: 
https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
(which is currently still an older version but I plan to update it as I'm 
splitting it up in smaller patches that I'll submit here later, but that 
version should work for testing via-ide as nothing has changed in that 
part). If a patch is posted here I may test it but I don't intend to 
change this patch any more because I think what you propose here would not 
make it any better and I don't know if Guenter wants to update it either.

>>   static void via_ide_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void 
>> *data)
>>       k->device_id = PCI_DEVICE_ID_VIA_IDE;
>>       k->revision = 0x06;
>>       k->class_id = PCI_CLASS_STORAGE_IDE;
>> +    device_class_set_props(dc, via_ide_properties);
>>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>   }
>>   diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>> index 45c596f4fe5..d334fde389f 100644
>> --- a/hw/mips/fuloong2e.c
>> +++ b/hw/mips/fuloong2e.c
>> @@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, 
>> int slot, qemu_irq intc,
>>       /* Super I/O */
>>       isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>>   -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>> +    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
>> +    qdev_prop_set_bit(&dev->qdev, "legacy-mode", true);
>> +    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>>       pci_ide_create_devs(dev);
>>         pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), 
>> "vt82c686b-usb-uhci");
>
> I hope this helps to summarise all my comments from the previous thread. 
> Given that it is not possible to set default PCI BAR addresses in QEMU due to 
> the post-qdev PCI bus reset, the ultimate aim should be to devise a couple of 
> routines pci_enable_bar() and pci_disable_bar() so that the new property can 
> be removed and controller mode set directly from configuration space writes 
> to PCI_CLASS_PROG. And as per my reply in the previous thread, I can't see 
> this happening in the near future.

As I wrote in previous reply I think it would be better to solve the 
problem of removing or changing ISA devices instead which is more of a 
problem than PCI BARs here but that's something that can be considered 
later if we accept this as an interim solution now until a better 
emulation can be written after the necessary changes are made elsewhere in 
QEMU.

> I would really like to see a version of this patchset merged, particularly 
> the integration test which will be of clear value moving forward. I am not 
> against hacks like this where they are necessary, but as part of the review 
> process they need to be understood with the aim being for QEMU to provide the 
> guest with the most coherent environment possible.

I'm working on cleaning the pegasos2 patches so I can submit it here and 
get it merged. I've already done the vt8231 part (of which the first 
version of this via-ide patch I've posted in March was also part of but 
only had time to do the rest now). This vt8231 model is the 24 patch 
series I've posted yesterday (actually only 3 of those the rest is 
cleaning up vt82c686b model so we can add vt8231 relatively cleanly) and 
first half of that was alreay queued. Then there should be only two more 
patches needed: one adding Marvell system controller chip and finally the 
actual board code then we can make the acceptance test that would also 
test via-ide with half-native mode as used on pegasos2.

I appreciate your review as long as it's about finding obviously wrong 
details or suggesting improvements that can be implemented in at most a 
few days (that's all what I can put in this now) without needing to change 
anything unrelated to the actual patch. But saying that it is not 
acceptable and all of this should be done in some completely different way 
after rewriting half of device emulation in QEMU just to get rid of an if 
or a flag is not a review that I consider helpful. It's OK to point out 
how it could be improved later but make it clear that it should not hold 
back progress and should not be something that prevents merging an 
otherwise acceptable patch that does not have obviously wrong code or any 
worse hacks than what we already have in QEMU now.

Regards,
BALATON Zoltan
--3866299591-553687379-1609698669=:62321--

