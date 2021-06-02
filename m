Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49714398CA5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:22:52 +0200 (CEST)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRli-00075G-Pn
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loRkd-00067v-HH
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loRka-0004ob-Cl
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622643699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SVd4wGa9TvYJJ5EdXMrYuG0/6g4jZ1IQTIhi/oGoBY=;
 b=fWCXUmSZy3Tk95J+tb1kEtdWbkFoDFjFZ4mEKXhJqy6w4VkFVG8OA91DIKMjgr4Ab0huHT
 Npp3uix54qE2M4RR/wfg7w8lvDr0awOw4DyMhVWBzdHNPxxcVL/r/pLfTJzx14iIp5FxKS
 RATKvku2a5qn5fF7Thwu4VaPm1YGCXM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-cvd01ijUP3e8ZK7CBIRK6w-1; Wed, 02 Jun 2021 10:21:37 -0400
X-MC-Unique: cvd01ijUP3e8ZK7CBIRK6w-1
Received: by mail-wm1-f71.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so2273013wmj.4
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 07:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=1SVd4wGa9TvYJJ5EdXMrYuG0/6g4jZ1IQTIhi/oGoBY=;
 b=by1WMrP1JwRzJe8zfaKlTJ7FJs+PYpdgfHtd/6EysU8n1PwApKBg2Lnv7HT0mdGx11
 2MPmwQdjSC56yiVl4PchkgkAA5THgBqo0MAyiaNy/nN8fRGQRGiFUHwJDBVH0DcbdooN
 T5B+PqoZXa9LLLyoMTS8KNTqVoO8giFDGfaj0la61Rbal/hClO+A15gn9g3MeuAmmPMb
 Qpu6IGXUKW8+ZxgZ62vvIOvEcPEXsJNHKmpQpQ2Gm816vKcFwA1nVpvweIgBjicv9F+D
 qK2vhNC5cA/B7aerUOCIiBirQsOo1EvwCRjF06/IEKs5fXLD7okoFABoHuKM8sJmIsNN
 aSLg==
X-Gm-Message-State: AOAM530P9+PswJBBdq/ovXqGdjylR/gpFNt6fms8RfL7Y2WBDyaTgmdB
 tfrBttVfDIzItpk2lhFfIXR4sG3kz+XCOi4X41nBWPq3I/R6f1i4XCsISisBlNyxgzIdaASCRVX
 fp5hA1lSEcVDI4gc=
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr5471414wmy.54.1622643696622; 
 Wed, 02 Jun 2021 07:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyokVA3Qi3x0FXikgvZsCc6OxljGbCL5cSfWz8VCVCX32TxSIUabTrXHT0ARhG9B61IM2Av8Q==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr5471377wmy.54.1622643696254; 
 Wed, 02 Jun 2021 07:21:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l5sm2789839wmi.46.2021.06.02.07.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 07:21:35 -0700 (PDT)
Subject: Re: [PATCH v4 6/8] hw/arm/virt-acpi-build: Add explicit IORT idmap
 for smmuv3 node
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-7-git-send-email-wangxingang5@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <196dc14c-cb5d-463d-1479-dadac7ffd88e@redhat.com>
Date: Wed, 2 Jun 2021 16:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-7-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 5/25/21 5:50 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add explicit IORT idmap info according to pci root bus number
> range, and only add smmu idmap for those which does not bypass iommu.
>
> For idmap directly to ITS node, this split the whole RID mapping to
> smmu idmap and its idmap. So this should cover the whole idmap for
> through/bypass SMMUv3 node.
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 135 +++++++++++++++++++++++++++++++++------
>  1 file changed, 116 insertions(+), 19 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 60fe2e65a7..f63a57dcfa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -44,6 +44,7 @@
>  #include "hw/acpi/tpm.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/arm/virt.h"
>  #include "hw/mem/nvdimm.h"
> @@ -237,16 +238,82 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>      aml_append(scope, dev);
>  }
>  
> +/* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
> +static int
> +iort_host_bridges(Object *obj, void *opaque)
> +{
> +    GArray *idmap_blob = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus && !pci_bus_bypass_iommu(bus)) {
> +            int min_bus, max_bus;
extra line needed
> +            pci_bus_range(bus, &min_bus, &max_bus);
> +
> +            AcpiIortIdMapping idmap = {
> +                .input_base = min_bus << 8,
> +                .id_count = (max_bus - min_bus + 1) << 8,
> +            };
> +            g_array_append_val(idmap_blob, idmap);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int iort_idmap_compare(gconstpointer a, gconstpointer b)
> +{
> +    AcpiIortIdMapping *idmap_a = (AcpiIortIdMapping *)a;
> +    AcpiIortIdMapping *idmap_b = (AcpiIortIdMapping *)b;
> +
> +    return idmap_a->input_base - idmap_b->input_base;
> +}
> +
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    int nb_nodes, iort_start = table_data->len;
> -    AcpiIortIdMapping *idmap;
> +    int i, nb_nodes, rc_map_count, iort_start = table_data->len;
> +    AcpiIortIdMapping *idmap, *range;
>      AcpiIortItsGroup *its;
>      AcpiIortTable *iort;
>      AcpiIortSmmu3 *smmu;
>      size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
>      AcpiIortRC *rc;
> +    GArray *smmu_idmap_ranges =
> +        g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    GArray *its_idmap_ranges =
> +        g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +
> +    object_child_foreach_recursive(object_get_root(),
> +                                   iort_host_bridges, smmu_idmap_ranges);
> +
> +    g_array_sort(smmu_idmap_ranges, iort_idmap_compare);
> +
> +    AcpiIortIdMapping next_range = {
> +        .input_base = 0,
> +    };
> +
> +    /*
> +     * Build the iort ID mapping to ITS directly,
> +     * split the whole RID input range by RID mapping to SMMU node
> +     */
> +    for (i = 0; i < smmu_idmap_ranges->len; i++) {
> +        idmap = &g_array_index(smmu_idmap_ranges, AcpiIortIdMapping, i);
> +
> +        if (next_range.input_base < idmap->input_base) {
> +            next_range.id_count = idmap->input_base - next_range.input_base;
> +            g_array_append_val(its_idmap_ranges, next_range);
> +        }
> +
> +        next_range.input_base = idmap->input_base + idmap->id_count;
> +    }
> +
> +    /* Append the last ITS ID mapping */
> +    if (next_range.input_base < 0xFFFF) {
> +        next_range.id_count = 0xFFFF - next_range.input_base;
> +        g_array_append_val(its_idmap_ranges, next_range);
> +    }
>  
>      iort = acpi_data_push(table_data, sizeof(*iort));
>  
> @@ -280,13 +347,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>          /* SMMUv3 node */
>          smmu_offset = iort_node_offset + node_size;
> -        node_size = sizeof(*smmu) + sizeof(*idmap);
> +        node_size = sizeof(*smmu) + sizeof(*idmap) * smmu_idmap_ranges->len;
>          iort_length += node_size;
>          smmu = acpi_data_push(table_data, node_size);
>  
>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
>          smmu->length = cpu_to_le16(node_size);
> -        smmu->mapping_count = cpu_to_le32(1);
> +        smmu->mapping_count = cpu_to_le32(smmu_idmap_ranges->len);
>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>          smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
> @@ -295,23 +362,32 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->sync_gsiv = cpu_to_le32(irq + 2);
>          smmu->gerr_gsiv = cpu_to_le32(irq + 3);
>  
> -        /* Identity RID mapping covering the whole input RID range */
> -        idmap = &smmu->id_mapping_array[0];
> -        idmap->input_base = 0;
> -        idmap->id_count = cpu_to_le32(0xFFFF);
> -        idmap->output_base = 0;
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        for (i = 0; i < smmu_idmap_ranges->len; i++) {
> +            idmap = &smmu->id_mapping_array[i];
> +            range = &g_array_index(smmu_idmap_ranges, AcpiIortIdMapping, i);
> +
> +            idmap->input_base = cpu_to_le32(range->input_base);
> +            idmap->id_count = cpu_to_le32(range->id_count);
> +            idmap->output_base = cpu_to_le32(range->input_base);
> +            idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        }
I don't really get this extra complexity. Can't the SMMU -> ITS mapping
be a direct mapping covering the whole range of RIDs.
Do you really need to match the input ID range? I don't think so.

