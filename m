Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB33FC9EA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:38:20 +0200 (CEST)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4u3-0006XG-IO
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4sh-00056M-4z
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4sS-0002zU-Oy
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630420598;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=up8xaEiXR2LzGa5H4knRneGib5mkmJ70AqGkvPSL6aM=;
 b=PSTqV4OOGmNvjCwOtC93hcwPwiYpGtIxpdzANeyv/b/uZf0roCDpmckhRYxN56VZpjLuls
 d0Yr5H7Uz0eblIG7KeJn8C7uJdbJXltEqH2uorXWq3d4Nh7C5nvBXUVEX7ijvl8QBahrbL
 A5yj0eN6DdE4KoVWq+hf2w8VABkauJM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-4jWbJ2QTNXapoCCsGrLMyA-1; Tue, 31 Aug 2021 10:36:37 -0400
X-MC-Unique: 4jWbJ2QTNXapoCCsGrLMyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso1345057wmj.4
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 07:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=up8xaEiXR2LzGa5H4knRneGib5mkmJ70AqGkvPSL6aM=;
 b=cbJD84FyUQb3/9DK5qOxFfAphaKxZcE9rM/mxMclEaSAOPO8N8aPQav6wnvIsCOoVw
 fM14ZB+W8YS4JOmKm6QMts9Ra5oLXEmRrbzeImZgrZevTt5BNSRJISKVIFw8CVT94aOn
 Rv6E4Tuwl1Zbxm6ngVYMR/jRyiyUf+/Qa2bm+iJnJ4sRvmIBVHhf5kW/gnCTFXCdva2q
 Vl9ggFuiSAsp+hOBXWqEKn4AxviUWujpHKJt54oIdgQDUUskFqxgMq7QxxR3nM1Mhjhb
 iIU9nqSTUjcvHauSYm3qLGlHWAFDnqUZIYhBuugzPx5J/lAs/qOAm6T5zV9PsP1AsMAF
 K8Iw==
X-Gm-Message-State: AOAM5322UVIYSvkAdMmtcP4QV96baI/sFeMSiNtvLYurTzD/nrySoq7p
 LYq+GMQjIs8YSRoiOTiPidAFgkELIwnWnYJKvNOVenccIVJDGpKbdCdLJLKSr076YqTSqo1SnO0
 HpszScW72u//fE5Q=
X-Received: by 2002:a5d:5452:: with SMTP id w18mr31667373wrv.221.1630420595863; 
 Tue, 31 Aug 2021 07:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLokYCuhqMY+Cx7SIQV6XKSmziL83iCi7UbhnKiOm2R8X7ZbBqVfEp7vyr0pxOwLh0V19sKA==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr31667348wrv.221.1630420595659; 
 Tue, 31 Aug 2021 07:36:35 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m3sm23513153wrg.45.2021.08.31.07.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:36:35 -0700 (PDT)
Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
To: chunming <chunming_li1234@163.com>, peter.maydell@linaro.org
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-5-git-send-email-chunming_li1234@163.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <756203c3-76ec-62ea-beca-91a245059536@redhat.com>
Date: Tue, 31 Aug 2021 16:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1629878922-173270-5-git-send-email-chunming_li1234@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chunming,

On 8/25/21 10:08 AM, chunming wrote:
> From: chunming <chunming.li@verisilicon.com>
>
> Add PL330 DMA controller to test SMMU v3 connection and function.
> The default SID for PL330 is 1 but we test other values, it works well.
Is it just a patch for testing or would you want this to be applied
upstream too?

This static SID allocation may not work in general as it may collide
with PCIe RID space?

My feeling is if we want to enable platform device support in the SMMUv3
this should work for all platform devices doing DMA accesses and not
only for this PL330.
I guess this should work with virtio platform devices and VFIO platform
devices. How would you extend that work to those devices?

Thanks

