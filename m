Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5C32159D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:59:49 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9sS-0007aV-J1
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9qK-0006Io-F3
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9qI-0000vn-Dv
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613995052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rBiGOHgUK9K9wCIcOcCE4QqDY1pT9YYpkoJjeRbxgDI=;
 b=Ccqbs+Rp34obpOlmJjMGhe2AGx0wC6dGxRHzkIjQ+L5kzClTjnfmyDupLMPpZ+0DuYzHAF
 rPJOeuOO5O7uHI44OOcDtdpYjRXY09fVSYxYkspfsL8oAGCyJLgpsDxwo9jBugzSdZFidL
 CMnyU1C1D7Jm+3DK5bxx8NNf7p+/ErM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-6U1PxDZpOfel3L3UnIX2vg-1; Mon, 22 Feb 2021 06:57:30 -0500
X-MC-Unique: 6U1PxDZpOfel3L3UnIX2vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B69801965;
 Mon, 22 Feb 2021 11:57:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7D8B19C45;
 Mon, 22 Feb 2021 11:57:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/12] virtio-mem: vfio support
Date: Mon, 22 Feb 2021 12:56:56 +0100
Message-Id: <20210222115708.7623-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@Paolo, I have acks for most things - what's missing seems to be an ack
from you on patch #1. As I want to make use of RamDiscardMgr also to handle
virtio-mem+guest-memory-dump/tpm [1] and properly handle all kinds of
migration (precopy, background snapshots, postcopy), could you have a look
at patch #1? Thanks!

I think it would be best to take this via @MST.

[1] https://lkml.kernel.org/r/20210210171537.32932-1-david@redhat.com

---

A virtio-mem device manages a memory region in guest physical address
space, represented as a single (currently large) memory region in QEMU,
mapped into system memory address space. Before the guest is allowed to use
memory blocks, it must coordinate with the hypervisor (plug blocks). After
a reboot, all memory is usually unplugged - when the guest comes up, it
detects the virtio-mem device and selects memory blocks to plug (based on
resize requests from the hypervisor).

Memory hot(un)plug consists of (un)plugging memory blocks via a virtio-mem
device (triggered by the guest). When unplugging blocks, we discard the
memory - similar to memory balloon inflation. In contrast to memory
ballooning, we always know which memory blocks a guest may actually use -
especially during a reboot, after a crash, or after kexec (and during
hibernation as well). Guests agreed to not access unplugged memory again,
especially not via DMA.

The issue with vfio is, that it cannot deal with random discards - for this
reason, virtio-mem and vfio can currently only run mutually exclusive.
Especially, vfio would currently map the whole memory region (with possible
only little/no plugged blocks), resulting in all pages getting pinned and
therefore resulting in a higher memory consumption than expected (turning
virtio-mem basically useless in these environments).

To make vfio work nicely with virtio-mem, we have to map only the plugged
blocks, and map/unmap properly when plugging/unplugging blocks (including
discarding of RAM when unplugging). We achieve that by using a new notifier
mechanism that communicates changes.

It's important to map memory in the granularity in which we could see
unmaps again (-> virtio-mem block size) - so when e.g., plugging
consecutive 100 MB with a block size of 2 MB, we need 50 mappings. When
unmapping, we can use a single vfio_unmap call for the applicable range.
We expect that the block size of virtio-mem devices will be fairly large
in the future (to not run out of mappings and to improve hot(un)plug
performance), configured by the user, when used with vfio (e.g., 128MB,
1G, ...), but it will depend on the setup.

More info regarding virtio-mem can be found at:
    https://virtio-mem.gitlab.io/

v6 is located at:
  git@github.com:davidhildenbrand/qemu.git virtio-mem-vfio-v6

v5 -> v6:
- "memory: Introduce RamDiscardMgr for RAM memory regions"
-- Fix variable names in one prototype.
- "virtio-mem: Don't report errors when ram_block_discard_range() fails"
-- Added
- "virtio-mem: Implement RamDiscardMgr interface"
-- Don't report an error if discarding fails
- Rebased and retested

v4 -> v5:
- "vfio: Support for RamDiscardMgr in the !vIOMMU case"
-- Added more assertions for granularity vs. iommu supported pagesize
- "vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr"
-- Fix accounting of mappings
- "vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus"
-- Fence off SPAPR and add some comments regarding future support.
-- Tweak patch description
- Rebase and retest

v3 -> v4:
- "vfio: Query and store the maximum number of DMA mappings
-- Limit the patch to querying and storing only
-- Renamed to "vfio: Query and store the maximum number of possible DMA
   mappings"
- "vfio: Support for RamDiscardMgr in the !vIOMMU case"
-- Remove sanity checks / warning the user
- "vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr"
-- Perform sanity checks by looking at the number of memslots and all
   registered RamDiscardMgr sections
- Rebase and retest
- Reshuffled the patches slightly

v2 -> v3:
- Rebased + retested
- Fixed some typos
- Added RB's

v1 -> v2:
- "memory: Introduce RamDiscardMgr for RAM memory regions"
-- Fix some errors in the documentation
-- Make register_listener() notify about populated parts and
   unregister_listener() notify about discarding populated parts, to
   simplify future locking inside virtio-mem, when handling requests via a
   separate thread.
- "vfio: Query and store the maximum number of DMA mappings"
-- Query number of mappings and track mappings (except for vIOMMU)
- "vfio: Support for RamDiscardMgr in the !vIOMMU case"
-- Adapt to RamDiscardMgr changes and warn via generic DMA reservation
- "vfio: Support for RamDiscardMgr in the vIOMMU case"
-- Use vmstate priority to handle migration dependencies

RFC - v1:
- VFIO migration code. Due to missing kernel support, I cannot really test
  if that part works.
- Understand/test/document vIOMMU implications, also regarding migration
- Nicer ram_block_discard_disable/require handling.
- s/SparseRAMHandler/RamDiscardMgr/, refactorings, cleanups, documentation,
  testing, ...

David Hildenbrand (12):
  memory: Introduce RamDiscardMgr for RAM memory regions
  virtio-mem: Factor out traversing unplugged ranges
  virtio-mem: Don't report errors when ram_block_discard_range() fails
  virtio-mem: Implement RamDiscardMgr interface
  vfio: Support for RamDiscardMgr in the !vIOMMU case
  vfio: Query and store the maximum number of possible DMA mappings
  vfio: Sanity check maximum number of DMA mappings with RamDiscardMgr
  vfio: Support for RamDiscardMgr in the vIOMMU case
  softmmu/physmem: Don't use atomic operations in
    ram_block_discard_(disable|require)
  softmmu/physmem: Extend ram_block_discard_(require|disable) by two
    discard types
  virtio-mem: Require only coordinated discards
  vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus

 hw/vfio/common.c               | 348 ++++++++++++++++++++++++++++++--
 hw/virtio/virtio-mem.c         | 350 ++++++++++++++++++++++++++++-----
 include/exec/memory.h          | 249 ++++++++++++++++++++++-
 include/hw/vfio/vfio-common.h  |  13 ++
 include/hw/virtio/virtio-mem.h |   3 +
 include/migration/vmstate.h    |   1 +
 softmmu/memory.c               |  22 +++
 softmmu/physmem.c              | 108 +++++++---
 8 files changed, 1000 insertions(+), 94 deletions(-)

-- 
2.29.2


