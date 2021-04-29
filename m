Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517736E749
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:47:25 +0200 (CEST)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2KS-0007fv-B1
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lc2ID-0006M1-Do
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:45:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lc2I9-0008W4-VQ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619685901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7uvVUCxooB/bL+dAHM8EKgFDbATRaISCYODc0HLB1VM=;
 b=OHwicJZ90XUbFsb0JZDYUoG64VhKBGtw3EgKrmOuDap7tm/q2Cv4AX28fLhOqhtQzITXDj
 Yxw8qI1sRFBKWzf5OYihEbKWpHuRDXwU2Mjurn5uUKnawXnHqj6t8D3sV5Vf1uSf06hZbd
 YT1bKVZJ5+WC58UvkDH7Eb/x6oBGLMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-6Hgrh1ikM-at1sTuVyXqfA-1; Thu, 29 Apr 2021 04:44:59 -0400
X-MC-Unique: 6Hgrh1ikM-at1sTuVyXqfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F68B1006C80;
 Thu, 29 Apr 2021 08:44:58 +0000 (UTC)
Received: from work-vm (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 981B6610DF;
 Thu, 29 Apr 2021 08:44:54 +0000 (UTC)
Date: Thu, 29 Apr 2021 09:44:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <YIpyA+ZoOYxX0c06@work-vm>
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
 <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
 <20210427121850.68d2a8dd@redhat.com> <YIhfWoRgJtaKZhh8@work-vm>
 <CANsN3OSs4GyT10P6xUp-s823U8VnWAmihWXQ1jSnF07wyYjxuA@mail.gmail.com>
 <YIm0w2RgQgosIyiB@work-vm> <20210428133740.6ccbbba6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428133740.6ccbbba6@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Dev Audsin <dev.devaqemu@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Wed, 28 Apr 2021 20:17:23 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Dev Audsin (dev.devaqemu@gmail.com) wrote:
> > > Thanks Dave for your explanation.
> > > Any suggestions on how to make VFIO not attempt to map into the
> > > unaccessible and unallocated RAM.  
> > 
> > I'm not sure;:
> > 
> > static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> > {
> >     return (!memory_region_is_ram(section->mr) &&
> >             !memory_region_is_iommu(section->mr)) ||
> >            section->offset_within_address_space & (1ULL << 63);
> > }
> > 
> > I'm declaring that region with memory_region_init_ram_ptr;  should I be?
> > it's not quite like RAM.
> > But then I *do* want a kvm slot for it, and I do want it to be accessed
> > by mapping rather htan calling IO functions; that makes me think mr->ram
> > has to be true.
> > But then do we need to add another flag to memory-regions; if we do,
> > what is it;
> >    a) We don't want an 'is_virtio_fs' - it needs to be more generic
> >    b) 'no_vfio' also feels wrong
> > 
> > Is perhaps 'not_lockable' the right thing to call it?
> 
> This reasoning just seems to lead back to "it doesn't work, therefore
> don't do it" rather than identifying the property of the region that
> makes it safe not to map it for device DMA (assuming that's actually
> the case). 

Yes, I'm struggling to get to what that generic form of that property
is, possibly because I've not got an example of another case to compare
it with.

> It's clearly "RAM" as far as QEMU is concerned given how
> it's created, but does it actually appear in the VM as generic physical
> RAM that the guest OS could program to the device as a DMA target?  If
> not, what property makes that so, create a flag for that.  Thanks,

The guest sees it as a PCI-bar; so it knows it's not 'generic physical
RAM' - but can a guest set other BARs (like frame buffers or pmem) as
DMA targets?  If so, how do I distinguish our bar?

Dave

> Alex
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


