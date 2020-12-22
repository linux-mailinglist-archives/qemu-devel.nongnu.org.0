Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4962E106C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 23:59:18 +0100 (CET)
Received: from localhost ([::1]:55080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krqcf-0006xG-3W
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 17:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1krqb0-0006Af-Lz
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:57:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1krqax-0008V0-2N
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:57:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E5B04746557;
 Tue, 22 Dec 2020 23:57:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8AF4274646C; Tue, 22 Dec 2020 23:57:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 890B4746383;
 Tue, 22 Dec 2020 23:57:28 +0100 (CET)
Date: Tue, 22 Dec 2020 23:57:28 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
Message-ID: <e2a1818e-366d-8a58-ce-e3eacb6787d7@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
 <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-770306119-1608677848=:81119"
X-Spam-Probability: 10%
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

--3866299591-770306119-1608677848=:81119
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
>
>>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>>> and afaics that is the only platform using it. Maybe it is just completely
>>> broken ?
>>
>> It looks like you want this patchset posted last week: https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/ (specifically: https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/20201216022513.89451-4-jiaxun.yang@flygoat.com/). Zoltan was working on the VIA southbridge wiring at the start of the year and provided me a test case that would boot Linux on the fulong2e machine, so at that point in time it wasn't completely broken.
>>
> Those patches don't help for my tests. Problem is that I try to boot from ide drive.
>
> qemu-system-mips64el -M fulong2e \
>    -kernel vmlinux -no-reboot -m 256 -snapshot \
>    -drive file=rootfs.mipsel.ext3,format=raw,if=ide \
>    -vga none -nographic \
>    --append "root=/dev/sda console=ttyS0"
>    -serial stdio -monitor none
>
> This works just fine with qemu v3.1. With qemu v5.2 (after applying the
> fuloong patch series), I get:
>
> VFS: Cannot open root device "sda" or unknown-block(0,0): error -6
>
> This used to work up to qemu v3.1. Since qemu v4.0, there has been a variety
> of failures. Common denominator is that the ide drive is no longer recognized,
> presumably due to related changes in the via and/or pci code between v3.1
> and v4.0.
>
> Difference in log messages:
>
> v3.1:
>
> pci 0000:00:05.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
> pci 0000:00:05.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
> pci 0000:00:05.1: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
> pci 0000:00:05.1: reg 0x1c: [mem 0x100000370-0x10000037f 64bit]
> ...
> pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PIO
> ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
> ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
> ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
> ...
>
> ----
>
> v5.2:
>
> pci 0000:00:05.1: reg 0x10: [io  0x0000-0x0007]
> pci 0000:00:05.1: reg 0x14: [io  0x0000-0x0003]
> pci 0000:00:05.1: reg 0x18: [io  0x0000-0x0007]
> pci 0000:00:05.1: reg 0x1c: [io  0x0000-0x0003]
> pci 0000:00:05.1: reg 0x20: [io  0x0000-0x000f]
> pci 0000:00:05.1: BAR 4: assigned [io  0x4440-0x444f]
> ...
> ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4440 irq 14
> ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x4448 irq 15
> [and nothing else]

I've already forgot about the details but we have analysed it quite 
throughly back when the via ide changes were made. Here are some random 
pointers to threads that could have some info:
This was the final solution that was merged as the simplest that worked 
for all cases we've tried to fix:
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg03977.html

Before that we went through other solutions that worked too but may not 
have matched hardware enough or something:
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg02324.html
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg02831.html
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg02817.html

Some messages in those threads might explain these but AFAIR the main 
problem was that the IDE controller embedded in the VIA southbridge chip 
can either use PCI IRQ or legacy ISA IRQs and it probably depends on the 
boards and their firmware so Linux and other OSes running on these boards 
have different workarounds to guess what's the correct IRQ routing, which 
wasn't emulated correctly. With the current version we could boot Linux 
kernel known to work on real hardware on both fuloong2e and the yet 
off-branch pegasos2 I'm working on but not having access to the real 
boards we are not 100% sure everything is correct but did seem to work. 
(The tests we've used are also documented in one of those threads.)

This may not help much but that's all I remember now without going through 
the threads again still may give you a place to start.

Regards,
BALATON Zoltan
--3866299591-770306119-1608677848=:81119--

