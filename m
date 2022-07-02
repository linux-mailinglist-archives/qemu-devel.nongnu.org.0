Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C692C563EB3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 07:58:59 +0200 (CEST)
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7W9i-00019Y-Dh
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 01:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7W8D-0000Fw-T1
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 01:57:25 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:55007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7W8A-0003zL-EQ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 01:57:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B10EA1139054A;
 Sat,  2 Jul 2022 07:57:10 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 07:57:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001efc17533-35b1-47c6-9249-192afbf025e7,
 32283016ABE7C641B3A1D9886F1F20E1EE1CEFF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8b3f31c7-3326-2542-03cd-120702cae4bb@kaod.org>
Date: Sat, 2 Jul 2022 07:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] aspeed: Refactor UART init for multi-SoC machines
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <peter.maydell@linaro.org>
References: <20220701200234.68289-1-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220701200234.68289-1-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 47ae7180-82d5-4308-beb3-2b6a59a8dd1b
X-Ovh-Tracer-Id: 16011985526307588902
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffgefgkeevvedvvdffleefheelfffhhfetgeekudeuveffffekjeeiveffledthfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/1/22 22:02, Peter Delevoryas wrote:
> This change moves the code that connects the SoC UART's to serial_hd's
> to the machine.
> 
> It makes each UART a proper child member of the SoC, and then allows the
> machine to selectively initialize the chardev for each UART with a
> serial_hd.
> 
> This should preserve backwards compatibility, but also allow multi-SoC
> boards to completely change the wiring of serial devices from the
> command line to specific SoC UART's.
> 
> This also removes the uart-default property from the SoC, since the SoC
> doesn't need to know what UART is the "default" on the machine anymore.
> 
> I tested this using the images and commands from the previous
> refactoring, and another test image for the ast1030:
> 
>      wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
>      wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
>      wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> 
> Fuji uses UART1:
> 
>      qemu-system-arm -machine fuji-bmc \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -nographic
> 
> ast2600-evb uses uart-default=UART5:
> 
>      qemu-system-arm -machine ast2600-evb \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -serial null -serial mon:stdio -display none
> 
> Wedge100 uses UART3:
> 
>      qemu-system-arm -machine palmetto-bmc \
>          -drive file=wedge100.mtd,format=raw,if=mtd \
>          -serial null -serial null -serial null \
>          -serial mon:stdio -display none
> 
> AST1030 EVB uses UART5:
> 
>      qemu-system-arm -machine ast1030-evb \
>          -kernel Y35BCL.elf -nographic

Looks good. A few comments on the APIs.

> 
> Fixes: 6827ff20b2975 ("hw: aspeed: Init all UART's with serial devices")
> Signed-off-by: Peter Delevoryas <me@pjd.dev>
> ---
>   hw/arm/aspeed.c             | 23 +++++++++++++++----
>   hw/arm/aspeed_ast10x0.c     |  4 ++++
>   hw/arm/aspeed_ast2600.c     |  4 ++++
>   hw/arm/aspeed_soc.c         | 44 ++++++++++++++++++++++++-------------
>   include/hw/arm/aspeed_soc.h |  5 ++++-
>   5 files changed, 60 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6fe9b13548..fdca0abd95 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -26,6 +26,7 @@
>   #include "qemu/error-report.h"
>   #include "qemu/units.h"
>   #include "hw/qdev-clock.h"
> +#include "sysemu/sysemu.h"
>   
>   static struct arm_boot_info aspeed_board_binfo = {
>       .board_id = -1, /* device-tree-only board */
> @@ -301,6 +302,22 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
>                                  &error_fatal);
>   }
>   
> +static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)

something like :

   void aspeed_soc_uart_connect(AspeedSoCState *s, int uart_default)

which could be exported from aspeed_soc.c

> +{
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);

and you wouldn't need the machine.

