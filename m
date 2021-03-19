Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FEF3419DC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:24:22 +0100 (CET)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCIn-0004YE-SN
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNCCC-0005v0-2x
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNCC9-0002Yr-KS
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616149048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpTwlvV2Fk9ssd6zrEwjhG97nexoQO6sKR4hMYe15Us=;
 b=fhxHkXgXJIMjQKriXrQ6AffZdf3RBaqUy6zSXxNs92JpVo4BlEkXoKh3ucuh5BSl96rNPK
 ghQMEYMBqQxW2chprV8ECc5UOlXN9QUOBICW1cg2fP4+1I0BM1bPd4w75eSAfbpAahvG00
 LYgRZfG5fsp+5lu7delL3CcE4bw3w5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-mHzGR02sPcKOTOH5gVR0Eg-1; Fri, 19 Mar 2021 06:17:25 -0400
X-MC-Unique: mHzGR02sPcKOTOH5gVR0Eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00E10102CB7E;
 Fri, 19 Mar 2021 10:17:24 +0000 (UTC)
Received: from [10.36.112.11] (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A52DA29AB7;
 Fri, 19 Mar 2021 10:17:07 +0000 (UTC)
Subject: Re: [PATCH v7 00/13] virtio-mem: vfio support
To: qemu-devel@nongnu.org
References: <20210224094910.44986-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0a0c30b1-7827-cbf4-1437-80bdd2c47216@redhat.com>
Date: Fri, 19 Mar 2021 11:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210224094910.44986-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.02.21 10:48, David Hildenbrand wrote:
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
> 
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
>      https://virtio-mem.gitlab.io/
> 
> v7 is located at:
>    git@github.com:davidhildenbrand/qemu.git virtio-mem-vfio-v7
> 
> v6 -> v7:
> - s/RamDiscardMgr/RamDiscardManager/
> - "memory: Introduce RamDiscardManager for RAM memory regions"
> -- Make RamDiscardManager/RamDiscardListener eat MemoryRegionSections
> -- Replace notify_discard_all callback by double_discard_supported
> -- Reshuffle the individual hunks in memory.h
> -- Provide function wrappers for RamDiscardManager calls
> - "memory: Helpers to copy/free a MemoryRegionSection"
> -- Added
> - "virtio-mem: Implement RamDiscardManager interface"
> -- Work on MemoryRegionSections instead of ranges
> -- Minor optimizations
> - "vfio: Support for RamDiscardManager in the !vIOMMU case"
> -- Simplify based on new interfaces /  MemoryRegionSections
> -- Minor cleanups and optimizations
> -- Add a comment regarding dirty bitmap sync.
> -- Don't store "offset_within_region" in VFIORamDiscardListener
> - "vfio: Support for RamDiscardManager in the vIOMMU case"
> -- Adjust to new interface
> - "softmmu/physmem: Don't use atomic operations in ..."
> -- Rename variables
> - "softmmu/physmem: Extend ram_block_discard_(require|disable) ..."
> -- Rename variables
> - Rebased and retested
> 
> v5 -> v6:
> - "memory: Introduce RamDiscardMgr for RAM memory regions"
> -- Fix variable names in one prototype.
> - "virtio-mem: Don't report errors when ram_block_discard_range() fails"
> -- Added
> - "virtio-mem: Implement RamDiscardMgr interface"
> -- Don't report an error if discarding fails
> - Rebased and retested
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
>     mappings"
> - "vfio: Support for RamDiscardMgr in the !vIOMMU case"
> -- Remove sanity checks / warning the user
> - "vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr"
> -- Perform sanity checks by looking at the number of memslots and all
>     registered RamDiscardMgr sections
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
>     unregister_listener() notify about discarding populated parts, to
>     simplify future locking inside virtio-mem, when handling requests via a
>     separate thread.
> - "vfio: Query and store the maximum number of DMA mappings"
> -- Query number of mappings and track mappings (except for vIOMMU)
> - "vfio: Support for RamDiscardMgr in the !vIOMMU case"
> -- Adapt to RamDiscardMgr changes and warn via generic DMA reservation
> - "vfio: Support for RamDiscardMgr in the vIOMMU case"
> -- Use vmstate priority to handle migration dependencies
> 
> RFC - v1:
> - VFIO migration code. Due to missing kernel support, I cannot really test
>    if that part works.
> - Understand/test/document vIOMMU implications, also regarding migration
> - Nicer ram_block_discard_disable/require handling.
> - s/SparseRAMHandler/RamDiscardMgr/, refactorings, cleanups, documentation,
>    testing, ...
> 
> David Hildenbrand (13):
>    memory: Introduce RamDiscardManager for RAM memory regions
>    memory: Helpers to copy/free a MemoryRegionSection
>    virtio-mem: Factor out traversing unplugged ranges
>    virtio-mem: Don't report errors when ram_block_discard_range() fails
>    virtio-mem: Implement RamDiscardManager interface
>    vfio: Support for RamDiscardManager in the !vIOMMU case
>    vfio: Query and store the maximum number of possible DMA mappings
>    vfio: Sanity check maximum number of DMA mappings with
>      RamDiscardManager
>    vfio: Support for RamDiscardManager in the vIOMMU case
>    softmmu/physmem: Don't use atomic operations in
>      ram_block_discard_(disable|require)
>    softmmu/physmem: Extend ram_block_discard_(require|disable) by two
>      discard types
>    virtio-mem: Require only coordinated discards
>    vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus
> 
>   hw/vfio/common.c               | 315 +++++++++++++++++++++++++-
>   hw/virtio/virtio-mem.c         | 391 ++++++++++++++++++++++++++++-----
>   include/exec/memory.h          | 324 +++++++++++++++++++++++++--
>   include/hw/vfio/vfio-common.h  |  12 +
>   include/hw/virtio/virtio-mem.h |   3 +
>   include/migration/vmstate.h    |   1 +
>   softmmu/memory.c               |  98 +++++++++
>   softmmu/physmem.c              | 108 ++++++---
>   8 files changed, 1133 insertions(+), 119 deletions(-)
> 

Another gentle ping; it's been almost a month with no feedback.

I hope we can get this early into 6.1, because I have other stuff coming 
up that rely on the RamDiscardManager infrastructure. Feedback/acks are 
appreciated so I can finally make progress with this.

-- 
Thanks,

David / dhildenb


