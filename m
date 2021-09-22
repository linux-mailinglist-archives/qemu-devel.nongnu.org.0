Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A14145C5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 12:09:35 +0200 (CEST)
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSzC0-0008HE-8V
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 06:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSz8y-0006hV-El
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSz8w-0007Wb-7j
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632305181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdUDdeZwlpDzYDdWp8a4SmLoRap7yiqEqxILlUjaGPg=;
 b=BMNB9pCKzqpbG+RbVRZgJ8TpFCXmd2khyaRTaWnjg0q/0eMC3+IsIejJtoQZiWLcW1QFnv
 Phs6lmOvMBuRngtW7WikVOKJOnN+Dg8ssWy3SoBjTlIY4n0lYy3L0UrPv960loRVrvA4fH
 wBmQ9M+TR6aBe4g8nOrhmF0YC17+rBA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-gKpb0JWbNrSG-H_LJksC2w-1; Wed, 22 Sep 2021 06:06:20 -0400
X-MC-Unique: gKpb0JWbNrSG-H_LJksC2w-1
Received: by mail-ed1-f69.google.com with SMTP id
 o18-20020a056402439200b003d2b11eb0a9so2411066edc.23
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 03:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUbtyvaEPYX30Gj9ymeOlQ/elA9VkXWhpxUQj/cX3Eo=;
 b=TH+WqKbAflsu7e70gK2Xr6M2WhyDjjruUT7OpySJHbXrSrO70o2QC5aFjl+YN6gWyY
 ohuAQ+h7NhDTFA0hmVcKcK3zRc58SaVNe8jeEwvsBZHTeCeBwBj0kcovVePz5cdik4lS
 9yr63HPGbN7nVoz0gbPMtdGyLxGAtWuD1qNdRaI0xi2mQ1A+gvSaVns0kye50lszciSj
 6T+4Ni4+wNWkEoIOhtlUtl7VAmdpTpeTkny7QAWFORZlRRyYPEoKgSIxXsrNgpNSPPap
 MDW/YXB69DU+iaDderMkDxir1Bht/W+a0K6L0elUE2D4Zr/Ecl/ExCqCJMzeF4HIGphT
 L3Ew==
X-Gm-Message-State: AOAM53060YQdx7lGDd1YKh7RPwvbGic/vFYHiUVWPRIOYaxrXo7fngk5
 YOoJDcczCbl32A+SbWkBJQI50gFQmfWu0HDYuD8fH/yNFryC1sJSGnn/1Bq13k9QUpqSrBPT9th
 2VzagTwxryGeeXSw=
X-Received: by 2002:a50:8163:: with SMTP id 90mr25378428edc.198.1632305179222; 
 Wed, 22 Sep 2021 03:06:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5/M0h+4jrwnIEK7ZOHOKM47MEUPoc6iL5GpfE6GV1ESkkXb4Qrv8STmZpioks9AwAFanglQ==
X-Received: by 2002:a50:8163:: with SMTP id 90mr25378402edc.198.1632305178919; 
 Wed, 22 Sep 2021 03:06:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d3sm933485edv.87.2021.09.22.03.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 03:06:18 -0700 (PDT)
