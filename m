Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAE2CCA85
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:28:38 +0100 (CET)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbY5-0001c7-7M
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkbWJ-0000gR-Od
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkbWG-0005JR-3v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606951601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWWAVlZ3F4JUvO2KDubmHd4GWqBxWKfvc+hADaRuutg=;
 b=EKtlaQFHFUzf9r5/fo8cCWYYftlGTiP5bGxsz1qK//m8G6fxY+RTt7LCqKCbHC7hKSf1MK
 gQ0ylPS0FODJdR3kBZr0ehtczaP5HD807Hs9kF0OL7noN952OPReO6EbVewKrLDyn0lMjM
 EVUjTp8RSO6itO+8Qlm/Y2X6oaHBtT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-Cq5jQJ2JN-2c_8pftEJ8Ww-1; Wed, 02 Dec 2020 18:26:38 -0500
X-MC-Unique: Cq5jQJ2JN-2c_8pftEJ8Ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5D580364D;
 Wed,  2 Dec 2020 23:26:36 +0000 (UTC)
Received: from w520.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D26B210013C0;
 Wed,  2 Dec 2020 23:26:16 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:26:15 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/9] memory: Introduce RamDiscardMgr for RAM memory
 regions
Message-ID: <20201202162615.523a6a75@w520.home>
In-Reply-To: <20201119153918.120976-2-david@redhat.com>
References: <20201119153918.120976-1-david@redhat.com>
 <20201119153918.120976-2-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 16:39:10 +0100
David Hildenbrand <david@redhat.com> wrote:

> We have some special RAM memory regions (managed by virtio-mem), whereby
> the guest agreed to only use selected memory ranges. "unused" parts are
> discarded so they won't consume memory - to logically unplug these memory
> ranges. Before the VM is allowed to use such logically unplugged memory
> again, coordination with the hypervisor is required.
> 
> This results in "sparse" mmaps/RAMBlocks/memory regions, whereby only
> coordinated parts are valid to be used/accessed by the VM.
> 
> In most cases, we don't care about that - e.g., in KVM, we simply have a
> single KVM memory slot. However, in case of vfio, registering the
> whole region with the kernel results in all pages getting pinned, and
> therefore an unexpected high memory consumption - discarding of RAM in
> that context is broken.
> 
> Let's introduce a way to coordinate discarding/populating memory within a
> RAM memory region with such special consumers of RAM memory regions: they
> can register as listeners and get updates on memory getting discarded and
> populated. Using this machinery, vfio will be able to map only the
> currently populated parts, resulting in discarded parts not getting pinned
> and not consuming memory.
> 
> A RamDiscardMgr has to be set for a memory region before it is getting
> mapped, and cannot change while the memory region is mapped.
> 
> Note: At some point, we might want to let RAMBlock users (esp. vfio used
> for nvme://) consume this interface as well. We'll need RAMBlock notifier
> calls when a RAMBlock is getting mapped/unmapped (via the corresponding
> memory region), so we can properly register a listener there as well.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/memory.h | 225 ++++++++++++++++++++++++++++++++++++++++++
>  softmmu/memory.c      |  22 +++++
>  2 files changed, 247 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0f3e6bcd5e..468cbb53a4 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
...
> @@ -425,6 +501,120 @@ struct IOMMUMemoryRegionClass {
>                                       Error **errp);
>  };
>  
> +/*
> + * RamDiscardMgrClass:
> + *
> + * A #RamDiscardMgr coordinates which parts of specific RAM #MemoryRegion
> + * regions are currently populated to be used/accessed by the VM, notifying
> + * after parts were discarded (freeing up memory) and before parts will be
> + * populated (consuming memory), to be used/acessed by the VM.
> + *
> + * A #RamDiscardMgr can only be set for a RAM #MemoryRegion while the
> + * #MemoryRegion isn't mapped yet; it cannot change while the #MemoryRegion is
> + * mapped.
> + *
> + * The #RamDiscardMgr is intended to be used by technologies that are
> + * incompatible with discarding of RAM (e.g., VFIO, which may pin all
> + * memory inside a #MemoryRegion), and require proper coordination to only
> + * map the currently populated parts, to hinder parts that are expected to
> + * remain discarded from silently getting populated and consuming memory.
> + * Technologies that support discarding of RAM don't have to bother and can
> + * simply map the whole #MemoryRegion.
> + *
> + * An example #RamDiscardMgr is virtio-mem, which logically (un)plugs
> + * memory within an assigned RAM #MemoryRegion, coordinated with the VM.
> + * Logically unplugging memory consists of discarding RAM. The VM agreed to not
> + * access unplugged (discarded) memory - especially via DMA. virtio-mem will
> + * properly coordinate with listeners before memory is plugged (populated),
> + * and after memory is unplugged (discarded).
> + *
> + * Listeners are called in multiples of the minimum granularity and changes are
> + * aligned to the minimum granularity within the #MemoryRegion. Listeners have
> + * to prepare for memory becomming discarded in a different granularity than it
> + * was populated and the other way around.
> + */
> +struct RamDiscardMgrClass {
> +    /* private */
> +    InterfaceClass parent_class;
> +
> +    /* public */
> +
> +    /**
> +     * @get_min_granularity:
> +     *
> +     * Get the minimum granularity in which listeners will get notified
> +     * about changes within the #MemoryRegion via the #RamDiscardMgr.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     *
> +     * Returns the minimum granularity.
> +     */
> +    uint64_t (*get_min_granularity)(const RamDiscardMgr *rdm,
> +                                    const MemoryRegion *mr);
> +
> +    /**
> +     * @is_populated:
> +     *
> +     * Check whether the given range within the #MemoryRegion is completely
> +     * populated (i.e., no parts are currently discarded). There are no
> +     * alignment requirements for the range.
> +     *
> +     * @rdm: the #RamDiscardMgr
> +     * @mr: the #MemoryRegion
> +     * @offset: offset into the #MemoryRegion
> +     * @size: size in the #MemoryRegion
> +     *
> +     * Returns the minimum granularity.


I think the return description got copied from above, this returns bool.

...
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index aa393f1bb0..fbdc50fa8b 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2013,6 +2013,21 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
>      return imrc->num_indexes(iommu_mr);
>  }
>  
> +RamDiscardMgr *memory_region_get_ram_discard_mgr(MemoryRegion *mr)
> +{
> +    if (!memory_region_is_mapped(mr) || !memory_region_is_ram(mr)) {
> +        return false;

s/false/NULL/?

> +    }
> +    return mr->rdm;
> +}
> +


