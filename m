Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A6372861
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:00:12 +0200 (CEST)
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrqd-0008WE-KR
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ldroz-0007e5-1L
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ldrow-0000oC-OM
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620122305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+u6oYoHRH/pRELKiBVi9emVwp7PbUC0UHtMhcdZtrsY=;
 b=Txk8pHec7vfJ7xofDxvShYT6tqb7QXL0HzkVZfZFdWFGD9koVsMmFjb0S5yqqk36yWNGAB
 FcMG6CwuyAEP6BEkuZFPyxWiPCaCsF8ETEjrj9aAMtPA2n9G1+eNs55IbCvU7aGjjlYq1j
 zroyCEz1wwP93wS1jZv99eFj3/0/1IU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361--b2KCzUDNzum0klH74SdFA-1; Tue, 04 May 2021 05:58:24 -0400
X-MC-Unique: -b2KCzUDNzum0klH74SdFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 140A36123D;
 Tue,  4 May 2021 09:58:23 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8444D5D703;
 Tue,  4 May 2021 09:58:18 +0000 (UTC)
Date: Tue, 4 May 2021 10:58:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dev Audsin <dev.devaqemu@gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <YJEat1Qt48T8SXGR@work-vm>
References: <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
 <20210427121850.68d2a8dd@redhat.com> <YIhfWoRgJtaKZhh8@work-vm>
 <CANsN3OSs4GyT10P6xUp-s823U8VnWAmihWXQ1jSnF07wyYjxuA@mail.gmail.com>
 <YIm0w2RgQgosIyiB@work-vm> <20210428133740.6ccbbba6@redhat.com>
 <YIpyA+ZoOYxX0c06@work-vm>
 <20210429070901.52402ac2@x1.home.shazbot.org>
 <YIry/WqbeRvD4zCa@work-vm>
 <CANsN3OS5zXQ4_8jwssweNER-ff-KwA8SYomJfOMZ90FhNVUAZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANsN3OS5zXQ4_8jwssweNER-ff-KwA8SYomJfOMZ90FhNVUAZQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dev Audsin (dev.devaqemu@gmail.com) wrote:
> Thanks David. I did a quick test with the above patch and it seems to
> work for me. With this patch, apparently I can  create a VM with
> SR-IOV VF and DAX cache ( virtio_fs_cache_size = 1024).

Great! I'll put it in the next set of DAX patches I send.

Dave

> Thanks
> Dev
> 
> On Thu, Apr 29, 2021 at 6:55 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > On Thu, 29 Apr 2021 09:44:51 +0100
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >
> > > > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > > > On Wed, 28 Apr 2021 20:17:23 +0100
> > > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > > >
> > > > > > * Dev Audsin (dev.devaqemu@gmail.com) wrote:
> > > > > > > Thanks Dave for your explanation.
> > > > > > > Any suggestions on how to make VFIO not attempt to map into the
> > > > > > > unaccessible and unallocated RAM.
> > > > > >
> > > > > > I'm not sure;:
> > > > > >
> > > > > > static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> > > > > > {
> > > > > >     return (!memory_region_is_ram(section->mr) &&
> > > > > >             !memory_region_is_iommu(section->mr)) ||
> > > > > >            section->offset_within_address_space & (1ULL << 63);
> > > > > > }
> > > > > >
> > > > > > I'm declaring that region with memory_region_init_ram_ptr;  should I be?
> > > > > > it's not quite like RAM.
> > > > > > But then I *do* want a kvm slot for it, and I do want it to be accessed
> > > > > > by mapping rather htan calling IO functions; that makes me think mr->ram
> > > > > > has to be true.
> > > > > > But then do we need to add another flag to memory-regions; if we do,
> > > > > > what is it;
> > > > > >    a) We don't want an 'is_virtio_fs' - it needs to be more generic
> > > > > >    b) 'no_vfio' also feels wrong
> > > > > >
> > > > > > Is perhaps 'not_lockable' the right thing to call it?
> > > > >
> > > > > This reasoning just seems to lead back to "it doesn't work, therefore
> > > > > don't do it" rather than identifying the property of the region that
> > > > > makes it safe not to map it for device DMA (assuming that's actually
> > > > > the case).
> > > >
> > > > Yes, I'm struggling to get to what that generic form of that property
> > > > is, possibly because I've not got an example of another case to compare
> > > > it with.
> > > >
> > > > > It's clearly "RAM" as far as QEMU is concerned given how
> > > > > it's created, but does it actually appear in the VM as generic physical
> > > > > RAM that the guest OS could program to the device as a DMA target?  If
> > > > > not, what property makes that so, create a flag for that.  Thanks,
> > > >
> > > > The guest sees it as a PCI-bar; so it knows it's not 'generic physical
> > > > RAM' - but can a guest set other BARs (like frame buffers or pmem) as
> > > > DMA targets?  If so, how do I distinguish our bar?
> > >
> > > They can, this is how peer-to-peer DMA between devices works.  However,
> > > we can perhaps take advantage that drivers are generally a bit more
> > > cautious in probing that this type of DMA works before relying on it,
> > > and declare it with memory_region_init_ram_device_ptr() which vfio
> > > would not consider fatal if it fails to map it.  The other semantic
> > > difference is that ram_device_mem_ops are used for read/write access to
> > > avoid some of the opcodes that are not meant to be used for physical
> > > device memory with the default memcpy ops.  If you expect this region
> > > to be mapped as a kvm memory slot, presumably these would never get
> > > used anyway.  Thanks,
> >
> > Oh, nice, I hadn't spotted memory_region_init_ram_device_ptr();
> >
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 7afd9495c9..11fb9b5979 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -604,7 +604,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
> >              return;
> >          }
> >
> > -        memory_region_init_ram_ptr(&fs->cache, OBJECT(vdev),
> > +        memory_region_init_ram_device_ptr(&fs->cache, OBJECT(vdev),
> >                                     "virtio-fs-cache",
> >                                     fs->conf.cache_size, cache_ptr);
> >      }
> >
> > apparently still works for us; Dev does that fix it for you?
> >
> > Dave
> >
> > > Alex
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


