Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219C49E304
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:03:50 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4RI-000855-Nf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:03:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nD4Ey-0004C6-Ox
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nD4Eo-0005oI-TF
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643287853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Irl6XfZPsObO8tMrOAarcbYtwg8Y0w08iSIDiuQez3E=;
 b=fydoAEiQVTJZeSwkDKOA/JUiHxWRq0gX0OsD4ZSjhC2+Td0DE54k3PpOwW5VZ6mpjIJJjX
 mbNxuyelZau8VVtuoJeoMLqvera319VmQgYJ2UuvjjK8WZwSxFcK3H7+qom9DLJ5zULSJF
 wEs7zkZFW264HW5RXrZXNhjHUjpOdwc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-8EhtsMIGNr2y2Wadcn9QKA-1; Thu, 27 Jan 2022 07:50:51 -0500
X-MC-Unique: 8EhtsMIGNr2y2Wadcn9QKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso1053372wrg.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 04:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Irl6XfZPsObO8tMrOAarcbYtwg8Y0w08iSIDiuQez3E=;
 b=XLq1YoSu8EYpreGphsiaTQGLfMs/NY3oosVZ4YBqXl1nRUo/aaPWnj3CI6+MPurnzD
 67rLkX608lmxjdSJgCUxR/3drRq2w2fIf42ftVGPih3mcWFsqnvCFgjadPgvnZCZhgke
 ZrF/kVjeRnFijFb0KNIJOYc8Qr+EMpNfP4bduM/kQlzxrOeYN6bebnqMMH4YasdXW7Uj
 LWzUbjHoZiXuoIRNPmtEbwUYSGxisFpqfYlS2CyPhqptOYqYolr13IvWOk5V3B7Z/lIJ
 gWmrZcKyaG1CNHR+7mLrOOQyvCXrSU3R7voeh5j/BjholPIvHXTVXT8fGAyE+fNAk6Cn
 nNLg==
X-Gm-Message-State: AOAM531BUo4rWsvjV+N7E3Ej4tJViWOS+o7hmtYWvnoQEV2lMQ9pBb60
 ZpVOERszlJeyksE0Y+TcxnjBt/TyhpMvd+3F8tfSRm4MMZi0qJjp//7pA0XRRj6N40mrznepaxJ
 Wcor8Gj5aMjoy/0Q=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr3017812wrs.508.1643287849807; 
 Thu, 27 Jan 2022 04:50:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXDtu/JPTPv1e7NgkiOA1WbJijr95DzvfHnmA6ka2fxrxbd+AT3tYwe/2etKAuvlG4OFhgkg==
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr3017796wrs.508.1643287849595; 
 Thu, 27 Jan 2022 04:50:49 -0800 (PST)
Received: from redhat.com ([2.55.140.126])
 by smtp.gmail.com with ESMTPSA id 21sm1909523wmk.45.2022.01.27.04.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:50:48 -0800 (PST)
Date: Thu, 27 Jan 2022 07:50:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220127074937-mutt-send-email-mst@kernel.org>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 08:30:13AM +0000, Stefan Hajnoczi wrote:
> On Wed, Jan 26, 2022 at 04:13:33PM -0500, Michael S. Tsirkin wrote:
> > On Wed, Jan 26, 2022 at 08:07:36PM +0000, Dr. David Alan Gilbert wrote:
> > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > > On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote:
> > > > > 
> > > > > 
> > > > > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > > > > 
> > > > > > * Jag Raman (jag.raman@oracle.com) wrote:
> > > > > >> 
> > > > > >> 
> > > > > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >>> 
> > > > > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> > > > > >>>> Allow PCI buses to be part of isolated CPU address spaces. This has a
> > > > > >>>> niche usage.
> > > > > >>>> 
> > > > > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> > > > > >>>> the same machine/server. This would cause address space collision as
> > > > > >>>> well as be a security vulnerability. Having separate address spaces for
> > > > > >>>> each PCI bus would solve this problem.
> > > > > >>> 
> > > > > >>> Fascinating, but I am not sure I understand. any examples?
> > > > > >> 
> > > > > >> Hi Michael!
> > > > > >> 
> > > > > >> multiprocess QEMU and vfio-user implement a client-server model to allow
> > > > > >> out-of-process emulation of devices. The client QEMU, which makes ioctls
> > > > > >> to the kernel and runs VCPUs, could attach devices running in a server
> > > > > >> QEMU. The server QEMU needs access to parts of the client’s RAM to
> > > > > >> perform DMA.
> > > > > > 
> > > > > > Do you ever have the opposite problem? i.e. when an emulated PCI device
> > > > > 
> > > > > That’s an interesting question.
> > > > > 
> > > > > > exposes a chunk of RAM-like space (frame buffer, or maybe a mapped file)
> > > > > > that the client can see.  What happens if two emulated devices need to
> > > > > > access each others emulated address space?
> > > > > 
> > > > > In this case, the kernel driver would map the destination’s chunk of internal RAM into
> > > > > the DMA space of the source device. Then the source device could write to that
> > > > > mapped address range, and the IOMMU should direct those writes to the
> > > > > destination device.
> > > > > 
> > > > > I would like to take a closer look at the IOMMU implementation on how to achieve
> > > > > this, and get back to you. I think the IOMMU would handle this. Could you please
> > > > > point me to the IOMMU implementation you have in mind?
> > > > 
> > > > I don't know if the current vfio-user client/server patches already
> > > > implement device-to-device DMA, but the functionality is supported by
> > > > the vfio-user protocol.
> > > > 
> > > > Basically: if the DMA regions lookup inside the vfio-user server fails,
> > > > fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> > > > https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.rst#vfio-user-dma-read
> > > > 
> > > > Here is the flow:
> > > > 1. The vfio-user server with device A sends a DMA read to QEMU.
> > > > 2. QEMU finds the MemoryRegion associated with the DMA address and sees
> > > >    it's a device.
> > > >    a. If it's emulated inside the QEMU process then the normal
> > > >       device emulation code kicks in.
> > > >    b. If it's another vfio-user PCI device then the vfio-user PCI proxy
> > > >       device forwards the DMA to the second vfio-user server's device B.
> > > 
> > > I'm starting to be curious if there's a way to persuade the guest kernel
> > > to do it for us; in general is there a way to say to PCI devices that
> > > they can only DMA to the host and not other PCI devices?
> > 
> > 
> > But of course - this is how e.g. VFIO protects host PCI devices from
> > each other when one of them is passed through to a VM.
> 
> Michael: Are you saying just turn on vIOMMU? :)
> 
> Devices in different VFIO groups have their own IOMMU context, so their
> IOVA space is isolated. Just don't map other devices into the IOVA space
> and those other devices will be inaccessible.
> 
> Stefan

I was wondering about it here:
https://lore.kernel.org/r/20220119190742-mutt-send-email-mst%40kernel.org

-- 
MST


