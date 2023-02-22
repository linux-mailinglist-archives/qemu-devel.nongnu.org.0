Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A569FD90
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwPK-0008FJ-I9; Wed, 22 Feb 2023 16:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUwPH-0008EW-GC; Wed, 22 Feb 2023 16:12:07 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUwPE-00055o-Ol; Wed, 22 Feb 2023 16:12:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2079A746346;
 Wed, 22 Feb 2023 22:12:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C65C4745720; Wed, 22 Feb 2023 22:12:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C48557456E3;
 Wed, 22 Feb 2023 22:12:01 +0100 (CET)
Date: Wed, 22 Feb 2023 22:12:01 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
Message-ID: <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 22 Feb 2023, Bernhard Beschow wrote:
> Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> wrote:
>>>> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
>>>>> partial implementation of the via-ac97 sound part enough to get audio
>>>>> output. I'd like this to be merged for QEMU 8.0.
>>>>>
>>>>> Regards,
>>>>> BALATON Zoltan
>>>>>
>>>>> BALATON Zoltan (5):
>>>>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>>>>   hw/isa/vt82c686: Implement PIRQ pins
>>>>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>>>>   hw/audio/ac97: Split off some definitions to a header
>>>>>   hw/audio/via-ac97: Basic implementation of audio playback
>>>>>
>>>>>  hw/audio/ac97.c            |  43 +---
>>>>>  hw/audio/ac97.h            |  65 ++++++
>>>>>  hw/audio/trace-events      |   6 +
>>>>>  hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-
>>>>>  hw/ide/via.c               |   2 +-
>>>>>  hw/isa/vt82c686.c          |  61 +++++-
>>>>>  hw/pci-host/mv64361.c      |   4 -
>>>>>  hw/ppc/pegasos2.c          |  26 ++-
>>>>>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>>>>>  include/hw/isa/vt82c686.h  |  39 +++-
>>>>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>>>>  create mode 100644 hw/audio/ac97.h
>>>>>
>>>>> --
>>>>> 2.30.7
>>>>>
>>>>>
>>>> Wow, the MorphOS people paid attention to sound design. Thanks for
>>>> presenting it to us, Zoltan!
>>>>
>>>> I've had a closer look at your series and I think it can be simplified:
>>>> Patch 2 can be implemented quite straight-forward like I proposed in a
>>>> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt routing"
>>>> working, one can expose the PCI interrupts with a single line like you do
>>>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
>>>> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>>>>
>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
>>>> used instead. pci_set_irq() internally takes care of all the ISA interrupt
>>>> level tracking patch 1 attempted to address.
>>>>
>>>
>>> Here is a proof of concept branch to demonstrate that the simplification
>>> actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
>>> with MorphOS with and without pegasos2.rom).
>>
>> Does this only work because both the via-ac97 and the PCI interrupts are mapped to the same ISA IRQ and you've only tested sound? The guest could configure each device to use a different IRQ, also mapping them so they share one ISA interrupt. What happens if multiple devices are mapped to IRQ 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all share this IRQ) and more than one such device wants to raise an interrupt at the same time? If you ack the ac97 interrupt but a PCI network card or the USB part still wants to get the CPUs attention the ISA IRQ should remain raised until all devices are serviced.
>
> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
> exactly that case very well.
>
>> I don't see a way to track the status of all devices in a single qemu_irq which can only be up or down so we need something to store the state of each source.
>
> pci_set_irq() causes pci_bus_change_irq_level() to be called.
> pci_bus_change_irq_level() tracks the sum of all irq levels of all
> devices attached to a particular pin in irq_count. Have a look at
> pci_bus_change_irq_level() and you will understand better.

I'm aware of that, we're using that in sam460ex which connects all PCI 
interrupt lines to a single IRQ and Peter explored and explained it in a 
comment there when that was discovered. First we had a patch with or-irq 
but due to this behaviot that's not needed for PCI interrupts. But the 
VT8132 could change what ISA IRQ you route the sub functions to. It 
happens that on pegasos2 by default all of those are routed to IRQ9 except 
IDE but what if a guest changes ac97 to use a different interrupt? Then 
it's not a PCI interrupt any more so you can't use pci_set_irq in 
via=ac97. There are only 4 PCI INT lines but the VIA components can be 
routed to 13 or 14 ISA IRQs. How do you keep track of that with only the 
PCI bus interrupts? I don't get your approach.

>> My patch adds a state register to each ISA IRQ line for all possible sources which could probably be stored once but then for each change of ISA IRQ status all the mapped devices should be checked and combined so it's easier to store them for each IRQ. Does your approach still work if you play sound, and copy something from network to a USB device at the same time? (I'm not sure mine does not have remaining bugs but I don't think this can be simplified that way but if you can prove it would work I don't mind taking an alternative version but I'm not convinced yet.)
>
> Well, I can't prove that my approach works but unfortunately I can
> prove that both our approaches cause a freeze :/ Try:
> 1. Start `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc
> base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom
> morphos-3.17.iso -device usb-mouse -device usb-kbd`
> 2. Move the mouse while sound is playing
> -> Observe the VM to freeze
>
> So there must be an issue somewhere else...

I'll have a look later but my patch attempts to handle the USB controller 
interrupts. There may be another bug somewhere in USB emulation though, we 
have similar problem with mac99 with older MacOS guests. Considering that 
USB devices probably did not work at all before this patch it's at least 
still an imptovement. :-)

Regards,
BALATON Zoltan

