Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A42F1FA3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:40:00 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz32l-0006ir-AQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kz2UP-0000AV-JM; Mon, 11 Jan 2021 14:04:29 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:59568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kz2UM-0006jW-Jf; Mon, 11 Jan 2021 14:04:29 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id E6469A00F9; Mon, 11 Jan 2021 20:04:12 +0100 (CET)
Date: Mon, 11 Jan 2021 20:04:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/8] hw/ppc/virtex_ml507: Drop use of ppcuic_init()
In-Reply-To: <20201212001537.24520-4-peter.maydell@linaro.org>
Message-ID: <alpine.LMD.2.03.2101112001170.7627@eik.bme.hu>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-4-peter.maydell@linaro.org>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Sat, 12 Dec 2020, Peter Maydell wrote:
> Switch the virtex_ml507 board to directly creating and
> configuring the UIC, rather than doing it via the old
> ppcuic_init() helper function.
>
> This fixes a trivial Coverity-detected memory leak where
> we were leaking the array of IRQs returned by ppcuic_init().
>
> Fixes: Coverity CID 1421992
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> hw/ppc/virtex_ml507.c | 21 ++++++++++++++++-----
> 1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 7f1bca928c1..34767b11cad 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -43,6 +43,7 @@
> #include "qemu/option.h"
> #include "exec/address-spaces.h"
>
> +#include "hw/intc/ppc-uic.h"
> #include "hw/ppc/ppc.h"
> #include "hw/ppc/ppc4xx.h"
> #include "hw/qdev-properties.h"
> @@ -95,7 +96,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
> {
>     PowerPCCPU *cpu;
>     CPUPPCState *env;
> -    qemu_irq *irqs;
> +    DeviceState *uicdev;
> +    SysBusDevice *uicsbd;
>
>     cpu = POWERPC_CPU(cpu_create(cpu_type));
>     env = &cpu->env;
> @@ -105,10 +107,19 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>     ppc_dcr_init(env, NULL, NULL);
>
>     /* interrupt controller */
> -    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
> -    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
> -    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
> -    ppcuic_init(env, irqs, 0x0C0, 0, 1);
> +    uicdev = qdev_new(TYPE_PPC_UIC);
> +    uicsbd = SYS_BUS_DEVICE(uicdev);
> +
> +    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> +                             &error_fatal);
> +    sysbus_realize_and_unref(uicsbd, &error_fatal);

This also uses 0xc0 which is not set. I don't know where's your default 
value comes from but I all these boards seem to use 0xc0 rather than that 
default. So maybe this is better fixed in the UIC dev to change the 
default to 0xc0?

Regards,
BALATON Zoltan

> +
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +
> +    /* This board doesn't wire anything up to the inputs of the UIC. */
>     return cpu;
> }
>
> -- 
> 2.20.1
>
>
>

