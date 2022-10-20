Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F37605E7F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:12:29 +0200 (CEST)
Received: from localhost ([::1]:52946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTTO-00021P-Ni
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:12:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTGn-0001HX-6C
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSsx-00049y-Ox
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSsw-0001Iu-9Q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666262085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dM50qZSz5YOn5XfKOojvSPIRNzO1U+fgcdQDCEx+Zu4=;
 b=E3v7ev38/fBuW+PuJa8J0dVOxIPoJMRslQCPqr/6MYyVbcg9SilfCV9v6g2h/L26gNQsEP
 zWlOu4IT5SZXddy0HDDcQhiuFNjWzmQszYbQurjT9ibswOhdspcvtk6f711HDA5FLGmdCw
 kKacXagf4L3yV7QtpPDpW8xno/z62oM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-00jURQmHNBSU5UVyrRPyXg-1; Thu, 20 Oct 2022 06:34:42 -0400
X-MC-Unique: 00jURQmHNBSU5UVyrRPyXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD166811E84;
 Thu, 20 Oct 2022 10:34:41 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1EA6C15BA5;
 Thu, 20 Oct 2022 10:34:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 3/7] virtio_net: Handle _F_STATUS emulation in
 virtio_net_get_config
Date: Thu, 20 Oct 2022 12:34:25 +0200
Message-Id: <20221020103429.347525-4-eperezma@redhat.com>
In-Reply-To: <20221020103429.347525-1-eperezma@redhat.com>
References: <20221020103429.347525-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this moment this code path is not reached, but vdpa devices can offer
VIRTIO_NET_F_STATUS unconditionally. While the guest must assume that
link is always up by the standard, qemu will set the status bit to 1
always in this case.

This makes little use by itself, but VIRTIO_NET_F_STATUS is needed for
the guest to read status bit VIRTIO_NET_F_GUEST_ANNOUNCE, used by feature
VIRTIO_NET_F_GUEST_ANNOUNCE. So qemu must emulate status feature in case
it needs to emulate the guest announce feature.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 56ff219196..51fe6d5c1a 100644
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
+            netcfg.status |= VIRTIO_NET_S_LINK_UP;
+        }
+
         memcpy(config, &netcfg, n->config_size);
     }
 }
-- 
2.31.1


