Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9936E998
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:31:42 +0200 (CEST)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4tR-0002oJ-3J
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4pV-0007hx-D7
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:27:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4pT-0003LK-M5
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619695655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6Z9iLYgXWQ95p6aANNNRUmSBrphlRfsCtYiZznnWR4=;
 b=AGl5EdeD32Rt29qfmIEEnzvTeE/Z6t41dDLXrEgBEiZ61g0vUYxtZpbS1DxeAu9NSKsHwA
 /WKn0yPJhYWD5mNOW4tPoEdlWPK4n6C8n6Sv7hH8WTXub7vqT99g+xqb9KyxsgIdB4zTFt
 LQsqHYxp2VkJ+94nUVIOtYoVbM4wNnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-x7_5uFYPNPOejntptz2e3w-1; Thu, 29 Apr 2021 07:27:31 -0400
X-MC-Unique: x7_5uFYPNPOejntptz2e3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A808042AD;
 Thu, 29 Apr 2021 11:27:30 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3FCE69513;
 Thu, 29 Apr 2021 11:27:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] util: vfio-helpers: Factor out and fix processing of
 existing ram blocks
Date: Thu, 29 Apr 2021 13:26:59 +0200
Message-Id: <20210429112708.12291-2-david@redhat.com>
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor it out into common code when a new notifier is registered, just
as done with the memory region notifier. This keeps logic about how to
process existing ram blocks at a central place.

Just like when adding a new ram block, we have to register the max_length.
Ram blocks are only "fake resized". All memory (max_length) is mapped.

Print the warning from inside qemu_vfio_ram_block_added().

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/numa.c            | 14 ++++++++++++++
 include/exec/cpu-common.h |  1 +
 softmmu/physmem.c         |  5 +++++
 util/vfio-helpers.c       | 29 ++++++++---------------------
 4 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 68cee65f61..7f08c27a6d 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -803,9 +803,23 @@ void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms)
     }
 }
 
+static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
+{
+    const ram_addr_t max_size = qemu_ram_get_max_length(rb);
+    void *host = qemu_ram_get_host_addr(rb);
+    RAMBlockNotifier *notifier = opaque;
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
 
 void ram_block_notifier_remove(RAMBlockNotifier *n)
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 5a0a2d93e0..ccabed4003 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -57,6 +57,7 @@ const char *qemu_ram_get_idstr(RAMBlock *rb);
 void *qemu_ram_get_host_addr(RAMBlock *rb);
 ram_addr_t qemu_ram_get_offset(RAMBlock *rb);
 ram_addr_t qemu_ram_get_used_length(RAMBlock *rb);
+ram_addr_t qemu_ram_get_max_length(RAMBlock *rb);
 bool qemu_ram_is_shared(RAMBlock *rb);
 bool qemu_ram_is_uf_zeroable(RAMBlock *rb);
 void qemu_ram_set_uf_zeroable(RAMBlock *rb);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9c11..bd2c0dc4ec 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1697,6 +1697,11 @@ ram_addr_t qemu_ram_get_used_length(RAMBlock *rb)
     return rb->used_length;
 }
 
+ram_addr_t qemu_ram_get_max_length(RAMBlock *rb)
+{
+    return rb->max_length;
+}
+
 bool qemu_ram_is_shared(RAMBlock *rb)
 {
     return rb->flags & RAM_SHARED;
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 97dfa3fd57..92b9565797 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -463,8 +463,14 @@ static void qemu_vfio_ram_block_added(RAMBlockNotifier *n,
                                       void *host, size_t size)
 {
     QEMUVFIOState *s = container_of(n, QEMUVFIOState, ram_notifier);
+    int ret;
+
     trace_qemu_vfio_ram_block_added(s, host, size);
-    qemu_vfio_dma_map(s, host, size, false, NULL);
+    ret = qemu_vfio_dma_map(s, host, size, false, NULL);
+    if (ret) {
+        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, size,
+                     strerror(-ret));
+    }
 }
 
 static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n,
@@ -477,33 +483,14 @@ static void qemu_vfio_ram_block_removed(RAMBlockNotifier *n,
     }
 }
 
-static int qemu_vfio_init_ramblock(RAMBlock *rb, void *opaque)
-{
-    void *host_addr = qemu_ram_get_host_addr(rb);
-    ram_addr_t length = qemu_ram_get_used_length(rb);
-    int ret;
-    QEMUVFIOState *s = opaque;
-
-    if (!host_addr) {
-        return 0;
-    }
-    ret = qemu_vfio_dma_map(s, host_addr, length, false, NULL);
-    if (ret) {
-        fprintf(stderr, "qemu_vfio_init_ramblock: failed %p %" PRId64 "\n",
-                host_addr, (uint64_t)length);
-    }
-    return 0;
-}
-
 static void qemu_vfio_open_common(QEMUVFIOState *s)
 {
     qemu_mutex_init(&s->lock);
     s->ram_notifier.ram_block_added = qemu_vfio_ram_block_added;
     s->ram_notifier.ram_block_removed = qemu_vfio_ram_block_removed;
-    ram_block_notifier_add(&s->ram_notifier);
     s->low_water_mark = QEMU_VFIO_IOVA_MIN;
     s->high_water_mark = QEMU_VFIO_IOVA_MAX;
-    qemu_ram_foreach_block(qemu_vfio_init_ramblock, s);
+    ram_block_notifier_add(&s->ram_notifier);
 }
 
 /**
-- 
2.30.2


