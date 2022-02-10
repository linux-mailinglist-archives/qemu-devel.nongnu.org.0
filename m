Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104704B18E4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 23:57:10 +0100 (CET)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIINA-0006yw-8t
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 17:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nIIJf-0006D1-6n
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 17:53:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nIIJZ-0005hB-3W
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 17:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644533603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32ySCPmRt8CvQc9KgnWLsNOBExqF9s+sAHaRS6RU0zs=;
 b=GVhhN/W9fhxNA0GKu2c6p902wUi5O+f04917GIlt3bvowPJXtOiEipv/lnm7dYbP6UFFhD
 HTmU+0BN5RAFhSMHpBD7YdsMc2OMVVhpZVl9EiH4UHrAkSb0+x9TIO6MMLDaVgRcsH7jeZ
 vamwU2u0is5NrFYwLIINuYxFUmL513o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-Yonr1ZJMOoOyKU4fOizPJg-1; Thu, 10 Feb 2022 17:53:21 -0500
X-MC-Unique: Yonr1ZJMOoOyKU4fOizPJg-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq19-20020a1709073f1300b006cdd7712c2cso733368ejc.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=32ySCPmRt8CvQc9KgnWLsNOBExqF9s+sAHaRS6RU0zs=;
 b=dV4rnBWyx2dj/xK8YpZ4DJrncszSDvDnnyeoI7IklEJOb1Q5DqevqgYZlhMoRB53K0
 dGR3t4IF7Un59MSzNCWMNbWH2FWBesBR6TU/3Mq/WJ8D5GhhgoLRTVZpuiXa21am32mr
 bO2uk7cgKCf6B1GfqoRuzFdWWAX0HxcH0Kqb1neFbivaeCbofMN6OUAyWyrYSTwRJJP4
 wDNPqVQlVWnjjUZLvhusxEJpUiSaPA+Mh+2Wa1EBQwyet+NAY+XvGr5ZdjTOJTd2f9aY
 wWhygeFRBPJfU2dSuqvSox+n3GQXcdt1d5LPbTf0i7kY/YYOV4qU0F3g6bXMhF2g6B7b
 f60A==
X-Gm-Message-State: AOAM531QTeRVDNYx2cvyshWUih6RY9EbXu7bQX/qLL8NcP3G60W+1ghA
 Xxx/lbEoq9jzjFo5Q91LdbhBhvQzMtO5c8PNPN+CWSLYo2pKUZgE68HezQ0iIiamQhR6o9FBVx1
 I9DonXJDN191WZmU=
X-Received: by 2002:a50:d616:: with SMTP id x22mr10784773edi.47.1644533600368; 
 Thu, 10 Feb 2022 14:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyfBLnLTwAfjgpc5EsyNm4xIsE378ugsR2iQ6PwZASDin1EvKqJh6mU9H94L69KiAWDnFWJQ==
X-Received: by 2002:a50:d616:: with SMTP id x22mr10784731edi.47.1644533600023; 
 Thu, 10 Feb 2022 14:53:20 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:c2e4:719d:a20b:e234:2b71])
 by smtp.gmail.com with ESMTPSA id c5sm10484172edk.43.2022.02.10.14.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 14:53:19 -0800 (PST)
Date: Thu, 10 Feb 2022 17:53:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220210175040-mutt-send-email-mst@kernel.org>
References: <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
 <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
 <20220210022543-mutt-send-email-mst@kernel.org>
 <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 10:23:01PM +0000, Jag Raman wrote:
