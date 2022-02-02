Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCD4A6B86
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 06:37:56 +0100 (CET)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF8L5-0003rR-AU
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 00:37:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nF8I4-0002jF-0x
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 00:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nF8Hw-0000LJ-Re
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 00:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643780079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McAKJa4M6v/PGwr4f2olzv7TJIvgyHgdgfdzj92jF+Q=;
 b=Eu957uhrQwK4QrRUmCKuiASb/VQsL1gOOoat5ecm8erMdjmLV5+H3FMa4UuCCcnqmDBCCB
 qsov+xNpZWXwRNRN7qLO5pAWzXJYvSCvPTBlGmihUGHgPalwZgAAalbYkGLWM2h1y45R8u
 DyZMxRL4GeJa2wDthdlNbXQI48el6mI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-1bW_m_upOquWldaulJ4IMA-1; Wed, 02 Feb 2022 00:34:36 -0500
X-MC-Unique: 1bW_m_upOquWldaulJ4IMA-1
Received: by mail-oo1-f69.google.com with SMTP id
 h19-20020a4a6f13000000b002e3c2ae2affso7933140ooc.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 21:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=g3+tJsC2fnFswen92NTwnnWCZ2DFMdtgqY6Emlp5tcA=;
 b=xnkzqy0ALNbRgyZxv+B9/ltGW6iWKCUvI4xnciF9dWY7DzdUEW9WPwiZE4qcsjdIZw
 xFXe9cWYaC09AL5htgYmO0ipE6mYSFYZEtZk73FUpcRWjySjUdvPnJMfjXAatg24EI4f
 /0jIDi6ZX0xZPu8nOyESznvo6g8v5uF2BZ0CWNFnervlFpjKOIS9ICS2E/3CpgVUIHCa
 uD9bABs6EriqplpQIB69Sr3QejvJELXPSIk2OwnaxYd09cuRn1bVGLTcj3CuD+CPWEiQ
 Tckc/6pbnqRRASrPIxmf6c6K7dr0xY5WGZItbDf8V8ZKtUc3Y82CnNDz58pf1sNgpTiL
 oIKQ==
X-Gm-Message-State: AOAM531vAjGaaLQ0YjQAmHtLJNrx3SAj14SAGf2L0nu+GY497s5sQnmL
 g4V/jTVS1+H5u8RX+EtDhTUwzAvl8wPJfNfv8XlgzP9XTgw3BFaCcg5DbkOK1i3P8eca0tfNKuh
 tzUXlh/5ePfIm/WQ=
X-Received: by 2002:a05:6808:1183:: with SMTP id
 j3mr3643556oil.258.1643780075202; 
 Tue, 01 Feb 2022 21:34:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWZPjLhDaHlWPeW103Ei8ltXymJS0wyYsvh6Ce8p8LSSZUG07wMrx00PM1qH853mDnXHUoUQ==
X-Received: by 2002:a05:6808:1183:: with SMTP id
 j3mr3643539oil.258.1643780074877; 
 Tue, 01 Feb 2022 21:34:34 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id q11sm17390469otl.8.2022.02.01.21.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 21:34:34 -0800 (PST)
Date: Tue, 1 Feb 2022 22:34:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220201223432.4f58518f.alex.williamson@redhat.com>
In-Reply-To: <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
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
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
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

On Wed, 2 Feb 2022 01:13:22 +0000
Jag Raman <jag.raman@oracle.com> wrote:

> > On Feb 1, 2022, at 5:47 PM, Alex Williamson <alex.williamson@redhat.com=
> wrote:
> >=20
> > On Tue, 1 Feb 2022 21:24:08 +0000
> > Jag Raman <jag.raman@oracle.com> wrote:
> >  =20
> >>> On Feb 1, 2022, at 10:24 AM, Alex Williamson <alex.williamson@redhat.=
com> wrote:
> >>>=20
> >>> On Tue, 1 Feb 2022 09:30:35 +0000
> >>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>>  =20
> >>>> On Mon, Jan 31, 2022 at 09:16:23AM -0700, Alex Williamson wrote:   =
=20
> >>>>> On Fri, 28 Jan 2022 09:18:08 +0000
> >>>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>>>>  =20
> >>>>>> On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:  =
   =20
