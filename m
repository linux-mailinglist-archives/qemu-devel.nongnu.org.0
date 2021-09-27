Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65056419209
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:12:05 +0200 (CEST)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUncC-0001fT-DW
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUnN9-0000Ix-LM
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUnN7-00076X-7V
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632736588;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRVOURJ66OOiwNC5yT93eciqVxsq/L+w3fZFsrnNTqA=;
 b=NQavmP0eQoQ6fRyZPkaSWk+yojIks34USQszFrmXtnzoHxKINikqvYBbWm3bUCQdzmkr8A
 U5vKaq3k3RG81BSuMWLgjv7XJM5hSwfFPVvLNDpmJVN5iZ4SqcNXbGZCn/KaJnE2WxmTgj
 gqAzypk1dJwowJwF2xw6l6wOYm0MCDo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Wl7y5B1wNwG4BWPwMWCi7w-1; Mon, 27 Sep 2021 05:56:24 -0400
X-MC-Unique: Wl7y5B1wNwG4BWPwMWCi7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 u7-20020adfed47000000b0016061b6caa8so3121873wro.16
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=YRVOURJ66OOiwNC5yT93eciqVxsq/L+w3fZFsrnNTqA=;
 b=fIJq9dz/Z5SSnR899NQC0EvGWFWOxNjiAJrbpJSmTjVnOwMjauNHNDz1a+kPOBRqiY
 txUrWuupdeOlos9J6l1JoSi4IFZCIwbChn2sadiy2iczhR20Q2ncQZhKZxG6HFWXMsSd
 EOaCQNzpdWE+i+VubaJquwDJpgzQOacG08VsVNLq1b460CIkSaf/kpoolKOp+0MTMDvp
 2IE9uYHEoOx0QGeaQ1gyMCHIMJiB+HN7iMR0oMtsYZVTU1Q3jU3uziHx2yfJOlP3KVLR
 uDOz5Aym6hHJKpmokJJrTbzO11GTPTyk50kquPE+/rldzl4UAi21YvARRM6bv3pEynN7
 F6WA==
X-Gm-Message-State: AOAM5336IOmgS9d0NSxC3sVKTby6DZYNrr/fUQVyNFf5urHH3UhnQkqA
 dGVaLPd+Fh7iJU6yFikQiJvqaiaihi1GcJF1Tx/imLir0Two8D5LFgKvTLoTc/c7pXnLq7fW14K
 nTreadIdqzSpXgKo=
X-Received: by 2002:a1c:7e55:: with SMTP id z82mr14911671wmc.95.1632736583694; 
 Mon, 27 Sep 2021 02:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTjkpM2dILeU1aD/h/LbInVXMPPQXQjmcx8jE6R7uyoNK/Qrw9krQKnE9Yjci4NA1tvDs7eA==
X-Received: by 2002:a1c:7e55:: with SMTP id z82mr14911649wmc.95.1632736583481; 
 Mon, 27 Sep 2021 02:56:23 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o17sm15994737wrj.96.2021.09.27.02.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 02:56:22 -0700 (PDT)
Subject: Re: [PATCH v4 29/35] acpi: arm/virt: convert build_iort() to endian
 agnostic build_append_FOO() API
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210924122802.1455362-1-imammedo@redhat.com>
 <20210924122802.1455362-30-imammedo@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a33a9f79-96ef-2d55-90e4-1d015527fd21@redhat.com>
