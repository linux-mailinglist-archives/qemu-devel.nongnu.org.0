Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4EA42962A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:57:18 +0200 (CEST)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzY5-0006dP-Nw
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzVl-00054Z-QN
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzVk-0001ID-0O
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kfL7Ru2uRFL4TPcKcrKOBXv3vkUTz91c9Uvm0rjfi14=;
 b=RUqCAg54M9R6jKsKkFAuHvWkqMlPx7y7WO9YCgsV6es5NtExyOkq4mtClykkMUKaKow6kC
 Kj3+zGWrldt6Mts3dtZeQhz7UHUAKVEsmQTeH0j16SMBAlmHmSIisGR6GeLVYG0lC9Y5cp
 ZX4cJfztxcbjbjKKeRHrFiFEdzZACN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-IRG9cT19MHGSzqdzUa4VYQ-1; Mon, 11 Oct 2021 13:54:47 -0400
X-MC-Unique: IRG9cT19MHGSzqdzUa4VYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5E3410B3940;
 Mon, 11 Oct 2021 17:54:46 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4DE1981C;
 Mon, 11 Oct 2021 17:53:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/9] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Date: Mon, 11 Oct 2021 19:53:37 +0200
Message-Id: <20211011175346.15499-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is fully reviewed by Peter and I hope we can get either more
review feedback or get it merged via the migration tree soonish. Thanks.

---

virtio-mem exposes a dynamic amount of memory within RAMBlocks by
coordinating with the VM. Memory within a RAMBlock can either get
plugged and consequently used by the VM, or unplugged and consequently no
longer used by the VM. Logical unplug is realized by discarding the
physical memory backing for virtual memory ranges, similar to memory
ballooning.

However, important difference to virtio-balloon are:

a) A virtio-mem device only operates on its assigned memory region /
   RAMBlock ("device memory")
b) Initially, all device memory is logically unplugged
c) Virtual machines will never accidentally reuse memory that is currently
   logically unplugged. The spec defines most accesses to unplugged memory
   as "undefined behavior" -- except reading unplugged memory, which is
   currently expected to work, but that will change in the future.
d) The (un)plug granularity is in the range of megabytes -- "memory blocks"
e) The state (plugged/unplugged) of a memory block is always known and
   properly tracked.

Whenever memory blocks within the RAMBlock get (un)plugged, changes are
communicated via the RamDiscardManager to other QEMU subsystems, most
prominently vfio which updates the DMA mapping accordingly. "Unplugging"
corresponds to "discarding" and "plugging" corresponds to "populating".

While migrating (precopy/postcopy) that state of such memory blocks cannot
change, as virtio-mem will reject any guest requests that would change
the state of blocks with "busy". We don't want to migrate such logically
unplugged memory, because it can result in an unintended memory consumption
both, on the source (when reading memory from some memory backends) and on
the destination (when writing memory). Further, migration time can be
heavily reduced when skipping logically unplugged blocks and we avoid
populating unnecessary page tables in Linux.

Right now, virtio-mem reuses the free page hinting infrastructure during
precopy to exclude all logically unplugged ("discarded") parts from the
migration stream. However, there are some scenarios that are not handled
properly and need fixing. Further, there are some ugly corner cases in
postcopy code and background snapshotting code that similarly have to
handle such special RAMBlocks.

Let's reuse the RamDiscardManager infrastructure to essentially handle
precopy, postcopy and background snapshots cleanly, which means:

a) In precopy code, fixing up the initial dirty bitmaps (in the RAMBlock
   and e.g., KVM) to exclude discarded ranges.
b) In postcopy code, placing a zeropage when requested to handle a page
   falling into a discarded range -- because the source will never send it.
   Further, fix up the dirty bitmap when overwriting it in recovery mode.
c) In background snapshot code, never populating discarded ranges, not even
   with the shared zeropage, to avoid unintended memory consumption,
   especially in the future with hugetlb and shmem.

Detail: When realizing a virtio-mem devices, it will register the RAM
        for migration via vmstate_register_ram(). Further, it will
        set itself as the RamDiscardManager for the corresponding memory
        region of the RAMBlock via memory_region_set_ram_discard_manager().
        Last but not least, memory device code will actually map the
        memory region into guest physical address space. So migration
        code can always properly identify such RAMBlocks.

Tested with precopy/postcopy on shmem, where even reading unpopulated
memory ranges will populate actual memory and not the shared zeropage.
Tested with background snapshots on anonymous memory, because other
backends are not supported yet with upstream Linux.


v5 -> v6:
- Rebased and added ACKs

v4 -> v5:
- "migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
   destination"
-- Use ROUND_DOWN and fix compile warning on 32 bit
-- Use int128_make64() instead of wrongly int128_get64()
- "migration: Simplify alignment and alignment checks"
-- Use ROUND_DOWN where possible instead of QEMU_ALIGN_DOWN and fix
   compilation warning on 32 bit
- "migration/ram: Factor out populating pages readable in
   ram_block_populate_pages()"
-- Rename functions, add a comment.
- "migration/ram: Handle RAMBlocks with a RamDiscardManager on background
   snapshots"
-- Adjust to changed function names

v3 -> v4:
- Added ACKs
- "migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
   destination"
-- Use QEMU_ALIGN_DOWN() to align to ram pagesize
- "migration: Simplify alignment and alignment checks"
-- Added
- "migration/ram: Factor out populating pages readable in
   ram_block_populate_pages()"
-- Added
- "migration/ram: Handle RAMBlocks with a RamDiscardManager on background
   snapshots"
-- Simplified due to factored out code

v2 -> v3:
- "migration/ram: Don't passs RAMState to
   migration_clear_memory_region_dirty_bitmap_*()"
-- Added to make the next patch easier to implement
- "migration/ram: Handle RAMBlocks with a RamDiscardManager on the migration
   source"
-- Fixup the dirty bitmaps only initially and during postcopy recovery,
   not after every bitmap sync. Also properly clear the dirty bitmaps e.g.,
   in KVM. [Peter]
- "migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
   destination"
-- Take care of proper host-page alignment [Peter]

v1 -> v2:
- "migration/ram: Handle RAMBlocks with a RamDiscardManager on the
   migration source"
-- Added a note how it interacts with the clear_bmap and what we might want
   to further optimize in the future when synchronizing bitmaps.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>

David Hildenbrand (9):
  memory: Introduce replay_discarded callback for RamDiscardManager
  virtio-mem: Implement replay_discarded RamDiscardManager callback
  migration/ram: Don't passs RAMState to
    migration_clear_memory_region_dirty_bitmap_*()
  migration/ram: Handle RAMBlocks with a RamDiscardManager on the
    migration source
  virtio-mem: Drop precopy notifier
  migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
    destination
  migration: Simplify alignment and alignment checks
  migration/ram: Factor out populating pages readable in
    ram_block_populate_pages()
  migration/ram: Handle RAMBlocks with a RamDiscardManager on background
    snapshots

 hw/virtio/virtio-mem.c         |  92 ++++++++++-------
 include/exec/memory.h          |  21 ++++
 include/hw/virtio/virtio-mem.h |   3 -
 migration/migration.c          |   6 +-
 migration/postcopy-ram.c       |  40 ++++++--
 migration/ram.c                | 180 +++++++++++++++++++++++++++++----
 migration/ram.h                |   1 +
 softmmu/memory.c               |  11 ++
 8 files changed, 284 insertions(+), 70 deletions(-)

-- 
2.31.1


