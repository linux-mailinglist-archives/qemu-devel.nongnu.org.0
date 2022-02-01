Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C74A61FF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:12:41 +0100 (CET)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwhp-0001Ua-FJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nEv1R-0003t5-Gv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nEv1P-0004Yn-5Q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643729082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J234qSNQJTN4WRTo2PGV3irO3afg6rv+R4eKW5UeSqI=;
 b=PonPwYpYlWOQPWlYinHDNUw+tIkg7/ey5OpH7pM7X10XNBWw2pFyH8MwJaG6t9Kh4S71X1
 Lo8UhO6x3rUHxFSec7EGgJWhZjxd/3JB9ShpgA6I3LiKGTtJ6FDjpsm9oppENOrXk5kT9k
 vZfzZwgxynZkKYKUxfBi49lxxFLIqgo=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-hSgSb1ZGP2--04u8tKWvHA-1; Tue, 01 Feb 2022 10:24:41 -0500
X-MC-Unique: hSgSb1ZGP2--04u8tKWvHA-1
Received: by mail-ot1-f70.google.com with SMTP id
 l47-20020a9d1caf000000b005a4713c5ef5so4975391ota.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 07:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J234qSNQJTN4WRTo2PGV3irO3afg6rv+R4eKW5UeSqI=;
 b=EptWee8E2SaiBWw70xP/WkrrQQr6XWCtiTekjHM9tPneFvnqa44y1i6aNPEPKW9A2m
 kVfHpz47Swj4pVLGwS78t+kgWihfsQkd1bsJgmFA7FwdVPUABYB5vMgPDKLqXxxqDF8o
 HJT/aqsNsWviAe4Cp75NEBEdx68KydrWCqow09sP5JZjB5eayyEOZVHYsw9zd2KWa2Pt
 WJtRVj6fRnIyF1EqiBBhlMkvOjO7c/3cpGEVq6+rteNDlBHzxH1e8qKaBgtlmOZmV5ql
 vK1WiM9DCmkQjVGe/KdZodbvbl2H394vh2ff7yPjKQnOgSkCscQTkC50H+uhXlSlVsz4
 B84A==
X-Gm-Message-State: AOAM533D/ygFuR8Thb5VO4hSmVTHECGf0onmtjWTUq8qCmPlvjKwnFyn
 sCTFsCPFqCXsg82O/TdjIb20pmNAZGYGZql5sDaqYO0qF3rnXjf60WZpUEPhEFEC6pc1KBA9aFt
 zlq6L7b8H6ihonGQ=
X-Received: by 2002:a05:6808:1452:: with SMTP id
 x18mr1548698oiv.207.1643729080978; 
 Tue, 01 Feb 2022 07:24:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrtWBAOD9Gwy40BqjMvMeURSFFCNM2FbWhlUW1/MpH59BzUA+rvld8hizgmYuFcQB/p2xL4w==
X-Received: by 2002:a05:6808:1452:: with SMTP id
 x18mr1548670oiv.207.1643729080714; 
 Tue, 01 Feb 2022 07:24:40 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id c29sm10480166otk.16.2022.02.01.07.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:24:40 -0800 (PST)
Date: Tue, 1 Feb 2022 08:24:37 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220201082437.7dd940eb.alex.williamson@redhat.com>
In-Reply-To: <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
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
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, "Daniel
 P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 09:30:35 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Jan 31, 2022 at 09:16:23AM -0700, Alex Williamson wrote:
> > On Fri, 28 Jan 2022 09:18:08 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >   
> > > On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:  
> > > > If the goal here is to restrict DMA between devices, ie. peer-to-peer
> > > > (p2p), why are we trying to re-invent what an IOMMU already does?    
> > > 
> > > The issue Dave raised is that vfio-user servers run in separate
> > > processses from QEMU with shared memory access to RAM but no direct
> > > access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is one
> > > example of a non-RAM MemoryRegion that can be the source/target of DMA
> > > requests.
> > > 
> > > I don't think IOMMUs solve this problem but luckily the vfio-user
> > > protocol already has messages that vfio-user servers can use as a
> > > fallback when DMA cannot be completed through the shared memory RAM
> > > accesses.
> > >   
> > > > In
> > > > fact, it seems like an IOMMU does this better in providing an IOVA
> > > > address space per BDF.  Is the dynamic mapping overhead too much?  What
> > > > physical hardware properties or specifications could we leverage to
> > > > restrict p2p mappings to a device?  Should it be governed by machine
> > > > type to provide consistency between devices?  Should each "isolated"
> > > > bus be in a separate root complex?  Thanks,    
> > > 
> > > There is a separate issue in this patch series regarding isolating the
> > > address space where BAR accesses are made (i.e. the global
> > > address_space_memory/io). When one process hosts multiple vfio-user
> > > server instances (e.g. a software-defined network switch with multiple
> > > ethernet devices) then each instance needs isolated memory and io address
> > > spaces so that vfio-user clients don't cause collisions when they map
> > > BARs to the same address.
> > > 
> > > I think the the separate root complex idea is a good solution. This
> > > patch series takes a different approach by adding the concept of
> > > isolated address spaces into hw/pci/.  
> > 
> > This all still seems pretty sketchy, BARs cannot overlap within the
> > same vCPU address space, perhaps with the exception of when they're
> > being sized, but DMA should be disabled during sizing.
> > 
> > Devices within the same VM context with identical BARs would need to
> > operate in different address spaces.  For example a translation offset
> > in the vCPU address space would allow unique addressing to the devices,
> > perhaps using the translation offset bits to address a root complex and
> > masking those bits for downstream transactions.
> > 
> > In general, the device simply operates in an address space, ie. an
> > IOVA.  When a mapping is made within that address space, we perform a
> > translation as necessary to generate a guest physical address.  The
> > IOVA itself is only meaningful within the context of the address space,
> > there is no requirement or expectation for it to be globally unique.
> > 
> > If the vfio-user server is making some sort of requirement that IOVAs
> > are unique across all devices, that seems very, very wrong.  Thanks,  
> 
> Yes, BARs and IOVAs don't need to be unique across all devices.
> 
> The issue is that there can be as many guest physical address spaces as
> there are vfio-user clients connected, so per-client isolated address
> spaces are required. This patch series has a solution to that problem
> with the new pci_isol_as_mem/io() API.

Sorry, this still doesn't follow for me.  A server that hosts multiple
devices across many VMs (I'm not sure if you're referring to the device
or the VM as a client) needs to deal with different address spaces per
device.  The server needs to be able to uniquely identify every DMA,
which must be part of the interface protocol.  But I don't see how that
imposes a requirement of an isolated address space.  If we want the
device isolated because we don't trust the server, that's where an IOMMU
provides per device isolation.  What is the restriction of the
per-client isolated address space and why do we need it?  The server
needing to support multiple clients is not a sufficient answer to
impose new PCI bus types with an implicit restriction on the VM.
 
> What I find strange about this approach is that exported PCI devices are
> on PCI root ports that are connected to the machine's main PCI bus. The
> PCI devices don't interact with the main bus's IOVA space, guest
> physical memory space, or interrupts. It seems hacky to graft isolated
> devices onto a parent bus that provides nothing to its children. I
> wonder if it would be cleaner for every vfio-user server to have its own
> PCIHost. Then it may be possible to drop the new pci_isol_as_mem/io()
> API.

This is getting a bit ridiculous, if vfio-user devices require this
degree of manipulation of the VM topology into things that don't exist
on bare metal, we've done something very wrong.  Thanks,

Alex


