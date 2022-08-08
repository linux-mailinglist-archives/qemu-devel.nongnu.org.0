Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658058C986
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:33:02 +0200 (CEST)
Received: from localhost ([::1]:42264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2sP-00059j-9F
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL2p0-0002tL-6h; Mon, 08 Aug 2022 09:29:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL2ot-0007Ki-2l; Mon, 08 Aug 2022 09:29:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 944E2747F18;
 Mon,  8 Aug 2022 15:29:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 53A9C747E0F; Mon,  8 Aug 2022 15:29:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 51CE2747DFD;
 Mon,  8 Aug 2022 15:29:18 +0200 (CEST)
Date: Mon, 8 Aug 2022 15:29:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 08/22] ppc/ppc4xx: Introduce a DCR device model
In-Reply-To: <20220808102734.133084-9-clg@kaod.org>
Message-ID: <2220bf2e-71a9-52a-b3b-4e9cae8da1a3@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-9-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-641934783-1659965112=:47322"
Content-ID: <26e4fd46-a32b-b74d-7ec1-089f9c389c@eik.bme.hu>
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

--3866299591-641934783-1659965112=:47322
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <3edb302a-9b3e-e943-53d3-a9ba0e376c6@eik.bme.hu>

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> The Device Control Registers (DCR) of on-SoC devices are accessed by
> software through the use of the mtdcr and mfdcr instructions. These
> are converted in transactions on a side band bus, the DCR bus, which
> connects the on-SoC devices to the CPU.
>
> Ideally, we should model these accesses with a DCR namespace and DCR
> memory regions but today the DCR handlers are installed in a DCR table
> under the CPU. Instead introduce a little device model wrapper to hold
> a CPU link and handle registration of DCR handlers.
>
> The DCR device inherits from SysBus because most of these devices also
> have a MMIO regions and/or IRQs. Being a SysBusDevice makes things

Drop "a", just "MMIO regions" due to plural. Also "makes it easier to 
install" or "makes things easier".

> easier to install the device model in the overall SoC.
>
> The "cpu" link should be considered as modeling the piece of HW logic
> connecting the device to the DCR bus.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> include/hw/ppc/ppc4xx.h | 17 +++++++++++++++
> hw/ppc/ppc4xx_devs.c    | 46 +++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 63 insertions(+)
>
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 021376c2d260..bb373db0ba10 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -27,6 +27,7 @@
>
> #include "hw/ppc/ppc.h"
> #include "exec/memory.h"
> +#include "hw/sysbus.h"
>
> /* PowerPC 4xx core initialization */
> void ppc4xx_reset(void *opaque);
> @@ -50,4 +51,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>
> #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>
> +/*
> + * Generic DCR device
> + */
> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr"

Should it be named ppc4xx-dcr-device for clarity? This probably won't 
appear anywhere where users have to type it.

> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
> +struct Ppc4xxDcrDeviceState {
> +    SysBusDevice parent_obj;
> +
> +    PowerPCCPU *cpu;
> +};
> +
> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
> +                        Error **errp);
> +
> #endif /* PPC4XX_H */
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index f20098cf417c..e07bdba0f912 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -696,3 +696,49 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>                          mal, &dcr_read_mal, &dcr_write_mal);
>     }
> }
> +
> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
> +{
> +    CPUPPCState *env;
> +
> +    assert(dev->cpu);
> +
> +    env = &dev->cpu->env;
> +
> +    ppc_dcr_register(env, dcrn, dev, dcr_read, dcr_write);
> +}
> +
> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
> +                        Error **errp)
> +{
> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
> +    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
> +}
> +
> +
> +static Property ppc4xx_dcr_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->user_creatable = false;

Should this be .abstract instead? We expect this to not be used directly 
but only via SoC devices which is what abstract is for AFAIK.

> +    device_class_set_props(dc, ppc4xx_dcr_properties);
> +}
> +
> +static const TypeInfo ppc4xx_types[] = {
> +    {
> +        .name           = TYPE_PPC4xx_DCR_DEVICE,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
> +        .class_init     = ppc4xx_dcr_class_init,
> +        .abstract       = true,

Oh, it's abstract already. So does it also need user_creatable for an 
abstract class then? Maybe you can drop the user_creatable.

Regards,
BALATON Zoltan

> +    }
> +};
> +
> +DEFINE_TYPES(ppc4xx_types)
>
--3866299591-641934783-1659965112=:47322--

