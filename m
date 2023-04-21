Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4E6EA5A5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:16:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplvp-0008TI-0a; Fri, 21 Apr 2023 04:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplvm-0008T2-Ub
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplvk-0005vN-Ta
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682064944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6Dts7TqUmVGZnsy/sAPAITChNouk4lFeN66xZMjkKk=;
 b=W5QPHQlQ/aaFlm6vzxpN3tNo0ZtngZpcBt2mCSP+4ZbQXc0mX/LWODuMcdgcXYPWwURaFC
 gEwJhGXrl5kWXjD4f4KXWtiGMZAu1fOpmz+IjxjAKwyuTKiVSz69qDjP83GIMknmXcSg4F
 le6hGkWV+tegkImXniVtoDQpuxHC0mI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-8dEbqHl9Mje2m0yFNgoCKg-1; Fri, 21 Apr 2023 04:15:42 -0400
X-MC-Unique: 8dEbqHl9Mje2m0yFNgoCKg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f168827701so5742535e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682064942; x=1684656942;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X6Dts7TqUmVGZnsy/sAPAITChNouk4lFeN66xZMjkKk=;
 b=MPtGFX3kge7YDYhlhJrY2nv/9shKJBNwwrooTCoVokPdv1UeALkB+iqgycVhraoxxe
 a/g0Qz35rhx1cUnI4EJConl1szM3WVdJrCNqr9B8qDnJ+kmfa2sUd5yaSbus7WO7iAUX
 XJBpYyoFS92lcDlcR8uqczD8Hwn/NZw34DjCxX08G68OjOaEO8h5AsWtJjKojlkFuQhT
 MvRVDS4/dZ65kJM8RYwLpq/mxHY3DTG6vXBnK1jM7DFgIDpwse7X/8ZepPedmXzhTwLt
 mEUoCSuAUb+gJPwmYh+5qexvyXf1/SgLJVFgTHh+a/ZcwLkfYQBUCPVKJkbuUwozsPWA
 eZLw==
X-Gm-Message-State: AAQBX9ewRIGnwOF5kf6PuCX9/JQdXUqX0qBqVE76wcq5zwFO4s849zzQ
 jREPQvGcF8P64ic6rT4Lu3IFF/tE86dUObMqEd1KE9AfohiYCpL+j3qd/COruvSpXG2kwyU0JP/
 bKsubPERugqXwQ8A=
X-Received: by 2002:a7b:cd83:0:b0:3f1:75ae:1cfe with SMTP id
 y3-20020a7bcd83000000b003f175ae1cfemr1134731wmj.7.1682064941912; 
 Fri, 21 Apr 2023 01:15:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdzlFgzzcV48HGskMSDK2T18gfLcv0EJEixSbx3a0K/gO3h2QGG+A908QUbrT2o8ePaZ6lBg==
X-Received: by 2002:a7b:cd83:0:b0:3f1:75ae:1cfe with SMTP id
 y3-20020a7bcd83000000b003f175ae1cfemr1134706wmj.7.1682064941559; 
 Fri, 21 Apr 2023 01:15:41 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 w9-20020a1cf609000000b003ede06f3178sm4112880wmc.31.2023.04.21.01.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:15:40 -0700 (PDT)
Date: Fri, 21 Apr 2023 04:15:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: Ani Sinha <ani@anisinha.ca>, shannon.zhaosl@gmail.com,
 imammedo@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com,
 MIGUEL_LUIS <miguel.luis@oracle.com>
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230421041524-mutt-send-email-mst@kernel.org>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
 <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
 <b0d86775-f7bc-fe38-c2ae-fc4f53173138@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0d86775-f7bc-fe38-c2ae-fc4f53173138@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Apr 20, 2023 at 09:22:57AM -0500, Eric DeVolder wrote:
> 
> 
> On 4/20/23 03:05, Ani Sinha wrote:
> > On Tue, Apr 18, 2023 at 10:22 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
> > > 
> > > Currently i386 QEMU generates MADT revision 3, and reports
> > > MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> > > 
> > > For MADT revision 4, that introduces ARM GIC structures, which do
> > > not apply to i386.
> > > 
> > > For MADT revision 5, the Local APIC flags introduces the Online
> > > Capable bitfield.
> > > 
> > > Making MADT generate and report revision 5 will solve problems with
> > > CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> > > 
> > > Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > ---
> > >   hw/i386/acpi-common.c | 13 ++++++++++---
> > >   1 file changed, 10 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > > index 52e5c1439a..286c1c5c32 100644
> > > --- a/hw/i386/acpi-common.c
> > > +++ b/hw/i386/acpi-common.c
> > > @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> > >   {
> > >       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> > >       /* Flags – Local APIC Flags */
> > > -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> > > -                     1 /* Enabled */ : 0;
> > > +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> > > +                     true : false;
> > 
> > how about "processor_enabled" instead of just "enabled" as the variable name.
> > 
> > > +    /*
> > > +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> > > +     * if Enabled is set.
> > > +     */
> > > +    bool onlinecapable = enabled ? false : true;
> > 
> > ugh, how about uint32 onlinecapable = enabled? 0x0 : 0x2 ?
> > 
> > > +    uint32_t flags = onlinecapable ? 0x2 : 0x0 | /* Online Capable */
> > > +                     enabled ? 0x1 : 0x0; /* Enabled */
> > 
> > then here, flags = onlinecapable | processor_enabled? 0x1 : 0x0;
> > 
> 
> Colleague Miguel Luis pointed out that this is simpler and equivalent:
> 
> uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 /*
> Enabled */ : 2 /* Online Capable */;
> 
> Is that acceptable?
> eric


Looks ok to me.

> > > 
> > >       /* ACPI spec says that LAPIC entry for non present
> > >        * CPU may be omitted from MADT or it must be marked
> > > @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> > >       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> > >       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> > >       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> > > -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> > > +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
> > >                           .oem_table_id = oem_table_id };
> > > 
> > >       acpi_table_begin(&table, table_data);
> > > --
> > > 2.31.1
> > > 


