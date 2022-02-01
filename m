Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AEF4A68CB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:50:51 +0100 (CET)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2vD-0000CE-32
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:50:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nF1w9-0004w5-Bu
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 17:47:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nF1w6-0006zA-CB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 17:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643755661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyQLE5iBOgw+3iJTr/G4tGBHsm7c/9IWiOfbB8wAAm0=;
 b=NfeItd1ixj472oNINqcuw8oZeKH9YGBk5F/a+20GbL6Ush3I8aoE47M9dGZU+5VQzSjDZv
 Lyk1MudKoopetq8NDwhrhkB1a2wiaVUm4FxuWjaYRGJW3f8acRru9QzkVmF5DUEjeSAa3Z
 0FjxkTelCss2EPsQutRSaK/V5EK8E6I=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-jOOVD9alNIWzNZuv5iOIQw-1; Tue, 01 Feb 2022 17:47:39 -0500
X-MC-Unique: jOOVD9alNIWzNZuv5iOIQw-1
Received: by mail-oo1-f70.google.com with SMTP id
 g2-20020a4a9242000000b002da7c459222so7432714ooh.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 14:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d72MrYv09PILl7KPr7je2QpmBjoixpUx9cdJcZmkFFg=;
 b=7+yJ97BjK6q/xvpMLc9zS7pQF4GDgiqXXdJDBje8aSMULGFhNt9HymgyZh72xFsx7B
 zQ0nw6rB11Yjf6Pn22t3W8LRL1tbN/F0ijdVFwVkBCX5ZFgKBbLhlkPqIDeAs6HNnLeg
 IfDD4ZfTUGZk8MjrXOAP5bgvsR+ubW3QK8N2akZigzu2CH+RTy/uzXnf262PZtxtKpXr
 /iRSpH6YE+JQA//Es53paC6684FRW1Fvj/mmcupVs2XWKsr6ydvYAQAMPqg3bvKaS1VN
 izch704naTk4mXkQ0Ek6XK7zKt4d2rDC7sw1wNpO1Ipp7BZwhSaE2PHJ5w9uji6LJ1NM
 nzuw==
X-Gm-Message-State: AOAM532dKHuioSCDgwVfo0BsalyyUAWEghNW7KWg74HoxaJul64ANDi7
 1sO1FpCtOEHrVXVbuUa+q7bClzgC/50fcY295IxENYdD8xm6OhBP3616eC6GgSKmHkwV19JKyy2
 P/yR1mYi3fsH/GcY=
X-Received: by 2002:a9d:628e:: with SMTP id x14mr15501594otk.38.1643755658599; 
 Tue, 01 Feb 2022 14:47:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy76WB282q1+U8gTZDJHDtrgXs/vnIR1v6cXsCiq3ZZApGjOkPKvyTHPdf52JxDUo8WDGYBNg==
X-Received: by 2002:a9d:628e:: with SMTP id x14mr15501579otk.38.1643755657961; 
 Tue, 01 Feb 2022 14:47:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id k10sm16330564oou.26.2022.02.01.14.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 14:47:37 -0800 (PST)
Date: Tue, 1 Feb 2022 15:47:36 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220201154736.576e2a7e.alex.williamson@redhat.com>
In-Reply-To: <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
References: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 21:24:08 +0000
Jag Raman <jag.raman@oracle.com> wrote:

> > On Feb 1, 2022, at 10:24 AM, Alex Williamson <alex.williamson@redhat.co=
m> wrote:
> >=20
> > On Tue, 1 Feb 2022 09:30:35 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >  =20
> >> On Mon, Jan 31, 2022 at 09:16:23AM -0700, Alex Williamson wrote: =20
> >>> On Fri, 28 Jan 2022 09:18:08 +0000
> >>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>>  =20
> >>>> On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:   =
=20
> >>>>> If the goal here is to restrict DMA between devices, ie. peer-to-pe=
er
> >>>>> (p2p), why are we trying to re-invent what an IOMMU already does?  =
   =20
> >>>>=20
> >>>> The issue Dave raised is that vfio-user servers run in separate
> >>>> processses from QEMU with shared memory access to RAM but no direct
> >>>> access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is one
> >>>> example of a non-RAM MemoryRegion that can be the source/target of D=
MA
> >>>> requests.
> >>>>=20
> >>>> I don't think IOMMUs solve this problem but luckily the vfio-user
> >>>> protocol already has messages that vfio-user servers can use as a
> >>>> fallback when DMA cannot be completed through the shared memory RAM
> >>>> accesses.
> >>>>  =20
> >>>>> In
> >>>>> fact, it seems like an IOMMU does this better in providing an IOVA
> >>>>> address space per BDF.  Is the dynamic mapping overhead too much?  =
What
> >>>>> physical hardware properties or specifications could we leverage to
> >>>>> restrict p2p mappings to a device?  Should it be governed by machin=
e
> >>>>> type to provide consistency between devices?  Should each "isolated=
"
> >>>>> bus be in a separate root complex?  Thanks,     =20
> >>>>=20
> >>>> There is a separate issue in this patch series regarding isolating t=
he
> >>>> address space where BAR accesses are made (i.e. the global
> >>>> address_space_memory/io). When one process hosts multiple vfio-user
> >>>> server instances (e.g. a software-defined network switch with multip=
le
> >>>> ethernet devices) then each instance needs isolated memory and io ad=
dress
> >>>> spaces so that vfio-user clients don't cause collisions when they ma=
p
> >>>> BARs to the same address.
> >>>>=20
> >>>> I think the the separate root complex idea is a good solution. This
> >>>> patch series takes a different approach by adding the concept of
> >>>> isolated address spaces into hw/pci/.   =20
> >>>=20
> >>> This all still seems pretty sketchy, BARs cannot overlap within the
> >>> same vCPU address space, perhaps with the exception of when they're
> >>> being sized, but DMA should be disabled during sizing.
> >>>=20
> >>> Devices within the same VM context with identical BARs would need to
> >>> operate in different address spaces.  For example a translation offse=
t
> >>> in the vCPU address space would allow unique addressing to the device=
s,
> >>> perhaps using the translation offset bits to address a root complex a=
nd
> >>> masking those bits for downstream transactions.
> >>>=20
> >>> In general, the device simply operates in an address space, ie. an
> >>> IOVA.  When a mapping is made within that address space, we perform a
> >>> translation as necessary to generate a guest physical address.  The
> >>> IOVA itself is only meaningful within the context of the address spac=
e,
> >>> there is no requirement or expectation for it to be globally unique.
> >>>=20
> >>> If the vfio-user server is making some sort of requirement that IOVAs
> >>> are unique across all devices, that seems very, very wrong.  Thanks, =
  =20
