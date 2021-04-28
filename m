Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C236D870
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:40:50 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkQr-00012f-N9
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkPA-0000SF-0w
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkP7-0005v6-47
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XyhLO2FX7UrkS+3WDGkW3e0d5CNbhi4HHefUw+Aunwk=;
 b=Y7ZFHlU22pbmevpNevleGXpTchU6UHfuJb0sWfzRKOlL8Z2UR2ltL9GWrHKRPrFO5EXhVF
 2/cwPX/QRRPDwNUiZ3aXn3tKySCbQQy7dK9u6dvslyumuzwOV5Cak5T8xd9d8WK2VXOyjF
 P/YtziE/a/Ma60CsVHuM4AWeONF7LIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-eH1XodPaN163wmqjh-LS_g-1; Wed, 28 Apr 2021 09:38:58 -0400
X-MC-Unique: eH1XodPaN163wmqjh-LS_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E878780ED8B;
 Wed, 28 Apr 2021 13:38:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0DE361093;
 Wed, 28 Apr 2021 13:37:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/15] RAM_NORESERVE,
 MAP_NORESERVE and hostmem "reserve" property
Date: Wed, 28 Apr 2021 15:37:39 +0200
Message-Id: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210406080126.24010-1-david@redhat.com

Some cleanups previously sent in other context (resizeable allocations),
followed by RAM_NORESERVE, implementing it under Linux using MAP_NORESERVE,
and letting users configure it for memory backens using the "reserve"
property (default: true).

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

v6 -> v7:
- Collected ACKs and RBs
- "hostmem: Wire up RAM_NORESERVE via "reserve" property"
-- Extended qapi/qom.json documentation
- "qmp: Include "reserve" property of memory backends"
-- Extended property description

v5 -> v6:
- "softmmu/memory: Pass ram_flags to memory_region_init ..."
-- Split up into two patches
---> "softmmu/memory: Pass ram_flags to memory_region.."
---> "softmmu/memory: Pass ram_flags to qemu_ram_alloc() ..."
-- Also set RAM_PREALLOC from qemu_ram_alloc_from_ptr()
- Collected acks/rbs

v4 -> v5:
- Sent out shared anonymous RAM fixes separately
- Rebased
- "hostmem: Wire up RAM_NORESERVE via "reserve" property"
-- Adjusted/simplified description of new "reserve" property
-- Properly add it to qapi/qom.json
- "qmp: Clarify memory backend properties returned via query-memdev"
-- Added
- "qmp: Include "share" property of memory backends"
-- Added
- "hmp: Print "share" property of memory backends with "info memdev""
- Added
- "qmp: Include "reserve" property of memory backends"
-- Adjust description of new "reserve" property

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
Cc: Nitesh Lal <nilal@redhat.com>

David Hildenbrand (15):
  util/mmap-alloc: Factor out calculation of the pagesize for the guard
    page
  util/mmap-alloc: Factor out reserving of a memory region to
    mmap_reserve()
  util/mmap-alloc: Factor out activating of memory to mmap_activate()
  softmmu/memory: Pass ram_flags to qemu_ram_alloc_from_fd()
  softmmu/memory: Pass ram_flags to
    memory_region_init_ram_shared_nomigrate()
  softmmu/memory: Pass ram_flags to qemu_ram_alloc() and
    qemu_ram_alloc_internal()
  util/mmap-alloc: Pass flags instead of separate bools to
    qemu_ram_mmap()
  memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()
  util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE under Linux
  hostmem: Wire up RAM_NORESERVE via "reserve" property
  qmp: Clarify memory backend properties returned via query-memdev
  qmp: Include "share" property of memory backends
  hmp: Print "share" property of memory backends with "info memdev"
  qmp: Include "reserve" property of memory backends
  hmp: Print "reserve" property of memory backends with "info memdev"

 backends/hostmem-file.c                       |  11 +-
 backends/hostmem-memfd.c                      |   8 +-
 backends/hostmem-ram.c                        |   7 +-
 backends/hostmem.c                            |  32 +++
 hw/core/machine-hmp-cmds.c                    |   4 +
 hw/core/machine-qmp-cmds.c                    |   2 +
 hw/m68k/next-cube.c                           |   4 +-
 hw/misc/ivshmem.c                             |   5 +-
 include/exec/cpu-common.h                     |   1 +
 include/exec/memory.h                         |  42 ++--
 include/exec/ram_addr.h                       |   9 +-
 include/qemu/mmap-alloc.h                     |  16 +-
 include/qemu/osdep.h                          |  30 ++-
 include/sysemu/hostmem.h                      |   2 +-
 migration/ram.c                               |   3 +-
 qapi/machine.json                             |  16 +-
 qapi/qom.json                                 |  10 +
 .../memory-region-housekeeping.cocci          |   8 +-
 softmmu/memory.c                              |  27 ++-
 softmmu/physmem.c                             |  51 +++--
 util/mmap-alloc.c                             | 212 +++++++++++++-----
 util/oslib-posix.c                            |   7 +-
 util/oslib-win32.c                            |  13 +-
 23 files changed, 362 insertions(+), 158 deletions(-)

-- 
2.30.2


