Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9CE3E56B9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:23:45 +0200 (CEST)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNz6-0002xL-O2
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mDNy2-0001zd-CX
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mDNxz-0000aN-6Q
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628587353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+D/sW3z8/d5RsWAlJvPvlMsXWru0pVWiE/CX56UbWM=;
 b=fEUbsHhbgdz6kBMhfCAptyEVu57YyZJ1kd0XZCfKsQkzbPUFt+seTjAKRQnUTr3l6vBoMX
 aP3QShP1tIeV53I8S7EzfFvO6kQZj+ZlTIN2KD917TztoJEXS+3SnkTvhv5egtCbNRJEQC
 Kw0RkVOSDZC7HtRW4nGvIQL0LNt3PIk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-r29bSwKmNu6knGazahs8nw-1; Tue, 10 Aug 2021 05:22:32 -0400
X-MC-Unique: r29bSwKmNu6knGazahs8nw-1
Received: by mail-wm1-f71.google.com with SMTP id
 85-20020a1c01580000b02902511869b403so810883wmb.8
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 02:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+D/sW3z8/d5RsWAlJvPvlMsXWru0pVWiE/CX56UbWM=;
 b=RKX/l8GqvZOIyBpnH6WOa8D084HzPLzaYoHqFln5UeuO9JDqwQCDxUPuMR5lQMKDp3
 EISE4nV/tH/EzVEGllPMFOs2+tyFSQ1tZ8EFym0bJcockDBW6y7zBIafnL4twTrUgUF5
 DxaqWdnwAUqa69n8YQGtr1VPLFe+Te2yrFR/9vOBjieLGbe8RNuwd7hEca2KXTjkHr4V
 wHpY4uV8PNDUEDkum+rZ8sGVs2AY/xaO0MXV1UCKypEYwncrfXUOjfnvIIGAXaAnZz0P
 t4e8l5GWj4KSvq+hQGI28JG8mfo2bBGtK69yA5qDlAPi06XO+DuTQ1ViziqIOzXWmyyM
 fkJA==
X-Gm-Message-State: AOAM5333PHZfDiTYjZesSiHO4fmgE1X/zgWvDHsXShI8qpOYSq/bztQf
 tI8G0AMsB4bEWUXKBDk467rJIo/iJ5R0E/d1kwEyqzgsXzJyTnvtv4p+qnfq/D2HyPySP816IOT
 NwnWvuj0k/SW5vD4=
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr3612046wmb.5.1628587351292;
 Tue, 10 Aug 2021 02:22:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU5yWzPespEqyauowCeIBI7Eu+/whykJBKGKQImGV4YZEznvmPjgLaQK1bB0Dq7PoXF5rGUQ==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr3612018wmb.5.1628587350964;
 Tue, 10 Aug 2021 02:22:30 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u11sm22306951wrt.89.2021.08.10.02.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:22:30 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:22:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 2/6] hw/acpi: Add VIOT table
Message-ID: <20210810112227.05bfbd9b@redhat.com>
In-Reply-To: <20210810084505.2257983-3-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-3-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 10:45:02 +0200
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add a function that generates a Virtual I/O Translation table (VIOT),
> describing the topology of paravirtual IOMMUs. The table is created when
> instantiating a virtio-iommu device. It contains a virtio-iommu node and
> PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> machine option and "bypass_iommu" PXB option, only buses that do not
> bypass the IOMMU are described by PCI Range nodes.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>


using packed structures for composing ACPI tables is discouraged,
pls use build_append_int_noprefix() API instead. You can look at
build_amd_iommu() as an example.

PS:
Also note field comments format.
/it should be verbatim copy of entry name from respective table in spec/


> ---
>  hw/acpi/viot.h      | 13 +++++++
>  hw/acpi/viot.c      | 82 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/Kconfig     |  4 +++
>  hw/acpi/meson.build |  1 +
>  4 files changed, 100 insertions(+)
>  create mode 100644 hw/acpi/viot.h
>  create mode 100644 hw/acpi/viot.c
> 
> diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
> new file mode 100644
> index 0000000000..4cef29a640
> --- /dev/null
> +++ b/hw/acpi/viot.h
> @@ -0,0 +1,13 @@
> +/*
> + * ACPI Virtual I/O Translation Table implementation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef VIOT_H
> +#define VIOT_H
> +
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id);
> +
> +#endif /* VIOT_H */
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> new file mode 100644
> index 0000000000..5cd10e9553
> --- /dev/null
> +++ b/hw/acpi/viot.c
> @@ -0,0 +1,82 @@
> +/*
> + * ACPI Virtual I/O Translation table implementation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/viot.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
> +
> +/* Build PCI range for a given PCI host bridge */
> +static int viot_host_bridges(Object *obj, void *opaque)
> +{
> +    GArray *pci_range_blob = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus && !pci_bus_bypass_iommu(bus)) {
> +            int min_bus, max_bus;
> +
> +            pci_bus_range(bus, &min_bus, &max_bus);
> +
> +            AcpiViotPciRange pci_range = {
> +                .type = ACPI_VIOT_NODE_PCI_RANGE,
> +                .length = cpu_to_le16(sizeof(pci_range)),
> +                .bdf_start = cpu_to_le16(PCI_BUILD_BDF(min_bus, 0)),
> +                .bdf_end = cpu_to_le16(PCI_BUILD_BDF(max_bus, 0xff)),
> +                .endpoint_start = cpu_to_le32(PCI_BUILD_BDF(min_bus, 0)),
> +            };
> +
> +            g_array_append_val(pci_range_blob, pci_range);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> + * endpoints.
> + */
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    int i;
> +    AcpiViot *viot;
> +    AcpiViotPciRange *pci_range;
> +    AcpiViotVirtioIommuPci *viommu;
> +    int viommu_off = sizeof(*viot);
> +    int viot_start = table_data->len;
> +    GArray *pci_ranges = g_array_new(false, true, sizeof(*pci_range));
> +
> +    viot = acpi_data_push(table_data, sizeof(*viot));
> +    viot->node_offset = cpu_to_le16(viommu_off);
> +
> +    viommu = acpi_data_push(table_data, sizeof(*viommu));
> +    viommu->type = ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI;
> +    viommu->length = cpu_to_le16(sizeof(*viommu));
> +    viommu->bdf = cpu_to_le16(virtio_iommu_bdf);
> +
> +    /* Build the list of PCI ranges that this viommu manages */
> +    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
> +                                   pci_ranges);
> +
> +    for (i = 0; i < pci_ranges->len; i++) {
> +        pci_range = &g_array_index(pci_ranges, AcpiViotPciRange, i);
> +        pci_range->output_node = cpu_to_le16(viommu_off);
> +    }
> +    viot->node_count = cpu_to_le16(pci_ranges->len + 1);
> +
> +    g_array_append_vals(table_data, pci_ranges->data,
> +                        pci_ranges->len * sizeof(*pci_range));
> +    g_array_free(pci_ranges, true);
> +
> +    build_header(linker, table_data, (void *)(table_data->data + viot_start),
> +                 "VIOT", table_data->len - viot_start, 0, oem_id, oem_table_id);
> +}
> +
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index cfc4ede8d9..abad79c103 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -41,6 +41,10 @@ config ACPI_VMGENID
>      default y
>      depends on PC
>  
> +config ACPI_VIOT
> +    bool
> +    depends on ACPI
> +
>  config ACPI_HW_REDUCED
>      bool
>      select ACPI
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 29f804d13e..a510988b27 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -16,6 +16,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))


