Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134EA2DD984
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 20:49:30 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzHE-0003k7-5d
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 14:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kpzFW-0002mv-V9
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 14:47:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kpzFO-00013u-Sa
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 14:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608234453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdSBq6xS8sZyIaobpPb6EaLdp8a1+iicKd4enoCFrLQ=;
 b=PISfIb6AjEhQEr4Be+m3AufczOh+K/oji+AGiaFQBPTj0c+Y1632Wtpd20biOYbK2hY9xb
 nbXHWXKOiJHMxY4gQck6aLJhgUCMBVnHcdYTx7JXcpmg6ZJnIXdfOd8LJW687K7s8X8YPa
 bJGQAx5KizCSElF4f9wOS1iLd6DrWTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-BTIlcPqVNhyE0Rk60IB-XQ-1; Thu, 17 Dec 2020 14:47:29 -0500
X-MC-Unique: BTIlcPqVNhyE0Rk60IB-XQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB0B59;
 Thu, 17 Dec 2020 19:47:28 +0000 (UTC)
Received: from omen.home (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08AF35D9CD;
 Thu, 17 Dec 2020 19:47:09 +0000 (UTC)
Date: Thu, 17 Dec 2020 12:47:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 04/10] vfio: Query and store the maximum number of
 DMA mappings
Message-ID: <20201217124709.72b0706f@omen.home>
In-Reply-To: <bb621937-3d39-bade-082a-892f4126b018@redhat.com>
References: <20201216141200.118742-1-david@redhat.com>
 <20201216141200.118742-5-david@redhat.com>
 <20201217105512.78a2ef71@omen.home>
 <bb621937-3d39-bade-082a-892f4126b018@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 20:04:28 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 17.12.20 18:55, Alex Williamson wrote:
> > On Wed, 16 Dec 2020 15:11:54 +0100
> > David Hildenbrand <david@redhat.com> wrote:
> >   
> >> Let's query the maximum number of DMA mappings by querying the available
> >> mappings when creating the container.
> >>
> >> In addition, count the number of DMA mappings and warn when we would
> >> exceed it. This is a preparation for RamDiscardMgr which might
> >> create quite some DMA mappings over time, and we at least want to warn
> >> early that the QEMU setup might be problematic. Use "reserved"
> >> terminology, so we can use this to reserve mappings before they are
> >> actually created.  
> > 
> > This terminology doesn't make much sense to me, we're not actually
> > performing any kind of reservation.  
> 
> I see you spotted the second user which actually performs reservations.
> 
> >   
> >> Note: don't reserve vIOMMU DMA mappings - using the vIOMMU region size
> >> divided by the mapping page size might be a bad indication of what will
> >> happen in practice - we might end up warning all the time.  
> > 
> > This suggests we're not really tracking DMA "reservations" at all.
> > Would something like dma_regions_mappings be a more appropriate
> > identifier for the thing you're trying to count?  We might as well also  
> 
> Right now I want to count
> - Mappings we know we will definitely have (counted in this patch)
> - Mappings we know we could eventually have later (RamDiscardMgr)
> 
> > keep a counter for dma_iommu_mappings where the sum of those two should
> > stay below dma_max_mappings.  
> 
> We could, however, tracking active IOMMU mappings when removing a memory
> region from the address space isn't easily possible - we do a single
> vfio_dma_unmap() which might span multiple mappings. Same applies to
> RamDiscardMgr. Hard to count how many mappings we actually *currently*
> have using that approach.

It's actually easy for the RamDiscardMgr regions, the unmap ioctl
returns the total size of the unmapped extents.  Therefore since we
only map granule sized extents, simple math should tell us how many
entries we freed.  OTOH, if there are other ways that we unmap multiple
mappings where we don't have those semantics, then it would be
prohibitive.


> >> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Cc: Alex Williamson <alex.williamson@redhat.com>
> >> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> >> Cc: Peter Xu <peterx@redhat.com>
> >> Cc: Auger Eric <eric.auger@redhat.com>
> >> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> >> Cc: teawater <teawaterz@linux.alibaba.com>
> >> Cc: Marek Kedzierski <mkedzier@redhat.com>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>  hw/vfio/common.c              | 34 ++++++++++++++++++++++++++++++++++
> >>  include/hw/vfio/vfio-common.h |  2 ++
> >>  2 files changed, 36 insertions(+)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 6ff1daa763..5ad88d476f 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -288,6 +288,26 @@ const MemoryRegionOps vfio_region_ops = {
> >>      },
> >>  };
> >>  
> >> +static void vfio_container_dma_reserve(VFIOContainer *container,
> >> +                                       unsigned long dma_mappings)
> >> +{
> >> +    bool warned = container->dma_reserved > container->dma_max;
> >> +
> >> +    container->dma_reserved += dma_mappings;
> >> +    if (!warned && container->dma_max &&
> >> +        container->dma_reserved > container->dma_max) {
> >> +        warn_report("%s: possibly running out of DMA mappings. "
> >> +                    " Maximum number of DMA mappings: %d", __func__,
> >> +                    container->dma_max);  
> > 
> > If we kept track of all the mappings we could predict better than
> > "possibly".  Tracing support to track a high water mark might be useful
> > too.  
> 
> It's an early warning for reservations e.g., on fundamental setup issues
> with virtio-mem.
> 
> [...]
> 
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> >> index 6141162d7a..fed0e85f66 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -88,6 +88,8 @@ typedef struct VFIOContainer {
> >>      uint64_t dirty_pgsizes;
> >>      uint64_t max_dirty_bitmap_size;
> >>      unsigned long pgsizes;
> >> +    unsigned int dma_max;
> >> +    unsigned long dma_reserved;  
> > 
> > If dma_max is unsigned int, why do we need an unsigned long to track
> > how many are in use?  Thanks,  
> 
> My thinking was that some vfio IOMMU types don't have such a limit
> (dma_max == -1) and could allow for more. But thinking again, such a
> huge number of mappings is highly unrealistic :)

Yeah, that's why it's only an unsigned int from the kernel, even with
4K mappings we could handle 16TB worth of individual 4K mappings.
Thanks,

Alex


