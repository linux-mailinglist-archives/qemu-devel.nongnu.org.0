Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBEC2E2135
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 21:22:07 +0100 (CET)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksAe5-0003IN-Up
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 15:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksAcx-0002sl-AQ
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 15:20:55 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:52179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksAct-0005OQ-Th
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 15:20:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 89BFA746383;
 Wed, 23 Dec 2020 21:20:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 366147470E1; Wed, 23 Dec 2020 21:20:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 348E27470DF;
 Wed, 23 Dec 2020 21:20:48 +0100 (CET)
Date: Wed, 23 Dec 2020 21:20:48 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
Message-ID: <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1820610419-1608754239=:95188"
Content-ID: <d5b837da-669b-d4b1-caf6-c532c5fd6323@eik.bme.hu>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1820610419-1608754239=:95188
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <c6156a3-6d7a-d459-7d47-4f546a119b40@eik.bme.hu>

On Wed, 23 Dec 2020, Guenter Roeck wrote:
> On 12/23/20 8:09 AM, Mark Cave-Ayland wrote:
>> On 23/12/2020 15:21, Philippe Mathieu-Daudé wrote:
>>
>>> On 12/22/20 5:16 PM, Guenter Roeck wrote:
>>>> Hi,
>>>>
>>>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>>>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>>>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>>>> is indexed and sized by the number of interrupts.
>>>>
>>>> However, as it turns out, the interrupt number passed to this function
>>>> is the _mapped_ interrupt number. The result in assertion failures for various
>>>> emulations.
>>>>
>>>> Examples (I don't know if there are others):
>>>>
>>>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>>>    that isn't a good thing to do for slot 0, and indeed results in an
>>>>    assertion as soon as slot 0 is initialized (presumably that is the root
>>>>    bridge). Changing the mapping to "slot" doesn't help because valid slots
>>>>    are 0..4, and only four interrupts are allocated.
>>>> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>>>>    it does, it returns numbers starting with 32 for slots 5..12. With
>>>>    a total number of 32 interrupts, this again results in an assertion
>>>>    failure.
>>>>
>>>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>>>> correct mapping should be. slot  & 3, maybe ?
>>>>
>>>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>>>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>>>> and afaics that is the only platform using it. Maybe it is just completely
>>>> broken ?
>>>
>>> FWIW bisecting Fuloong2E starts failing here:
>>>
>>> 4ea98d317eb442c738f898f16cfdd47a18b7ca49 is the first bad commit
>>> commit 4ea98d317eb442c738f898f16cfdd47a18b7ca49
>>> Author: BALATON Zoltan <balaton@eik.bme.hu>
>>> Date:   Fri Jan 25 14:52:12 2019 -0500
>>>
>>>      ide/via: Implement and use native PCI IDE mode
>>>
>>>      This device only implemented ISA compatibility mode and native PCI IDE
>>>      mode was missing but no clients actually need ISA mode but to the
>>>      contrary, they usually want to switch to and use device in native
>>>      PCI IDE mode. Therefore implement native PCI mode and switch default
>>>      to that.
>>>
>>>      Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>      Message-id:
>>> c323f08c59b9931310c5d92503d370f77ce3a557.1548160772.git.balaton@eik.bme.hu
>>>      Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>>   hw/ide/via.c | 52 ++++++++++++++++++++++++++++++++++++++--------------
>>>   1 file changed, 38 insertions(+), 14 deletions(-)
>>
>> I think the original version of the patch broke fuloong2e, however that should have been fixed by my patchset here: https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg03936.html. It might be that there are multiple regressions located during a full bisect :/
>>
>
> Not really. The following patch on top of qemu 5.2 results in the ide drive
> being detected and working.
>
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b33..1bfdc422ee 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -186,11 +186,14 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>
>     bmdma_setup_bar(d);
> +#if 0
>     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +#endif
>
>     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>     for (i = 0; i < 2; i++) {
>         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0, i ? 0x376 : 0x3f6);
>         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>
>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>
> With the added ide_init_ioport(), the drive is detected. With the #if 0,

This breaks MorphOS on pegasos2 so it's not acceptable for me as a fix. 
(Actually this just reverts my commit in a cryptic way.)

> it actually starts working. So there are two problems: 1) The qemu ide
> subsystem isn't informed about the io addresses, and 2) bmdma isn't working.

The problem rather seems to be that whatever you're trying to run can only 
handle legacy mode and does not correctly detect or work with native mode 
of this IDE controller. The real chip can switch between these modes and 
starts in legacy mode but most OSes with a better driver will switch to 
native mode during boot (in some cases the firmware will switch already). 
But we can't emulate that in QEMU easily because of how the IDE emulation 
is implemented: we either set up legacy ioports or use PCI BMDMA, I don't 
see a way to deregister legacy ports and irqs once the config reg is 
flipped to native mode. Therefore I've chosen to only emulate native mode 
which is what most guests want to use and some only work with that and 
I've tested this with the previously mentioned Linux version that it still 
detected and worked with the IDE ports. During testing I've found that 
Linux will use either native or legacy modes if the appropriate config 
bits are set but for some boards there may be work arounds for specific 
quirks such as the case for pegasos2 with IRQs hardwired to legacy 
interrupts even in native mode where we need to follow what hardware does 
otherwise one or the other guest breaks. Maybe there's a similar quirk for 
the fuloong2e?

What guest OS are you running and did you confirm that it runs on the real 
machine? If you run recent Linux kernels and don't know if those still 
work with real hardware could this be a bug in the guest driver and not in 
QEMU? We know that we don't fully emulate this controller but there should 
be a way to set things up in a way that satisfies all guests and I've 
tried to do that when touching this part but possibly I did not have the 
right Linux version for the real machine as it was hard to find one distro 
that worked with it. Maybe Jiaxun has a known working Linux distro or 
kernel that we can use to check emulation with or knows more about how the 
VIA IDE port IRQs are wired on this board. (I've added Jiaxun again but 
the list seems to strip his addess.)

Regards,
BALATON Zoltan
--3866299591-1820610419-1608754239=:95188--

