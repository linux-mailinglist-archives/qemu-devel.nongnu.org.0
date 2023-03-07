Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0E6ADC70
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:53:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUwI-0001iD-M8; Tue, 07 Mar 2023 05:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZUwF-0001fl-NX; Tue, 07 Mar 2023 05:52:59 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZUwD-0008HH-1s; Tue, 07 Mar 2023 05:52:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A05337457E7;
 Tue,  7 Mar 2023 11:52:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 28A5B745720; Tue,  7 Mar 2023 11:52:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 26F047456E3;
 Tue,  7 Mar 2023 11:52:42 +0100 (CET)
Date: Tue, 7 Mar 2023 11:52:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <64b06dd7-4dbe-5f5b-3808-34acbf64b354@ilande.co.uk>
Message-ID: <1ba22339-71f6-14a4-c138-05e31e169e0a@eik.bme.hu>
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
 <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
 <3cbf9e02-5660-18dd-783b-9f9f09fe35bb@eik.bme.hu>
 <64b06dd7-4dbe-5f5b-3808-34acbf64b354@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-276944714-1678186362=:97852"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-276944714-1678186362=:97852
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 7 Mar 2023, Mark Cave-Ayland wrote:
> On 07/03/2023 00:20, BALATON Zoltan wrote:
>> On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
>>> On 06/03/2023 12:33, BALATON Zoltan wrote:
>>>> The real VIA south bridges implement a PCI IRQ router which is configured
>>>> by the BIOS or the OS. In order to respect these configurations, QEMU
>>>> needs to implement it as well. The real chip may allow routing IRQs from
>>>> internal functions independently of PCI interrupts but since guests
>>>> usually configute it to a single shared interrupt we don't model that
>>>> here for simplicity.
>>>> 
>>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>>>> 
>>>> Suggested-by: Bernhard Beschow <shentey@gmail.com>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>>>> ---
>>>>   hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 42 insertions(+)
>>>> 
>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>> index 8900d87f59..3383ab7e2d 100644
>>>> --- a/hw/isa/vt82c686.c
>>>> +++ b/hw/isa/vt82c686.c
>>>> @@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>>>>       qemu_set_irq(s->isa_irqs_in[n], level);
>>>>   }
>>>>   +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>>> +{
>>>> +    switch (irq_num) {
>>>> +    case 0:
>>>> +        return s->dev.config[0x55] >> 4;
>>>> +    case 1:
>>>> +        return s->dev.config[0x56] & 0xf;
>>>> +    case 2:
>>>> +        return s->dev.config[0x56] >> 4;
>>>> +    case 3:
>>>> +        return s->dev.config[0x57] >> 4;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>>> +{
>>>> +    ViaISAState *s = opaque;
>>>> +    PCIBus *bus = pci_get_bus(&s->dev);
>>>> +    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
>>>> +
>>>> +    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
>>>> +    if (!pic_irq) {
>>>> +        return;
>>>> +    }
>>>> +    if (unlikely(pic_irq == 2 || pic_irq == 8 || pic_irq == 13)) {
>>>> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
>>>> +    }
>>>> +
>>>> +    /* The pic level is the logical OR of all the PCI irqs mapped to it. 
>>>> */
>>>> +    pic_level = 0;
>>>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>>>> +        if (pic_irq == via_isa_get_pci_irq(s, i)) {
>>>> +            pic_level |= pci_bus_get_irq_level(bus, i);
>>>> +        }
>>>> +    }
>>>> +    /* Now we change the pic irq level according to the via irq 
>>>> mappings. */
>>>> +    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>>>> +}
>>>> +
>>>>   static void via_isa_realize(PCIDevice *d, Error **errp)
>>>>   {
>>>>       ViaISAState *s = VIA_ISA(d);
>>>> @@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error 
>>>> **errp)
>>>>       i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>>       i8257_dma_init(isa_bus, 0);
>>>>   +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", 
>>>> PCI_NUM_PINS);
>>>> +
>>>>       /* RTC */
>>>>       qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>>>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>> 
>>> Writing my previous response where I asked about the additional PCI 
>>> interrupt connections to the MV64361, I realised that if you forget about 
>>> the Northbridge component for a moment then things start to make a bit 
>>> more sense.
>>> 
>>> At the moment we have 3 different scenarios:
>>> 
>>>   1) ISA IRQ -> 8259 for all ISA devices
>>> 
>>>   2) ISA IRQ -> 8259 *OR*
>>>      PCI IRQ -> PCI IRQ router -> 8259 for the PCI-IDE device
>>> 
>>>   3) PCI IRQ -> PCI IRQ router -> 8259 for PCI devices
>>> 
>>> When you look at it this way it is easy to see for case 3 that the PCI IRQ 
>>> routing mechanism is handled by *_set_irq() and *_map_irq() callbacks. And 
>>> so with that in mind, re-reading the VIA datasheet I came up with the 
>>> following PoC for discussion: 
>>> https://github.com/mcayland/qemu/commits/via-poc.
>> 
>> At first glance this is basically what I had in v1 of this series just 
>> using PCI function numbers instead of an enum to find the IRQ source.
>
> I can see the similarity however the difference here is that the PCI routing 
> is done using the existing PCI routing functions in QEMU, rather than 
> requiring an external function call specific to VIA devices.
>
>>> It needs a bit of work, but at first glance it ticks all the boxes in that 
>>> the PCI bus IRQs are all internal to the VIA southbridge (no global 
>>> via_isa_set_irq() function and no overriding of PCI bus IRQs), there are 
>>> separate legacy and PCI IRQs for the via-ide device, and the PCI IRQ 
>>> routing bears at least a passing resemblance to the datasheet.
>> 
>> Given that we only have a few hours left until the freeze I hope you're not 
>> proposing to drop this series and postpone all this to the next release, 
>> only that we do this clean up in the next devel cycle. You were away when 
>> this series were on the list for review so this is a bit late now for a big 
>> rewrite. (Especially that what you propose is a variant of the original 
>> I've submitted that I had to change due to other review comments.)
>> 
>> Since this version was tested and works please accept this for QEMU 8.0 now 
>> then we can work out your idea in the next devel cycle but until then this 
>> version allows people to run AmigaOS on pegasos2 with sound which is the 
>> goal I want to achieve for QEMU 8.0 and does not introduce any change to 
>> via-ide which was good enough for the last two years so it should be good 
>> enough for a few more months.
>
> My understanding from the thread was that testing shows there are still hangs 
> when using sound/USB/IDE simultaneously with this series, no? Or has that now 
> been fixed?

No. This series fiixes sound/USB/PCI interrupts which is needed to get 
AmigaOS work and be usable on pegasos2. The hang Bernhard found with 
usb-mouse was only affecting MorphOS with this series which uses level 
sensitive mode of i8259 which wasn't implemented. Patch 2 in this series 
thanks to David Woodhouse fixes that (so did my work around before that 
patch) and MorphOS on pegasos2 is not a priority as it already runs on 
mac99 so what I'd like to make work here is AmigaOS for which it's the 
only G4 CPU platform now. This is important as it's much faster than the 
PPC440 version and may be able to run with KVM eventually but to find that 
out this should get in first so people can start to test it. We can always 
improve it later including implementing a better model of IRQ routing in 
VT8231. What we have in this series now works for all guests and all 
important patches have been tested and now reviewed. So I hope Philippe 
can pick this up and then we have time for this discussion afterwards.

> I completely understand it can be frustrating not getting patches merged, but 
> often as developers on less popular machines it can take a long time. My 
> perspective here is that both you and Bernhard have out-of-tree patches for 
> using the VIA southbridges, and during review Bernhard has raised legitimate 
> review questions based upon his experience.

Those review questions have been addressed, I've accepted Bernhard's 
alternative patch even though I think it's not entirely correct and 
although the first series was already tested I've re-done that based on 
Bernhard's idea and asked Rene to test all of it again. That's when you 
came along a few days before the freeze and blocking this without even 
fully understanding what it's about. That is what's frustrating.

> To me it makes sense to resolve these outstanding issues first to provide a 
> solution that works for everyone, rather than pushing to merge a series that

There are no issues to resolvc regatding functionality. All versions of 
this series that I have submitted were tested and are working and achieve 
the goal to make it possible to run AmigaOS on pegasos2 and get sound with 
MorphOS which are not yet possible currently. Nobody showed these patches 
would break anything (which would be surprising anyway as these are only 
used by pegasos2 and fuloong2e the latter of which has never been finished 
so only still around to have a way to test these components independent of 
pegasos2). A solution for everyone would be to merge this series now so 
they can use it in QEMU 8.0 then we have time to improve it and make the 
model conteptually more correct but there are no missing functionality 
that would prevent guests from running with this series so no reason to 
keep this out now.

> still has reliability issues and where there is lack of consensus between 
> developers. The worst case scenario to me is that these patches get merged, 
> people report that QEMU is unreliable for AmigaOS, and then we end up 
> repeating this entire process yet again several months down the line when 
> Bernhard submits his series for upstream.

I don't even know what to say to that. It already took me more time 
arguing with you about it than writing the whole series. We have pegasos2 
in QEMU already which these really small patches that Bernhard now also 
agrees could be accepted for now would allow to run two more guests and 
reach usable state with them that is much better than what's possible now 
and there are several people who can't compile their QEMU from off-tree 
sources but would happily use it from their distro packages or binaries 
provided for release versions. But you just don't care about those people 
or my work and would hold this back indefinitely becuase maybe it could 
break some off-tree changes not even finished or submitted yet or maybe we 
will find a bug later. What's the freeze time for if not for finding bugs 
and fixing them. What's the development window for if not imrpving code 
already there?

Again this is now tested, reviewed and isn't known to break anything 
that's already there or even make it less clean, in fact it does make 
existing code a bit cleaner and fixes some issues so the only problem is 
that you think there must be a better way doing it or do it more fully 
than this series does it but you've failed to say that during review 
because you were away.

Philippe, Peter or any other maintainer please put an end on this 
suffering and submit a pull request with any version of this series (as 
I've said all versions I've sent are tested and working) now so we have it 
working and then we can rewrite it later however Mark wants in the future 
but let not make people who want to use it wait because of unreasonable 
concerns. Putting this off to wait until some other unfinished and 
unrelated machine is written just makes no sense.

Regards,
BALATON Zoltan
--3866299591-276944714-1678186362=:97852--

