Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0317A776
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 15:31:36 +0100 (CET)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9rXD-0006nc-H5
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 09:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j9rW2-0006AS-6L
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:30:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j9rVz-0001bC-UQ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:30:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60796
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j9rVz-0001aN-PX
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+yb+HU79wQ5wpyAGtb6fdjgiUkzdh/6ve5pXenuwDxc=;
 b=LM/L241SSZUbsyfSgTRrE9OpU6Wz91cFRsmLZlVHfqx7ZunFJzjuIK5Q0UsuITecU8k0qf
 INF0wtGSoHAHkTd1dkM/cKVOGOTubn2ZDFycF4yxpc2XTKooe+PsboM0uUZ/Gn3KlcGEz1
 aXluXUcs84h0NO5j6U2fnH7aVRSCuEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-XzsmhgBLPYqK0djINuIsEg-1; Thu, 05 Mar 2020 09:30:15 -0500
X-MC-Unique: XzsmhgBLPYqK0djINuIsEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77E74107ACCD;
 Thu,  5 Mar 2020 14:30:13 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D108991D91;
 Thu,  5 Mar 2020 14:29:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/15] Ram blocks with resizeable anonymous allocations
 under POSIX
Date: Thu,  5 Mar 2020 15:29:30 +0100
Message-Id: <20200305142945.216465-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is based on [1]:
    "[PATCH v3 00/13] migrate/ram: Fix resizing RAM blocks while migrating"

We already allow resizable ram blocks for anonymous memory, however, they
are not actually resized. All memory is mmaped() R/W, including the memory
exceeding the used_length, up to the max_length.

When resizing, effectively only the boundary is moved. Implement actually
resizable anonymous allocations and make use of them in resizable ram
blocks when possible. Memory exceeding the used_length will be
inaccessible. Especially ram block notifiers require care.

Having actually resizable anonymous allocations (via mmap-hackery) allows
to reserve a big region in virtual address space and grow the
accessible/usable part on demand. Even if "/proc/sys/vm/overcommit_memory"
is set to "never" under Linux, huge reservations will succeed. If there is
not enough memory when resizing (to populate parts of the reserved region),
trying to resize will fail. Only the actually used size is reserved in the
OS.

Especially, memory notifiers already handle resizing by first removing
the old region, and then re-adding the resized region. prealloc is
currently not possible with resizable ram blocks. mlock() should continue
to work as is. Resizing is currently rare and must only happen on the
start of an incoming migration, or during resets. No code path (except
HAX and SEV ram block notifiers) should access memory outside of the usable
range - and if we ever find one, that one has to be fixed (I did not
identify any).

E.g., virtio-mem [2] wants to reserve big resizable memory regions and
grow the usable part on demand. I think this change is worth sending out
individually. I did excessive tests of this with virtio-mem (which makes
it very easy to trigger resizes), including precopy and postcopy migration.

Accompanied by a bunch of minor fixes and cleanups.

v3 -> v4:
- Added RBs
- "util/mmap-alloc: Factor out activating of memory to mmap_activate()"
-- use "activate" instead of "populate"
- "util: vfio-helpers: Implement ram_block_resized()"
-- Also store max_size in mappings and assert against i
-- Better comment why atomic resizes are not possible
- "exec: Ram blocks with resizeable anonymous allocations under POSIX"
-- Assert that RAM_RESIZEABLE_ALLOC is not set before allocating

v2 -> v3:
- Rebased on current master/[1].
- "util: vfio-helpers: Factor out and fix processing of existing ram
   blocks"
-- moved to [1]
- "util: vfio-helpers: Remove Error parameter from qemu_vfio_undo_mapping()=
"
-- Better parch description
- "util/mmap-alloc: Factor out calculation of pagesize to mmap_pagesize()"
-- is now "util/mmap-alloc: Factor out calculation of the pagesize for the
   guard page"
-- Decided to keep special handling for the guard page for now
-- Dropped rb's
- "util/mmap-alloc: Prepare for resizeable mmaps"
-- No asserts sizes against the real page size
- "numa: Teach ram block notifiers about resizable ram blocks"
-- Split. One part is in [1], the other is now in "numa: Introduce
   ram_block_notifiers_support_resize()"
- "exec: Ram blocks with resizeable anonymous allocations under POSIX"
-- Call qemu_ram_apply_settings() only populated parts. Call it on
   freshly populated parts when growing.
- Minor changes

v1 -> v2:
- Add "util: vfio-helpers: Fix qemu_vfio_close()"
- Add "util: vfio-helpers: Remove Error parameter from
       qemu_vfio_undo_mapping()"
- Add "util: vfio-helpers: Factor out removal from
       qemu_vfio_undo_mapping()"
- "util/mmap-alloc: ..."
 -- Minor changes due to review feedback (e.g., assert alignment, return
    bool when resizing)
- "util: vfio-helpers: Implement ram_block_resized()"
 -- Reserve max_size in the IOVA address space.
 -- On resize, undo old mapping and do new mapping. We can later implement
    a new ioctl to resize the mapping directly.
- "numa: Teach ram block notifiers about resizable ram blocks"
 -- Pass size/max_size to ram block notifiers, which makes things easier an
    cleaner
- "exec: Ram blocks with resizable anonymous allocations under POSIX"
 -- Adapt to new ram block notifiers
 -- Shrink after notifying. Always trigger ram block notifiers on resizes
 -- Add a safety net that all ram block notifiers registered at runtime
    support resizes.

[1] https://lkml.kernel.org/r/20200226155304.60219-1-david@redhat.com
[2] https://lore.kernel.org/kvm/20191212171137.13872-1-david@redhat.com/

David Hildenbrand (15):
  util: vfio-helpers: Fix qemu_vfio_close()
  util: vfio-helpers: Remove Error parameter from
    qemu_vfio_undo_mapping()
  util: vfio-helpers: Factor out removal from qemu_vfio_undo_mapping()
  exec: Factor out setting ram settings (madvise ...) into
    qemu_ram_apply_settings()
  exec: Reuse qemu_ram_apply_settings() in qemu_ram_remap()
  exec: Drop "shared" parameter from ram_block_add()
  util/mmap-alloc: Factor out calculation of the pagesize for the guard
    page
  util/mmap-alloc: Factor out reserving of a memory region to
    mmap_reserve()
  util/mmap-alloc: Factor out activating of memory to mmap_activate()
  util/mmap-alloc: Prepare for resizeable mmaps
  util/mmap-alloc: Implement resizeable mmaps
  util: vfio-helpers: Implement ram_block_resized()
  util: oslib: Resizeable anonymous allocations under POSIX
  numa: Introduce ram_block_notifiers_support_resize()
  exec: Ram blocks with resizeable anonymous allocations under POSIX

 exec.c                    | 100 ++++++++++++++++++-----
 hw/core/numa.c            |  19 +++++
 include/exec/cpu-common.h |   2 +
 include/exec/memory.h     |   8 ++
 include/exec/ramlist.h    |   1 +
 include/qemu/mmap-alloc.h |  21 +++--
 include/qemu/osdep.h      |   6 +-
 util/mmap-alloc.c         | 168 ++++++++++++++++++++++++--------------
 util/oslib-posix.c        |  37 ++++++++-
 util/oslib-win32.c        |  14 ++++
 util/trace-events         |  11 ++-
 util/vfio-helpers.c       | 145 ++++++++++++++++++++++++--------
 12 files changed, 404 insertions(+), 128 deletions(-)

--=20
2.24.1


