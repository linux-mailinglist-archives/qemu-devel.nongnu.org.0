Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511032E60A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:19:24 +0100 (CET)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI7YJ-0006rx-JU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lI7W0-0005QL-Qh
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lI7Vz-0000JX-1e
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614939415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Y1M1d391uOplNVMwxXUq0UfXN29arv2SAlLv+184lA=;
 b=KOdEu4tJceT5+kOMSRUYzhyzB6g//sAj27Lm33vMRzl4LXgI3KERTMmWyW8dk7ZaUMtf63
 Qymm/M1PB6A4DOPQuHUIUngEY6ld3HhqWJN2chzdzlunCyabIDEYm3CIq2RIyaHbKpSfLi
 hg550mwaNka656QPuXK2GCWF/Oz2vNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-Z-3qMECOM0m3T0pEupiJmw-1; Fri, 05 Mar 2021 05:16:53 -0500
X-MC-Unique: Z-3qMECOM0m3T0pEupiJmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B492800D53;
 Fri,  5 Mar 2021 10:16:52 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C47C61001B2C;
 Fri,  5 Mar 2021 10:16:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] RAM_NORESERVE,
 MAP_NORESERVE and hostmem "reserve" property
Date: Fri,  5 Mar 2021 11:16:25 +0100
Message-Id: <20210305101634.10745-1-david@redhat.com>
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
avoiding to set "/proc/sys/vm/overcommit_memory == 1") when using
virtio-mem and also supporting hugetlbfs in the future.

virtio-mem currently only supports anonymous memory, in the future we want
to also support private memfd, shared file-based and shared hugetlbfs
mappings.

virtio-mem features I am currently working on include:
1. Introducing a prealloc option for virtio-mem (e.g., using fallocate()
   when plugging blocks) to fail nicely when running out of
   backing storage like huge pages.
2. Supporting resizable RAM block/memmory regions, such that we won't
   always expose a large, sparse memory region to the VM.
3. Handling virtio-mem requests via an iothread to not hold the BQL while
   populating/preallocating memory
4. Protecting unplugged memory e.g., using userfaultfd.
5. (resizeable allocations / optimized mmap handling when resizing RAM
    blocks)

Based-on: 20210303130916.22553-1-david@redhat.com

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


David Hildenbrand (9):
  softmmu/physmem: Drop "shared" parameter from ram_block_add()
  util/mmap-alloc: Factor out calculation of the pagesize for the guard
    page
  util/mmap-alloc: Factor out reserving of a memory region to
    mmap_reserve()
  util/mmap-alloc: Factor out activating of memory to mmap_activate()
  softmmu/memory: Pass ram_flags into qemu_ram_alloc_from_fd()
  softmmu/memory: Pass ram_flags into
    memory_region_init_ram_shared_nomigrate()
  memory: introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()
  util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE
  hostmem: Wire up RAM_NORESERVE via "reserve" property

 backends/hostmem-file.c                       |  11 +-
 backends/hostmem-memfd.c                      |   8 +-
 backends/hostmem-ram.c                        |   7 +-
 backends/hostmem.c                            |  33 +++
 hw/m68k/next-cube.c                           |   4 +-
 hw/misc/ivshmem.c                             |   5 +-
 include/exec/cpu-common.h                     |   1 +
 include/exec/memory.h                         |  43 ++--
 include/exec/ram_addr.h                       |   9 +-
 include/qemu/mmap-alloc.h                     |   2 +
 include/qemu/osdep.h                          |   3 +-
 include/sysemu/hostmem.h                      |   2 +-
 migration/ram.c                               |   3 +-
 .../memory-region-housekeeping.cocci          |   8 +-
 softmmu/memory.c                              |  27 ++-
 softmmu/physmem.c                             |  41 ++--
 util/mmap-alloc.c                             | 220 ++++++++++++------
 util/oslib-posix.c                            |   6 +-
 util/oslib-win32.c                            |  13 +-
 19 files changed, 299 insertions(+), 147 deletions(-)

-- 
2.29.2


