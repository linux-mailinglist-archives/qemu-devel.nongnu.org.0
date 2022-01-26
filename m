Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334049D45F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:17:55 +0100 (CET)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpfk-0001oL-DH
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:17:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCpc0-0007R8-Uz
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCpbx-000662-Vj
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643231628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUDTuhrSXFxLGQmBKlYL5IJeZCkkx8XoqiBnSykw690=;
 b=Offl+wusyqtwYaxolQVf1EiCpftEoR4IDEPu3kh5dyPbqK3oxzsluNzulUwO1QRzI1MTLV
 TPkYZl7SrdYM32LSR0fCGONN4MS8DWU+IGxWDTUyaGEdsAu2ZHAFpeFhJVH25a/w677x2O
 EPNqUkSoXoYeUvRkmAzSNoWnbmgl4/c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-kFpqjZaUOiCmru-DTeprPg-1; Wed, 26 Jan 2022 16:13:45 -0500
X-MC-Unique: kFpqjZaUOiCmru-DTeprPg-1
Received: by mail-ej1-f70.google.com with SMTP id
 la22-20020a170907781600b006a7884de505so292155ejc.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vUDTuhrSXFxLGQmBKlYL5IJeZCkkx8XoqiBnSykw690=;
 b=P+hWJKW5RnCFbk5ZEhiI/STMagqyLvDrFAnxEnb76uCUvehWzaDaRYO0rmfN8JYMdn
 Wmrg0ddaVlsKyK13R9OGX3Q9Ikij9kSx03hKS7GuIbE78kA46TYintpzqtGXigpdMUB7
 uqaf9bc12EYUpmZT0hxkR+0QKiNlEG2g91l+zO6owS2baOKv7gx3ymTYL/FWTKl2XW8g
 DrHY7A+X9cm4bm9lSQf93iMbbPRz5fsgxIpK3CvGdmoxvjrHcdCGIGwdKogU1l1SsyoA
 2rZGABxPLJZZ+7VIzWD43qFq3uS16Yqth8qt+NP3E6hBLjuchpOiZYoNqRSHItfp231U
 oU/w==
X-Gm-Message-State: AOAM533YKEYCGEsJhzZ/EHO6drvha2Rf9Azc2/wOF3ayziv9t076x9DB
 cmLJVPm2TNbK6L5IEdpPZ5ddhC97tRBzZSWApvDLkFIgQXsad5X84wKZBfzGr9sApUZmi1epICN
 UXL0M5AuCCJbvp90=
X-Received: by 2002:a17:907:1ddd:: with SMTP id
 og29mr456733ejc.395.1643231624477; 
 Wed, 26 Jan 2022 13:13:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy51D4TuQGOdL3ggv4MxcaGhl1QcbkpoRM3DCvNyvrpe0Pw2Cpdv6rCSr2we4PsnvgLbRKJnQ==
X-Received: by 2002:a17:907:1ddd:: with SMTP id
 og29mr456714ejc.395.1643231624189; 
 Wed, 26 Jan 2022 13:13:44 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107f:61ef:864e:e890:1dee:8d9b])
 by smtp.gmail.com with ESMTPSA id fy40sm7706175ejc.36.2022.01.26.13.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:13:43 -0800 (PST)
Date: Wed, 26 Jan 2022 16:13:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220126161120-mutt-send-email-mst@kernel.org>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
MIME-Version: 1.0
In-Reply-To: <YfGqCJeTD9bmkZx6@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 26, 2022 at 08:07:36PM +0000, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote:
> > > 
> > > 
> > > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > > 
> > > > * Jag Raman (jag.raman@oracle.com) wrote:
> > > >> 
> > > >> 
> > > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >>> 
> > > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> > > >>>> Allow PCI buses to be part of isolated CPU address spaces. This has a
> > > >>>> niche usage.
> > > >>>> 
> > > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> > > >>>> the same machine/server. This would cause address space collision as
> > > >>>> well as be a security vulnerability. Having separate address spaces for
> > > >>>> each PCI bus would solve this problem.
> > > >>> 
> > > >>> Fascinating, but I am not sure I understand. any examples?
> > > >> 
> > > >> Hi Michael!
> > > >> 
> > > >> multiprocess QEMU and vfio-user implement a client-server model to allow
> > > >> out-of-process emulation of devices. The client QEMU, which makes ioctls
> > > >> to the kernel and runs VCPUs, could attach devices running in a server
> > > >> QEMU. The server QEMU needs access to parts of the client’s RAM to
> > > >> perform DMA.
> > > > 
> > > > Do you ever have the opposite problem? i.e. when an emulated PCI device
> > > 
> > > That’s an interesting question.
> > > 
> > > > exposes a chunk of RAM-like space (frame buffer, or maybe a mapped file)
> > > > that the client can see.  What happens if two emulated devices need to
> > > > access each others emulated address space?
> > > 
> > > In this case, the kernel driver would map the destination’s chunk of internal RAM into
> > > the DMA space of the source device. Then the source device could write to that
> > > mapped address range, and the IOMMU should direct those writes to the
> > > destination device.
> > > 
> > > I would like to take a closer look at the IOMMU implementation on how to achieve
> > > this, and get back to you. I think the IOMMU would handle this. Could you please
> > > point me to the IOMMU implementation you have in mind?
> > 
> > I don't know if the current vfio-user client/server patches already
> > implement device-to-device DMA, but the functionality is supported by
> > the vfio-user protocol.
> > 
> > Basically: if the DMA regions lookup inside the vfio-user server fails,
> > fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> > https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.rst#vfio-user-dma-read
> > 
> > Here is the flow:
> > 1. The vfio-user server with device A sends a DMA read to QEMU.
> > 2. QEMU finds the MemoryRegion associated with the DMA address and sees
> >    it's a device.
> >    a. If it's emulated inside the QEMU process then the normal
> >       device emulation code kicks in.
> >    b. If it's another vfio-user PCI device then the vfio-user PCI proxy
> >       device forwards the DMA to the second vfio-user server's device B.
> 
> I'm starting to be curious if there's a way to persuade the guest kernel
> to do it for us; in general is there a way to say to PCI devices that
> they can only DMA to the host and not other PCI devices?


But of course - this is how e.g. VFIO protects host PCI devices from
each other when one of them is passed through to a VM.

>  Or that the
> address space of a given PCIe bus is non-overlapping with one of the
> others?



> Dave
> > Stefan
> 
> 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


