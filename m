Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA47402984
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:18:37 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNazk-0007Sc-Bc
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNaXw-00057C-I6
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNaXu-0000Pt-V0
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S6hVNLkzwsxtwh6pn3hakzFnQfmYbA6vhhaGemaWV9M=;
 b=PkD8HdAnjXfxpnRxcnclR1C7mfzFriiKRRoH6JcmD7Ygv1lxzCzWK39VyckoK/H3iBcGzr
 HnjX2VsopHTw8wVcCh7RGOhZIvX+lrm+BWL7CKc/jbwpLkbOI2QCKUhRk3VaCYwuWRBdE4
 UT/H7PFwGMW9bSaGlOGNKJ8mR4R8/P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-7rgOjjTwPLWHM1O8BxjTAA-1; Tue, 07 Sep 2021 08:49:45 -0400
X-MC-Unique: 7rgOjjTwPLWHM1O8BxjTAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E2D1FC82;
 Tue,  7 Sep 2021 12:49:44 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0C3A1B5C1;
 Tue,  7 Sep 2021 12:49:36 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-vsock: fix migration issue when seqpacket is supported
Date: Tue,  7 Sep 2021 14:49:35 +0200
Message-Id: <20210907124935.147164-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
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

Let's disable the feature bit for machine types < 6.1, adding a
`features` field to VHostVSock to simplify the handling of upcoming
features we will support.

Fixes: 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
Cc: qemu-stable@nongnu.org
Reported-by: Jiang Wang <jiang.wang@bytedance.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/hw/virtio/vhost-vsock.h | 1 +
 hw/core/machine.c               | 1 +
 hw/virtio/vhost-vsock.c         | 6 +++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..7da92a8883 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -29,6 +29,7 @@ struct VHostVSock {
     /*< private >*/
     VHostVSockCommon parent;
     VHostVSockConf conf;
+    uint64_t features;
 
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
index 1b1a5c70ed..9458d4eeb4 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -114,8 +114,10 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          Error **errp)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    VHostVSock *vsock = VHOST_VSOCK(vdev);
+
+    requested_features |= vsock->features;
 
-    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
     return vhost_get_features(&vvc->vhost_dev, feature_bits,
                                 requested_features);
 }
@@ -218,6 +220,8 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
+    DEFINE_PROP_BIT64("seqpacket", VHostVSock, features,
+                      VIRTIO_VSOCK_F_SEQPACKET, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