Date: Wed, 22 Sep 2021 12:06:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 18/35] acpi: build_dmar_q35: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20210922120617.55f556c6@redhat.com>
In-Reply-To: <8ddd2efe-f098-7438-9ac9-693bc2177644@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-19-imammedo@redhat.com>
 <8ddd2efe-f098-7438-9ac9-693bc2177644@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 11:19:05 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 9/7/21 4:47 PM, Igor Mammedov wrote:
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offsets magic from API user.
> >=20
> > While at it switch to build_append_int_noprefix() to build
> > table entries tables.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   - rebase on top 26863366b29 (hw/i386/acpi-build: Add DMAR support to =
bypass iommu)
> >   - s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_e=
nd/
> >=20
> > CC: wangxingang5@huawei.com
> > CC: marcel.apfelbaum@gmail.com
> > ---
> >  include/hw/acpi/acpi-defs.h | 68 --------------------------
> >  hw/i386/acpi-build.c        | 97 ++++++++++++++++++++-----------------
> >  2 files changed, 53 insertions(+), 112 deletions(-)
> >=20
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index d293304f9c..c4f0a202e8 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -358,74 +358,6 @@ struct AcpiGenericTimerTable {
> >  } QEMU_PACKED;
> >  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
> > =20
> > -/* DMAR - DMA Remapping table r2.2 */
> > -struct AcpiTableDmar {
> > -    ACPI_TABLE_HEADER_DEF
> > -    uint8_t host_address_width; /* Maximum DMA physical addressability=
 */
> > -    uint8_t flags;
> > -    uint8_t reserved[10];
> > -} QEMU_PACKED;
> > -typedef struct AcpiTableDmar AcpiTableDmar;
> > -
> > -/* Masks for Flags field above */
> > -#define ACPI_DMAR_INTR_REMAP        1
> > -#define ACPI_DMAR_X2APIC_OPT_OUT    (1 << 1)
> > -
> > -/* Values for sub-structure type for DMAR */
> > -enum {
> > -    ACPI_DMAR_TYPE_HARDWARE_UNIT =3D 0,       /* DRHD */
> > -    ACPI_DMAR_TYPE_RESERVED_MEMORY =3D 1,     /* RMRR */
> > -    ACPI_DMAR_TYPE_ATSR =3D 2,                /* ATSR */
> > -    ACPI_DMAR_TYPE_HARDWARE_AFFINITY =3D 3,   /* RHSR */
> > -    ACPI_DMAR_TYPE_ANDD =3D 4,                /* ANDD */
> > -    ACPI_DMAR_TYPE_RESERVED =3D 5             /* Reserved for furture =
use */
> > -};
> > -
> > -/*
> > - * Sub-structures for DMAR
> > - */
> > -
> > -/* Device scope structure for DRHD. */
> > -struct AcpiDmarDeviceScope {
> > -    uint8_t entry_type;
> > -    uint8_t length;
> > -    uint16_t reserved;
> > -    uint8_t enumeration_id;
> > -    uint8_t bus;
> > -    struct {
> > -        uint8_t device;
> > -        uint8_t function;
> > -    } path[];
> > -} QEMU_PACKED;
> > -typedef struct AcpiDmarDeviceScope AcpiDmarDeviceScope;
> > -
> > -/* Type 0: Hardware Unit Definition */
> > -struct AcpiDmarHardwareUnit {
> > -    uint16_t type;
> > -    uint16_t length;
> > -    uint8_t flags;
> > -    uint8_t reserved;
> > -    uint16_t pci_segment;   /* The PCI Segment associated with this un=
it */
> > -    uint64_t address;   /* Base address of remapping hardware register=
-set */
> > -    AcpiDmarDeviceScope scope[];
> > -} QEMU_PACKED;
> > -typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
> > -
> > -/* Type 2: Root Port ATS Capability Reporting Structure */
> > -struct AcpiDmarRootPortATS {
> > -    uint16_t type;
> > -    uint16_t length;
> > -    uint8_t flags;
> > -    uint8_t reserved;
> > -    uint16_t pci_segment;
> > -    AcpiDmarDeviceScope scope[];
> > -} QEMU_PACKED;
> > -typedef struct AcpiDmarRootPortATS AcpiDmarRootPortATS;
> > -
> > -/* Masks for Flags field above */
> > -#define ACPI_DMAR_INCLUDE_PCI_ALL   1
> > -#define ACPI_DMAR_ATSR_ALL_PORTS    1
> > -
> >  /*
> >   * Input Output Remapping Table (IORT)
> >   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 51e0ba07b6..2875c4f393 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -2064,8 +2064,9 @@ build_srat(GArray *table_data, BIOSLinker *linker=
, MachineState *machine)
> >  static void
> >  insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
> >  {
> > +    const size_t device_scope_size =3D 6 /* device scope structure */ =
+
> > +                                     2 /* 1 path entry */;
> >      GArray *scope_blob =3D opaque;
> > -    AcpiDmarDeviceScope *scope =3D NULL;
> > =20
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
> >          /* Dmar Scope Type: 0x02 for PCI Bridge */
> > @@ -2076,8 +2077,7 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *o=
paque)
> >      }
> > =20
> >      /* length */
> > -    build_append_int_noprefix(scope_blob,
> > -                              sizeof(*scope) + sizeof(scope->path[0]),=
 1);