Eric
>
> Signed-off-by: chunming <chunming.li@verisilicon.com>
> ---
>  hw/arm/virt.c         | 92 ++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 92 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c3fd30e071..8180e4a331 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -143,6 +143,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
>      [VIRT_UART] =               { 0x09000000, 0x00001000 },
>      [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> +    [VIRT_DMA] =                { 0x09011000, 0x00001000 },
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> @@ -188,6 +189,7 @@ static const int a15irqmap[] = {
>      [VIRT_GPIO] = 7,
>      [VIRT_SECURE_UART] = 8,
>      [VIRT_ACPI_GED] = 9,
> +    [VIRT_DMA] = 10,
>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
> @@ -205,7 +207,7 @@ static const char *valid_cpus[] = {
>  };
>  
>  static const uint16_t smmuv3_sidmap[] = {
> -
> +    [VIRT_DMA] = 1,
>  };
>  
>  static bool cpu_type_valid(const char *cpu)
> @@ -793,6 +795,92 @@ static void create_uart(const VirtMachineState *vms, int uart,
>      g_free(nodename);
>  }
>  
> +static void create_dma(const VirtMachineState *vms)
> +{
> +    int i;
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_DMA].base;
> +    hwaddr size = vms->memmap[VIRT_DMA].size;
> +    int irq = vms->irqmap[VIRT_DMA];
> +    int sid = vms->sidmap[VIRT_DMA];
> +    const char compat[] = "arm,pl330\0arm,primecell";
> +    const char irq_names[] = "abort\0dma0\0dma1\0dma2\0dma3\0dma4\0dma5\0dma6\0dma7";
> +    DeviceState *dev;
> +    MachineState *ms = MACHINE(vms);
> +    SysBusDevice *busdev;
> +    DeviceState *smmuv3_dev;
> +    SMMUState *smmuv3_sys;
> +    Object *smmuv3_memory;
> +
> +    dev = qdev_new("pl330");
> +
> +    if (vms->iommu == VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
> +        smmuv3_dev = vms->smmuv3;
> +        smmuv3_sys = ARM_SMMU(smmuv3_dev);
> +        g_autofree char *memname = g_strdup_printf("%s-peri-%d[0]",
> +                                                   smmuv3_sys->mrtypename,
> +                                                   sid);
> +
> +        smmuv3_memory = object_property_get_link(OBJECT(smmuv3_dev),
> +                                memname, &error_abort);
> +
> +        object_property_set_link(OBJECT(dev), "memory",
> +                                 OBJECT(smmuv3_memory),
> +                                 &error_fatal);
> +    } else {
> +        object_property_set_link(OBJECT(dev), "memory",
> +                                 OBJECT(get_system_memory()),
> +                                 &error_fatal);
> +    }
> +
> +    qdev_prop_set_uint8(dev, "num_chnls",  8);
> +    qdev_prop_set_uint8(dev, "num_periph_req",  4);
> +    qdev_prop_set_uint8(dev, "num_events",  16);
> +    qdev_prop_set_uint8(dev, "data_width",  64);
> +    qdev_prop_set_uint8(dev, "wr_cap",  8);
> +    qdev_prop_set_uint8(dev, "wr_q_dep",  16);
> +    qdev_prop_set_uint8(dev, "rd_cap",  8);
> +    qdev_prop_set_uint8(dev, "rd_q_dep",  16);
> +    qdev_prop_set_uint16(dev, "data_buffer_dep",  256);
> +
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, base);
> +
> +    for (i = 0; i < 9; ++i) {
> +        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(vms->gic, irq + i));
> +    }
> +
> +    nodename = g_strdup_printf("/pl330@%" PRIx64, base);
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
> +                    GIC_FDT_IRQ_TYPE_SPI, irq, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 4, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 5, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 6, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 7, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 8, GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +
> +    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-names", irq_names,
> +                     sizeof(irq_names));
> +
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
> +    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
> +
> +    if (vms->iommu == VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
> +        qemu_fdt_setprop_cells(ms->fdt, nodename, "iommus",
> +                               vms->iommu_phandle, sid);
> +        qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
> +    }
> +
> +    g_free(nodename);
> +}
>  static void create_rtc(const VirtMachineState *vms)
>  {
>      char *nodename;
> @@ -2081,6 +2169,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_pcie(vms);
>  
> +    create_dma(vms);
> +
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
>      } else {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index d3402a43dd..f307b26587 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -72,6 +72,7 @@ enum {
>      VIRT_UART,
>      VIRT_MMIO,
>      VIRT_RTC,
> +    VIRT_DMA,
>      VIRT_FW_CFG,
>      VIRT_PCIE,
>      VIRT_PCIE_MMIO,


