Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CA3B7DFD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 09:24:26 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyUa9-0005sD-04
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 03:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lyUYw-00058o-Kv
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 03:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lyUYt-0007Lw-Li
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 03:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625037786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcsNqbIxLODMEK6a2TtjQfn+hVGe2lyfbBO6OyYqhFA=;
 b=cQDa6R2fOpr2q4huClpoGTy9DYT9mj2kbE1t13UVpS88mu71vOxf8fzk3ZLeFy8zadSgOf
 sPy01TMa5cfX/3d5xJ5s++cUq2mDtVAq/fKIRx5r/7UDvaOn7PusI8euKSQXUM5tOrLLsg
 BYQJG1g7pPg4IViHMUnxLjs3/yoB6wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-73p8JpY6PliKEwUQ8S5ZBQ-1; Wed, 30 Jun 2021 03:22:56 -0400
X-MC-Unique: 73p8JpY6PliKEwUQ8S5ZBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A65362FA;
 Wed, 30 Jun 2021 07:22:54 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A382F5C23A;
 Wed, 30 Jun 2021 07:22:48 +0000 (UTC)
Date: Wed, 30 Jun 2021 09:22:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 33/53] acpi: build_tpm_tcpa: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Message-ID: <20210630092247.380fd9d6@redhat.com>
In-Reply-To: <f25b9842-40b3-f65d-2ab6-e87d71c65f91@linux.ibm.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-35-imammedo@redhat.com>
 <f25b9842-40b3-f65d-2ab6-e87d71c65f91@linux.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 11:19:17 -0400
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 6/25/21 5:17 AM, Igor Mammedov wrote:
>=20
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offsets magic from API user.
> >
> > While at it switch to build_append_int_noprefix() to build
> > table entries (which also removes some manual offset
> > calculations).
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com> =20
>=20
>=20
> Patch 19, 24 and this one applied causes this error here when using a=20
> TPM 1.2:
>=20
> qemu-system-x86_64: ../hw/acpi/bios-linker-loader.c:286:=20
> bios_linker_loader_add_pointer: Assertion `source_file' failed.

I missed this one since it's not covered by qtest,
it seems that test_acpi_tcg_tpm() tests only TPM2.0,
can you look into adding a test-case for TPM1.2
so it won't get missed/broken in the future?

I'll post fixed patch shortly as a reply this this thread.

>=20
>=20
>  =C2=A0=C2=A0 Stefan
>=20
>=20
> > ---
> > CC: marcel.apfelbaum@gmail.com
> > CC: stefanb@linux.vnet.ibm.com
> > ---
> >   include/hw/acpi/acpi-defs.h | 14 -------------
> >   hw/i386/acpi-build.c        | 39 +++++++++++++++++++++---------------=
-
> >   2 files changed, 22 insertions(+), 31 deletions(-)
> >
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 4d8f8b34b0..3b42b138f0 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -418,20 +418,6 @@ struct AcpiSratProcessorGiccAffinity {
> >
> >   typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAff=
inity;
> >
> > -/*
> > - * TCPA Description Table
> > - *
> > - * Following Level 00, Rev 00.37 of specs:
> > - * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specificati=
on
> > - */
> > -struct Acpi20Tcpa {
> > -    ACPI_TABLE_HEADER_DEF                    /* ACPI common table head=
er */
> > -    uint16_t platform_class;
> > -    uint32_t log_area_minimum_length;
> > -    uint64_t log_area_start_address;
> > -} QEMU_PACKED;
> > -typedef struct Acpi20Tcpa Acpi20Tcpa;
> > -
> >   /* DMAR - DMA Remapping table r2.2 */
> >   struct AcpiTableDmar {
> >       ACPI_TABLE_HEADER_DEF
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 96ad3e1b9d..bc45a666f6 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1849,31 +1849,36 @@ build_hpet(GArray *table_data, BIOSLinker *link=
er, const char *oem_id,
> >   }
> >
> >   #ifdef CONFIG_TPM
> > +/*
> > + * TCPA Description Table
> > + *
> > + * Following Level 00, Rev 00.37 of specs:
> > + * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specificati=
on
> > + * 7.1.2 ACPI Table Layout
> > + */
> >   static void
> >   build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalo=
g,
> >                  const char *oem_id, const char *oem_table_id)
> >   {
> > -    int tcpa_start =3D table_data->len;
> > -    Acpi20Tcpa *tcpa =3D acpi_data_push(table_data, sizeof *tcpa);
> > -    unsigned log_addr_size =3D sizeof(tcpa->log_area_start_address);
> > -    unsigned log_addr_offset =3D
> > -        (char *)&tcpa->log_area_start_address - table_data->data;
> > +    AcpiTable table =3D { .sig =3D "TCPA", .rev =3D 2,
> > +                        .oem_id =3D oem_id, .oem_table_id =3D oem_tabl=
e_id };
> >
> > -    tcpa->platform_class =3D cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
> > -    tcpa->log_area_minimum_length =3D cpu_to_le32(TPM_LOG_AREA_MINIMUM=
_SIZE);
> > -    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length)=
);
> > +    acpi_init_table(&table, table_data);
> > +    /* Platform Class */
> > +    build_append_int_noprefix(table_data, TPM_TCPA_ACPI_CLASS_CLIENT, =
2);
> > +    /* Log Area Minimum Length (LAML) */
> > +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4=
);
> > +    /* Log Area Start Address (LASA) */
> > +    /* log area start address to be filled by Guest linker */
> > +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> > +        table_data->len, 8, ACPI_BUILD_TPMLOG_FILE, 0);
> > +    build_append_int_noprefix(table_data, 0, 8);
> > +    acpi_table_composed(linker, &table);
> >
> > +    /* allocate/reserve space for TPM log area */
> > +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
> >       bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog,=
 1,
> >                                false /* high memory */);
> > -
> > -    /* log area start address to be filled by Guest linker */
> > -    bios_linker_loader_add_pointer(linker,
> > -        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
> > -        ACPI_BUILD_TPMLOG_FILE, 0);
> > -
> > -    build_header(linker, table_data,
> > -                 (void *)(table_data->data + tcpa_start),
> > -                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
> >   }
> >   #endif
> > =20
>=20