> 
> 
> > On Feb 10, 2022, at 3:02 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > 
> > On Thu, Feb 10, 2022 at 12:08:27AM +0000, Jag Raman wrote:
> >> 
> >> 
> >>> On Feb 2, 2022, at 12:34 AM, Alex Williamson <alex.williamson@redhat.com> wrote:
> >>> 
> >>> On Wed, 2 Feb 2022 01:13:22 +0000
> >>> Jag Raman <jag.raman@oracle.com> wrote:
> >>> 
> >>>>> On Feb 1, 2022, at 5:47 PM, Alex Williamson <alex.williamson@redhat.com> wrote:
> >>>>> 
> >>>>> On Tue, 1 Feb 2022 21:24:08 +0000
> >>>>> Jag Raman <jag.raman@oracle.com> wrote:
> >>>>> 
> >>>>>>> On Feb 1, 2022, at 10:24 AM, Alex Williamson <alex.williamson@redhat.com> wrote:
> >>>>>>> 
> >>>>>>> On Tue, 1 Feb 2022 09:30:35 +0000
> >>>>>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>>>>>> 
> >>>>>>>> On Mon, Jan 31, 2022 at 09:16:23AM -0700, Alex Williamson wrote:    
> >>>>>>>>> On Fri, 28 Jan 2022 09:18:08 +0000
> >>>>>>>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >>>>>>>>> 
> >>>>>>>>>> On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:      
> >>>>>>>>>>> If the goal here is to restrict DMA between devices, ie. peer-to-peer
> >>>>>>>>>>> (p2p), why are we trying to re-invent what an IOMMU already does?        
> >>>>>>>>>> 
> >>>>>>>>>> The issue Dave raised is that vfio-user servers run in separate
> >>>>>>>>>> processses from QEMU with shared memory access to RAM but no direct
> >>>>>>>>>> access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is one
> >>>>>>>>>> example of a non-RAM MemoryRegion that can be the source/target of DMA
> >>>>>>>>>> requests.
> >>>>>>>>>> 
> >>>>>>>>>> I don't think IOMMUs solve this problem but luckily the vfio-user
> >>>>>>>>>> protocol already has messages that vfio-user servers can use as a
> >>>>>>>>>> fallback when DMA cannot be completed through the shared memory RAM
> >>>>>>>>>> accesses.
> >>>>>>>>>> 
> >>>>>>>>>>> In
> >>>>>>>>>>> fact, it seems like an IOMMU does this better in providing an IOVA
> >>>>>>>>>>> address space per BDF.  Is the dynamic mapping overhead too much?  What
> >>>>>>>>>>> physical hardware properties or specifications could we leverage to
> >>>>>>>>>>> restrict p2p mappings to a device?  Should it be governed by machine
> >>>>>>>>>>> type to provide consistency between devices?  Should each "isolated"
> >>>>>>>>>>> bus be in a separate root complex?  Thanks,        
> >>>>>>>>>> 
> >>>>>>>>>> There is a separate issue in this patch series regarding isolating the
> >>>>>>>>>> address space where BAR accesses are made (i.e. the global
> >>>>>>>>>> address_space_memory/io). When one process hosts multiple vfio-user
> >>>>>>>>>> server instances (e.g. a software-defined network switch with multiple
> >>>>>>>>>> ethernet devices) then each instance needs isolated memory and io address
> >>>>>>>>>> spaces so that vfio-user clients don't cause collisions when they map
> >>>>>>>>>> BARs to the same address.
> >>>>>>>>>> 
> >>>>>>>>>> I think the the separate root complex idea is a good solution. This
> >>>>>>>>>> patch series takes a different approach by adding the concept of
> >>>>>>>>>> isolated address spaces into hw/pci/.      
> >>>>>>>>> 
> >>>>>>>>> This all still seems pretty sketchy, BARs cannot overlap within the
> >>>>>>>>> same vCPU address space, perhaps with the exception of when they're
> >>>>>>>>> being sized, but DMA should be disabled during sizing.
> >>>>>>>>> 
> >>>>>>>>> Devices within the same VM context with identical BARs would need to
> >>>>>>>>> operate in different address spaces.  For example a translation offset
> >>>>>>>>> in the vCPU address space would allow unique addressing to the devices,
> >>>>>>>>> perhaps using the translation offset bits to address a root complex and
> >>>>>>>>> masking those bits for downstream transactions.
> >>>>>>>>> 
> >>>>>>>>> In general, the device simply operates in an address space, ie. an
> >>>>>>>>> IOVA.  When a mapping is made within that address space, we perform a
> >>>>>>>>> translation as necessary to generate a guest physical address.  The
> >>>>>>>>> IOVA itself is only meaningful within the context of the address space,
> >>>>>>>>> there is no requirement or expectation for it to be globally unique.
> >>>>>>>>> 
> >>>>>>>>> If the vfio-user server is making some sort of requirement that IOVAs
> >>>>>>>>> are unique across all devices, that seems very, very wrong.  Thanks,      
> >>>>>>>> 
> >>>>>>>> Yes, BARs and IOVAs don't need to be unique across all devices.
> >>>>>>>> 
> >>>>>>>> The issue is that there can be as many guest physical address spaces as
> >>>>>>>> there are vfio-user clients connected, so per-client isolated address
> >>>>>>>> spaces are required. This patch series has a solution to that problem
> >>>>>>>> with the new pci_isol_as_mem/io() API.    
> >>>>>>> 
> >>>>>>> Sorry, this still doesn't follow for me.  A server that hosts multiple
> >>>>>>> devices across many VMs (I'm not sure if you're referring to the device
> >>>>>>> or the VM as a client) needs to deal with different address spaces per
> >>>>>>> device.  The server needs to be able to uniquely identify every DMA,
> >>>>>>> which must be part of the interface protocol.  But I don't see how that
> >>>>>>> imposes a requirement of an isolated address space.  If we want the
> >>>>>>> device isolated because we don't trust the server, that's where an IOMMU
> >>>>>>> provides per device isolation.  What is the restriction of the
> >>>>>>> per-client isolated address space and why do we need it?  The server
> >>>>>>> needing to support multiple clients is not a sufficient answer to
> >>>>>>> impose new PCI bus types with an implicit restriction on the VM.    
> >>>>>> 
> >>>>>> Hi Alex,
> >>>>>> 
> >>>>>> I believe there are two separate problems with running PCI devices in
> >>>>>> the vfio-user server. The first one is concerning memory isolation and
> >>>>>> second one is vectoring of BAR accesses (as explained below).
> >>>>>> 
> >>>>>> In our previous patches (v3), we used an IOMMU to isolate memory
> >>>>>> spaces. But we still had trouble with the vectoring. So we implemented
> >>>>>> separate address spaces for each PCIBus to tackle both problems
> >>>>>> simultaneously, based on the feedback we got.
> >>>>>> 
> >>>>>> The following gives an overview of issues concerning vectoring of
> >>>>>> BAR accesses.
> >>>>>> 
> >>>>>> The device’s BAR regions are mapped into the guest physical address
> >>>>>> space. The guest writes the guest PA of each BAR into the device’s BAR
> >>>>>> registers. To access the BAR regions of the device, QEMU uses
> >>>>>> address_space_rw() which vectors the physical address access to the
> >>>>>> device BAR region handlers.  
> >>>>> 
> >>>>> The guest physical address written to the BAR is irrelevant from the
> >>>>> device perspective, this only serves to assign the BAR an offset within
> >>>>> the address_space_mem, which is used by the vCPU (and possibly other
> >>>>> devices depending on their address space).  There is no reason for the
> >>>>> device itself to care about this address.  
> >>>> 
> >>>> Thank you for the explanation, Alex!
> >>>> 
> >>>> The confusion at my part is whether we are inside the device already when
> >>>> the server receives a request to access BAR region of a device. Based on
> >>>> your explanation, I get that your view is the BAR access request has
> >>>> propagated into the device already, whereas I was under the impression
> >>>> that the request is still on the CPU side of the PCI root complex.
> >>> 
> >>> If you are getting an access through your MemoryRegionOps, all the
> >>> translations have been made, you simply need to use the hwaddr as the
> >>> offset into the MemoryRegion for the access.  Perform the read/write to
> >>> your device, no further translations required.
> >>> 
> >>>> Your view makes sense to me - once the BAR access request reaches the
> >>>> client (on the other side), we could consider that the request has reached
> >>>> the device.
> >>>> 
> >>>> On a separate note, if devices don’t care about the values in BAR
> >>>> registers, why do the default PCI config handlers intercept and map
> >>>> the BAR region into address_space_mem?
> >>>> (pci_default_write_config() -> pci_update_mappings())
> >>> 
> >>> This is the part that's actually placing the BAR MemoryRegion as a
> >>> sub-region into the vCPU address space.  I think if you track it,
> >>> you'll see PCIDevice.io_regions[i].address_space is actually
> >>> system_memory, which is used to initialize address_space_system.
> >>> 
> >>> The machine assembles PCI devices onto buses as instructed by the
> >>> command line or hot plug operations.  It's the responsibility of the
> >>> guest firmware and guest OS to probe those devices, size the BARs, and
> >>> place the BARs into the memory hierarchy of the PCI bus, ie. system
> >>> memory.  The BARs are necessarily in the "guest physical memory" for
> >>> vCPU access, but it's essentially only coincidental that PCI devices
> >>> might be in an address space that provides a mapping to their own BAR.
> >>> There's no reason to ever use it.
> >>> 
> >>> In the vIOMMU case, we can't know that the device address space
> >>> includes those BAR mappings or if they do, that they're identity mapped
> >>> to the physical address.  Devices really need to not infer anything
> >>> about an address.  Think about real hardware, a device is told by
> >>> driver programming to perform a DMA operation.  The device doesn't know
> >>> the target of that operation, it's the guest driver's responsibility to
> >>> make sure the IOVA within the device address space is valid and maps to
> >>> the desired target.  Thanks,
> >> 
> >> Thanks for the explanation, Alex. Thanks to everyone else in the thread who
> >> helped to clarify this problem.
> >> 
> >> We have implemented the memory isolation based on the discussion in the
> >> thread. We will send the patches out shortly.
> >> 
> >> Devices such as “name" and “e1000” worked fine. But I’d like to note that
> >> the LSI device (TYPE_LSI53C895A) had some problems - it doesn’t seem
> >> to be IOMMU aware. In LSI’s case, the kernel driver is asking the device to
> >> read instructions from the CPU VA (lsi_execute_script() -> read_dword()),
> >> which is forbidden when IOMMU is enabled. Specifically, the driver is asking
> >> the device to access other BAR regions by using the BAR address programmed
> >> in the PCI config space. This happens even without vfio-user patches. For example,
> >> we could enable IOMMU using “-device intel-iommu” QEMU option and also
> >> adding the following to the kernel command-line: “intel_iommu=on iommu=nopt”.
> >> In this case, we could see an IOMMU fault.
> > 
> > So, device accessing its own BAR is different. Basically, these
> > transactions never go on the bus at all, never mind get to the IOMMU.
> 
> Hi Michael,
> 
> In LSI case, I did notice that it went to the IOMMU.

