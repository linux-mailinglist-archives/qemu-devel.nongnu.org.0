Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F7414B38
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:57:01 +0200 (CEST)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2k8-0004Ry-3g
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT2i1-0003Rp-Sz
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT2hy-0000Fi-20
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632318885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MHh1CG0eFrD6r2vENJRe3lvCu4TN5BdJuDhm2v5rao=;
 b=APdXy8uXdLimNsnpsUUyES+tX7f3PgDYiNsBtnNxuJ9B5a9IHpl1ONVoZL8KLPI2buvBvb
 6So/1P3C3vAjEEae1pCWcWAc/+kKavcbXLrj/mSgXOcH9IGd+Ow2IiJpTyvJKRa6mCRQ+5
 juXxTTn9Mpvmoaor5k40UiwclftZ8c8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-a2o1j5MmP8iEztUo8FOl8g-1; Wed, 22 Sep 2021 09:54:43 -0400
X-MC-Unique: a2o1j5MmP8iEztUo8FOl8g-1
Received: by mail-ed1-f71.google.com with SMTP id
 h15-20020aa7de0f000000b003d02f9592d6so3114063edv.17
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xETEb0SCLK+fSfX5uMcZ+LhzAdJZ6JlkPbrvT/sEWsM=;
 b=QJdc+tuyyJqfboEZ4mc6P1PxqfHEIU4jZRRpE7JSepSpKLrKzAA27u6NNWWZlf+LIG
 2qsU8tul2WTDSwTudeGO3/lGPwmQwQ47eky7xCEFYweYqQB/DeKjP1wlQtfjMkcwxe6v
 o1neuhBBjRrKrURDAY52qhZotDZa6YKopgTtOJDRpmWZX67O4wcAt8K8j88LAD/Vtxgk
 888otLNKUo6q+vJCFK9+QdjdM9LN+TUUhykOfeJDHvcKQT2JGidWOn52x8lVSucGlr2g
 zlb/C+gnMrqsbfeHYdVjlA6GgV+pfXgG5EuOVMvPiqyN7dCKBz31GJpUuhP3EvY2QkcD
 HNlg==
X-Gm-Message-State: AOAM533Xz5bFw2HB2GmcEK+3V48QTWNdN6GGlhZE+uEocCCo0ecAtjT5
 byIi+tUxu8+HRgTQZG37wrKmydO+NRAXkaM8WesMqyUo6G67EdzHhGGVpJkWVF3Y48kuxKrpd2/
 DXYVeih51iT8IvqE=
X-Received: by 2002:a17:907:6297:: with SMTP id
 nd23mr42865505ejc.62.1632318882709; 
 Wed, 22 Sep 2021 06:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0aet3drl0jTvky2RyIVKAvek0RMsn0T+et5rCyf3ntyMRosxdtK29GKv0OoN1xO/0MKsnAg==
X-Received: by 2002:a17:907:6297:: with SMTP id
 nd23mr42865473ejc.62.1632318882478; 
 Wed, 22 Sep 2021 06:54:42 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id dn28sm1255796edb.76.2021.09.22.06.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 06:54:42 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:54:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 29/35] acpi: arm/virt: convert build_iort() to endian
 agnostic build_append_FOO() API
Message-ID: <20210922155440.2bf5ea9f@redhat.com>
In-Reply-To: <febc8040-ec03-4716-a626-ccdf353f4e32@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-30-imammedo@redhat.com>
 <febc8040-ec03-4716-a626-ccdf353f4e32@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, wangxingang5@huawei.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 15:26:49 +0200
Eric Auger <eric.auger@redhat.com> wrote:

I'll fix patch up as suggested,
though there is a question, see below

