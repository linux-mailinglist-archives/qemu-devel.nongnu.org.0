Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB558CA87
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:28:07 +0200 (CEST)
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3ji-0002qY-Cp
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL3h4-0007Zz-UK; Mon, 08 Aug 2022 10:25:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:38290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL3gz-0000Az-S1; Mon, 08 Aug 2022 10:25:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2144B7475F9;
 Mon,  8 Aug 2022 16:25:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C91EC746FDE; Mon,  8 Aug 2022 16:25:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C7C1E746E07;
 Mon,  8 Aug 2022 16:25:14 +0200 (CEST)
Date: Mon, 8 Aug 2022 16:25:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 10/22] ppc/ppc405: QOM'ify GPT
In-Reply-To: <20220808102734.133084-11-clg@kaod.org>
Message-ID: <b3a0ebc-8711-2e98-439c-f9c108dc83@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-11-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1078198998-1659968714=:47322"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-1078198998-1659968714=:47322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> The GPT controller is currently modeled as a SysBus device with a
> unique memory region, a couple of IRQs and a timer.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h    | 22 ++++++++++++
> hw/ppc/ppc405_uc.c | 90 +++++++++++++++++++++++-----------------------
> 2 files changed, 67 insertions(+), 45 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 2ba829988de2..bcf55e4f6b2e 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -63,6 +63,27 @@ struct ppc4xx_bd_info_t {
>     uint32_t bi_iic_fast[2];
> };
>
> +/* General purpose timers */
> +#define TYPE_PPC405_GPT "ppc405-gpt"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
> +struct Ppc405GptState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    int64_t tb_offset;
> +    uint32_t tb_freq;
> +    QEMUTimer *timer;
> +    qemu_irq irqs[5];
> +    uint32_t oe;
> +    uint32_t ol;
> +    uint32_t im;
> +    uint32_t is;
> +    uint32_t ie;
> +    uint32_t comp[5];
> +    uint32_t mask[5];
> +};
> +
> #define TYPE_PPC405_CPC "ppc405-cpc"
> OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
>
> @@ -114,6 +135,7 @@ struct Ppc405SoCState {
>     PowerPCCPU cpu;
>     DeviceState *uic;
>     Ppc405CpcState cpc;
> +    Ppc405GptState gpt;
> };
>
> /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index e45535b8e52a..f64e661eef6c 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -926,34 +926,18 @@ static void ppc405_ocm_init(CPUPPCState *env)
>
> /*****************************************************************************/
> /* General purpose timers */
> -typedef struct ppc4xx_gpt_t ppc4xx_gpt_t;
> -struct ppc4xx_gpt_t {
> -    MemoryRegion iomem;
> -    int64_t tb_offset;
> -    uint32_t tb_freq;
> -    QEMUTimer *timer;
> -    qemu_irq irqs[5];
> -    uint32_t oe;
> -    uint32_t ol;
> -    uint32_t im;
> -    uint32_t is;
> -    uint32_t ie;
> -    uint32_t comp[5];
> -    uint32_t mask[5];
> -};
> -
> -static int ppc4xx_gpt_compare (ppc4xx_gpt_t *gpt, int n)
> +static int ppc4xx_gpt_compare(Ppc405GptState *gpt, int n)
> {
>     /* XXX: TODO */
>     return 0;
> }
>
> -static void ppc4xx_gpt_set_output (ppc4xx_gpt_t *gpt, int n, int level)
> +static void ppc4xx_gpt_set_output(Ppc405GptState *gpt, int n, int level)
> {
>     /* XXX: TODO */
> }
>
> -static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
> +static void ppc4xx_gpt_set_outputs(Ppc405GptState *gpt)
> {
>     uint32_t mask;
>     int i;
> @@ -974,7 +958,7 @@ static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
>     }
> }
>
> -static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
> +static void ppc4xx_gpt_set_irqs(Ppc405GptState *gpt)
> {
>     uint32_t mask;
>     int i;
> @@ -989,14 +973,14 @@ static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
>     }
> }
>
> -static void ppc4xx_gpt_compute_timer (ppc4xx_gpt_t *gpt)
> +static void ppc4xx_gpt_compute_timer(Ppc405GptState *gpt)
> {
>     /* XXX: TODO */
> }
>
> static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
> {
> -    ppc4xx_gpt_t *gpt = opaque;
> +    Ppc405GptState *gpt = PPC405_GPT(opaque);
>     uint32_t ret;
>     int idx;
>
> @@ -1050,7 +1034,7 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
> static void ppc4xx_gpt_write(void *opaque, hwaddr addr, uint64_t value,
>                              unsigned size)
> {
> -    ppc4xx_gpt_t *gpt = opaque;
> +    Ppc405GptState *gpt = PPC405_GPT(opaque);
>     int idx;
>
>     trace_ppc4xx_gpt_write(addr, size, value);
> @@ -1116,20 +1100,18 @@ static const MemoryRegionOps gpt_ops = {
>
> static void ppc4xx_gpt_cb (void *opaque)
> {
> -    ppc4xx_gpt_t *gpt;
> +    Ppc405GptState *gpt = PPC405_GPT(opaque);
>
> -    gpt = opaque;
>     ppc4xx_gpt_set_irqs(gpt);
>     ppc4xx_gpt_set_outputs(gpt);
>     ppc4xx_gpt_compute_timer(gpt);
> }
>
> -static void ppc4xx_gpt_reset (void *opaque)
> +static void ppc405_gpt_reset(DeviceState *dev)
> {
> -    ppc4xx_gpt_t *gpt;
> +    Ppc405GptState *gpt = PPC405_GPT(dev);
>     int i;
>
> -    gpt = opaque;
>     timer_del(gpt->timer);
>     gpt->oe = 0x00000000;
>     gpt->ol = 0x00000000;
> @@ -1142,21 +1124,28 @@ static void ppc4xx_gpt_reset (void *opaque)
>     }
> }
>
> -static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
> +static void ppc405_gpt_realize(DeviceState *dev, Error **errp)
> {
> -    ppc4xx_gpt_t *gpt;
> +    Ppc405GptState *s = PPC405_GPT(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>     int i;
>
> -    trace_ppc4xx_gpt_init(base);

Where has this trace gone? If you've dropped it then you should also drop 
it from trace-events.

> +    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, s);
> +    memory_region_init_io(&s->iomem, OBJECT(s), &gpt_ops, s, "gpt", 0x0d4);
> +    sysbus_init_mmio(sbd, &s->iomem);
>
> -    gpt = g_new0(ppc4xx_gpt_t, 1);
> -    for (i = 0; i < 5; i++) {
> -        gpt->irqs[i] = irqs[i];
> +    for (i = 0; i < ARRAY_SIZE(s->irqs); i++) {
> +        sysbus_init_irq(sbd, &s->irqs[i]);
>     }
> -    gpt->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, gpt);
> -    memory_region_init_io(&gpt->iomem, NULL, &gpt_ops, gpt, "gpt", 0x0d4);
> -    memory_region_add_subregion(get_system_memory(), base, &gpt->iomem);
> -    qemu_register_reset(ppc4xx_gpt_reset, gpt);
> +}
> +
> +static void ppc405_gpt_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_gpt_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_gpt_reset;
> }
>
> /*****************************************************************************/
> @@ -1421,13 +1410,16 @@ static void ppc405_soc_instance_init(Object *obj)
>
>     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
>     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
> +
> +    object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
> }
>
> static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> {
>     Ppc405SoCState *s = PPC405_SOC(dev);
> -    qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
> +    qemu_irq dma_irqs[4], mal_irqs[4];
>     CPUPPCState *env;
> +    int i;
>
>     /* init CPUs */
>     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
> @@ -1513,12 +1505,15 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     ppc405_ocm_init(env);
>
>     /* GPT */
> -    gpt_irqs[0] = qdev_get_gpio_in(s->uic, 19);
> -    gpt_irqs[1] = qdev_get_gpio_in(s->uic, 20);
> -    gpt_irqs[2] = qdev_get_gpio_in(s->uic, 21);
> -    gpt_irqs[3] = qdev_get_gpio_in(s->uic, 22);
> -    gpt_irqs[4] = qdev_get_gpio_in(s->uic, 23);
> -    ppc4xx_gpt_init(0xef600000, gpt_irqs);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpt), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt), 0, 0xef600000);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), i,
> +                           qdev_get_gpio_in(s->uic, 19 + i));

Maybe you should have a SysBusDevice *sbd local here and cast only once if 
you need it several times. It's also more readable that way.

Regards,
BALATON Zoltan

> +    }
>
>     /* MAL */
>     mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
> @@ -1550,6 +1545,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>
> static const TypeInfo ppc405_types[] = {
>     {
> +        .name           = TYPE_PPC405_GPT,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc405GptState),
> +        .class_init     = ppc405_gpt_class_init,
> +    }, {
>         .name           = TYPE_PPC405_CPC,
>         .parent         = TYPE_PPC4xx_DCR_DEVICE,
>         .instance_size  = sizeof(Ppc405CpcState),
>
--3866299591-1078198998-1659968714=:47322--