Hmm do you mean you analyzed how a physical device works?
Or do you mean in QEMU?

> The device is reading the BAR
> address as if it was a DMA address.

I got that, my understanding of PCI was that a device can
not be both a master and a target of a transaction at
the same time though. Could not find this in the spec though,
maybe I remember incorrectly.

> > I think it's just used as a handle to address internal device memory.
> > This kind of trick is not universal, but not terribly unusual.
> > 
> > 
> >> Unfortunately, we started off our project with the LSI device. So that lead to all the
> >> confusion about what is expected at the server end in-terms of
> >> vectoring/address-translation. It gave an impression as if the request was still on
> >> the CPU side of the PCI root complex, but the actual problem was with the
> >> device driver itself.
> >> 
> >> I’m wondering how to deal with this problem. Would it be OK if we mapped the
> >> device’s BAR into the IOVA, at the same CPU VA programmed in the BAR registers?
> >> This would help devices such as LSI to circumvent this problem. One problem
> >> with this approach is that it has the potential to collide with another legitimate
> >> IOVA address. Kindly share your thought on this.
> >> 
> >> Thank you!
> > 
> > I am not 100% sure what do you plan to do but it sounds fine since even
> > if it collides, with traditional PCI device must never initiate cycles
> 
> OK sounds good, I’ll create a mapping of the device BARs in the IOVA.
> 
> Thank you!
> --
> Jag
> 
> > within their own BAR range, and PCIe is software-compatible with PCI. So
> > devices won't be able to access this IOVA even if it was programmed in
> > the IOMMU.
> > 
> > As was mentioned elsewhere on this thread, devices accessing each
> > other's BAR is a different matter.
> > 
> > I do not remember which rules apply to multiple functions of a
> > multi-function device though. I think in a traditional PCI
> > they will never go out on the bus, but with e.g. SRIOV they
> > would probably do go out? Alex, any idea?
> > 
> > 
> >> --
> >> Jag
> >> 
> >>> 
> >>> Alex
> >>> 
> >> 
> > 
> 


