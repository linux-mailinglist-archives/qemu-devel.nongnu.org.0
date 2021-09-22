Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB2414D0F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:34:34 +0200 (CEST)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4GX-0004tJ-81
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mT4E5-0002vG-FB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mT4E2-0002a1-FG
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632324716;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=niltNsvI9idq0hQuV0OgXVpIEHbMhmSWkiU9Lz4s8UA=;
 b=c2Al41fgTXkldkUxkaIAWdOQQSVHilcdlNyPD/T3/spBm7MkCggaS3otIjGiMEizKCxgWK
 ql8ECr3+NtuT/YEudk21EpNLL5FVXkJJ/avpMTMkRRPT+ISlVaXESTeFOTdvv8NJJvnSfS
 Tj9e8ly3vgkSMR3guJrPHHtAB0x7FEs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-Ol_wNA74NdivTzbnj43FNA-1; Wed, 22 Sep 2021 11:31:53 -0400
X-MC-Unique: Ol_wNA74NdivTzbnj43FNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so2497271wru.15
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=niltNsvI9idq0hQuV0OgXVpIEHbMhmSWkiU9Lz4s8UA=;
 b=ZKZhRittqn8l7J1Fk3lP0hvSclz7W1V9u8L6RItvKv2u8VCDYeq5eq6l3ESDJHP/p0
 MIDEMno+Lmok+pYymo1RVnh6Mf4t0oC3Jnnx8X79K6JvBTmP8P/RhFoygCDjkLiLpOwH
 4NSug7yo9dCJ7SKva5Jr/pRVDUUS8raiOIwFi83korSszNyaH1oLNmn1ZLaOC4ovTOkD
 KCgqL+j7/kdZu/GXuA7Tbsp1/ES8FzXD0ehdVy1/A0vY2EDCGwHCwT9EjPsC0R46fBqo
 NC4W0rMj9RPv5fha7q/4pRmiCBRCBMM2RC3yqgcaQD3P0Dx3pTa/RYXqUyGoOZD2BwM6
 nU8w==
X-Gm-Message-State: AOAM533GB2y2tr0x1CGew9vF6wmmhcl72TKoyq9EbAJnP4PN08xLq4W6
 CEokuXADQTFEoLVdNVIwabhnXNArO6qe3ITY4uTO1U0w0SdSFZ5N1D6xZL4Tk5Duqm6njT3JTRv
 G4IcU/szFwtmyD0U=
X-Received: by 2002:a05:600c:201:: with SMTP id 1mr11155811wmi.5.1632324711955; 
 Wed, 22 Sep 2021 08:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0kKArYQOVEJGl6vV4jSQeTt9arG9x3xu1VL3kRgUUivzxEzu4GRXyS8tQ5wN0NG658ZslvQ==
X-Received: by 2002:a05:600c:201:: with SMTP id 1mr11155781wmi.5.1632324711652; 
 Wed, 22 Sep 2021 08:31:51 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r26sm514013wmh.35.2021.09.22.08.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:31:51 -0700 (PDT)
Subject: Re: [PATCH v3 29/35] acpi: arm/virt: convert build_iort() to endian
 agnostic build_append_FOO() API
To: Igor Mammedov <imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-30-imammedo@redhat.com>
 <febc8040-ec03-4716-a626-ccdf353f4e32@redhat.com>
 <20210922155440.2bf5ea9f@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1a81ed47-6e60-7f74-2323-1f3d81a34cb1@redhat.com>
