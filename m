Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC038AE0B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 14:22:04 +0200 (CEST)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljhgg-0005V8-Gs
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 08:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ljhdb-0003ii-Tc
 for qemu-devel@nongnu.org; Thu, 20 May 2021 08:18:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:27874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ljhdW-00041O-IU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 08:18:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 71F1E746346;
 Thu, 20 May 2021 14:18:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3D73D7462DB; Thu, 20 May 2021 14:18:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3B9DB7462BD;
 Thu, 20 May 2021 14:18:39 +0200 (CEST)
Date: Thu, 20 May 2021 14:18:39 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
In-Reply-To: <ae7509a1-2934-7780-6fae-ea9f4bf16e8d@ilande.co.uk>
Message-ID: <b1e050a-d98-b2cf-942b-ee92773e4f0@eik.bme.hu>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
 <3ba44704-6418-4aee-23ad-7d4dcc1fe60d@redhat.com>
 <babbf5da-b4c0-9736-b09-426e3a358587@eik.bme.hu>
 <YKYfOMUvCnQTcQtZ@stefanha-x1.localdomain>
 <ae7509a1-2934-7780-6fae-ea9f4bf16e8d@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021, Mark Cave-Ayland wrote:
> On 20/05/2021 09:35, Stefan Hajnoczi wrote:
>> I realized I don't really understand how ISA IDE and PCI IDE interact in
>> PIIX3:

You're not alone with that. :-)

>> - ISA IDE has well-known PIO registers that are always present?
>> 
>> - PCI IDE has the same registers, but the BAR must be mapped and PCI IO
>>    space access must be enabled?
>> 
>> - ISA IDE has a hardcoded ISA irq number?
>> 
>> - PCI IDE has a normal PCI irq that is routed like any legacy PCI INTx
>>    irq?
>> 
>> - What combinations of ISA enabled/disabled and PCI enabled/disabled
>>    need to be supported?
>
> Yeah a lot of this discussion happened several months back in the Pegasos 
> threads, but here is my understanding:
>
> - Older legacy PCI devices such as IDE controllers connected via a host 
> containing a PCI-ISA bridge can be switched by the guest OS into PCI legacy 
> (also known as compatibility mode) via a PCI config space register so that IO 
> space accesses, IRQs (and possible DMA?) are done via the ISA bus

