Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F5438535
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:16:51 +0200 (CEST)
Received: from localhost ([::1]:45018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNRg-0002PJ-PC
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meNPc-0001Do-8M
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meNPY-000179-Au
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635020074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FP0DgilgbNOtMMKimhGisja2JjvnqY5tUhNBaUdoqB4=;
 b=QmkL7z2BHaI6HHl+WBP8t/z5m6SCGHqKlg4DZqptNVB4M7lrA7V5WMXvZ1iZrc44MyYiqt
 O+9F4+g2wKFPcadHs6c1oAR/wO5iGfdR/rAwjVqHRbxrUnbspGawgW+OFQ18vet0wobmbO
 C+6zRZcow6wULQwTpDm9gcQviVJaFEY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-l0jbTQ1aPdaCfH6qH2W5xw-1; Sat, 23 Oct 2021 16:14:32 -0400
X-MC-Unique: l0jbTQ1aPdaCfH6qH2W5xw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b81-20020a1c8054000000b0032c9d428b7fso2380938wmd.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FP0DgilgbNOtMMKimhGisja2JjvnqY5tUhNBaUdoqB4=;
 b=QDOAEdiwS0/su6MkgS0umXWE9jogYnYduFPc+ObO9a+tABEZKYUBuBuiLBpJU0pGBy
 tGpTTYfuQ+5YL9APudlS2qTet0DQeAOVTPU58TRfFkCH2exOJpdbvYqUzaHAII0a22yb
 598HGI91N/86JTSpUvOrXIX5IjgwnhZ2NHSb3IKMN6istFydSmqdfRePn6SIMDA8gAa+
 3xfZho8K6MfRyuhvsFcNcuqT92uW35bkurCrSdKGQEgoUDdbOqSPVVBk+0A/J5VcVGwB
 gSADsrdUf47nNYxowHVL6viyM2lPrIOv4keBW5Ha/erwzkmDQ9RSSX18DUZ7ezJ3ukHQ
 LTOA==
X-Gm-Message-State: AOAM531orU0jKMS5b9HRmyJQGKBT/5sx+vS+uZRUimmbg223H+4orJD7
 v4WKHmNE5/Ko46WrvfVuXd49iSGcG6KgJ39KCu60ykAtsuYP8N/+N8igOS/eKhu7vMKoZz3nK0S
 Se4aU4eIy1SNqj4g=
X-Received: by 2002:adf:9b97:: with SMTP id d23mr9522747wrc.53.1635020071400; 
 Sat, 23 Oct 2021 13:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUH5GGRnuyLDqN1xkJVLKigEz0Of/haLs0cq8b70n7fu11Keds0SWqXGW2fW+CsfXhRHFeZA==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr9522716wrc.53.1635020071190; 
 Sat, 23 Oct 2021 13:14:31 -0700 (PDT)
Received: from redhat.com ([2.55.9.147])
 by smtp.gmail.com with ESMTPSA id z135sm16597115wmc.45.2021.10.23.13.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 13:14:30 -0700 (PDT)
Date: Sat, 23 Oct 2021 16:14:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v8 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Message-ID: <20211023161237-mutt-send-email-mst@kernel.org>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110221545440.268000@anisinha-lenovo>
 <543751f3-b7c0-b039-64ee-cc902d9b1c80@oracle.com>
 <alpine.DEB.2.22.394.2110230751080.291405@anisinha-lenovo>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2110230751080.291405@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, Eric DeVolder <eric.devolder@oracle.com>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 23, 2021 at 07:52:21AM +0530, Ani Sinha wrote:
> 
> 
> On Fri, 22 Oct 2021, Eric DeVolder wrote:
> 
> > Ani, inline below.
> > eric
> >
> > On 10/22/21 05:18, Ani Sinha wrote:
> > >
> > >
> > > On Fri, 15 Oct 2021, Eric DeVolder wrote:
> > >
> > > > This change exposes ACPI ERST support for x86 guests.
> > > >
> > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > > ---
> > > >   hw/i386/acpi-build.c   | 9 +++++++++
> > > >   hw/i386/acpi-microvm.c | 9 +++++++++
> > > >   include/hw/acpi/erst.h | 5 +++++
> > > >   3 files changed, 23 insertions(+)
> > > >
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index 81418b7..9c2f9d9 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -43,6 +43,7 @@
> > > >   #include "sysemu/tpm.h"
> > > >   #include "hw/acpi/tpm.h"
> > > >   #include "hw/acpi/vmgenid.h"
> > > > +#include "hw/acpi/erst.h"
> > > >   #include "sysemu/tpm_backend.h"
> > > >   #include "hw/rtc/mc146818rtc_regs.h"
> > > >   #include "migration/vmstate.h"
> > > > @@ -2499,6 +2500,7 @@ void acpi_build(AcpiBuildTables *tables,
> > > > MachineState *machine)
> > > >       GArray *tables_blob = tables->table_data;
> > > >       AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
> > > >       Object *vmgenid_dev;
> > > > +    Object *erst_dev;
> > > >       char *oem_id;
> > > >       char *oem_table_id;
> > > >
> > > > @@ -2560,6 +2562,13 @@ void acpi_build(AcpiBuildTables *tables,
> > > > MachineState *machine)
> > > >                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> > > >                       x86ms->oem_table_id);
> > > >
> > > > +    erst_dev = find_erst_dev();
> > > > +    if (erst_dev) {
> > > > +        acpi_add_table(table_offsets, tables_blob);
> > > > +        build_erst(tables_blob, tables->linker, erst_dev,
> > > > +                   x86ms->oem_id, x86ms->oem_table_id);
> > > > +    }
> > > > +
> > >
> > > This needs to be ifdef'd between CONFIG_ERST.
> > ok
> >
> > >
> > >
> > > >       vmgenid_dev = find_vmgenid_dev();
> > > >       if (vmgenid_dev) {
> > > >           acpi_add_table(table_offsets, tables_blob);
> > > > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > >
> > > I do not think we need to include this for microvm machines. They are
> > > supposed to have minimal ACPUI support. So lets not bloat it unless there
> > > is a specific requirement to support ERST on microvms as well.
> > Would it be ok if I ifdef this on CONFIG_ERST also?
> 
> I think we should not touch microvm machine unless you can justify why you
> need ERST support there.

OTOH why not? No idea... CC microvm maintainers and let them decide.

> >
> > >
> > >
> > > > index 196d318..662c8ad 100644
> > > > --- a/hw/i386/acpi-microvm.c
> > > > +++ b/hw/i386/acpi-microvm.c
> > > > @@ -30,6 +30,7 @@
> > > >   #include "hw/acpi/bios-linker-loader.h"
> > > >   #include "hw/acpi/generic_event_device.h"
> > > >   #include "hw/acpi/utils.h"
> > > > +#include "hw/acpi/erst.h"
> > > >   #include "hw/i386/fw_cfg.h"
> > > >   #include "hw/i386/microvm.h"
> > > >   #include "hw/pci/pci.h"
> > > > @@ -158,6 +159,7 @@ static void acpi_build_microvm(AcpiBuildTables
> > > > *tables,
> > > >       X86MachineState *x86ms = X86_MACHINE(mms);
> > > >       GArray *table_offsets;
> > > >       GArray *tables_blob = tables->table_data;
> > > > +    Object *erst_dev;
> > > >       unsigned dsdt, xsdt;
> > > >       AcpiFadtData pmfadt = {
> > > >           /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
> > > > @@ -207,6 +209,13 @@ static void acpi_build_microvm(AcpiBuildTables
> > > > *tables,
> > > >                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> > > >                       x86ms->oem_table_id);
> > > >
> > > > +    erst_dev = find_erst_dev();
> > > > +    if (erst_dev) {
> > > > +        acpi_add_table(table_offsets, tables_blob);
> > > > +        build_erst(tables_blob, tables->linker, erst_dev,
> > > > +                   x86ms->oem_id, x86ms->oem_table_id);
> > > > +    }
> > > > +
> > >
> > >
> > >
> > > >       xsdt = tables_blob->len;
> > > >       build_xsdt(tables_blob, tables->linker, table_offsets,
> > > > x86ms->oem_id,
> > > >                  x86ms->oem_table_id);
> > > > diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
> > > > index 9d63717..b747fe7 100644
> > > > --- a/include/hw/acpi/erst.h
> > > > +++ b/include/hw/acpi/erst.h
> > > > @@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker,
> > > > Object *erst_dev,
> > > >
> > > >   #define TYPE_ACPI_ERST "acpi-erst"
> > > >
> > > > +/* returns NULL unless there is exactly one device */
> > > > +static inline Object *find_erst_dev(void)
> > > > +{
> > > > +    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
> > > > +}
> > > >   #endif
> > > > --
> > > > 1.8.3.1
> > > >
> > > >
> >


