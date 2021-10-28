Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364D43DBB5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 09:13:14 +0200 (CEST)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfzb7-0007cb-82
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 03:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfzY7-0006Ye-33
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfzY2-0004Fo-Om
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635405001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xdv2bN0wFFoWtamJDPSbQ0SBugwkG65g2OPvJvKlDHU=;
 b=O0qHEsZKO9Yp4gOEhAjpvWkzBb7Aks1J65R8gajucau15xNEztnRQtqXiwbFFpSGVoWT89
 5aVCUatTQaP4Q0kGmM747Q5Ha6KSfPxiODPW3rj6Z8i2lAFcWQDTTP6i1CGe04VVnGucrW
 qmDD2sMOOYaFoWzOvWgLJiVRM28RNjs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-xoUgEsoyOQGmeamUMOrqGA-1; Thu, 28 Oct 2021 03:10:00 -0400
X-MC-Unique: xoUgEsoyOQGmeamUMOrqGA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso2411078wmq.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 00:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Xdv2bN0wFFoWtamJDPSbQ0SBugwkG65g2OPvJvKlDHU=;
 b=FkNXNJKc11VErm2S8IeEZ4kr9ngBL1Mn/+7wSmMH3XQZImrQloDbIQtIGmBopbuWYO
 F+mEyOKsQfiOOZtVDnDQf5/x3HcnBFHlO8C7jSU6/Up9HhggKHtG3QTlIjHLTqltNL2i
 IiNHZ4fy0a3hwdabeuwKRVlBVpKhplFdvf8sHJW7iLdLR7JvFwfPviOex/AAePa3XFCN
 fCNXMxU8I8m6GxNwJJyiIaw0Kt8MLMF9mxRZLPVnUxl5oFgSaLC54MnFhTrpCTH9RTyc
 UnWta9WnH4LNqb3KWGBLpQLMwMKWRp12SjHHmhAPZGYJjDu3Wvrp1bBao5HEocQJr9Sk
 CKvg==
X-Gm-Message-State: AOAM533WYWlwrLzJVBLKw3wvxtm9aa6Gj+6FhWlp8UecU24aHQKVFi09
 YWd0JorhsZ8OoHKxlPfn9uAIi9zdyy29/MuLgEff39XoycilMw3MI3nCd2sLtsCsUScCP3CaYlz
 w/Q+Q+wDkPIJmYS4=
X-Received: by 2002:a1c:1941:: with SMTP id 62mr2497223wmz.131.1635404998943; 
 Thu, 28 Oct 2021 00:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzitaM3p3lO5C8Y565R3NyZL5oDhCGJeMZz+NloTFIU8NUl0SIm2ao9tc85mVVE9nLygWkBuQ==
X-Received: by 2002:a1c:1941:: with SMTP id 62mr2497197wmz.131.1635404998733; 
 Thu, 28 Oct 2021 00:09:58 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b52.dip0.t-ipconnect.de. [79.242.59.82])
 by smtp.gmail.com with ESMTPSA id
 m34sm676411wms.25.2021.10.28.00.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 00:09:58 -0700 (PDT)
