Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCF414D0E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:34:15 +0200 (CEST)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4GE-0004EK-9c
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT4D3-0002N7-1h
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT4Cn-0001aT-M4
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632324639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+k+7ZTfDe5K+kgo9zOlsJxQq8IKbzP0TvfjqxQk9rQA=;
 b=jONcfqwnFNGoXAdhRkMGEeZ8+GOF5Kt2fbjMolzkupxVbqecJlcT9mMPEsx0SOqcxlO2dr
 Q2BFASoUWYBzpVHz7bvl3bHOJRU6djpebDvH0g+6OQuk0ENnm4Gek9IItnR9pShlICJUNf
 X1/PgXVitch6MnRjcrII/vIbOaqGi74=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-iGJ4hw7-NDKpHXs3BmSI8Q-1; Wed, 22 Sep 2021 11:30:37 -0400
X-MC-Unique: iGJ4hw7-NDKpHXs3BmSI8Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so3464556edy.14
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oj86qgKPXUFpkadctTo64B9mh4aweJKUmbqxRTEq3Mc=;
 b=qbeIzBCnwa6CJmgDYWeGlBY/x1F2wPk+SnCxeJjuzHTtMVTZcLvrXY4LBJTeF2nuje
 q6F4jrSk5h/Ogz+86E1+Uvx7KT32MhAx14zo25/g7z1kvSuii18w4LlNrnwoZkez6wHI
 3hxuB54IJCUtWbSzGu+Sh90R7VqT64Ds0VC+LesxQA6qtWuniY9ayua5SDkW8he8/5dV
 z5NhwN42evw/cR9JJLUC6mqcRGBMIdHJxfForWYpSxkor4PmjkGogYNa3Wimm6Ny8ZYa
 gH7z7x+E619+rqJ0n84YT7VZSurHbXX6dPyTbyjQ9LT7jNZqRDf+cQHLHWxt7HafKfqr
 heXA==
X-Gm-Message-State: AOAM531uCbkgoijNg4v1AtBE++ePAyuMd7rVJMVZ+2ioS1o1MCejsMMa
 EhS8vWfS6pNCLdZwv/5Cw9Bl55l+VDcjYiRSe50e9IX2m73+jhttisCf1TWSaTRVxkcb/ablWUD
 j6Rqa/qkISadpcwM=
X-Received: by 2002:a17:907:2624:: with SMTP id
 aq4mr159909ejc.448.1632324636489; 
 Wed, 22 Sep 2021 08:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye1pj1U2LoC3Q5hfmCGMraKYuAjtoYKT7DELLE6fOIjLLo3d0k6sQxGS7IRGc8YGGCsETS4Q==
X-Received: by 2002:a17:907:2624:: with SMTP id
 aq4mr159865ejc.448.1632324636165; 
 Wed, 22 Sep 2021 08:30:36 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m10sm1193067ejx.76.2021.09.22.08.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 08:30:35 -0700 (PDT)
Date: Wed, 22 Sep 2021 17:30:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 24/35] acpi: x86: madt: use
 build_append_int_noprefix() API to compose MADT table
Message-ID: <20210922173034.0909b671@redhat.com>
In-Reply-To: <0cfb534a-afb4-ff3e-2359-6906eaf16d8a@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-25-imammedo@redhat.com>
 <0cfb534a-afb4-ff3e-2359-6906eaf16d8a@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 12:20:54 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 9/7/21 4:48 PM, Igor Mammedov wrote:
