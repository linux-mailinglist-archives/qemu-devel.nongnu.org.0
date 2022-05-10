Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E103F520E44
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 09:09:02 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJzS-0000MD-1a
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 03:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1noJuA-00079c-7v
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1noJu8-00036A-BM
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652166211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4IzWBFcZiv4f1A9ctNO7AGwPtpQuCZDI0n2TTwgZtlg=;
 b=HMReT/hNSkK9/gsxpmc4Gsj+PPSuLukFtteiMgUUJub8klOrbZxX1hT+ZBauYyLnZbkBFS
 MoygAV3+DIbwzWe+il6Lhb9U1EzUIMql0yGw8rn4WIF9pTKmOhNlCjbhR+bHM+NapKpUZY
 07q8VxZw4npHOo7sLNllXUKDLuvreOI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-O4a3liSPNKuZ4wf6wBCpSA-1; Tue, 10 May 2022 03:03:29 -0400
X-MC-Unique: O4a3liSPNKuZ4wf6wBCpSA-1
Received: by mail-ed1-f71.google.com with SMTP id
 dk9-20020a0564021d8900b00425a9c3d40cso9634082edb.7
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 00:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IzWBFcZiv4f1A9ctNO7AGwPtpQuCZDI0n2TTwgZtlg=;
 b=vgHnk5xGtUzJfgvN5u+OzY9ksJ6WuI+SSjwEambwSUgGJsCPs5Sv3MWevTx4M//t8I
 DOjICcxCxZV0YSppEQvQFMm/IqAhi1vkprY5BMwXkIfB67JixPVImVo23plz8UodH5rk
 O/BtaaFFix4RvpAuQ3XPBIt/t5chqot3HJhlEaBN7Y5ulqbaLirA9nrCm678ADrr1Zif
 6hUhMimZZ+UrS8jwrOj6fkcVQMzFiGLlUL59JzIBQU6rj9ch51ZYYdvpQYaaNmOJ5Y0/
 ya8Bbuu9DQxflpzvAU+lNAf707v5qZUJC38YTYQc2tq9lhA1faC0fjKMSmwuo8vE7IaH
 KzMQ==
X-Gm-Message-State: AOAM530NRw61y5G1caV4Ilz0sES1KaKg/8vWPzCptnShay+OfGS80mc+
 xXkHtipJd6FyYsHddF189XgtaZgBR9VzFRQU7zLrnB2ZHY4zqU/a/j7IO01ZEZTpDb1swXtXNHD
 71tZZih288AkDi84=
X-Received: by 2002:a05:6402:b4d:b0:425:ec4a:a37e with SMTP id
 bx13-20020a0564020b4d00b00425ec4aa37emr21357812edb.292.1652166208751; 
 Tue, 10 May 2022 00:03:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoQCtHvEH3UwEL/oXa9FUh1r0NJF6sXDRI6f8vEHUBSukIQOxYjmMK7lVz/T+cqnSs001pXg==
X-Received: by 2002:a05:6402:b4d:b0:425:ec4a:a37e with SMTP id
 bx13-20020a0564020b4d00b00425ec4aa37emr21357791edb.292.1652166208523; 
 Tue, 10 May 2022 00:03:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 em21-20020a170907289500b006f3ef214e19sm5845086ejc.127.2022.05.10.00.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 00:03:27 -0700 (PDT)
Date: Tue, 10 May 2022 09:03:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, mst@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 jon.grimm@amd.com
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <20220510090325.2781238a@redhat.com>
In-Reply-To: <YnkDGsIi1vFvXmiP@redhat.com>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com> <YnkDGsIi1vFvXmiP@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 May 2022 13:03:38 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:
> > On Wed, 4 May 2022 08:16:39 -0500
> > Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:
> >  =20
> > > This is the maximum number of vCPU supported by
> > > the AMD x2APIC virtualization.
> > >=20
> > > Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> > > ---
> > >  hw/i386/pc_q35.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > index 302288342a..e82b1c690d 100644
> > > --- a/hw/i386/pc_q35.c
> > > +++ b/hw/i386/pc_q35.c
> > > @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *=
m)
> > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVIC=
E);
> > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> > > -    m->max_cpus =3D 288;
> > > +    m->max_cpus =3D 512; =20
> >=20
> > Maybe we should bump it to KVM VCPU maximum,
> > and make sure we error out if asked for combination of
> > hardware/irqchip is not usable. =20
>=20
> In RHEL downstream we currently bump this to 710 CPUs, because you
> overflow the SMBIOS 2.1 tables at approx 720 CPUs (give/take a little
> depending on other config options).

Also there were some testing done with 1024,
but my main reason for matching KVM's limit is unblock upstream
testing so it would be easier to push limits for others.
Downstream can clamp that value down to whatever it deems as supported.

> Going beyond 710 CPUs value requires using the SMBIOS 3 entry point.
>=20
> AFAIK, the x86 machine types still default to SMBIOS 2.1, so that
> would need changing too.

Yep, we can change default to SMBIOS 3 starting with new machine type (7.1?)
or conditionally depending on requested number of CPUs,
though I'd prefer machine type approach.

As for SMBIOS 3, we still have to update CPU structures to support more than
255 vcpus (Julia was working on it). It's long standing bug, but that doesn=
't
seem to be critical, as guest boots fine with old structures.

Other than that I don't recall any outright bugs related to large number of=
 VCPUs.

> With regards,
> Daniel