> > +    build_append_int_noprefix(scope_blob, device_scope_size, 1);
> >      /* reserved */
> >      build_append_int_noprefix(scope_blob, 0, 2);
> >      /* enumeration_id */
> > @@ -2109,26 +2109,31 @@ dmar_host_bridges(Object *obj, void *opaque)
> >  }
> > =20
> >  /*
> > - * VT-d spec 8.1 DMA Remapping Reporting Structure
> > - * (version Oct. 2014 or later)
> > + * Intel =C2=AE Virtualization Technology for Directed I/O
> > + * Architecture Specification. Revision 3.3
> > + * 8.1 DMA Remapping Reporting Structure
> >   */
> >  static void
> >  build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem=
_id,
> >                 const char *oem_table_id)
> >  {
> > -    int dmar_start =3D table_data->len;
> > -
> > -    AcpiTableDmar *dmar;
> > -    AcpiDmarHardwareUnit *drhd;
> > -    AcpiDmarRootPortATS *atsr;
> >      uint8_t dmar_flags =3D 0;
> > +    uint8_t rsvd10[10] =3D {};
> > +    /* Root complex IOAPIC uses one path only */
> > +    const size_t ioapic_scope_size =3D 6 /* device scope structure */ =
+
> > +                                     2 /* 1 path entry */;
> >      X86IOMMUState *iommu =3D x86_iommu_get_default();
> > -    AcpiDmarDeviceScope *scope =3D NULL;
> > -    /* Root complex IOAPIC use one path[0] only */
> > -    size_t ioapic_scope_size =3D sizeof(*scope) + sizeof(scope->path[0=
]);
> >      IntelIOMMUState *intel_iommu =3D INTEL_IOMMU_DEVICE(iommu);
> >      GArray *scope_blob =3D g_array_new(false, true, 1);
> > =20
> > +    AcpiTable table =3D { .sig =3D "DMAR", .rev =3D 1, .oem_id =3D oem=
_id,
> > +                        .oem_table_id =3D oem_table_id };
> > +
> > +    assert(iommu);
> > +    if (x86_iommu_ir_supported(iommu)) {
> > +        dmar_flags |=3D 0x1;      /* Flags: 0x1: INT_REMAP */
> > +    }
> > +
> >      /*
> >       * A PCI bus walk, for each PCI host bridge.
> >       * Insert scope for each PCI bridge and endpoint device which
> > @@ -2137,48 +2142,52 @@ build_dmar_q35(GArray *table_data, BIOSLinker *=
linker, const char *oem_id,
> >      object_child_foreach_recursive(object_get_root(),
> >                                     dmar_host_bridges, scope_blob);
> > =20
> > -    assert(iommu);
> > -    if (x86_iommu_ir_supported(iommu)) {
> > -        dmar_flags |=3D 0x1;      /* Flags: 0x1: INT_REMAP */
> > -    } =20

> why this move?

it's not really necessary/related, probably it was moved to be closer
to other variables initialization.


> > -
> > -    dmar =3D acpi_data_push(table_data, sizeof(*dmar));
> > -    dmar->host_address_width =3D intel_iommu->aw_bits - 1;
> > -    dmar->flags =3D dmar_flags;
> > -
> > -    /* DMAR Remapping Hardware Unit Definition structure */
> > -    drhd =3D acpi_data_push(table_data, sizeof(*drhd) + ioapic_scope_s=
ize);
> > -    drhd->type =3D cpu_to_le16(ACPI_DMAR_TYPE_HARDWARE_UNIT);
> > -    drhd->length =3D
> > -        cpu_to_le16(sizeof(*drhd) + ioapic_scope_size + scope_blob->le=
n);
> > -    drhd->flags =3D 0;            /* Don't include all pci device */
> > -    drhd->pci_segment =3D cpu_to_le16(0);
> > -    drhd->address =3D cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
> > +    acpi_table_begin(&table, table_data);
> > +    /* Host Address Width */
> > +    build_append_int_noprefix(table_data, intel_iommu->aw_bits - 1, 1)=
;
> > +    build_append_int_noprefix(table_data, dmar_flags, 1); /* Flags */
> > +    g_array_append_vals(table_data, rsvd10, sizeof(rsvd10)); /* Reserv=
ed */
> > +
> > +    /* 8.3 DMAR Remapping Hardware Unit Definition structure */
> > +    build_append_int_noprefix(table_data, 0, 2); /* Type */
> > +    /* Length */
> > +    build_append_int_noprefix(table_data,
> > +                              16 + ioapic_scope_size + scope_blob->len=
, 2);
> > +    /* Flags */
> > +    build_append_int_noprefix(table_data, 0 /* Don't include all pci d=
evice */ ,
> > +                              1);
> > +    build_append_int_noprefix(table_data, 0 , 1); /* Reserved */
> > +    build_append_int_noprefix(table_data, 0 , 2); /* Segment Number */
> > +    /* Register Base Address */
> > +    build_append_int_noprefix(table_data, Q35_HOST_BRIDGE_IOMMU_ADDR ,=
 8);
