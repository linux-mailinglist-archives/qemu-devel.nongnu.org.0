Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFD3EE9A9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:23:06 +0200 (CEST)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvJJ-0007Yg-9q
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvIT-0006g9-I2; Tue, 17 Aug 2021 05:22:13 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:53580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvIQ-0001HA-9U; Tue, 17 Aug 2021 05:22:13 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 258C8C6019D;
 Tue, 17 Aug 2021 11:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u8pgtVi+zNUwTCBy4/F8iFQjTPsbEbcGVRHBHXnBgpw=;
 b=HqmADEvIA0SHD3IIv5U4kqF4ThDs6QmvCfHkBoQSWxRAHr4cLt8zmtaVepwh5C9lHCDmke
 Oa61XPCuOhoSqJyPaa6xTUie24X7dexVhqbk9QuFM9oenOQz6ROCxnzaef9BUE+iWEl3Kj
 wxcYQ5png6nm+Tk7JGJJLnGg7mGuzLTxlevwAb+xeNHi047+tSB0yX1ZfvR3C+ElNcIPy1
 QwRow/cFXGTK6Ka/GWncG/C5btPte9m0WBjZKfUaC9CADzmNhS+T1dfG3D+jZkTg27m3mG
 FeLUXsLaeq/BpcEwgv+PVTEM1aGWs7v9pZeBsmyUOvVTvXN8nLr6kwB3Mp7Ojg==
Date: Tue, 17 Aug 2021 11:24:18 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 02/25] arm: Move systick device creation from
 NVIC to ARMv7M object
