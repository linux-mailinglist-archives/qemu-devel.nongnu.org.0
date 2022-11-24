Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E192637D4D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEWk-0002bC-Hq; Thu, 24 Nov 2022 10:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyEWd-0002Zb-F2
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyEWb-0004Fx-Op
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669305148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+qR/RbRnzTmnM7TqHoM4ncCb2+5woArLJeALcMnuIs=;
 b=IIiWumtQO68a0nfxWkaJvBdppHBT9QhcGBgqXFEbDNbOQA/+BfdO8TFreQ3OXfrIi0O+Rx
 YeS7DgPlE+9FbJdZ1uo05K2VKBE2WUHMso5mP+oRQnb6buF6rL7ErS6xKVpMVag1BZHieO
 U5Mz5u9dpULpOgeBBOcDmoDi+0lbUMI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-SCsHdSB7Nx-vINcTA543gw-1; Thu, 24 Nov 2022 10:52:23 -0500
X-MC-Unique: SCsHdSB7Nx-vINcTA543gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FFCB101A528;
 Thu, 24 Nov 2022 15:52:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12585111E3F8;
 Thu, 24 Nov 2022 15:52:19 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH for 8.0 v8 05/12] vdpa: add vhost_vdpa_net_valid_svq_features
Date: Thu, 24 Nov 2022 16:51:51 +0100
Message-Id: <20221124155158.2109884-6-eperezma@redhat.com>
In-Reply-To: <20221124155158.2109884-1-eperezma@redhat.com>
References: <20221124155158.2109884-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It will be reused at vdpa device start so let's extract in its own
function.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2b4b85d8f8..88e0eec5fa 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -107,6 +107,22 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
     return s->vhost_net;
 }
 
+static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
+{
+    uint64_t invalid_dev_features =
+        features & ~vdpa_svq_device_features &
+        /* Transport are all accepted at this point */
+        ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                         VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+    if (invalid_dev_features) {
+        error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
+                   invalid_dev_features);
+    }
+
+    return !invalid_dev_features;
+}
+
 static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
 {
     uint32_t device_id;
@@ -676,15 +692,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (opts->x_svq) {
         struct vhost_vdpa_iova_range iova_range;
 
-        uint64_t invalid_dev_features =
-            features & ~vdpa_svq_device_features &
-            /* Transport are all accepted at this point */
-            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
-                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
-
-        if (invalid_dev_features) {
-            error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
-                       invalid_dev_features);
+        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
             goto err_svq;
         }
 
-- 
2.31.1