Date: Mon, 27 Sep 2021 11:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210924122802.1455362-30-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, wangxingang5@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/21 2:27 PM, Igor Mammedov wrote:
> Drop usage of packed structures and explicit endian conversions
> when building IORT table use endian agnostic build_append_int_noprefix()
> API to build it.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Eric Auger <eric.auger@redhat.com>
>
> v4:
>   - (Eric Auger <eric.auger@redhat.com>)
>     * keep nb_nodes
>     * encode 'Memory access properties' as separate entries according to
>       Table 13
>     * keep some comments
> v3:
>   * practically rewritten, due to conflicts wiht bypass iommu feature
>
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> CC: wangxingang5@huawei.com
> CC: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/acpi/acpi-defs.h |  71 ----------------
>  hw/arm/virt-acpi-build.c    | 164 ++++++++++++++++++++----------------
>  2 files changed, 93 insertions(+), 142 deletions(-)
>
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 195f90caf6..6f2f08a9de 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -188,75 +188,4 @@ struct AcpiGenericTimerTable {
>  } QEMU_PACKED;
>  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
>  
> -/*
> - * IORT node types
> - */
> -
> -#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
> -    uint8_t  type;          \
> -    uint16_t length;        \
> -    uint8_t  revision;      \
> -    uint32_t reserved;      \
> -    uint32_t mapping_count; \
> -    uint32_t mapping_offset;
> -
> -/* Values for node Type above */
> -enum {
> -        ACPI_IORT_NODE_ITS_GROUP = 0x00,
> -        ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
> -        ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
> -        ACPI_IORT_NODE_SMMU = 0x03,
> -        ACPI_IORT_NODE_SMMU_V3 = 0x04
> -};
> -
> -struct AcpiIortIdMapping {
> -    uint32_t input_base;
> -    uint32_t id_count;
> -    uint32_t output_base;
> -    uint32_t output_reference;
> -    uint32_t flags;
> -} QEMU_PACKED;
> -typedef struct AcpiIortIdMapping AcpiIortIdMapping;
> -
> -struct AcpiIortMemoryAccess {
> -    uint32_t cache_coherency;
> -    uint8_t  hints;
> -    uint16_t reserved;
> -    uint8_t  memory_flags;
> -} QEMU_PACKED;
> -typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
> -
> -struct AcpiIortItsGroup {
> -    ACPI_IORT_NODE_HEADER_DEF
> -    uint32_t its_count;
> -    uint32_t identifiers[];
> -} QEMU_PACKED;
> -typedef struct AcpiIortItsGroup AcpiIortItsGroup;
> -
> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
> -
> -struct AcpiIortSmmu3 {
> -    ACPI_IORT_NODE_HEADER_DEF
> -    uint64_t base_address;
> -    uint32_t flags;
> -    uint32_t reserved2;
> -    uint64_t vatos_address;
> -    uint32_t model;
> -    uint32_t event_gsiv;
> -    uint32_t pri_gsiv;
> -    uint32_t gerr_gsiv;
> -    uint32_t sync_gsiv;
> -    AcpiIortIdMapping id_mapping_array[];
> -} QEMU_PACKED;
> -typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> -
> -struct AcpiIortRC {
> -    ACPI_IORT_NODE_HEADER_DEF
> -    AcpiIortMemoryAccess memory_properties;
> -    uint32_t ats_attribute;
> -    uint32_t pci_segment_number;
> -    AcpiIortIdMapping id_mapping_array[];
> -} QEMU_PACKED;
> -typedef struct AcpiIortRC AcpiIortRC;
> -
>  #endif
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 42ea460313..8c382915a9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -240,6 +240,28 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  }
>  #endif
>  
> +#define ID_MAPPING_ENTRY_SIZE 20
> +#define SMMU_V3_ENTRY_SIZE 60
> +#define ROOT_COMPLEX_ENTRY_SIZE 32
> +#define IORT_NODE_OFFSET 48
> +
> +static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
> +                                  uint32_t id_count, uint32_t out_ref)
> +{
> +    /* Identity RID mapping covering the whole input RID range */
> +    build_append_int_noprefix(table_data, input_base, 4); /* Input base */
> +    build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
> +    build_append_int_noprefix(table_data, input_base, 4); /* Output base */
> +    build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
> +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> +}
> +
> +struct AcpiIortIdMapping {
> +    uint32_t input_base;
> +    uint32_t id_count;
> +};
> +typedef struct AcpiIortIdMapping AcpiIortIdMapping;
> +
>  /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
>  static int
>  iort_host_bridges(Object *obj, void *opaque)
> @@ -282,17 +304,16 @@ static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      int i, nb_nodes, rc_mapping_count;
> -    AcpiIortIdMapping *idmap;
> -    AcpiIortItsGroup *its;
> -    AcpiIortSmmu3 *smmu;
> -    AcpiIortRC *rc;
> -    const uint32_t iort_node_offset = 48;
> +    const uint32_t iort_node_offset = IORT_NODE_OFFSET;
>      size_t node_size, smmu_offset = 0;
> +    AcpiIortIdMapping *idmap;
>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>  
>      AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> +    /* Table 2 The IORT */
> +    acpi_table_begin(&table, table_data);
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          AcpiIortIdMapping next_range = {0};
> @@ -330,100 +351,101 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          nb_nodes = 2; /* RC, ITS */
>          rc_mapping_count = 1;
>      }
> -
> -    /* Table 2 The IORT */
> -    acpi_table_begin(&table, table_data);
>      /* Number of IORT Nodes */
>      build_append_int_noprefix(table_data, nb_nodes, 4);
> +
>      /* Offset to Array of IORT Nodes */
> -    build_append_int_noprefix(table_data, iort_node_offset, 4);
> +    build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>  
> -    /* ITS group node */
> -    node_size =  sizeof(*its) + sizeof(uint32_t);
> -    its = acpi_data_push(table_data, node_size);
> -
> -    its->type = ACPI_IORT_NODE_ITS_GROUP;
> -    its->length = cpu_to_le16(node_size);
> -    its->its_count = cpu_to_le32(1);
> -    its->identifiers[0] = 0; /* MADT translation_id */
> +    /* 3.1.1.3 ITS group node */
> +    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
> +    node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
> +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
> +    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> +    /* GIC ITS Identifier Array */
> +    build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>  
> -        /* SMMUv3 node */
> -        smmu_offset = iort_node_offset + node_size;
> -        node_size = sizeof(*smmu) + sizeof(*idmap);
> -        smmu = acpi_data_push(table_data, node_size);
> -
> -        smmu->type = ACPI_IORT_NODE_SMMU_V3;
> -        smmu->length = cpu_to_le16(node_size);
> -        smmu->mapping_count = cpu_to_le32(1);
> -        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
> -        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> -        smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
> -        smmu->event_gsiv = cpu_to_le32(irq);
> -        smmu->pri_gsiv = cpu_to_le32(irq + 1);
> -        smmu->sync_gsiv = cpu_to_le32(irq + 2);
> -        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
> -
> -        /* Identity RID mapping covering the whole input RID range */
> -        idmap = &smmu->id_mapping_array[0];
> -        idmap->input_base = 0;
> -        idmap->id_count = cpu_to_le32(0xFFFF);
> -        idmap->output_base = 0;
> +        smmu_offset = table_data->len - table.table_offset;
> +        /* 3.1.1.2 SMMUv3 */
> +        build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
> +        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> +        build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +        build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
> +        /* Reference to ID Array */
> +        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
> +        /* Base address */
> +        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
> +        /* Flags */
> +        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
> +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
> +        /* Model */
> +        build_append_int_noprefix(table_data, 0 /* Generic SMMU-v3 */, 4);
> +        build_append_int_noprefix(table_data, irq, 4); /* Event */
> +        build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
> +        build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
> +        build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
> +
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>      }
>  
> -    /* Root Complex Node */
> -    node_size = sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
> -    rc = acpi_data_push(table_data, node_size);
> -
> -    rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> -    rc->length = cpu_to_le16(node_size);
> -    rc->mapping_count = cpu_to_le32(rc_mapping_count);
> -    rc->mapping_offset = cpu_to_le32(sizeof(*rc));
> -
> -    /* fully coherent device */
> -    rc->memory_properties.cache_coherency = cpu_to_le32(1);
> -    rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
> -    rc->pci_segment_number = 0; /* MCFG pci_segment */
> -
> +    /* Table 16 Root Complex Node */
> +    build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /* Type */
> +    node_size =  ROOT_COMPLEX_ENTRY_SIZE +
> +                 ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
> +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    /* Number of ID mappings */
> +    build_append_int_noprefix(table_data, rc_mapping_count, 4);
> +    /* Reference to ID Array */
> +    build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
> +
> +    /* Table 13 Memory access properties */
> +    /* CCA: Cache Coherent Attribute */
> +    build_append_int_noprefix(table_data, 1 /* fully coherent */, 4);
> +    build_append_int_noprefix(table_data, 0, 1); /* AH: Note Allocation Hints */
> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> +    /* MAF: Note Memory Access Flags */
> +    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DCAS = 1 */, 1);
This is DACS and not DCAS but that's not your fault.

