Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F74A8F9C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:12:29 +0100 (CET)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjP1-0003nJ-5S
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nFij3-00085U-59
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 15:29:05 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1nFiix-0002Yk-Tv
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 15:29:04 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id B01FDC60912;
 Thu,  3 Feb 2022 21:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643920137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFS1W8B3bgGqybtYcpsQfuqjpjK6p6R5oxPSzb+ORqE=;
 b=KXtcTnzP7IyRYqEBMETbyC4fIoZ+OTRc6WDN7paiMJKIPvS7puOf0uvA3mLrFFsMqmaDQQ
 mw63iZ2h7EnANADRoktGYwvQ5mXmz0YN/+T7YtTN3VtIezpdHZsCeOtgKjPq00vrM44obJ
 33W5ILq/SxJAff2uyDfE3FdkSFOsxvBhOUE5hM9q3UjmdWiytJX8slEnA0h+bSAdvF5dE5
 AbObXEhm11v0xyASCJZ7t/IPVuXnHLu+3N7oRlmUzU6IR1qPn47PCIeRbhljSfjp1PnvFb
 xS64bvPfO379d6lcUlop3L2T87aANSzydgrRiTA6C/120oxTngx30bbGFOMStw==
Date: Thu, 3 Feb 2022 21:28:57 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1] hw/arm/xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
Message-ID: <Yfw7CVbRErmAvCYV@sekoia-pc.home.lmichel.fr>
References: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15:17 Thu 03 Feb     , Francisco Iglesias wrote:
> 'Or' the IRQs coming from the QSPI and QSPI DMA models. This is done for
> avoiding the situation where one of the models incorrectly deasserts an
> interrupt asserted from the other model (which will result in that the IRQ
> is lost and will not reach guest SW).
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
> 
> Hi,
> 
> I noted this after receiving a review comment (from Peter Maydell) on a similar
> issue on the Versal machine while working on the OSPI series.
> 
> Best regards,
> Francisco Iglesias
> 
> 
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 062e637fe4..9424f81c37 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -38,6 +38,7 @@
>  #include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-zynqmp-efuse.h"
> +#include "hw/or-irq.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -122,6 +123,7 @@ struct XlnxZynqMPState {
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
>      XlnxCSUDMA qspi_dma;
> +    qemu_or_irq qspi_irq_orgate;
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 1c52a575aa..5fbf38c466 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -50,6 +50,7 @@
>  #define LQSPI_ADDR          0xc0000000
>  #define QSPI_IRQ            15
>  #define QSPI_DMA_ADDR       0xff0f0800
> +#define NUM_QSPI_IRQ_LINES  2
>  
>  #define DP_ADDR             0xfd4a0000
>  #define DP_IRQ              113
> @@ -362,6 +363,8 @@ static void xlnx_zynqmp_init(Object *obj)
>      }
>  
>      object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
> +    object_initialize_child(obj, "qspi-irq-orgate",
> +                            &s->qspi_irq_orgate, TYPE_OR_IRQ);
>  }
>  
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> @@ -709,6 +712,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>                             gic_spi[adma_ch_intr[i]]);
>      }
>  
> +    object_property_set_int(OBJECT(&s->qspi_irq_orgate),
> +                            "num-lines", NUM_QSPI_IRQ_LINES, &error_fatal);
> +    qdev_realize(DEVICE(&s->qspi_irq_orgate), NULL, &error_fatal);
> +    qdev_connect_gpio_out(DEVICE(&s->qspi_irq_orgate), 0, gic_spi[QSPI_IRQ]);
> +
>      if (!object_property_set_link(OBJECT(&s->qspi_dma), "dma",
>                                    OBJECT(system_memory), errp)) {
>          return;
> @@ -718,7 +726,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      }
>  
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 0));
>  
>      if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
>                                    OBJECT(&s->qspi_dma), errp)) {
> @@ -729,7 +738,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 1));
>  
>      for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
>          g_autofree gchar *bus_name = g_strdup_printf("qspi%d", i);
> -- 
> 2.11.0
> 

-- 