Bypassed RIDs should only affect RC mappings to me.
>      }
>  
>      /* Root Complex Node */
> -    node_size = sizeof(*rc) + sizeof(*idmap);
> +    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +        rc_map_count = smmu_idmap_ranges->len + its_idmap_ranges->len;
> +    } else {
> +        rc_map_count = 1;
> +    }
> +
> +    node_size = sizeof(*rc) + sizeof(*idmap) * rc_map_count;
>      iort_length += node_size;
>      rc = acpi_data_push(table_data, node_size);
>  
>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>      rc->length = cpu_to_le16(node_size);
> -    rc->mapping_count = cpu_to_le32(1);
> +    rc->mapping_count = cpu_to_le32(rc_map_count);
>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>  
>      /* fully coherent device */
> @@ -319,20 +395,41 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>      rc->pci_segment_number = 0; /* MCFG pci_segment */
>  
> -    /* Identity RID mapping covering the whole input RID range */
> -    idmap = &rc->id_mapping_array[0];
> -    idmap->input_base = 0;
> -    idmap->id_count = cpu_to_le32(0xFFFF);
> -    idmap->output_base = 0;
> -
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          /* output IORT node is the smmuv3 node */
maybe add a comment saying translated RIDs connect to SMMU node
> -        idmap->output_reference = cpu_to_le32(smmu_offset);
> +        for (i = 0; i < smmu_idmap_ranges->len; i++) {
> +            idmap = &rc->id_mapping_array[i];
> +            range = &g_array_index(smmu_idmap_ranges, AcpiIortIdMapping, i);
> +
> +            idmap->input_base = cpu_to_le32(range->input_base);
> +            idmap->id_count = cpu_to_le32(range->id_count);
> +            idmap->output_base = cpu_to_le32(range->input_base);
> +            idmap->output_reference = cpu_to_le32(smmu_offset);
> +        }
> +
add comment saying bypassed RIDs connect to ITS directly?
> +        /* output IORT node is the ITS group node (the first node) */
> +        for (i = 0; i < its_idmap_ranges->len; i++) {
> +            idmap = &rc->id_mapping_array[smmu_idmap_ranges->len + i];
> +            range = &g_array_index(its_idmap_ranges, AcpiIortIdMapping, i);
> +
> +            idmap->input_base = cpu_to_le32(range->input_base);
> +            idmap->id_count = cpu_to_le32(range->id_count);
> +            idmap->output_base = cpu_to_le32(range->input_base);
> +            idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        }
>      } else {
> +        /* Identity RID mapping covering the whole input RID range */
> +        idmap = &rc->id_mapping_array[0];
> +        idmap->input_base = cpu_to_le32(0);
> +        idmap->id_count = cpu_to_le32(0xFFFF);
> +        idmap->output_base = cpu_to_le32(0);
>          /* output IORT node is the ITS group node (the first node) */
>          idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
> +    g_array_free(smmu_idmap_ranges, true);
> +    g_array_free(its_idmap_ranges, true);
> +
>      /*
>       * Update the pointer address in case table_data->data moves during above
>       * acpi_data_push operations.
Thanks

Eric


