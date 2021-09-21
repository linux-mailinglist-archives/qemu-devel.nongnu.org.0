Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD78413774
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:21:09 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSiW4-0002og-T3
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSiS4-00065r-35
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSiS1-0001at-Hg
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632241016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0v1V8vjODIjhOKtTsA9RMYuAbBBRoCUgAyHkSkM+rw=;
 b=h/FC2542Jf6P7Ghxha0ZvnUhNwSV+9JHtnidw/7e9lTuVtL39zv0O/8N0NwDC8QJtk72kt
 YwSaL7A37ODB4R/uMArc0H7pokzoOhQ3MTyi+qcnp52cwrLRFTexiz9QBSyFdbIh/DkKH/
 wsE/VNf26IY/yF21iTHu2mT62A0A52o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-GgK60z36O9WOd68I-oF3tw-1; Tue, 21 Sep 2021 12:16:55 -0400
X-MC-Unique: GgK60z36O9WOd68I-oF3tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D8CE1015DBD;
 Tue, 21 Sep 2021 16:16:54 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B6EC69FAD;
 Tue, 21 Sep 2021 16:16:50 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] vhost-vsock: fix migration issue when seqpacket is
 supported
Date: Tue, 21 Sep 2021 18:16:41 +0200
Message-Id: <20210921161642.206461-2-sgarzare@redhat.com>
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

Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
enabled the SEQPACKET feature bit.
This commit is released with QEMU 6.1, so if we try to migrate a VM where
the host kernel supports SEQPACKET but machine type version is less than
6.1, we get the following errors:

    Features 0x130000002 unsupported. Allowed features: 0x179000000
    Failed to load virtio-vhost_vsock:virtio
    error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
    load of migration failed: Operation not permitted

Let's disable the feature bit for machine types < 6.1.
We add a new OnOffAuto property for this, called `seqpacket`.
When it is `auto` (default), QEMU behaves as before, trying to enable the
feature, when it is `on` QEMU will fail if the backend (vhost-vsock
kernel module) doesn't support it.

Fixes: 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
Cc: qemu-stable@nongnu.org
Reported-by: Jiang Wang <jiang.wang@bytedance.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- used OnOffAuto `seqpacket` property instead of boolean `features` [stefanha]
---
 include/hw/virtio/vhost-vsock.h |  3 +++
 hw/core/machine.c               |  1 +
 hw/virtio/vhost-vsock.c         | 19 ++++++++++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..3f121a624f 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -30,6 +30,9 @@ struct VHostVSock {
     VHostVSockCommon parent;
     VHostVSockConf conf;
 
+    /* features */
+    OnOffAuto seqpacket;
+
     /*< public >*/
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528..7e2851feb9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -46,6 +46,7 @@ GlobalProperty hw_compat_6_0[] = {
     { "nvme-ns", "eui64-default", "off"},
     { "e1000", "init-vet", "off" },
     { "e1000e", "init-vet", "off" },
+    { "vhost-vsock-device", "seqpacket", "off" },
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 1b1a5c70ed..dade0da031 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -114,10 +114,21 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          Error **errp)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    VHostVSock *vsock = VHOST_VSOCK(vdev);
+
+    if (vsock->seqpacket != ON_OFF_AUTO_OFF) {
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    }
+
+    requested_features = vhost_get_features(&vvc->vhost_dev, feature_bits,
+                                            requested_features);
+
+    if (vsock->seqpacket == ON_OFF_AUTO_ON &&
+        !virtio_has_feature(requested_features, VIRTIO_VSOCK_F_SEQPACKET)) {
+        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
+    }
 
-    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
-    return vhost_get_features(&vvc->vhost_dev, feature_bits,
-                                requested_features);
+    return requested_features;
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
@@ -218,6 +229,8 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
+    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSock, seqpacket,
+                            ON_OFF_AUTO_AUTO),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


