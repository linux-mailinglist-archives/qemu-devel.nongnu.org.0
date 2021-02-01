Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897030B174
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:12:25 +0100 (CET)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fYe-0002oC-Hd
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1l6fXZ-0002LJ-Dp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:11:17 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1l6fXW-0003Rd-St
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:11:17 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 3EB2DA00E1; Mon,  1 Feb 2021 21:04:34 +0100 (CET)
Date: Mon, 1 Feb 2021 21:04:34 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
In-Reply-To: <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
Message-ID: <alpine.LMD.2.03.2102012101480.9444@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1117279078-261445064-1612209748=:9444"
Content-ID: <alpine.LMD.2.03.2102012102460.9444@eik.bme.hu>
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1117279078-261445064-1612209748=:9444
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15; FORMAT=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.LMD.2.03.2102012102461.9444@eik.bme.hu>

On Sun, 10 Jan 2021, BALATON Zoltan wrote:
> On Sun, 10 Jan 2021, Philippe Mathieu-Daud=E9 wrote:
>> +PCI experts
>>=20
>> On 1/10/21 1:43 AM, BALATON Zoltan wrote:
>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daud=E9 wrote:
>>>> Hi Zoltan,
>>>>=20
>>>> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>>>>> Currently the ISA devices that are part of the VIA south bridge,
>>>>> superio chip are wired up by board code. Move creation of these ISA
>>>>> devices to the VIA ISA bridge model so that board code does not need
>>>>> to access ISA bus. This also allows vt82c686b-superio to be made
>>>>> internal to vt82c686 which allows implementing its configuration via
>>>>> registers in subseqent commits.
>>>>=20
>>>> Is this patch dependent of the VT82C686B_PM changes
>>>> or can it be applied before them?
>>>=20
>>> I don't know but why would that be better? I thought it's clearer to
>>> clean up pm related parts first before moving more stuff to this file s=
o
>>> that's why this patch comes after (and also because that's the order I
>>> did it).
>>=20
>> Not any better, but easier for me to get your patches integrated,
>> as I'm reviewing your patches slowly. Finding other reviewers
>> would certainly help.
>
> No problem, I'll wait for your review. Merging parts of the series does n=
ot=20
> help much because the whole series is needed for vt8231 which is prerequi=
site=20
> for pegasos2 so eventually all of these are needed so it does not matter =
if=20
> this one patch gets in earlier or later.
>
> Not sure who could help with review. Maybe Jiaxun or Huacai as this is us=
ed=20
> by fuloong2e so they might be interested and could have info on this chip=
=2E=20
> Most of these patches just cleaning up the vt82c686b and adding some miss=
ing=20
> features so these can be reused by the vt8231 model in last 3 patches (wh=
ich=20
> is very similar to 686b only some reg addresses and ids seem to be differ=
ent=20
> for what we are concerned).

Ping? There are still a few patches needing review:

http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D223512

Jiaxun, Hiacai, or anybody else could you please help reviewing or testing=
=20
if this works with fuloong2e?

Thank you,
BALATON Zoltan

>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> ---
>>>>> =A0hw/isa/vt82c686.c=A0=A0 | 20 ++++++++++++++++++++
>>>>> =A0hw/mips/fuloong2e.c | 29 +++++------------------------
>>>>> =A02 files changed, 25 insertions(+), 24 deletions(-)
>>>>>=20
>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>> index 58c0bba1d0..5df9be8ff4 100644
>>>>> --- a/hw/isa/vt82c686.c
>>>>> +++ b/hw/isa/vt82c686.c
>>>>> @@ -16,6 +16,11 @@
>>>>> =A0#include "hw/qdev-properties.h"
>>>>> =A0#include "hw/isa/isa.h"
>>>>> =A0#include "hw/isa/superio.h"
>>>>> +#include "hw/intc/i8259.h"
>>>>> +#include "hw/irq.h"
>>>>> +#include "hw/dma/i8257.h"
>>>>> +#include "hw/timer/i8254.h"
>>>>> +#include "hw/rtc/mc146818rtc.h"
>>>>> =A0#include "migration/vmstate.h"
>>>>> =A0#include "hw/isa/apm.h"
>>>>> =A0#include "hw/acpi/acpi.h"
>>>>> @@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState,
>>>>> VT82C686B_ISA)
>>>>>=20
>>>>> =A0struct VT82C686BISAState {
>>>>> =A0=A0=A0=A0 PCIDevice dev;
>>>>> +=A0=A0=A0 qemu_irq cpu_intr;
>>>>> =A0=A0=A0=A0 SuperIOConfig superio_cfg;
>>>>> =A0};
>>>>>=20
>>>>> +static void via_isa_request_i8259_irq(void *opaque, int irq, int lev=
el)
>>>>> +{
>>>>> +=A0=A0=A0 VT82C686BISAState *s =3D opaque;
>>>>> +=A0=A0=A0 qemu_set_irq(s->cpu_intr, level);
>>>>> +}
>>>>> +
>>>>> =A0static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t val, int len)
>>>>> =A0{
>>>>> @@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d,
>>>>> Error **errp)
>>>>> =A0=A0=A0=A0 VT82C686BISAState *s =3D VT82C686B_ISA(d);
>>>>> =A0=A0=A0=A0 DeviceState *dev =3D DEVICE(d);
>>>>> =A0=A0=A0=A0 ISABus *isa_bus;
>>>>> +=A0=A0=A0 qemu_irq *isa_irq;
>>>>> =A0=A0=A0=A0 int i;
>>>>>=20
>>>>> +=A0=A0=A0 qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>>>=20
>>>> Why not use the SysBus API?
>>>=20
>>> How? This is a PCIDevice not a SysBusDevice.
>>=20
>> Indeed :)
>>=20
>>>>> +=A0=A0=A0 isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, =
s, 1);
>>>>> =A0=A0=A0=A0 isa_bus =3D isa_bus_new(dev, get_system_memory(),
>>>>> pci_address_space_io(d),
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 &error_fatal);
>>>>=20
>>>> Isn't it get_system_memory() -> pci_address_space(d)?
>>>=20
>>> I don't really know. Most other places that create an isa bus seem to
>>> also use get_system_memory(), only piix4 uses pci_address_space(dev) so
>>> I thought if those others are OK this should be too.
>>=20
>> I'm not a PCI expert but my understanding is PCI device functions are
>> restricted to the PCI bus address space. The host bridge may map this
>> space within the host.
>>=20
>> QEMU might be using get_system_memory() because for some host bridge
>> the mapping is not implemented so it was easier this way?
>
> Maybe, also one less indirection which if not really needed is a good thi=
ng=20
> for performance so unless it's found to be needed to use another address=
=20
> space here I'm happy with this as it matches what other similar devices d=
o=20
> and it seems to work. Maybe a separate address space is only really neede=
d if=20
> we have an iommu?
>
> Regards,
> BALATON Zoltan
--1117279078-261445064-1612209748=:9444--

