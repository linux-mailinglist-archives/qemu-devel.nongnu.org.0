Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA54110AE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:09:27 +0200 (CEST)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEMg-00036b-01
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEJg-00019s-GR
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEJc-0000zm-Dy
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632125174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFQ+ncOgAHbhSL7R4A2+R0najQGxzs7uOrshfM0Nf/o=;
 b=GrhnVKLMZ9gyBKIMKTGijerqWkRJu6CBRXvDG+iizoeLBCYsmAwD2CnUJ2UYw2ZCnGlbRB
 Ei8C+ZcbZyHWl9T5pZHTXfNNRh4INjxFpqgsoRNYtBLazKaGhzjwcKHsVQr/AdCTKHaUt5
 +KpC8xPJHuo+JJamiYfqPuQ5h0s4YJ0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-GULRMkwtMWeRxPb9jxEkxQ-1; Mon, 20 Sep 2021 04:06:12 -0400
X-MC-Unique: GULRMkwtMWeRxPb9jxEkxQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so13969301edn.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFQ+ncOgAHbhSL7R4A2+R0najQGxzs7uOrshfM0Nf/o=;
 b=1f8RI+rBNy7wVsHtdsVqOvYtyQX6+vKRYZ14W2Hltqrf0ee5j42wp8LtM8Mk1slCLH
 NtFG6ZF4pVNLBXZEdgN//Orx4i6sSA6Mmdd6UlCjwnlMF+peaGvLLr0r22dtoc1NpPP2
 PDmLCfaUkXaYeqnr65/JczcKkVdFAvFr8ckIb0zMtSuzgxdVeuybd65P2YgaccPrbeLm
 HrOm3cctkyW4TW5j56zRlnjX/qrwGaRMw53XlhURDc5VgFyYz+rW9p0YQiiZPTL4LjhT
 Oj4GxtDqZshmJyjtIRwjfcD3KsV1DCLDOR2HvjLLePqTh0PeMgd6OkrMxhYIVKO4pV8A
 GXSA==
X-Gm-Message-State: AOAM531vJtUM1QirjL/z0wunf3rVOTzKE300Vfvu8I2dnsmfO12Tjk43
 95NqDQ/pJKZ7BgAu7ugQDSplCpfiHaKBgu67eqV/S5TUP7vWQpy2dYkGdHDAtAGzh+HhPMiclrW
 9dQ0O+11QMyFFeGw=
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr27005012ejx.470.1632125171666; 
 Mon, 20 Sep 2021 01:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyUKfbXcdMl8sRJ3bvE4xqTA67Vtio/g9Til07kNHJ5/4mhnd9iatXqxA4bFsvKpwuEeJu0A==
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr27004993ejx.470.1632125171446; 
 Mon, 20 Sep 2021 01:06:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l11sm6576907edv.67.2021.09.20.01.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:06:10 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:06:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 01/10] hw/acpi: Add VIOT table
Message-ID: <20210920100609.301b6be2@redhat.com>
In-Reply-To: <20210914142004.2433568-2-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-2-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, 14 Sep 2021 15:19:56 +0100
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
> ---
> Sizes and types are hardcoded because it will now be the default style
> https://lore.kernel.org/qemu-devel/20210708154617.1538485-1-imammedo@redhat.com/
> ---
>  hw/acpi/viot.h      |  13 +++++
>  hw/acpi/viot.c      | 112 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/Kconfig     |   4 ++
>  hw/acpi/meson.build |   1 +
>  4 files changed, 130 insertions(+)
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
> index 0000000000..e7f7605119
> --- /dev/null
> +++ b/hw/acpi/viot.c
> @@ -0,0 +1,112 @@
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
> +struct viot_pci_ranges {
> +    GArray *blob;
> +    size_t count;
> +    uint16_t output_node;
> +};
> +
> +/* Build PCI range for a given PCI host bridge */
> +static int viot_host_bridges(Object *obj, void *opaque)
> +{
> +    struct viot_pci_ranges *pci_ranges = opaque;
> +    GArray *blob = pci_ranges->blob;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus && !pci_bus_bypass_iommu(bus)) {
> +            int min_bus, max_bus;
> +
> +            pci_bus_range(bus, &min_bus, &max_bus);
> +
> +            /* Type (PCI range) */
> +            build_append_int_noprefix(blob, 1, 1);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 1);
> +            /* Length */
> +            build_append_int_noprefix(blob, 24, 2);
> +            /* Endpoint start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> +            /* PCI Segment start */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI Segment end */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI BDF start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
> +            /* PCI BDF end */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
> +            /* Output node */
> +            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 6);
> +
> +            pci_ranges->count++;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> + * endpoints.

We usually put a pointer to spec/revision and chapter in it
that describes being implemented table, so reviewer would
have a reference to compare code with. Otherwise I have no
idea if implementation is correct or not.

ex: build_hmat_mpda

the same applies to viot_host_bridges

> + */
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    /* The virtio-iommu node follows the 48-bytes header */
> +    int viommu_off = 48;
> +    AcpiTable table = { .sig = "VIOT", .rev = 0,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    struct viot_pci_ranges pci_ranges = {
> +        .output_node = viommu_off,
> +        .blob = g_array_new(false, true, 1),
> +    };
> +
> +    /* Build the list of PCI ranges that this viommu manages */
> +    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
> +                                   &pci_ranges);
> +
> +    /* ACPI table header */
> +    acpi_table_begin(&table, table_data);
> +    /* Node count */
> +    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> +    /* Node offset */
> +    build_append_int_noprefix(table_data, viommu_off, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* Virtio-iommu node */
> +    /* Type (virtio-pci IOMMU)  */
> +    build_append_int_noprefix(table_data, 3, 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Length */
> +    build_append_int_noprefix(table_data, 16, 2);
> +    /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* PCI BDF number */
> +    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* PCI ranges found above */
> +    g_array_append_vals(table_data, pci_ranges.blob->data,
> +                        pci_ranges.blob->len);
> +    g_array_free(pci_ranges.blob, true);
> +
> +    acpi_table_end(linker, &table);
> +}
> +
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 3b5e118c54..622b0b50b7 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -51,6 +51,10 @@ config ACPI_VMGENID
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
> index 7d8c0eb43e..adf6347bc4 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files(
>  acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))


