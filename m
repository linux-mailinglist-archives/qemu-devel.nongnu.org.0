Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF56115BA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:20:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooR8z-0003m7-7t; Fri, 28 Oct 2022 11:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooR8w-0003le-V2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooR8v-0003tk-Fj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666970373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3c0NH+cwMHbx78oOj/9GAlwf5kvmomFCCYkkshSQzk=;
 b=XCI8t0mBL6pWAltKZ9jNX3ymaCDyZpybJCL9jWilB49Fq5t1WAZjrChsherzyB79cygvRR
 EvNcT46PFvhDmzK62EVJ2LyUx099rwybB4zWssBUSB2IfkAjGZA0NVjQrBN/gG/Zp8a8NM
 PFV8sE6cWa8SA/yVUh/ouLjgGIhIH18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-l5PhqeLoOIO1q2c9nRT_4w-1; Fri, 28 Oct 2022 11:19:29 -0400
X-MC-Unique: l5PhqeLoOIO1q2c9nRT_4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91B2438145A3;
 Fri, 28 Oct 2022 15:19:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A06220290A5;
 Fri, 28 Oct 2022 15:19:26 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jason Wang <jasowang@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 2/3] virtio_net: Handle _F_STATUS emulation in
 virtio_net_get_config
Date: Fri, 28 Oct 2022 17:19:16 +0200
Message-Id: <20221028151917.260038-3-eperezma@redhat.com>
In-Reply-To: <20221028151917.260038-1-eperezma@redhat.com>
References: <20221028151917.260038-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At this moment this code path is not reached, but vdpa devices can offer
VIRTIO_NET_F_STATUS unconditionally. While the guest must assume that
link is always up by the standard, qemu will set the status bit to 1
always in this case.

This makes little use by itself, but VIRTIO_NET_F_STATUS is needed for
the guest to read status bit VIRTIO_NET_F_GUEST_ANNOUNCE, used by feature
VIRTIO_NET_F_GUEST_ANNOUNCE. So qemu must emulate status feature in case
it needs to emulate the guest announce feature.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 56ff219196..6d4d75615b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -156,8 +156,9 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
      * disconnect/reconnect a VDPA peer.
      */
     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
-        ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
-                                   n->config_size);
+        struct vhost_net *net = get_vhost_net(nc->peer);
+
+        ret = vhost_net_get_config(net, (uint8_t *)&netcfg, n->config_size);
         if (ret == -1) {
             return;
         }
@@ -173,6 +174,12 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
             memcpy(netcfg.mac, n->mac, ETH_ALEN);
         }
 
+        if (vdev->guest_features & BIT_ULL(VIRTIO_NET_F_STATUS) &&
+            !(net->dev.features & BIT_ULL(VIRTIO_NET_F_STATUS))) {
+            /* Emulating link up in qemu */
+            netcfg.status |= virtio_tswap16(vdev, VIRTIO_NET_S_LINK_UP);
+        }
+
         memcpy(config, &netcfg, n->config_size);
     }
 }
-- 
2.31.1


