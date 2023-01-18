Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FE672461
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 18:04:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIBpw-0006ik-UA; Wed, 18 Jan 2023 12:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pIBpQ-0006PP-G3; Wed, 18 Jan 2023 12:02:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pIBpO-0004it-7b; Wed, 18 Jan 2023 12:02:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F0ECF7457E7;
 Wed, 18 Jan 2023 17:59:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A6614745706; Wed, 18 Jan 2023 17:59:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A2FD07456E3;
 Wed, 18 Jan 2023 17:59:55 +0100 (CET)
Date: Wed, 18 Jan 2023 17:59:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/2] hw/ppc/pegasos2: Extract via_vt8231_create()
 helper
In-Reply-To: <79d72fb1-4c3b-a06e-495d-d99efc15b0f5@linaro.org>
Message-ID: <e5ea5f10-9d62-7f82-fb98-45f13caf3443@eik.bme.hu>
References: <20230117201640.88365-1-philmd@linaro.org>
 <20230117201640.88365-3-philmd@linaro.org>
 <187a86f4-64fc-3ba1-1a20-a19c33aa82f9@eik.bme.hu>
 <79d72fb1-4c3b-a06e-495d-d99efc15b0f5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-503629420-1674061195=:90855"
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

--3866299591-503629420-1674061195=:90855
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 18 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 17/1/23 22:17, BALATON Zoltan wrote:
>> On Tue, 17 Jan 2023, Philippe Mathieu-Daudé wrote:
>>> Simplify a bit pegasos2_init() by extracting the VIA southbridge
>>> creation code into a new via_vt8231_create() helper.
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> hw/ppc/pegasos2.c | 33 +++++++++++++++++++++------------
>>> 1 file changed, 21 insertions(+), 12 deletions(-)
>>> 
>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>> index ac69aee099..445cb5ef31 100644
>>> --- a/hw/ppc/pegasos2.c
>>> +++ b/hw/ppc/pegasos2.c
>>> @@ -96,6 +96,25 @@ static void pegasos2_cpu_reset(void *opaque)
>>>     }
>>> }
>>> 
>>> +static PCIDevice *via_vt8231_create(MachineState *machine, PCIBus 
>>> *pci_bus)
>>> +{
>>> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
>>> +    PCIDevice *dev, *via;
>>> +
>>> +    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
>>> +                                          true, TYPE_VT8231_ISA);
>>> +    object_property_add_alias(OBJECT(machine), "rtc-time",
>>> +                              object_resolve_path_component(OBJECT(via), 
>>> "rtc"),
>>> +                              "date");
>>> +    qdev_connect_gpio_out(DEVICE(via), 0,
>>> +                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>>> +
>>> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>>> +    pci_ide_create_devs(dev);
>>> +
>>> +    return via;
>>> +}
>>> +
>>> static I2CBus *via_i2c_bus(PCIDevice *via)
>>> {
>>>     PCIDevice *dev;
>>> @@ -110,7 +129,7 @@ static void pegasos2_init(MachineState *machine)
>>>     CPUPPCState *env;
>>>     MemoryRegion *rom = g_new(MemoryRegion, 1);
>>>     PCIBus *pci_bus;
>>> -    PCIDevice *dev, *via;
>>> +    PCIDevice *via;
>>>     const char *fwname = machine->firmware ?: PROM_FILENAME;
>>>     char *filename;
>>>     int sz;
>>> @@ -166,17 +185,7 @@ static void pegasos2_init(MachineState *machine)
>>>     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>>> 
>>>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>>> -    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), 
>>> true,
>>> -                                          TYPE_VT8231_ISA);
>>> -    object_property_add_alias(OBJECT(machine), "rtc-time",
>>> -                              object_resolve_path_component(OBJECT(via),
>>> -                                                            "rtc"),
>> 
>> Is this series to help any later patches or is it proposed on its own? In 
>> the latter case I don't see how this would improve it much. The only useful 
>> change in the series is removing the unnecessary line break before "rtc"); 
>> here, otherwise moving patts of this init routine to separate functions 
>> does not make it simpler just makes you jump around instead of being able 
>> to read it linearly. So if this makes it possible for later patches to move 
>> some of it elsewhere then OK otherwise I'd say I'm OK with how it is now, 
>> it's just the normal unreadable QOM stuff you see everywhere after removing 
>> legacy init functions.
>
> Difference of mindset I suppose, as you clearly type linearly :)
>
> I consider logical blocks of hardware, and the southbridge is one of
> them. So I thought moving components connected to the 'machine' via
> the southbridge in a separate function would be clearer for the
> overall community (this file is not exclusively used by you, and
> can potentially used as example to build a machine).

I understand but you cannot clearly move all of it out to one function but 
proposed to introduce two small functions with leaving the spd data 
creation in board code. In my view only the line creating the 'via' 
instance is one unit, he rest connects the instance to the machine (the 
rtc alias adds property to the _machine_, pci_ide_create_devs(dev) is 
usually part of boards and the spd data is also not part of the 'via' just 
uses the i2c bus it provides). So for me it's more logical to have these 
in the board init func than in a via_init func as it's not initialises the 
'via' itself just uses the one created before. Creating the 'via' instance 
is now just one line after moving all the subfunctions in the via model. 
It's still in one block separated by comments so i think adding functions 
to this would not make it clearer and legacy init functions are also 
deprecated in favour of plain QOM in board init lately.

> Anyhow I don't mind much.

In that case I'd leave it as it is with the small readability improvement 
I've sent a v2 of fixing the typos and adding your R-b, unless others 
think splitting some part of this in separate functions would be better.

Regards,
BALATON Zoltan
--3866299591-503629420-1674061195=:90855--

