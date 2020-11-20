Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B992BB4FD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:17:12 +0100 (CET)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBuB-0000z3-Tt
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBbW-0000Rd-Vn
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBbP-0000AP-PO
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+qiriFl30O5ZK13M3dH3aBYCSEg2kw5TfbYjHT/iYc=;
 b=JCfmfHLNpjpVSyGVWncCnaULYi7398HU2t8nYjCVLQGMvD2vl/iW7Z2TxBk5rKuuhoij8u
 qltNX6iCSCPJMFpsrq6VhaxmTMziE7A9JuMj7Etndm1Z6t4uGjfK35EYEznMHxLvC5lfJy
 1CJl16f8WQubiUlwuUk3LCGRztrE5ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320--iW6dT1CPiib-6aLo2w7YA-1; Fri, 20 Nov 2020 13:57:42 -0500
X-MC-Unique: -iW6dT1CPiib-6aLo2w7YA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5C21084422;
 Fri, 20 Nov 2020 18:57:38 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDD7B5C1D5;
 Fri, 20 Nov 2020 18:57:23 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 26/27] vhost: Add vhost_hdev_can_sw_lm
Date: Fri, 20 Nov 2020 19:51:04 +0100
Message-Id: <20201120185105.279030-27-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows a device to migrate if it meet a few requirements.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index cf000b979f..44a51ccf5e 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1529,6 +1529,37 @@ static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
     event_notifier_cleanup(&vq->masked_notifier);
 }
 
+static bool vhost_hdev_can_sw_lm(struct vhost_dev *hdev)
+{
+    const char *cause = NULL;
+
+    if (hdev->features & (VIRTIO_F_IOMMU_PLATFORM)) {
+        cause = "have iommu";
+    } else if (hdev->features & VIRTIO_F_RING_PACKED) {
+        cause = "is packed";
+    } else if (hdev->features & VIRTIO_RING_F_EVENT_IDX) {
+        cause = "Have event idx";
+    } else if (hdev->features & VIRTIO_RING_F_INDIRECT_DESC) {
+        cause = "Supports indirect descriptors";
+    } else if (hdev->nvqs != 2) {
+        cause = "!= 2 #vq supported";
+    } else if (!hdev->vhost_ops->vhost_net_set_backend) {
+        cause = "cannot pause device";
+    }
+
+    if (cause) {
+        if (!hdev->migration_blocker) {
+            error_setg(&hdev->migration_blocker,
+                "Migration disabled: vhost lacks VHOST_F_LOG_ALL feature and %s.",
+                cause);
+        }
+
+        return false;
+    }
+
+    return true;
+}
+
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type, uint32_t busyloop_timeout)
 {
@@ -1604,7 +1635,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     };
 
     if (hdev->migration_blocker == NULL) {
-        if (!vhost_dev_can_log(hdev)) {
+        if (!vhost_dev_can_log(hdev) && !vhost_hdev_can_sw_lm(hdev)
+            && hdev->migration_blocker == NULL) {
             error_setg(&hdev->migration_blocker,
                        "Migration disabled: vhost lacks VHOST_F_LOG_ALL feature.");
         } else if (vhost_dev_log_is_shared(hdev) && !qemu_memfd_alloc_check()) {
-- 
2.18.4


