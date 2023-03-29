Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4C6CEFF8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:57:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZ5g-0003Sr-8H; Wed, 29 Mar 2023 12:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phZ5c-0003SW-OL
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phZ5a-0001zY-Ii
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680108957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CKIEZQy8poSRwuqCLaqwW2a1LiKk5FSNOWDECIAAxg=;
 b=UtP+arj6vHpNJXSvksOPxvYT4mkBWDnojzJhNvGWu5COLsvGK1xfQboXHwuLb0faz7B3zV
 AHfIpTFcBH1WbG64RedQabNPRceJJUFs25Vky4KKgf/EzVZzEcXArVVweEpfcgufKzWtrM
 JqK+/2oD/Cdo4GnPrZfm9rv6gTHc3vU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-cinz3aI2OZmE9-28BU6n4A-1; Wed, 29 Mar 2023 12:55:55 -0400
X-MC-Unique: cinz3aI2OZmE9-28BU6n4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 iv10-20020a05600c548a00b003ee112e6df1so8422730wmb.2
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680108954;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CKIEZQy8poSRwuqCLaqwW2a1LiKk5FSNOWDECIAAxg=;
 b=39kk4RDO7eb9XIVHl8qhzWecG10MRezi7fbCa9j7/R9d7qzF7N1qQH/Byz5lwfb6T4
 oX752uOqlJm2W5CdbAFlxahfqsMqAiTBzU9MOP4pEmvSV10zd37TJpqY9bXAopOIMQ7V
 I3d7OEvTTD9ySCF4ABlBlmtRLXYl0gPkpTTIJamflugtQSLJ9dK7vNGVp0/PxxzB8REH
 59D11Bbii0zv0oNRslgGo77YIOp1vWYkfeM7vjdmbodoH3A8kwDQYjuoQzCNq9LMioe1
 yYutNNZx9HnMwN+d1CZarUMDIiWlfQHS5OvsuZUKTnhibrqEd1BIEFJxwVx6e1IuAP2B
 boFQ==
X-Gm-Message-State: AAQBX9fxHTkkiNViQJzTt7zMCwEqokzLCl29gST0FNjDKYpbPLVpEt9k
 bYQ9MfVT3vt5kGsGAbqXMRbiuxBY7Y0a3opVKyNOeeY0rtzUVtwIV6kCcKiqkk6k9ZYNa/Jr84b
 5WYj9yZIG72a7c4A=
X-Received: by 2002:adf:db4b:0:b0:2d9:eb77:90d2 with SMTP id
 f11-20020adfdb4b000000b002d9eb7790d2mr14829273wrj.70.1680108954622; 
 Wed, 29 Mar 2023 09:55:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350bNBwmWgzNn8ZrpkYFdgtNLkZrVZYanVEHa/2l9mYW8ZMv7/QoS68X/wiZ1SxE1hsvcFcv0zQ==
X-Received: by 2002:adf:db4b:0:b0:2d9:eb77:90d2 with SMTP id
 f11-20020adfdb4b000000b002d9eb7790d2mr14829264wrj.70.1680108954299; 
 Wed, 29 Mar 2023 09:55:54 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b002d97529b3bbsm20353314wrm.96.2023.03.29.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 09:55:53 -0700 (PDT)
Date: Wed, 29 Mar 2023 12:55:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230329125543-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230329010126-mutt-send-email-mst@kernel.org>
 <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
 <5ff9199b-0149-45dc-6138-3ad9b2d71fd3@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ff9199b-0149-45dc-6138-3ad9b2d71fd3@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Mar 29, 2023 at 08:19:22AM -0500, Eric DeVolder wrote:
> 
> 
> On 3/29/23 08:16, Eric DeVolder wrote:
> > 
> > 
> > On 3/29/23 00:03, Michael S. Tsirkin wrote:
> > > On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:
> > > > Currently i386 QEMU generates MADT revision 3, and reports
> > > > MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> > > > 
> > > > For MADT revision 4, that introduces ARM GIC structures, which do
> > > > not apply to i386.
> > > > 
> > > > For MADT revision 5, the Local APIC flags introduces the Online
> > > > Capable bitfield.
> > > > 
> > > > Making MADT generate and report revision 5 will solve problems with
> > > > CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> > > > 
> > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > 
> > > I am looking for ways to reduce risk of breakage with this.
> > > We don't currently have a reason to change it if cpu
> > > hotplug is off, do we? Maybe make it conditional on that.
> > 
> > By "cpu hotplug off", do you mean, for example, no maxcpus= option?
> > In other words, how should I detect "cpu hotplug off"?
> > eric
> > 
> 
> Actually, if, for example, one had -smp 30,maxcpus=32, then there would be
> two hotpluggable cpus reported, the last two with the Enabled=0 and Online
> Capable=1. If one had -smp 32 (ie "cpu hotplug off"), then all cpus would be
> reported as Enabled and no cpu would have its Online Capable flag set.
> 
> Granted in both cases, MADT.revision would report 5, but it would still be accurate.
> 
> eric

sounds good.

> > > 
> > > 
> > > 
> > > 
> > > 
> > > > ---
> > > >   hw/i386/acpi-common.c | 13 ++++++++++---
> > > >   1 file changed, 10 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > > > index 52e5c1439a..1e3a13a36c 100644
> > > > --- a/hw/i386/acpi-common.c
> > > > +++ b/hw/i386/acpi-common.c
> > > > @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> > > >   {
> > > >       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> > > >       /* Flags – Local APIC Flags */
> > > > -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> > > > -                     1 /* Enabled */ : 0;
> > > > +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> > > > +                     true /* Enabled */ : false;
> > > > +    /*
> > > > +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> > > > +     * if Enabled is set.
> > > > +     */
> > > > +    bool onlinecapable = enabled ? false : true; /* Online Capable */
> > > > +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
> > > > +        enabled ? 0x1 : 0x0;
> > > >       /* ACPI spec says that LAPIC entry for non present
> > > >        * CPU may be omitted from MADT or it must be marked
> > > > @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> > > >       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> > > >       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> > > >       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> > > > -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> > > > +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
> > > >                           .oem_table_id = oem_table_id };
> > > >       acpi_table_begin(&table, table_data);
> > > > -- 
> > > > 2.31.1
> > > > 
> > > > 
> > > > 
> > > 


