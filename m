Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE5400D19
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:38:03 +0200 (CEST)
Received: from localhost ([::1]:34214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdMP-0006DO-O2
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKX-0003SC-LY
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKU-0000hO-PV
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cOPDJe6kQs7eQAFLJvd9ZjC5/cIbGay8VQyjGzL94Tc=;
 b=Jxa+IAN0ZQdq9NlSlr4GPtN2xM6V95Vnf3c0n+6BCjPm95iJZyyCvZ96gen9DuwXPwnH47
 7xIeS+WXMDCOPypTw4qPwK/4TqQRMh37yqxlKr9Yh84ieyaQXEHlDdk6335wgQl0I84+do
 prKFrUx/bgDZ0+AhV84HssfKW7E5j/I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-vTcFsIg2Od6oMKrd22CNyQ-1; Sat, 04 Sep 2021 17:36:00 -0400
X-MC-Unique: vTcFsIg2Od6oMKrd22CNyQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 u2-20020aa7d982000000b003cda80fa659so249728eds.14
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cOPDJe6kQs7eQAFLJvd9ZjC5/cIbGay8VQyjGzL94Tc=;
 b=e7ykGoIgUiVSEue+lX8VVgX3SP5VbJBwvxwpeaER/WXqsQ+ZXdkC1aEoLrYmiubQrP
 Bx8/D3/GYl0ijkkTMocM3bcOP5X8ZGWwQYLL13G/uasJrTTtzCpPJXVt7Fj/U0vXTK7c
 6q4ej4insJuvsE5jP22B1H4DA/kYnYpDFUgNZ8t4lVn8btVe66QvIvyLQAnttKTT5RJb
 Y1gnK+uNMLUNtOj9TwSRpFXMg8b3ikfsz82oJMkhep7x6vn8N6z7ANpu6vZhlbY7oOrh
 aaBaqtAU8VZdu/3/Ys8ocxief3f0H4z4SGnS69bhMTEi5cI4JUnRXug3UbZRVaRUUXyA
 fhDA==
X-Gm-Message-State: AOAM531xcazdCisrKwc3bMcv8YG9qFFA+/RY3dGk3jofkIKaHvWV1JB6
 mb9f4S0bZQ7kBVAkEvgmO+Ict9HZY3NpHn2/ekMnl9O0M7ymZhLKLBQvnPzKEgeWqxYKISxMP+x
 An3IFx+tiPjr/jNFZtcQNI/7ANTwfdCX29uIlWD04l36AOpD9YhMbZMMmslpp
X-Received: by 2002:a05:6402:b9c:: with SMTP id
 cf28mr5927117edb.356.1630791359184; 
 Sat, 04 Sep 2021 14:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySpfwBNyUCi2NOB9MMbgkATjbkqjygbrUgVM/kh5MwLAxauDhbCuLgORjr93b3rTE4FPnnGg==
X-Received: by 2002:a05:6402:b9c:: with SMTP id
 cf28mr5927100edb.356.1630791358984; 
 Sat, 04 Sep 2021 14:35:58 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id x11sm1886064edq.58.2021.09.04.14.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:35:58 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:35:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/35] vhost-vdpa: Do not send empty IOTLB update batches
Message-ID: <20210904213506.486886-2-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

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
Message-Id: <20210812140933.226288-1-eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 35 ++++++++++++++++++++++------------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9188226d8b..a8963da2d9 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -22,6 +22,7 @@ typedef struct VhostVDPAHostNotifier {
 typedef struct vhost_vdpa {
     int device_fd;
     uint32_t msg_type;
+    bool iotlb_batch_begin_sent;
     MemoryListener listener;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4fa414feea..ca1227e5dc 100644
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
MST


