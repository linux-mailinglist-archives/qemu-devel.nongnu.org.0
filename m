Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA34589178
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:32:41 +0200 (CEST)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIEZ-0007CX-9D
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJHyq-0003g7-EZ; Wed, 03 Aug 2022 13:16:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:48008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJHyl-0003ot-S3; Wed, 03 Aug 2022 13:16:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 593F2747F1E;
 Wed,  3 Aug 2022 19:16:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 07081747F1B; Wed,  3 Aug 2022 19:16:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 05C6A746E06;
 Wed,  3 Aug 2022 19:16:17 +0200 (CEST)
Date: Wed, 3 Aug 2022 19:16:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/20] ppc/ppc405: QOM'ify CPC
In-Reply-To: <20220803132844.2370514-8-clg@kaod.org>
Message-ID: <6e556df0-6ed3-6e54-4dd4-f58da193af32@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-189614882-1659546977=:36771"
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

--3866299591-189614882-1659546977=:36771
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Cédric Le Goater wrote:
> Introduce a QOM property "cpu" to initialize the DCR handlers. This is
> a pattern that we will reuse for the all other 405 devices needing it.
>
> Now that all clock settings are handled at the CPC level, change the
> SoC "sys-clk" property to be an alias on the same property in the CPC
> model.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h    |  39 +++++++++++++++-
> hw/ppc/ppc405_uc.c | 109 +++++++++++++++++++--------------------------
> 2 files changed, 85 insertions(+), 63 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index ae64549537c6..88c63774d9ba 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -63,6 +63,43 @@ struct ppc4xx_bd_info_t {
>     uint32_t bi_iic_fast[2];
> };
>
> +typedef struct Ppc405SoCState Ppc405SoCState;

This typedef is already done by the OBJECT_DECLARE_SIMPLE_TYPE macro 
below. Could some compilers complain about double typedef? There may be 
some circular dependencies here so to avoid a separate typedef you may 
need to bring the OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC); 
line up here to the front while keeping the actual declaration of the 
state struct and rest of the object later which separates them but adding 
a comment may explain that. I'm not sure if it's better to do that or 
repeating the typedef in advance as done here is better but declaring the 
object in advance is probably a bit cleaner than repeating part of its 
internals just in case this implementation detail ever changes.

Regards,
BALATON Zoltan

