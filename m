Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A736D883
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:46:23 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkWE-0006Dd-Ey
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkQo-0001Wf-4K
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:40:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkQm-0006xf-3M
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+svVnGSR8uq1wBMVBL1n2c2te66Wz02CP84BpcH8nU=;
 b=dm6ohIKtXho2LRKLq66az1Dr+GvW7XGly45NCYv1UDBtM06q4obB2DHHvyh8Ip/Vxfg3nQ
 s3icfcHAf77SxJzn8JOjXViA3S5N4bZMbrUAN1pUT0DMX44gj4mEIGZVfWRSNIofMdt91R
 gMVsWnBUnHxPQMQi/snDzbjf1y4Mz9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-OXbWMVD-NDGnR6XMKszLIg-1; Wed, 28 Apr 2021 09:40:41 -0400
X-MC-Unique: OXbWMVD-NDGnR6XMKszLIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DBCC107ACC7;
 Wed, 28 Apr 2021 13:40:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A34B60CC9;
 Wed, 28 Apr 2021 13:40:36 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/15] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
Date: Wed, 28 Apr 2021 15:37:43 +0200
Message-Id: <20210428133754.10713-5-david@redhat.com>
In-Reply-To: <20210428133754.10713-1-david@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
to clean up and prepare for more flags.

Simplify the documentation of passed ram flags: Looking at our
documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
repetitive.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem-memfd.c | 7 ++++---
 hw/misc/ivshmem.c        | 5 ++---
 include/exec/memory.h    | 9 +++------
 include/exec/ram_addr.h  | 6 +-----
 softmmu/memory.c         | 7 +++----
 5 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 69b0ae30bb..93b5d1a4cf 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -36,6 +36,7 @@ static void
 memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
+    uint32_t ram_flags;
     char *name;
     int fd;
 
@@ -53,9 +54,9 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     }
 
     name = host_memory_backend_get_name(backend);
-    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
-                                   name, backend->size,
-                                   backend->share, fd, 0, errp);
+    ram_flags = backend->share ? RAM_SHARED : 0;
+    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
+                                   backend->size, ram_flags, fd, 0, errp);
     g_free(name);
 }
 
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a1fa4878be..1ba4a98377 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -493,9 +493,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
     size = buf.st_size;
 
     /* mmap the region and map into the BAR2 */
-    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, 0,
-                                   &local_err);
+    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s), "ivshmem.bar2",
+                                   size, RAM_SHARED, fd, 0, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b2..8ad280e532 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -991,10 +991,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * @size: size of the region.
  * @align: alignment of the region base address; if 0, the default alignment
  *         (getpagesize()) will be used.
- * @ram_flags: Memory region features:
- *             - RAM_SHARED: memory must be mmaped with the MAP_SHARED flag
- *             - RAM_PMEM: the memory is persistent memory
- *             Other bits are ignored now.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  * @path: the path in which to allocate the RAM.
  * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1020,7 +1017,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
- * @share: %true if memory must be mmaped with the MAP_SHARED flag
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  * @fd: the fd to mmap.
  * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1032,7 +1029,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     ram_addr_t offset,
                                     Error **errp);
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3cb9791df3..a7e3378340 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -104,11 +104,7 @@ long qemu_maxrampagesize(void);
  * Parameters:
  *  @size: the size in bytes of the ram block
  *  @mr: the memory region where the ram block is
- *  @ram_flags: specify the properties of the ram block, which can be one
- *              or bit-or of following values
- *              - RAM_SHARED: mmap the backing file or device with MAP_SHARED
- *              - RAM_PMEM: the backend @mem_path or @fd is persistent memory
- *              Other bits are ignored.
+ *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  *  @mem_path or @fd: specify the backing file or device
  *  @readonly: true to open @path for reading, false for read/write.
  *  @errp: pointer to Error*, to store an error if it happens
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e4..8c3acd839e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1611,7 +1611,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     ram_addr_t offset,
                                     Error **errp)
@@ -1621,9 +1621,8 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
-                                           share ? RAM_SHARED : 0,
-                                           fd, offset, false, &err);
+    mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset,
+                                           false, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
-- 
2.30.2


