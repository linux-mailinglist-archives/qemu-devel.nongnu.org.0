Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8AE1BD6A3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:55:51 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jThZO-0006Xe-I6
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jTh8g-0003mW-A2
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jTh8e-0001As-OR
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:28:14 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jTh8a-00019Z-Ak; Wed, 29 Apr 2020 03:28:08 -0400
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4E64B96EF0;
 Wed, 29 Apr 2020 07:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1588145286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+oPHhde0F8msTSP4zd+yT+EMw9Adx79AS57Lu+uy4E=;
 b=4aylJ0joeYAkvJ3lkmurPFxvnODU3kSEkXN3AYwMlG/0PpEF5SJRPZ2a6f/ckpYaUPxS2B
 Ocw9GpBn71KoIhs6Hl3ukv+FTyh6MG6dxi8VEvB/EI5PsrhQ3WouNPQI1k87MiJCSb2Q64
 qAR7O8u1ab5aIceodI62FavXMjuuU6o=
Subject: Re: [PATCH v1 06/11] hw/arm: versal: Embedd the ADMAs into the SoC
 type
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-7-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <9b03a2aa-7a14-c3d9-f0bc-d1e00ee6832b@greensocs.com>
Date: Wed, 29 Apr 2020 09:28:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427181649.26851-7-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1588145286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+oPHhde0F8msTSP4zd+yT+EMw9Adx79AS57Lu+uy4E=;
 b=QJiVqxXfBD9YlXI5duYEudwcncF9vV9Tij1GJQYwmConbvMlL7I4fdwrBaHb2VFH3p66ik
 Z01hsccDl7YB8PBDqFU9Yrf9j9+hhQrhcxhWsxc3sn9zlpMElwuQpnZp4cZPELChdodYOR
 fLyAbcyEkn3B0BN3EL0o+Jo/7xVbK9s=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1588145286; a=rsa-sha256; cv=none;
 b=hZwdasvj+aDYtLBTHS+IPQ6IcT1PNGLmgwghZ85xejG5ul9SkufEecC/hoLQ7xddvd131/
 VVoQmmpaNO3W1gwaPc7hDXu0HSTAKRoU2PNiLzjqmkBlWGToGC2bRdyLziarBM4oCN0lGF
 fCCZWPbTFRPlS/WCWYBOVF4XwlZ7U6k=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 03:23:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 5.135.226.135
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/20 8:16 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Embedd the ADMAs into the SoC type.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/xlnx-versal.c         | 14 +++++++-------
>  include/hw/arm/xlnx-versal.h |  3 ++-
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index e424aa789e..ebd2dc51be 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -203,18 +203,18 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
>          DeviceState *dev;
>          MemoryRegion *mr;
>  
> -        dev = qdev_create(NULL, "xlnx.zdma");
> -        s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
> -        object_property_set_int(OBJECT(s->lpd.iou.adma[i]), 128, "bus-width",
> -                                &error_abort);
> -        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
> +        sysbus_init_child_obj(OBJECT(s), name,
> +                              &s->lpd.iou.adma[i], sizeof(s->lpd.iou.adma[i]),
> +                              TYPE_XLNX_ZDMA);
> +        dev = DEVICE(&s->lpd.iou.adma[i]);
> +        object_property_set_int(OBJECT(dev), 128, "bus-width", &error_abort);
>          qdev_init_nofail(dev);
>  
> -        mr = sysbus_mmio_get_region(s->lpd.iou.adma[i], 0);
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->mr_ps,
>                                      MM_ADMA_CH0 + i * MM_ADMA_CH0_SIZE, mr);
>  
> -        sysbus_connect_irq(s->lpd.iou.adma[i], 0, pic[VERSAL_ADMA_IRQ_0 + i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[VERSAL_ADMA_IRQ_0 + i]);
>          g_free(name);
>      }
>  }
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 01da736a5b..94b7826fd4 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -16,6 +16,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "hw/char/pl011.h"
> +#include "hw/dma/xlnx-zdma.h"
>  #include "hw/net/cadence_gem.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
> @@ -53,7 +54,7 @@ typedef struct Versal {
>          struct {
>              PL011State uart[XLNX_VERSAL_NR_UARTS];
>              CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
> -            SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
> +            XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
>          } iou;
>      } lpd;
>  
> 