> +
> +#define TYPE_PPC405_CPC "ppc405-cpc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
> +
> +enum {
> +    PPC405EP_CPU_CLK   = 0,
> +    PPC405EP_PLB_CLK   = 1,
> +    PPC405EP_OPB_CLK   = 2,
> +    PPC405EP_EBC_CLK   = 3,
> +    PPC405EP_MAL_CLK   = 4,
> +    PPC405EP_PCI_CLK   = 5,
> +    PPC405EP_UART0_CLK = 6,
> +    PPC405EP_UART1_CLK = 7,
> +    PPC405EP_CLK_NB    = 8,
> +};
> +
> +struct Ppc405CpcState {
> +    DeviceState parent_obj;
> +
> +    PowerPCCPU *cpu;
> +
> +    uint32_t sysclk;
> +    clk_setup_t clk_setup[PPC405EP_CLK_NB];
> +    uint32_t boot;
> +    uint32_t epctl;
> +    uint32_t pllmr[2];
> +    uint32_t ucr;
> +    uint32_t srr;
> +    uint32_t jtagid;
> +    uint32_t pci;
> +    /* Clock and power management */
> +    uint32_t er;
> +    uint32_t fr;
> +    uint32_t sr;
> +};
> +
> #define TYPE_PPC405_SOC "ppc405-soc"
> OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
>
> @@ -79,9 +116,9 @@ struct Ppc405SoCState {
>     MemoryRegion *dram_mr;
>     hwaddr ram_size;
>
> -    uint32_t sysclk;
>     PowerPCCPU cpu;
>     DeviceState *uic;
> +    Ppc405CpcState cpc;
> };
>
> /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 013dccee898b..32bfc9480bc6 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1178,36 +1178,7 @@ enum {
> #endif
> };
>
> -enum {
> -    PPC405EP_CPU_CLK   = 0,
> -    PPC405EP_PLB_CLK   = 1,
> -    PPC405EP_OPB_CLK   = 2,
> -    PPC405EP_EBC_CLK   = 3,
> -    PPC405EP_MAL_CLK   = 4,
> -    PPC405EP_PCI_CLK   = 5,
> -    PPC405EP_UART0_CLK = 6,
> -    PPC405EP_UART1_CLK = 7,
> -    PPC405EP_CLK_NB    = 8,
> -};
> -
> -typedef struct ppc405ep_cpc_t ppc405ep_cpc_t;
> -struct ppc405ep_cpc_t {
> -    uint32_t sysclk;
> -    clk_setup_t clk_setup[PPC405EP_CLK_NB];
> -    uint32_t boot;
> -    uint32_t epctl;
> -    uint32_t pllmr[2];
> -    uint32_t ucr;
> -    uint32_t srr;
> -    uint32_t jtagid;
> -    uint32_t pci;
> -    /* Clock and power management */
> -    uint32_t er;
> -    uint32_t fr;
> -    uint32_t sr;
> -};
> -
> -static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
> +static void ppc405ep_compute_clocks(Ppc405CpcState *cpc)
> {
>     uint32_t CPU_clk, PLB_clk, OPB_clk, EBC_clk, MAL_clk, PCI_clk;
>     uint32_t UART0_clk, UART1_clk;
> @@ -1302,10 +1273,9 @@ static void ppc405ep_compute_clocks (ppc405ep_cpc_t *cpc)
>
> static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
> {
> -    ppc405ep_cpc_t *cpc;
> +    Ppc405CpcState *cpc = PPC405_CPC(opaque);
>     uint32_t ret;
>
> -    cpc = opaque;
>     switch (dcrn) {
>     case PPC405EP_CPC0_BOOT:
>         ret = cpc->boot;
> @@ -1342,9 +1312,8 @@ static uint32_t dcr_read_epcpc (void *opaque, int dcrn)
>
> static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
> {
> -    ppc405ep_cpc_t *cpc;
> +    Ppc405CpcState *cpc = PPC405_CPC(opaque);
>
> -    cpc = opaque;
>     switch (dcrn) {
>     case PPC405EP_CPC0_BOOT:
>         /* Read-only register */
> @@ -1377,9 +1346,9 @@ static void dcr_write_epcpc (void *opaque, int dcrn, uint32_t val)
>     }
> }
>
> -static void ppc405ep_cpc_reset (void *opaque)
> +static void ppc405_cpc_reset(DeviceState *dev)
> {
> -    ppc405ep_cpc_t *cpc = opaque;
> +    Ppc405CpcState *cpc = PPC405_CPC(dev);
>
>     cpc->boot = 0x00000010;     /* Boot from PCI - IIC EEPROM disabled */
>     cpc->epctl = 0x00000000;
> @@ -1391,21 +1360,24 @@ static void ppc405ep_cpc_reset (void *opaque)
>     cpc->er = 0x00000000;
>     cpc->fr = 0x00000000;
>     cpc->sr = 0x00000000;
> +    cpc->jtagid = 0x20267049;
>     ppc405ep_compute_clocks(cpc);
> }
>
> /* XXX: sysclk should be between 25 and 100 MHz */
> -static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
> -                               uint32_t sysclk)
> +static void ppc405_cpc_realize(DeviceState *dev, Error **errp)
> {
> -    ppc405ep_cpc_t *cpc;
> +    Ppc405CpcState *cpc = PPC405_CPC(dev);
> +    CPUPPCState *env;
> +
> +    assert(cpc->cpu);
> +
> +    env = &cpc->cpu->env;
> +
> +    cpc->clk_setup[PPC405EP_CPU_CLK].cb =
> +        ppc_40x_timers_init(env, cpc->sysclk, PPC_INTERRUPT_PIT);
> +    cpc->clk_setup[PPC405EP_CPU_CLK].opaque = env;
>
> -    cpc = g_new0(ppc405ep_cpc_t, 1);
> -    memcpy(cpc->clk_setup, clk_setup,
> -           PPC405EP_CLK_NB * sizeof(clk_setup_t));
> -    cpc->jtagid = 0x20267049;
> -    cpc->sysclk = sysclk;
> -    qemu_register_reset(&ppc405ep_cpc_reset, cpc);
>     ppc_dcr_register(env, PPC405EP_CPC0_BOOT, cpc,
>                      &dcr_read_epcpc, &dcr_write_epcpc);
>     ppc_dcr_register(env, PPC405EP_CPC0_EPCTL, cpc,
> @@ -1422,14 +1394,23 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>                      &dcr_read_epcpc, &dcr_write_epcpc);
>     ppc_dcr_register(env, PPC405EP_CPC0_PCI, cpc,
>                      &dcr_read_epcpc, &dcr_write_epcpc);
> -#if 0
> -    ppc_dcr_register(env, PPC405EP_CPC0_ER, cpc,
> -                     &dcr_read_epcpc, &dcr_write_epcpc);
> -    ppc_dcr_register(env, PPC405EP_CPC0_FR, cpc,
> -                     &dcr_read_epcpc, &dcr_write_epcpc);
> -    ppc_dcr_register(env, PPC405EP_CPC0_SR, cpc,
> -                     &dcr_read_epcpc, &dcr_write_epcpc);
> -#endif
> +}
> +
> +static Property ppc405_cpc_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405CpcState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_UINT32("sys-clk", Ppc405CpcState, sysclk, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_cpc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_cpc_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_cpc_reset;
> +    device_class_set_props(dc, ppc405_cpc_properties);
> }
>
> static void ppc405_soc_instance_init(Object *obj)
> @@ -1438,12 +1419,14 @@ static void ppc405_soc_instance_init(Object *obj)
>
>     object_initialize_child(obj, "cpu", &s->cpu,
>                             POWERPC_CPU_TYPE_NAME("405ep"));
> +
> +    object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
> +    object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
> }
>
> static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> {
>     Ppc405SoCState *s = PPC405_SOC(dev);
> -    clk_setup_t clk_setup[PPC405EP_CLK_NB];
>     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>     CPUPPCState *env;
>     Error *err = NULL;
> @@ -1458,8 +1441,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
>                                 &s->sram);
>
> -    memset(clk_setup, 0, sizeof(clk_setup));
> -
>     /* init CPUs */
>     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
>         return;
> @@ -1468,14 +1449,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>
>     env = &s->cpu.env;
>
> -    clk_setup[PPC405EP_CPU_CLK].cb =
> -        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
> -    clk_setup[PPC405EP_CPU_CLK].opaque = env;
> -
>     ppc_dcr_init(env, NULL, NULL);
>
>     /* CPU control */
> -    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
> +    object_property_set_link(OBJECT(&s->cpc), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);
> +    if (!qdev_realize(DEVICE(&s->cpc), NULL, errp)) {
> +        return;
> +    }
>
>     /* PLB arbitrer */
>     ppc4xx_plb_init(env);
> @@ -1566,7 +1547,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> static Property ppc405_soc_properties[] = {
>     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>                      MemoryRegion *),
> -    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
>     DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
>     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>     DEFINE_PROP_END_OF_LIST(),
> @@ -1583,6 +1563,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>
> static const TypeInfo ppc405_types[] = {
>     {
> +        .name           = TYPE_PPC405_CPC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405CpcState),
> +        .class_init     = ppc405_cpc_class_init,
> +    }, {
>         .name           = TYPE_PPC405_SOC,
>         .parent         = TYPE_DEVICE,
>         .instance_size  = sizeof(Ppc405SoCState),
>
--3866299591-189614882-1659546977=:36771--

