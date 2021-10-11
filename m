Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A1429237
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:39:46 +0200 (CEST)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwSv-0004Hz-ER
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZwRa-0003Tn-CM
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZwRW-0002Co-Hm
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633963096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0ptSPALtC9JFB0bevsnnbdhOUgczz7Po1AotF9xbzs=;
 b=NLK5h3Wz2Kpv6scpGpHtPP5fFOcWnMeWlL2M3VfCh6hhn5fFNX1BiSky0yRAbZJpyGTxSE
 617kJ/PKY7Uemh19w0sE7r9E8UUAR3gQZ2GNiAD05GnGMr1Mm5PbIZ0/IBW8ZzYtl2Q05d
 Vv3KMckVY9GkQZ/HNouMVm+bv8KBCaE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-xI6nRQVmO2WG-SC5fm6iFw-1; Mon, 11 Oct 2021 10:38:15 -0400
X-MC-Unique: xI6nRQVmO2WG-SC5fm6iFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u24-20020aa7db98000000b003db57b1688aso10704257edt.6
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 07:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0ptSPALtC9JFB0bevsnnbdhOUgczz7Po1AotF9xbzs=;
 b=zVOShkR2Y8JZCj8QAlUBxvpNFJb0sCYRf4OHpAszAsF+8r00kX1GSrnoCcYBPBgxxJ
 5O4As8B0dq9NJPhzlPdEeCDdArb5vkxeWp72LPJbwcQ+9iVjNbxdBk1Ggaid9xtN2PZj
 DRLLDFLiLEp0nfFRDWHrISmsHhSaVDQ4GAqC/qru4uRzBqxkFLmmei6wY0/hx2pBXZAf
 OLks2wFu8TxKQv88KESAmbUWH3Ftx0yWinM6js9usAIELWwTXquCe2qYM4R9ZelPjEsE
 dlSIS70CRtb0EZ32oAy8VFA2Zk4nB5jE5AzmdxgnQ1rAn1lcXbEc72bj8J5bbKbv+exq
 pzhA==
X-Gm-Message-State: AOAM530uSzRg1ZfEhdw/Mvy9TyvgmPijKBYLpqmhw28pkiR+Mxd97et5
 JQW4aKUE3eYbhaDF8dBLaSFPuFNYp317LEM42WOCIDIa6SAmLpNzqGnIf6dLlVF4xLg2Tak5Zs4
 AMKioeGuUXsHCIDY=
X-Received: by 2002:a17:907:20d0:: with SMTP id
 qq16mr22063452ejb.168.1633963094360; 
 Mon, 11 Oct 2021 07:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2QhM2BBBdaXHKbYIhnhSWOCRhsSf+cGwh2O49RLDERwFH4xs1QSJ2zf+ElWXMSc9ZpN9nrg==
X-Received: by 2002:a17:907:20d0:: with SMTP id
 qq16mr22063402ejb.168.1633963093993; 
 Mon, 11 Oct 2021 07:38:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p6sm4311163edi.18.2021.10.11.07.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:38:13 -0700 (PDT)
Date: Mon, 11 Oct 2021 16:38:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/3] hw/arm/virt-acpi-build: IORT upgrade up to
 revision E.b
Message-ID: <20211011163812.26b76bae@redhat.com>
In-Reply-To: <20211005083805.493456-3-eric.auger@redhat.com>
References: <20211005083805.493456-1-eric.auger@redhat.com>
 <20211005083805.493456-3-eric.auger@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 philmd@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 Oct 2021 10:38:04 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Upgrade the IORT table from B to E.b specification
