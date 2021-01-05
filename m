Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248302EABAD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:17:58 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmDj-0004RW-F9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1kwmB5-0003b6-Oa
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:15:11 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1kwmB2-0006Wk-Mr
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:15:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id i9so36144369wrc.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hOh1QKqxGqfQWcqkHit39lm3eqWQaQZt9dsxinmUfIQ=;
 b=lpzVjMhL+dISKfEj1RUsfbDssD+evaiQZyE18AQJO26AepB4fe13ktvUDtOCjD2+CU
 7zSxf6/OEanONFUEqwXD/xCH2FFZqLuPaFVKm+5JeSmwwscX98ibvt5JZ0VgXqZv5kPh
 YBNBBomFfsTk4JPZdF0fdP6+SgadKsvbEBKd4//KVFvtOHLj+ydOI2SMx1OPZ3vOiTH+
 tz+IKw3DdP99jHfIPS3rM1/a/j4Wu3CgsqzEe7Z0HUx4PZR5esji/hyhhLf+9Klf7KIZ
 +GG41E4qxjWBCrV0rt9iHqlXOcIo2t67gLeVfb3PaQpzeI6sIFbDfQaQcRqGva8CsuHn
 Z67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hOh1QKqxGqfQWcqkHit39lm3eqWQaQZt9dsxinmUfIQ=;
 b=Slg5duoLgjxlURthfqbbQZc2V74BLwBvrddKrOWMSftU7wCsLpNDmvL7mhDa8PRqCa
 3zakZex+XaqmrnIRdT/0SW6eZ/DBF4r2Mkoc+y2QCwxBxZLS7XgfbaWHmDUgLuSrt/Xs
 BHJvN6jjY+mO996kHj15zFlFquspFfYQccxetB7kgqNHCKhb4ZtQ2J9N3fFfIBMQ6F/8
 m0k1LR2tLs4ON61fZ0UErijtAovEzYqA9+I9q+LptCqmwme5/r/iGzz8otFwHYGt1DLa
 vm3ssZV0Epalqwh+d9oUaeCs1ZvbsaRsuRRgl6WdS7KQx3XRWTF7RDkenmmpa4E2VDK6
 froA==
X-Gm-Message-State: AOAM532+MnqUhdoT1dgh/iE/XhY2QqUH10oa7APXRnKyL4p9zHZAaULP
 hNBdqP4Feyhbmk4I7fz3du1VHQ==
X-Google-Smtp-Source: ABdhPJzHyrwyYxG72Leu9tm8rx+GtET6KN1Vg2tKUpjN26aimj5JqKffstzJKYrqMkqJ9zG20q5NPg==
X-Received: by 2002:adf:f344:: with SMTP id e4mr85321386wrp.25.1609852506633; 
 Tue, 05 Jan 2021 05:15:06 -0800 (PST)
Received: from localhost.localdomain
 (alille-651-1-136-169.w90-1.abo.wanadoo.fr. [90.1.135.169])
 by smtp.gmail.com with ESMTPSA id u66sm4109632wmg.30.2021.01.05.05.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:15:06 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/sparc: Make grlib-irqmp device handle its own
 inbound IRQ lines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212144134.29594-1-peter.maydell@linaro.org>
 <20201212144134.29594-2-peter.maydell@linaro.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <22ac63da-db96-e519-d063-58b4ea4f78c5@adacore.com>
Date: Tue, 5 Jan 2021 14:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201212144134.29594-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Peter,

