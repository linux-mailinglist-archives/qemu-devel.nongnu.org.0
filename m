Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAC95674DF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:54:17 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8loW-0004SJ-L5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1o8lOP-0005iy-6O; Tue, 05 Jul 2022 12:27:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1o8lOM-0007mJ-Bw; Tue, 05 Jul 2022 12:27:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 265A2746396;
 Tue,  5 Jul 2022 18:27:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DC0F674635D; Tue,  5 Jul 2022 18:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DA7CA74632B;
 Tue,  5 Jul 2022 18:27:08 +0200 (CEST)
Date: Tue, 5 Jul 2022 18:27:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH 2/5] ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
In-Reply-To: <20220705145814.461723-3-clg@kaod.org>
Message-ID: <526a762-2c94-186a-69e0-c5979973a58a@eik.bme.hu>
References: <20220705145814.461723-1-clg@kaod.org>
 <20220705145814.461723-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-270717438-1657038428=:90499"
X-Spam-Probability: 9%
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

--3866299591-270717438-1657038428=:90499
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 5 Jul 2022, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc.c           |  5 +----
> hw/ppc/ppc405_uc.c     |  4 ++--
> hw/ppc/ppc440_bamboo.c |  4 ++--
> hw/ppc/sam460ex.c      |  4 ++--
> hw/ppc/virtex_ml507.c  | 10 +++++-----
> 5 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 15f2b5f0f07a..8c88d3a4806d 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -422,10 +422,7 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
>
> void ppc40x_irq_init(PowerPCCPU *cpu)
> {
> -    CPUPPCState *env = &cpu->env;
> -
> -    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc40x_set_irq,
> -                                                  cpu, PPC40x_INPUT_NB);
> +    qdev_init_gpio_in(DEVICE(cpu), ppc40x_set_irq, PPC40x_INPUT_NB);
> }
>
> /* PowerPC E500 internal IRQ controller */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 36c8ba6f3c14..d6420c88d3a6 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1470,9 +1470,9 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>     sysbus_realize_and_unref(uicsbd, &error_fatal);
>
>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>
>     *uicdevp = uicdev;
>
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index d5973f2484ed..873f930c77da 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -200,9 +200,9 @@ static void bamboo_init(MachineState *machine)
>     sysbus_realize_and_unref(uicsbd, &error_fatal);
>
>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>
>     /* SDRAM controller */
>     memset(ram_bases, 0, sizeof(ram_bases));
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 2f24598f55db..7e8da657c2a9 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -334,9 +334,9 @@ static void sam460ex_init(MachineState *machine)
>
>         if (i == 0) {
>             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> -                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
> -                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));

Looks like indentation is off in above two lines.

Regards,
BALATON Zoltan

>         } else {
>             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
>                                qdev_get_gpio_in(uic[0], input_ints[i]));
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index b67a709ddce2..53b126ff48a6 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -111,9 +111,9 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>     sysbus_realize_and_unref(uicsbd, &error_fatal);
>
>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>
>     /* This board doesn't wire anything up to the inputs of the UIC. */
>     return cpu;
> @@ -213,7 +213,7 @@ static void virtex_init(MachineState *machine)
>     CPUPPCState *env;
>     hwaddr ram_base = 0;
>     DriveInfo *dinfo;
> -    qemu_irq irq[32], *cpu_irq;
> +    qemu_irq irq[32], cpu_irq;
>     int kernel_size;
>     int i;
>
> @@ -236,12 +236,12 @@ static void virtex_init(MachineState *machine)
>                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
>
> -    cpu_irq = (qemu_irq *) &env->irq_inputs[PPC40x_INPUT_INT];
> +    cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
>     dev = qdev_new("xlnx.xps-intc");
>     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
>     for (i = 0; i < 32; i++) {
>         irq[i] = qdev_get_gpio_in(dev, i);
>     }
>
--3866299591-270717438-1657038428=:90499--

