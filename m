Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8CC5894DC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:34:19 +0200 (CEST)
Received: from localhost ([::1]:36482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNsY-0004pu-Bw
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJNpx-0002V3-3C; Wed, 03 Aug 2022 19:31:41 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJNps-0006Ab-Rr; Wed, 03 Aug 2022 19:31:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 11B767462D3;
 Thu,  4 Aug 2022 01:31:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2F3587461AE; Thu,  4 Aug 2022 01:31:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2D805745702;
 Thu,  4 Aug 2022 01:31:25 +0200 (CEST)
Date: Thu, 4 Aug 2022 01:31:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 19/20] ppc/ppc405: QOM'ify I2C
In-Reply-To: <20220803132844.2370514-20-clg@kaod.org>
Message-ID: <1ab31d3-c5ec-47bd-cdd9-1d1a5e5f7696@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-20-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1617038096-1659569485=:13819"
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

--3866299591-1617038096-1659569485=:13819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Cédric Le Goater wrote:
> Having an explicit I2C model object will help if one day we want to
> add I2C devices on the bus.

Same here as with the UIC in previous patch, it's not QOMifying here 
either. As for why we may need I2C, on sam460ex the firmware detects RAM 
accessing the SPD data over I2C so that could be the reason but it may not 
be used here on 405.

Regards,
BALATON Zoltan

> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h    |  2 ++
> hw/ppc/ppc405_uc.c | 10 ++++++++--
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index d29f738cd2d0..d13624ae309c 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -28,6 +28,7 @@
> #include "qom/object.h"
> #include "hw/ppc/ppc4xx.h"
> #include "hw/intc/ppc-uic.h"
> +#include "hw/i2c/ppc4xx_i2c.h"
>
> #define PPC405EP_SDRAM_BASE 0x00000000
> #define PPC405EP_NVRAM_BASE 0xF0000000
> @@ -256,6 +257,7 @@ struct Ppc405SoCState {
>     Ppc405OcmState ocm;
>     Ppc405GpioState gpio;
>     Ppc405DmaState dma;
> +    PPC4xxI2CState i2c;
>     Ppc405EbcState ebc;
>     Ppc405OpbaState opba;
>     Ppc405PobState pob;
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 5cd32e22b7ea..8f0caa45f5f7 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1461,6 +1461,8 @@ static void ppc405_soc_instance_init(Object *obj)
>
>     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>
> +    object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
> +
>     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>
>     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
> @@ -1569,8 +1571,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>     }
>
>     /* I2C controller */
> -    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
> -                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, 0xef600500);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->uic), 2));
>
>     /* GPIO */
>     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>
--3866299591-1617038096-1659569485=:13819--

