Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF74A5A6A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:45:02 +0100 (CET)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqej-0006Si-IR
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:45:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nEqc4-0004Ta-5w
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nEqc1-0007SA-5T
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643712131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ab0x73CmqbzaohvHoq5Nca0k3DiCFIBcEFlit0v+o2M=;
 b=Opor/83evRroSBRWLIo7iiGHt+lLEcci55TIBL5b5OWQ4+EBoiZlW3wVzWNW4gS0FPlLRr
 Wr/y+YLOIJSHbvFzaC8wAGooGdB1Zy1NzJ5vG9AUNVvYlrwDSNuNirl1gBjPp+JH3wCoTP
 vnv7KDON+Vf7E3CXrYoxVoa6Y0NIHpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-hxYxnslrMF68Oh5rLooCtQ-1; Tue, 01 Feb 2022 05:42:08 -0500
X-MC-Unique: hxYxnslrMF68Oh5rLooCtQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c7207000000b0034ec3d8ce0aso784475wmc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Ab0x73CmqbzaohvHoq5Nca0k3DiCFIBcEFlit0v+o2M=;
 b=ogbQiS8+zVEEy5xehmLAw5C95hR8gzhW37/sd3E2kpyA4owc/7/xo25jh3Mk8ZFnNM
 0/BGrayzlQVnigiNHPOqRPG6G1TJT6VTAQOeQugDdgMyO59APWvGDy2MY3278AJiZGnu
 Hi0dbOQmJ9Zwz30SCFulS9tg5VswrTtjguY6bk7EEgzborgXYzKZV9+I0tVNRT+W5cuo
 7KUEqoiLrYgUotg/iDaIvgLWtHtbZL/Ifq3p1RCCEL6iltZ1EF04U9+/jytSdDxpl1Rn
 wXX+bnXrxwCPAxsCNeCfKBglzwCLpsPysursiuL/W4rmCF4sK2fZry3u6Y1w7CyjvOWF
 t21Q==
X-Gm-Message-State: AOAM532oEl3OGTozXucN274MP6ZdQCOMT1snZkNTwRJOBr1+qVgL12EO
 aTHPSGD6cyRjzdjNsmWT+iUCay3+bFcNkzZ1sp5SGHGOjMla4w5lZ9kgikE3hFlaA8ikX1tTRLq
 BfbS7WEqREEOfAZU=
X-Received: by 2002:adf:d239:: with SMTP id k25mr20770289wrh.164.1643712127159; 
 Tue, 01 Feb 2022 02:42:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy85oVCnzYQSHbKZ3Mii48jbn+mb7nWZHc9Jh/PDbkVmxJ17/LAOpz/0sOHkecNbCYyV7nkYA==
X-Received: by 2002:adf:d239:: with SMTP id k25mr20770248wrh.164.1643712126861; 
 Tue, 01 Feb 2022 02:42:06 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f12sm14225201wrs.1.2022.02.01.02.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 02:42:06 -0800 (PST)
