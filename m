Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D869FE70
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxWk-00031C-SY; Wed, 22 Feb 2023 17:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUxWf-00030w-Fb; Wed, 22 Feb 2023 17:23:49 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUxWc-0006ZJ-7u; Wed, 22 Feb 2023 17:23:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AEBFC746346;
 Wed, 22 Feb 2023 23:23:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5444E745720; Wed, 22 Feb 2023 23:23:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 505847456E3;
 Wed, 22 Feb 2023 23:23:42 +0100 (CET)
Date: Wed, 22 Feb 2023 23:23:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
Message-ID: <752b4e6b-43ef-655f-4203-f9c85aa4298f@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
>
>> My patch adds a state register to each ISA IRQ line for all possible sources which could probably be stored once but then for each change of ISA IRQ status all the mapped devices should be checked and combined so it's easier to store them for each IRQ. Does your approach still work if you play sound, and copy something from network to a USB device at the same time? (I'm not sure mine does not have remaining bugs but I don't think this can be simplified that way but if you can prove it would work I don't mind taking an alternative version but I'm not convinced yet.)
>
> Well, I can't prove that my approach works but unfortunately I can
> prove that both our approaches cause a freeze :/ Try:
> 1. Start `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc
> base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom
> morphos-3.17.iso -device usb-mouse -device usb-kbd`
> 2. Move the mouse while sound is playing
> -> Observe the VM to freeze

Not quite sure why but it seems to happen when both the ac97 and USB raise 
the interrupt and the guest driver seems to get confused. Adding some 
debug logging:

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b16620daf8..f840e5a8d0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -636,12 +636,13 @@ void via_isa_set_irq(PCIDevice *d, 
ViaISAIRQSourceBit n, int level)
      if (!isa_irq) {
          return;
      }
-
+if (n > 1) fprintf(stderr, "%s: %d %d %d %x -> ", __func__, n, level, isa_irq, s->isa_irq_state[isa_irq]);
      if (level) {
          s->isa_irq_state[isa_irq] |= BIT(n);
      } else {
          s->isa_irq_state[isa_irq] &= ~BIT(n);
      }
+if (n > 1) fprintf(stderr, "%x\n", s->isa_irq_state[isa_irq]);
      qemu_set_irq(s->isa_irqs[isa_irq], !!s->isa_irq_state[isa_irq]);
  }

I see in the normal case when there's only one interrupt for USB only:

via_isa_set_irq: 2 1 9 0 -> 4
usb_uhci_mmio_readw addr 0x0002, ret 0x0001
usb_uhci_mmio_writew addr 0x0002, val 0x0001
via_isa_set_irq: 2 0 9 4 -> 0

For sound only:

via_ac97_sgd_fetch addr=0x43b70bc --F len=3528
via_isa_set_irq: 8 1 9 0 -> 100
usb_uhci_mmio_readw addr 0x0002, ret 0x0000
usb_uhci_mmio_readw addr 0x0002, ret 0x0000
via_ac97_sgd_read 0x0 1 -> 0xc9
via_ac97_sgd_write 0x0 1 <- 0x1
via_isa_set_irq: 8 0 9 100 -> 0
via_ac97_sgd_read 0x4 4 -> 0x439cbe8
via_ac97_sgd_fetch addr=0x43c70bc -E- len=3528
via_isa_set_irq: 8 1 9 0 -> 100
via_ac97_sgd_read 0x4 4 -> 0x439cbe0
via_ac97_sgd_read 0x4 4 -> 0x439cbe0
via_ac97_sgd_read 0x10 1 -> 0x0
usb_uhci_mmio_readw addr 0x0002, ret 0x0000
usb_uhci_mmio_readw addr 0x0002, ret 0x0000
via_ac97_sgd_read 0x0 1 -> 0xca
via_ac97_sgd_write 0x0 1 <- 0x2
via_isa_set_irq: 8 0 9 100 -> 0
via_ac97_sgd_read 0x4 4 -> 0x439cbe0

