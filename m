Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79012163C33
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 05:54:39 +0100 (CET)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4HNe-0003Eu-1U
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 23:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1j4HMl-0002pk-Uv
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 23:53:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1j4HMj-0006TS-Qi
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 23:53:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25466
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1j4HMj-0006T1-MN
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 23:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582088020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZQEarcZjA+qw1NyzHHfk9yqsM61NrOnqWFEATw0uTg=;
 b=f5FHnByVYP2NZI9YA5UWch4jxwIhAqd7C40YzOmu3KlTLbXjEGeHa/qCi92UKLlrhwYkJP
 nvekB3tAzys1oUR4e9l4RVw6a5MGW3twK3j34255oPOG8YOEUt2hRoYNNhrSLmDUyeOlfQ
 6DUdnNZma3YZFaAt/CZ4QssIzIKzjRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-IlubJAgBOmqQ-v_yMUrPFw-1; Tue, 18 Feb 2020 23:53:36 -0500
X-MC-Unique: IlubJAgBOmqQ-v_yMUrPFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4D9413E2;
 Wed, 19 Feb 2020 04:53:33 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF8C75C10D;
 Wed, 19 Feb 2020 04:53:30 +0000 (UTC)
Date: Tue, 18 Feb 2020 21:53:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v12 Kernel 4/7] vfio iommu: Implementation of ioctl to
 for dirty pages tracking.
Message-ID: <20200218215330.5bc8fc6a@w520.home>
In-Reply-To: <96d9990f-b27f-759e-1395-9b2eff218bfa@nvidia.com>
References: <1581104554-10704-1-git-send-email-kwankhede@nvidia.com>
 <1581104554-10704-5-git-send-email-kwankhede@nvidia.com>
 <20200210102518.490a0d87@x1.home>
 <7e7356c8-29ed-31fa-5c0b-2545ae69f321@nvidia.com>
 <20200212161320.02d8dfac@w520.home>
 <0244aca6-80f7-1c1d-812e-d53a48b5479d@nvidia.com>
 <20200213162011.40b760a8@w520.home>
 <ea31fb62-4cd3-babb-634d-f69407586c93@nvidia.com>
 <20200217135518.4d48ebd6@w520.home>
 <57199367-e562-800a-ef73-f28bc5ddb2fe@nvidia.com>
 <20200218144105.4076b7eb@w520.home>
 <96d9990f-b27f-759e-1395-9b2eff218bfa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 cjia@nvidia.com, kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Feb 2020 09:51:32 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 2/19/2020 3:11 AM, Alex Williamson wrote:
