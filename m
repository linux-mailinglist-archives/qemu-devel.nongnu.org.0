Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E64361B8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:32:32 +0200 (CEST)
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXFG-0006sD-2c
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdXBN-0005BQ-Cw
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdXBK-0005bU-16
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634819304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmeAcUezG797Be+JeJ4Z0SR4O5q3oAnrcvj33BjJaTE=;
 b=SWtKamMfazSXUpm8IqnQJ6zxCERiyS+NzgiXZZc6me1hAA2ciXbNpHnMX61HJcoKIotptd
 CwOeDpmbCpUkExZZFDCHz6pJLDobSLasvDjXpMjmZT0YoGA1TrWK56rGvl+A+wgO+sNpS5
 qsvaXINwRVs++2TYgdWTtcVtiEpuFLg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-dDrtjQHhMBaF5Ouu2CqOeg-1; Thu, 21 Oct 2021 08:28:23 -0400
X-MC-Unique: dDrtjQHhMBaF5Ouu2CqOeg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so247608wmj.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 05:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=PmeAcUezG797Be+JeJ4Z0SR4O5q3oAnrcvj33BjJaTE=;
 b=N4sq+r4o9kLBEIz3n1CsF0DmQ76RK3mbrH0CD5UxZMhsDpdCxj4xx0I2JUC/eJgRpu
 QsSayatsrb3dheyW9Y+BtlRtcffoiKlk5tdFA1d5c0gsoXqNw51+jLOcFCFEwy9RnTWf
 QGMQF/OAcIdpGAQlqJqK1xJJm8MMh7niqMhy4zkoixvrsGWri6s6aH6dwkx9fJ5Vf3CR
 pqGxybrLP9GARqRzQjlepixzRqwcpFBO4aJ9A3VkzzpquHMn31ttLsLnV6MV7PtFF1TB
 55syFK85qtiVoeR22hVgcOalH/p6aBjsUDvbeJsdsqy0icgGzr5lBFvIbvg2NcDxtPLJ
 x4YA==
X-Gm-Message-State: AOAM532DgTu3Mm9iSw5zH7AFJYllEIDoGFoCV2J123/5WrNt8D1tN/zR
 +3/z0sdvd2Z3CpF+3+phWIgtyP2wLvLxi7clw8llYdRyYMzZqsd7Xi0dBh2VVHKi3/YEc96YRr1
 YfM6hPeMLmDNmdQ8=
X-Received: by 2002:a05:6000:552:: with SMTP id
 b18mr7316058wrf.112.1634819302738; 
 Thu, 21 Oct 2021 05:28:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJF86ESW4i0IbTedrwO60KnNWul3qVdNYGY3WTfs8Ci4DjepSs5Kng4SB+yXOFZaG0OpoanA==
X-Received: by 2002:a05:6000:552:: with SMTP id
 b18mr7316020wrf.112.1634819302524; 
 Thu, 21 Oct 2021 05:28:22 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f18sm4675782wrg.3.2021.10.21.05.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 05:28:22 -0700 (PDT)
Subject: Re: [PATCH 6/8] pci: Use pci_for_each_root_bus() in current code
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-7-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <c3962f8c-5504-6653-b76c-0cbca6cd5b0f@redhat.com>
Date: Thu, 21 Oct 2021 14:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-7-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/21/21 12:42 PM, Peter Xu wrote:
> There're three places that can be rewritten with the pci_for_each_root_bus()
> helper that we just introduced.  De-dup the code.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt-acpi-build.c | 31 +++++++++++--------------------
>  hw/i386/acpi-build.c     | 38 ++++++++++----------------------------
>  2 files changed, 21 insertions(+), 48 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..54b82aa863 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -263,28 +263,20 @@ struct AcpiIortIdMapping {
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
> @@ -318,8 +310,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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