Message-ID: <20210817092418.b5l2qbj3cthg7dhi@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-3-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> There's no particular reason why the NVIC should be owning the
> SysTick device objects; move them into the ARMv7M container object
> instead, as part of consolidating the "create the devices which are
> built into an M-profile CPU and map them into their architected
> locations in the address space" work into one place.
> 
> This involves temporarily creating a duplicate copy of the
> nvic_sysreg_ns_ops struct and its read/write functions (renamed as
> v7m_sysreg_ns_*), but we will delete the NVIC's copy of this code in
> a subsequent patch.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armv7m.h       |  12 ++++
>  include/hw/intc/armv7m_nvic.h |   4 --
>  hw/arm/armv7m.c               | 125 ++++++++++++++++++++++++++++++++++
>  hw/intc/armv7m_nvic.c         |  73 --------------------
>  4 files changed, 137 insertions(+), 77 deletions(-)
> 
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 4cae0d7eeaa..360c35c5fb2 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -60,11 +60,23 @@ struct ARMv7MState {
>      BitBandState bitband[ARMV7M_NUM_BITBANDS];
>      ARMCPU *cpu;
>      ARMv7MRAS ras;
> +    SysTickState systick[M_REG_NUM_BANKS];
>  
>      /* MemoryRegion we pass to the CPU, with our devices layered on
>       * top of the ones the board provides in board_memory.
>       */
>      MemoryRegion container;
> +    /*
> +     * MemoryRegion which passes the transaction to either the S or the
> +     * NS systick device depending on the transaction attributes
> +     */
> +    MemoryRegion systickmem;
> +    /*
> +     * MemoryRegion which enforces the S/NS handling of the systick
> +     * device NS alias region and passes the transaction to the
> +     * NS systick device if appropriate.
> +     */
> +    MemoryRegion systick_ns_mem;
>  
>      /* Properties */
>      char *cpu_type;
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> index 33b6d8810c7..6a6a99090c7 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -81,16 +81,12 @@ struct NVICState {
>  
>      MemoryRegion sysregmem;
>      MemoryRegion sysreg_ns_mem;
> -    MemoryRegion systickmem;
> -    MemoryRegion systick_ns_mem;
>      MemoryRegion container;
>      MemoryRegion defaultmem;
>  
>      uint32_t num_irq;
>      qemu_irq excpout;
>      qemu_irq sysresetreq;
> -
> -    SysTickState systick[M_REG_NUM_BANKS];
>  };
>  
>  #endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 8964730d153..364ac069702 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -124,6 +124,85 @@ static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
>      0x22000000, 0x42000000
>  };
>  
> +static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
> +                                       uint64_t value, unsigned size,
> +                                       MemTxAttrs attrs)
> +{
> +    MemoryRegion *mr = opaque;
> +
> +    if (attrs.secure) {
> +        /* S accesses to the alias act like NS accesses to the real region */
> +        attrs.secure = 0;
> +        return memory_region_dispatch_write(mr, addr, value,
> +                                            size_memop(size) | MO_TE, attrs);
> +    } else {
> +        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
> +        if (attrs.user) {
> +            return MEMTX_ERROR;
> +        }
> +        return MEMTX_OK;
> +    }
> +}
> +
> +static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
> +                                      uint64_t *data, unsigned size,
> +                                      MemTxAttrs attrs)
> +{
> +    MemoryRegion *mr = opaque;
> +
> +    if (attrs.secure) {
> +        /* S accesses to the alias act like NS accesses to the real region */
> +        attrs.secure = 0;
> +        return memory_region_dispatch_read(mr, addr, data,
> +                                           size_memop(size) | MO_TE, attrs);
> +    } else {
> +        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
> +        if (attrs.user) {
> +            return MEMTX_ERROR;
> +        }
> +        *data = 0;
> +        return MEMTX_OK;
> +    }
> +}
> +
> +static const MemoryRegionOps v7m_sysreg_ns_ops = {
> +    .read_with_attrs = v7m_sysreg_ns_read,
> +    .write_with_attrs = v7m_sysreg_ns_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
> +                                     uint64_t value, unsigned size,
> +                                     MemTxAttrs attrs)
> +{
> +    ARMv7MState *s = opaque;
> +    MemoryRegion *mr;
> +
> +    /* Direct the access to the correct systick */
> +    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> +    return memory_region_dispatch_write(mr, addr, value,
> +                                        size_memop(size) | MO_TE, attrs);
> +}
> +
> +static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
> +                                    uint64_t *data, unsigned size,
> +                                    MemTxAttrs attrs)
> +{
> +    ARMv7MState *s = opaque;
> +    MemoryRegion *mr;
> +
> +    /* Direct the access to the correct systick */
> +    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> +    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
> +                                       attrs);
> +}
> +
> +static const MemoryRegionOps v7m_systick_ops = {
> +    .read_with_attrs = v7m_systick_read,
> +    .write_with_attrs = v7m_systick_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
>  static void armv7m_instance_init(Object *obj)
>  {
>      ARMv7MState *s = ARMV7M(obj);
> @@ -137,6 +216,13 @@ static void armv7m_instance_init(Object *obj)
>      object_property_add_alias(obj, "num-irq",
>                                OBJECT(&s->nvic), "num-irq");
>  
> +    object_initialize_child(obj, "systick-reg-ns", &s->systick[M_REG_NS],
> +                            TYPE_SYSTICK);
> +    /*
> +     * We can't initialize the secure systick here, as we don't know
> +     * yet if we need it.
> +     */
> +
>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>          object_initialize_child(obj, "bitband[*]", &s->bitband[i],
>                                  TYPE_BITBAND);
> @@ -231,6 +317,45 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&s->container, 0xe0000000,
>                                  sysbus_mmio_get_region(sbd, 0));
>  
> +    /* Create and map the systick devices */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
> +        return;
> +    }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
> +                       qdev_get_gpio_in_named(DEVICE(&s->nvic),
> +                                              "systick-trigger", M_REG_NS));
> +
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
> +        /*
> +         * We couldn't init the secure systick device in instance_init
> +         * as we didn't know then if the CPU had the security extensions;
> +         * so we have to do it here.
> +         */
> +        object_initialize_child(OBJECT(dev), "systick-reg-s",
> +                                &s->systick[M_REG_S], TYPE_SYSTICK);
> +
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
> +            return;
> +        }
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
> +                           qdev_get_gpio_in_named(DEVICE(&s->nvic),
> +                                                  "systick-trigger", M_REG_S));
> +    }
> +
> +    memory_region_init_io(&s->systickmem, OBJECT(s),
> +                          &v7m_systick_ops, s,
> +                          "v7m_systick", 0xe0);
> +
> +    memory_region_add_subregion_overlap(&s->container, 0xe000e010,
> +                                        &s->systickmem, 1);
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
> +        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
> +                              &v7m_sysreg_ns_ops, &s->systickmem,
> +                              "v7m_systick_ns", 0xe0);
> +        memory_region_add_subregion_overlap(&s->container, 0xe002e010,
> +                                            &s->systick_ns_mem, 1);
> +    }
> +
>      /* If the CPU has RAS support, create the RAS register block */
>      if (cpu_isar_feature(aa32_ras, s->cpu)) {
>          object_initialize_child(OBJECT(dev), "armv7m-ras",
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index a5975592dfa..2b3e79a3da9 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2517,38 +2517,6 @@ static const MemoryRegionOps nvic_sysreg_ns_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
> -                                      uint64_t value, unsigned size,
> -                                      MemTxAttrs attrs)
> -{
> -    NVICState *s = opaque;
> -    MemoryRegion *mr;
> -
> -    /* Direct the access to the correct systick */
> -    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_write(mr, addr, value,
> -                                        size_memop(size) | MO_TE, attrs);
> -}
> -
> -static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> -                                     uint64_t *data, unsigned size,
> -                                     MemTxAttrs attrs)
> -{
> -    NVICState *s = opaque;
> -    MemoryRegion *mr;
> -
> -    /* Direct the access to the correct systick */
> -    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
> -                                       attrs);
> -}
> -
> -static const MemoryRegionOps nvic_systick_ops = {
> -    .read_with_attrs = nvic_systick_read,
> -    .write_with_attrs = nvic_systick_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -};
> -
>  /*
>   * Unassigned portions of the PPB space are RAZ/WI for privileged
>   * accesses, and fault for non-privileged accesses.
> @@ -2801,29 +2769,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>  
>      s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
>  
> -    if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
> -        return;
> -    }
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
> -                       qdev_get_gpio_in_named(dev, "systick-trigger",
> -                                              M_REG_NS));
> -
> -    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
> -        /* We couldn't init the secure systick device in instance_init
> -         * as we didn't know then if the CPU had the security extensions;
> -         * so we have to do it here.
> -         */
> -        object_initialize_child(OBJECT(dev), "systick-reg-s",
> -                                &s->systick[M_REG_S], TYPE_SYSTICK);
> -
> -        if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
> -            return;
> -        }
> -        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
> -                           qdev_get_gpio_in_named(dev, "systick-trigger",
> -                                                  M_REG_S));
> -    }
> -
>      /*
>       * This device provides a single sysbus memory region which
>       * represents the whole of the "System PPB" space. This is the
> @@ -2877,23 +2822,11 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>                            "nvic_sysregs", 0x1000);
>      memory_region_add_subregion(&s->container, 0xe000, &s->sysregmem);
>  
> -    memory_region_init_io(&s->systickmem, OBJECT(s),
> -                          &nvic_systick_ops, s,
> -                          "nvic_systick", 0xe0);
> -
> -    memory_region_add_subregion_overlap(&s->container, 0xe010,
> -                                        &s->systickmem, 1);
> -
>      if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
>          memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
>                                &nvic_sysreg_ns_ops, &s->sysregmem,
>                                "nvic_sysregs_ns", 0x1000);
>          memory_region_add_subregion(&s->container, 0x2e000, &s->sysreg_ns_mem);
> -        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
> -                              &nvic_sysreg_ns_ops, &s->systickmem,
> -                              "nvic_systick_ns", 0xe0);
> -        memory_region_add_subregion_overlap(&s->container, 0x2e010,
> -                                            &s->systick_ns_mem, 1);
>      }
>  
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
> @@ -2905,12 +2838,6 @@ static void armv7m_nvic_instance_init(Object *obj)
>      NVICState *nvic = NVIC(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>  
> -    object_initialize_child(obj, "systick-reg-ns", &nvic->systick[M_REG_NS],
> -                            TYPE_SYSTICK);
> -    /* We can't initialize the secure systick here, as we don't know
> -     * yet if we need it.
> -     */
> -
>      sysbus_init_irq(sbd, &nvic->excpout);
>      qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
>      qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger",
> -- 
> 2.20.1
> 

-- 

