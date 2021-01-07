Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253212ED0F4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:42:50 +0100 (CET)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVYv-00037o-7o
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVRH-0004K8-75
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:34:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVRD-0003km-8P
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610026489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qehmuvw/t64ZIHjZNP+CidHjERcghLJNbEnokzdu+tQ=;
 b=DDe2xAPoaP+2y+wvLFMUglx8FvaajE4jcLOHK6Yac6fZ8H9Ajlo4q/nv8fhceC/P5nrmpW
 pmF0Tbyeov80CtPZ+Eurl3td+TtS8oRLzApJlGlHX1rbSR4NMl+hdzrokJFcgnIbHuUS1Q
 QU42dUIYtxkqRbwwiyxgUL25lA8a1RY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-8N2wL4RgPsSJRKfLiciV9g-1; Thu, 07 Jan 2021 08:34:47 -0500
X-MC-Unique: 8N2wL4RgPsSJRKfLiciV9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B041810054FF;
 Thu,  7 Jan 2021 13:34:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-161.ams2.redhat.com [10.36.114.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66FDF18017;
 Thu,  7 Jan 2021 13:34:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] virtio-mem: vfio support
Date: Thu,  7 Jan 2021 14:34:12 +0100
Message-Id: <20210107133423.44964-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

v4 is located at:
  git@github.com:davidhildenbrand/qemu.git virtio-mem-vfio-v4

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

David Hildenbrand (11):
  memory: Introduce RamDiscardMgr for RAM memory regions
  virtio-mem: Factor out traversing unplugged ranges
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
  vfio: Disable only uncoordinated discards

 hw/vfio/common.c               | 292 ++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c         | 347 +++++++++++++++++++++++++++++----
 include/exec/memory.h          | 249 ++++++++++++++++++++++-
 include/hw/vfio/vfio-common.h  |  13 ++
 include/hw/virtio/virtio-mem.h |   3 +
 include/migration/vmstate.h    |   1 +
 softmmu/memory.c               |  22 +++
 softmmu/physmem.c              | 108 +++++++---
 8 files changed, 959 insertions(+), 76 deletions(-)

-- 
2.29.2


