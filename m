Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D697E4FC08F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:24:37 +0200 (CEST)
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvu8-0008Gp-K4
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvOC-0006rZ-Rn
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ndvO9-0007rd-Hq
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649688692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSNmlTlHwOXjPRivKwmySsoLJZ6FYEIksDk0qAJFNLI=;
 b=Ac8lla1iJp2MCjIbs1s6c1dBxKifAEP5iLJ+o2zQkHLR3Lkbili1pHu0xmXUEuj9pZ/h2n
 5If0T3aq5HuioSg0xcdCtKpB/6aHP4lUYlp8jGSISNMdyjl7QcFWimrlHbOy538QP6l3Cr
 nN97hBRU0keGcrZaG357jItnPAoFT0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-cAYySkgcMkCVR10SKjulQA-1; Mon, 11 Apr 2022 10:51:28 -0400
X-MC-Unique: cAYySkgcMkCVR10SKjulQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FC1A803524;
 Mon, 11 Apr 2022 14:51:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A48954ACAF;
 Mon, 11 Apr 2022 14:51:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 21/23] vhost: Make possible to check for device
 exclusive vq group
Date: Mon, 11 Apr 2022 16:50:24 +0200
Message-Id: <20220411145026.1618035-22-eperezma@redhat.com>
In-Reply-To: <20220411145026.1618035-1-eperezma@redhat.com>
References: <20220411145026.1618035-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CVQ needs to be in its own group, not shared with any data vq. Enable
the checking of it here, before introducing address space id concepts.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  2 +
 hw/net/vhost_net.c        |  4 +-
 hw/virtio/vhost-vdpa.c    | 79 ++++++++++++++++++++++++++++++++++++++-
 hw/virtio/trace-events    |  1 +
 4 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7b7a..034868fa9e 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -78,6 +78,8 @@ struct vhost_dev {
     int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    /* Must be a vq group different than any other vhost dev */
+    bool independent_vq_group;
     uint64_t features;
     uint64_t acked_features;
     uint64_t backend_features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 44a105ec29..10480e19e5 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -343,14 +343,16 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     }
 
     for (i = 0; i < nvhosts; i++) {
+        bool cvq_idx = i >= data_queue_pairs;
 
-        if (i < data_queue_pairs) {
+        if (!cvq_idx) {
             peer = qemu_get_peer(ncs, i);
         } else { /* Control Virtqueue */
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
 
         net = get_vhost_net(peer);
+        net->dev.independent_vq_group = !!cvq_idx;
         vhost_net_set_vq_index(net, i * 2, index_end);
 
         /* Suppress the masking guest notifiers on vhost user
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index d09e06d212..dfff94d46f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -677,7 +677,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
@@ -1097,6 +1098,78 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
     return true;
 }
 
+static int vhost_vdpa_get_vring_group(struct vhost_dev *dev,
+                                      struct vhost_vring_state *state)
+{
+    int ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_GROUP, state);
+    trace_vhost_vdpa_get_vring_group(dev, state->index, state->num);
+    return ret;
+}
+
+static bool vhost_dev_is_independent_group(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    struct vhost_vring_state this_vq_group = {
+        .index = dev->vq_index,
+    };
+    int ret;
+
+    if (!(dev->backend_cap & VHOST_BACKEND_F_IOTLB_ASID)) {
+        return true;
+    }
+
+    if (!v->shadow_vqs_enabled) {
+        return true;
+    }
+
+    ret = vhost_vdpa_get_vring_group(dev, &this_vq_group);
+    if (unlikely(ret)) {
+        goto call_err;
+    }
+
+    for (int i = 1; i < dev->nvqs; ++i) {
+        struct vhost_vring_state vq_group = {
+            .index = dev->vq_index + i,
+        };
+
+        ret = vhost_vdpa_get_vring_group(dev, &vq_group);
+        if (unlikely(ret)) {
+            goto call_err;
+        }
+        if (unlikely(vq_group.num != this_vq_group.num)) {
+            error_report("VQ %d group is different than VQ %d one",
+                         this_vq_group.index, vq_group.index);
+            return false;
+        }
+    }
+
+    for (int i = 0; i < dev->vq_index_end; ++i) {
+        struct vhost_vring_state vq_group = {
+            .index = i,
+        };
+
+        if (dev->vq_index <= i && i < dev->vq_index + dev->nvqs) {
+            continue;
+        }
+
+        ret = vhost_vdpa_get_vring_group(dev, &vq_group);
+        if (unlikely(ret)) {
+            goto call_err;
+        }
+        if (unlikely(vq_group.num == this_vq_group.num)) {
+            error_report("VQ %d group is the same as VQ %d one",
+                         this_vq_group.index, vq_group.index);
+            return false;
+        }
+    }
+
+    return true;
+
+call_err:
+    error_report("Can't read vq group, errno=%d (%s)", ret, g_strerror(-ret));
+    return false;
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -1105,6 +1178,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 
     if (started) {
         vhost_vdpa_host_notifiers_init(dev);
+        if (dev->independent_vq_group &&
+            !vhost_dev_is_independent_group(dev)) {
+            return -1;
+        }
         ok = vhost_vdpa_svqs_start(dev);
         if (unlikely(!ok)) {
             return -1;
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 333348d9d5..e6fdc03514 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -43,6 +43,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
 vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
 vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
 vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
+vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
 vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
 vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
 vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
-- 
2.27.0


