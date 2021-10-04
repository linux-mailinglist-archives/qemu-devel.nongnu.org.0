Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7099420A91
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 14:05:45 +0200 (CEST)
Received: from localhost ([::1]:53624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXMj2-0003Zr-Ca
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 08:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXMe3-0000aV-Qo
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXMdx-0003sX-V6
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633348825;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Szh1sZdd2NA++7VzE8dfvZgPCeKZLBpLUKEMevzbR2c=;
 b=OCh2rWS6JEVzBAEPP2cpylcumjxb6M93vOCxnLT5WKf7qVoijo7QPI07rU+3SxJ0+CykDd
 NYge2UQc5KCaQqKrLrZyip2metEE75hZGZhmwWJEMdEAXPJdHxF2pHoTV8Vo6Ks7qfWY6X
 LJaGiTbxHxzDAFYiHSNM1wgOW3+S2Bs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-iZmJpRgSP52pZQYFGZXb6g-1; Mon, 04 Oct 2021 08:00:24 -0400
X-MC-Unique: iZmJpRgSP52pZQYFGZXb6g-1
Received: by mail-wr1-f72.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso4587141wrn.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Szh1sZdd2NA++7VzE8dfvZgPCeKZLBpLUKEMevzbR2c=;
 b=ZHRuvUVUHigoapbu0b2jFzG1OV/XRhE9cjCy/IhldLD10DpRPMBUP63Ry48q8YLgY3
 7pvMjc9xEGABQDegay2kx/5D+GfevG68QhNLjHELPapF8zhoy7+8cARnUfU+ZJ9qI0nX
 Ko+SuuQoH2SgTvw9H86IGKF/QGJxz2LILGAgr/B9DnqV7ERnQC/zSzlZ/lZLRHOWItS9
 eoPVGBoYhpkg6YOmxDcVqDTbYGlMBOpQzxpgXf3MZdoqlr5MUfmzv2fvOq57mt+HDtz2
 zpX2qj6IwBEKjUL7rNqzZyxrXxmGvrnUaPIgu7Bhi4UkMRMRP4aT04zzMHrm4JSwXvZV
 jESw==
X-Gm-Message-State: AOAM530srCabnHZg0Qhbng5GTBJh4aodnL/1qxVaFRl0/z/krAvM9Kn/
 OV+tQ1HG6jsOVo4nxCDZGYaQ/bktTV2Haxr/mKYyVmYV3V7mJrGL097ykXqph/cCdWjNMHRYdHg
 9OqsjU1Mk2ayy+00=
X-Received: by 2002:adf:a45e:: with SMTP id e30mr12058144wra.269.1633348823465; 
 Mon, 04 Oct 2021 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHUUsSuliMbaWMUJfOxhomX+YqGVSB+h6Tbvc9XMFwkt9wv5ln2ZOsJjF3r/t46K2PWn19YQ==
X-Received: by 2002:adf:a45e:: with SMTP id e30mr12058101wra.269.1633348823180; 
 Mon, 04 Oct 2021 05:00:23 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j27sm16609782wms.6.2021.10.04.05.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 05:00:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] hw/arm/virt: Key enablement of highmem PCIe on
 highmem_ecam
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-2-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <dbe883ca-880e-7f2b-1de7-4b2d3361545d@redhat.com>
Date: Mon, 4 Oct 2021 14:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-2-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 10/3/21 6:46 PM, Marc Zyngier wrote:
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
highmem_ecam is more restrictive than use_highmem:
vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);

If I remember correctly there was a problem using highmem ECAM with 32b
AAVMF FW.

However 5125f9cd2532 ("hw/arm/virt: Add high MMIO PCI region, 512G in
size") introduced high MMIO PCI region without this constraint.

So to me we should keep vms->highmem here

Eric

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