> > On Tue, 18 Feb 2020 11:28:53 +0530
> > Kirti Wankhede <kwankhede@nvidia.com> wrote:
> >   
> >> <snip>
> >>  
> >>>>>>>     As I understand the above algorithm, we find a vfio_dma
> >>>>>>> overlapping the request and populate the bitmap for that range.  Then
> >>>>>>> we go back and put_user() for each byte that we touched.  We could
> >>>>>>> instead simply work on a one byte buffer as we enumerate the requested
> >>>>>>> range and do a put_user() ever time we reach the end of it and have bits
> >>>>>>> set. That would greatly simplify the above example.  But I would expect
> >>>>>>> that we're a) more likely to get asked for ranges covering a single
> >>>>>>> vfio_dma  
> >>>>>>
> >>>>>> QEMU ask for single vfio_dma during each iteration.
> >>>>>>
> >>>>>> If we restrict this ABI to cover single vfio_dma only, then it
> >>>>>> simplifies the logic here. That was my original suggestion. Should we
> >>>>>> think about that again?  
> >>>>>
> >>>>> But we currently allow unmaps that overlap multiple vfio_dmas as long
> >>>>> as no vfio_dma is bisected, so I think that implies that an unmap while
> >>>>> asking for the dirty bitmap has even further restricted semantics.  I'm
> >>>>> also reluctant to design an ABI around what happens to be the current
> >>>>> QEMU implementation.
> >>>>>
> >>>>> If we take your example above, ranges {0x0000,0xa000} and
> >>>>> {0xa000,0x10000} ({start,end}), I think you're working with the
> >>>>> following two bitmaps in this implementation:
> >>>>>
> >>>>> 00000011 11111111b
> >>>>> 00111111b
> >>>>>
> >>>>> And we need to combine those into:
> >>>>>
> >>>>> 11111111 11111111b
> >>>>>
> >>>>> Right?
> >>>>>
> >>>>> But it seems like that would be easier if the second bitmap was instead:
> >>>>>
> >>>>> 11111100b
> >>>>>
> >>>>> Then we wouldn't need to worry about the entire bitmap being shifted by
> >>>>> the bit offset within the byte, which limits our fixes to the boundary
> >>>>> byte and allows us to use copy_to_user() directly for the bulk of the
> >>>>> copy.  So how do we get there?
> >>>>>
> >>>>> I think we start with allocating the vfio_dma bitmap to account for
> >>>>> this initial offset, so we calculate bitmap_base_iova as:
> >>>>>      (iova & ~((PAGE_SIZE << 3) - 1))
> >>>>> We then use bitmap_base_iova in calculating which bits to set.
> >>>>>
> >>>>> The user needs to follow the same rules, and maybe this adds some value
> >>>>> to the user providing the bitmap size rather than the kernel
> >>>>> calculating it.  For example, if the user wanted the dirty bitmap for
> >>>>> the range {0xa000,0x10000} above, they'd provide at least a 1 byte
> >>>>> bitmap, but we'd return bit #2 set to indicate 0xa000 is dirty.
> >>>>>
> >>>>> Effectively the user can ask for any iova range, but the buffer will be
> >>>>> filled relative to the zeroth bit of the bitmap following the above
> >>>>> bitmap_base_iova formula (and replacing PAGE_SIZE with the user
> >>>>> requested pgsize).  I'm tempted to make this explicit in the user
> >>>>> interface (ie. only allow bitmaps starting on aligned pages), but a
> >>>>> user is able to map and unmap single pages and we need to support
> >>>>> returning a dirty bitmap with an unmap, so I don't think we can do that.
> >>>>>         
> >>>>
> >>>> Sigh, finding adjacent vfio_dmas within the same byte seems simpler than
> >>>> this.  
> >>>
> >>> How does KVM do this?  My intent was that if all of our bitmaps share
> >>> the same alignment then we can merge the intersection and continue to
> >>> use copy_to_user() on either side.  However, if QEMU doesn't do the
> >>> same, it doesn't really help us.  Is QEMU stuck with an implementation
> >>> of only retrieving dirty bits per MemoryRegionSection exactly because
> >>> of this issue and therefore we can rely on it in our implementation as
> >>> well?  Thanks,
> >>>      
> >>
> >> QEMU sync dirty_bitmap per MemoryRegionSection. Within
> >> MemoryRegionSection there could be multiple KVMSlots. QEMU queries
> >> dirty_bitmap per KVMSlot and mark dirty for each KVMSlot.
> >> On kernel side, KVM_GET_DIRTY_LOG ioctl calls
> >> kvm_get_dirty_log_protect(), where it uses copy_to_user() to copy bitmap
> >> of that memSlot.
> >> vfio_dma is per MemoryRegionSection. We can reply on MemoryRegionSection
> >> in our implementation. But to get bitmap during unmap, we have to take
> >> care of concatenating bitmaps.  
> > 
> > So KVM does not worry about bitmap alignment because the interface is
> > based on slots, a dirty bitmap can only be retrieved for a single,
> > entire slot.  We need VFIO_IOMMU_UNMAP_DMA to maintain its support for
> > spanning multiple vfio_dmas, but maybe we have some leeway that we
> > don't need to support both multiple vfio_dmas and dirty bitmap at the
> > same time.  It seems like it would be a massive simplification if we
> > required an unmap with dirty bitmap to span exactly one vfio_dma,
> > right?   
> 
> Yes.
> 
> > I don't see that we'd break any existing users with that, it's
> > unfortunate that we can't have the flexibility of the existing calling
> > convention, but I think there's good reason for it here.  Our separate
> > dirty bitmap log reporting would follow the same semantics.  I think
> > this all aligns with how the MemoryListener works in QEMU right now,
> > correct?  For example we wouldn't need any extra per MAP_DMA tracking
> > in QEMU like KVM has for its slots.
> >   
> 
> That right.
> Should we go ahead with the implementation to get dirty bitmap for one 
> vfio_dma for GET_DIRTY ioctl and unmap with dirty ioctl? Accordingly we 
> can have sanity checks in these ioctls.

Yes, I'm convinced that bitmap alignment is sufficiently too difficult
and unnecessary to restrict the calling convention of UNMAP_DMA, when
using the dirty bitmap extension, to exactly unmap a single vfio_dma.
Thanks,

Alex