> +    AspeedSoCState *s = &bmc->soc;
> +
> +    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
> +    for (int i = 1, uart = ASPEED_DEV_UART1;
> +         serial_hd(i) && uart <= ASPEED_DEV_UART13; i++, uart++) {

We should test for :

   ASPEED_SOC_GET_CLASS(s)->uarts_num

I am not sure we want to stop the loop if serial_hd(i) is NULL ?

> +
> +        if (uart == amc->uart_default) {
> +            continue;
> +        }
> +        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
> +    }
> +}>   static void aspeed_machine_init(MachineState *machine)
>   {
>       AspeedMachineState *bmc = ASPEED_MACHINE(machine);
> @@ -346,8 +363,7 @@ static void aspeed_machine_init(MachineState *machine)
>           object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
>                                   ASPEED_SCU_PROT_KEY, &error_abort);
>       }
> -    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> -                         amc->uart_default);
> +    connect_serial_hds_to_uarts(bmc);
>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>   
>       aspeed_board_init_flashes(&bmc->soc.fmc,
> @@ -1383,8 +1399,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>   
>       object_property_set_link(OBJECT(&bmc->soc), "memory",
>                                OBJECT(get_system_memory()), &error_abort);
> -    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
> -                         amc->uart_default);
> +    connect_serial_hds_to_uarts(bmc);
>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>   
>       aspeed_board_init_flashes(&bmc->soc.fmc,
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 33ef331771..a221f5d6fe 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -144,6 +144,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
>           object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
>       }
>   
> +    for (i = 0; i < sc->uarts_num; i++) {
> +        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
> +    }
> +
>       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>       object_initialize_child(obj, "gpio", &s->gpio, typename);
>   
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 3f0611ac11..c4ad26a046 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -214,6 +214,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
>           object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_MII);
>       }
>   
> +    for (i = 0; i < sc->uarts_num; i++) {
> +        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
> +    }
> +
>       snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
>       object_initialize_child(obj, "xdma", &s->xdma, typename);
>   
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 0f675e7fcd..2ac18cbf27 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -208,6 +208,10 @@ static void aspeed_soc_init(Object *obj)
>                                   TYPE_FTGMAC100);
>       }
>   
> +    for (i = 0; i < sc->uarts_num; i++) {
> +        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
> +    }
> +
>       snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
>       object_initialize_child(obj, "xdma", &s->xdma, typename);
>   
> @@ -481,8 +485,6 @@ static Property aspeed_soc_properties[] = {
>                        MemoryRegion *),
>       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> -    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
> -                       ASPEED_DEV_UART5),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -575,22 +577,34 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
>   void aspeed_soc_uart_init(AspeedSoCState *s)

We can handle errors now. So :

   bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)

>   {
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> -    int i, uart;
> -
> -    /* Attach an 8250 to the IO space as our UART */
> -    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
> -                   aspeed_soc_get_irq(s, s->uart_default), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> -        if (uart == s->uart_default) {
> -            uart++;
> -        }
> -        serial_mm_init(s->memory, sc->memmap[uart], 2,
> -                       aspeed_soc_get_irq(s, uart), 38400,
> -                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
> +    SerialMM *smm;
> +    MemoryRegion *mr;
> +
> +    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> +        smm = &s->uart[i];
> +
> +        /* Chardev property is set by the machine. */
> +        qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
> +        qdev_prop_set_uint32(DEVICE(smm), "baudbase", 38400);
> +        qdev_set_legacy_instance_id(DEVICE(smm), sc->memmap[uart], 2);
> +        qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
> +        sysbus_realize(SYS_BUS_DEVICE(smm), &error_fatal);

use errp instead and return false in case of failure.

> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, aspeed_soc_get_irq(s, uart));
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(smm), 0);
> +        memory_region_add_subregion(s->memory, sc->memmap[uart], mr);

You introduced aspeed_mmio_map() :)

>       }
>   }
>   
> +void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)

you could merge this routine in aspeed_soc_uart_connect() I think.

Thanks,

C.


> +{
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    int i = dev - ASPEED_DEV_UART1;
> +
> +    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
> +    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
> +}
> +
>   /*
>    * SDMC should be realized first to get correct RAM size and max size
>    * values
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index e65926a667..60ee0a84db 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -36,12 +36,14 @@
>   #include "hw/misc/aspeed_lpc.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/misc/aspeed_peci.h"
> +#include "hw/char/serial.h"
>   
>   #define ASPEED_SPIS_NUM  2
>   #define ASPEED_EHCIS_NUM 2
>   #define ASPEED_WDTS_NUM  4
>   #define ASPEED_CPUS_NUM  2
>   #define ASPEED_MACS_NUM  4
> +#define ASPEED_UARTS_NUM 13
>   
>   struct AspeedSoCState {
>       /*< private >*/
> @@ -79,7 +81,7 @@ struct AspeedSoCState {
>       AspeedSDHCIState emmc;
>       AspeedLPCState lpc;
>       AspeedPECIState peci;
> -    uint32_t uart_default;
> +    SerialMM uart[ASPEED_UARTS_NUM];
>       Clock *sysclk;
>       UnimplementedDeviceState iomem;
>       UnimplementedDeviceState video;
> @@ -176,6 +178,7 @@ enum {
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>   void aspeed_soc_uart_init(AspeedSoCState *s);
> +void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
>   bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
>   void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
>   void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,


