Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7468AAEE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKTG-00041d-Hv; Sat, 04 Feb 2023 10:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pOKTC-00040z-MX; Sat, 04 Feb 2023 10:28:50 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pOKTA-0000lZ-8R; Sat, 04 Feb 2023 10:28:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A28EC746392;
 Sat,  4 Feb 2023 16:26:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 61BB974633D; Sat,  4 Feb 2023 16:26:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 605737456E3;
 Sat,  4 Feb 2023 16:26:13 +0100 (CET)
Date: Sat, 4 Feb 2023 16:26:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 6/9] hw/i386/pc: Initialize ram_memory variable directly
In-Reply-To: <20230204151027.39007-7-shentey@gmail.com>
Message-ID: <d8ada3a2-c77a-bf77-89e8-c763efdb9b2c@eik.bme.hu>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-7-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-172597582-1675524373=:44293"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-172597582-1675524373=:44293
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Feb 2023, Bernhard Beschow wrote:
> Going through pc_memory_init() seems quite complicated for a simple
> assignment.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> include/hw/i386/pc.h | 1 -
> hw/i386/pc.c         | 2 --
> hw/i386/pc_piix.c    | 4 ++--
> hw/i386/pc_q35.c     | 5 ++---
> 4 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 66e3d059ef..b60b95921b 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -162,7 +162,6 @@ void xen_load_linux(PCMachineState *pcms);
> void pc_memory_init(PCMachineState *pcms,
>                     MemoryRegion *system_memory,
>                     MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory,
>                     uint64_t pci_hole64_size);
> uint64_t pc_pci_hole64_start(void);
> DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..8898cc9961 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -936,7 +936,6 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
> void pc_memory_init(PCMachineState *pcms,
>                     MemoryRegion *system_memory,
>                     MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory,
>                     uint64_t pci_hole64_size)
> {
>     int linux_boot, i;
> @@ -994,7 +993,6 @@ void pc_memory_init(PCMachineState *pcms,
>      * Split single memory region and use aliases to address portions of it,
>      * done for backwards compatibility with older qemus.
>      */
> -    *ram_memory = machine->ram;
>     ram_below_4g = g_malloc(sizeof(*ram_below_4g));
>     memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
>                              0, x86ms->below_4g_mem_size);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5bde4533cc..00ba725656 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
>     if (xen_enabled()) {
>         xen_hvm_init_pc(pcms, &ram_memory);
>     } else {
> +        ram_memory = machine->ram;

Maybe you could just replace the few places it's used with machine->ram 
directly and get rid of the local variable. There seems to be no advantage 
storing it in a local just to use it once (in q35 below) or twice in 
pc-piix. The local name is not even that much shorter so I don't see a 
reason to have it in the first place,

Regards,
BALATON Zoltan

>         if (!pcms->max_ram_below_4g) {
>             pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
>         }
> @@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
>
>     /* allocate ram and load rom/bios */
>     if (!xen_enabled()) {
> -        pc_memory_init(pcms, system_memory,
> -                       rom_memory, &ram_memory, hole64_size);
> +        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
>     } else {
>         pc_system_flash_cleanup_unused(pcms);
>         if (machine->kernel_filename != NULL) {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 8253b49296..88f0981f50 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -129,7 +129,7 @@ static void pc_q35_init(MachineState *machine)
>     MemoryRegion *system_io = get_system_io();
>     MemoryRegion *pci_memory;
>     MemoryRegion *rom_memory;
> -    MemoryRegion *ram_memory;
> +    MemoryRegion *ram_memory = machine->ram;
>     GSIState *gsi_state;
>     ISABus *isa_bus;
>     int i;
> @@ -216,8 +216,7 @@ static void pc_q35_init(MachineState *machine)
>     }
>
>     /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
> -                   pci_hole64_size);
> +    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
>
>     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
>     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>
--3866299591-172597582-1675524373=:44293--