> On 9/7/21 4:48 PM, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   * practically rewritten, due to conflicts wiht bypass iommu feature
> >
> > CC: drjones@redhat.com
> > CC: peter.maydell@linaro.org
> > CC: shannon.zhaosl@gmail.com
> > CC: qemu-arm@nongnu.org
> > CC: wangxingang5@huawei.com
> > CC: Eric Auger <eric.auger@redhat.com>
> > ---
> >  include/hw/acpi/acpi-defs.h |  71 ---------------
> >  hw/arm/virt-acpi-build.c    | 167 ++++++++++++++++++++----------------
> >  2 files changed, 91 insertions(+), 147 deletions(-)
> >
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 195f90caf6..6f2f08a9de 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -188,75 +188,4 @@ struct AcpiGenericTimerTable {
> >  } QEMU_PACKED;
> >  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
> > =20
> > -/*
> > - * IORT node types
> > - */
> > -
> > -#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
> > -    uint8_t  type;          \
> > -    uint16_t length;        \
> > -    uint8_t  revision;      \
> > -    uint32_t reserved;      \
> > -    uint32_t mapping_count; \
> > -    uint32_t mapping_offset;
> > -
> > -/* Values for node Type above */
> > -enum {
> > -        ACPI_IORT_NODE_ITS_GROUP =3D 0x00,
> > -        ACPI_IORT_NODE_NAMED_COMPONENT =3D 0x01,
> > -        ACPI_IORT_NODE_PCI_ROOT_COMPLEX =3D 0x02,
> > -        ACPI_IORT_NODE_SMMU =3D 0x03,
> > -        ACPI_IORT_NODE_SMMU_V3 =3D 0x04
> > -};
> > -
> > -struct AcpiIortIdMapping {
> > -    uint32_t input_base;
> > -    uint32_t id_count;
> > -    uint32_t output_base;
> > -    uint32_t output_reference;
> > -    uint32_t flags;
> > -} QEMU_PACKED;
> > -typedef struct AcpiIortIdMapping AcpiIortIdMapping;
> > -
> > -struct AcpiIortMemoryAccess {
> > -    uint32_t cache_coherency;
> > -    uint8_t  hints;
> > -    uint16_t reserved;
> > -    uint8_t  memory_flags;
> > -} QEMU_PACKED;
> > -typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
> > -
> > -struct AcpiIortItsGroup {
> > -    ACPI_IORT_NODE_HEADER_DEF
> > -    uint32_t its_count;
> > -    uint32_t identifiers[];
> > -} QEMU_PACKED;
> > -typedef struct AcpiIortItsGroup AcpiIortItsGroup;
> > -
> > -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
> > -
> > -struct AcpiIortSmmu3 {
> > -    ACPI_IORT_NODE_HEADER_DEF
> > -    uint64_t base_address;
> > -    uint32_t flags;
> > -    uint32_t reserved2;
> > -    uint64_t vatos_address;
> > -    uint32_t model;
> > -    uint32_t event_gsiv;
> > -    uint32_t pri_gsiv;
> > -    uint32_t gerr_gsiv;
> > -    uint32_t sync_gsiv;
> > -    AcpiIortIdMapping id_mapping_array[];
> > -} QEMU_PACKED;
> > -typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> > -
> > -struct AcpiIortRC {
> > -    ACPI_IORT_NODE_HEADER_DEF
> > -    AcpiIortMemoryAccess memory_properties;
> > -    uint32_t ats_attribute;
> > -    uint32_t pci_segment_number;
> > -    AcpiIortIdMapping id_mapping_array[];
> > -} QEMU_PACKED;
> > -typedef struct AcpiIortRC AcpiIortRC;
> > -
> >  #endif
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index bceb1b3b7e..4c682e7b09 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -240,6 +240,28 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMach=
ineState *vms)
> >  }
> >  #endif
> > =20
> > +#define ID_MAPPING_ENTRY_SIZE 20
> > +#define SMMU_V3_ENTRY_SIZE 60
> > +#define ROOT_COMPLEX_ENTRY_SIZE 32
> > +#define IORT_NODE_OFFSET 48
> > +
> > +static void build_iort_id_mapping(GArray *table_data, uint32_t input_b=
ase,
> > +                                  uint32_t id_count, uint32_t out_ref)
> > +{
> > +    /* Identity RID mapping covering the whole input RID range */
> > +    build_append_int_noprefix(table_data, input_base, 4); /* Input bas=
e */
> > +    build_append_int_noprefix(table_data, id_count, 4); /* Number of I=
Ds */
> > +    build_append_int_noprefix(table_data, input_base, 4); /* Output ba=
se */
> > +    build_append_int_noprefix(table_data, out_ref, 4); /* Output Refer=
ence */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> > +}
> > +
> > +struct AcpiIortIdMapping {
> > +    uint32_t input_base;
> > +    uint32_t id_count;
> > +};
> > +typedef struct AcpiIortIdMapping AcpiIortIdMapping;
> > +
> >  /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
> >  static int
> >  iort_host_bridges(Object *obj, void *opaque)
> > @@ -281,18 +303,17 @@ static int iort_idmap_compare(gconstpointer a, gc=
onstpointer b)
> >  static void
> >  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *v=
ms)
> >  {
> > -    int i, nb_nodes, rc_mapping_count;
> > -    AcpiIortIdMapping *idmap;
> > -    AcpiIortItsGroup *its;
> > -    AcpiIortSmmu3 *smmu;
> > -    AcpiIortRC *rc;
> > +    int i, rc_mapping_count;
> >      const uint32_t iort_node_offset =3D 48; =20
> can be replaced by IORT_NODE_OFFSET now
> >      size_t node_size, smmu_offset =3D 0;
> > +    AcpiIortIdMapping *idmap;
> >      GArray *smmu_idmaps =3D g_array_new(false, true, sizeof(AcpiIortId=
Mapping));
> >      GArray *its_idmaps =3D g_array_new(false, true, sizeof(AcpiIortIdM=
apping));
> > =20
> >      AcpiTable table =3D { .sig =3D "IORT", .rev =3D 0, .oem_id =3D vms=
->oem_id,
> >                          .oem_table_id =3D vms->oem_table_id };
> > +    /* Table 2 The IORT */
> > +    acpi_table_begin(&table, table_data); =20
> nit: you could have done this move in previous patch.
> > =20
> >      if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3) {
> > =20
> > @@ -325,106 +346,100 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
> >              g_array_append_val(its_idmaps, next_range);
> >          }
> > =20
> > -        nb_nodes =3D 3; /* RC, ITS, SMMUv3 */
> >          rc_mapping_count =3D smmu_idmaps->len + its_idmaps->len;
> > +        /* Number of IORT Nodes */
> > +        build_append_int_noprefix(table_data, 3 /* RC, ITS, SMMUv3 */,=
 4);
