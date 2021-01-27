Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B0305BE0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:46:40 +0100 (CET)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4kDX-0006H8-QA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4kCD-0005fK-2R
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:45:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4kCA-0003tx-UW
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611751513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Goo8THCnSblr4X7j6OdqCZZOJ9/1uYUtAXnnHLO9/bU=;
 b=VhjG/tIwf2aVcXQWUDQI1hM/K7L0us6dNAiFVa0S4k/Wau7ESxUGQvnYUAGr/tzMf1x2dN
 fZQkFaYLqdyRuPSnlnnl0MWIrv7VNnqgEMdPmxEdMmBI5n+xLhMLQTTsNCob0kXLDW94Wg
 FMbW3P6uC/Jg64dYnPQFhWcp1ME3IoY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-bi-XvfyBOeqjZpsVfuyNLQ-1; Wed, 27 Jan 2021 07:45:10 -0500
X-MC-Unique: bi-XvfyBOeqjZpsVfuyNLQ-1
Received: by mail-wm1-f72.google.com with SMTP id s24so842703wmj.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 04:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Goo8THCnSblr4X7j6OdqCZZOJ9/1uYUtAXnnHLO9/bU=;
 b=sG0Mu8sbgLclVHTuw3TAl/r2kWpcq6biaehh9yNXrYJ3ut8X+nVOycxrTleU+RSWnz
 UM+nwjyr8omqNfstZWdsE2/yuYXdZfMTO56sphu30cmxeNREQ49SJtlMsKzSHJlXy7oG
 q9KAvK0D2UOt0JRXQ5mPztgZMtKqKFZU39MHdkZwCsc9MrI3zdtezm1jpUADh6heUtdz
 GAXYDYwSFKqN9hAuIV8OoLJs61ycVRbbYTi1U2XMEPRnARUlOUZCl1Z9Ic0UMq6Jn5FK
 E7xHSOlg3YYztJb7/BZZjNqX9f0QNcjZfRcOHEWTBAPsepHMi2Hc8AG7iMGNEjJ9N3or
 Eb+Q==
X-Gm-Message-State: AOAM531oYUmx6J9LiST4JDr9Uhq1RYyb1swSePATRNftqXo8lGpM81eF
 F8j0JRkDGXcx51gdoWBVROnqQhf0bc+RkXNz8F/Vw9sgcu30t/6wf3nqwI6BGC7ed6fjonK7PFK
 ATGmKh4sQy9PaE88=
X-Received: by 2002:a05:600c:198e:: with SMTP id
 t14mr4060327wmq.109.1611751508687; 
 Wed, 27 Jan 2021 04:45:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkOzgA6dsUdd+dv/n9EU4zFHUWt9IJ+XioVjwYhrjknfBBqPITsNyDJHMi9QE63Gw2yAO3uw==
X-Received: by 2002:a05:600c:198e:: with SMTP id
 t14mr4060308wmq.109.1611751508471; 
 Wed, 27 Jan 2021 04:45:08 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id m11sm2282028wmc.15.2021.01.27.04.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 04:45:07 -0800 (PST)
Date: Wed, 27 Jan 2021 07:45:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 00/11] virtio-mem: vfio support
Message-ID: <20210127074407-mutt-send-email-mst@kernel.org>
References: <20210121110540.33704-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121110540.33704-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 12:05:29PM +0100, David Hildenbrand wrote:
> A virtio-mem device manages a memory region in guest physical address
> space, represented as a single (currently large) memory region in QEMU,
> mapped into system memory address space. Before the guest is allowed to use
> memory blocks, it must coordinate with the hypervisor (plug blocks). After
> a reboot, all memory is usually unplugged - when the guest comes up, it
> detects the virtio-mem device and selects memory blocks to plug (based on
> resize requests from the hypervisor).
> 
> Memory hot(un)plug consists of (un)plugging memory blocks via a virtio-mem
> device (triggered by the guest). When unplugging blocks, we discard the
> memory - similar to memory balloon inflation. In contrast to memory
> ballooning, we always know which memory blocks a guest may actually use -
> especially during a reboot, after a crash, or after kexec (and during
> hibernation as well). Guests agreed to not access unplugged memory again,
> especially not via DMA.
> 
> The issue with vfio is, that it cannot deal with random discards - for this
> reason, virtio-mem and vfio can currently only run mutually exclusive.
> Especially, vfio would currently map the whole memory region (with possible
> only little/no plugged blocks), resulting in all pages getting pinned and
> therefore resulting in a higher memory consumption than expected (turning
> virtio-mem basically useless in these environments).
> 
> To make vfio work nicely with virtio-mem, we have to map only the plugged
> blocks, and map/unmap properly when plugging/unplugging blocks (including
> discarding of RAM when unplugging). We achieve that by using a new notifier
> mechanism that communicates changes.

