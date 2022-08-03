Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31435894A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:07:01 +0200 (CEST)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNS8-0004hX-B4
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJNPX-0001yw-5j; Wed, 03 Aug 2022 19:04:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:65393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJNPT-0000Gd-GM; Wed, 03 Aug 2022 19:04:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 50629747E0F;
 Thu,  4 Aug 2022 01:04:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F21A87461AE; Thu,  4 Aug 2022 01:04:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F0533745702;
 Thu,  4 Aug 2022 01:04:09 +0200 (CEST)
Date: Thu, 4 Aug 2022 01:04:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <20220803132844.2370514-13-clg@kaod.org>
Message-ID: <91bae6f7-1e68-6bf3-e2f-b31a5a78f2d@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-261452012-1659567849=:13819"
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

--3866299591-261452012-1659567849=:13819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Cédric Le Goater wrote:
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h    | 16 +++++++++++
> hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
> 2 files changed, 64 insertions(+), 23 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 1da34a7f10f3..1c7fe07b8084 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>
> typedef struct Ppc405SoCState Ppc405SoCState;
>
> +/* Peripheral controller */
> +#define TYPE_PPC405_EBC "ppc405-ebc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
> +struct Ppc405EbcState {
> +    DeviceState parent_obj;
> +
> +    PowerPCCPU *cpu;
>
> +    uint32_t addr;
> +    uint32_t bcr[8];
> +    uint32_t bap[8];
> +    uint32_t bear;
> +    uint32_t besr0;
> +    uint32_t besr1;
> +    uint32_t cfg;
> +};
>
> /* DMA controller */
> #define TYPE_PPC405_DMA "ppc405-dma"
> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>     Ppc405OcmState ocm;
>     Ppc405GpioState gpio;
>     Ppc405DmaState dma;
> +    Ppc405EbcState ebc;
> };
>
> /* PowerPC 405 core */
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 6bd93c1cb90c..0166f3fc36da 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>
> /*****************************************************************************/
> /* Peripheral controller */
> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
> -struct ppc4xx_ebc_t {
> -    uint32_t addr;
> -    uint32_t bcr[8];
> -    uint32_t bap[8];
> -    uint32_t bear;
> -    uint32_t besr0;
> -    uint32_t besr1;
> -    uint32_t cfg;
> -};
> -
> enum {
>     EBC0_CFGADDR = 0x012,
>     EBC0_CFGDATA = 0x013,
> @@ -411,10 +400,9 @@ enum {
>
> static uint32_t dcr_read_ebc (void *opaque, int dcrn)
> {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>     uint32_t ret;
>
> -    ebc = opaque;

I think QOM casts are kind of expensive (maybe because we have quo-debug 
enabled by default even without --enable-debug and it does additional 
checks; I've tried to change this default once but it was thought to be 
better to have it enabled). So it's advised to use QOM casts sparingly, 
e.g. store the result in a local variable if you need it more than once 
and so. Therefore I tend to consider these read/write callbacks that the 
object itself registers with itself as the opaque pointer to be internal 
to the object and guaranteed to be passed the object pointer so no QOM 
cast is necessary and the direct assignment can be kept. This avoids 
potential overhead on every register access. Not sure if it's measurable 
but I think if an overhead can be avoided it probably should be.

>     switch (dcrn) {
>     case EBC0_CFGADDR:
>         ret = ebc->addr;
> @@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>
> static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
> {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>
> -    ebc = opaque;
>     switch (dcrn) {
>     case EBC0_CFGADDR:
>         ebc->addr = val;
> @@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>     }
> }
>
> -static void ebc_reset (void *opaque)
> +static void ppc405_ebc_reset(DeviceState *dev)
> {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(dev);

In this case the cast is OK as it's casting a different object so it's 
needed and also it's infrequently called so should not matter.

>     int i;
>
> -    ebc = opaque;
>     ebc->addr = 0x00000000;
>     ebc->bap[0] = 0x7F8FFE80;
>     ebc->bcr[0] = 0xFFE28000;
> @@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
>     ebc->cfg = 0x80400000;
> }
>
> -void ppc405_ebc_init(CPUPPCState *env)
> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
> {
> -    ppc4xx_ebc_t *ebc;
> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
> +    CPUPPCState *env;
> +
> +    assert(ebc->cpu);
> +
> +    env = &ebc->cpu->env;
>
> -    ebc = g_new0(ppc4xx_ebc_t, 1);
> -    qemu_register_reset(&ebc_reset, ebc);
>     ppc_dcr_register(env, EBC0_CFGADDR,
>                      ebc, &dcr_read_ebc, &dcr_write_ebc);
>     ppc_dcr_register(env, EBC0_CFGDATA,
>                      ebc, &dcr_read_ebc, &dcr_write_ebc);
> }
>
> +static Property ppc405_ebc_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_ebc_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ppc405_ebc_reset;
> +    device_class_set_props(dc, ppc405_ebc_properties);
> +}
> +
> +void ppc405_ebc_init(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
> +
> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
> +}
> +
> /*****************************************************************************/
> /* DMA controller */
> enum {
> @@ -1418,6 +1432,8 @@ static void ppc405_soc_instance_init(Object *obj)
>     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>
>     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
> +
> +    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
> }
>
> static void ppc405_soc_realize(DeviceState *dev, Error **errp)
> @@ -1490,7 +1506,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>                       s->ram_bases, s->ram_sizes, s->do_dram_init);
>
>     /* External bus controller */
> -    ppc405_ebc_init(env);
> +    object_property_set_link(OBJECT(&s->ebc), "cpu", OBJECT(&s->cpu),
> +                             &error_abort);

I wonder if this link to cpu could be avoided somehow? Maybe assuming that 
this device and the cpu is part of the same SoC it could get it's parent 
and access the cpu field of the parent or if that's not possible adding a 
method to the SoC to get it could avoid this link?

Regards,
BALATON Zoltan

> +    if (!qdev_realize(DEVICE(&s->ebc), NULL, errp)) {
> +        return;
> +    }
>
>     /* DMA controller */
>     object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
> @@ -1576,6 +1596,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>
> static const TypeInfo ppc405_types[] = {
>     {
> +        .name           = TYPE_PPC405_EBC,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(Ppc405EbcState),
> +        .class_init     = ppc405_ebc_class_init,
> +    }, {
>         .name           = TYPE_PPC405_DMA,
>         .parent         = TYPE_SYS_BUS_DEVICE,
>         .instance_size  = sizeof(Ppc405DmaState),
>
--3866299591-261452012-1659567849=:13819--

