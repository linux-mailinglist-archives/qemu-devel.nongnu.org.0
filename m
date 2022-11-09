Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C6623029
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnus-0005Vg-0e; Wed, 09 Nov 2022 11:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1osnuq-0005VR-EF; Wed, 09 Nov 2022 11:27:04 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1osnuo-0006Ng-5g; Wed, 09 Nov 2022 11:27:04 -0500
Received: by mail-lf1-x129.google.com with SMTP id d6so26454368lfs.10;
 Wed, 09 Nov 2022 08:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbhdZiLWBGssNfNLCFCuTrGtCzbR6/msyx0LPM6TRpc=;
 b=BsGf+NIH1vzg7xswSN2Vtmin1rjGjEbLHQJeJ4luQGZ2zOWqZrg6kv+oBXraFDwEx9
 1NL3q/r+N4mDMvgj8q0uHy0wO+KC6F41tSYgIlBTBYl57ljbMysdAhx8PLaNIA3i7qrF
 v+GZDKLd50K7RD2G2PUiVhZpXzXSiEGlVQ2YRuaX4Au8dlZswGyh/Dv1XSFCz22lyyiG
 Tj+wvWiPe5JkQ+ElWMB07n1gCfg7GzZZnFCLucH8qD+cukDhsaA3n0xccMTBEqK5Boqe
 gK1qlwKhT6R7DBgNUL9njD95GgwPl9pHy57E8QlMmpp13bONnewliijImpxoz/OsvtI4
 CKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbhdZiLWBGssNfNLCFCuTrGtCzbR6/msyx0LPM6TRpc=;
 b=ddByxMlwVqdUcOy0t78eHUMgNWFp48EfdtXJhWlfyofaasH2yYZJxOqeo32k1I189a
 AutKT2g5Yc+0mltfVqAB8z2TU+v/+Fl9Gv13AD7eNMI4TMJSk24LxQ/nzTXYnDFNgT5j
 SIcgEd6KtUo+yW6BAcqVG/ANOaqsLuLBgSYOXH/IcYcUbAb5RygY4ZQf+WiUk+YP+Ayl
 /mVQ9fyjmQzcLc2nih0+jY5kL2JMI4lGHtEmzZwdw5ZslfRwdgRxa+ZiCAuvvybxArcv
 eihbNunnKjPJ1rFZ6gh2hYB3fM3IfS+dtOBFM/oqb4IiR3lHzU9IUibVs6uwYbztttcL
 5K+A==
X-Gm-Message-State: ACrzQf205Uk0zp5DCcV/R3G7U21595/M2koio99lItQ9vfNx9xJOHEpB
 ivqWYWjq7c0vmPsHfU0Hh/o=
X-Google-Smtp-Source: AMsMyM5ax+2eeKnr6YZjDnTFSBi8Q0zKFml6x7NSIUkus1u4E5Q1QUNizK4ROELgcQAEAOJc7So/Pw==
X-Received: by 2002:a05:6512:29b:b0:4a9:b9cc:fbeb with SMTP id
 j27-20020a056512029b00b004a9b9ccfbebmr623743lfp.581.1668011218819; 
 Wed, 09 Nov 2022 08:26:58 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 131-20020a2e0989000000b0026c5579c64csm2235122ljj.89.2022.11.09.08.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:26:57 -0800 (PST)
Date: Wed, 9 Nov 2022 17:26:55 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com,
 edgar.iglesias@amd.com, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v2 3/5] xlnx-zynqmp: Connect Xilinx VERSAL CANFD
 controllers
Message-ID: <20221109162654.GF4571@fralle-msi>
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
 <20221022054746.28217-4-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022054746.28217-4-vikram.garhwal@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01, USER_IN_WHITELIST=-100,
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

In the git summary s/zynqmp/versal/.

On [2022 Oct 21] Fri 22:47:44, Vikram Garhwal wrote:
> Connect CANFD0 and CANFD1 on the Versal-virt machine and update xlnx-versal-virt
> document with CANFD command line examples.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  docs/system/arm/xlnx-versal-virt.rst | 31 ++++++++++++++++++
>  hw/arm/xlnx-versal-virt.c            | 48 ++++++++++++++++++++++++++++
>  hw/arm/xlnx-versal.c                 | 37 +++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h         | 12 +++++++
>  4 files changed, 128 insertions(+)
> 
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 92ad10d2da..372e4249f0 100644
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
> +SocketCAN interface can connect to a Physical or a Virtual CAN interfaces on
> +host machine.

I'm not native english but this sounds better to me:

"The SocketCAN interface can connect to a Physical or a Virtual CAN interface on
the host machine."

> Please check this document to learn about CAN interface on Linux:
> +docs/system/devices/can.rst
> +
> +To connect CANFD0 and CANFD1 to host machine's CAN interface can0:
> +
> +.. code-block:: bash
> +
> +    -object can-bus,id=canbus -machine canbus0=canbus -machine canbus1=canbus
> +    -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 37fc9b919c..963ace861e 100644
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
> +    uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
> +    uint32_t size[] = { MM_CANFD0_SIZE, MM_CANFD1_SIZE };
> +    unsigned int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0 };
> +    int i;
> +
> +    /* Create and connect CANFD0 and CANFD1 nodes to canbus0. */
> +    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
> +        char *name = g_strdup_printf("/canfd@%" PRIx64, addrs[i]);
> +        qemu_fdt_add_subnode(s->fdt, name);
> +        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo0", 0x40);
> +        qemu_fdt_setprop_cell(s->fdt, name, "enable-rx-fifo1", 0x1);
> +        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo1", 0x40);
> +
> +        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
> +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                     2, addrs[i], 2, size[i]);
> +        qemu_fdt_setprop_string(s->fdt, name, "compatible",
> +                                "xlnx,versal-canfd");

For the nodes we need to go with something similar to this:
https://github.com/Xilinx/linux-xlnx/blob/master/arch/arm64/boot/dts/xilinx/versal.dtsi#L153

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
> index 57276e1506..44b0eaf0c8 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -185,6 +185,38 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_canfds(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.canfd); i++) {
> +        static const int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0};
> +        static const uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };

A suggestion is undo the static and move above to the top of the function
(similar to 'addrs' and 'size' in 'fdt_add_canfd_nodes').

Looks good to me otherwise!

Best regards,
Francisco

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
> @@ -719,6 +751,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_apu_gic(s, pic);
>      versal_create_rpu_cpus(s);
>      versal_create_uarts(s, pic);
> +    versal_create_canfds(s, pic);
>      versal_create_usbs(s, pic);
>      versal_create_gems(s, pic);
>      versal_create_admas(s, pic);
> @@ -758,6 +791,10 @@ static void versal_init(Object *obj)
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
> index cbe8a19c10..97e63a1b0e 100644
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
> +#define MM_CANFD0                   0xff060000
> +#define MM_CANFD0_SIZE              0x10000
> +#define MM_CANFD1                   0xff070000
> +#define MM_CANFD1_SIZE              0x10000
> +
>  #define MM_GEM0                     0xff0c0000U
>  #define MM_GEM0_SIZE                0x10000
>  #define MM_GEM1                     0xff0d0000U
> -- 
> 2.17.1
> 
> 