> > =20
> >      /* Scope definition for the root-complex IOAPIC. See VT-d spec
> >       * 8.3.1 (version Oct. 2014 or later). */
> > -    scope =3D &drhd->scope[0];
> > -    scope->entry_type =3D 0x03;   /* Type: 0x03 for IOAPIC */
> > -    scope->length =3D ioapic_scope_size;
> > -    scope->enumeration_id =3D ACPI_BUILD_IOAPIC_ID;
> > -    scope->bus =3D Q35_PSEUDO_BUS_PLATFORM;
> > -    scope->path[0].device =3D PCI_SLOT(Q35_PSEUDO_DEVFN_IOAPIC);
> > -    scope->path[0].function =3D PCI_FUNC(Q35_PSEUDO_DEVFN_IOAPIC);
> > +    build_append_int_noprefix(table_data, 0x03 /* IOAPIC */, 1); /* Ty=
pe */
> > +    build_append_int_noprefix(table_data, ioapic_scope_size, 1); /* Le=
ngth */
> > +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> > +    /* Enumeration ID */
> > +    build_append_int_noprefix(table_data, ACPI_BUILD_IOAPIC_ID, 1);
> > +    /* Start Bus Number */
> > +    build_append_int_noprefix(table_data, Q35_PSEUDO_BUS_PLATFORM, 1);
> > +    /* Path, {Device, Function} pair */
> > +    build_append_int_noprefix(table_data, PCI_SLOT(Q35_PSEUDO_DEVFN_IO=
APIC), 1);
> > +    build_append_int_noprefix(table_data, PCI_FUNC(Q35_PSEUDO_DEVFN_IO=
APIC), 1);
> > =20
> >      /* Add scope found above */
> >      g_array_append_vals(table_data, scope_blob->data, scope_blob->len)=
;
> >      g_array_free(scope_blob, true);
> > =20
> >      if (iommu->dt_supported) {
> > -        atsr =3D acpi_data_push(table_data, sizeof(*atsr));
> > -        atsr->type =3D cpu_to_le16(ACPI_DMAR_TYPE_ATSR);
> > -        atsr->length =3D cpu_to_le16(sizeof(*atsr));
> > -        atsr->flags =3D ACPI_DMAR_ATSR_ALL_PORTS;
> > -        atsr->pci_segment =3D cpu_to_le16(0);
> > +        /* 8.5 Root Port ATS Capability Reporting Structure */
> > +        build_append_int_noprefix(table_data, 2, 2); /* Type */
> > +        build_append_int_noprefix(table_data, 8, 2); /* Length */ =20

> 8 + no device scope
yep, but given no device scope implemented I didn't see a need to mention i=
t
at all.


> > +        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1); /=
* Flags */
> > +        build_append_int_noprefix(table_data, 0, 1); /* Reserved */
> > +        build_append_int_noprefix(table_data, 0, 2); /* Segment Number=
 */
> >      }
> > =20
> > -    build_header(linker, table_data, (void *)(table_data->data + dmar_=
start),
> > -                 "DMAR", table_data->len - dmar_start, 1, oem_id, oem_=
table_id);
> > +    acpi_table_end(linker, &table);
> >  }
> > =20
> >  /*
> >  =20
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>=20
> Eric
>=20


