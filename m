Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B623150D4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:53:05 +0100 (CET)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TRw-00048S-5N
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TPA-0002EL-My
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TP5-00050m-2K
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Tu+jC4ugh0wPgN+6Baun7qV0Jk6sn1RUcEX3N7xJsss=;
 b=RWUl0v+KgAyGP0PQeIDGMmN36Wy4XNHgtEtlSvLXa61GuzbTR5mM7rYbx/mpvsXgo3GpUu
 Bq+RTggPmJzvLtd8cNhP8H1EbZAsnQd9j5D/tH6wS8A1M9b5RNLGY7NbsELLG9mTGmWPhr
 dw0sFRyExEKibV9Rn8KV8E5WJvKqPRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-EElFTt0tOnKMwZegmjqSJg-1; Tue, 09 Feb 2021 08:50:00 -0500
X-MC-Unique: EElFTt0tOnKMwZegmjqSJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71BC51005501;
 Tue,  9 Feb 2021 13:49:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ABE260D11;
 Tue,  9 Feb 2021 13:49:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/9] RAM_NORESERVE,
 MAP_NORESERVE and hostmem "reserve" property
Date: Tue,  9 Feb 2021 14:49:30 +0100
Message-Id: <20210209134939.13083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Juan Quintela <quintela@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some cleanups previously sent in other context (resizeable allocations),
followed by RAM_NORESERVE, implementing it under POSIX using MAP_NORESERVE,
and letting users configure it for memory backens using the "reserve"
property (default: true).

MAP_NORESERVE under Linux has in the context of QEMU an effect on
1) Private anonymous memory
-> memory-backend-ram,id=mem0,size=10G
2) Private file-based mappings
-> memory-backend-file,id=mem0,size=10G,mem-path=/dev/shm/0
3) Private/shared hugetlbfs memory
-> memory-backend-memfd,id=mem0,size=10G,hugetlb=on,hugetlbsize=2M

With MAP_NORESERVE/"reserve=off", we won't be reserving swap space (1/2) or
huge pages (3) for the whole memory region.

The target use case is virtio-mem, which dynamically exposes memory
inside a large, sparse memory area to the VM. MAP_NORESERVE tells the OS
"this mapping might be very sparse". This essentially allows
avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
virtio-mem and also supporting hugetlbfs in the future.

virtio-mem currently only supports anonymous memory, in the future we want
to also support shared file-based and shared hugetlbfs mappings. We most
probably won't be supporting private mappings as they can end up behaving
very weird when it comes to memory consumption.

Future work for virtio-mem I am currently working on includes
1. Introducing a prealloc option for virtio-mem (e.g., using fallocate()
   when plugging blocks) to fail nicely when running out of
   backing storage like huge pages.
2. Supporting resizable RAM block/memoryr egions, such that we won't always
   expose a large, sparse memory region to the VM.
3. Protecting unplugged memory e.g., using userfaultfd.
4. (resizeable allocations / optimized mmap handling when resizing RAM
    blocks)

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

David Hildenbrand (9):
  softmmu/physmem: drop "shared" parameter from ram_block_add()
  util/mmap-alloc: factor out calculation of the pagesize for the guard
    page
  util/mmap-alloc: factor out reserving of a memory region to
    mmap_reserve()
  util/mmap-alloc: factor out activating of memory to mmap_activate()
  softmmu/memory: pass ram_flags into qemu_ram_alloc_from_fd()
  softmmu/memory: pass ram_flags into
    memory_region_init_ram_shared_nomigrate()
  memory: introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()
  util/mmap-alloc: support RAM_NORESERVE via MAP_NORESERVE
  hostmem: wire up RAM_NORESERVE via "reserve" property

 backends/hostmem-file.c                       |  11 +-
 backends/hostmem-memfd.c                      |   8 +-
 backends/hostmem-ram.c                        |   7 +-
 backends/hostmem.c                            |  33 +++
 hw/m68k/next-cube.c                           |   4 +-
 hw/misc/ivshmem.c                             |   4 +-
 include/exec/cpu-common.h                     |   1 +
 include/exec/memory.h                         |  43 ++--
 include/exec/ram_addr.h                       |   9 +-
 include/qemu/mmap-alloc.h                     |   4 +-
 include/qemu/osdep.h                          |   3 +-
 include/sysemu/hostmem.h                      |   2 +-
 include/sysemu/kvm.h                          |   3 +-
 migration/ram.c                               |   3 +-
 .../memory-region-housekeeping.cocci          |   8 +-
 softmmu/memory.c                              |  27 ++-
 softmmu/physmem.c                             |  48 +++--
 target/s390x/kvm.c                            |   6 +-
 util/mmap-alloc.c                             | 188 ++++++++++++------
 util/oslib-posix.c                            |   5 +-
 util/oslib-win32.c                            |  13 +-
 21 files changed, 281 insertions(+), 149 deletions(-)

-- 
2.29.2


