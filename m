Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720A198A10
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 04:39:31 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ6oL-00012r-R6
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 22:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jJ6nQ-0000bv-Ih
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 22:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jJ6nN-00089E-82
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 22:38:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:22801)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jJ6nN-00088q-3W
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 22:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585622308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Zjk6zVyXviF2yJqeMVEc17A9O2UkcWK4AEBamd4Rn8=;
 b=ZmeNsZ3B92thL2ruZ7xeys1M2WrkESn5IDcaIEFESOJZmTj8t4JLTtIA2hoMvWXaEqsvmx
 YCIl4tL1ym43PsngwGzMtsE2YAZ7s2Z0bTv1YSD/9D02RQn787HC5SCArfMvIPeD72nFC6
 RYP1+YjRLe7wJA6zvjKcbiNEkopEFqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Gh0NrGkGPCmfjMMO_ZqHgg-1; Mon, 30 Mar 2020 22:38:21 -0400
X-MC-Unique: Gh0NrGkGPCmfjMMO_ZqHgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7A21100726D;
 Tue, 31 Mar 2020 02:38:18 +0000 (UTC)
Received: from x1.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D8E260BE2;
 Tue, 31 Mar 2020 02:38:17 +0000 (UTC)
Date: Mon, 30 Mar 2020 20:38:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v16 Kernel 4/7] vfio iommu: Implementation of ioctl for
 dirty pages tracking.
Message-ID: <20200330203816.4c26ae53@x1.home>
In-Reply-To: <20200331011621.GC6631@joy-OptiPlex-7040>
References: <20200325021135.GB20109@joy-OptiPlex-7040>
 <33d38629-aeaf-1c30-26d4-958b998620b0@nvidia.com>
 <20200327003055.GB26419@joy-OptiPlex-7040>
 <deb8b18f-aa79-70d3-ce05-89b607f813c4@nvidia.com>
 <20200330032437.GD30683@joy-OptiPlex-7040>
 <e91dbf70-05bf-977f-208b-0fb5988af3a8@nvidia.com>
 <20200330235131.GB6478@joy-OptiPlex-7040>
 <20200330185347.58b1ab93@x1.home>
 <20200331005046.GB6631@joy-OptiPlex-7040>
 <20200330191259.42c560ee@x1.home>
 <20200331011621.GC6631@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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