Le 12/12/20 à 3:41 PM, Peter Maydell a écrit :
> Currently the GRLIB_IRQMP device is used in one place (the leon3 board),
> but instead of the device providing inbound gpio lines for the board
> to wire up, the board code itself calls qemu_allocate_irqs() with
> the handler function being a set_irq function defined in the code
> for the device.
> 
> Refactor this into the standard setup of a device having input
> gpio lines.
> 
> This fixes a trivial Coverity memory leak report (the leon3
> board code leaks the IRQ array returned from qemu_allocate_irqs()).
> 
> Fixes: Coverity CID 1421922
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/sparc/grlib.h |  2 --
>   hw/intc/grlib_irqmp.c    |  5 ++++-
>   hw/sparc/leon3.c         | 21 +++++++++------------
>   3 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
> index 78b6178fcd8..e1d1beaa73f 100644
> --- a/include/hw/sparc/grlib.h
> +++ b/include/hw/sparc/grlib.h
> @@ -36,8 +36,6 @@
>   
>   typedef void (*set_pil_in_fn) (void *opaque, uint32_t pil_in);
>   
> -void grlib_irqmp_set_irq(void *opaque, int irq, int level);
> -
>   void grlib_irqmp_ack(DeviceState *dev, int intno);
>   
>   /* GPTimer */
> diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
> index ffec4a07eec..984334fa7bf 100644
> --- a/hw/intc/grlib_irqmp.c
> +++ b/hw/intc/grlib_irqmp.c
> @@ -51,6 +51,8 @@
>   #define FORCE_OFFSET     0x80
>   #define EXTENDED_OFFSET  0xC0
>   
> +#define MAX_PILS 16
> +
>   OBJECT_DECLARE_SIMPLE_TYPE(IRQMP, GRLIB_IRQMP)
>   
>   typedef struct IRQMPState IRQMPState;
> @@ -126,7 +128,7 @@ void grlib_irqmp_ack(DeviceState *dev, int intno)
>       grlib_irqmp_ack_mask(state, mask);
>   }
>   
> -void grlib_irqmp_set_irq(void *opaque, int irq, int level)
> +static void grlib_irqmp_set_irq(void *opaque, int irq, int level)
>   {
>       IRQMP      *irqmp = GRLIB_IRQMP(opaque);
>       IRQMPState *s;
> @@ -328,6 +330,7 @@ static void grlib_irqmp_init(Object *obj)
>       IRQMP *irqmp = GRLIB_IRQMP(obj);
>       SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>   
> +    qdev_init_gpio_in(DEVICE(obj), grlib_irqmp_set_irq, MAX_PILS);
>       qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1);
>       memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
>                             "irqmp", IRQMP_REG_SIZE);
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index 4bc4ebea841..7e16eea9e67 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -52,8 +52,6 @@
>   #define LEON3_PROM_OFFSET    (0x00000000)
>   #define LEON3_RAM_OFFSET     (0x40000000)
>   
> -#define MAX_PILS 16
> -
>   #define LEON3_UART_OFFSET  (0x80000100)
>   #define LEON3_UART_IRQ     (3)
>   
> @@ -194,11 +192,10 @@ static void leon3_generic_hw_init(MachineState *machine)
>       MemoryRegion *prom = g_new(MemoryRegion, 1);
>       int         ret;
>       char       *filename;
> -    qemu_irq   *cpu_irqs = NULL;
>       int         bios_size;
>       int         prom_size;
>       ResetData  *reset_info;
> -    DeviceState *dev;
> +    DeviceState *dev, *irqmpdev;
>       int i;
>       AHBPnp *ahb_pnp;
>       APBPnp *apb_pnp;
> @@ -230,16 +227,15 @@ static void leon3_generic_hw_init(MachineState *machine)
>                               GRLIB_AHB_SLAVE, GRLIB_AHBMEM_AREA);
>   
>       /* Allocate IRQ manager */
> -    dev = qdev_new(TYPE_GRLIB_IRQMP);
> +    irqmpdev = qdev_new(TYPE_GRLIB_IRQMP);
>       qdev_init_gpio_in_named_with_opaque(DEVICE(cpu), leon3_set_pil_in,
>                                           env, "pil", 1);
> -    qdev_connect_gpio_out_named(dev, "grlib-irq", 0,
> +    qdev_connect_gpio_out_named(irqmpdev, "grlib-irq", 0,
>                                   qdev_get_gpio_in_named(DEVICE(cpu), "pil", 0));
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_IRQMP_OFFSET);
> -    env->irq_manager = dev;
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(irqmpdev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(irqmpdev), 0, LEON3_IRQMP_OFFSET);
> +    env->irq_manager = irqmpdev;
>       env->qemu_irq_ack = leon3_irq_manager;
> -    cpu_irqs = qemu_allocate_irqs(grlib_irqmp_set_irq, dev, MAX_PILS);
>       grlib_apb_pnp_add_entry(apb_pnp, LEON3_IRQMP_OFFSET, 0xFFF,
>                               GRLIB_VENDOR_GAISLER, GRLIB_IRQMP_DEV,
>                               2, 0, GRLIB_APBIO_AREA);
> @@ -330,7 +326,7 @@ static void leon3_generic_hw_init(MachineState *machine)
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_TIMER_OFFSET);
>       for (i = 0; i < LEON3_TIMER_COUNT; i++) {
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> -                           cpu_irqs[LEON3_TIMER_IRQ + i]);
> +                           qdev_get_gpio_in(irqmpdev, LEON3_TIMER_IRQ + i));
>       }
>   
>       grlib_apb_pnp_add_entry(apb_pnp, LEON3_TIMER_OFFSET, 0xFFF,
> @@ -342,7 +338,8 @@ static void leon3_generic_hw_init(MachineState *machine)
>       qdev_prop_set_chr(dev, "chrdev", serial_hd(0));
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_UART_OFFSET);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irqs[LEON3_UART_IRQ]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                       qdev_get_gpio_in(irqmpdev, LEON3_UART_IRQ));
>       grlib_apb_pnp_add_entry(apb_pnp, LEON3_UART_OFFSET, 0xFFF,
>                               GRLIB_VENDOR_GAISLER, GRLIB_APBUART_DEV, 1,
>                               LEON3_UART_IRQ, GRLIB_APBIO_AREA);
> 

LGTM, thanks!

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

