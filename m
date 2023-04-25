Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DAE6EE4D9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:37:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prKid-000733-Fd; Tue, 25 Apr 2023 11:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prKib-00072l-ND; Tue, 25 Apr 2023 11:36:37 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prKiW-0004DD-Eh; Tue, 25 Apr 2023 11:36:37 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4efef769000so3011842e87.3; 
 Tue, 25 Apr 2023 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682436986; x=1685028986;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TIjQ+Y1WeGcT8/p3GZLKpXWlwd0jCjkVPDmSIn/H/w=;
 b=WFkelQnSg3iIoDKzKvAHImNbzgtppT6z3VYgkwRVsgN2A7fYILTjdZgvAy3dZtZTtz
 Lmrh69YeyARwwO7/sSIKFP83dtSvJgeUHKC7MSAF3gF4R5UoUyVq1I2sRCdRFG/chACn
 4uxnF7Dp/oFJprI6cT4x/M62lBbZ18Uy5LJqP7W+4YR0i6Z2LrDeJazf1X7Jy3XxCvPk
 mwoqHydRAwAiRBoldDRLyP+wjhixFBWaFaJ+guWwn/61djul9lbttlqg/4Bo1bNWDE2o
 Ob3eSt4ebEDR/5Qu333TQsRt0IwkxCWhLeUeTtf1PpAsqiFGniA1tPx5yOCRi/PGaLp5
 dPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682436986; x=1685028986;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8TIjQ+Y1WeGcT8/p3GZLKpXWlwd0jCjkVPDmSIn/H/w=;
 b=UGVWAU+ev0K+odMDcQm7DaeuSvfvKg2HyPVbOOfBam4X8TvjvPX6SX959xpY5mZb3C
 WiEOg4An8KAlofIjqOJqc0oMHFJzHsResjca3IMSQE2jtBse1RHRn3gNvGW4R1soRlBC
 BiKPvDVZDNBGjp91rn6nyjiCZr5aAVriVVimwUmXYX9jIjmBtdeQVr2TNMIGCTwo1X1W
 tZSlZhTuiqwA5Fkll9/Ay4d/tZD5TZWkcPyYGSfoJn77VzHauSkpcw3yrHdQodm29rgw
 kt2rS53zfYk46y9mahUD0Y71qqENLUeaJ7pLycn9vmKdgzfGhgCANsg3136Nyq1m2Zt8
 CBLw==
X-Gm-Message-State: AAQBX9fEE6+CCDiH9vc8mSifGK2fIcRKCqJOTwQwg5jV5Rm1f5N5mOHH
 lv66V7O9xxQo7F4s+0eFrp0=
X-Google-Smtp-Source: AKy350ZxIlAKS0oZl0kHFNKQ5ius+EPyy1pGNZlymHyxCDeaiYX9qkx+Mw0OcClHxp5f6jLjzWBaJA==
X-Received: by 2002:a05:6512:20e:b0:4eb:1527:e29d with SMTP id
 a14-20020a056512020e00b004eb1527e29dmr5054390lfo.52.1682436986025; 
 Tue, 25 Apr 2023 08:36:26 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 b21-20020ac25635000000b004edc307b706sm2100134lff.244.2023.04.25.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 08:36:25 -0700 (PDT)
Date: Tue, 25 Apr 2023 17:36:24 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v4 3/4] xlnx-versal: Connect Xilinx VERSAL CANFD
 controllers
Message-ID: <20230425153623.GB7006@fralle-msi>
References: <20230425063433.25803-1-vikram.garhwal@amd.com>
 <20230425063433.25803-4-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425063433.25803-4-vikram.garhwal@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01, USER_IN_WHITELIST=-100,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Vikram,

