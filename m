Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BAF1683EF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:46:53 +0100 (CET)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5BRz-0004qD-W1
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j5BOW-0008Al-L8
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:43:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j5BOU-0006ib-OT
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:43:16 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31299)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j5BOU-0006ho-J4
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582303393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gm4E2H+UsvDbJoOz38xrcXlXvsFFgBUsWOd4QRP/Pc8=;
 b=ijdaQOFKT0Zju/cWyNFFpDHGCdVYqG5Fa+pomf5PY9fcKB5ohuHNKkPFT4eb2MnTPT6NGb
 CQVRxWSDKI/tSf77K61g7nVaNAyur1REshZ++Hu/cQ1u/7lBTHPgTZmyr+DiCbxnD2Belq
 839hvao0qa8CiszemwxUWv0sQKiNRM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-MWTpaPyAObe9_oE9y9YcQA-1; Fri, 21 Feb 2020 11:43:10 -0500
X-MC-Unique: MWTpaPyAObe9_oE9y9YcQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92965801A0E;
 Fri, 21 Feb 2020 16:43:08 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-197.ams2.redhat.com [10.36.117.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3FAE5C105;
 Fri, 21 Feb 2020 16:43:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] numa: Teach ram block notifiers about resizeable ram
 blocks
Date: Fri, 21 Feb 2020 17:41:54 +0100
Message-Id: <20200221164204.105570-4-david@redhat.com>
In-Reply-To: <20200221164204.105570-1-david@redhat.com>
References: <20200221164204.105570-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paul Durrant <paul@xen.org>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ram block notifiers are currently not aware of resizes. Especially to
handle resizes during migration, but also to implement actually resizeable
ram blocks (make everything between used_length and max_length
inaccessible), we want to teach ram block notifiers about resizeable
ram.

Introduce the basic infrastructure but keep using max_size in the
existing notifiers. Supply the max_size when adding and removing ram
blocks. Also, notify on resizes.

Acked-by: Paul Durrant <paul@xen.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xen-devel@lists.xenproject.org
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 exec.c                     | 13 +++++++++++--
 hw/core/numa.c             | 22 +++++++++++++++++-----
 hw/i386/xen/xen-mapcache.c |  7 ++++---
 include/exec/ramlist.h     | 13 +++++++++----
 target/i386/hax-mem.c      |  5 +++--
 target/i386/sev.c          | 18 ++++++++++--------
 util/vfio-helpers.c        | 16 ++++++++--------
 7 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/exec.c b/exec.c
index dfd43d27c6..b75250e773 100644
--- a/exec.c
+++ b/exec.c
@@ -2129,6 +2129,8 @@ static int memory_try_enable_merging(void *addr, size=
_t len)
  */
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
 {
+    const ram_addr_t oldsize =3D block->used_length;
+
     assert(block);
=20
     newsize =3D HOST_PAGE_ALIGN(newsize);
@@ -2153,6 +2155,11 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t news=
ize, Error **errp)
         return -EINVAL;
     }
=20
+    /* Notify before modifying the ram block and touching the bitmaps. */
+    if (block->host) {
+        ram_block_notify_resize(block->host, oldsize, newsize);
+    }
+
     cpu_physical_memory_clear_dirty_range(block->offset, block->used_lengt=
h);
     block->used_length =3D newsize;
     cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
@@ -2312,7 +2319,8 @@ static void ram_block_add(RAMBlock *new_block, Error =
**errp, bool shared)
         qemu_madvise(new_block->host, new_block->max_length, QEMU_MADV_HUG=
EPAGE);
         /* MADV_DONTFORK is also needed by KVM in absence of synchronous M=
MU */
         qemu_madvise(new_block->host, new_block->max_length, QEMU_MADV_DON=
TFORK);
-        ram_block_notify_add(new_block->host, new_block->max_length);
+        ram_block_notify_add(new_block->host, new_block->used_length,
+                             new_block->max_length);
     }
 }
=20
@@ -2492,7 +2500,8 @@ void qemu_ram_free(RAMBlock *block)
     }
=20
     if (block->host) {
-        ram_block_notify_remove(block->host, block->max_length);
+        ram_block_notify_remove(block->host, block->used_length,
+                                block->max_length);
     }
