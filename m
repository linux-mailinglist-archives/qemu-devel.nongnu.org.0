Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8367EE2E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 20:33:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLUSy-0002KG-6Y; Fri, 27 Jan 2023 14:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pLUSw-0002JX-Im; Fri, 27 Jan 2023 14:32:50 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pLUSv-0006C5-03; Fri, 27 Jan 2023 14:32:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5FB1E74634B;
 Fri, 27 Jan 2023 20:30:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 24871745706; Fri, 27 Jan 2023 20:30:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 22C7A7456E3;
 Fri, 27 Jan 2023 20:30:21 +0100 (CET)
Date: Fri, 27 Jan 2023 20:30:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH 6/7] hw/i386/pc_{q35, piix}: Minimize usage of
 get_system_memory()
In-Reply-To: <20230127164718.98156-7-shentey@gmail.com>
Message-ID: <6858e30b-cd88-0ba3-e64e-0657786f8c55@eik.bme.hu>
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-7-shentey@gmail.com>
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

On Fri, 27 Jan 2023, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Why? I'd rather replace locals with direct call to function as it's not 
expensive (just returns a global) and adding a local name to it is not 
much shorter so why do that?

Regards,
BALATON Zoltan

> ---
> hw/i386/pc_piix.c | 2 +-
> hw/i386/pc_q35.c  | 7 ++++---
> 2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ee9d9a4175..5bde4533cc 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -241,7 +241,7 @@ static void pc_init1(MachineState *machine,
>         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>     } else {
>         pci_bus = NULL;
> -        isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
> +        isa_bus = isa_bus_new(NULL, system_memory, system_io,
>                               &error_abort);
>         i8257_dma_init(isa_bus, 0);
>         pcms->hpet_enabled = false;
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a97846ab9b..b97979bebb 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -124,6 +124,7 @@ static void pc_q35_init(MachineState *machine)
>     DeviceState *lpc_dev;
>     BusState *idebus[MAX_SATA_PORTS];
>     ISADevice *rtc_state;
> +    MemoryRegion *system_memory = get_system_memory();
>     MemoryRegion *system_io = get_system_io();
>     MemoryRegion *pci_memory;
>     MemoryRegion *rom_memory;
> @@ -191,7 +192,7 @@ static void pc_q35_init(MachineState *machine)
>         rom_memory = pci_memory;
>     } else {
>         pci_memory = NULL;
> -        rom_memory = get_system_memory();
> +        rom_memory = system_memory;
>     }
>
>     pc_guest_info_init(pcms);
> @@ -214,7 +215,7 @@ static void pc_q35_init(MachineState *machine)
>     }
>
>     /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> +    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
>                    pci_hole64_size);
>
>     object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
> @@ -223,7 +224,7 @@ static void pc_q35_init(MachineState *machine)
>     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_PCI_MEM,
>                              OBJECT(pci_memory), NULL);
>     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_SYSTEM_MEM,
> -                             OBJECT(get_system_memory()), NULL);
> +                             OBJECT(system_memory), NULL);
>     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_IO_MEM,
>                              OBJECT(system_io), NULL);
>     object_property_set_int(OBJECT(phb), PCI_HOST_BELOW_4G_MEM_SIZE,
>

