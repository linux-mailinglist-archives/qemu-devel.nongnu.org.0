Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924323AA15D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:32:39 +0200 (CEST)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYT0-00046w-M5
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYQu-00023n-F6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:30:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYQr-0007Fc-W7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623861025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xrmG1HrC49Xsw2bKc5rtD1Gkuqb3l6Hoh0HmzH5/zYs=;
 b=R/cBMx0gdyWqfQtcCTWQXJPW40em7Zj9RFqqOPFFRHURHJ+3jZdmcemcgHz4Wpjw0VOimu
 4y4CaWBy6iPwG169z1fwl0g38n+E4lGuOK9FiEv8HVP4LVtxf3PiTALTSWvy60VadtdAhe
 y0DOnV+iY4dzqykDzIG+C3pjoyESIeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-5hm5nw4UPm2zhseljGHsYg-1; Wed, 16 Jun 2021 12:30:21 -0400
X-MC-Unique: 5hm5nw4UPm2zhseljGHsYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC0379EE4;
 Wed, 16 Jun 2021 16:30:20 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24E8860C54;
 Wed, 16 Jun 2021 16:30:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/6] virtio-mem: Implement replay_discarded
 RamDiscardManager callback
Date: Wed, 16 Jun 2021 18:29:36 +0200
Message-Id: <20210616162940.28630-3-david@redhat.com>
In-Reply-To: <20210616162940.28630-1-david@redhat.com>
References: <20210616162940.28630-1-david@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement it similar to the replay_populated callback.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index df91e454b2..284096ec5f 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -228,6 +228,38 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
     return ret;
 }
 
+static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
+                                                 MemoryRegionSection *s,
+                                                 void *arg,
+                                                 virtio_mem_section_cb cb)
+{
+    unsigned long first_bit, last_bit;
+    uint64_t offset, size;
+    int ret = 0;
+
+    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
+    while (first_bit < vmem->bitmap_size) {
+        MemoryRegionSection tmp = *s;
+
+        offset = first_bit * vmem->block_size;
+        last_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
+                                 first_bit + 1) - 1;
+        size = (last_bit - first_bit + 1) * vmem->block_size;
+
+        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            break;
+        }
+        ret = cb(&tmp, arg);
+        if (ret) {
+            break;
+        }
+        first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
+                                       last_bit + 2);
+    }
+    return ret;
+}
+
 static int virtio_mem_notify_populate_cb(MemoryRegionSection *s, void *arg)
 {
     RamDiscardListener *rdl = arg;
@@ -1170,6 +1202,31 @@ static int virtio_mem_rdm_replay_populated(const RamDiscardManager *rdm,
                                             virtio_mem_rdm_replay_populated_cb);
 }
 
+static int virtio_mem_rdm_replay_discarded_cb(MemoryRegionSection *s,
+                                              void *arg)
+{
+    struct VirtIOMEMReplayData *data = arg;
+
+    ((ReplayRamDiscard)data->fn)(s, data->opaque);
+    return 0;
+}
+
+static void virtio_mem_rdm_replay_discarded(const RamDiscardManager *rdm,
+                                            MemoryRegionSection *s,
+                                            ReplayRamDiscard replay_fn,
+                                            void *opaque)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    struct VirtIOMEMReplayData data = {
+        .fn = replay_fn,
+        .opaque = opaque,
+    };
+
+    g_assert(s->mr == &vmem->memdev->mr);
+    virtio_mem_for_each_unplugged_section(vmem, s, &data,
+                                          virtio_mem_rdm_replay_discarded_cb);
+}
+
 static void virtio_mem_rdm_register_listener(RamDiscardManager *rdm,
                                              RamDiscardListener *rdl,
                                              MemoryRegionSection *s)
@@ -1234,6 +1291,7 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     rdmc->get_min_granularity = virtio_mem_rdm_get_min_granularity;
     rdmc->is_populated = virtio_mem_rdm_is_populated;
     rdmc->replay_populated = virtio_mem_rdm_replay_populated;
+    rdmc->replay_discarded = virtio_mem_rdm_replay_discarded;
     rdmc->register_listener = virtio_mem_rdm_register_listener;
     rdmc->unregister_listener = virtio_mem_rdm_unregister_listener;
 }
-- 
2.31.1