we can send a separate trivial patch afterwards to fix the typo.

Sanity checking with GICv3 and GICv2 and SMMUv3.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thank you for the huge refactoring effort

Eric

> +
> +    build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
> +    /* MCFG pci_segment */
> +    build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
> +
> +    /* Output Reference */
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          AcpiIortIdMapping *range;
>  
>          /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
>          for (i = 0; i < smmu_idmaps->len; i++) {
> -            idmap = &rc->id_mapping_array[i];
>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> -
> -            idmap->input_base = cpu_to_le32(range->input_base);
> -            idmap->id_count = cpu_to_le32(range->id_count);
> -            idmap->output_base = cpu_to_le32(range->input_base);
>              /* output IORT node is the smmuv3 node */
> -            idmap->output_reference = cpu_to_le32(smmu_offset);
> +            build_iort_id_mapping(table_data, range->input_base,
> +                                  range->id_count, smmu_offset);
>          }
>  
>          /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
>          for (i = 0; i < its_idmaps->len; i++) {
> -            idmap = &rc->id_mapping_array[smmu_idmaps->len + i];
>              range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
> -
> -            idmap->input_base = cpu_to_le32(range->input_base);
> -            idmap->id_count = cpu_to_le32(range->id_count);
> -            idmap->output_base = cpu_to_le32(range->input_base);
>              /* output IORT node is the ITS group node (the first node) */
> -            idmap->output_reference = cpu_to_le32(iort_node_offset);
> +            build_iort_id_mapping(table_data, range->input_base,
> +                                  range->id_count, iort_node_offset);
>          }
>      } else {
> -        /* Identity RID mapping covering the whole input RID range */
> -        idmap = &rc->id_mapping_array[0];
> -        idmap->input_base = cpu_to_le32(0);
> -        idmap->id_count = cpu_to_le32(0xFFFF);
> -        idmap->output_base = cpu_to_le32(0);
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>      }
>  
>      acpi_table_end(linker, &table);


