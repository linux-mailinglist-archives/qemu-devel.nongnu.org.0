Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6C2D89C5
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:36:56 +0100 (CET)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koAhL-0007qK-FM
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ko9jj-0004zh-8F; Sat, 12 Dec 2020 13:35:20 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ko9jd-0007pZ-H5; Sat, 12 Dec 2020 13:35:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 476107470E5;
 Sat, 12 Dec 2020 18:17:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0B23E7470E1; Sat, 12 Dec 2020 18:17:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0A1237470DD;
 Sat, 12 Dec 2020 18:17:42 +0100 (CET)
Date: Sat, 12 Dec 2020 18:17:42 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/8] hw/ppc/sam460ex: Drop use of ppcuic_init()
In-Reply-To: <20201212001537.24520-6-peter.maydell@linaro.org>
Message-ID: <6c6c535-1b6a-d2ff-fa22-6af89789b6a@eik.bme.hu>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-6-peter.maydell@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sat, 12 Dec 2020, Peter Maydell wrote:
> Switch the sam460ex board to directly creating and configuring the
> UIC, rather than doing it via the old ppcuic_init() helper function.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> hw/ppc/sam460ex.c | 70 ++++++++++++++++++++++++++++++++++++-----------
> 1 file changed, 54 insertions(+), 16 deletions(-)

More than 3 times as much than before, qdev seems to be overly verbose and 
less readable but if that's the preferred way then be it.

> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 14e6583eb0d..9cf7aad3833 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -39,6 +39,7 @@
> #include "hw/usb/hcd-ehci.h"
> #include "hw/ppc/fdt.h"
> #include "hw/qdev-properties.h"
> +#include "hw/intc/ppc-uic.h"
>
> #include <libfdt.h>
>
> @@ -281,7 +282,6 @@ static void sam460ex_init(MachineState *machine)
>     hwaddr ram_bases[SDRAM_NR_BANKS] = {0};
>     hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
>     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
> -    qemu_irq *irqs, *uic[4];
>     PCIBus *pci_bus;
>     PowerPCCPU *cpu;
>     CPUPPCState *env;
> @@ -293,6 +293,9 @@ static void sam460ex_init(MachineState *machine)
>     struct boot_info *boot_info;
>     uint8_t *spd_data;
>     int success;
> +    qemu_irq mal_irqs[4];
> +    DeviceState *uic[4];
> +    int i;

Maybe keep this where it was above instead of moving to the end and keep 
DeviceState *uic[4]; first so the two others that would be removed later 
are next to each other (just to make patches simpler and keep the order of 
variables which may be roughly as they appear below).

>     cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>     env = &cpu->env;
> @@ -312,13 +315,35 @@ static void sam460ex_init(MachineState *machine)
>     ppc4xx_plb_init(env);
>
>     /* interrupt controllers */
> -    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
> -    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
> -    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];

Unrelated to this, but I wonder why do we need these casts? Could we just 
define env->irq_inputs as qemu_irq array in the first place? It's now void 
** which according to the comment next to it may be because once it may 
have been used for different implementations but by now maybe it's only 
used for what its name implies? I haven't checked though if it could be 
cleaned up just raising it if anyone's interested to have a look as there 
are such casts at a lot of other places too.