Date: Tue, 1 Feb 2022 10:42:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfkOfI0fAW0ZCpOu@work-vm>
References: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220127142253.21ab0025.alex.williamson@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Thu, 27 Jan 2022 08:30:13 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > On Wed, Jan 26, 2022 at 04:13:33PM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Jan 26, 2022 at 08:07:36PM +0000, Dr. David Alan Gilbert wrote:  
> > > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:  
> > > > > On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote:  
> > > > > > 
> > > > > >   
> > > > > > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > > > > > 
> > > > > > > * Jag Raman (jag.raman@oracle.com) wrote:  
> > > > > > >> 
> > > > > > >>   
> > > > > > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >>> 
> > > > > > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:  
> > > > > > >>>> Allow PCI buses to be part of isolated CPU address spaces. This has a
> > > > > > >>>> niche usage.
> > > > > > >>>> 
> > > > > > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> > > > > > >>>> the same machine/server. This would cause address space collision as
> > > > > > >>>> well as be a security vulnerability. Having separate address spaces for
> > > > > > >>>> each PCI bus would solve this problem.  
> > > > > > >>> 
> > > > > > >>> Fascinating, but I am not sure I understand. any examples?  
> > > > > > >> 
> > > > > > >> Hi Michael!
> > > > > > >> 
> > > > > > >> multiprocess QEMU and vfio-user implement a client-server model to allow
> > > > > > >> out-of-process emulation of devices. The client QEMU, which makes ioctls
> > > > > > >> to the kernel and runs VCPUs, could attach devices running in a server
> > > > > > >> QEMU. The server QEMU needs access to parts of the client’s RAM to
> > > > > > >> perform DMA.  
> > > > > > > 
> > > > > > > Do you ever have the opposite problem? i.e. when an emulated PCI device  
> > > > > > 
> > > > > > That’s an interesting question.
> > > > > >   
> > > > > > > exposes a chunk of RAM-like space (frame buffer, or maybe a mapped file)
> > > > > > > that the client can see.  What happens if two emulated devices need to
> > > > > > > access each others emulated address space?  
> > > > > > 
> > > > > > In this case, the kernel driver would map the destination’s chunk of internal RAM into
> > > > > > the DMA space of the source device. Then the source device could write to that
> > > > > > mapped address range, and the IOMMU should direct those writes to the
> > > > > > destination device.
> > > > > > 
> > > > > > I would like to take a closer look at the IOMMU implementation on how to achieve
> > > > > > this, and get back to you. I think the IOMMU would handle this. Could you please
> > > > > > point me to the IOMMU implementation you have in mind?  
> > > > > 
> > > > > I don't know if the current vfio-user client/server patches already
> > > > > implement device-to-device DMA, but the functionality is supported by
> > > > > the vfio-user protocol.
> > > > > 
> > > > > Basically: if the DMA regions lookup inside the vfio-user server fails,
> > > > > fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> > > > > https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.rst#vfio-user-dma-read
> > > > > 
> > > > > Here is the flow:
> > > > > 1. The vfio-user server with device A sends a DMA read to QEMU.
> > > > > 2. QEMU finds the MemoryRegion associated with the DMA address and sees
> > > > >    it's a device.
> > > > >    a. If it's emulated inside the QEMU process then the normal
> > > > >       device emulation code kicks in.
> > > > >    b. If it's another vfio-user PCI device then the vfio-user PCI proxy
> > > > >       device forwards the DMA to the second vfio-user server's device B.  
> > > > 
> > > > I'm starting to be curious if there's a way to persuade the guest kernel
> > > > to do it for us; in general is there a way to say to PCI devices that
> > > > they can only DMA to the host and not other PCI devices?  
> > > 
> > > 
> > > But of course - this is how e.g. VFIO protects host PCI devices from
> > > each other when one of them is passed through to a VM.  
> > 
> > Michael: Are you saying just turn on vIOMMU? :)
> > 
> > Devices in different VFIO groups have their own IOMMU context, so their
> > IOVA space is isolated. Just don't map other devices into the IOVA space
> > and those other devices will be inaccessible.
> 
> Devices in different VFIO *containers* have their own IOMMU context.
> Based on the group attachment to a container, groups can either have
> shared or isolated IOVA space.  That determination is made by looking
> at the address space of the bus, which is governed by the presence of a
> vIOMMU.
> 
> If the goal here is to restrict DMA between devices, ie. peer-to-peer
> (p2p), why are we trying to re-invent what an IOMMU already does?

That was what I was curious about - is it possible to get an IOMMU to do
that, and how? (Not knowing much about IOMMUs).
In my DAX/virtiofs case, I want the device to be able to DMA to guest
RAM but for other devices not to try to DMA to it and in particular for
it not to have to DMA to other devices.

>  In
> fact, it seems like an IOMMU does this better in providing an IOVA
> address space per BDF.  Is the dynamic mapping overhead too much?  What
> physical hardware properties or specifications could we leverage to
> restrict p2p mappings to a device?  Should it be governed by machine
> type to provide consistency between devices?  Should each "isolated"
> bus be in a separate root complex?  Thanks,

Dave

> Alex
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