but it stops acking irqs when both are raised or it seems USB IRQ is 
raised while it's in the guest IRQ handler:

via_ac97_sgd_fetch addr=0x43c70bc -E- len=3528
via_isa_set_irq: 8 1 9 0 -> 100
usb_uhci_mmio_readw addr 0x0002, ret 0x0000
usb_uhci_mmio_readw addr 0x0002, ret 0x0000
via_isa_set_irq: 2 1 9 100 -> 104
via_ac97_sgd_read 0x0 1 -> 0xca
via_ac97_sgd_write 0x0 1 <- 0x2
via_isa_set_irq: 8 0 9 104 -> 4
via_ac97_sgd_read 0x4 4 -> 0x439cbe0
via_ac97_sgd_fetch addr=0x43b70bc --F len=3528
via_isa_set_irq: 8 1 9 4 -> 104
via_ac97_sgd_read 0x4 4 -> 0x439cbe8
via_ac97_sgd_read 0x4 4 -> 0x439cbe8
via_ac97_sgd_read 0x10 1 -> 0x0
usb_uhci_mmio_readw addr 0x0006, ret 0x06bf
usb_uhci_mmio_readw addr 0x0010, ret 0x0085
usb_uhci_mmio_writew addr 0x0010, val 0x0085
usb_uhci_mmio_readw addr 0x0012, ret 0x0085
usb_uhci_mmio_writew addr 0x0012, val 0x0085
usb_uhci_mmio_readw addr 0x0006, ret 0x06b7
usb_uhci_mmio_readw addr 0x0010, ret 0x0080
usb_uhci_mmio_writew addr 0x0010, val 0x0080
usb_uhci_mmio_readw addr 0x0012, ret 0x0080
usb_uhci_mmio_writew addr 0x0012, val 0x0080
usb_uhci_mmio_readw addr 0x0006, ret 0x0759
usb_uhci_mmio_readw addr 0x0010, ret 0x0085
usb_uhci_mmio_writew addr 0x0010, val 0x0085
usb_uhci_mmio_readw addr 0x0012, ret 0x0085
usb_uhci_mmio_writew addr 0x0012, val 0x0085
usb_uhci_mmio_readw addr 0x0006, ret 0x0752
usb_uhci_mmio_readw addr 0x0010, ret 0x0080
usb_uhci_mmio_writew addr 0x0010, val 0x0080
usb_uhci_mmio_readw addr 0x0012, ret 0x0080
usb_uhci_mmio_writew addr 0x0012, val 0x0080
via_isa_set_irq: 2 1 9 104 -> 104
usb_uhci_mmio_readw addr 0x0006, ret 0x07f1
usb_uhci_mmio_readw addr 0x0010, ret 0x0085
usb_uhci_mmio_writew addr 0x0010, val 0x0085
usb_uhci_mmio_readw addr 0x0012, ret 0x0085
usb_uhci_mmio_writew addr 0x0012, val 0x0085
usb_uhci_mmio_readw addr 0x0006, ret 0x07e9

It seems to not notice the USB interrupt any more after that although 
sound playback stops but mouse still moves but otherwise does not work. 
I'm not sure this is not a guest bug as it seems an interrupt handler 
should disable interrupts to not get interrupted. Could this be reproduced 
with Linux? I'd still go wit this patch series for 8.0 because the default 
case works and this was also tested with two PCI cards on AmigaOS4 which 
works not while it did not work at all before so this could be debugged 
and fixed later but adding this series makes the machine generally usable 
at least without USB devices. With -d unimp I also get these logs when 
booting MorphOS:

ok boot cd boot.img
ISO-9660 filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"
Root dir: "" flags=0x2 extent=0x20 size=0x1800
31.127| Memory used before SYS_Init: 9MB
i8259: level sensitive irq not supported
i8259: level sensitive irq not supported

Could it be the PIC emulation should be fixed for this?

Regards,
BALATON Zoltan

