Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B637AA85
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:20:26 +0200 (CEST)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUBN-0007fX-7W
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU0m-0006sy-AH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU0h-0004Qc-1n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKegqhLV3OcKU5QCDTDzxpjYunHfCSmacovWBEXJYoY=;
 b=eBxeChL0tTuDBf10rzkgjhLTE8sxJck+rKod23Pg+0PlhKLl4DbudqMxieSYjmVsOG0Pxf
 VQUQngHbpFDwdteDT9TBoXn4/T/DGN35rKAF6FXpRtmdFgnMhvQ+ag+p5ou1QDW7q11Qg4
 V3aGY5EEm1Wq9KiEvidyhh+U0zgL1Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-5yU6jXF6NiCbCGcqzi4Wew-1; Tue, 11 May 2021 11:09:19 -0400
X-MC-Unique: 5yU6jXF6NiCbCGcqzi4Wew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26D81006C80;
 Tue, 11 May 2021 15:09:17 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A9626A97E;
 Tue, 11 May 2021 15:09:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 05/17] util: vfio-helpers: Factor out and fix processing of
 existing ram blocks
Date: Tue, 11 May 2021 16:08:30 +0100
Message-Id: <20210511150842.207155-6-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Factor it out into common code when a new notifier is registered, just
as done with the memory region notifier. This keeps logic about how to
process existing ram blocks at a central place.

Just like when adding a new ram block, we have to register the max_length.
Ram blocks are only "fake resized". All memory (max_length) is mapped.

Print the warning from inside qemu_vfio_ram_block_added().

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-2-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/numa.c            | 14 ++++++++++++++
 include/exec/cpu-common.h |  1 +
 softmmu/physmem.c         |  5 +++++
 util/vfio-helpers.c       | 29 ++++++++---------------------
 4 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index ac6bed5817..134ebc2b72 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -802,9 +802,23 @@ void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms)
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
index 5232696571..0a05533ed0 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1694,6 +1694,11 @@ ram_addr_t qemu_ram_get_used_length(RAMBlock *rb)
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
2.31.1


