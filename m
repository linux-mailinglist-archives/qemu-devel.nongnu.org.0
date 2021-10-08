Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2C42682E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:48:29 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYnQS-0003lh-9I
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYnPM-0002oq-SF
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYnPI-0002SG-NZ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633690034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LOiGcLBeltj04P6XDFcaoN8r2OcBjm/Udb9s2rhhIBo=;
 b=FIbB2xapebhxepk23Yf4deSbY1+CnZ63g/wWAWlIsVL+ALmCxTdMv6MYly5JX8et6vs9ka
 UjR2yFUQ08VmxYrSjmrO6x4yZEfH6mKbOFBMzlPl7Hatrqu+ClmA7ZA31aP2tnbvkWb0Hy
 hPWgSfleYdKwBxK14RMKIuzmXDquQwo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-9-T3xv5YMGuEfeKPdMaA3g-1; Fri, 08 Oct 2021 06:46:54 -0400
X-MC-Unique: 9-T3xv5YMGuEfeKPdMaA3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso8837929edi.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 03:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LOiGcLBeltj04P6XDFcaoN8r2OcBjm/Udb9s2rhhIBo=;
 b=CCLENxMXGKHGsslnPkw9Pvzotm4OlFS+iQlF25s26xEnAfMwJIDgnyfqy0KCFhCJJa
 AfaaSouJT/WV583kF2S1pqKNCRG60d9qP9osuYFUdwJDv0h6S9gEozcKaYBbPiOkb4uG
 nIcFz4dlrExG1I1rTUQfjzik3QXXei+YF18Sm9KgW8cm7uO8PoeX2pUoEHL5Ne+gtT99
 /D7oYWBmogooDiWuFkYwjZE0ihECJ2E8eO9fyWr3ga+SdMXQCiqw15M4Yd+PE1V5jgyd
 DnhWPSp8PHOiX/5nG6lU+ucOMI0vpdUUYWB/LwJgKRTH0IWoME+edC4LNVhXN/CLNnxs
 mZKw==
X-Gm-Message-State: AOAM533YLdNAXofo1pENY6H8Cx2Nk3OAULTR8no0luq15C/maVTuYbBb
 3pqrNSWPGnB/Fh8QjVzRabSvf/LdGry1g/YY+raPLc6SkCXjOShIhkl0Y1cxk3XDw3kTjHdEvfy
 TK/hsFVHj68fAez8=
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr3325844ejf.117.1633690013659; 
 Fri, 08 Oct 2021 03:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3QOQD41ZM/scEaBAMpX4wEDCASB/96cITZdAJmeuz3RJvmq4DRyREUpqd+35y7ngWHEsyOA==
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr3325815ejf.117.1633690013324; 
 Fri, 08 Oct 2021 03:46:53 -0700 (PDT)
Received: from redhat.com ([2.55.132.170])
 by smtp.gmail.com with ESMTPSA id y22sm896960edc.76.2021.10.08.03.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 03:46:52 -0700 (PDT)
Date: Fri, 8 Oct 2021 06:46:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Message-ID: <20211008064559-mutt-send-email-mst@kernel.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-8-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-8-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 06:33:55PM +0100, Jean-Philippe Brucker wrote:
> Allow instantiating a virtio-iommu device by adding an ACPI Virtual I/O
> Translation table (VIOT), which describes the relation between the
> virtio-iommu and the endpoints it manages.
> 
> Add a hotplug handler for virtio-iommu on x86 and set the necessary
> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> region is reserved for MSIs. DMA transactions to this range either
> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
> 
> Although virtio-iommu does not support IRQ remapping it must be informed
> of the reserved region so that it can forward DMA transactions targeting
> this region.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

If you like, we can start by merging the pc bits when they are ready.
These are not widely used so have less of a chance to break someone's
setup.

> ---
>  include/hw/i386/pc.h |  2 ++
>  hw/i386/acpi-build.c |  5 +++++
>  hw/i386/pc.c         | 24 ++++++++++++++++++++++--
>  hw/i386/Kconfig      |  1 +
>  4 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 82cf7b7e30..f3ba1ee4c0 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,6 +45,8 @@ typedef struct PCMachineState {
>      bool pit_enabled;
>      bool hpet_enabled;
>      bool default_bus_bypass_iommu;
> +    bool virtio_iommu;
> +    uint16_t virtio_iommu_bdf;
>      uint64_t max_fw_size;
>  
>      /* ACPI Memory hotplug IO base address */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d1c28440f4..4e46585709 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -71,6 +71,7 @@
>  
>  #include "hw/acpi/ipmi.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/acpi/viot.h"
>  
>  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
>   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
> @@ -2593,6 +2594,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
>                             x86ms->oem_table_id);
>          }
> +    } else if (pcms->virtio_iommu) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(machine, tables_blob, tables->linker, pcms->virtio_iommu_bdf,
> +                   x86ms->oem_id, x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 789ccb6ef4..31710bc4fb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -83,6 +83,7 @@
>  #include "hw/i386/intel_iommu.h"
>  #include "hw/net/ne2000-isa.h"
>  #include "standard-headers/asm-x86/bootparam.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "hw/virtio/virtio-pmem-pci.h"
>  #include "hw/virtio/virtio-mem-pci.h"
>  #include "hw/mem/memory-device.h"
> @@ -1367,8 +1368,11 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
>  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
> -        x86_iommu_get_default()) {
> +    PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +
> +    if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
> +         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) &&
> +        (x86_iommu_get_default() || pcms->virtio_iommu)) {
>          error_setg(errp, "QEMU does not support multiple vIOMMUs "
>                     "for x86 yet.");
>          return;
> @@ -1381,6 +1385,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* Declare the APIC range as the reserved MSI region */
> +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
> +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
> +
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
> +        g_free(resv_prop_str);
>      }
>  }
>  
> @@ -1394,6 +1407,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +        PCIDevice *pdev = PCI_DEVICE(dev);
> +
> +        pcms->virtio_iommu = true;
> +        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>      }
>  }
>  
> @@ -1436,6 +1455,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index ddedcef0b2..13db05d557 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -54,6 +54,7 @@ config PC_ACPI
>      select ACPI_X86
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
> +    select ACPI_VIOT
>      select SMBUS_EEPROM
>      select PFLASH_CFI01
>      depends on ACPI_SMBUS
> -- 
> 2.33.0