Message-ID: <9deb084d-c98c-3d04-277c-397c5727234b@redhat.com>
Date: Thu, 28 Oct 2021 09:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/5] pci: Add pci_for_each_root_bus()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-5-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211028043129.38871-5-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.21 06:31, Peter Xu wrote:
> Add a helper to loop over each root bus of the system, either the default root
> bus or extended buses like pxb-pcie.
> 
> There're three places that can be rewritten with the pci_for_each_root_bus()
> helper that we just introduced.  De-dup the code.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 31 +++++++++++--------------------
>  hw/i386/acpi-build.c     | 38 ++++++++++----------------------------
>  hw/pci/pci.c             | 26 ++++++++++++++++++++++++++
>  include/hw/pci/pci.h     |  2 ++
>  4 files changed, 49 insertions(+), 48 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..adba51f35a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -264,28 +264,20 @@ struct AcpiIortIdMapping {
>  typedef struct AcpiIortIdMapping AcpiIortIdMapping;
>  
>  /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
> -static int
> -iort_host_bridges(Object *obj, void *opaque)
> +static void
> +iort_host_bridges(PCIBus *bus, void *opaque)
>  {
> -    GArray *idmap_blob = opaque;
> -
> -    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> -        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> -
> -        if (bus && !pci_bus_bypass_iommu(bus)) {
> -            int min_bus, max_bus;
> +    if (!pci_bus_bypass_iommu(bus)) {
> +        int min_bus, max_bus;
>  
> -            pci_bus_range(bus, &min_bus, &max_bus);
> +        pci_bus_range(bus, &min_bus, &max_bus);
>  
> -            AcpiIortIdMapping idmap = {
> -                .input_base = min_bus << 8,
> -                .id_count = (max_bus - min_bus + 1) << 8,
> -            };
> -            g_array_append_val(idmap_blob, idmap);
> -        }
> +        AcpiIortIdMapping idmap = {
> +            .input_base = min_bus << 8,
> +            .id_count = (max_bus - min_bus + 1) << 8,
> +        };
> +        g_array_append_val((GArray *)opaque, idmap);
>      }
> -
> -    return 0;
>  }
>  
>  static int iort_idmap_compare(gconstpointer a, gconstpointer b)
> @@ -320,8 +312,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          AcpiIortIdMapping next_range = {0};
>  
> -        object_child_foreach_recursive(object_get_root(),
> -                                       iort_host_bridges, smmu_idmaps);
> +        pci_for_each_root_bus(iort_host_bridges, smmu_idmaps);
>  
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(smmu_idmaps, iort_idmap_compare);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a76b17ed92..3e50acfe35 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2123,20 +2123,12 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
>  }
>  
>  /* For a given PCI host bridge, walk and insert DMAR scope */
> -static int
> -dmar_host_bridges(Object *obj, void *opaque)
> +static void
> +dmar_host_bridges(PCIBus *bus, void *opaque)
>  {
> -    GArray *scope_blob = opaque;
> -
> -    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> -        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> -
> -        if (bus && !pci_bus_bypass_iommu(bus)) {
> -            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
> -        }
> +    if (!pci_bus_bypass_iommu(bus)) {
> +        pci_for_each_device_under_bus(bus, insert_scope, opaque);
>      }
> -
> -    return 0;
>  }
>  
>  /*
> @@ -2165,8 +2157,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>       * Insert scope for each PCI bridge and endpoint device which
>       * is attached to a bus with iommu enabled.
>       */
> -    object_child_foreach_recursive(object_get_root(),
> -                                   dmar_host_bridges, scope_blob);
> +    pci_for_each_root_bus(dmar_host_bridges, scope_blob);
>  
>      assert(iommu);
>      if (x86_iommu_ir_supported(iommu)) {
> @@ -2329,20 +2320,12 @@ insert_ivhd(PCIBus *bus, PCIDevice *dev, void *opaque)
>  }
>  
>  /* For all PCI host bridges, walk and insert IVHD entries */
> -static int
> -ivrs_host_bridges(Object *obj, void *opaque)
> +static void
> +ivrs_host_bridges(PCIBus *bus, void *opaque)
>  {
> -    GArray *ivhd_blob = opaque;
> -
> -    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> -        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> -
> -        if (bus && !pci_bus_bypass_iommu(bus)) {
> -            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
> -        }
> +    if (!pci_bus_bypass_iommu(bus)) {
> +        pci_for_each_device_under_bus(bus, insert_ivhd, opaque);
>      }
> -
> -    return 0;
>  }
>  
>  static void
> @@ -2380,8 +2363,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>       * blob further below.  Fall back to an entry covering all devices, which
>       * is sufficient when no aliases are present.
>       */
> -    object_child_foreach_recursive(object_get_root(),
> -                                   ivrs_host_bridges, ivhd_blob);
> +    pci_for_each_root_bus(ivrs_host_bridges, ivhd_blob);
>  
>      if (!ivhd_blob->len) {
>          /*
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478ce..258290f4eb 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2097,6 +2097,32 @@ void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>      }
>  }
>  
> +typedef struct {
> +    pci_bus_fn fn;
> +    void *opaque;
> +} PCIRootBusArgs;
> +
> +static int pci_find_root_bus(Object *obj, void *opaque)
> +{
> +    PCIRootBusArgs *args = opaque;
> +    PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +    if (bus) {
> +        args->fn(bus, args->opaque);
> +    }
> +
> +    return 0;
> +}
> +
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
> +{
> +    PCIRootBusArgs args = { .fn = fn, .opaque = opaque };
> +
> +    object_child_foreach_recursive_type(object_get_root(),
> +                                        TYPE_PCI_HOST_BRIDGE,
> +                                        pci_find_root_bus,
> +                                        &args);
> +}
>  
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
>  {
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 5c4016b995..6813f128e0 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -474,6 +474,8 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>                                             void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
> +/* Call `fn' for each pci root bus on the system */
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
>  
>  /* Use this wrapper when specific scan order is not required. */
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


