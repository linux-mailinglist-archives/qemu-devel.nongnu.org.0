Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D56B3EA63E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 16:10:56 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEBQ6-0008DA-Hy
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 10:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mEBPA-0007Yt-Ip
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mEBP7-0005ZV-5z
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628777391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UW+OQJtrA24PptZq9wMviUodh52mL0/1urrh9rqF2FQ=;
 b=DNWdpHsIJFwjotS003yU82cGYUor83uLQsyqrX+0j/3P3hRafbduBYrp57U+fzlfnS43dC
 Cr9ilRgVhpqtJSO3+bH+LVITsEhFeGsce2s8bTi95X2qKfJACHJPpqe8hS0magnG5VmpS6
 hieBSeUvZ5hJG4Wb/U0A717tvo+dhWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Gt51cXfLMNOHMK__g7ujeA-1; Thu, 12 Aug 2021 10:09:48 -0400
X-MC-Unique: Gt51cXfLMNOHMK__g7ujeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED98190A7C1;
 Thu, 12 Aug 2021 14:09:47 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12E6960C04;
 Thu, 12 Aug 2021 14:09:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] vhost-vdpa: Do not send empty IOTLB update batches
Date: Thu, 12 Aug 2021 16:09:33 +0200
Message-Id: <20210812140933.226288-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eli Cohen <elic@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the introduction of the batch hinting, meaningless batches can be
created with no IOTLB updates if the memory region was skipped by
vhost_vdpa_listener_skipped_section. This is the case of host notifiers
memory regions, device un/realize, and others. This causes the vdpa
device to receive dma mapping settings with no changes, a possibly
expensive operation for nothing.

To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
meaningful (not skipped section) mapping or unmapping operation, and
VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
_INVALIDATE has been issued.

v3:
  * Use a bool instead of a counter avoiding potential number wrapping
  * Fix bad check on _commit
  * Move VHOST_BACKEND_F_IOTLB_BATCH check to
    vhost_vdpa_iotlb_batch_begin_once

v2 (from RFC):
  * Rename misleading name
  * Abstract start batching function for listener_add/del

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 35 ++++++++++++++++++++++------------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index e98e327f12..6b9288fef8 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
     int device_fd;
     int index;
     uint32_t msg_type;
+    bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 6ce94a1f4d..93b7db61d1 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
     return ret;
 }
 
-static void vhost_vdpa_listener_begin(MemoryListener *listener)
+static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
 {
-    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
-    struct vhost_dev *dev = v->dev;
-    struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
-
-    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
-        return;
-    }
-
-    msg.type = v->msg_type;
-    msg.iotlb.type = VHOST_IOTLB_BATCH_BEGIN;
+    struct vhost_msg_v2 msg = {
+        .type = v->msg_type,
+        .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
+    };
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
@@ -109,6 +103,16 @@ static void vhost_vdpa_listener_begin(MemoryListener *listener)
     }
 }
 
+static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
+{
+    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH) &&
+        !v->iotlb_batch_begin_sent) {
+        vhost_vdpa_listener_begin_batch(v);
+    }
+
+    v->iotlb_batch_begin_sent = true;
+}
+
 static void vhost_vdpa_listener_commit(MemoryListener *listener)
 {
     struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
@@ -120,6 +124,10 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
         return;
     }
 
+    if (!v->iotlb_batch_begin_sent) {
+        return;
+    }
+
     msg.type = v->msg_type;
     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
 
@@ -127,6 +135,8 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
     }
+
+    v->iotlb_batch_begin_sent = false;
 }
 
 static void vhost_vdpa_listener_region_add(MemoryListener *listener,
@@ -170,6 +180,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
 
+    vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
                              vaddr, section->readonly);
     if (ret) {
@@ -221,6 +232,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
 
     llsize = int128_sub(llend, int128_make64(iova));
 
+    vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
     if (ret) {
         error_report("vhost_vdpa dma unmap error!");
@@ -234,7 +246,6 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
  * depends on the addnop().
  */
 static const MemoryListener vhost_vdpa_memory_listener = {
-    .begin = vhost_vdpa_listener_begin,
     .commit = vhost_vdpa_listener_commit,
     .region_add = vhost_vdpa_listener_region_add,
     .region_del = vhost_vdpa_listener_region_del,
-- 
2.27.0