On Mon, 30 Mar 2020 21:16:21 -0400
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Tue, Mar 31, 2020 at 09:12:59AM +0800, Alex Williamson wrote:
> > On Mon, 30 Mar 2020 20:50:47 -0400
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >   
> > > On Tue, Mar 31, 2020 at 08:53:47AM +0800, Alex Williamson wrote:  
> > > > On Mon, 30 Mar 2020 19:51:31 -0400
> > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > >     
> > > > > On Mon, Mar 30, 2020 at 09:49:21PM +0800, Kirti Wankhede wrote:    
> > > > > > 
> > > > > > 
> > > > > > On 3/30/2020 8:54 AM, Yan Zhao wrote:      
> > > > > > > On Fri, Mar 27, 2020 at 01:28:13PM +0800, Kirti Wankhede wrote:      
> > > > > > >> Hit send button little early.
> > > > > > >>      
> > > > > > >>   >
> > > > > > >>   > I checked v12, it's not like what I said.
> > > > > > >>   > In v12, bitmaps are generated per vfio_dma, and combination of the
> > > > > > >>   > bitmaps are required in order to generate a big bitmap suiting for dirty
> > > > > > >>   > query. It can cause problem when offset not aligning.
> > > > > > >>   > But what I propose here is to generate an rb tree orthogonal to the tree
> > > > > > >>   > of vfio_dma.
> > > > > > >>   >
> > > > > > >>   > as to CPU cycles saving, I don't think iterating/translating page by page
> > > > > > >>   > would achieve that purpose.
> > > > > > >>   >      
> > > > > > >>
> > > > > > >> Instead of creating one extra rb tree for dirty pages tracking in v10
> > > > > > >> tried to use dma->pfn_list itself, we tried changes in v10, v11 and v12,
> > > > > > >> latest version is evolved version with best possible approach after
> > > > > > >> discussion. Probably, go through v11 as well.
> > > > > > >> https://patchwork.kernel.org/patch/11298335/
> > > > > > >>      
> > > > > > > I'm not sure why all those previous implementations are bound to
> > > > > > > vfio_dma. for vIOMMU on, in most cases, a vfio_dma is only for a page,
> > > > > > > so generating a one-byte bitmap for a single page in each vfio_dma ?
> > > > > > > is it possible to creating one extra rb tree to keep dirty ranges, and
> > > > > > > one fixed length kernel bitmap whose content is generated on query,
> > > > > > > serving as a bouncing buffer for copy_to_user
> > > > > > >       
> > > > > > 
> > > > > > One fixed length? what should be fixed value? then isn't it better to 
> > > > > > fix the size to dma->size?
> > > > > > 
> > > > > > This is also to prevent DoS attack, user space application can query a 
> > > > > > very large range.
> > > > > >       
> > > > > > >>
> > > > > > >> On 3/27/2020 6:00 AM, Yan Zhao wrote:      
> > > > > > >>> On Fri, Mar 27, 2020 at 05:39:01AM +0800, Kirti Wankhede wrote:      
> > > > > > >>>>
> > > > > > >>>>
> > > > > > >>>> On 3/25/2020 7:41 AM, Yan Zhao wrote:      
> > > > > > >>>>> On Wed, Mar 25, 2020 at 05:18:52AM +0800, Kirti Wankhede wrote:      
> > > > > > >>>>>> VFIO_IOMMU_DIRTY_PAGES ioctl performs three operations:
> > > > > > >>>>>> - Start dirty pages tracking while migration is active
> > > > > > >>>>>> - Stop dirty pages tracking.
> > > > > > >>>>>> - Get dirty pages bitmap. Its user space application's responsibility to
> > > > > > >>>>>>      copy content of dirty pages from source to destination during migration.
> > > > > > >>>>>>
> > > > > > >>>>>> To prevent DoS attack, memory for bitmap is allocated per vfio_dma
> > > > > > >>>>>> structure. Bitmap size is calculated considering smallest supported page
> > > > > > >>>>>> size. Bitmap is allocated for all vfio_dmas when dirty logging is enabled
> > > > > > >>>>>>
> > > > > > >>>>>> Bitmap is populated for already pinned pages when bitmap is allocated for
> > > > > > >>>>>> a vfio_dma with the smallest supported page size. Update bitmap from
> > > > > > >>>>>> pinning functions when tracking is enabled. When user application queries
> > > > > > >>>>>> bitmap, check if requested page size is same as page size used to
> > > > > > >>>>>> populated bitmap. If it is equal, copy bitmap, but if not equal, return
> > > > > > >>>>>> error.
> > > > > > >>>>>>
> > > > > > >>>>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > > > > >>>>>> Reviewed-by: Neo Jia <cjia@nvidia.com>
> > > > > > >>>>>> ---
> > > > > > >>>>>>     drivers/vfio/vfio_iommu_type1.c | 266 +++++++++++++++++++++++++++++++++++++++-
> > > > > > >>>>>>     1 file changed, 260 insertions(+), 6 deletions(-)
> > > > > > >>>>>>
> > > > > > >>>>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > > > > > >>>>>> index 70aeab921d0f..874a1a7ae925 100644
> > > > > > >>>>>> --- a/drivers/vfio/vfio_iommu_type1.c
> > > > > > >>>>>> +++ b/drivers/vfio/vfio_iommu_type1.c
> > > > > > >>>>>> @@ -71,6 +71,7 @@ struct vfio_iommu {
> > > > > > >>>>>>     	unsigned int		dma_avail;
> > > > > > >>>>>>     	bool			v2;
> > > > > > >>>>>>     	bool			nesting;
> > > > > > >>>>>> +	bool			dirty_page_tracking;
> > > > > > >>>>>>     };
> > > > > > >>>>>>     
> > > > > > >>>>>>     struct vfio_domain {
> > > > > > >>>>>> @@ -91,6 +92,7 @@ struct vfio_dma {
> > > > > > >>>>>>     	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
> > > > > > >>>>>>     	struct task_struct	*task;
> > > > > > >>>>>>     	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
> > > > > > >>>>>> +	unsigned long		*bitmap;
> > > > > > >>>>>>     };
> > > > > > >>>>>>     
> > > > > > >>>>>>     struct vfio_group {
> > > > > > >>>>>> @@ -125,7 +127,21 @@ struct vfio_regions {
> > > > > > >>>>>>     #define IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)	\
> > > > > > >>>>>>     					(!list_empty(&iommu->domain_list))
> > > > > > >>>>>>     
> > > > > > >>>>>> +#define DIRTY_BITMAP_BYTES(n)	(ALIGN(n, BITS_PER_TYPE(u64)) / BITS_PER_BYTE)
> > > > > > >>>>>> +
> > > > > > >>>>>> +/*
> > > > > > >>>>>> + * Input argument of number of bits to bitmap_set() is unsigned integer, which
> > > > > > >>>>>> + * further casts to signed integer for unaligned multi-bit operation,
> > > > > > >>>>>> + * __bitmap_set().
> > > > > > >>>>>> + * Then maximum bitmap size supported is 2^31 bits divided by 2^3 bits/byte,
> > > > > > >>>>>> + * that is 2^28 (256 MB) which maps to 2^31 * 2^12 = 2^43 (8TB) on 4K page
> > > > > > >>>>>> + * system.
> > > > > > >>>>>> + */
> > > > > > >>>>>> +#define DIRTY_BITMAP_PAGES_MAX	(uint64_t)(INT_MAX - 1)
> > > > > > >>>>>> +#define DIRTY_BITMAP_SIZE_MAX	 DIRTY_BITMAP_BYTES(DIRTY_BITMAP_PAGES_MAX)
> > > > > > >>>>>> +
> > > > > > >>>>>>     static int put_pfn(unsigned long pfn, int prot);
> > > > > > >>>>>> +static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu);
> > > > > > >>>>>>     
> > > > > > >>>>>>     /*
> > > > > > >>>>>>      * This code handles mapping and unmapping of user data buffers
> > > > > > >>>>>> @@ -175,6 +191,77 @@ static void vfio_unlink_dma(struct vfio_iommu *iommu, struct vfio_dma *old)
> > > > > > >>>>>>     	rb_erase(&old->node, &iommu->dma_list);
> > > > > > >>>>>>     }
> > > > > > >>>>>>     
> > > > > > >>>>>> +
> > > > > > >>>>>> +static int vfio_dma_bitmap_alloc(struct vfio_dma *dma, uint64_t pgsize)
> > > > > > >>>>>> +{
> > > > > > >>>>>> +	uint64_t npages = dma->size / pgsize;
> > > > > > >>>>>> +      
> > > > > > > If pgsize > dma->size, npages = 0.
> > > > > > > wouldn't it cause problem?
> > > > > > >       
> > > > > > 
> > > > > > This patch-set supports bitmap for smallest supported page size, i.e. 
> > > > > > PAGE_SIZE. vfio_dma_do_map() validates dma->size accordingly. So this 
> > > > > > case will not happen.
> > > > > >       
> > > > > as far as I know, qemu/kvm uses 4k as the unit for dirty page tracking.
> > > > > so why smallest iommu page size is used here?
> > > > > wouldn't it cause problem?    
> > > > 
> > > > If your concern is that the IOMMU supports sub-4K page sizes, see
> > > > vfio_pgsize_bitmap().  We actually only support PAGE_SIZE as our
> > > > minimum mapping unit, even if the IOMMU supports less, so PAGE_SIZE is
> > > > our lower bound.  Thanks,    
> > > 
> > > if we always uses PAGE_SIZE, why not use PAGE_SIZE directly?
> > > or returning dirty bitmap unit (e.g. 1 << __ffs(vfio_pgsize_bitmap(iommu)))
> > > to QEMU in VFIO_IOMMU_DIRTY_PAGES_FLAG_START, so that qemu can do possible
> > > conversion if it's not the same unit that QEMU uses.  
> > 
> > The vfio interface is essentially just an extension of the IOMMU API
> > via domain->pgsize_bitmap.  intel-iommu mostly made the bitmask
> > meaningless by reporting essentially PAGE_MASK, and we just expose the
> > common version of that across potentially all the IOMMUs used by the
> > domain, modulo minimum of PAGE_SIZE.  Thanks,  
> 
> ok. got it. do you think it's good to return this iommu page size
> when turning on dirty page tracking? so when GET_BITMAP ioctl
> comes, we don't need to quit if range.bitmap.pgsize != iommu_pgsize.
> instead, the GET_BITMAP can success with iommu page size and qemu does
> the bitmap conversion afterwards.

The bitmap is already expose to the user via
vfio_iommu_type1_info.iova_pgsizes in the VFIO_IOMMU_GET_INFO ioctl.
Our original intention was to allow the user to specify the dirty
bitmap page size, which is still enabled in the ioctl via
bitmap.pgsize, but for simplification we currently only support the
smallest page size.  This could be something else we expose via the
extension interface when more page sizes are supported.  Thanks,

Alex


