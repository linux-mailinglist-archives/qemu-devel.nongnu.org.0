Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0A3494F5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:09:27 +0100 (CET)
Received: from localhost ([::1]:33458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRby-0006bM-JS
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaV-0004gg-2t
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:55 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaT-0007dw-6f
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:54 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-mtMwooD0PWSw7_M90LqH7w-1; Thu, 25 Mar 2021 11:07:50 -0400
X-MC-Unique: mtMwooD0PWSw7_M90LqH7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A874A1005D57;
 Thu, 25 Mar 2021 15:07:48 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADFAA5C649;
 Thu, 25 Mar 2021 15:07:46 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 1/8] memory: Allow eventfd add/del without starting a transaction
Date: Thu, 25 Mar 2021 16:07:28 +0100
Message-Id: <20210325150735.1098387-2-groug@kaod.org>
In-Reply-To: <20210325150735.1098387-1-groug@kaod.org>
References: <20210325150735.1098387-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each addition or deletion of an eventfd happens in its own MR
transaction. This doesn't scale well with multiqueue devices
that do 1:1 queue:vCPU mapping (e.g. virtio-scsi-pci or
virtio-blk-pci) : these devices typically create at least one
eventfd per queue and memory_region_transaction_commit(),
which is called during commit, also loops on eventfds, resulting
in a quadratic time complexity. This calls for batching : a
device should be able to add or delete its eventfds in a single
transaction.

Prepare ground for this by introducing extended versions of
memory_region_add_eventfd() and memory_region_del_eventfd()
that take an extra bool argument to control if a transaction
should be started or not.

No behavior change at this point.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/exec/memory.h | 48 ++++++++++++++++++++++++++++++++-----------
 softmmu/memory.c      | 42 ++++++++++++++++++++++---------------
 2 files changed, 62 insertions(+), 28 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27d..98ed552e001c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1848,13 +1848,25 @@ void memory_region_clear_flush_coalesced(MemoryRegi=
on *mr);
  * @match_data: whether to match against @data, instead of just @addr
  * @data: the data to match against the guest write
  * @e: event notifier to be triggered when @addr, @size, and @data all mat=
ch.
+ * @transaction: whether to start a transaction for the change
  **/
-void memory_region_add_eventfd(MemoryRegion *mr,
-                               hwaddr addr,
-                               unsigned size,
-                               bool match_data,
-                               uint64_t data,
-                               EventNotifier *e);
+void memory_region_add_eventfd_full(MemoryRegion *mr,
+                                    hwaddr addr,
+                                    unsigned size,
+                                    bool match_data,
+                                    uint64_t data,
+                                    EventNotifier *e,
+                                    bool transaction);
+
+static inline void memory_region_add_eventfd(MemoryRegion *mr,
+                                             hwaddr addr,
+                                             unsigned size,
+                                             bool match_data,
+                                             uint64_t data,
+                                             EventNotifier *e)
+{
+    memory_region_add_eventfd_full(mr, addr, size, match_data, data, e, tr=
ue);
+}
=20
 /**
  * memory_region_del_eventfd: Cancel an eventfd.
@@ -1868,13 +1880,25 @@ void memory_region_add_eventfd(MemoryRegion *mr,
  * @match_data: whether to match against @data, instead of just @addr
  * @data: the data to match against the guest write
  * @e: event notifier to be triggered when @addr, @size, and @data all mat=
ch.
+ * @transaction: whether to start a transaction for the change
  */
-void memory_region_del_eventfd(MemoryRegion *mr,
-                               hwaddr addr,
-                               unsigned size,
-                               bool match_data,
-                               uint64_t data,
-                               EventNotifier *e);
+void memory_region_del_eventfd_full(MemoryRegion *mr,
+                                    hwaddr addr,
+                                    unsigned size,
+                                    bool match_data,
+                                    uint64_t data,
+                                    EventNotifier *e,
+                                    bool transaction);
+
+static inline void memory_region_del_eventfd(MemoryRegion *mr,
+                                             hwaddr addr,
+                                             unsigned size,
+                                             bool match_data,
+                                             uint64_t data,
+                                             EventNotifier *e)
+{
+    memory_region_del_eventfd_full(mr, addr, size, match_data, data, e, tr=
ue);
+}
=20
 /**
  * memory_region_add_subregion: Add a subregion to a container.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e430..1b1942d521cc 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2341,12 +2341,13 @@ void memory_region_clear_flush_coalesced(MemoryRegi=
on *mr)
=20
 static bool userspace_eventfd_warning;
=20
-void memory_region_add_eventfd(MemoryRegion *mr,
-                               hwaddr addr,
-                               unsigned size,
-                               bool match_data,
-                               uint64_t data,
-                               EventNotifier *e)
+void memory_region_add_eventfd_full(MemoryRegion *mr,
+                                    hwaddr addr,
+                                    unsigned size,
+                                    bool match_data,
+                                    uint64_t data,
+                                    EventNotifier *e,
+                                    bool transaction)
 {
     MemoryRegionIoeventfd mrfd =3D {
         .addr.start =3D int128_make64(addr),
@@ -2367,7 +2368,9 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     if (size) {
         adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
     }
-    memory_region_transaction_begin();
+    if (transaction) {
+        memory_region_transaction_begin();
+    }
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
         if (memory_region_ioeventfd_before(&mrfd, &mr->ioeventfds[i])) {
             break;
@@ -2380,15 +2383,18 @@ void memory_region_add_eventfd(MemoryRegion *mr,
             sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb-1 - i));
     mr->ioeventfds[i] =3D mrfd;
     ioeventfd_update_pending |=3D mr->enabled;
-    memory_region_transaction_commit();
+    if (transaction) {
+        memory_region_transaction_commit();
+    }
 }
=20
-void memory_region_del_eventfd(MemoryRegion *mr,
-                               hwaddr addr,
-                               unsigned size,
-                               bool match_data,
-                               uint64_t data,
-                               EventNotifier *e)
+void memory_region_del_eventfd_full(MemoryRegion *mr,
+                                    hwaddr addr,
+                                    unsigned size,
+                                    bool match_data,
+                                    uint64_t data,
+                                    EventNotifier *e,
+                                    bool transaction)
 {
     MemoryRegionIoeventfd mrfd =3D {
         .addr.start =3D int128_make64(addr),
@@ -2402,7 +2408,9 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     if (size) {
         adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
     }
-    memory_region_transaction_begin();
+    if (transaction) {
+        memory_region_transaction_begin();
+    }
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
         if (memory_region_ioeventfd_equal(&mrfd, &mr->ioeventfds[i])) {
             break;
@@ -2415,7 +2423,9 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     mr->ioeventfds =3D g_realloc(mr->ioeventfds,
                                   sizeof(*mr->ioeventfds)*mr->ioeventfd_nb=
 + 1);
     ioeventfd_update_pending |=3D mr->enabled;
-    memory_region_transaction_commit();
+    if (transaction) {
+        memory_region_transaction_commit();
+    }
 }
=20
 static void memory_region_update_container_subregions(MemoryRegion *subreg=
ion)
--=20
2.26.3


