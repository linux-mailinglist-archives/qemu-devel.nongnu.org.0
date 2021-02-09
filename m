Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D671315106
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:57:25 +0100 (CET)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TW8-0008PR-5V
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TPt-0002Yn-QU
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TPr-0005NB-9T
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jriKJVlZDezJBHIXvRo3fWRVF/HtZ+m6UuinOLmdjO0=;
 b=Dj+GWpFW2jiTLv6oSQS2GJRZDYqzJaqPNyo1wiHT/g7ozS9mtjqP6xrf6FbBWBj/oPEziN
 +9w+datd8t51tT0sELjuiZgY/8BD2eA5GYt6Ghy3D2Mw57fp3r8QnasMVBeYzzXPpaooXg
 oolfXlzi1xIybwRfg16XKFlpGVHM+QA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-hpk1PF1BMSW9SsLFMVq7Ew-1; Tue, 09 Feb 2021 08:50:51 -0500
X-MC-Unique: hpk1PF1BMSW9SsLFMVq7Ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 749926D4F9;
 Tue,  9 Feb 2021 13:50:49 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFD86F971;
 Tue,  9 Feb 2021 13:50:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/9] softmmu/memory: pass ram_flags into
 qemu_ram_alloc_from_fd()
Date: Tue,  9 Feb 2021 14:49:35 +0100
Message-Id: <20210209134939.13083-6-david@redhat.com>
In-Reply-To: <20210209134939.13083-1-david@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
to clean up and prepare for more flags.

Simplify the documentation of passed ram flags: Looking at our
documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
repetitive.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem-memfd.c | 7 ++++---
 hw/misc/ivshmem.c        | 4 ++--
 include/exec/memory.h    | 9 +++------
 include/exec/ram_addr.h  | 6 +-----
 softmmu/memory.c         | 7 +++----
 5 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index e5626d4330..54db08de0d 100644
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
-                                   backend->share, fd, errp);
+    ram_flags = backend->share ? RAM_SHARED : 0;
+    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
+                                   backend->size, ram_flags, fd, errp);
     g_free(name);
 }
 
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 0505b52c98..4cdce136e1 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -494,8 +494,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
     size = buf.st_size;
 
     /* mmap the region and map into the BAR2 */
-    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, &local_err);
+    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s), "ivshmem.bar2",
+                                   size, RAM_SHARED, fd, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index e58c09f130..7b635b334f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -969,10 +969,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
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
@@ -998,7 +995,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
- * @share: %true if memory must be mmaped with the MAP_SHARED flag
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  * @fd: the fd to mmap.
  * @errp: pointer to Error*, to store an error if it happens.
  *
@@ -1009,7 +1006,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     struct Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     Error **errp);
 #endif
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 40b16609ab..86fa712134 100644
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
index c0c814fbb9..25120ecae7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1610,7 +1610,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     struct Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     Error **errp)
 {
@@ -1619,9 +1619,8 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
-                                           share ? RAM_SHARED : 0,
-                                           fd, false, &err);
+    mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, false,
+                                           &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
-- 
2.29.2