> > Drop usage of packed structures and explicit endian conversions
> > when building MADT table for arm/x86 and use endian agnostic
> > build_append_int_noprefix() API to build it.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: marcel.apfelbaum@gmail.com
> > CC: eauger@redhat.com
> > ---
> >  include/hw/acpi/acpi-defs.h |  64 ------------------
> >  hw/i386/acpi-common.c       | 127 ++++++++++++++++++------------------
> >  2 files changed, 65 insertions(+), 126 deletions(-)
> >=20
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index af4fa412a5..3f174ba208 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -165,17 +165,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDesc=
riptorRev1;
> > =20
> >  /* Values for Type in APIC sub-headers */
> > =20
> > -#define ACPI_APIC_PROCESSOR          0
> > -#define ACPI_APIC_IO                 1
> > -#define ACPI_APIC_XRUPT_OVERRIDE     2
> > -#define ACPI_APIC_NMI                3
> > -#define ACPI_APIC_LOCAL_NMI          4
> > -#define ACPI_APIC_ADDRESS_OVERRIDE   5
> > -#define ACPI_APIC_IO_SAPIC           6
> > -#define ACPI_APIC_LOCAL_SAPIC        7
> > -#define ACPI_APIC_XRUPT_SOURCE       8
> > -#define ACPI_APIC_LOCAL_X2APIC       9
> > -#define ACPI_APIC_LOCAL_X2APIC_NMI      10
> >  #define ACPI_APIC_GENERIC_CPU_INTERFACE 11
> >  #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
> >  #define ACPI_APIC_GENERIC_MSI_FRAME     13
> > @@ -192,59 +181,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDesc=
riptorRev1;
> > =20
> >  /* Sub-structures for MADT */
> > =20
> > -struct AcpiMadtProcessorApic {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint8_t  processor_id;           /* ACPI processor id */
> > -    uint8_t  local_apic_id;          /* Processor's local APIC id */
> > -    uint32_t flags;
> > -} QEMU_PACKED;
> > -typedef struct AcpiMadtProcessorApic AcpiMadtProcessorApic;
> > -
> > -struct AcpiMadtIoApic {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint8_t  io_apic_id;             /* I/O APIC ID */
> > -    uint8_t  reserved;               /* Reserved - must be zero */
> > -    uint32_t address;                /* APIC physical address */
> > -    uint32_t interrupt;              /* Global system interrupt where =
INTI
> > -                                 * lines start */
> > -} QEMU_PACKED;
> > -typedef struct AcpiMadtIoApic AcpiMadtIoApic;
> > -
> > -struct AcpiMadtIntsrcovr {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint8_t  bus;
> > -    uint8_t  source;
> > -    uint32_t gsi;
> > -    uint16_t flags;
> > -} QEMU_PACKED;
> > -typedef struct AcpiMadtIntsrcovr AcpiMadtIntsrcovr;
> > -
> > -struct AcpiMadtLocalNmi {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint8_t  processor_id;           /* ACPI processor id */
> > -    uint16_t flags;                  /* MPS INTI flags */
> > -    uint8_t  lint;                   /* Local APIC LINT# */
> > -} QEMU_PACKED;
> > -typedef struct AcpiMadtLocalNmi AcpiMadtLocalNmi;
> > -
> > -struct AcpiMadtProcessorX2Apic {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t reserved;
> > -    uint32_t x2apic_id;              /* Processor's local x2APIC ID */
> > -    uint32_t flags;
> > -    uint32_t uid;                    /* Processor object _UID */
> > -} QEMU_PACKED;
> > -typedef struct AcpiMadtProcessorX2Apic AcpiMadtProcessorX2Apic;
> > -
> > -struct AcpiMadtLocalX2ApicNmi {
> > -    ACPI_SUB_HEADER_DEF
> > -    uint16_t flags;                  /* MPS INTI flags */
> > -    uint32_t uid;                    /* Processor object _UID */
> > -    uint8_t  lint;                   /* Local APIC LINT# */
> > -    uint8_t  reserved[3];            /* Local APIC LINT# */
> > -} QEMU_PACKED;
> > -typedef struct AcpiMadtLocalX2ApicNmi AcpiMadtLocalX2ApicNmi;
> > -
> >  struct AcpiMadtGenericCpuInterface {
> >      ACPI_SUB_HEADER_DEF
> >      uint16_t reserved;
> > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > index 7983a13a93..aa7b5c357e 100644
> > --- a/hw/i386/acpi-common.c
> > +++ b/hw/i386/acpi-common.c
> > @@ -38,7 +38,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> >                         bool force_enabled)
> >  {
> >      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
> > -    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enab=
led ? 1 : 0;
> > +    /* Flags =E2=80=93 Local APIC Flags */ =20
> nit: move that comment at the place of the build_append_int_noprefix

that place(s) already has comment in expected format, here is just reminder
about what is initialized here.

> > +    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enab=
led ?
> > +                     1 /* Enabled */ : 0;
> > =20
> >      /* ACPI spec says that LAPIC entry for non present
> >       * CPU may be omitted from MADT or it must be marked
> > @@ -47,24 +49,47 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> >       * should be put in MADT but kept disabled.
> >       */
> >      if (apic_id < 255) {
> > -        AcpiMadtProcessorApic *apic =3D acpi_data_push(entry, sizeof *=
apic);
> > -
> > -        apic->type =3D ACPI_APIC_PROCESSOR;
> > -        apic->length =3D sizeof(*apic);
> > -        apic->processor_id =3D uid;
> > -        apic->local_apic_id =3D apic_id;
> > -        apic->flags =3D cpu_to_le32(flags);
> > +        /* Rev 1.0b, Table 5-13 Processor Local APIC Structure */
> > +        build_append_int_noprefix(entry, 0, 1);       /* Type */
> > +        build_append_int_noprefix(entry, 8, 1);       /* Length */
> > +        build_append_int_noprefix(entry, uid, 1);     /* ACPI Processo=
r ID */ =20
> nit s/ID/UID

it's ID in 1.0b

> > +        build_append_int_noprefix(entry, apic_id, 1); /* APIC ID */
> > +        build_append_int_noprefix(entry, flags, 4); /* Flags */
> >      } else {
> > -        AcpiMadtProcessorX2Apic *apic =3D acpi_data_push(entry, sizeof=
 *apic);
> > -
> > -        apic->type =3D ACPI_APIC_LOCAL_X2APIC;
> > -        apic->length =3D sizeof(*apic);
> > -        apic->uid =3D cpu_to_le32(uid);
> > -        apic->x2apic_id =3D cpu_to_le32(apic_id);
> > -        apic->flags =3D cpu_to_le32(flags);
> > +        /* Rev 4.0, 5.2.12.12 Processor Local x2APIC Structure */
> > +        build_append_int_noprefix(entry, 9, 1);       /* Type */
> > +        build_append_int_noprefix(entry, 16, 1);      /* Length */
> > +        build_append_int_noprefix(entry, 0, 2);       /* Reserved */
> > +        build_append_int_noprefix(entry, apic_id, 4); /* X2APIC ID */
> > +        build_append_int_noprefix(entry, flags, 4);   /* Flags */
> > +        build_append_int_noprefix(entry, uid, 4);     /* ACPI Processo=
r UID */
> >      }
> >  }
> > =20
> > +static void build_ioapic(GArray *entry, uint8_t id, uint32_t addr, uin=
t32_t irq)
> > +{
> > +    /* Rev 1.0b, 5.2.8.2 IO APIC */
> > +    build_append_int_noprefix(entry, 1, 1);    /* Type */
> > +    build_append_int_noprefix(entry, 12, 1);   /* Length */
> > +    build_append_int_noprefix(entry, id, 1);   /* IO APIC ID */
> > +    build_append_int_noprefix(entry, 0, 1);    /* Reserved */
> > +    build_append_int_noprefix(entry, addr, 4); /* IO APIC Address */
> > +    build_append_int_noprefix(entry, irq, 4);  /* System Vector Base *=
/
> > +}
> > +
> > +static void
> > +build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_=
t flags)
> > +{
> > +    /* Rev 1.0b, 5.2.8.3.1 Interrupt Source Overrides */
> > +    build_append_int_noprefix(entry, 2, 1);  /* Type */
> > +    build_append_int_noprefix(entry, 10, 1); /* Length */
> > +    build_append_int_noprefix(entry, 0, 1);  /* Bus */
> > +    build_append_int_noprefix(entry, src, 1);  /* Source */
> > +    /* Global System Interrupt Vector */
> > +    build_append_int_noprefix(entry, gsi, 4);
> > +    build_append_int_noprefix(entry, flags, 2);  /* Flags */
> > +}
> > +
> >  /*
> >   * ACPI spec, Revision 1.0b
> >   * 5.2.8 Multiple APIC Description Table
> > @@ -73,14 +98,11 @@ void acpi_build_madt(GArray *table_data, BIOSLinker=
 *linker,
> >                       X86MachineState *x86ms, AcpiDeviceIf *adev,
> >                       const char *oem_id, const char *oem_table_id)
> >  {
> > +    int i;
> > +    bool x2apic_mode =3D false;
> >      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
> >      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHIN=
E(x86ms));
> >      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
> > -    bool x2apic_mode =3D false;
> > -
> > -    AcpiMadtIoApic *io_apic;
> > -    AcpiMadtIntsrcovr *intsrcovr;
> > -    int i;
> >      AcpiTable table =3D { .sig =3D "APIC", .rev =3D 1, .oem_id =3D oem=
_id,
> >                          .oem_table_id =3D oem_table_id };
> > =20
> > @@ -96,30 +118,14 @@ void acpi_build_madt(GArray *table_data, BIOSLinke=
r *linker,
> >          }
> >      }
> > =20
> > -    io_apic =3D acpi_data_push(table_data, sizeof *io_apic);
> > -    io_apic->type =3D ACPI_APIC_IO;
> > -    io_apic->length =3D sizeof(*io_apic);
> > -    io_apic->io_apic_id =3D ACPI_BUILD_IOAPIC_ID;
> > -    io_apic->address =3D cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
> > -    io_apic->interrupt =3D cpu_to_le32(0);
> > -
> > +    build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID, IO_APIC_DEFAULT_ADD=
RESS, 0);
> >      if (x86ms->ioapic2) {
> > -        AcpiMadtIoApic *io_apic2;
> > -        io_apic2 =3D acpi_data_push(table_data, sizeof *io_apic);
> > -        io_apic2->type =3D ACPI_APIC_IO;
> > -        io_apic2->length =3D sizeof(*io_apic);
> > -        io_apic2->io_apic_id =3D ACPI_BUILD_IOAPIC_ID + 1;
> > -        io_apic2->address =3D cpu_to_le32(IO_APIC_SECONDARY_ADDRESS);
> > -        io_apic2->interrupt =3D cpu_to_le32(IO_APIC_SECONDARY_IRQBASE)=
;
> > +        build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID + 1,
> > +                     IO_APIC_SECONDARY_ADDRESS, IO_APIC_SECONDARY_IRQB=
ASE);
> >      }
> > =20
> >      if (x86ms->apic_xrupt_override) {
> > -        intsrcovr =3D acpi_data_push(table_data, sizeof *intsrcovr);
> > -        intsrcovr->type   =3D ACPI_APIC_XRUPT_OVERRIDE;
> > -        intsrcovr->length =3D sizeof(*intsrcovr);
> > -        intsrcovr->source =3D 0;
> > -        intsrcovr->gsi    =3D cpu_to_le32(2);
> > -        intsrcovr->flags  =3D cpu_to_le16(0); /* conforms to bus speci=
fications */
> > +        build_xrupt_override(table_data, 0, 2, 0); =20

