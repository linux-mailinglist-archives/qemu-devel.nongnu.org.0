Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED3B164B17
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:54:13 +0100 (CET)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4Sc0-0008Fs-Ez
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j4S3B-0000F4-FW
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:18:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j4S3A-00045I-2f
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:18:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60462
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j4S39-000458-UZ
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582129091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEj9mJF11DhrqbQX0YVXX3cnOZeSLuB42yARQjagHeY=;
 b=R2BWdF+UOPjGj+DeOYKi1vvCTgEA8sFxxZf3EAxddFxyNzdIp7hOLuhx5/4TVw0/VkNGWf
 2DkDLMiuO336Y7SPjDkCYbbjzJlM1pzxmlq6ZzvFXESCb3MsAkEb2LxFuzscIDaW11c4Ru
 OFtJqeHVGEIZImpVR5vjwYkLLNqWdWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-p8SZ9pRHO6a0FvpOonbEMQ-1; Wed, 19 Feb 2020 11:18:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8DD78010EB;
 Wed, 19 Feb 2020 16:18:06 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 283418B577;
 Wed, 19 Feb 2020 16:17:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/13] util: vfio-helpers: Factor out and fix processing of
 existing ram blocks
Date: Wed, 19 Feb 2020 17:17:13 +0100
Message-Id: <20200219161725.115218-2-david@redhat.com>
In-Reply-To: <20200219161725.115218-1-david@redhat.com>
References: <20200219161725.115218-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: p8SZ9pRHO6a0FvpOonbEMQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor it out into common code when a new notifier is registered, just
as done with the memory region notifier. This allows us to have the
logic about how to process existing ram blocks at a central place (which
will be extended soon).

Just like when adding a new ram block, we have to register the max_length
for now. We don't have a way to get notified about resizes yet, and some
memory would not be mapped when growing the ram block.

Note: Currently, ram blocks are only "fake resized". All memory
(max_length) is accessible.

We can get rid of a bunch of functions in stubs/ram-block.c . Print the
warning from inside qemu_vfio_ram_block_added().

Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 exec.c                    |  5 +++++
 hw/core/numa.c            | 14 ++++++++++++++
 include/exec/cpu-common.h |  1 +
 util/vfio-helpers.c       | 28 +++++++---------------------
 4 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/exec.c b/exec.c
index 8e9cc3b47c..dfd43d27c6 100644
--- a/exec.c
+++ b/exec.c
@@ -2016,6 +2016,11 @@ ram_addr_t qemu_ram_get_used_length(RAMBlock *rb)
     return rb->used_length;
 }
=20
+ram_addr_t qemu_ram_get_max_length(RAMBlock *rb)
+{
+    return rb->max_length;
+}
+
 bool qemu_ram_is_shared(RAMBlock *rb)
 {
     return rb->flags & RAM_SHARED;
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 0d1b4be76a..6599c69e05 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -899,9 +899,23 @@ void query_numa_node_mem(NumaNodeMem node_mem[], Machi=
neState *ms)
     }
 }
=20
+static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
+{
+    const ram_addr_t max_size =3D qemu_ram_get_max_length(rb);
+    void *host =3D qemu_ram_get_host_addr(rb);
+    RAMBlockNotifier *notifier =3D opaque;
+
+    if (host) {
+        notifier->ram_block_added(notifier, host, max_size);
+    }
+    return 0;
+}
+
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
+    /* Notify about all existing ram blocks. */
+    qemu_ram_foreach_block(ram_block_notify_add_single, n);
 }
=20
 void ram_block_notifier_remove(RAMBlockNotifier *n)
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 81753bbb34..9760ac9068 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -59,6 +59,7 @@ const char *qemu_ram_get_idstr(RAMBlock *rb);
 void *qemu_ram_get_host_addr(RAMBlock *rb);
 ram_addr_t qemu_ram_get_offset(RAMBlock *rb);
 ram_addr_t qemu_ram_get_used_length(RAMBlock *rb);
+ram_addr_t qemu_ram_get_max_length(RAMBlock *rb);
 bool qemu_ram_is_shared(RAMBlock *rb);
 bool qemu_ram_is_uf_zeroable(RAMBlock *rb);
 void qemu_ram_set_uf_zeroable(RAMBlock *rb);
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 813f7ec564..71e02e7f35 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -376,8 +376,13 @@ static void qemu_vfio_ram_block_added(RAMBlockNotifier=
 *n,
                                       void *host, size_t size)
 {
     QEMUVFIOState *s =3D container_of(n, QEMUVFIOState, ram_notifier);
+    int ret;
+
     trace_qemu_vfio_ram_block_added(s, host, size);
-    qemu_vfio_dma_map(s, host, size, false, NULL);
+    ret =3D qemu_vfio_dma_map(s, host, size, false, NULL);
+    if (ret) {
+        error_report("qemu_vfio_dma_map(%p, %zu) failed: %d", host, size, =
ret);
+    }
 }
=20
 static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n,
@@ -390,33 +395,14 @@ static void qemu_vfio_ram_block_removed(RAMBlockNotif=
ier *n,
     }
 }
=20
-static int qemu_vfio_init_ramblock(RAMBlock *rb, void *opaque)
-{
-    void *host_addr =3D qemu_ram_get_host_addr(rb);
-    ram_addr_t length =3D qemu_ram_get_used_length(rb);
-    int ret;
-    QEMUVFIOState *s =3D opaque;
-
-    if (!host_addr) {
-        return 0;
-    }
-    ret =3D qemu_vfio_dma_map(s, host_addr, length, false, NULL);
-    if (ret) {
-        fprintf(stderr, "qemu_vfio_init_ramblock: failed %p %" PRId64 "\n"=
,
-                host_addr, (uint64_t)length);
-    }
-    return 0;
-}
-
 static void qemu_vfio_open_common(QEMUVFIOState *s)
 {
     qemu_mutex_init(&s->lock);
     s->ram_notifier.ram_block_added =3D qemu_vfio_ram_block_added;
     s->ram_notifier.ram_block_removed =3D qemu_vfio_ram_block_removed;
-    ram_block_notifier_add(&s->ram_notifier);
     s->low_water_mark =3D QEMU_VFIO_IOVA_MIN;
     s->high_water_mark =3D QEMU_VFIO_IOVA_MAX;
-    qemu_ram_foreach_block(qemu_vfio_init_ramblock, s);
+    ram_block_notifier_add(&s->ram_notifier);
 }
=20
 /**
--=20
2.24.1


