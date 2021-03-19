Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279213419AD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:15:06 +0100 (CET)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNC9p-0001ka-3U
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNC7j-0000C7-DG
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNC7g-0008DK-4B
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616148770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X/35IHwwnPXnYvazwufc0tU73TpA2+Sgx2mg6gfONeQ=;
 b=g4fUBbDw5aENxG1en9+vQoXSeAGmucBh3lpCxZvD/U/wiovNRzGlB0Fl+7c6jwRZORri82
 AGnqe0v2rkr4sYyTx8fPyZixWxHsSE1wpwE8T1jx/rpDzov/QdVq+40VF61o+sU1LVy5dL
 tkMShLlr4G4kJUB/J6g/EwmWPfyq0mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-phoMsQRHOXWNaB5x_VcVog-1; Fri, 19 Mar 2021 06:12:48 -0400
X-MC-Unique: phoMsQRHOXWNaB5x_VcVog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35B49817469;
 Fri, 19 Mar 2021 10:12:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 327D410016DB;
 Fri, 19 Mar 2021 10:12:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/14] RAM_NORESERVE,
 MAP_NORESERVE and hostmem "reserve" property
Date: Fri, 19 Mar 2021 11:12:16 +0100
Message-Id: <20210319101230.21531-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some fixes for shared anonymous memory, cleanups previously sent in other
context (resizeable allocations), followed by RAM_NORESERVE, implementing
it under POSIX using MAP_NORESERVE, and letting users configure it for
memory backens using the "reserve" property (default: true).

MAP_NORESERVE under Linux has in the context of QEMU an effect on
1) Private/shared anonymous memory
-> memory-backend-ram,id=mem0,size=10G
2) Private fd-based mappings
-> memory-backend-file,id=mem0,size=10G,mem-path=/dev/shm/0
-> memory-backend-memfd,id=mem0,size=10G
3) Private/shared hugetlb mappings
-> memory-backend-memfd,id=mem0,size=10G,hugetlb=on,hugetlbsize=2M

With MAP_NORESERVE/"reserve=off", we won't be reserving swap space (1/2) or
huge pages (3) for the whole memory region.

The target use case is virtio-mem, which dynamically exposes memory
inside a large, sparse memory area to the VM. MAP_NORESERVE tells the OS
"this mapping might be very sparse". This essentially allows
avoiding having to set "/proc/sys/vm/overcommit_memory == 1") when using
virtio-mem and also supporting hugetlbfs in the future.

virtio-mem currently only supports anonymous memory, in the future we want
to also support private memfd, shared file-based and shared hugetlbfs
mappings.

virtio-mem features I am currently working on that will make it all
play together with this work include:
1. Introducing a prealloc option for virtio-mem (e.g., using fallocate()
   when plugging blocks) to fail nicely when running out of
   backing storage like huge pages ("prealloc=on").
2. Handling virtio-mem requests via an iothread to not hold the BQL while
   populating/preallocating memory ("iothread=X").
3. Protecting unplugged memory e.g., using userfaultfd ("prot=uffd").
4. Dynamic reservation of swap space ("reserve=on")
5. Supporting resizable RAM block/memmory regions, such that we won't
   always expose a large, sparse memory region to the VM.
6. (resizeable allocations / optimized mmap handling when resizing RAM
    blocks)

v3 -> v4:
- Minor comment/description updates
- "softmmu/physmem: Fix ram_block_discard_range() to handle shared ..."
-- Extended description
- "util/mmap-alloc: Pass flags instead of separate bools to ..."
-- Move flags to include/qemu/osdep.h and rename to "QEMU_MAP_*"
- "memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()"
-- Adjust to new flags. Handle errors in mmap_activate() for now.
- "util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE under Linux"
-- Restrict support to Linux only for now
- "qmp: Include "reserve" property of memory backends"
-- Added
- "hmp: Print "reserve" property of memory backends with ..."
-- Added

v2 -> v3:
- Renamed "softmmu/physmem: Drop "shared" parameter from ram_block_add()"
  to "softmmu/physmem: Mark shared anonymous memory RAM_SHARED" and
  adjusted the description
- Added "softmmu/physmem: Fix ram_block_discard_range() to handle shared
  anonymous memory"
- Added "softmmu/physmem: Fix qemu_ram_remap() to handle shared anonymous
  memory"
- Added "util/mmap-alloc: Pass flags instead of separate bools to
  qemu_ram_mmap()"
- "util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE"
-- Further tweak code comments
-- Handle shared anonymous memory

v1 -> v2:
- Rebased to upstream and phs_mem_alloc simplifications
-- Upsteam added the "map_offset" parameter to many RAM allocation
   interfaces.
- "softmmu/physmem: Drop "shared" parameter from ram_block_add()"
-- Use local variable "shared"
- "memory: introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()"
-- Simplify due to phs_mem_alloc changes
- "util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE"
-- Add a whole bunch of comments.
-- Exclude shared anonymous memory that QEMU doesn't use
-- Special-case readonly mappings

Cc: Peter Xu <peterx@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Liam Merwick <liam.merwick@oracle.com>
Cc: Marcel Apfelbaum <mapfelba@redhat.com>

David Hildenbrand (14):
  softmmu/physmem: Mark shared anonymous memory RAM_SHARED
  softmmu/physmem: Fix ram_block_discard_range() to handle shared
    anonymous memory
  softmmu/physmem: Fix qemu_ram_remap() to handle shared anonymous
    memory
  util/mmap-alloc: Factor out calculation of the pagesize for the guard
    page
  util/mmap-alloc: Factor out reserving of a memory region to
    mmap_reserve()
  util/mmap-alloc: Factor out activating of memory to mmap_activate()
  softmmu/memory: Pass ram_flags to qemu_ram_alloc_from_fd()
  softmmu/memory: Pass ram_flags to
    memory_region_init_ram_shared_nomigrate()
  util/mmap-alloc: Pass flags instead of separate bools to
    qemu_ram_mmap()
  memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()
  util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE under Linux
  hostmem: Wire up RAM_NORESERVE via "reserve" property
  qmp: Include "reserve" property of memory backends
  hmp: Print "reserve" property of memory backends with "info memdev"

 backends/hostmem-file.c                       |  11 +-
 backends/hostmem-memfd.c                      |   8 +-
 backends/hostmem-ram.c                        |   7 +-
 backends/hostmem.c                            |  33 +++
 hw/core/machine-hmp-cmds.c                    |   2 +
 hw/core/machine-qmp-cmds.c                    |   1 +
 hw/m68k/next-cube.c                           |   4 +-
 hw/misc/ivshmem.c                             |   5 +-
 include/exec/cpu-common.h                     |   1 +
 include/exec/memory.h                         |  42 ++--
 include/exec/ram_addr.h                       |   9 +-
 include/qemu/mmap-alloc.h                     |  16 +-
 include/qemu/osdep.h                          |  30 ++-
 include/sysemu/hostmem.h                      |   2 +-
 migration/ram.c                               |   3 +-
 qapi/machine.json                             |   6 +
 .../memory-region-housekeeping.cocci          |   8 +-
 softmmu/memory.c                              |  27 ++-
 softmmu/physmem.c                             |  61 +++--
 util/mmap-alloc.c                             | 212 +++++++++++++-----
 util/oslib-posix.c                            |   7 +-
 util/oslib-win32.c                            |  13 +-
 22 files changed, 352 insertions(+), 156 deletions(-)

-- 
2.29.2


