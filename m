Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705933C71A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:52:10 +0100 (CET)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtG5-0007YL-6S
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDp-0005kY-IX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDo-0004AA-19
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXIH0j/rH7VLMaRzbXnWIbuRHR0Ubr2KYwFxlTMmxC8=;
 b=S+uFn7kfTx+A1aQatN4ixV72aUd2SDcRuan+BglH0qtQltbcBIl2UFn0IfRXMvE0kGNdRB
 2bCbmzsLRrr/0CNljkdQ4pH4xEqpSCsX+HHAV4DQ9VpuLGDckhMX4XeeOYUvU8mAahF/9n
 OQTKarWD+WdDjJnV8MZE3pFyc5TPz7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-fd_d76CYOUSCL_43q9nttA-1; Mon, 15 Mar 2021 15:49:45 -0400
X-MC-Unique: fd_d76CYOUSCL_43q9nttA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484298030B5;
 Mon, 15 Mar 2021 19:49:43 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA0D35C5E0;
 Mon, 15 Mar 2021 19:49:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 10/13] vhost: add vhost_kernel_set_vring_enable
Date: Mon, 15 Mar 2021 20:48:39 +0100
Message-Id: <20210315194842.277740-11-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This method is already present in vhost-user. This commit adapts it to
vhost-net, so SVQ can use.

vhost_kernel_set_enable stops the device, so qemu can ask for its status
(next available idx the device was going to consume). When SVQ starts it
can resume consuming the guest's driver ring, without notice from the
latter. Not stopping the device before of the swapping could imply that
it process more buffers than reported, what would duplicate the device
action.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-backend.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 31b33bde37..1ac5c574a9 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -201,6 +201,34 @@ static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
     return idx - dev->vq_index;
 }
 
+static int vhost_kernel_set_vq_enable(struct vhost_dev *dev, unsigned idx,
+                                      bool enable)
+{
+    struct vhost_vring_file file = {
+        .index = idx,
+    };
+
+    if (!enable) {
+        file.fd = -1; /* Pass -1 to unbind from file. */
+    } else {
+        struct vhost_net *vn_dev = container_of(dev, struct vhost_net, dev);
+        file.fd = vn_dev->backend;
+    }
+
+    return vhost_kernel_net_set_backend(dev, &file);
+}
+
+static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int enable)
+{
+    int i;
+
+    for (i = 0; i < dev->nvqs; ++i) {
+        vhost_kernel_set_vq_enable(dev, i, enable);
+    }
+
+    return 0;
+}
+
 #ifdef CONFIG_VHOST_VSOCK
 static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
                                             uint64_t guest_cid)
@@ -317,6 +345,7 @@ static const VhostOps kernel_ops = {
         .vhost_set_owner = vhost_kernel_set_owner,
         .vhost_reset_device = vhost_kernel_reset_device,
         .vhost_get_vq_index = vhost_kernel_get_vq_index,
+        .vhost_set_vring_enable = vhost_kernel_set_vring_enable,
 #ifdef CONFIG_VHOST_VSOCK
         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
-- 
2.27.0


