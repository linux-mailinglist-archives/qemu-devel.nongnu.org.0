Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F13B308EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:59:52 +0100 (CET)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5arv-0002m0-7X
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anN-0007B3-BK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5anE-0002jb-RO
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611953699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeNbSiH/MHVx9FqrvgesPLa7GE7RAy1abAUIrVRnGa4=;
 b=TcH+N9c1xKjKkJ1fKrvuGdrC44WnR6cVbvxPdvITzS9q/2nOcnevFqr1kGrJrKOeyvRFbF
 JfmDNWfaydGL6xPnr/7u3ORk0sEqCRWDvECCmcweabBhYRp2pUSYqlHjmztqqWxq202mDX
 UlA26R9JyhH8ODVnhci68w9NrEldbb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-zBUJaK8hO0ChJDjOXxtmdA-1; Fri, 29 Jan 2021 15:54:58 -0500
X-MC-Unique: zBUJaK8hO0ChJDjOXxtmdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD7BC18C89C4;
 Fri, 29 Jan 2021 20:54:56 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-115.ams2.redhat.com
 [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA6919D7C;
 Fri, 29 Jan 2021 20:54:53 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 05/10] vhost: Add vhost_dev_from_virtio
Date: Fri, 29 Jan 2021 21:54:10 +0100
Message-Id: <20210129205415.876290-6-eperezma@redhat.com>
In-Reply-To: <20210129205415.876290-1-eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  1 +
 hw/virtio/vhost.c         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415..fca076e3f0 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -123,6 +123,7 @@ uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
 void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
                         uint64_t features);
 bool vhost_has_free_slot(void);
+struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev);
 
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 28c7d78172..8683d507f5 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -61,6 +61,23 @@ bool vhost_has_free_slot(void)
     return slots_limit > used_memslots;
 }
 
+/*
+ * Get the vhost device associated to a VirtIO device.
+ */
+struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev)
+{
+    struct vhost_dev *hdev;
+
+    QLIST_FOREACH(hdev, &vhost_devices, entry) {
+        if (hdev->vdev == vdev) {
+            return hdev;
+        }
+    }
+
+    assert(hdev);
+    return NULL;
+}
+
 static void vhost_dev_sync_region(struct vhost_dev *dev,
                                   MemoryRegionSection *section,
                                   uint64_t mfirst, uint64_t mlast,
-- 
2.27.0


