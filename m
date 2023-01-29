Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C767FF98
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 15:40:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM8qL-0005h5-J0; Sun, 29 Jan 2023 09:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pM8qI-0005eZ-1n; Sun, 29 Jan 2023 09:39:39 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pM8qG-0005UP-2b; Sun, 29 Jan 2023 09:39:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 193A774633D;
 Sun, 29 Jan 2023 15:37:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CBF4974632B; Sun, 29 Jan 2023 15:37:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C9E0F7456E3;
 Sun, 29 Jan 2023 15:37:05 +0100 (CET)
Date: Sun, 29 Jan 2023 15:37:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH 4/7] hw/i386/pc_q35: Resolve redundant q35_host
 variable
In-Reply-To: <7F5DBDBA-42A7-4EEC-B5CC-6D96B75231FF@gmail.com>
Message-ID: <6871b9eb-defd-bdcd-9cd7-90e7cacfed4f@eik.bme.hu>
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-5-shentey@gmail.com>
 <0f328d9e-787c-bf8f-4f7f-caacca70a250@eik.bme.hu>
 <7F5DBDBA-42A7-4EEC-B5CC-6D96B75231FF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Sun, 29 Jan 2023, Bernhard Beschow wrote:
> Am 27. Januar 2023 19:22:49 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Fri, 27 Jan 2023, Bernhard Beschow wrote:
>>> The variable is redundant to "phb" and is never used by its real type.
>>
>> Also replace qdev_get_machine() with reference already passed to init function. (Maybe worth mentioning in commit message even if too small change for a separate patch.)
>
> Indeed, this can easily be missed. A separate patch allows for clean justification.

I think just adding a sentence to commit message to clarify it is enough 
no need to split it out but up to you.

Regards,
BALATON Zoltan

>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> hw/i386/pc_q35.c | 22 ++++++++++------------
>>> 1 file changed, 10 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>> index 83c57c6eb1..dc94ce1081 100644
>>> --- a/hw/i386/pc_q35.c
>>> +++ b/hw/i386/pc_q35.c
>>> @@ -118,7 +118,6 @@ static void pc_q35_init(MachineState *machine)
>>>     PCMachineState *pcms = PC_MACHINE(machine);
>>>     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>     X86MachineState *x86ms = X86_MACHINE(machine);
>>> -    Q35PCIHost *q35_host;
>>>     PCIHostState *phb;
>>
>> The phb variable itself is only used once to get the bus from it and it's mostly cast to Object * so maybe store it in a variable of that type to remove most of the casts and IMO you can also remove PCIHostState *phb and just use:
>>
>> host_bus = PCI_HOST_BRIDGE(phost)->bus;
>
> Maybe one could also fish out the PCI bus using qdev_get_child_bus() like we do in pc_piix for the ISA bus already. Hm...
>
> Best regards,
> Bernhard
>>
>> Regards,
>> BALATON Zoltan
>>
>>>     PCIBus *host_bus;
>>>     PCIDevice *lpc;
>>> @@ -206,10 +205,10 @@ static void pc_q35_init(MachineState *machine)
>>>     }
>>>
>>>     /* create pci host bus */
>>> -    q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>> +    phb = PCI_HOST_BRIDGE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>>
>>>     if (pcmc->pci_enabled) {
>>> -        pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
>>> +        pci_hole64_size = object_property_get_uint(OBJECT(phb),
>>>                                                    PCI_HOST_PROP_PCI_HOLE64_SIZE,
>>>                                                    &error_abort);
>>>     }
>>> @@ -218,22 +217,21 @@ static void pc_q35_init(MachineState *machine)
>>>     pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>>>                    pci_hole64_size);
>>>
>>> -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>>> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
>>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_RAM_MEM,
>>>                              OBJECT(ram_memory), NULL);
>>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
>>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_PCI_MEM,
>>>                              OBJECT(pci_memory), NULL);
>>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
>>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_SYSTEM_MEM,
>>>                              OBJECT(get_system_memory()), NULL);
>>> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
>>> +    object_property_set_link(OBJECT(phb), MCH_HOST_PROP_IO_MEM,
>>>                              OBJECT(system_io), NULL);
>>> -    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE,
>>> +    object_property_set_int(OBJECT(phb), PCI_HOST_BELOW_4G_MEM_SIZE,
>>>                             x86ms->below_4g_mem_size, NULL);
>>> -    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SIZE,
>>> +    object_property_set_int(OBJECT(phb), PCI_HOST_ABOVE_4G_MEM_SIZE,
>>>                             x86ms->above_4g_mem_size, NULL);
>>>     /* pci */
>>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
>>> -    phb = PCI_HOST_BRIDGE(q35_host);
>>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
>>>     host_bus = phb->bus;
>>>     /* create ISA bus */
>>>     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
>>>
>
>

