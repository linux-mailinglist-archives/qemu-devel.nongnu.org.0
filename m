Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0B6E96B0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUza-00088b-82; Thu, 20 Apr 2023 10:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppUzW-00085y-Cn
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppUzU-0001kZ-JA
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681999827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJXKb4GCeZTZGQpQe5ElOsqEKz7ZJZN0i0eKZeLSWFU=;
 b=EDiKshOzS1SXcCmxc/D4jXqsf6DBAcLIJBed2F3sIqlcBZT2YjXYkuKi/rI6DRbBeOPt0p
 4xbzu4hGngXu/zuJROOs/Fsz4qgu0JC6o56FN9orQP+peXlMOVXkxaPxS+ZVxp6/id6oJV
 hF8JZccDbgNvT9GMcPRG2zDzzf20mTg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-CqxxRS9ENvqHuiuL4-LXBw-1; Thu, 20 Apr 2023 10:10:26 -0400
X-MC-Unique: CqxxRS9ENvqHuiuL4-LXBw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef4ebcf172so8549276d6.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999826; x=1684591826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJXKb4GCeZTZGQpQe5ElOsqEKz7ZJZN0i0eKZeLSWFU=;
 b=SRRqELmi8MKunG6BAdEl1LZB7oWn6lkOsxzdl3emrRsVAtJGe1TlhTFIeENUCMxtR3
 hRcSnLWz5RAXhmhKZuyWnxqu9s/B76PUjPBfsL/TYYprwDnmc4+GCEEB0lbd9vGXkOJ8
 59ufMX+KeGvxCf0HmmBmuG6eEIaj8Eri85k3qokPu3AwAPgKRkqkgOwrLZiS4klsfzMF
 /ge92Ep+PuHhne4/ZLIgKBMUPW7zctK9Uf8oeHJYWzgPzX9BJSsJ5hNIhAP6SINS7ILS
 Dlrqm1gLuuOeIzgyEdCU8JSMr3SUV6p30xliUql3v9uVQ9c6GcCA7114G3VwnXlS45mQ
 fYgA==
X-Gm-Message-State: AAQBX9czBFRW9E6ocOVwuU9/nP6Ix2TufJ4SNHZE3foEtRK74tB7fBtG
 brRn/MHXWjZ+KkLxkOJmeFjGpFS7cRj7+7YSYZHWRmBLx5d7EnHeuVskBth61C9RWd01442gIrL
 UnDf/RNwwDzOz3iU=
X-Received: by 2002:a05:6214:21a1:b0:5e9:5602:3af0 with SMTP id
 t1-20020a05621421a100b005e956023af0mr1790793qvc.46.1681999825728; 
 Thu, 20 Apr 2023 07:10:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350aeWHt/tvpI+aRTp9k3+4QIZ1ZFvu5wLM9BmSBT6v7uaQ7FGGj3tphcek13BnLxpG+XeE1TTA==
X-Received: by 2002:a05:6214:21a1:b0:5e9:5602:3af0 with SMTP id
 t1-20020a05621421a100b005e956023af0mr1790755qvc.46.1681999825398; 
 Thu, 20 Apr 2023 07:10:25 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a0ce452000000b005eb3a61bc29sm421236qvm.66.2023.04.20.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:10:24 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:10:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com,
 mst@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230420161020.7b86d62f@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
 <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 13:35:58 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Tue, Apr 18, 2023 at 10:22=E2=80=AFPM Eric DeVolder <eric.devolder@ora=
cle.com> wrote:
> >
> > Currently i386 QEMU generates MADT revision 3, and reports
> > MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> >
> > For MADT revision 4, that introduces ARM GIC structures, which do
> > not apply to i386.
> >
> > For MADT revision 5, the Local APIC flags introduces the Online
> > Capable bitfield.
> >
> > Making MADT generate and report revision 5 will solve problems with
> > CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> >
> > Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.dev=
older@oracle.com/T/#t
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > ---
> >  hw/i386/acpi-common.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > index 52e5c1439a..286c1c5c32 100644
> > --- a/hw/i386/acpi-common.c
> > +++ b/hw/i386/acpi-common.c
> > @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList =
*apic_ids,
> >  {
> >      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
> >      /* Flags =E2=80=93 Local APIC Flags */
> > -    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enab=
led ?
> > -                     1 /* Enabled */ : 0;
> > +    bool enabled =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enable=
d ?
> > +                     true : false; =20
>=20
> how about "processor_enabled" instead of just "enabled" as the variable n=
ame.
>=20
> > +    /*
> > +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> > +     * if Enabled is set.
> > +     */
> > +    bool onlinecapable =3D enabled ? false : true; =20
>=20
> ugh, how about uint32 onlinecapable =3D enabled? 0x0 : 0x2 ?
>=20
> > +    uint32_t flags =3D onlinecapable ? 0x2 : 0x0 | /* Online Capable */
> > +                     enabled ? 0x1 : 0x0; /* Enabled */ =20
>=20
> then here, flags =3D onlinecapable | processor_enabled? 0x1 : 0x0;

onlinecapable is unnecessary complication.

See my reply on v1, we don't really have a reason to bump MADT revision to =
5,
It brings no value whatsoever. (and kernel fix went another route instead of
dealing with messed up MADT revision numbering in spec)

All we need is to just bump revision to 3 or 4 to match actually
used features.

>=20
> >
> >      /* ACPI spec says that LAPIC entry for non present
> >       * CPU may be omitted from MADT or it must be marked
> > @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker=
 *linker,
> >      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
> >      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHIN=
E(x86ms));
> >      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
> > -    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 1, .oem_id =3D oem=
_id,
> > +    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 5, .oem_id =3D oem=
_id,
> >                          .oem_table_id =3D oem_table_id };
> >
> >      acpi_table_begin(&table, table_data);
> > --
> > 2.31.1
> > =20
>=20


