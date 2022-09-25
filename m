Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9755E91DB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:26:27 +0200 (CEST)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNu5-0002eg-UR
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNoA-0004xS-4m; Sun, 25 Sep 2022 05:20:18 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:42395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNo7-0004dT-VP; Sun, 25 Sep 2022 05:20:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5A40E74633D;
 Sun, 25 Sep 2022 11:20:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1818174632C; Sun, 25 Sep 2022 11:20:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 16AD1746307;
 Sun, 25 Sep 2022 11:20:12 +0200 (CEST)
Date: Sun, 25 Sep 2022 11:20:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 04/10] mac_newworld: Simplify creation of Uninorth devices
In-Reply-To: <4b295acb-302b-657f-736b-c8c36a4bc3db@ilande.co.uk>
Message-ID: <ca1b7456-c5a5-ab31-19ce-d7dfcdc6a4@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <29ab3c7737866916760f824547bd1beed0c6806b.1663368422.git.balaton@eik.bme.hu>
 <4b295acb-302b-657f-736b-c8c36a4bc3db@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
> On 17/09/2022 00:07, BALATON Zoltan wrote:
>> Avoid open coding sysbus_create_simple where not necessary and
>> reorganise code a bit to avoid some casts to make the code more
>> readable.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 50 ++++++++++++++++---------------------------
>>   1 file changed, 19 insertions(+), 31 deletions(-)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 6bc3bd19be..1038477793 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -228,13 +228,6 @@ static void ppc_core99_init(MachineState *machine)
>>           }
>>       }
>>   -    /* UniN init */
>> -    dev = qdev_new(TYPE_UNI_NORTH);
>> -    s = SYS_BUS_DEVICE(dev);
>> -    sysbus_realize_and_unref(s, &error_fatal);
>> -    memory_region_add_subregion(get_system_memory(), 0xf8000000,
>> -                                sysbus_mmio_get_region(s, 0));
>
> Curious - is there a reason that the initialisation of UniNorth is moved to 
> later in the file?

To move it togerher with the other parts of the uninorth. Creating this 
one here maybe was needed before for some reason but apparently nothing 
needs it until later so creating all the pci stuff together is more 
logical.

>>       openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
>>       for (i = 0; i < machine->smp.cpus; i++) {
>>           /* Mac99 IRQ connection between OpenPIC outputs pins
>> @@ -275,56 +268,51 @@ static void ppc_core99_init(MachineState *machine)
>>           }
>>       }
>>   +    /* UniN init */
>> +    sysbus_create_simple(TYPE_UNI_NORTH, 0xf8000000, NULL);
>> +
>
> I've had a look at sysbus_create_simple() as I'm not overly familiar with it, 
> but this is one to add to the legacy functions we really shouldn't be using 
> these days.
>
> Obvious flaws from looking at the code are i) it attempts to map/wire devices 
> in a _simple() function in contrast to all the other _simple() functions and 
> ii) it assumes that properties are ordered (we can't guarantee this, as per 
> the current array property breakage). So please keep this as-is.

I don't think creating devices with qdev calls is easier to read than 
sysbud_create_simple but OK, I'll drop this part then.

Regards,
BALATON Zoltan

>>       if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
>> +        machine_arch = ARCH_MAC99_U3;
>>           /* 970 gets a U3 bus */
>>           /* Uninorth AGP bus */
>> -        dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
>> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> -        uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
>> -        s = SYS_BUS_DEVICE(dev);
>> +        s = SYS_BUS_DEVICE(sysbus_create_simple(TYPE_U3_AGP_HOST_BRIDGE,
>> +                                                0xf0800000, NULL));
>> +        uninorth_pci = U3_AGP_HOST_BRIDGE(s);
>> +        sysbus_mmio_map(s, 1, 0xf0c00000);
>>           /* PCI hole */
>>           memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>>                                       sysbus_mmio_get_region(s, 2));
>>           /* Register 8 MB of ISA IO space */
>>           memory_region_add_subregion(get_system_memory(), 0xf2000000,
>>                                       sysbus_mmio_get_region(s, 3));
>> -        sysbus_mmio_map(s, 0, 0xf0800000);
>> -        sysbus_mmio_map(s, 1, 0xf0c00000);
>> -
>> -        machine_arch = ARCH_MAC99_U3;
>>       } else {
>> +        machine_arch = ARCH_MAC99;
>>           /* Use values found on a real PowerMac */
>>           /* Uninorth AGP bus */
>> -        uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
>> -        s = SYS_BUS_DEVICE(uninorth_agp_dev);
>> -        sysbus_realize_and_unref(s, &error_fatal);
>> -        sysbus_mmio_map(s, 0, 0xf0800000);
>> -        sysbus_mmio_map(s, 1, 0xf0c00000);
>> +        uninorth_agp_dev = 
>> sysbus_create_simple(TYPE_UNI_NORTH_AGP_HOST_BRIDGE,
>> +                                                0xf0800000, NULL);
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_agp_dev), 1, 0xf0c00000);
>
> Yeah sysbus_create_simple() makes this uglier.
>
>>           /* Uninorth internal bus */
>> -        uninorth_internal_dev = qdev_new(
>> -                                TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
>> -        s = SYS_BUS_DEVICE(uninorth_internal_dev);
>> -        sysbus_realize_and_unref(s, &error_fatal);
>> -        sysbus_mmio_map(s, 0, 0xf4800000);
>> -        sysbus_mmio_map(s, 1, 0xf4c00000);
>> +        uninorth_internal_dev = sysbus_create_simple(
>> + 
>> TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE,
>> +                                                     0xf4800000, NULL);
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_internal_dev), 1, 
>> 0xf4c00000);
>>             /* Uninorth main bus */
>>           dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
>>           qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
>> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>           uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
>>           s = SYS_BUS_DEVICE(dev);
>> +        sysbus_realize_and_unref(s, &error_fatal);
>> +        sysbus_mmio_map(s, 0, 0xf2800000);
>> +        sysbus_mmio_map(s, 1, 0xf2c00000);
>>           /* PCI hole */
>>           memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
>>                                       sysbus_mmio_get_region(s, 2));
>>           /* Register 8 MB of ISA IO space */
>>           memory_region_add_subregion(get_system_memory(), 0xf2000000,
>>                                       sysbus_mmio_get_region(s, 3));
>> -        sysbus_mmio_map(s, 0, 0xf2800000);
>> -        sysbus_mmio_map(s, 1, 0xf2c00000);
>> -
>> -        machine_arch = ARCH_MAC99;
>>       }
>>         machine->usb |= defaults_enabled() && !machine->usb_disabled;
>
> ATB,
>
> Mark.
>
>