> >      } else {
> > -        nb_nodes =3D 2; /* RC, ITS */
> >          rc_mapping_count =3D 1;
> > +        /* Number of IORT Nodes */
> > +        build_append_int_noprefix(table_data, 2 /* RC, ITS */, 4); =20
> I think I would prefer to keep the nb_nodes variable and do the
> corresponding build_append_int_noprefix only once. There may be
> additional nodes added with increased complexity and potential extra
> duplication.
> >      }
> > =20
> > -    /* Table 2 The IORT */
> > -    acpi_table_begin(&table, table_data);
> > -    /* Number of IORT Nodes */
> > -    build_append_int_noprefix(table_data, nb_nodes, 4);
> >      /* Offset to Array of IORT Nodes */
> > -    build_append_int_noprefix(table_data, iort_node_offset, 4);
> > +    build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
> >      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> > =20
> > -    /* ITS group node */
> > -    node_size =3D  sizeof(*its) + sizeof(uint32_t);
> > -    its =3D acpi_data_push(table_data, node_size);
> > -
> > -    its->type =3D ACPI_IORT_NODE_ITS_GROUP;
> > -    its->length =3D cpu_to_le16(node_size);
> > -    its->its_count =3D cpu_to_le32(1);
> > -    its->identifiers[0] =3D 0; /* MADT translation_id */
> > +    /* 3.1.1.3 ITS group node */
> > +    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Ty=
pe */
> > +    node_size =3D  20 /* fixed header size */ + 4 /* 1 GIC ITS Identif=
ier */;
> > +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> > +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappi=
ngs */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Ar=
ray */
> > +    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> > +    /* GIC ITS Identifier Array */
> > +    build_append_int_noprefix(table_data, 0 /* MADT translation_id */,=
 4);
