Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3349D332
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:11:56 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCoe2-0004z7-N6
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCoa7-0003Qp-TL
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCoa4-0004r3-Iw
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643227666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDIfXpIjK7bqZCDGBRvSP8NWlawNpj87ujcarzTB4Ag=;
 b=Ygy8AFRpB2atxC6ItHThVjpjN/wnreIQdf5OZz5OkoiO7e8w7ZwwUxTZPGE67vhJiRVhi6
 ftn7R2Yyd41OT//pVbegJgPRnPL++NYSz7UTMHhuaIwEk7f6MPJLzMP3cSCbIed5IMI/CE
 JLCEjI5WpVUmu9L2CmMFdHbLfYwDMZc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-uVQscowQPCyZ9W4a2a_-8w-1; Wed, 26 Jan 2022 15:07:40 -0500
X-MC-Unique: uVQscowQPCyZ9W4a2a_-8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so408042wml.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 12:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=BDIfXpIjK7bqZCDGBRvSP8NWlawNpj87ujcarzTB4Ag=;
 b=HJ0BFBk8cc7h326K1WGljGEqj1u28zceeH6LmZW3as6eknqNwE3ISJkv9e+FZpbs8t
 I0X/4MfwYCczC3S7RI8Mx8sdJ32iYTlpYU8yd7Kf0cdhfx/bTYm29seSeyMwaEOU/n0z
 r4z9pN6G288Y7ll9Eo14wqoBoBPLj7NRQbZ8y1GztKVSpQBjHrWQ0oXVqo3GIqUbp40p
 mxNr/wm+56cmwvPmj/CHGG27c2YZEZIvC8Mu4qVFcmLu4ZQoBtT+FuDteMsLoQJsAkqu
 2Avh9a2PLU52LwPjU0CIFQHOdCWQo9JDEQ64ihWZEUJgBG//N+ZYfUXtEMa4yfd6Qz6I
 3fCQ==
X-Gm-Message-State: AOAM532w9kVPsq6MTDFIdIXiD7V8kC6PWkihmv8kyQ1EqdxnV/XaKuNb
 yqdzC+8PmvsePsdavhvgf7OAYhVEzgjycmrI4gu0w7wK6A/sgYZ/SbIzFxdf9cb8EaOK4HxVIgm
 g8bi3C01C1ciS/+w=
X-Received: by 2002:a5d:4090:: with SMTP id o16mr169637wrp.25.1643227659313;
 Wed, 26 Jan 2022 12:07:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVPARro00hPspCVUO/tlXMRIPjRATrv4afy8hZDUU/L+C764uHVlzuJ4Yykh8h+aRshfLV2A==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr169612wrp.25.1643227659093;
 Wed, 26 Jan 2022 12:07:39 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u19sm152222wmm.39.2022.01.26.12.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:07:38 -0800 (PST)
Date: Wed, 26 Jan 2022 20:07:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfGqCJeTD9bmkZx6@work-vm>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
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
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote:
> > 
> > 
> > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > 
> > > * Jag Raman (jag.raman@oracle.com) wrote:
> > >> 
> > >> 
> > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >>> 
> > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> > >>>> Allow PCI buses to be part of isolated CPU address spaces. This has a
> > >>>> niche usage.
> > >>>> 
> > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> > >>>> the same machine/server. This would cause address space collision as
> > >>>> well as be a security vulnerability. Having separate address spaces for
> > >>>> each PCI bus would solve this problem.
> > >>> 
> > >>> Fascinating, but I am not sure I understand. any examples?
> > >> 
> > >> Hi Michael!
> > >> 
> > >> multiprocess QEMU and vfio-user implement a client-server model to allow
> > >> out-of-process emulation of devices. The client QEMU, which makes ioctls
> > >> to the kernel and runs VCPUs, could attach devices running in a server
> > >> QEMU. The server QEMU needs access to parts of the client’s RAM to
> > >> perform DMA.
> > > 
> > > Do you ever have the opposite problem? i.e. when an emulated PCI device
> > 
> > That’s an interesting question.
> > 
> > > exposes a chunk of RAM-like space (frame buffer, or maybe a mapped file)
> > > that the client can see.  What happens if two emulated devices need to
> > > access each others emulated address space?
> > 
> > In this case, the kernel driver would map the destination’s chunk of internal RAM into
> > the DMA space of the source device. Then the source device could write to that
> > mapped address range, and the IOMMU should direct those writes to the
> > destination device.
> > 
> > I would like to take a closer look at the IOMMU implementation on how to achieve
> > this, and get back to you. I think the IOMMU would handle this. Could you please
> > point me to the IOMMU implementation you have in mind?
> 
> I don't know if the current vfio-user client/server patches already
> implement device-to-device DMA, but the functionality is supported by
> the vfio-user protocol.
> 
> Basically: if the DMA regions lookup inside the vfio-user server fails,
> fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.rst#vfio-user-dma-read
> 
> Here is the flow:
> 1. The vfio-user server with device A sends a DMA read to QEMU.
> 2. QEMU finds the MemoryRegion associated with the DMA address and sees
>    it's a device.
>    a. If it's emulated inside the QEMU process then the normal
>       device emulation code kicks in.
>    b. If it's another vfio-user PCI device then the vfio-user PCI proxy
>       device forwards the DMA to the second vfio-user server's device B.

I'm starting to be curious if there's a way to persuade the guest kernel
to do it for us; in general is there a way to say to PCI devices that
they can only DMA to the host and not other PCI devices?  Or that the
address space of a given PCIe bus is non-overlapping with one of the
others?

Dave

> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


