Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8B496685
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:44:41 +0100 (CET)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0m0-0004gg-6R
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0aK-0007Ck-IN
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0aH-0003jO-LF
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSkdVsUBNlwf/1JjDqgiQAAL49ruuo1SfvHtdJq/Nn0=;
 b=XSHnh4iJ9ED2TiEsZHEztGiI5y47GM5yklQ8Ic4MuqneU5h7uUo70ZP92dkta2eRsHmpGo
 m6kSCwln+3uuU+mWd2H/T7t+bSOp5LZPV02xGUeJRCW3HiEgkPqxzNzaulf/Nyd8GUP9PZ
 cF2/G94GDbKr8jKljnr3dqQyGJjI9Pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-L-kd-eGqP9-33at7sgsmeQ-1; Fri, 21 Jan 2022 15:32:30 -0500
X-MC-Unique: L-kd-eGqP9-33at7sgsmeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A04C1018723;
 Fri, 21 Jan 2022 20:32:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0ADF194B9;
 Fri, 21 Jan 2022 20:32:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/31] vhost: Route host->guest notification through shadow
 virtqueue
Date: Fri, 21 Jan 2022 21:27:12 +0100
Message-Id: <20220121202733.404989-11-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make qemu aware of the device used buffers, allowing it to
write the guest memory with its contents if needed.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 15 +++++++++++++++
 hw/virtio/vhost-vdpa.c             | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 9c2cf07fd9..9619c8082c 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -58,6 +58,19 @@ static void vhost_handle_guest_kick(EventNotifier *n)
     event_notifier_set(&svq->hdev_kick);
 }
 
+/* Forward vhost notifications */
+static void vhost_svq_handle_call(EventNotifier *n)
+{
+    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
+                                             hdev_call);
+
+    if (unlikely(!event_notifier_test_and_clear(n))) {
+        return;
+    }
+
+    event_notifier_set(&svq->svq_call);
+}
+
 /**
  * Obtain the SVQ call notifier, where vhost device notifies SVQ that there
  * exists pending used buffers.
@@ -150,6 +163,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
     /* Placeholder descriptor, it should be deleted at set_kick_fd */
     event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
 
+    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     return g_steal_pointer(&svq);
 
 err_init_hdev_call:
@@ -165,6 +179,7 @@ err_init_hdev_kick:
 void vhost_svq_free(VhostShadowVirtqueue *vq)
 {
     event_notifier_cleanup(&vq->hdev_kick);
+    event_notifier_set_handler(&vq->hdev_call, NULL);
     event_notifier_cleanup(&vq->hdev_call);
     g_free(vq);
 }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 029f98feee..bdb45c8808 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -716,6 +716,9 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
  * @dev   The vhost device model
  * @svq   The shadow virtqueue
  * @idx   The index of the virtqueue in the vhost device
+ *
+ * Note that this function does not rewind kick file descriptor if cannot set
+ * call one.
  */
 static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
                                 VhostShadowVirtqueue *svq,
@@ -732,6 +735,14 @@ static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
     r = vhost_vdpa_set_vring_dev_kick(dev, &file);
     if (unlikely(r != 0)) {
         error_report("Can't set device kick fd (%d)", -r);
+        return false;
+    }
+
+    event_notifier = vhost_svq_get_svq_call_notifier(svq);
+    file.fd = event_notifier_get_fd(event_notifier);
+    r = vhost_vdpa_set_vring_dev_call(dev, &file);
+    if (unlikely(r != 0)) {
+        error_report("Can't set device call fd (%d)", -r);
     }
 
     return r == 0;
-- 
2.27.0


