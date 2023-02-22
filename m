Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD669FC1A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:27:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUukE-0004ay-Ke; Wed, 22 Feb 2023 14:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUuk8-0004aV-Gx; Wed, 22 Feb 2023 14:25:32 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUuk3-0001Qq-QP; Wed, 22 Feb 2023 14:25:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D3171746346;
 Wed, 22 Feb 2023 20:25:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D20F3745720; Wed, 22 Feb 2023 20:25:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D05D77456E3;
 Wed, 22 Feb 2023 20:25:16 +0100 (CET)
Date: Wed, 22 Feb 2023 20:25:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
Message-ID: <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> wrote:
>> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
>>> partial implementation of the via-ac97 sound part enough to get audio
>>> output. I'd like this to be merged for QEMU 8.0.
>>>
>>> Regards,
>>> BALATON Zoltan
>>>
>>> BALATON Zoltan (5):
>>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>>   hw/isa/vt82c686: Implement PIRQ pins
>>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>>   hw/audio/ac97: Split off some definitions to a header
>>>   hw/audio/via-ac97: Basic implementation of audio playback
>>>
>>>  hw/audio/ac97.c            |  43 +---
>>>  hw/audio/ac97.h            |  65 ++++++
>>>  hw/audio/trace-events      |   6 +
>>>  hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-
>>>  hw/ide/via.c               |   2 +-
>>>  hw/isa/vt82c686.c          |  61 +++++-
>>>  hw/pci-host/mv64361.c      |   4 -
>>>  hw/ppc/pegasos2.c          |  26 ++-
>>>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>>>  include/hw/isa/vt82c686.h  |  39 +++-
>>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>>  create mode 100644 hw/audio/ac97.h
>>>
>>> --
>>> 2.30.7
>>>
>>>
>> Wow, the MorphOS people paid attention to sound design. Thanks for
>> presenting it to us, Zoltan!
>>
>> I've had a closer look at your series and I think it can be simplified:
>> Patch 2 can be implemented quite straight-forward like I proposed in a
>> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt routing"
>> working, one can expose the PCI interrupts with a single line like you do
>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
>> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>>
>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
>> used instead. pci_set_irq() internally takes care of all the ISA interrupt
>> level tracking patch 1 attempted to address.
>>
>
> Here is a proof of concept branch to demonstrate that the simplification
> actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
> with MorphOS with and without pegasos2.rom).

Does this only work because both the via-ac97 and the PCI interrupts are 
mapped to the same ISA IRQ and you've only tested sound? The guest could 
configure each device to use a different IRQ, also mapping them so they 
share one ISA interrupt. What happens if multiple devices are mapped to 
IRQ 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all 
share this IRQ) and more than one such device wants to raise an interrupt 
at the same time? If you ack the ac97 interrupt but a PCI network card or 
the USB part still wants to get the CPUs attention the ISA IRQ should 
remain raised until all devices are serviced. I don't see a way to track 
the status of all devices in a single qemu_irq which can only be up or 
down so we need something to store the state of each source. My patch adds 
a state register to each ISA IRQ line for all possible sources which could 
probably be stored once but then for each change of ISA IRQ status all the 
mapped devices should be checked and combined so it's easier to store them 
for each IRQ. Does your approach still work if you play sound, and copy 
something from network to a USB device at the same time? (I'm not sure 
mine does not have remaining bugs but I don't think this can be simplified 
that way but if you can prove it would work I don't mind taking an 
alternative version but I'm not convinced yet.)

Regards,
BALATON Zoltan

>> I might have further comments but I think it's enough for now.
>>
>> Thanks again for making via-ac97 work!
>>
>> Best regards,
>> Bernhard
>>
>

