Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FFF18D869
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 20:29:27 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFNKg-0001Va-TK
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 15:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jFNJq-00015k-Pf
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:28:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jFNJo-0005Fk-JQ
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:28:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:28373)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jFNJn-0005FU-Hw
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584732510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSacNiomkjHRYt8hl4uETt5NhZ8Dw3OLGCpgF0/x/eI=;
 b=hhyo6eAzto/ruFIavm5CqB0YK1OuRG2Oh9ElhQX9I6kG9nDL2/2rFihypJemTz/QnORAQg
 w0y5sH2pZYJsH7ZHL5CXb5GSDVlDunf9gQhZI2DrB+30PL76dY+8nF4nDKp9O+kp2GJqd8
 iAFJ3p4NCFXzm36DMmNB5KU/HH/S0sg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-rtNs82J8MZigXoIT04Jmxg-1; Fri, 20 Mar 2020 15:28:27 -0400
X-MC-Unique: rtNs82J8MZigXoIT04Jmxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C65800EBD;
 Fri, 20 Mar 2020 19:28:24 +0000 (UTC)
Received: from w520.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 311DB73897;
 Fri, 20 Mar 2020 19:28:22 +0000 (UTC)
Date: Fri, 20 Mar 2020 13:28:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v14 Kernel 5/7] vfio iommu: Update UNMAP_DMA ioctl to
 get dirty bitmap before unmap
Message-ID: <20200320132821.2fe80c29@w520.home>
In-Reply-To: <aa76ad96-394f-f1fb-2e8d-a453bd69a39b@nvidia.com>
References: <1584560474-19946-1-git-send-email-kwankhede@nvidia.com>
 <1584560474-19946-6-git-send-email-kwankhede@nvidia.com>
 <20200320083529.GA5456@joy-OptiPlex-7040>
 <20200320094039.4d99408d@w520.home>
 <20200320094727.12aba30e@w520.home>
 <aa76ad96-394f-f1fb-2e8d-a453bd69a39b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Yan Zhao <yan.y.zhao@intel.com>, "Liu, Changpeng" <changpeng.liu@intel.com>,
 "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Mar 2020 00:44:32 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 3/20/2020 9:17 PM, Alex Williamson wrote:
> > On Fri, 20 Mar 2020 09:40:39 -0600
> > Alex Williamson <alex.williamson@redhat.com> wrote:
> >   
> >> On Fri, 20 Mar 2020 04:35:29 -0400
> >> Yan Zhao <yan.y.zhao@intel.com> wrote:
> >>  
> >>> On Thu, Mar 19, 2020 at 03:41:12AM +0800, Kirti Wankhede wrote:  
> >>>> DMA mapped pages, including those pinned by mdev vendor drivers, might
> >>>> get unpinned and unmapped while migration is active and device is still
> >>>> running. For example, in pre-copy phase while guest driver could access
> >>>> those pages, host device or vendor driver can dirty these mapped pages.
> >>>> Such pages should be marked dirty so as to maintain memory consistency
> >>>> for a user making use of dirty page tracking.
> >>>>
> >>>> To get bitmap during unmap, user should set flag
> >>>> VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP, bitmap memory should be allocated and
> >>>> zeroed by user space application. Bitmap size and page size should be set
> >>>> by user application.
> >>>>
> >>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> >>>> Reviewed-by: Neo Jia <cjia@nvidia.com>
> >>>> ---
> >>>>   drivers/vfio/vfio_iommu_type1.c | 55 ++++++++++++++++++++++++++++++++++++++---
> >>>>   include/uapi/linux/vfio.h       | 11 +++++++++
> >>>>   2 files changed, 62 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>>> index d6417fb02174..aa1ac30f7854 100644
> >>>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>>> @@ -939,7 +939,8 @@ static int verify_bitmap_size(uint64_t npages, uint64_t bitmap_size)
> >>>>   }
> >>>>   
> >>>>   static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
> >>>> -			     struct vfio_iommu_type1_dma_unmap *unmap)
> >>>> +			     struct vfio_iommu_type1_dma_unmap *unmap,
> >>>> +			     struct vfio_bitmap *bitmap)
> >>>>   {
> >>>>   	uint64_t mask;
> >>>>   	struct vfio_dma *dma, *dma_last = NULL;
> >>>> @@ -990,6 +991,10 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
> >>>>   	 * will be returned if these conditions are not met.  The v2 interface
> >>>>   	 * will only return success and a size of zero if there were no
> >>>>   	 * mappings within the range.
> >>>> +	 *
> >>>> +	 * When VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP flag is set, unmap request
> >>>> +	 * must be for single mapping. Multiple mappings with this flag set is
> >>>> +	 * not supported.
> >>>>   	 */
> >>>>   	if (iommu->v2) {
> >>>>   		dma = vfio_find_dma(iommu, unmap->iova, 1);
> >>>> @@ -997,6 +1002,13 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
> >>>>   			ret = -EINVAL;
> >>>>   			goto unlock;
> >>>>   		}
> >>>> +
> >>>> +		if ((unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
> >>>> +		    (dma->iova != unmap->iova || dma->size != unmap->size)) {  
> >>> dma is probably NULL here!  
> >>
> >> Yep, I didn't look closely enough there.  This is situated right
> >> between the check to make sure we're not bisecting a mapping at the
> >> start of the unmap and the check to make sure we're not bisecting a
> >> mapping at the end of the unmap.  There's no guarantee that we have a
> >> valid pointer here.  The test should be in the while() loop below this
> >> code.  
> > 
> > Actually the test could remain here, we can exit here if we can't find
> > a dma at the start of the unmap range with the GET_DIRTY_BITMAP flag,
> > but we absolutely cannot deref dma without testing it.
> >   
> 
> In the check above newly added check, if dma is NULL then its an error 
> condition, because Unmap requests must fully cover previous mappings, right?

Yes, but we'll do a null pointer deref before we return error.
 
> >>> And this restriction on UNMAP would make some UNMAP operations of vIOMMU
> >>> fail.
> >>>
> >>> e.g. below condition indeed happens in reality.
> >>> an UNMAP ioctl comes for IOVA range from 0xff800000, of size 0x200000
> >>> However, IOVAs in this range are mapped page by page.i.e., dma->size is 0x1000.
> >>>
> >>> Previous, this UNMAP ioctl could unmap successfully as a whole.  
> >>
> >> What triggers this in the guest?  Note that it's only when using the
> >> GET_DIRTY_BITMAP flag that this is restricted.  Does the event you're
> >> referring to potentially occur under normal circumstances in that mode?
> >> Thanks,
> >>  
> 
> Such unmap would callback vfio_iommu_map_notify() in QEMU. In 
> vfio_iommu_map_notify(), unmap is called on same range <iova, 
> iotlb->addr_mask + 1> which was used for map. Secondly unmap with bitmap 
> will be called only when device state has _SAVING flag set.

It might be helpful for Yan, and everyone else, to see the latest QEMU
patch series.  Thanks,

Alex