On [2023 Apr 24] Mon 23:34:32, Vikram Garhwal wrote:
> Connect CANFD0 and CANFD1 on the Versal-virt machine and update xlnx-versal-virt
> document with CANFD command line examples.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/xlnx-versal-virt.rst | 31 ++++++++++++++++++
>  hw/arm/xlnx-versal-virt.c            | 48 ++++++++++++++++++++++++++++
>  hw/arm/xlnx-versal.c                 | 37 +++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h         | 12 +++++++
>  4 files changed, 128 insertions(+)
> 
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 92ad10d2da..d2d1b26692 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -34,6 +34,7 @@ Implemented devices:
>  - DDR memory
>  - BBRAM (36 bytes of Battery-backed RAM)
>  - eFUSE (3072 bytes of one-time field-programmable bit array)
> +- 2 CANFDs
>  
>  QEMU does not yet model any other devices, including the PL and the AI Engine.
>  
> @@ -224,3 +225,33 @@ To use a different index value, N, from default of 1, add:
>  
>    Better yet, do not use actual product data when running guest image
>    on this Xilinx Versal Virt board.
> +
> +Using CANFDs for Versal Virt
> +""""""""""""""""""""""""""""
> +Versal CANFD controller is developed based on SocketCAN and QEMU CAN bus
> +implementation. Bus connection and socketCAN connection for each CAN module
> +can be set through command lines.
> +
> +To connect both CANFD0 and CANFD1 on the same bus:
> +
> +.. code-block:: bash
> +
> +    -object can-bus,id=canbus -machine canbus0=canbus -machine canbus1=canbus
> +
> +To connect CANFD0 and CANFD1 to separate buses:
> +
> +.. code-block:: bash
> +
> +    -object can-bus,id=canbus0 -object can-bus,id=canbus1 \
> +    -machine canbus0=canbus0 -machine canbus1=canbus1
> +
> +The SocketCAN interface can connect to a Physical or a Virtual CAN interfaces on
> +the host machine. Please check this document to learn about CAN interface on
> +Linux: docs/system/devices/can.rst
> +
> +To connect CANFD0 and CANFD1 to host machine's CAN interface can0:
> +
> +.. code-block:: bash
> +
> +    -object can-bus,id=canbus -machine canbus0=canbus -machine canbus1=canbus
> +    -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 668a9d65a4..52c93a590d 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -40,9 +40,11 @@ struct VersalVirt {
>          uint32_t clk_25Mhz;
>          uint32_t usb;
>          uint32_t dwc;
> +        uint32_t canfd[2];
>      } phandle;
>      struct arm_boot_info binfo;
>  
> +    CanBusState *canbus[XLNX_VERSAL_NR_CANFD];
>      struct {
>          bool secure;
>      } cfg;
> @@ -235,6 +237,33 @@ static void fdt_add_uart_nodes(VersalVirt *s)
>      }
>  }
>  
> +static void fdt_add_canfd_nodes(VersalVirt *s)
> +{

In this function we need to modify the generated dtb a little so the kernel
finds the devices correctly.

> +    uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
> +    uint32_t size[] = { MM_CANFD0_SIZE, MM_CANFD1_SIZE };
> +    unsigned int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0 };


Here we can swap above 3 lines for below:

    uint64_t addrs[] = { MM_CANFD1, MM_CANFD0 };
    uint32_t size[] = { MM_CANFD1_SIZE, MM_CANFD0_SIZE };
    unsigned int irqs[] = { VERSAL_CANFD1_IRQ_0, VERSAL_CANFD0_IRQ_0 };
    const char clocknames[] = "can_clk\0s_axi_aclk";


> +    int i;
> +
> +    /* Create and connect CANFD0 and CANFD1 nodes to canbus0. */
> +    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
> +        char *name = g_strdup_printf("/canfd@%" PRIx64, addrs[i]);
> +        qemu_fdt_add_subnode(s->fdt, name);


> +        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo0", 0x40);
> +        qemu_fdt_setprop_cell(s->fdt, name, "enable-rx-fifo1", 0x1);
> +        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo1", 0x40);

Here we can swap above for 3 lines for below:

        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo-depth", 0x40);
        qemu_fdt_setprop_cell(s->fdt, name, "tx-mailbox-count", 0x20);

        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
        qemu_fdt_setprop(s->fdt, name, "clock-names",
                         clocknames, sizeof(clocknames));


> +
> +        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
> +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                     2, addrs[i], 2, size[i]);
> +        qemu_fdt_setprop_string(s->fdt, name, "compatible",


> +                                "xlnx,versal-canfd");

And here we can swap above line with (kernel compatible):

                                "xlnx,canfd-2.0");

After changing above the linux kernel will find the devices:

...
[    1.791998] CAN device driver interface
[    1.732791] xilinx_can ff060000.canfd can0: reg_base=0x(____ptrval____) irq=28 clock=25000000, tx buffers: actual 32, using 1
[    1.734668] xilinx_can ff070000.canfd can1: reg_base=0x(____ptrval____) irq=29 clock=25000000, tx buffers: actual 32, using 1
...

...
#  ip a
...
2: can0: <NOARP40000> mtu 16 qdisc noop qlen 10
    link/[280] 
3: can1: <NOARP40000> mtu 16 qdisc noop qlen 10
    link/[280] 
...

Looks good otherwise!

Best regards,
Francisco Iglesias


> +
> +        g_free(name);
> +    }
> +}
> +
>  static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
>                                       uint32_t phandle)
>  {
> @@ -639,12 +668,17 @@ static void versal_virt_init(MachineState *machine)
>                              TYPE_XLNX_VERSAL);
>      object_property_set_link(OBJECT(&s->soc), "ddr", OBJECT(machine->ram),
>                               &error_abort);
> +    object_property_set_link(OBJECT(&s->soc), "canbus0", OBJECT(s->canbus[0]),
> +                             &error_abort);
> +    object_property_set_link(OBJECT(&s->soc), "canbus1", OBJECT(s->canbus[1]),
> +                             &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>  
>      fdt_create(s);
>      create_virtio_regions(s);
>      fdt_add_gem_nodes(s);
>      fdt_add_uart_nodes(s);
> +    fdt_add_canfd_nodes(s);
>      fdt_add_gic_nodes(s);
>      fdt_add_timer_nodes(s);
>      fdt_add_zdma_nodes(s);
> @@ -712,6 +746,20 @@ static void versal_virt_init(MachineState *machine)
>  
>  static void versal_virt_machine_instance_init(Object *obj)
>  {
> +    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(obj);
> +
> +    /*
> +     * User can set canbus0 and canbus1 properties to can-bus object and connect
> +     * to socketcan(optional) interface via command line.
> +     */
> +    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
> +                             (Object **)&s->canbus[0],
> +                             object_property_allow_set_link,
> +                             0);
> +    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
> +                             (Object **)&s->canbus[1],
> +                             object_property_allow_set_link,
> +                             0);
>  }
>  
>  static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 69b1b99e93..1594dd6c5c 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -184,6 +184,38 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_canfds(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +    uint32_t irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0};
> +    uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.canfd); i++) {
> +        char *name = g_strdup_printf("canfd%d", i);
> +        SysBusDevice *sbd;
> +        MemoryRegion *mr;
> +
> +        object_initialize_child(OBJECT(s), name, &s->lpd.iou.canfd[i],
> +                                TYPE_XILINX_CANFD);
> +        sbd = SYS_BUS_DEVICE(&s->lpd.iou.canfd[i]);
> +
> +        object_property_set_int(OBJECT(&s->lpd.iou.canfd[i]), "ext_clk_freq",
> +                                XLNX_VERSAL_CANFD_REF_CLK , &error_abort);
> +
> +        object_property_set_link(OBJECT(&s->lpd.iou.canfd[i]), "canfdbus",
> +                                 OBJECT(s->lpd.iou.canbus[i]),
> +                                 &error_abort);
> +
> +        sysbus_realize(sbd, &error_fatal);
> +
> +        mr = sysbus_mmio_get_region(sbd, 0);
> +        memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
> +
> +        sysbus_connect_irq(sbd, 0, pic[irqs[i]]);
> +        g_free(name);
> +    }
> +}
> +
>  static void versal_create_usbs(Versal *s, qemu_irq *pic)
>  {
>      DeviceState *dev;
> @@ -718,6 +750,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_apu_gic(s, pic);
>      versal_create_rpu_cpus(s);
>      versal_create_uarts(s, pic);
> +    versal_create_canfds(s, pic);
>      versal_create_usbs(s, pic);
>      versal_create_gems(s, pic);
>      versal_create_admas(s, pic);
> @@ -757,6 +790,10 @@ static void versal_init(Object *obj)
>  static Property versal_properties[] = {
>      DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
> +    DEFINE_PROP_LINK("canbus0", Versal, lpd.iou.canbus[0],
> +                      TYPE_CAN_BUS, CanBusState *),
> +    DEFINE_PROP_LINK("canbus1", Versal, lpd.iou.canbus[1],
> +                      TYPE_CAN_BUS, CanBusState *),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index b6786e9832..39ee31185c 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -31,6 +31,7 @@
>  #include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/misc/xlnx-versal-crl.h"
>  #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
> +#include "hw/net/xlnx-versal-canfd.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> @@ -43,6 +44,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
>  #define XLNX_VERSAL_NR_SDS     2
>  #define XLNX_VERSAL_NR_XRAM    4
>  #define XLNX_VERSAL_NR_IRQS    192
> +#define XLNX_VERSAL_NR_CANFD   2
> +#define XLNX_VERSAL_CANFD_REF_CLK (24 * 1000 * 1000)
>  
>  struct Versal {
>      /*< private >*/
> @@ -73,6 +76,8 @@ struct Versal {
>              CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
>              XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
>              VersalUsb2 usb;
> +            CanBusState *canbus[XLNX_VERSAL_NR_CANFD];
> +            XlnxVersalCANFDState canfd[XLNX_VERSAL_NR_CANFD];
>          } iou;
>  
>          /* Real-time Processing Unit.  */
> @@ -133,6 +138,8 @@ struct Versal {
>  #define VERSAL_CRL_IRQ             10
>  #define VERSAL_UART0_IRQ_0         18
>  #define VERSAL_UART1_IRQ_0         19
> +#define VERSAL_CANFD0_IRQ_0        20
> +#define VERSAL_CANFD1_IRQ_0        21
>  #define VERSAL_USB0_IRQ_0          22
>  #define VERSAL_GEM0_IRQ_0          56
>  #define VERSAL_GEM0_WAKE_IRQ_0     57
> @@ -163,6 +170,11 @@ struct Versal {
>  #define MM_UART1                    0xff010000U
>  #define MM_UART1_SIZE               0x10000
>  
> +#define MM_CANFD0                   0xff060000U
> +#define MM_CANFD0_SIZE              0x10000
> +#define MM_CANFD1                   0xff070000U
> +#define MM_CANFD1_SIZE              0x10000
> +
>  #define MM_GEM0                     0xff0c0000U
>  #define MM_GEM0_SIZE                0x10000
>  #define MM_GEM1                     0xff0d0000U
> -- 
> 2.17.1
> 