=20
     qemu_mutex_lock_ramlist();
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 6599c69e05..e28ad24fcd 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -902,11 +902,12 @@ void query_numa_node_mem(NumaNodeMem node_mem[], Mach=
ineState *ms)
 static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
 {
     const ram_addr_t max_size =3D qemu_ram_get_max_length(rb);
+    const ram_addr_t size =3D qemu_ram_get_used_length(rb);
     void *host =3D qemu_ram_get_host_addr(rb);
     RAMBlockNotifier *notifier =3D opaque;
=20
     if (host) {
-        notifier->ram_block_added(notifier, host, max_size);
+        notifier->ram_block_added(notifier, host, size, max_size);
     }
     return 0;
 }
@@ -923,20 +924,31 @@ void ram_block_notifier_remove(RAMBlockNotifier *n)
     QLIST_REMOVE(n, next);
 }
=20
-void ram_block_notify_add(void *host, size_t size)
+void ram_block_notify_add(void *host, size_t size, size_t max_size)
 {
     RAMBlockNotifier *notifier;
=20
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_added(notifier, host, size);
+        notifier->ram_block_added(notifier, host, size, max_size);
     }
 }
=20
-void ram_block_notify_remove(void *host, size_t size)
+void ram_block_notify_remove(void *host, size_t size, size_t max_size)
 {
     RAMBlockNotifier *notifier;
=20
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_removed(notifier, host, size);
+        notifier->ram_block_removed(notifier, host, size, max_size);
+    }
+}
+
+void ram_block_notify_resize(void *host, size_t old_size, size_t new_size)
+{
+    RAMBlockNotifier *notifier;
+
+    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
+        if (notifier->ram_block_resized) {
+            notifier->ram_block_resized(notifier, host, old_size, new_size=
);
+        }
     }
 }
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 5b120ed44b..d6dcea65d1 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -169,7 +169,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
=20
     if (entry->vaddr_base !=3D NULL) {
         if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
-            ram_block_notify_remove(entry->vaddr_base, entry->size);
+            ram_block_notify_remove(entry->vaddr_base, entry->size,
+                                    entry->size);
         }
         if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
             perror("unmap fails");
@@ -211,7 +212,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
     }
=20
     if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
-        ram_block_notify_add(vaddr_base, size);
+        ram_block_notify_add(vaddr_base, size, size);
     }
=20
     entry->vaddr_base =3D vaddr_base;
@@ -452,7 +453,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uin=
t8_t *buffer)
     }
=20
     pentry->next =3D entry->next;
-    ram_block_notify_remove(entry->vaddr_base, entry->size);
+    ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
     if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
         perror("unmap fails");
         exit(-1);
diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
index bc4faa1b00..293c0ddabe 100644
--- a/include/exec/ramlist.h
+++ b/include/exec/ramlist.h
@@ -65,15 +65,20 @@ void qemu_mutex_lock_ramlist(void);
 void qemu_mutex_unlock_ramlist(void);
=20
 struct RAMBlockNotifier {
-    void (*ram_block_added)(RAMBlockNotifier *n, void *host, size_t size);
-    void (*ram_block_removed)(RAMBlockNotifier *n, void *host, size_t size=
);
+    void (*ram_block_added)(RAMBlockNotifier *n, void *host, size_t size,
+                            size_t max_size);
+    void (*ram_block_removed)(RAMBlockNotifier *n, void *host, size_t size=
,
+                              size_t max_size);
+    void (*ram_block_resized)(RAMBlockNotifier *n, void *host, size_t old_=
size,
+                              size_t new_size);
     QLIST_ENTRY(RAMBlockNotifier) next;
 };
=20
 void ram_block_notifier_add(RAMBlockNotifier *n);
 void ram_block_notifier_remove(RAMBlockNotifier *n);
-void ram_block_notify_add(void *host, size_t size);
-void ram_block_notify_remove(void *host, size_t size);
+void ram_block_notify_add(void *host, size_t size, size_t max_size);
+void ram_block_notify_remove(void *host, size_t size, size_t max_size);
+void ram_block_notify_resize(void *host, size_t old_size, size_t new_size)=
;
=20
 void ram_block_dump(Monitor *mon);