> -    uic[0] = ppcuic_init(env, irqs, 0xc0, 0, 1);
> -    uic[1] = ppcuic_init(env, &uic[0][30], 0xd0, 0, 1);
> -    uic[2] = ppcuic_init(env, &uic[0][10], 0xe0, 0, 1);
> -    uic[3] = ppcuic_init(env, &uic[0][16], 0xf0, 0, 1);
> +    for (i = 0; i < ARRAY_SIZE(uic); i++) {
> +        SysBusDevice *sbd;

There's already a SysBusDevice *sbdev; defined for similar cases that you 
could reuse here.

> +        /*
> +         * Number of the first of the two consecutive IRQ inputs on UIC 0
> +         * to connect the INT and CINT outputs of UIC n to. The entry

This comment confused me a bit, while it's precise is it possible to say 
it in a simpler way? I think these are how uic[1-3] are cascaded through 
uic[0] similar to how the PICs in a PC are cascaded.

> +         * for UIC 0 is ignored, because it connects to the CPU.
> +         */
> +        const int input_ints[] = { -1, 30, 10, 16 };
> +
> +        uic[i] = qdev_new(TYPE_PPC_UIC);
> +        sbd = SYS_BUS_DEVICE(uic[i]);
> +
> +        qdev_prop_set_uint32(uic[i], "dcr-base", 0xc0 + i * 0x10);
> +        object_property_set_link(OBJECT(uic[i]), "cpu", OBJECT(cpu),
> +                                 &error_fatal);
> +        sysbus_realize_and_unref(sbd, &error_fatal);
> +
> +        if (i == 0) {
> +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> +                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
> +                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +        } else {
> +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> +                               qdev_get_gpio_in(uic[0], input_ints[i]));
> +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> +                               qdev_get_gpio_in(uic[0], input_ints[i] + 1));
> +        }
> +    }
>
>     /* SDRAM controller */
>     /* put all RAM on first bank because board has one slot
> @@ -331,7 +356,8 @@ static void sam460ex_init(MachineState *machine)
>                       ram_bases, ram_sizes, 1);
>
>     /* IIC controllers and devices */
> -    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700, uic[0][2]);
> +    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
> +                               qdev_get_gpio_in(uic[0], 2));
>     i2c = PPC4xx_I2C(dev)->bus;
>     /* SPD EEPROM on RAM module */
>     spd_data = spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
> @@ -341,7 +367,8 @@ static void sam460ex_init(MachineState *machine)
>     /* RTC */
>     i2c_slave_create_simple(i2c, "m41t80", 0x68);
>
> -    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800, uic[0][3]);
> +    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800,
> +                               qdev_get_gpio_in(uic[0], 3));
>
>     /* External bus controller */
>     ppc405_ebc_init(env);
> @@ -356,7 +383,14 @@ static void sam460ex_init(MachineState *machine)
>     ppc4xx_sdr_init(env);
>
>     /* MAL */
> -    ppc4xx_mal_init(env, 4, 16, &uic[2][3]);
> +    /*
> +     * TODO if the MAL were a proper QOM device we would not need to
> +     * copy its qemu_irqs into an array for ppc4xx_mal_init()'s benefit.
> +     */

It's not a todo for sam460ex so maybe put it in the file where mal is if 
you want to note it somewhere? (Other sites using the mal may also need 
updating not just this one when this is cleaned up.)

I'll reply more about testing in the cover letter.

Regards,
BALATON Zoltan

> +    for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
> +        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
> +    }
> +    ppc4xx_mal_init(env, 4, 16, mal_irqs);
>
>     /* DMA */
>     ppc4xx_dma_init(env, 0x200);
> @@ -369,21 +403,23 @@ static void sam460ex_init(MachineState *machine)
>     memory_region_add_subregion(address_space_mem, 0x400000000LL, l2cache_ram);
>
>     /* USB */
> -    sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
> +    sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400,
> +                         qdev_get_gpio_in(uic[2], 29));
>     dev = qdev_new("sysbus-ohci");
>     qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
>     qdev_prop_set_uint32(dev, "num-ports", 6);
>     sbdev = SYS_BUS_DEVICE(dev);
>     sysbus_realize_and_unref(sbdev, &error_fatal);
>     sysbus_mmio_map(sbdev, 0, 0x4bffd0000);
> -    sysbus_connect_irq(sbdev, 0, uic[2][30]);
> +    sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(uic[2], 30));
>     usb_create_simple(usb_bus_find(-1), "usb-kbd");
>     usb_create_simple(usb_bus_find(-1), "usb-mouse");
>
>     /* PCI bus */
>     ppc460ex_pcie_init(env);
>     /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
> -    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
> +    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000,
> +                               qdev_get_gpio_in(uic[1], 0));
>     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>     if (!pci_bus) {
>         error_report("couldn't create PCI controller!");
> @@ -405,12 +441,14 @@ static void sam460ex_init(MachineState *machine)
>     /* SoC has 4 UARTs
>      * but board has only one wired and two are present in fdt */
>     if (serial_hd(0) != NULL) {
> -        serial_mm_init(address_space_mem, 0x4ef600300, 0, uic[1][1],
> +        serial_mm_init(address_space_mem, 0x4ef600300, 0,
> +                       qdev_get_gpio_in(uic[1], 1),
>                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
>                        DEVICE_BIG_ENDIAN);
>     }
>     if (serial_hd(1) != NULL) {
> -        serial_mm_init(address_space_mem, 0x4ef600400, 0, uic[0][1],
> +        serial_mm_init(address_space_mem, 0x4ef600400, 0,
> +                       qdev_get_gpio_in(uic[0], 1),
>                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
>                        DEVICE_BIG_ENDIAN);
>     }
>

