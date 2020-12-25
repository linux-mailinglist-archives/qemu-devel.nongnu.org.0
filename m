Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE942E2C97
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 00:45:03 +0100 (CET)
Received: from localhost ([::1]:43608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kswla-0007uG-9x
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 18:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kswkZ-0007TK-Eb
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 18:43:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:58613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kswkW-0006xN-13
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 18:43:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 80FDB7470DF;
 Sat, 26 Dec 2020 00:43:49 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 44665746552; Sat, 26 Dec 2020 00:43:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3FFB774646C;
 Sat, 26 Dec 2020 00:43:49 +0100 (CET)
Date: Sat, 26 Dec 2020 00:43:49 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
Message-ID: <e8536b99-114c-e0fb-3e9d-a83c9975a20@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1543191958-1608939829=:16029"
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1543191958-1608939829=:16029
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 22 Dec 2020, Guenter Roeck wrote:
> On 12/22/20 10:23 AM, Mark Cave-Ayland wrote:
>> On 22/12/2020 16:16, Guenter Roeck wrote:
>>
>>> Hi,
>>>
>>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>>> is indexed and sized by the number of interrupts.
>>>
>>> However, as it turns out, the interrupt number passed to this function
>>> is the _mapped_ interrupt number. The result in assertion failures for various
>>> emulations.
>>
>> That doesn't sound quite right. My understanding from the other boards I have been working on is that they use the map_irq() functions recursively so that the final set_irq() is on the physical pin, so it might just be that the assert() is simply exposing an existing bug.
>>
>>> Examples (I don't know if there are others):
>>>
>>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>>    that isn't a good thing to do for slot 0, and indeed results in an
>>>    assertion as soon as slot 0 is initialized (presumably that is the root
>>>    bridge). Changing the mapping to "slot" doesn't help because valid slots
>>>    are 0..4, and only four interrupts are allocated.
>>> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>>>    it does, it returns numbers starting with 32 for slots 5..12. With
>>>    a total number of 32 interrupts, this again results in an assertion
>>>    failure.
>>>
>>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>>> correct mapping should be. slot  & 3, maybe ?
>>
>> Yeah that doesn't look right. Certainly both the Mac PPC machines use ((pci_dev->devfn >> 3)) & 3) plus the interrupt pin so I think you're right that this is missing an & 3 here. Does adding this allow your image to boot?
>>
>
> Actually, it does not help. This does:
>
> @@ -247,7 +247,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>
>     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>
> -    return slot - 1;
> +    return slot ? slot - 1 : slot;
> }
>
> but I have no idea why.

I had a look if similar fix would work for this as for sam460ex but I'm 
not sure. The real Sam460EX only has one PCI slot so no need to map slots 
and according to U-Boot sources all PCI INT pins are connected to single 
IRQ on the interrupt controller. In QEMU we can have multiple PCI devices 
but just connecting everything up to a single interrupt seems to work. 
(Previously we did that in map_irq of the pci host, after clean up we 
model the 4 PCI interrupt lines that are then or-ed in the board code. I 
did not find a difference in working but the model may be a bit cleaner 
this way and allow reusing the pci controller in a board that may have 
different mapping.)

For the Bamboo board we have 4 interrupts connected to the PCI bus in the 
board but also have a comment in ppc4xx_pci.c near the above function 
saying:

/* On Bamboo, all pins from each slot are tied to a single board IRQ. This
  * may need further refactoring for other boards. */
static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
{
     int slot = pci_dev->devfn >> 3;

     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);

     return slot - 1;
}

Now I'm not sure what that comment means:

1. All PCI INTA from all slots go to one irq, PCI INTB to another and so on

or

2. All PCI interrupts (INTA-D) from first slot are connected to one irq on 
the board, then those from next slot are to another irq and so on

The slot - 1 mapping seems to correspond more to 2. but that also means we 
can only have 4 slots. I did not find a picture of the real board so don't 
know how many slots that has or how they are connected. I think we need 
more info on the real hardware to tell what's the correct mapping here.

Regards,
BALATON Zoltan
--3866299591-1543191958-1608939829=:16029--

