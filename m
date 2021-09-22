Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65238414918
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:38:32 +0200 (CEST)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1WA-0003RD-Tr
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT1Pf-0005l6-HM
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT1Pa-0008Vp-6k
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632313901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7TZwJ41bXhnUpchhGW2z/Sp92vgIQwNdCThqat+ZiM=;
 b=dTtqpKMMoeDoSPuaGptW7OQntuYQYU2R6QOVRfMZFHBo9kbfMVT4vx3on+/iIWUJbontzw
 w0qPN9z/wLCISik0ySvZh0IoXPD2HGb0fwf1QLWg2DggDAydH9WyCEeW5ARjGZJhX41Uqq
 VMSIE539lEqUVENlu5phK7ptbrRxic8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-TGtxfu15MpyDDd3ncNxVzA-1; Wed, 22 Sep 2021 08:31:40 -0400
X-MC-Unique: TGtxfu15MpyDDd3ncNxVzA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so2073169wrh.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w7TZwJ41bXhnUpchhGW2z/Sp92vgIQwNdCThqat+ZiM=;
 b=6PAsabORJsI368blm/MkX2dT7OAObzVDzKuI2eFK1ezG18fd4XitHUmGxgx2q7f96Q
 WFYu0nQ2PD1Kc7lr4oLRCrRW+h4D4AnJ0JzmfLMUm6GPApBR/MvjTJcfNu+Gu1EfEFW5
 IuWRGcaxFpg45yHpEtIZfqUfz+nNptQkkmAzDz3BTU1ns3PGf49/8e5UIwifMBjzxbuw
 E08LwLWdRLBNDtFjccln9mw+3J66/5K0cMFCd3HvRP429zJifH9ot5xqvOlUZBvcRRGk
 SuhJH8cLArcwmN5T6yOELiR+6T6HqZxCVhNPmLP79m/DN0bcIry5RLDPeSlOCPD7SM2M
 gzBQ==
X-Gm-Message-State: AOAM530d4acO0AdRZpZijGiyWjrWs1bAE5eo9dz2w+yjvx3+3YMGeFz7
 0wmTVvPu6x+XSwhWoNRvi55Sh+udtK27+yVnP0iIcCE9IrPWybeqKIjhbaRse3yirXdPzPjVELF
 vWwbAGH1Ba+id9VY=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr1145056wmc.117.1632313899081; 
 Wed, 22 Sep 2021 05:31:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRmhSDr0CNts/ZtJ8nQxSMebdqkyaum/d0ajghRgDkqOxYwutGs7eUGj2rO0OvvhtfKO+aDQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr1145026wmc.117.1632313898899; 
 Wed, 22 Sep 2021 05:31:38 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f8sm2065114wrx.15.2021.09.22.05.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:31:38 -0700 (PDT)
Subject: Re: [PATCH v3 28/35] acpi: arm: virt: build_iort: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-29-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <8185ebb8-7302-bcb3-f36f-9a7ac2388263@redhat.com>
Date: Wed, 22 Sep 2021 14:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-29-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * fix conflicts due to
>       42e0f050e3a51 'hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3'
>   *  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> CC: eauger@redhat.com
> ---
>  include/hw/acpi/acpi-defs.h | 14 ------------
>  hw/arm/virt-acpi-build.c    | 45 ++++++++++++++++---------------------
>  2 files changed, 19 insertions(+), 40 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index bcada37601..195f90caf6 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -188,20 +188,6 @@ struct AcpiGenericTimerTable {
>  } QEMU_PACKED;
>  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
>  
> -/*
> - * Input Output Remapping Table (IORT)
> - * Conforms to "IO Remapping Table System Software on ARM Platforms",
> - * Document number: ARM DEN 0049B, October 2015
> - */
> -
> -struct AcpiIortTable {
> -    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
> -    uint32_t node_count;
> -    uint32_t node_offset;
> -    uint32_t reserved;
> -} QEMU_PACKED;
> -typedef struct AcpiIortTable AcpiIortTable;
> -
>  /*
>   * IORT node types
>   */
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4b9687439d..bceb1b3b7e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -273,22 +273,29 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>      return idmap_a->input_base - idmap_b->input_base;
>  }
>  
> +/*
> + * Input Output Remapping Table (IORT)
> + * Conforms to "IO Remapping Table System Software on ARM Platforms",
> + * Document number: ARM DEN 0049B, October 2015
> + */
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    int i, nb_nodes, rc_mapping_count, iort_start = table_data->len;
> +    int i, nb_nodes, rc_mapping_count;
>      AcpiIortIdMapping *idmap;
>      AcpiIortItsGroup *its;
> -    AcpiIortTable *iort;
>      AcpiIortSmmu3 *smmu;
> -    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
>      AcpiIortRC *rc;
> +    const uint32_t iort_node_offset = 48;
> +    size_t node_size, smmu_offset = 0;
>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>  
> -    iort = acpi_data_push(table_data, sizeof(*iort));
> +    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +
>          AcpiIortIdMapping next_range = {0};
>  
>          object_child_foreach_recursive(object_get_root(),
> @@ -325,18 +332,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          rc_mapping_count = 1;
>      }
>  
> -    iort_length = sizeof(*iort);
> -    iort->node_count = cpu_to_le32(nb_nodes);
> -    /*
> -     * Use a copy in case table_data->data moves during acpi_data_push
> -     * operations.
> -     */
> -    iort_node_offset = sizeof(*iort);
> -    iort->node_offset = cpu_to_le32(iort_node_offset);
> +    /* Table 2 The IORT */
> +    acpi_table_begin(&table, table_data);
> +    /* Number of IORT Nodes */
> +    build_append_int_noprefix(table_data, nb_nodes, 4);
> +    /* Offset to Array of IORT Nodes */
> +    build_append_int_noprefix(table_data, iort_node_offset, 4);
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>  
>      /* ITS group node */
>      node_size =  sizeof(*its) + sizeof(uint32_t);
> -    iort_length += node_size;
>      its = acpi_data_push(table_data, node_size);
>  
>      its->type = ACPI_IORT_NODE_ITS_GROUP;
> @@ -350,7 +355,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* SMMUv3 node */
>          smmu_offset = iort_node_offset + node_size;
>          node_size = sizeof(*smmu) + sizeof(*idmap);
> -        iort_length += node_size;
>          smmu = acpi_data_push(table_data, node_size);
>  
>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
> @@ -375,7 +379,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      /* Root Complex Node */
>      node_size = sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
> -    iort_length += node_size;
>      rc = acpi_data_push(table_data, node_size);
>  
>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> @@ -424,19 +427,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
> +    acpi_table_end(linker, &table);
>      g_array_free(smmu_idmaps, true);
>      g_array_free(its_idmaps, true);
> -
> -    /*
> -     * Update the pointer address in case table_data->data moves during above
> -     * acpi_data_push operations.
> -     */
> -    iort = (AcpiIortTable *)(table_data->data + iort_start);
> -    iort->length = cpu_to_le32(iort_length);
> -
> -    build_header(linker, table_data, (void *)(table_data->data + iort_start),
> -                 "IORT", table_data->len - iort_start, 0, vms->oem_id,
> -                 vms->oem_table_id);
>  }
>  
>  static void
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric


