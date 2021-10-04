Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E5D4208F8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:07:08 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKsF-0004up-CV
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKTL-00053k-8n
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKTG-0002mS-3p
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxfVhJVrqy9SilnYUxM4IeGNxJd1tbk2Hh41DGObvxE=;
 b=Zn34M2LHw4dab01WvAtoXBcNCsYSB7dmo+r2zU5Nae6KzhD8kMU6ggIdPLE8x9Do/3kb1H
 AQItDN6NtxmjKxsy+WiKjq0DHd0pEPh8zl+QQA/qvIbYRVp/253OyMVLALavTxukWmNRwa
 lQ6qd2Ux/HmyceMsmZoVQXdqYj2aD0s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-tD2EojQ7PcuBlk4bzF7Kng-1; Mon, 04 Oct 2021 05:41:14 -0400
X-MC-Unique: tD2EojQ7PcuBlk4bzF7Kng-1
Received: by mail-wm1-f69.google.com with SMTP id
 d7-20020a1c7307000000b0030d6982305bso1799295wmb.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dxfVhJVrqy9SilnYUxM4IeGNxJd1tbk2Hh41DGObvxE=;
 b=fRLc06NP+7j/CvtEH+jlQcRIPSRTbOrAzOnBZXxNar+zw9dkCC++/9kZJfLoxgScyg
 AB0xoj1KY27QTapNkB/48O4BhXL8yuKrzjXmq2k6cns+86HTESbjfqYoXugrroHVft48
 EB8m/9Umo+Yvep1y3U1KVP7lrLNJlZxjnMK9lUAZ/qV60sJ7FsGjmXVeCluFU6NhrByo
 ZxNxQmkYgJhrwa4qA+EbqXFFp7AGMdS954DcJqr4IEaYdUIQMS+CoS2GY72M91jmriRX
 mybf70CLJu998rIZiJUYel71096dyJ799GlQinDZlNeYy3yVFDzYYFdEVaVDWvrCcD+S
 KZhQ==
X-Gm-Message-State: AOAM5317rf1Q52/rkIynmfOw7YKDxXtDgYlWLQ26mC5T+bmn9p2VB+qU
 ChJsbyMTpQBkAIIHflNq9jVxFB+lg5aSD6/NgNTs7qPMyMaGdHX5q+WZoePKbs3PNmyXebbDcYh
 H2WzA8Y+bHQ+ln0I=
X-Received: by 2002:adf:8b17:: with SMTP id n23mr11450053wra.290.1633340473754; 
 Mon, 04 Oct 2021 02:41:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJKWagXir+Cur7XWqj46gpIlntXbexRxFlKwV6Z5cdcFb0pk6YR7WGxNsnbwzxcb78pAGg9g==
X-Received: by 2002:adf:8b17:: with SMTP id n23mr11450026wra.290.1633340473501; 
 Mon, 04 Oct 2021 02:41:13 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id o8sm7202183wme.38.2021.10.04.02.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:41:13 -0700 (PDT)
Date: Mon, 4 Oct 2021 11:41:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 1/5] hw/arm/virt: Key enablement of highmem PCIe on
 highmem_ecam
Message-ID: <20211004094111.2762nq634e24j4rn@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-2-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-2-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 05:46:01PM +0100, Marc Zyngier wrote:
> Currently, the highmem PCIe region is oddly keyed on the highmem
> attribute instead of highmem_ecam. Move the enablement of this PCIe
> region over to highmem_ecam.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt-acpi-build.c | 10 ++++------
>  hw/arm/virt.c            |  4 ++--
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82..d7bef0e627 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -157,10 +157,9 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>  }
>  
>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> -                              uint32_t irq, bool use_highmem, bool highmem_ecam,
> -                              VirtMachineState *vms)
> +                              uint32_t irq, VirtMachineState *vms)
>  {
> -    int ecam_id = VIRT_ECAM_ID(highmem_ecam);
> +    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
>      struct GPEXConfig cfg = {
>          .mmio32 = memmap[VIRT_PCIE_MMIO],
>          .pio    = memmap[VIRT_PCIE_PIO],
> @@ -169,7 +168,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          .bus    = vms->bus,
>      };
>  
> -    if (use_highmem) {
> +    if (vms->highmem_ecam) {
>          cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
>      }
>  
> @@ -712,8 +711,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> -    acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
> -                      vms->highmem, vms->highmem_ecam, vms);
> +    acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE), vms);

While tidying this interface, could also remove the superfluous ().

>      if (vms->acpi_dev) {
>          build_ged_aml(scope, "\\_SB."GED_DEVICE,
>                        HOTPLUG_HANDLER(vms->acpi_dev),
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7170aaacd5..8021d545c3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1362,7 +1362,7 @@ static void create_pcie(VirtMachineState *vms)
>                               mmio_reg, base_mmio, size_mmio);
>      memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
>  
> -    if (vms->highmem) {
> +    if (vms->highmem_ecam) {
>          /* Map high MMIO space */
>          MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
>  
> @@ -1416,7 +1416,7 @@ static void create_pcie(VirtMachineState *vms)
>      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
>                                   2, base_ecam, 2, size_ecam);
>  
> -    if (vms->highmem) {
> +    if (vms->highmem_ecam) {
>          qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
>                                       1, FDT_PCI_RANGE_IOPORT, 2, 0,
>                                       2, base_pio, 2, size_pio,
> -- 
> 2.30.2
> 


Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


