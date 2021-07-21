Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA93D0B78
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:31:15 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68ZO-0002LG-8T
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m68WT-0008CV-5J
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m68WR-00025X-Gm
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626859690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kfyT2tY0xnZbfMEOt229Kg770TsJQ5Y8DrqBXq22Hh4=;
 b=WmPlBF7daWTGd3o2AxdjkYS1+wRTvPl/cilUWZax0PUyOjiaDUnPYdd9iYudZbO2DMa/YS
 yKlnGY+dh3LJd30rpDxu4gquYFXOHG/59BxbY5Le8EyAHkmM6ykuXHAPkBBu42pExbNg9G
 gWHARaVKhZVwTBEJ8vN7rPUxgo6NX/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-wKeqXyyYNcK_fQgBKIam7g-1; Wed, 21 Jul 2021 05:28:09 -0400
X-MC-Unique: wKeqXyyYNcK_fQgBKIam7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF418018AC;
 Wed, 21 Jul 2021 09:28:04 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-250.ams2.redhat.com [10.36.113.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB31560C59;
 Wed, 21 Jul 2021 09:28:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Date: Wed, 21 Jul 2021 11:27:53 +0200
Message-Id: <20210721092759.21368-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
change. We never ever want to migrate such logically unplugged memory,
because it can result in an unintended memory consumption both, on the
source (when reading memory from some memory backends) and on the
destination (when writing memory). Further, migration time can be heavily
reduced when skipping logically unplugged blocks and we avoid populating
unnecessary page tables in Linux.

Right now, virtio-mem reuses the free page hinting infrastructure during
precopy to exclude all logically unplugged ("discarded") parts from the
migration stream. However, there are some scenarios that are not handled
properly and need fixing. Further, there are some ugly corner cases in
postcopy code and background snapshotting code that similarly have to
handle such special RAMBlocks.

Let's reuse the RamDiscardManager infrastructure to essentially handle
precopy, postcopy and background snapshots cleanly, which means:

a) In precopy code, always clearing all dirty bits from the bitmap that
   correspond to discarded range, whenever we update the dirty bitmap. This
   results in logically unplugged memory to never get migrated.
b) In postcopy code, placing a zeropage when requested to handle a page
   falling into a discarded range -- because the source will never send it.
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

Idealy, this should all go via the migration tree.

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

David Hildenbrand (6):
  memory: Introduce replay_discarded callback for RamDiscardManager
  virtio-mem: Implement replay_discarded RamDiscardManager callback
  migration/ram: Handle RAMBlocks with a RamDiscardManager on the
    migration source
  virtio-mem: Drop precopy notifier
  migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
    destination
  migration/ram: Handle RAMBlocks with a RamDiscardManager on background
    snapshots

 hw/virtio/virtio-mem.c         |  92 +++++++++++++--------
 include/exec/memory.h          |  21 +++++
 include/hw/virtio/virtio-mem.h |   3 -
 migration/postcopy-ram.c       |  25 +++++-
 migration/ram.c                | 147 ++++++++++++++++++++++++++++++---
 migration/ram.h                |   1 +
 softmmu/memory.c               |  11 +++
 7 files changed, 246 insertions(+), 54 deletions(-)

-- 
2.31.1


