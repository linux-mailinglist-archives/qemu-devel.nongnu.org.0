Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB817593A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:10:45 +0100 (CET)
Received: from localhost ([::1]:58743 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8iyC-0004bE-Nr
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1j8iue-0002NO-3o
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1j8iud-0006uK-2o
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:07:04 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:56634)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1j8iua-0006o0-1G; Mon, 02 Mar 2020 06:07:00 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A03FB96EF0;
 Mon,  2 Mar 2020 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1583147217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tqr80Gmb4Vsg8r4+Y8tb98TPEaXHIi9GT3Kj4m2KoY=;
 b=plY1OfboyrX1VR3OZpTyJRzZs5V5lL9tctFyVEReF2B8sEao1pCMDrGFzBO38TdafX+hrR
 mUi+WColrdgw98Myz3wxD/M5sbeiiQaSFlv7gqvSUoAHzH9SI72OrXwPTF7wnKI8HRgc5Q
 CICYrxz1nv9Gr0HaK4/3TGrQkB15PEo=
Subject: Re: [PATCH v1 1/2] hw/arm: versal: Add support for the LPD ADMAs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200227154424.6849-1-edgar.iglesias@gmail.com>
 <20200227154424.6849-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <74e99888-71fd-d6ed-2029-0cef097c12e4@greensocs.com>
Date: Mon, 2 Mar 2020 12:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227154424.6849-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1583147217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tqr80Gmb4Vsg8r4+Y8tb98TPEaXHIi9GT3Kj4m2KoY=;
 b=v9z32Re1AmPmkBi0ir/Kq4utMYbl3Iwo90Zlg6GA1KiDNKOc8QNR2QgJlGGax2BQU78Q3N
 DfBDWGzcJ1+hlh94ZmLtDhrHqfvtiwoAfAz6gMUaF/0+Y1LTGlW/1nkZIHLUQ5XuSRVx0C
 jo0t79NNfl3ji8nuOyJTGSUxJjzxMeI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1583147217; a=rsa-sha256; cv=none;
 b=uKo/MEYMKk4FfPrPqlScMgZ/6j1ujkC/9fRepao66a0pEOjENlKVkkrQ0kvnQfpIqfcQhH
 Ykur1Bv5iktsBXCWDxFHXi2GD9rW6cilLN9R1GLfbI0TDZl/MDnrL9OlylCVVG7ciGxwhW
 qKOn4SaMo/JGyPIfQ7ayNs15w2O0F3M=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

On 2/27/20 4:44 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for the Versal LPD ADMAs.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/xlnx-versal.c         | 24 ++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h |  6 ++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 1cf3daaf4f..f9beba07ed 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -193,6 +193,29 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_admas(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.adma); i++) {
> +        char *name = g_strdup_printf("adma%d", i);
> +        DeviceState *dev;
> +        MemoryRegion *mr;
> +
> +        dev = qdev_create(NULL, "xlnx.zdma");
> +        s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
> +        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
> +        qdev_init_nofail(dev);
> +
> +        mr = sysbus_mmio_get_region(s->lpd.iou.adma[i], 0);
> +        memory_region_add_subregion(&s->mr_ps,
> +                                    MM_ADMA_CH0 + i * MM_ADMA_CH0_SIZE, mr);
> +
> +        sysbus_connect_irq(s->lpd.iou.adma[i], 0, pic[VERSAL_ADMA_IRQ_0 + i]);
> +        g_free(name);
> +    }
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -274,6 +297,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_apu_gic(s, pic);
>      versal_create_uarts(s, pic);
>      versal_create_gems(s, pic);
> +    versal_create_admas(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index d844c4ffe4..6c0a692b2f 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -22,6 +22,7 @@
>  #define XLNX_VERSAL_NR_ACPUS   2
>  #define XLNX_VERSAL_NR_UARTS   2
>  #define XLNX_VERSAL_NR_GEMS    2
> +#define XLNX_VERSAL_NR_ADMAS   8
>  #define XLNX_VERSAL_NR_IRQS    192
>  
>  typedef struct Versal {
> @@ -50,6 +51,7 @@ typedef struct Versal {
>          struct {
>              SysBusDevice *uart[XLNX_VERSAL_NR_UARTS];
>              SysBusDevice *gem[XLNX_VERSAL_NR_GEMS];
> +            SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
>          } iou;
>      } lpd;
>  
> @@ -74,6 +76,7 @@ typedef struct Versal {
>  #define VERSAL_GEM0_WAKE_IRQ_0     57
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
> +#define VERSAL_ADMA_IRQ_0          60
>  
>  /* Architecturally reserved IRQs suitable for virtualization.  */
>  #define VERSAL_RSVD_IRQ_FIRST 111
> @@ -96,6 +99,9 @@ typedef struct Versal {
>  #define MM_GEM1                     0xff0d0000U
>  #define MM_GEM1_SIZE                0x10000
>  
> +#define MM_ADMA_CH0                 0xffa80000U
> +#define MM_ADMA_CH0_SIZE            0x10000
> +
>  #define MM_OCM                      0xfffc0000U
>  #define MM_OCM_SIZE                 0x40000
>  
> 

