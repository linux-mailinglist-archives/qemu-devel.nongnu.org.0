Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8A4110F9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:31:27 +0200 (CEST)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEhy-0007GI-8D
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEbb-00072b-Jl
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEbX-0007iZ-Ec
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632126286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9x+WD6TS4CFk48rbJLr6XhRkqodjN2Xw504dKrvQVo=;
 b=KKicvi3arg/Lgahhnb+WrfV9PYiZ7TkBLK+9Jx/ahjdSbx/gAQD7Wr8IPSJ6fOEJrVXF3H
 WRaD7H0gAaRq4wTatqMn30LsG5TTP7Nw6InLbbVNCH8CR0fsV72Q8pPeWiCkWGG6SreERH
 LUtD/HgMK8Eh8xP0cNBTuBaZMEs6o2U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-zBu6J7vCNaGuVn7QJ8euCQ-1; Mon, 20 Sep 2021 04:24:43 -0400
X-MC-Unique: zBu6J7vCNaGuVn7QJ8euCQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so14874517ede.16
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K9x+WD6TS4CFk48rbJLr6XhRkqodjN2Xw504dKrvQVo=;
 b=2worxV1wrYjgyxSaQ1oyBpky0m9uEUeRYhu30TsFo+Mku4J90LRkv0kxAF8txp9naa
 aj+KE7hklxmO1xVxwl2dD4UJufKgOyTl5xgds3J6naKEMCuURRmIvWdiyjEb8I9DkWR/
 miMGX9immRAQNuA4dyvEn/mjjryBYJ/pLR9xt9xOfk+ZafROniLcSg5fheAXw74hQlre
 UT3O/bvMwHR+DMuCvnnvg+J6GLYKndth2vTSLcy0Ba2JSy8EOqXCTsFjxtdeZna+eq7U
 9Lq+nvoxJqw/B6SevQWJFatOrNSZMCNI++H1eqNmJVkPXpxnmQ2ahnF9xMxUJCfbeuqr
 nxNg==
X-Gm-Message-State: AOAM531Vqy1OL20cyY37eJrQxgnFtv2aP5m3eyrq0Vy/GC5IXUHxcoSc
 iyOjOY8ec4t0xi1Ogf2NhVTS7p4IYRkCfs3ONyacjXfvHeykThT/l+DosTc9zIfFzbhZe4V/ADQ
 NwFiZv9Ps1aui7wE=
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr27554649edu.192.1632126282404; 
 Mon, 20 Sep 2021 01:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt97QQlclQs0jzxsd85TQ2SgOLbwh8MYAdyTur++nJsR56qJf35nHi9v9ktMnfJygcxFukRA==
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr27554625edu.192.1632126282214; 
 Mon, 20 Sep 2021 01:24:42 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o3sm5827077eju.123.2021.09.20.01.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:24:41 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:24:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 05/10] pc: Allow instantiating a virtio-iommu device
Message-ID: <20210920102440.1eea4f46@redhat.com>
In-Reply-To: <20210914142004.2433568-6-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-6-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
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
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 15:20:00 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

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
> ---
>  include/hw/i386/pc.h |  2 ++
>  hw/i386/acpi-build.c |  5 +++++
>  hw/i386/pc.c         | 28 +++++++++++++++++++++++++++-
>  hw/i386/Kconfig      |  1 +
>  4 files changed, 35 insertions(+), 1 deletion(-)
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
> index 547cd4ed9d..76845026d8 100644
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
> +        build_viot(tables_blob, tables->linker, pcms->virtio_iommu_bdf,
> +                   x86ms->oem_id, x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7e523b913c..a31e950599 100644
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
> @@ -798,6 +799,11 @@ void pc_machine_done(Notifier *notifier, void *data)
>                       "irqchip support.");
>          exit(EXIT_FAILURE);
>      }
> +
> +    if (pcms->virtio_iommu && x86_iommu_get_default()) {
> +        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
> +        exit(EXIT_FAILURE);
> +    }

previous patch does similar check, doesn't it?
So is why it's not implement the same way?

>  }
>  
>  void pc_guest_info_init(PCMachineState *pcms)
> @@ -1368,6 +1374,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* Declare the reserved MSI region */
> +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
> +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);

add a comment describing where these values come from, pls.

> +
> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);

why not use qom setters directly
(they have error argument and can gracefully error out,
which is expected error handling in pre_plug)

and fix up similar (ab)use of setters in virt_machine_device_pre_plug_cb()

> +        g_free(resv_prop_str);
>      }
>  }
>  
> @@ -1381,6 +1395,17 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +        PCIDevice *pdev = PCI_DEVICE(dev);
> +
> +        if (pcms->virtio_iommu) {
> +            error_setg(errp,
> +                       "QEMU does not support multiple vIOMMUs for x86 yet.");
> +            return;
> +        }

move to pre_plug please

> +        pcms->virtio_iommu = true;
> +        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>      }
>  }
>  
> @@ -1422,7 +1447,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
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