> > =20
> >      if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3) {
> >          int irq =3D  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> > =20
> > -        /* SMMUv3 node */
> > -        smmu_offset =3D iort_node_offset + node_size;
> > -        node_size =3D sizeof(*smmu) + sizeof(*idmap);
> > -        smmu =3D acpi_data_push(table_data, node_size);
> > -
> > -        smmu->type =3D ACPI_IORT_NODE_SMMU_V3;
> > -        smmu->length =3D cpu_to_le16(node_size);
> > -        smmu->mapping_count =3D cpu_to_le32(1);
> > -        smmu->mapping_offset =3D cpu_to_le32(sizeof(*smmu));
> > -        smmu->base_address =3D cpu_to_le64(vms->memmap[VIRT_SMMU].base=
);
> > -        smmu->flags =3D cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE)=
;
> > -        smmu->event_gsiv =3D cpu_to_le32(irq);
> > -        smmu->pri_gsiv =3D cpu_to_le32(irq + 1);
> > -        smmu->sync_gsiv =3D cpu_to_le32(irq + 2);
> > -        smmu->gerr_gsiv =3D cpu_to_le32(irq + 3);
> > -
> > -        /* Identity RID mapping covering the whole input RID range */
> > -        idmap =3D &smmu->id_mapping_array[0];
> > -        idmap->input_base =3D 0;
> > -        idmap->id_count =3D cpu_to_le32(0xFFFF);
> > -        idmap->output_base =3D 0;
> > -        /* output IORT node is the ITS group node (the first node) */
> > -        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
> > +        smmu_offset =3D table_data->len - table.table_offset;
> > +        /* 3.1.1.2 SMMUv3 */
> > +        build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* T=
ype */
> > +        node_size =3D  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> > +        build_append_int_noprefix(table_data, node_size, 2); /* Length=
 */
> > +        build_append_int_noprefix(table_data, 0, 1); /* Revision */
> > +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> > +        build_append_int_noprefix(table_data, 1, 4); /* Number of ID m=
appings */
> > +        /* Reference to ID Array */
> > +        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
> > +        /* Base address */
> > +        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].b=
ase, 8);
> > +        /* Flags */
> > +        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote=
 */, 4);
> > +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> > +        build_append_int_noprefix(table_data, 0, 8); /* VATOS address =
*/
> > +        /* Model */
> > +        build_append_int_noprefix(table_data, 0 /* Generic SMMU-v3 */,=
 4);
> > +        build_append_int_noprefix(table_data, irq, 4); /* Event */
> > +        build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
> > +        build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
> > +        build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */ =
=20
> Please keep that comment. I think it helps
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* output IORT node is the ITS group=
 node (the first node) */
> > +
> > +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET)=
;
> >      }
> > =20
> > -    /* Root Complex Node */
> > -    node_size =3D sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
> > -    rc =3D acpi_data_push(table_data, node_size);
> > -
> > -    rc->type =3D ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> > -    rc->length =3D cpu_to_le16(node_size);
> > -    rc->mapping_count =3D cpu_to_le32(rc_mapping_count);
> > -    rc->mapping_offset =3D cpu_to_le32(sizeof(*rc));
> > -
> > +    /* Table 16 Root Complex Node */
> > +    build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /*=
 Type */
