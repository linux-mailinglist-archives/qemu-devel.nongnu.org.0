Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD25413760
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:19:14 +0200 (CEST)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSiUD-00085K-Kw
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSiS6-00068h-Se
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSiS4-0001ep-UK
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632241020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58nd1G2ouMnpPDP2XdL90sjXgRBMGr6KzXCIy6hs2Os=;
 b=Mpw3OpvPTPN6iK9LFrv4zb1qXZQmk2o4+DGWDPbaUtlo4VkyR9wPKrG0tm+YPXXxAZAlr5
 jcTE810Z/UPqt36StdJvz7+MuA0lK6Syzi75w7f8ZL24qw4u1/GlUxgWadT5JbsjcQv+Qo
 IAm1E9fvoW1wTJujTDvj1VxZVpbATCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-6QexmSEDOfa6xKfAP5jeLA-1; Tue, 21 Sep 2021 12:16:57 -0400
X-MC-Unique: 6QexmSEDOfa6xKfAP5jeLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EA41922960;
 Tue, 21 Sep 2021 16:16:56 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF006D985;
 Tue, 21 Sep 2021 16:16:54 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] vhost-vsock: handle common features in
 vhost-vsock-common
Date: Tue, 21 Sep 2021 18:16:42 +0200
Message-Id: <20210921161642.206461-3-sgarzare@redhat.com>
In-Reply-To: <20210921161642.206461-1-sgarzare@redhat.com>
References: <20210921161642.206461-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jiang Wang <jiang.wang@bytedance.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-vsock features, like VIRTIO_VSOCK_F_SEQPACKET, can be handled
by vhost-vsock-common parent class. In this way, we can reuse the
same code for all virtio-vsock backends (i.e. vhost-vsock,
vhost-user-vsock).

Let's move `seqpacket` property to vhost-vsock-common class, add
vhost_vsock_common_get_features() used by children, and disable
`seqpacket` for vhost-user-vsock device for machine types < 6.2.

The behavior of vhost-vsock device doesn't change; vhost-user-vsock
device now supports `seqpacket` property.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/hw/virtio/vhost-vsock-common.h |  5 +++++
 include/hw/virtio/vhost-vsock.h        |  3 ---
 hw/core/machine.c                      |  4 +++-
 hw/virtio/vhost-user-vsock.c           |  4 +++-
 hw/virtio/vhost-vsock-common.c         | 31 ++++++++++++++++++++++++++
 hw/virtio/vhost-vsock.c                | 24 +-------------------
 6 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..d8b565b4da 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -35,6 +35,9 @@ struct VHostVSockCommon {
     VirtQueue *trans_vq;
 
     QEMUTimer *post_load_timer;
+
+    /* features */
+    OnOffAuto seqpacket;
 };
 
 int vhost_vsock_common_start(VirtIODevice *vdev);
@@ -43,5 +46,7 @@ int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
 void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
+uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
+                                         Error **errp);
 
 #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 3f121a624f..84f4e727c7 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -30,9 +30,6 @@ struct VHostVSock {
     VHostVSockCommon parent;
     VHostVSockConf conf;
 
-    /* features */
-    OnOffAuto seqpacket;
-
     /*< public >*/
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 7e2851feb9..28318b3436 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_1[] = {};
+GlobalProperty hw_compat_6_1[] = {
+    { "vhost-user-vsock-device", "seqpacket", "off" },
+};
 const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
 
 GlobalProperty hw_compat_6_0[] = {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 6095ed7349..52bd682c34 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -81,7 +81,9 @@ static uint64_t vuv_get_features(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    return vhost_get_features(&vvc->vhost_dev, user_feature_bits, features);
+    features = vhost_get_features(&vvc->vhost_dev, user_feature_bits, features);
+
+    return vhost_vsock_common_get_features(vdev, features, errp);
 }
 
 static const VMStateDescription vuv_vmstate = {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..3f3771274e 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -18,6 +18,30 @@
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
 
+const int feature_bits[] = {
+    VIRTIO_VSOCK_F_SEQPACKET,
+    VHOST_INVALID_FEATURE_BIT
+};
+
+uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
+                                         Error **errp)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+
+    if (vvc->seqpacket != ON_OFF_AUTO_OFF) {
+        virtio_add_feature(&features, VIRTIO_VSOCK_F_SEQPACKET);
+    }
+
+    features = vhost_get_features(&vvc->vhost_dev, feature_bits, features);
+
+    if (vvc->seqpacket == ON_OFF_AUTO_ON &&
+        !virtio_has_feature(features, VIRTIO_VSOCK_F_SEQPACKET)) {
+        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
+    }
+
+    return features;
+}
+
 int vhost_vsock_common_start(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
@@ -231,11 +255,18 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
     virtio_cleanup(vdev);
 }
 
+static Property vhost_vsock_common_properties[] = {
+    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSockCommon, seqpacket,
+                            ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, vhost_vsock_common_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index dade0da031..478c0c9a87 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -21,11 +21,6 @@
 #include "hw/virtio/vhost-vsock.h"
 #include "monitor/monitor.h"
 
-const int feature_bits[] = {
-    VIRTIO_VSOCK_F_SEQPACKET,
-    VHOST_INVALID_FEATURE_BIT
-};
-
 static void vhost_vsock_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostVSock *vsock = VHOST_VSOCK(vdev);
@@ -113,22 +108,7 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          uint64_t requested_features,
                                          Error **errp)
 {
-    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    VHostVSock *vsock = VHOST_VSOCK(vdev);
-
-    if (vsock->seqpacket != ON_OFF_AUTO_OFF) {
-        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
-    }
-
-    requested_features = vhost_get_features(&vvc->vhost_dev, feature_bits,
-                                            requested_features);
-
-    if (vsock->seqpacket == ON_OFF_AUTO_ON &&
-        !virtio_has_feature(requested_features, VIRTIO_VSOCK_F_SEQPACKET)) {
-        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
-    }
-
-    return requested_features;
+    return vhost_vsock_common_get_features(vdev, requested_features, errp);
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
@@ -229,8 +209,6 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
-    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSock, seqpacket,
-                            ON_OFF_AUTO_AUTO),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