> revision (ARM DEN 0049E.b).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
with nit below fixed:
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> v1 -> v2:
> - Fix Revision value for ITS node and SMMUv3 node
> - increment an identifier
> ---
>  hw/arm/virt-acpi-build.c | 48 ++++++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 257d0fee17..789bac3134 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -241,19 +241,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  #endif
>  
>  #define ID_MAPPING_ENTRY_SIZE 20
> -#define SMMU_V3_ENTRY_SIZE 60
> -#define ROOT_COMPLEX_ENTRY_SIZE 32
> +#define SMMU_V3_ENTRY_SIZE 68
> +#define ROOT_COMPLEX_ENTRY_SIZE 36
>  #define IORT_NODE_OFFSET 48
>  
>  static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
>                                    uint32_t id_count, uint32_t out_ref)
>  {
> -    /* Identity RID mapping covering the whole input RID range */
> +    /* Table 4 ID mapping format */
>      build_append_int_noprefix(table_data, input_base, 4); /* Input base */
>      build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
>      build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>      build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
> -    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> +    /* Flags */
> +    build_append_int_noprefix(table_data, 0 /* Single mapping */, 4);
>  }
>  
>  struct AcpiIortIdMapping {
> @@ -298,7 +299,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> - * Document number: ARM DEN 0049B, October 2015
> + * Document number: ARM DEN 0049E, Feb 2021
>   */
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -307,10 +308,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const uint32_t iort_node_offset = IORT_NODE_OFFSET;
>      size_t node_size, smmu_offset = 0;
>      AcpiIortIdMapping *idmap;
> +    uint32_t id = 0;

It's probably worth mentioning in commit message that
IDs are generated in sequential order, to make sure that
different nodes unique but otherwise IDs are not referenced/used.

If we were to actually use IDs, I'd prefer explicit naming for
static nodes (i.e. something like SMMUv3_ID = #).



>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>  
> -    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
> +    AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>      /* Table 2 The IORT */
>      acpi_table_begin(&table, table_data);
> @@ -358,12 +360,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>  
> -    /* 3.1.1.3 ITS group node */
> +    /* Table 12 ITS Group Format */
>      build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>      node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
>      build_append_int_noprefix(table_data, node_size, 2); /* Length */
> -    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> -    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 1, 1); /* Revision */
> +    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>      build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
>      build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
>      build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> @@ -374,19 +376,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>  
>          smmu_offset = table_data->len - table.table_offset;
> -        /* 3.1.1.2 SMMUv3 */
> +        /* Table 9 SMMUv3 Format */
>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>          node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
> -        build_append_int_noprefix(table_data, 0, 1); /* Revision */
> -        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        build_append_int_noprefix(table_data, 4, 1); /* Revision */
> +        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>          build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
>          /* Reference to ID Array */
>          build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>          /* Base address */
>          build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>          /* Flags */
> -        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
> +        build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
>          build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>          build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
>          /* Model */
> @@ -395,35 +397,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
>          build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
>          build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
> +        build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
> +        /* DeviceID mapping index (ignored since interrupts are GSIV based) */
> +        build_append_int_noprefix(table_data, 0, 4);
>  
>          /* output IORT node is the ITS group node (the first node) */
>          build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>      }
>  
> -    /* Table 16 Root Complex Node */
> +    /* Table 17 Root Complex Node */
>      build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /* Type */
>      node_size =  ROOT_COMPLEX_ENTRY_SIZE +
>                   ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
>      build_append_int_noprefix(table_data, node_size, 2); /* Length */
> -    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> -    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 3, 1); /* Revision */
> +    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>      /* Number of ID mappings */
>      build_append_int_noprefix(table_data, rc_mapping_count, 4);
>      /* Reference to ID Array */
>      build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
>  
> -    /* Table 13 Memory access properties */
> +    /* Table 14 Memory access properties */
>      /* CCA: Cache Coherent Attribute */
>      build_append_int_noprefix(table_data, 1 /* fully coherent */, 4);
>      build_append_int_noprefix(table_data, 0, 1); /* AH: Note Allocation Hints */
>      build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> -    /* MAF: Note Memory Access Flags */
> -    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DCAS = 1 */, 1);
> +    /* Table 15 Memory Access Flags */
> +    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DACS = 1 */, 1);
>  
>      build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
>      /* MCFG pci_segment */
>      build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
>  
> +    /* Memory address size limit */
> +    build_append_int_noprefix(table_data, 64, 1);
> +
> +    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
> +
>      /* Output Reference */
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          AcpiIortIdMapping *range;