> > +    node_size =3D  ROOT_COMPLEX_ENTRY_SIZE +
> > +                 ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
> > +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> > +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> > +    /* Number of ID mappings */
> > +    build_append_int_noprefix(table_data, rc_mapping_count, 4);
> > +    /* Reference to ID Array */
> > +    build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
> >      /* fully coherent device */ =20
> this comment should become /* Memory access properties */ for homogenity
> > -    rc->memory_properties.cache_coherency =3D cpu_to_le32(1);
> > -    rc->memory_properties.memory_flags =3D 0x3; /* CCA =3D CPM =3D DCA=
S =3D 1 */
> > -    rc->pci_segment_number =3D 0; /* MCFG pci_segment */
> > -
> > +    build_append_int_noprefix(table_data,
> > +        1 | /* CCA: Cache Coherent Attribute, The device is fully cohe=
rent */
> > +        (3ULL << 7 * 8) /* MAF: Memory Access Flags, CCA =3D CPM =3D D=
CAS =3D 1 */,
> > +        8); =20
> I think we would gain in readability if we were to split into multiple
>=20
> build_append_int_noprefix according to Table 13 fields

in spec I've got it's "Table 14: Memory access properties"
Do you have any preference which spec/rev/ we should use for IORT?

>=20
> > +    build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
> > +    /* MCFG pci_segment */
> > +    build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number=
 */
> > +
> > +    /* Output Reference */
> >      if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3) {
> >          AcpiIortIdMapping *range;
> > =20
> >          /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS=
 */
> >          for (i =3D 0; i < smmu_idmaps->len; i++) {
> > -            idmap =3D &rc->id_mapping_array[i];
> >              range =3D &g_array_index(smmu_idmaps, AcpiIortIdMapping, i=
);
> > -
> > -            idmap->input_base =3D cpu_to_le32(range->input_base);
> > -            idmap->id_count =3D cpu_to_le32(range->id_count);
> > -            idmap->output_base =3D cpu_to_le32(range->input_base);
> > -            /* output IORT node is the smmuv3 node */
> > -            idmap->output_reference =3D cpu_to_le32(smmu_offset); =20
> please keep the original comment
> > +            build_iort_id_mapping(table_data, range->input_base,
> > +                                  range->id_count, smmu_offset);
> >          }
> > =20
> >          /* bypassed RIDs connect to ITS group node directly: RC -> ITS=
 */
> >          for (i =3D 0; i < its_idmaps->len; i++) {
> > -            idmap =3D &rc->id_mapping_array[smmu_idmaps->len + i];
> >              range =3D &g_array_index(its_idmaps, AcpiIortIdMapping, i)=
;
> > -
> > -            idmap->input_base =3D cpu_to_le32(range->input_base);
> > -            idmap->id_count =3D cpu_to_le32(range->id_count);
> > -            idmap->output_base =3D cpu_to_le32(range->input_base);
> > -            /* output IORT node is the ITS group node (the first node)=
 */
> > -            idmap->output_reference =3D cpu_to_le32(iort_node_offset);=
 =20
> same, at least it helps me ;-)
> > +            build_iort_id_mapping(table_data, range->input_base,
> > +                                  range->id_count, iort_node_offset);
> >          }
> >      } else {
> > -        /* Identity RID mapping covering the whole input RID range */
> > -        idmap =3D &rc->id_mapping_array[0];
> > -        idmap->input_base =3D cpu_to_le32(0);
> > -        idmap->id_count =3D cpu_to_le32(0xFFFF);
> > -        idmap->output_base =3D cpu_to_le32(0);
> >          /* output IORT node is the ITS group node (the first node) */
> > -        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
> > +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET)=
;
> >      }
> > =20
> >      acpi_table_end(linker, &table); =20
> Thanks
>=20
> Eric
>=20