> >>>>>>> If the goal here is to restrict DMA between devices, ie. peer-to-=
peer
> >>>>>>> (p2p), why are we trying to re-invent what an IOMMU already does?=
       =20
> >>>>>>=20
> >>>>>> The issue Dave raised is that vfio-user servers run in separate
> >>>>>> processses from QEMU with shared memory access to RAM but no direc=
t
> >>>>>> access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is on=
e
> >>>>>> example of a non-RAM MemoryRegion that can be the source/target of=
 DMA
> >>>>>> requests.
> >>>>>>=20
> >>>>>> I don't think IOMMUs solve this problem but luckily the vfio-user
> >>>>>> protocol already has messages that vfio-user servers can use as a
> >>>>>> fallback when DMA cannot be completed through the shared memory RA=
M
> >>>>>> accesses.
> >>>>>>  =20
> >>>>>>> In
> >>>>>>> fact, it seems like an IOMMU does this better in providing an IOV=
A
> >>>>>>> address space per BDF.  Is the dynamic mapping overhead too much?=
  What
> >>>>>>> physical hardware properties or specifications could we leverage =
to
> >>>>>>> restrict p2p mappings to a device?  Should it be governed by mach=
ine
> >>>>>>> type to provide consistency between devices?  Should each "isolat=
ed"
> >>>>>>> bus be in a separate root complex?  Thanks,       =20
> >>>>>>=20
> >>>>>> There is a separate issue in this patch series regarding isolating=
 the
> >>>>>> address space where BAR accesses are made (i.e. the global
> >>>>>> address_space_memory/io). When one process hosts multiple vfio-use=
r
> >>>>>> server instances (e.g. a software-defined network switch with mult=
iple
> >>>>>> ethernet devices) then each instance needs isolated memory and io =
address
> >>>>>> spaces so that vfio-user clients don't cause collisions when they =
map
> >>>>>> BARs to the same address.
> >>>>>>=20
> >>>>>> I think the the separate root complex idea is a good solution. Thi=
s
> >>>>>> patch series takes a different approach by adding the concept of
> >>>>>> isolated address spaces into hw/pci/.     =20
> >>>>>=20
> >>>>> This all still seems pretty sketchy, BARs cannot overlap within the
> >>>>> same vCPU address space, perhaps with the exception of when they're
> >>>>> being sized, but DMA should be disabled during sizing.
> >>>>>=20
> >>>>> Devices within the same VM context with identical BARs would need t=
o
> >>>>> operate in different address spaces.  For example a translation off=
set
> >>>>> in the vCPU address space would allow unique addressing to the devi=
ces,
> >>>>> perhaps using the translation offset bits to address a root complex=
 and
> >>>>> masking those bits for downstream transactions.
> >>>>>=20
> >>>>> In general, the device simply operates in an address space, ie. an
> >>>>> IOVA.  When a mapping is made within that address space, we perform=
 a
> >>>>> translation as necessary to generate a guest physical address.  The
> >>>>> IOVA itself is only meaningful within the context of the address sp=
ace,
> >>>>> there is no requirement or expectation for it to be globally unique=
.
> >>>>>=20
> >>>>> If the vfio-user server is making some sort of requirement that IOV=
As
> >>>>> are unique across all devices, that seems very, very wrong.  Thanks=
,     =20
> >>>>=20
> >>>> Yes, BARs and IOVAs don't need to be unique across all devices.
> >>>>=20
> >>>> The issue is that there can be as many guest physical address spaces=
 as
