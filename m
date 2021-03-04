Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E547A32CECB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:53:00 +0100 (CET)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHjj9-0007un-A9
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lHjfY-0006lZ-Cy; Thu, 04 Mar 2021 03:49:16 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:47356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lHjfT-0003Cj-Vi; Thu, 04 Mar 2021 03:49:16 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7CD7A20771;
 Thu,  4 Mar 2021 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1614847750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tttKh2R+i7KDrlcZxljypNR3xy9+rFZz5/tOUFtOORM=;
 b=fLUTuXIT2IqJ8sXynJE3D++P/mLe8um3CH9uR/TmDiNkfDnSI8tqGXi5vI6PvTamg6Udjz
 MkLjxWET29z1Zlj/dooEBCr+0nQVCncx7L/dJrBvs+mXBReknKYi/fujFKpj513qyoSmK7
 Af1aM87/hFvdOiZDl+HvwaffioKZ1OY=
Subject: Re: [PATCH v1 2/2] hw/arm: versal: Add support for the XRAMs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
 <20210302110955.1810487-3-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <4f9c2710-b572-5792-e270-38e03c6ae904@greensocs.com>
Date: Thu, 4 Mar 2021 09:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302110955.1810487-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 joe.komlodi@xilinx.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 12:09 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the support for the Versal Accelerator RAMs (XRAMs).
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>   docs/system/arm/xlnx-versal-virt.rst |  1 +
>   include/hw/arm/xlnx-versal.h         | 13 ++++++++++
>   hw/arm/xlnx-versal.c                 | 36 ++++++++++++++++++++++++++++
>   3 files changed, 50 insertions(+)
> 
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 2602d0f995..27f73500d9 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -30,6 +30,7 @@ Implemented devices:
>   - 8 ADMA (Xilinx zDMA) channels
>   - 2 SD Controllers
>   - OCM (256KB of On Chip Memory)
> +- XRAM (4MB of on chip Accelerator RAM)
>   - DDR memory
>   
>   QEMU does not yet model any other devices, including the PL and the AI Engine.
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 2b76885afd..22a8fa5d11 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -14,6 +14,7 @@
>   
>   #include "hw/sysbus.h"
>   #include "hw/arm/boot.h"
> +#include "hw/or-irq.h"
>   #include "hw/sd/sdhci.h"
>   #include "hw/intc/arm_gicv3.h"
>   #include "hw/char/pl011.h"
> @@ -22,6 +23,7 @@
>   #include "hw/rtc/xlnx-zynqmp-rtc.h"
>   #include "qom/object.h"
>   #include "hw/usb/xlnx-usb-subsystem.h"
> +#include "hw/misc/xlnx-versal-xramc.h"
>   
>   #define TYPE_XLNX_VERSAL "xlnx-versal"
>   OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> @@ -31,6 +33,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
>   #define XLNX_VERSAL_NR_GEMS    2
>   #define XLNX_VERSAL_NR_ADMAS   8
>   #define XLNX_VERSAL_NR_SDS     2
> +#define XLNX_VERSAL_NR_XRAM    4
>   #define XLNX_VERSAL_NR_IRQS    192
>   
>   struct Versal {
> @@ -62,6 +65,11 @@ struct Versal {
>               XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
>               VersalUsb2 usb;
>           } iou;
> +
> +        struct {
> +            qemu_or_irq irq_orgate;
> +            XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
> +        } xram;
>       } lpd;
>   
>       /* The Platform Management Controller subsystem.  */
> @@ -96,6 +104,7 @@ struct Versal {
>   #define VERSAL_GEM1_IRQ_0          58
>   #define VERSAL_GEM1_WAKE_IRQ_0     59
>   #define VERSAL_ADMA_IRQ_0          60
> +#define VERSAL_XRAM_IRQ_0          79
>   #define VERSAL_RTC_APB_ERR_IRQ     121
>   #define VERSAL_SD0_IRQ_0           126
>   #define VERSAL_RTC_ALARM_IRQ       142
> @@ -128,6 +137,10 @@ struct Versal {
>   #define MM_OCM                      0xfffc0000U
>   #define MM_OCM_SIZE                 0x40000
>   
> +#define MM_XRAM                     0xfe800000
> +#define MM_XRAMC                    0xff8e0000
> +#define MM_XRAMC_SIZE               0x10000
> +
>   #define MM_USB2_CTRL_REGS           0xFF9D0000
>   #define MM_USB2_CTRL_REGS_SIZE      0x10000
>   
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 628e77ef66..79609692e4 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
> @@ -278,6 +279,40 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
>       sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
>   }
>   
> +static void versal_create_xrams(Versal *s, qemu_irq *pic)
> +{
> +    int nr_xrams = ARRAY_SIZE(s->lpd.xram.ctrl);
> +    DeviceState *orgate;
> +    int i;
> +
> +    /* XRAM IRQs get ORed into a single line.  */
> +    object_initialize_child(OBJECT(s), "xram-irq-orgate",
> +                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> +    orgate = DEVICE(&s->lpd.xram.irq_orgate);
> +    object_property_set_int(OBJECT(orgate),
> +                            "num-lines", nr_xrams, &error_fatal);
> +    qdev_realize(orgate, NULL, &error_fatal);
> +    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_XRAM_IRQ_0]);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.xram.ctrl); i++) {
> +        SysBusDevice *sbd;
> +        MemoryRegion *mr;
> +
> +        object_initialize_child(OBJECT(s), "xram[*]", &s->lpd.xram.ctrl[i],
> +                                TYPE_XLNX_XRAM_CTRL);
> +        sbd = SYS_BUS_DEVICE(&s->lpd.xram.ctrl[i]);
> +        sysbus_realize(sbd, &error_fatal);
> +
> +        mr = sysbus_mmio_get_region(sbd, 0);
> +        memory_region_add_subregion(&s->mr_ps,
> +                                    MM_XRAMC + i * MM_XRAMC_SIZE, mr);
> +        mr = sysbus_mmio_get_region(sbd, 1);
> +        memory_region_add_subregion(&s->mr_ps, MM_XRAM + i * MiB, mr);
> +
> +        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(orgate, i));
> +    }
> +}
> +
>   /* This takes the board allocated linear DDR memory and creates aliases
>    * for each split DDR range/aperture on the Versal address map.
>    */
> @@ -363,6 +398,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>       versal_create_admas(s, pic);
>       versal_create_sds(s, pic);
>       versal_create_rtc(s, pic);
> +    versal_create_xrams(s, pic);
>       versal_map_ddr(s);
>       versal_unimp(s);
>   
> 