> >>=20
> >> Yes, BARs and IOVAs don't need to be unique across all devices.
> >>=20
> >> The issue is that there can be as many guest physical address spaces a=
s
> >> there are vfio-user clients connected, so per-client isolated address
> >> spaces are required. This patch series has a solution to that problem
> >> with the new pci_isol_as_mem/io() API. =20
> >=20
> > Sorry, this still doesn't follow for me.  A server that hosts multiple
> > devices across many VMs (I'm not sure if you're referring to the device
> > or the VM as a client) needs to deal with different address spaces per
> > device.  The server needs to be able to uniquely identify every DMA,
> > which must be part of the interface protocol.  But I don't see how that
> > imposes a requirement of an isolated address space.  If we want the
> > device isolated because we don't trust the server, that's where an IOMM=
U
> > provides per device isolation.  What is the restriction of the
> > per-client isolated address space and why do we need it?  The server
> > needing to support multiple clients is not a sufficient answer to
> > impose new PCI bus types with an implicit restriction on the VM. =20
>=20
> Hi Alex,
>=20
> I believe there are two separate problems with running PCI devices in
> the vfio-user server. The first one is concerning memory isolation and
> second one is vectoring of BAR accesses (as explained below).
>=20
> In our previous patches (v3), we used an IOMMU to isolate memory
> spaces. But we still had trouble with the vectoring. So we implemented
> separate address spaces for each PCIBus to tackle both problems
> simultaneously, based on the feedback we got.
>=20
> The following gives an overview of issues concerning vectoring of
> BAR accesses.
>=20
> The device=E2=80=99s BAR regions are mapped into the guest physical addre=
ss
> space. The guest writes the guest PA of each BAR into the device=E2=80=99=
s BAR
> registers. To access the BAR regions of the device, QEMU uses
> address_space_rw() which vectors the physical address access to the
> device BAR region handlers.

The guest physical address written to the BAR is irrelevant from the
device perspective, this only serves to assign the BAR an offset within
the address_space_mem, which is used by the vCPU (and possibly other
devices depending on their address space).  There is no reason for the
device itself to care about this address.
=20
> The PCIBus data structure already has address_space_mem and
> address_space_io to contain the BAR regions of devices attached
> to it. I understand that these two PCIBus members form the
> PCI address space.

These are the CPU address spaces.  When there's no IOMMU, the PCI bus is
identity mapped to the CPU address space.  When there is an IOMMU, the
device address space is determined by the granularity of the IOMMU and
may be entirely separate from address_space_mem.

I/O port space is always the identity mapped CPU address space unless
sparse translations are used to create multiple I/O port spaces (not
implemented).  I/O port space is only accessed by the CPU, there are no
device initiated I/O port transactions, so the address space relative
to the device is irrelevant.

> Typically, the machines map the PCI address space into the system address
> space. For example, pc_pci_as_mapping_init() does this for =E2=80=98pc' m=
achine types.
> As such, there is a 1:1 mapping between system address space and PCI addr=
ess
> space of the root bus. Since all the PCI devices in the machine are assig=
ned to
> the same VM, we could map the PCI address space of all PCI buses to the s=
ame
> system address space.

"Typically" only if we're restricted to the "pc", ie. i440FX, machine
type since it doesn't support a vIOMMU.  There's no reason to focus on
the identity map case versus the vIOMMU case.

> Whereas in the case of vfio-user, the devices running in the server could
> belong to different VMs. Therefore, along with the physical address, we w=
ould
> need to know the address space that the device belongs for
> address_space_rw() to successfully vector BAR accesses into the PCI devic=
e.

But as far as device initiated transactions, there is only one address
space for a given device, it's either address_space_mem or one provided
by the vIOMMU and pci_device_iommu_address_space() tells us that
address space.  Furthermore, the device never operates on a "physical
address", it only ever operates on an IOVA, ie. an offset within the
address space assigned to the device.  The IOVA should be considered
arbitrary relative to mappings in any other address spaces.

Device initiated transactions operate on an IOVA within the (single)
address space to which the device is assigned.  Any attempt to do
otherwise violates the isolation put in place by things like vIOMMUs
and ought to be considered a security concern, especially for a device
serviced by an external process.  Thanks,

Alex