> lost /* conforms to bus specifications */ comment for the flag during
> the battle/ Don't know if it is useful though


> >      }
> > =20
> >      for (i =3D 1; i < 16; i++) {
> > @@ -127,32 +133,29 @@ void acpi_build_madt(GArray *table_data, BIOSLink=
er *linker,
> >              /* No need for a INT source override structure. */
> >              continue;
> >          }
> > -        intsrcovr =3D acpi_data_push(table_data, sizeof *intsrcovr);
> > -        intsrcovr->type   =3D ACPI_APIC_XRUPT_OVERRIDE;
> > -        intsrcovr->length =3D sizeof(*intsrcovr);
> > -        intsrcovr->source =3D i;
> > -        intsrcovr->gsi    =3D cpu_to_le32(i);
> > -        intsrcovr->flags  =3D cpu_to_le16(0xd); /* active high, level =
triggered */
> > +        build_xrupt_override(table_data, i, i, 0xd); =20
> Lost for the flag /* active high, level triggered */
> >      }
> > =20
> >      if (x2apic_mode) {
> > -        AcpiMadtLocalX2ApicNmi *local_nmi;
> > -
> > -        local_nmi =3D acpi_data_push(table_data, sizeof *local_nmi);
> > -        local_nmi->type   =3D ACPI_APIC_LOCAL_X2APIC_NMI;
> > -        local_nmi->length =3D sizeof(*local_nmi);
> > -        local_nmi->uid    =3D 0xFFFFFFFF; /* all processors */
> > -        local_nmi->flags  =3D cpu_to_le16(0);
> > -        local_nmi->lint   =3D 1; /* ACPI_LINT1 */
> > +        /* Rev 4.0, 5.2.12.13 Local x2APIC NMI Structure*/
> > +        build_append_int_noprefix(table_data, 0xA, 1); /* Type */
> > +        build_append_int_noprefix(table_data, 12, 1);  /* Length */
> > +        build_append_int_noprefix(table_data, 0, 2);   /* Flags */
> > +        /* ACPI Processor UID */
> > +        build_append_int_noprefix(table_data, 0xFFFFFFFF /* all proces=
sors */,
> > +                                  4);
> > +        /* Local x2APIC INTI# */ =20
> Local x2APIC LINT#
> > +        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
> > +        build_append_int_noprefix(table_data, 0, 3); =20
> /* reserved */
> >      } else {
> > -        AcpiMadtLocalNmi *local_nmi;
> > -
> > -        local_nmi =3D acpi_data_push(table_data, sizeof *local_nmi);
> > -        local_nmi->type         =3D ACPI_APIC_LOCAL_NMI;
> > -        local_nmi->length       =3D sizeof(*local_nmi);
> > -        local_nmi->processor_id =3D 0xff; /* all processors */
> > -        local_nmi->flags        =3D cpu_to_le16(0);
> > -        local_nmi->lint         =3D 1; /* ACPI_LINT1 */
> > +        /* Rev 1.0b, 5.2.8.3.3 Local APIC NMI */
> > +        build_append_int_noprefix(table_data, 4, 1);  /* Type */
> > +        build_append_int_noprefix(table_data, 6, 1);  /* Length */
> > +        /* ACPI Processor ID */
> > +        build_append_int_noprefix(table_data, 0xff /* all processors *=
/, 1); =20
> 0xFF

> > +        build_append_int_noprefix(table_data, 0, 2);  /* Flags */
> > +        /* Local APIC INTI# */ =20
> Local APIC LINT#

it's "Local APIC INTI#" in 1.0b

> > +        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
> >      }
> > =20
> >      acpi_table_end(linker, &table);
> >  =20

the rest is fixed up

> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>=20
> Eric
>=20


