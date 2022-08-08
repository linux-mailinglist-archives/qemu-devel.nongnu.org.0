Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111858C897
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:50:19 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2D4-0007za-Ai
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL26d-0000SU-RT; Mon, 08 Aug 2022 08:43:39 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL26Y-0007Cm-LE; Mon, 08 Aug 2022 08:43:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B6D60746E07;
 Mon,  8 Aug 2022 14:43:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 65F1074638A; Mon,  8 Aug 2022 14:43:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6426B745702;
 Mon,  8 Aug 2022 14:43:31 +0200 (CEST)
Date: Mon, 8 Aug 2022 14:43:31 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 05/22] ppc/ppc405: Introduce a PPC405 SoC
In-Reply-To: <20220808102734.133084-6-clg@kaod.org>
Message-ID: <ea7b62be-5550-3e67-cd28-d7ab44a11ace@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-6-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-691453492-1659962611=:47322"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-691453492-1659962611=:47322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> It is an initial model to start QOMification of the PPC405 board.
> QOM'ified devices will be reintroduced one by one. Start with the
> memory regions, which name prefix is changed to "ppc405".
>
> Also, initialize only one RAM bank. The second bank is a dummy one
> (zero size) which is here to match the hard coded number of banks in
> ppc405ep_init().
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h        | 16 ++++++++++++++++
> hw/ppc/ppc405_boards.c | 23 ++++++++++++-----------
> hw/ppc/ppc405_uc.c     | 40 ++++++++++++++++++++++++++++++++++++++++
> 3 files changed, 68 insertions(+), 11 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 83f156f585c8..66dc21cdfed8 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -25,6 +25,7 @@
> #ifndef PPC405_H
> #define PPC405_H
>
> +#include "qom/object.h"
> #include "hw/ppc/ppc4xx.h"
>
> #define PPC405EP_SDRAM_BASE 0x00000000
> @@ -62,6 +63,21 @@ struct ppc4xx_bd_info_t {
>     uint32_t bi_iic_fast[2];
> };
>
> +#define TYPE_PPC405_SOC "ppc405-soc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
> +
> +struct Ppc405SoCState {
> +    /* Private */
> +    DeviceState parent_obj;
> +
> +    /* Public */
> +    MemoryRegion ram_banks[2];
> +    hwaddr ram_bases[2], ram_sizes[2];
> +
> +    MemoryRegion *dram_mr;
> +    hwaddr ram_size;
> +};
> +
> /* PowerPC 405 core */
> ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index c6fa559b03d9..1dc5065fcc1d 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -57,6 +57,8 @@ struct Ppc405MachineState {
>     /* Private */
>     MachineState parent_obj;
>     /* Public */
> +
> +    Ppc405SoCState soc;
> };
>
> /*****************************************************************************/
> @@ -232,11 +234,10 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>
> static void ppc405_init(MachineState *machine)
> {
> +    Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>     const char *kernel_filename = machine->kernel_filename;
>     PowerPCCPU *cpu;
> -    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
> -    hwaddr ram_bases[2], ram_sizes[2];
>     MemoryRegion *sysmem = get_system_memory();
>     DeviceState *uicdev;
>
> @@ -247,16 +248,16 @@ static void ppc405_init(MachineState *machine)
>         exit(EXIT_FAILURE);
>     }
>
> -    /* XXX: fix this */
> -    memory_region_init_alias(&ram_memories[0], NULL, "ef405ep.ram.alias",
> -                             machine->ram, 0, machine->ram_size);
> -    ram_bases[0] = 0;
> -    ram_sizes[0] = machine->ram_size;
> -    memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
> -    ram_bases[1] = 0x00000000;
> -    ram_sizes[1] = 0x00000000;
> +    object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
> +                            TYPE_PPC405_SOC);
> +    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
> +                             machine->ram_size, &error_fatal);
> +    object_property_set_link(OBJECT(&ppc405->soc), "dram",
> +                             OBJECT(machine->ram), &error_abort);
> +    qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>
> -    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
> +    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_banks, ppc405->soc.ram_bases,
> +                        ppc405->soc.ram_sizes,
>                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>
>     /* allocate and load BIOS */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index d6420c88d3a6..adadb3a0ae08 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -30,6 +30,7 @@
> #include "hw/ppc/ppc.h"
> #include "hw/i2c/ppc4xx_i2c.h"
> #include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> #include "ppc405.h"
> #include "hw/char/serial.h"
> #include "qemu/timer.h"
> @@ -1530,3 +1531,42 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>
>     return cpu;
> }
> +
> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    Ppc405SoCState *s = PPC405_SOC(dev);
> +
> +    /* Initialize only one bank */
> +    s->ram_bases[0] = 0;
> +    s->ram_sizes[0] = s->ram_size;
> +    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
> +                             "ppc405.sdram0", s->dram_mr,
> +                             s->ram_bases[0], s->ram_sizes[0]);
> +}
> +
> +static Property ppc405_soc_properties[] = {
> +    DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

I'm not sure why we need to duplicate these in the soc if they are always 
the same as machine->ram and machine->ram_size. Is it theoretically 
possible to have a soc where it uses ram that's not the whole ram? If not 
then you could just uose machine which is accessible either as 
current_machine or qdev_get_machine() (also the parent of out soc but we 
don't know how to get that). If setting ram this way is still desired do 
we separately need to set its size or we could use memory_region_size() 
instead?

> +
> +static void ppc405_soc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_soc_realize;
> +    dc->user_creatable = false;

May need a comment explaining why user_creatable = false. (Also for all 
other similar lines in other patches, I won't repeat this there.)

Regards,
BALATON Zoltan

> +    device_class_set_props(dc, ppc405_soc_properties);
> +}
> +
> +static const TypeInfo ppc405_types[] = {
> +    {
> +        .name           = TYPE_PPC405_SOC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405SoCState),
> +        .class_init     = ppc405_soc_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(ppc405_types)
>
--3866299591-691453492-1659962611=:47322--

