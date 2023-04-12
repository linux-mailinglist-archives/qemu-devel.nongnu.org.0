Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E866DED1F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 10:00:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmVNQ-0007sY-27; Wed, 12 Apr 2023 03:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmVNN-0007rr-II
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmVNK-0003hW-Eb
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681286321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUoDwNcKpUeqw+JF8Zi1NQ+UdtKG5fKh8tY9iPH4Vr0=;
 b=iz7vbb4KJeuT0eTuDON0/9R0o7WYF4JPleH2duiACnqafm9dmVLaP3lhAq/8XIFFo174Xk
 xD9hxuV+kkRU6rEaSmYnxbhGWEP1hv+USuVfmOVVKd8s42Nm4S23ff6174EB1+PfMRvX6K
 e85hX/zl+3mRTolPSD9W8xCRkWJ8AL4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-FYuqaG4pOMOs9HgpY0v8ow-1; Wed, 12 Apr 2023 03:58:40 -0400
X-MC-Unique: FYuqaG4pOMOs9HgpY0v8ow-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a355c9028so156945666b.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 00:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681286319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sUoDwNcKpUeqw+JF8Zi1NQ+UdtKG5fKh8tY9iPH4Vr0=;
 b=cbmBaEcd2iwnmNudYCvA/J3/dTVBqb8dVcufwbVqRCM8DG1BvXYBOX+1MxUpFHOZSQ
 dNS78kzlWePwsWOOuLTs1Hfi1NHeRjBVXDuI+BqsE9INm6JwVXgAqznZHxuZbRHKwuwE
 wrPxA5gsrPrBBq8wzLPGT/UogMjcVjTpVK1futpxomHNJwbmCVs2DPI85zlZ8xtHaWIh
 eWKvwdNWiK/95W0TyClMIS1A1KLP1/qO5YkgwE1G0QbzH7U3eqQ0DYjhhN9gnlpfhJur
 /rFzWE+HRpFFP1TAM3eDE951J+hOUUFsXaKaPbcPNPrNN+QTv0+uXab63DaUdpPBCHRZ
 oq9Q==
X-Gm-Message-State: AAQBX9dn1HKF66IPOLSqU7Ls7vr8WWIAu3Ve6Lerd9BrLAzj3hJeNljx
 dEuE/vouzPYxks4L7AlFKkMZFO/vCI3Tlkz7cXZIMkTMszwoFh20m32vPXVYX1J7xzwIMs1Q2gU
 cand5+FX1Vs9YQJU=
X-Received: by 2002:a05:6402:134c:b0:504:a192:cd5d with SMTP id
 y12-20020a056402134c00b00504a192cd5dmr8034145edw.5.1681286318870; 
 Wed, 12 Apr 2023 00:58:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z0Stu4IBEQWEKxYxL1EC96nuVDlffPE4u7k/8AajKmih0HizT3SMj4Wqy43jTh70VVJUFXXA==
X-Received: by 2002:a05:6402:134c:b0:504:a192:cd5d with SMTP id
 y12-20020a056402134c00b00504a192cd5dmr8034130edw.5.1681286318572; 
 Wed, 12 Apr 2023 00:58:38 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d7-20020a50f687000000b00504803f4071sm5050629edn.44.2023.04.12.00.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 00:58:37 -0700 (PDT)
Date: Wed, 12 Apr 2023 09:58:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230412095836.199539a3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230411180049.7566b9aa@imammedo.users.ipa.redhat.com>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230411180049.7566b9aa@imammedo.users.ipa.redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 11 Apr 2023 18:00:49 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 28 Mar 2023 11:59:26 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>=20
> > Currently i386 QEMU generates MADT revision 3, and reports
> > MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> >=20
> > For MADT revision 4, that introduces ARM GIC structures, which do
> > not apply to i386.
> >=20
> > For MADT revision 5, the Local APIC flags introduces the Online
> > Capable bitfield.
> >=20
> > Making MADT generate and report revision 5 will solve problems with
> > CPU hotplug (the Online Capable flag indicates hotpluggable CPUs). =20
>=20
> So spec mandates 3 possible states
>   00t - not present and not can't be added later ever
>   01t - present
>   10t - not present but might be added later
> and outlawed 11t combination
>=20
> 00t - doesn't make much sense (i.e. why put such entry in MADT in the 1st=
 place)
>=20
> but looking at kernel commit aa06e20f1be, it looks like
> ACPI_MADT_ONLINE_CAPABLE was introduced to accommodate
> firmware/hw folks who would stuff MADT with LAPIC entries
> for all possible CPU models, and then patch it depending on
> actually used CPU model instead of dynamically creating LAPIC
> entries. (insane)

on second thought, QEMU doesn't need rev 5 MADT with this flag complication=
s.
Also I see that kernel side fix ended up in checking ACPI spec version inst=
ead
of dealing with MADT revisions mess.

So for x86 lets bump revision to 3 or 4 to be in sync with
what QEMU actually uses.
 =20
>=20
> =20
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > ---
> >  hw/i386/acpi-common.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > index 52e5c1439a..1e3a13a36c 100644
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
> > +                     true /* Enabled */ : false;
> > +    /*
> > +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> > +     * if Enabled is set.
> > +     */
> > +    bool onlinecapable =3D enabled ? false : true; /* Online Capable *=
/ =20
>=20
> > +    uint32_t flags =3D onlinecapable ? 0x2 : 0x0 |
> > +        enabled ? 0x1 : 0x0; =20
> align the last line with onlinecapable ....'
>=20
> move /* Enabled */ and /* Online Capable */ comments right to magic values
> i.e. onlinecapable ? 0x2 : 0x0 | /* Online Capable */ ...
>=20
> > =20
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
> > =20
> >      acpi_table_begin(&table, table_data); =20
>=20