=20
diff --git a/target/i386/hax-mem.c b/target/i386/hax-mem.c
index 6bb5a24917..454d7fb212 100644
--- a/target/i386/hax-mem.c
+++ b/target/i386/hax-mem.c
@@ -293,7 +293,8 @@ static MemoryListener hax_memory_listener =3D {
     .priority =3D 10,
 };
=20
-static void hax_ram_block_added(RAMBlockNotifier *n, void *host, size_t si=
ze)
+static void hax_ram_block_added(RAMBlockNotifier *n, void *host, size_t si=
ze,
+                                size_t max_size)
 {
     /*
      * We must register each RAM block with the HAXM kernel module, or
@@ -304,7 +305,7 @@ static void hax_ram_block_added(RAMBlockNotifier *n, vo=
id *host, size_t size)
      * host physical pages for the RAM block as part of this registration
      * process, hence the name hax_populate_ram().
      */
-    if (hax_populate_ram((uint64_t)(uintptr_t)host, size) < 0) {
+    if (hax_populate_ram((uint64_t)(uintptr_t)host, max_size) < 0) {
         fprintf(stderr, "HAX failed to populate RAM\n");
         abort();
     }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 024bb24e51..6b4cee24a2 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -129,7 +129,8 @@ sev_set_guest_state(SevState new_state)
 }
=20
 static void
-sev_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
+sev_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                    size_t max_size)
 {
     int r;
     struct kvm_enc_region range;
@@ -146,19 +147,20 @@ sev_ram_block_added(RAMBlockNotifier *n, void *host, =
size_t size)
     }
=20
     range.addr =3D (__u64)(unsigned long)host;
-    range.size =3D size;
+    range.size =3D max_size;
=20
-    trace_kvm_memcrypt_register_region(host, size);
+    trace_kvm_memcrypt_register_region(host, max_size);
     r =3D kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_REG_REGION, &range);
     if (r) {
         error_report("%s: failed to register region (%p+%#zx) error '%s'",
-                     __func__, host, size, strerror(errno));
+                     __func__, host, max_size, strerror(errno));
         exit(1);
     }
 }
=20
 static void
-sev_ram_block_removed(RAMBlockNotifier *n, void *host, size_t size)
+sev_ram_block_removed(RAMBlockNotifier *n, void *host, size_t size,
+                      size_t max_size)
 {
     int r;
     struct kvm_enc_region range;
@@ -175,13 +177,13 @@ sev_ram_block_removed(RAMBlockNotifier *n, void *host=
, size_t size)
     }
=20
     range.addr =3D (__u64)(unsigned long)host;
-    range.size =3D size;
+    range.size =3D max_size;
=20
-    trace_kvm_memcrypt_unregister_region(host, size);
+    trace_kvm_memcrypt_unregister_region(host, max_size);
     r =3D kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_UNREG_REGION, &range)=
;
     if (r) {
         error_report("%s: failed to unregister region (%p+%#zx)",
-                     __func__, host, size);
+                     __func__, host, max_size);
     }
 }
=20
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 260570ae19..9ec01bfe26 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -372,26 +372,26 @@ fail_container:
     return ret;
 }
=20
-static void qemu_vfio_ram_block_added(RAMBlockNotifier *n,
-                                      void *host, size_t size)
+static void qemu_vfio_ram_block_added(RAMBlockNotifier *n, void *host,
+                                      size_t size, size_t max_size)
 {
     QEMUVFIOState *s =3D container_of(n, QEMUVFIOState, ram_notifier);
     int ret;
=20
-    trace_qemu_vfio_ram_block_added(s, host, size);
-    ret =3D qemu_vfio_dma_map(s, host, size, false, NULL);
+    trace_qemu_vfio_ram_block_added(s, host, max_size);
+    ret =3D qemu_vfio_dma_map(s, host, max_size, false, NULL);
     if (ret) {
-        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, size,
+        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, max_si=
ze,
                      strerror(-ret));
     }
 }
=20
-static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n,
-                                        void *host, size_t size)
+static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n, void *host,
+                                        size_t size, size_t max_size)
 {
     QEMUVFIOState *s =3D container_of(n, QEMUVFIOState, ram_notifier);
     if (host) {
-        trace_qemu_vfio_ram_block_removed(s, host, size);
+        trace_qemu_vfio_ram_block_removed(s, host, max_size);
         qemu_vfio_dma_unmap(s, host);
     }
 }
--=20
2.24.1