Maybe you can look at the VIA VT82C686B and VT8231 docs that have some 
info on how this works for these integrated "super south bridges" (superio 
+ PCI bridge). The concept for PIIX may be similar but registers may be 
different. There are at least two modes: a legacy mode that uses normal 
ISA IDE ioports and IRQs so that older drivers work without change and 
some native mode that may be full PCI mode with BARs and PCI irq-s or some 
strange non-100& native mode (as Linux calls it) on some systems such as 
pegasos2 where in this mode port addresses can be set indepently but IRQs 
are still hard coded to use ISA IRQs regardless of what the documented IRQ 
reg is set to. (I'm still not sure how this is implemented in hardware but 
that's how guests expect it to work and this caused some problem with 
implementing this as another machine using via-ide (the MIPS fuloong2e) 
has either legacy or a real native mode with IRQ also set by a register 
(it's still not a PCI IRQ I think as an ISA IRQ is selected by this 
register but instead of the legacy IRQ 14+15 in this mode it's using a 
single interrupt for both channels set by a reg e.g. 9 while normal PCI 
interrupts may be connected somewhere else). On pegasos2 where setting 
this IRQ reg does not change the IRQ 14+15 mapping, there native mode only 
changes ports to use configured port numbers instead of the legacy 1f0-170 
ones but keeping the legacy ISA IRQs. We have to model this otherwise 
guests don't work because they often expect things to work a certain way 
without checking.

Maybe the IDE in these integrated south bridges are not really PCI IDE but 
in native mode behaves more or less like a real PCI IDE card so we just 
reusing the QEMU PCI IDE model to emulate them but we also need to emulate 
the quirks of their native mode in some cases. Currently we likely only 
emulate one of the possible modes that work with the guests and not fully 
emulate all modes due to ISA model not being QOM that can be added or 
removed on demand so if we set it up in the beginning then we're stuck 
with legacy mode as we can't really disable the legacy io ports any more 
to switch to native mode without hacking into ISA emulation. (A similar 
problem was also found with other superio devices in the VIA south bridge, 
such as serial, parallel, FDC, that also have configurable io ports but we 
can't emulate that as ISA superio devices can only be created with port 
addresses but these addresses cannot be set later. Fortunately guests set 
it up once at startup and usually don't change the default so if we put it 
there it works.)

> - QEMU handles the IO memory accesses fine, since in these cases 
> isa_bus_new() is given the IO space by pci_address_space_io(dev) so IO space 
> access generally "just works"
>
> - Currently it is the responsibility of these older PCI devices to determine 
> how they have been configured and either use e.g. pci_set_irq() or 
> qemu_raise_irq() on the ISA IRQ for interrupts

This is probably OK considering that these IDE device can be in different 
modes and probably the only part that knows which mode it's in is the 
device itself so it has to determine what IRQ to use. But as in the 
via-ide case the modes (and thus IRQs used) can be different based on 
which south bridge or machine it's used in so maybe it should be the 
higher level object (south bridge or machine) which instantiates via-ide 
that decides which irq to use. So I wonder if it would be possible to 
remove the decision of using pci_set_irq or using an ISA irq from via-ide 
and only pass it a qemu_irq that it can raise without caring where it's 
connected and the south bridge or machine that creates via-ide could then 
pass it an appropriate irq (PCI or ISA based on how it's configured). This 
seems the simplest way but due to the current entanglement of IRQ handling 
in the different models it's not clear to me how to implement this or if 
it's possible at all.

> - Generally ISA IRQs are fixed as per the old AT-style PCs so IDE would be 
> 14/15
>
> My thoughts above were about how to allow a PCIDevice to locate its ISABus if 
> it is connected to a bus with a PCI-ISA bridge to potentially allow access to 
> ISA IRQs and DMA if configured in PCI legacy mode.

In my opinion a PCI device should have no knowledge about ISA at all, it's 
probably the south bridge that uses this PCI IDE device that should 
connect it to ISA as that's the one that knows about ISA bus or ISA IRQs. 
I'm a bit concerned about the performance of your proposed 
pci_device_get_isabus() function that walks the PCI bus to get an ISA bus 
to get an ISA IRQ. Do you really want to do that every time an IRQ is 
raised which can be quite frequent? I think it would be better to find the 
IRQ once when the PCI IDE device is set up in it's parent object that also 
already has a reference to ISA bus and just pass the IRQ to the IDE device 
removing the need for it to know about ISA. I think that's a better 
direction to go but don't know how to get there.

As a side note, in my understanding the main problem with fully emulating 
these south bridges is that ISA emulation predates everything and it's not 
fully QOM-ified so a lot of it still uses global vars and legacy init 
functions that allow creating these ISA devices but not changing them 
afterwards in any way. This prevents cleanly modelling south bridges that 
can switch between legacy and PCI mode for IDE for example because we can 
create legacy IDE ports but then we cannot switch tnem off to use BARs 
instead when the mode change so without ovethauling the ISA emulation we 
can only emulate one mode or the other. I've stumbled upon this for 
via-ide and VT8231 serial and decided I don't want to try cleaning up ISA 
as it's a basic device class that could break a lot of things so I did not 
feel like wanting to attempt that. This patch set from Philippe tries to 
go a bit further in that direction but maybe not all the way for the same 
reason that it's a big task with a lot of potential breakage. So I'm OK 
with leaving it as it is now as it works well enough or make small clean 
ups as possible without breaking too many things. If this introduces an 
ISABus link in PCI IDE I can live with that knowing that it's to avoid 
more extensive changes or adding new subclasses but if there's a simpler 
way by passing IRQs directly and it could be done that seems to be a 
cleaner way to me.

Regards,
BALATON Zoltan