Date: Wed, 22 Sep 2021 17:31:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210922155440.2bf5ea9f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, wangxingang5@huawei.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Igor,
On 9/22/21 3:54 PM, Igor Mammedov wrote:
> On Wed, 22 Sep 2021 15:26:49 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
> I'll fix patch up as suggested,
> though there is a question, see below
>
>> On 9/7/21 4:48 PM, Igor Mammedov wrote:
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> v3:
>>>   * practically rewritten, due to conflicts wiht bypass iommu feature
>>>
>>> CC: drjones@redhat.com
>>> CC: peter.maydell@linaro.org
>>> CC: shannon.zhaosl@gmail.com
>>> CC: qemu-arm@nongnu.org
>>> CC: wangxingang5@huawei.com
>>> CC: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  include/hw/acpi/acpi-defs.h |  71 ---------------
>>>  hw/arm/virt-acpi-build.c    | 167 ++++++++++++++++++++----------------
>>>  2 files changed, 91 insertions(+), 147 deletions(-)
>>>
>>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>>> index 195f90caf6..6f2f08a9de 100644
>>> --- a/include/hw/acpi/acpi-defs.h
>>> +++ b/include/hw/acpi/acpi-defs.h
>>> @@ -188,75 +188,4 @@ struct AcpiGenericTimerTable {
>>>  } QEMU_PACKED;
>>>  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
>>>  
>>> -/*
>>> - * IORT node types
>>> - */
>>> -
>>> -#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
>>> -    uint8_t  type;          \
>>> -    uint16_t length;        \
>>> -    uint8_t  revision;      \
>>> -    uint32_t reserved;      \
>>> -    uint32_t mapping_count; \
>>> -    uint32_t mapping_offset;
>>> -
>>> -/* Values for node Type above */
>>> -enum {
>>> -        ACPI_IORT_NODE_ITS_GROUP = 0x00,
>>> -        ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
>>> -        ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
>>> -        ACPI_IORT_NODE_SMMU = 0x03,
>>> -        ACPI_IORT_NODE_SMMU_V3 = 0x04
>>> -};
>>> -
>>> -struct AcpiIortIdMapping {
>>> -    uint32_t input_base;
>>> -    uint32_t id_count;
>>> -    uint32_t output_base;
>>> -    uint32_t output_reference;
>>> -    uint32_t flags;
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiIortIdMapping AcpiIortIdMapping;
>>> -
>>> -struct AcpiIortMemoryAccess {
>>> -    uint32_t cache_coherency;
>>> -    uint8_t  hints;
>>> -    uint16_t reserved;
>>> -    uint8_t  memory_flags;
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
>>> -
>>> -struct AcpiIortItsGroup {
>>> -    ACPI_IORT_NODE_HEADER_DEF
>>> -    uint32_t its_count;
>>> -    uint32_t identifiers[];
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>> -
>>> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
>>> -
>>> -struct AcpiIortSmmu3 {
>>> -    ACPI_IORT_NODE_HEADER_DEF
>>> -    uint64_t base_address;
>>> -    uint32_t flags;
>>> -    uint32_t reserved2;
>>> -    uint64_t vatos_address;
>>> -    uint32_t model;
>>> -    uint32_t event_gsiv;
>>> -    uint32_t pri_gsiv;
>>> -    uint32_t gerr_gsiv;
>>> -    uint32_t sync_gsiv;
>>> -    AcpiIortIdMapping id_mapping_array[];
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
>>> -
>>> -struct AcpiIortRC {
>>> -    ACPI_IORT_NODE_HEADER_DEF
>>> -    AcpiIortMemoryAccess memory_properties;
>>> -    uint32_t ats_attribute;
>>> -    uint32_t pci_segment_number;
>>> -    AcpiIortIdMapping id_mapping_array[];
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiIortRC AcpiIortRC;
>>> -
>>>  #endif
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index bceb1b3b7e..4c682e7b09 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -240,6 +240,28 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>>>  }
>>>  #endif
>>>  
>>> +#define ID_MAPPING_ENTRY_SIZE 20
>>> +#define SMMU_V3_ENTRY_SIZE 60
>>> +#define ROOT_COMPLEX_ENTRY_SIZE 32
>>> +#define IORT_NODE_OFFSET 48
>>> +
>>> +static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
>>> +                                  uint32_t id_count, uint32_t out_ref)
>>> +{
>>> +    /* Identity RID mapping covering the whole input RID range */
>>> +    build_append_int_noprefix(table_data, input_base, 4); /* Input base */
>>> +    build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
>>> +    build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>>> +    build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
>>> +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
>>> +}
>>> +
>>> +struct AcpiIortIdMapping {
>>> +    uint32_t input_base;
>>> +    uint32_t id_count;
>>> +};
>>> +typedef struct AcpiIortIdMapping AcpiIortIdMapping;
>>> +
>>>  /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
>>>  static int
>>>  iort_host_bridges(Object *obj, void *opaque)
>>> @@ -281,18 +303,17 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>>>  static void
>>>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>  {
>>> -    int i, nb_nodes, rc_mapping_count;
>>> -    AcpiIortIdMapping *idmap;
>>> -    AcpiIortItsGroup *its;
>>> -    AcpiIortSmmu3 *smmu;
>>> -    AcpiIortRC *rc;
>>> +    int i, rc_mapping_count;
>>>      const uint32_t iort_node_offset = 48;  
>> can be replaced by IORT_NODE_OFFSET now
>>>      size_t node_size, smmu_offset = 0;
>>> +    AcpiIortIdMapping *idmap;
>>>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>>>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>>>  
>>>      AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
>>>                          .oem_table_id = vms->oem_table_id };
>>> +    /* Table 2 The IORT */
>>> +    acpi_table_begin(&table, table_data);  
>> nit: you could have done this move in previous patch.
>>>  
>>>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>>  
>>> @@ -325,106 +346,100 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>              g_array_append_val(its_idmaps, next_range);
>>>          }
>>>  
>>> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
>>>          rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
>>> +        /* Number of IORT Nodes */
>>> +        build_append_int_noprefix(table_data, 3 /* RC, ITS, SMMUv3 */, 4);
>>>      } else {
>>> -        nb_nodes = 2; /* RC, ITS */
>>>          rc_mapping_count = 1;
>>> +        /* Number of IORT Nodes */
>>> +        build_append_int_noprefix(table_data, 2 /* RC, ITS */, 4);  
>> I think I would prefer to keep the nb_nodes variable and do the
>> corresponding build_append_int_noprefix only once. There may be
>> additional nodes added with increased complexity and potential extra
>> duplication.
>>>      }
>>>  
>>> -    /* Table 2 The IORT */
>>> -    acpi_table_begin(&table, table_data);
>>> -    /* Number of IORT Nodes */
>>> -    build_append_int_noprefix(table_data, nb_nodes, 4);
>>>      /* Offset to Array of IORT Nodes */
>>> -    build_append_int_noprefix(table_data, iort_node_offset, 4);
>>> +    build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>>>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>>  
>>> -    /* ITS group node */
>>> -    node_size =  sizeof(*its) + sizeof(uint32_t);
>>> -    its = acpi_data_push(table_data, node_size);
>>> -
>>> -    its->type = ACPI_IORT_NODE_ITS_GROUP;
>>> -    its->length = cpu_to_le16(node_size);
>>> -    its->its_count = cpu_to_le32(1);
>>> -    its->identifiers[0] = 0; /* MADT translation_id */
>>> +    /* 3.1.1.3 ITS group node */
>>> +    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>>> +    node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
>>> +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
>>> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
>>> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>> +    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
>>> +    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
>>> +    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
>>> +    /* GIC ITS Identifier Array */
>>> +    build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>>>  
>>>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>>>  
>>> -        /* SMMUv3 node */
>>> -        smmu_offset = iort_node_offset + node_size;
>>> -        node_size = sizeof(*smmu) + sizeof(*idmap);
>>> -        smmu = acpi_data_push(table_data, node_size);
>>> -
>>> -        smmu->type = ACPI_IORT_NODE_SMMU_V3;
>>> -        smmu->length = cpu_to_le16(node_size);
>>> -        smmu->mapping_count = cpu_to_le32(1);
>>> -        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>> -        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>>> -        smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
>>> -        smmu->event_gsiv = cpu_to_le32(irq);
>>> -        smmu->pri_gsiv = cpu_to_le32(irq + 1);
>>> -        smmu->sync_gsiv = cpu_to_le32(irq + 2);
>>> -        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
>>> -
>>> -        /* Identity RID mapping covering the whole input RID range */
>>> -        idmap = &smmu->id_mapping_array[0];
>>> -        idmap->input_base = 0;
>>> -        idmap->id_count = cpu_to_le32(0xFFFF);
>>> -        idmap->output_base = 0;
>>> -        /* output IORT node is the ITS group node (the first node) */
>>> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
>>> +        smmu_offset = table_data->len - table.table_offset;
>>> +        /* 3.1.1.2 SMMUv3 */
>>> +        build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>>> +        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
>>> +        build_append_int_noprefix(table_data, node_size, 2); /* Length */
>>> +        build_append_int_noprefix(table_data, 0, 1); /* Revision */
>>> +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>> +        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
>>> +        /* Reference to ID Array */
>>> +        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>>> +        /* Base address */
>>> +        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>>> +        /* Flags */
>>> +        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
>>> +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>> +        build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
>>> +        /* Model */
>>> +        build_append_int_noprefix(table_data, 0 /* Generic SMMU-v3 */, 4);
>>> +        build_append_int_noprefix(table_data, irq, 4); /* Event */
>>> +        build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
>>> +        build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
>>> +        build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */  
>> Please keep that comment. I think it helps
>>        /* output IORT node is the ITS group node (the first node) */
>>> +
>>> +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>>>      }
>>>  
>>> -    /* Root Complex Node */
>>> -    node_size = sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
>>> -    rc = acpi_data_push(table_data, node_size);
>>> -
>>> -    rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>>> -    rc->length = cpu_to_le16(node_size);
>>> -    rc->mapping_count = cpu_to_le32(rc_mapping_count);
>>> -    rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>>> -
>>> +    /* Table 16 Root Complex Node */
>>> +    build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /* Type */
>>> +    node_size =  ROOT_COMPLEX_ENTRY_SIZE +
>>> +                 ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
>>> +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
>>> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
>>> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>> +    /* Number of ID mappings */
>>> +    build_append_int_noprefix(table_data, rc_mapping_count, 4);
>>> +    /* Reference to ID Array */
>>> +    build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
>>>      /* fully coherent device */  
>> this comment should become /* Memory access properties */ for homogenity
>>> -    rc->memory_properties.cache_coherency = cpu_to_le32(1);
>>> -    rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>>> -    rc->pci_segment_number = 0; /* MCFG pci_segment */
>>> -
>>> +    build_append_int_noprefix(table_data,
>>> +        1 | /* CCA: Cache Coherent Attribute, The device is fully coherent */
>>> +        (3ULL << 7 * 8) /* MAF: Memory Access Flags, CCA = CPM = DCAS = 1 */,
>>> +        8);  
>> I think we would gain in readability if we were to split into multiple
>>
>> build_append_int_noprefix according to Table 13 fields
> in spec I've got it's "Table 14: Memory access properties"
> Do you have any preference which spec/rev/ we should use for IORT?