series

Acked-by: Michael S. Tsirkin <mst@redhat.com>

virtio bits

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

This needs to go through vfio tree I assume.


> It's important to map memory in the granularity in which we could see
> unmaps again (-> virtio-mem block size) - so when e.g., plugging
> consecutive 100 MB with a block size of 2 MB, we need 50 mappings. When
> unmapping, we can use a single vfio_unmap call for the applicable range.
> We expect that the block size of virtio-mem devices will be fairly large
> in the future (to not run out of mappings and to improve hot(un)plug
> performance), configured by the user, when used with vfio (e.g., 128MB,
> 1G, ...), but it will depend on the setup.
> 
> More info regarding virtio-mem can be found at:
>     https://virtio-mem.gitlab.io/
> 
> v5 is located at:
>   git@github.com:davidhildenbrand/qemu.git virtio-mem-vfio-v5
> 
> v4 -> v5:
> - "vfio: Support for RamDiscardMgr in the !vIOMMU case"
> -- Added more assertions for granularity vs. iommu supported pagesize
> - "vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr"
> -- Fix accounting of mappings
> - "vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus"
> -- Fence off SPAPR and add some comments regarding future support.
> -- Tweak patch description
> - Rebase and retest
> 
> v3 -> v4:
> - "vfio: Query and store the maximum number of DMA mappings
> -- Limit the patch to querying and storing only
> -- Renamed to "vfio: Query and store the maximum number of possible DMA
>    mappings"
> - "vfio: Support for RamDiscardMgr in the !vIOMMU case"
> -- Remove sanity checks / warning the user
> - "vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr"
> -- Perform sanity checks by looking at the number of memslots and all
>    registered RamDiscardMgr sections
> - Rebase and retest
> - Reshuffled the patches slightly
> 
> v2 -> v3:
> - Rebased + retested
> - Fixed some typos
> - Added RB's
> 
> v1 -> v2:
> - "memory: Introduce RamDiscardMgr for RAM memory regions"
> -- Fix some errors in the documentation
> -- Make register_listener() notify about populated parts and
>    unregister_listener() notify about discarding populated parts, to
>    simplify future locking inside virtio-mem, when handling requests via a
>    separate thread.
> - "vfio: Query and store the maximum number of DMA mappings"
> -- Query number of mappings and track mappings (except for vIOMMU)
> - "vfio: Support for RamDiscardMgr in the !vIOMMU case"
> -- Adapt to RamDiscardMgr changes and warn via generic DMA reservation
> - "vfio: Support for RamDiscardMgr in the vIOMMU case"
> -- Use vmstate priority to handle migration dependencies
> 
> RFC - v1:
> - VFIO migration code. Due to missing kernel support, I cannot really test
>   if that part works.
> - Understand/test/document vIOMMU implications, also regarding migration
> - Nicer ram_block_discard_disable/require handling.
> - s/SparseRAMHandler/RamDiscardMgr/, refactorings, cleanups, documentation,
>   testing, ...
> 
> David Hildenbrand (11):
>   memory: Introduce RamDiscardMgr for RAM memory regions
>   virtio-mem: Factor out traversing unplugged ranges
>   virtio-mem: Implement RamDiscardMgr interface
>   vfio: Support for RamDiscardMgr in the !vIOMMU case
>   vfio: Query and store the maximum number of possible DMA mappings
>   vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr
>   vfio: Support for RamDiscardMgr in the vIOMMU case
>   softmmu/physmem: Don't use atomic operations in
>     ram_block_discard_(disable|require)
>   softmmu/physmem: Extend ram_block_discard_(require|disable) by two
>     discard types
>   virtio-mem: Require only coordinated discards
>   vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus
> 
>  hw/vfio/common.c               | 348 +++++++++++++++++++++++++++++++--
>  hw/virtio/virtio-mem.c         | 347 ++++++++++++++++++++++++++++----
>  include/exec/memory.h          | 249 ++++++++++++++++++++++-
>  include/hw/vfio/vfio-common.h  |  13 ++
>  include/hw/virtio/virtio-mem.h |   3 +
>  include/migration/vmstate.h    |   1 +
>  softmmu/memory.c               |  22 +++
>  softmmu/physmem.c              | 108 +++++++---
>  8 files changed, 1007 insertions(+), 84 deletions(-)
> 
> -- 
> 2.29.2


