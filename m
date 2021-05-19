Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A92389401
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:42:51 +0200 (CEST)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPHW-0005Nb-9s
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP65-0004L8-D4
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP63-0005eT-HT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jpVWSZqTF2zL6nviKEiZCIGpvvk/+5NdTzfZHJLDvZQ=;
 b=etorMLhgKOEQjiUe5n8dSpdkJVkm2t8Q42xO+HeCCWyqXnhoG8Am8L1VH5sEIK+xSSha6F
 d6s/Ku3Go6PRPo3cEbmTA0Vk6FJfOVR4WBAyDyCNP4iqkc5NypoPrsRyF9TAlc89T3faYl
 EoaxbTqR/tk+wst23qbIVYTuaCo99LE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-D8nMnuc4MFGOubFuMZ2Ljw-1; Wed, 19 May 2021 12:30:57 -0400
X-MC-Unique: D8nMnuc4MFGOubFuMZ2Ljw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4ED5100747E;
 Wed, 19 May 2021 16:30:55 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 624745D720;
 Wed, 19 May 2021 16:30:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 12/29] vhost: add vhost_kernel_vring_pause
Date: Wed, 19 May 2021 18:28:46 +0200
Message-Id: <20210519162903.1172366-13-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a commit to allow the testing with vhost-net, not intended
for the final version or any other device.

vhost_kernel_vring_pause stops the device, so qemu can ask for its status
(next available idx the device was going to consume) and to replace
vring addresses. When SVQ starts it can resume consuming the guest's
driver ring, without notice from the latter. Not stopping the device
before of the swapping could imply that it process more buffers than
reported, what would duplicate the device action.

Mimic vhost-vdpa behavior, vhost_kernel_start is intended to resume the
device. In the former it performs a full reset. Since this is a
temporary commit to allow testing with vhost-net, the latter just set a
new backend, that is enough for vhost-net to realize the new vring
addresses.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-backend.c | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 31b33bde37..9653b7fddb 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -201,6 +201,46 @@ static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
     return idx - dev->vq_index;
 }
 
+static int vhost_kernel_set_vq_pause(struct vhost_dev *dev, unsigned idx,
+                                     bool pause)
+{
+    struct vhost_vring_file file = {
+        .index = idx,
+    };
+
+    if (pause) {
+        file.fd = -1; /* Pass -1 to unbind from file. */
+    } else {
+        struct vhost_net *vn_dev = container_of(dev, struct vhost_net, dev);
+        file.fd = vn_dev->backend;
+    }
+
+    return vhost_kernel_net_set_backend(dev, &file);
+}
+
+static int vhost_kernel_vring_pause(struct vhost_dev *dev)
+{
+    int i;
+
+    for (i = 0; i < dev->nvqs; ++i) {
+        vhost_kernel_set_vq_pause(dev, i, true);
+    }
+
+    return 0;
+}
+
+static int vhost_kernel_start(struct vhost_dev *dev, bool start)
+{
+    int i;
+
+    assert(start);
+    for (i = 0; i < dev->nvqs; ++i) {
+        vhost_kernel_set_vq_pause(dev, i, false);
+    }
+
+    return 0;
+}
+
 #ifdef CONFIG_VHOST_VSOCK
 static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
                                             uint64_t guest_cid)
@@ -317,6 +357,8 @@ static const VhostOps kernel_ops = {
         .vhost_set_owner = vhost_kernel_set_owner,
         .vhost_reset_device = vhost_kernel_reset_device,
         .vhost_get_vq_index = vhost_kernel_get_vq_index,
+        .vhost_dev_start = vhost_kernel_start,
+        .vhost_vring_pause = vhost_kernel_vring_pause,
 #ifdef CONFIG_VHOST_VSOCK
         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
-- 
2.27.0