> >>>> there are vfio-user clients connected, so per-client isolated addres=
s
> >>>> spaces are required. This patch series has a solution to that proble=
m
> >>>> with the new pci_isol_as_mem/io() API.   =20
> >>>=20
> >>> Sorry, this still doesn't follow for me.  A server that hosts multipl=
e
> >>> devices across many VMs (I'm not sure if you're referring to the devi=
ce
> >>> or the VM as a client) needs to deal with different address spaces pe=
r
> >>> device.  The server needs to be able to uniquely identify every DMA,
> >>> which must be part of the interface protocol.  But I don't see how th=
at
> >>> imposes a requirement of an isolated address space.  If we want the
> >>> device isolated because we don't trust the server, that's where an IO=
MMU
> >>> provides per device isolation.  What is the restriction of the
> >>> per-client isolated address space and why do we need it?  The server
> >>> needing to support multiple clients is not a sufficient answer to
> >>> impose new PCI bus types with an implicit restriction on the VM.   =
=20
> >>=20
> >> Hi Alex,
> >>=20
> >> I believe there are two separate problems with running PCI devices in
> >> the vfio-user server. The first one is concerning memory isolation and
> >> second one is vectoring of BAR accesses (as explained below).
> >>=20
> >> In our previous patches (v3), we used an IOMMU to isolate memory
> >> spaces. But we still had trouble with the vectoring. So we implemented
> >> separate address spaces for each PCIBus to tackle both problems
> >> simultaneously, based on the feedback we got.
> >>=20
> >> The following gives an overview of issues concerning vectoring of
> >> BAR accesses.
> >>=20
> >> The device=E2=80=99s BAR regions are mapped into the guest physical ad=
dress
> >> space. The guest writes the guest PA of each BAR into the device=E2=80=
=99s BAR
> >> registers. To access the BAR regions of the device, QEMU uses
> >> address_space_rw() which vectors the physical address access to the
> >> device BAR region handlers. =20
> >=20
> > The guest physical address written to the BAR is irrelevant from the
> > device perspective, this only serves to assign the BAR an offset within
> > the address_space_mem, which is used by the vCPU (and possibly other
> > devices depending on their address space).  There is no reason for the
> > device itself to care about this address. =20
>=20
> Thank you for the explanation, Alex!
>=20
> The confusion at my part is whether we are inside the device already when
> the server receives a request to access BAR region of a device. Based on
> your explanation, I get that your view is the BAR access request has
> propagated into the device already, whereas I was under the impression
> that the request is still on the CPU side of the PCI root complex.

If you are getting an access through your MemoryRegionOps, all the
translations have been made, you simply need to use the hwaddr as the
offset into the MemoryRegion for the access.  Perform the read/write to
your device, no further translations required.
=20
> Your view makes sense to me - once the BAR access request reaches the
> client (on the other side), we could consider that the request has reache=
d
> the device.
>=20
> On a separate note, if devices don=E2=80=99t care about the values in BAR
> registers, why do the default PCI config handlers intercept and map
> the BAR region into address_space_mem?
> (pci_default_write_config() -> pci_update_mappings())

This is the part that's actually placing the BAR MemoryRegion as a
sub-region into the vCPU address space.  I think if you track it,
you'll see PCIDevice.io_regions[i].address_space is actually
system_memory, which is used to initialize address_space_system.

The machine assembles PCI devices onto buses as instructed by the
command line or hot plug operations.  It's the responsibility of the
guest firmware and guest OS to probe those devices, size the BARs, and
place the BARs into the memory hierarchy of the PCI bus, ie. system
memory.  The BARs are necessarily in the "guest physical memory" for
vCPU access, but it's essentially only coincidental that PCI devices
might be in an address space that provides a mapping to their own BAR.
There's no reason to ever use it.

In the vIOMMU case, we can't know that the device address space
includes those BAR mappings or if they do, that they're identity mapped
to the physical address.  Devices really need to not infer anything
about an address.  Think about real hardware, a device is told by
driver programming to perform a DMA operation.  The device doesn't know
the target of that operation, it's the guest driver's responsibility to
make sure the IOVA within the device address space is valid and maps to
the desired target.  Thanks,

Alex


