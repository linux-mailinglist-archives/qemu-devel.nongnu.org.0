Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C36A158902
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 04:47:09 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1MVw-0005oJ-0i
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 22:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1j1MUn-0005M7-Bc
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 22:45:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1j1MUl-00027C-0G
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 22:45:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41683
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1j1MUk-00024C-OV
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 22:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581392753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLreuKDQnVP1qxn00iL9j13bP5xdKEe/C8Xvd/QG9oE=;
 b=AEIZnEsXID5mLrMRAWiaV7XVcOg9mKlv+w+sJJdFtIO+KRIE7GPGt7xSpjIJcqYEqySbla
 FCCcxe4SV5iNdtRJLWTj1bdAjmVtbSd/bFkiyW0K1ahqhIpqH4mTarCLHrwOai0wen//y4
 s/javPNeuVNhwkF9OHq2Qhi8TbxlD7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-bEV1dfsKPU-sOgJuahBnCA-1; Mon, 10 Feb 2020 22:45:49 -0500
X-MC-Unique: bEV1dfsKPU-sOgJuahBnCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8177B1005502;
 Tue, 11 Feb 2020 03:45:46 +0000 (UTC)
Received: from x1.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B85582063;
 Tue, 11 Feb 2020 03:45:43 +0000 (UTC)
Date: Mon, 10 Feb 2020 20:45:43 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v12 Kernel 4/7] vfio iommu: Implementation of ioctl to
 for dirty pages tracking.
Message-ID: <20200210204543.11bf8a3d@x1.home>
In-Reply-To: <20200211025251.GB4530@joy-OptiPlex-7040>
References: <1581104554-10704-1-git-send-email-kwankhede@nvidia.com>
 <1581104554-10704-5-git-send-email-kwankhede@nvidia.com>
 <20200210094954.GA4530@joy-OptiPlex-7040>
 <20200210124454.12e0419a@w520.home>
 <20200211025251.GB4530@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Kirti Wankhede <kwankhede@nvidia.com>, "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Feb 2020 21:52:51 -0500
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Tue, Feb 11, 2020 at 03:44:54AM +0800, Alex Williamson wrote:
> > On Mon, 10 Feb 2020 04:49:54 -0500
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >   
> > > On Sat, Feb 08, 2020 at 03:42:31AM +0800, Kirti Wankhede wrote:  
> > > > VFIO_IOMMU_DIRTY_PAGES ioctl performs three operations:
> > > > - Start pinned and unpinned pages tracking while migration is active
> > > > - Stop pinned and unpinned dirty pages tracking. This is also used to
> > > >   stop dirty pages tracking if migration failed or cancelled.
> > > > - Get dirty pages bitmap. This ioctl returns bitmap of dirty pages, its
> > > >   user space application responsibility to copy content of dirty pages
> > > >   from source to destination during migration.
> > > > 
> > > > To prevent DoS attack, memory for bitmap is allocated per vfio_dma
> > > > structure. Bitmap size is calculated considering smallest supported page
> > > > size. Bitmap is allocated when dirty logging is enabled for those
> > > > vfio_dmas whose vpfn list is not empty or whole range is mapped, in
> > > > case of pass-through device.
> > > > 
> > > > There could be multiple option as to when bitmap should be populated:
> > > > * Polulate bitmap for already pinned pages when bitmap is allocated for
> > > >   a vfio_dma with the smallest supported page size. Updates bitmap from
> > > >   page pinning and unpinning functions. When user application queries
> > > >   bitmap, check if requested page size is same as page size used to
> > > >   populated bitmap. If it is equal, copy bitmap. But if not equal,
> > > >   re-populated bitmap according to requested page size and then copy to
> > > >   user.
> > > >   Pros: Bitmap gets populated on the fly after dirty tracking has
> > > >         started.
> > > >   Cons: If requested page size is different than smallest supported
> > > >         page size, then bitmap has to be re-populated again, with
> > > >         additional overhead of allocating bitmap memory again for
> > > >         re-population of bitmap.
> > > > 
> > > > * Populate bitmap when bitmap is queried by user application.
> > > >   Pros: Bitmap is populated with requested page size. This eliminates
> > > >         the need to re-populate bitmap if requested page size is
> > > >         different than smallest supported pages size.
> > > >   Cons: There is one time processing time, when bitmap is queried.
> > > > 
> > > > I prefer later option with simple logic and to eliminate over-head of
> > > > bitmap repopulation in case of differnt page sizes. Later option is
> > > > implemented in this patch.
> > > > 
> > > > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > > Reviewed-by: Neo Jia <cjia@nvidia.com>
> > > > ---
> > > >  drivers/vfio/vfio_iommu_type1.c | 299 ++++++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 287 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > > > index d386461e5d11..df358dc1c85b 100644
> > > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > > +++ b/drivers/vfio/vfio_iommu_type1.c  
> > [snip]  
> > > > @@ -830,6 +924,113 @@ static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu)
> > > >  	return bitmap;
> > > >  }
> > > >  
> > > > +static int vfio_iova_dirty_bitmap(struct vfio_iommu *iommu, dma_addr_t iova,
> > > > +				  size_t size, uint64_t pgsize,
> > > > +				  unsigned char __user *bitmap)
> > > > +{
> > > > +	struct vfio_dma *dma;
> > > > +	dma_addr_t i = iova, iova_limit;
> > > > +	unsigned int bsize, nbits = 0, l = 0;
> > > > +	unsigned long pgshift = __ffs(pgsize);
> > > > +
> > > > +	while ((dma = vfio_find_dma(iommu, i, pgsize))) {
> > > > +		int ret, j;
> > > > +		unsigned int npages = 0, shift = 0;
> > > > +		unsigned char temp = 0;
> > > > +
> > > > +		/* mark all pages dirty if all pages are pinned and mapped. */
> > > > +		if (dma->iommu_mapped) {
> > > > +			iova_limit = min(dma->iova + dma->size, iova + size);
> > > > +			npages = iova_limit/pgsize;
> > > > +			bitmap_set(dma->bitmap, 0, npages);    
> > > for pass-through devices, it's not good to always return all pinned pages as
> > > dirty. could it also call vfio_pin_pages to track dirty pages? or any
> > > other interface provided to do that?  
> > 
> > See patch 7/7.  Thanks,
> >  
> hi Alex and Kirti,
> for pass-through devices, though patch 7/7 enables the vendor driver to
> set dirty pages by calling vfio_pin_pages, however, its overhead is much
> higher than the previous way of generating a bitmap directly to user.
> And it also requires pass-through device vendor driver to track guest
> operations to know when to call vfio_pin_pages.
> There are still use cases like a pass-through device is able to track
> dirty pages in its hardware buffer, so is there a way for it pass its
> dirty bitmap to user?

Not currently and this sounds like another argument in favor of using
the dirty bitmap per vfio_dma to directly track dirty pages.
Passthrough drivers could be provided an interface to set dirty bits
which could be merged with pfn list entries when the user requests the
bitmap, rather than requiring passthrough drivers to unnecessarily
allocate pfn list entries directly.  Thanks,

Alex


