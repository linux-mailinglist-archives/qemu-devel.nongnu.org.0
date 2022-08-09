Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8858DD5E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:43:26 +0200 (CEST)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTGH-0007U2-QB
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLTCL-0002DW-ER; Tue, 09 Aug 2022 13:39:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLTCJ-0007Zl-Fn; Tue, 09 Aug 2022 13:39:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6C43E748166;
 Tue,  9 Aug 2022 19:39:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2DE24747F1E; Tue,  9 Aug 2022 19:39:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2C33A747F1D;
 Tue,  9 Aug 2022 19:39:17 +0200 (CEST)
Date: Tue, 9 Aug 2022 19:39:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 07/24] ppc/ppc405: QOM'ify CPU
In-Reply-To: <20220809153904.485018-8-clg@kaod.org>
Message-ID: <62c79449-c256-ee35-f593-63ea75fbc9e@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-256924047-1660066757=:57026"
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

--3866299591-256924047-1660066757=:57026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT


Since maybe there will be another version, this patch is still misnamed, I 
think it's not QOMifying but embeds the cpu in the soc.

Regards,
BALATON Zoltan

On Tue, 9 Aug 2022, Cédric Le Goater wrote:
> Drop the use of ppc4xx_init() and duplicate a bit of code related to
> clocks in the SoC realize routine. We will clean that up in the
> following patches.
>
> ppc_dcr_init() simply allocates default DCR handlers for the CPU. Maybe
> this could be done in model initializer of the CPU families needing it.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h         |  2 +-
> include/hw/ppc/ppc4xx.h |  5 -----
> hw/ppc/ppc405_boards.c  |  2 +-
> hw/ppc/ppc405_uc.c      | 40 ++++++++++++++++++++++++++++++----------
> hw/ppc/ppc4xx_devs.c    | 32 --------------------------------
> 5 files changed, 32 insertions(+), 49 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index dc862bc8614c..8cc76cc8b3fe 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -79,7 +79,7 @@ struct Ppc405SoCState {
>     hwaddr ram_size;
>
>     uint32_t sysclk;
> -    PowerPCCPU *cpu;
> +    PowerPCCPU cpu;
>     DeviceState *uic;
> };
>
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 980f964b5a91..591e2421a343 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -28,11 +28,6 @@
> #include "hw/ppc/ppc.h"
> #include "exec/memory.h"
>
> -/* PowerPC 4xx core initialization */
> -PowerPCCPU *ppc4xx_init(const char *cpu_model,
> -                        clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
> -                        uint32_t sysclk);
> -
> void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>                         MemoryRegion ram_memories[],
>                         hwaddr ram_bases[], hwaddr ram_sizes[],
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index b93e85b5d9bd..3677793adc75 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -313,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>
>     /* Load ELF kernel and rootfs.cpio */
>     } else if (kernel_filename && !machine->firmware) {
> -        boot_from_kernel(machine, ppc405->soc.cpu);
> +        boot_from_kernel(machine, &ppc405->soc.cpu);
>     }
> }
>
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index c05ab604367d..14a525b2eb74 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1432,22 +1432,41 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
> #endif
> }
>
> +static void ppc405_soc_instance_init(Object *obj)
> +{
> +    Ppc405SoCState *s = PPC405_SOC(obj);
> +
> +    object_initialize_child(obj, "cpu", &s->cpu,
> +                            POWERPC_CPU_TYPE_NAME("405ep"));
> +}
> +
> +static void ppc405_reset(void *opaque)
> +{
> +    cpu_reset(CPU(opaque));
> +}
> +
> static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> {
>     Ppc405SoCState *s = PPC405_SOC(dev);
> -    clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
> +    clk_setup_t clk_setup[PPC405EP_CLK_NB];
>     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>     CPUPPCState *env;
>
>     memset(clk_setup, 0, sizeof(clk_setup));
>
>     /* init CPUs */
> -    s->cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
> -                      &clk_setup[PPC405EP_CPU_CLK],
> -                      &tlb_clk_setup, s->sysclk);
> -    env = &s->cpu->env;
> -    clk_setup[PPC405EP_CPU_CLK].cb = tlb_clk_setup.cb;
> -    clk_setup[PPC405EP_CPU_CLK].opaque = tlb_clk_setup.opaque;
> +    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
> +        return;
> +    }
> +    qemu_register_reset(ppc405_reset, &s->cpu);
> +
> +    env = &s->cpu.env;
> +
> +    clk_setup[PPC405EP_CPU_CLK].cb =
> +        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
> +    clk_setup[PPC405EP_CPU_CLK].opaque = env;
> +
> +    ppc_dcr_init(env, NULL, NULL);
>
>     /* CPU control */
>     ppc405ep_cpc_init(env, clk_setup, s->sysclk);
> @@ -1464,16 +1483,16 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     /* Universal interrupt controller */
>     s->uic = qdev_new(TYPE_PPC_UIC);
>
> -    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(s->cpu),
> +    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
>                              &error_fatal);
>     if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
>         return;
>     }
>
>     sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_INT));
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
>     sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
> -                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_CINT));
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
>
>     /* SDRAM controller */
>         /* XXX 405EP has no ECC interrupt */
> @@ -1563,6 +1582,7 @@ static const TypeInfo ppc405_types[] = {
>         .name           = TYPE_PPC405_SOC,
>         .parent         = TYPE_DEVICE,
>         .instance_size  = sizeof(Ppc405SoCState),
> +        .instance_init  = ppc405_soc_instance_init,
>         .class_init     = ppc405_soc_class_init,
>     }
> };
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 737c0896b4f8..069b51195160 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -37,38 +37,6 @@
> #include "qapi/error.h"
> #include "trace.h"
>
> -static void ppc4xx_reset(void *opaque)
> -{
> -    PowerPCCPU *cpu = opaque;
> -
> -    cpu_reset(CPU(cpu));
> -}
> -
> -/*****************************************************************************/
> -/* Generic PowerPC 4xx processor instantiation */
> -PowerPCCPU *ppc4xx_init(const char *cpu_type,
> -                        clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
> -                        uint32_t sysclk)
> -{
> -    PowerPCCPU *cpu;
> -    CPUPPCState *env;
> -
> -    /* init CPUs */
> -    cpu = POWERPC_CPU(cpu_create(cpu_type));
> -    env = &cpu->env;
> -
> -    cpu_clk->cb = NULL; /* We don't care about CPU clock frequency changes */
> -    cpu_clk->opaque = env;
> -    /* Set time-base frequency to sysclk */
> -    tb_clk->cb = ppc_40x_timers_init(env, sysclk, PPC_INTERRUPT_PIT);
> -    tb_clk->opaque = env;
> -    ppc_dcr_init(env, NULL, NULL);
> -    /* Register qemu callbacks */
> -    qemu_register_reset(ppc4xx_reset, cpu);
> -
> -    return cpu;
> -}
> -
> /*****************************************************************************/
> /* SDRAM controller */
> typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
>
--3866299591-256924047-1660066757=:57026--