I looked at Document number: ARM DEN 0049B
as said in the comment Document number: ARM DEN 0049B, October 2015
Found
https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjD3q_E0JLzAhVtgP0HHRuxDtYQFnoECAIQAQ&url=https%3A%2F%2Fdocumentation-service.arm.com%2Fstatic%2F5f8eb168f86e16515cdbe414%3Ftoken%3D&usg=AOvVaw1tQQk9lJwojw_hM6ZJUbat

Table 13 Memory access properties Thanks Eric

>
>>> +    build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
>>> +    /* MCFG pci_segment */
>>> +    build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
>>> +
>>> +    /* Output Reference */
>>>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>>          AcpiIortIdMapping *range;
>>>  
>>>          /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
>>>          for (i = 0; i < smmu_idmaps->len; i++) {
>>> -            idmap = &rc->id_mapping_array[i];
>>>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>>> -
>>> -            idmap->input_base = cpu_to_le32(range->input_base);
>>> -            idmap->id_count = cpu_to_le32(range->id_count);
>>> -            idmap->output_base = cpu_to_le32(range->input_base);
>>> -            /* output IORT node is the smmuv3 node */
>>> -            idmap->output_reference = cpu_to_le32(smmu_offset);  
>> please keep the original comment
>>> +            build_iort_id_mapping(table_data, range->input_base,
>>> +                                  range->id_count, smmu_offset);
>>>          }
>>>  
>>>          /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
>>>          for (i = 0; i < its_idmaps->len; i++) {
>>> -            idmap = &rc->id_mapping_array[smmu_idmaps->len + i];
>>>              range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>>> -
>>> -            idmap->input_base = cpu_to_le32(range->input_base);
>>> -            idmap->id_count = cpu_to_le32(range->id_count);
>>> -            idmap->output_base = cpu_to_le32(range->input_base);
>>> -            /* output IORT node is the ITS group node (the first node) */
>>> -            idmap->output_reference = cpu_to_le32(iort_node_offset);  
>> same, at least it helps me ;-)
>>> +            build_iort_id_mapping(table_data, range->input_base,
>>> +                                  range->id_count, iort_node_offset);
>>>          }
>>>      } else {
>>> -        /* Identity RID mapping covering the whole input RID range */
>>> -        idmap = &rc->id_mapping_array[0];
>>> -        idmap->input_base = cpu_to_le32(0);
>>> -        idmap->id_count = cpu_to_le32(0xFFFF);
>>> -        idmap->output_base = cpu_to_le32(0);
>>>          /* output IORT node is the ITS group node (the first node) */
>>> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
>>> +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>>>      }
>>>  
>>>      acpi_table_end(linker, &table);  
>> Thanks
>>
>> Eric
>>


