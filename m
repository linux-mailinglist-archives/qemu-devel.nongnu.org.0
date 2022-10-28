Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0B6115BC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:20:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooR90-0003mU-RS; Fri, 28 Oct 2022 11:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooR8z-0003mM-HP
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooR8y-0003uL-77
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666970375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XFpQgy7hEPyzc0f/MlRMqPAoore8UmDwJSQHnHIKBk=;
 b=ZgPCStDpqxchEbhFiYSko/rh2ktvI7J9LmHwKztDYqb4ZFd7Q6o3V4LyZ9knNcFOx6xmjG
 GpZypZBxHbDEITG4cpwwrNDkZpAZ11yqvPuiOgdbDOjVDLCR4Jo8NunLiXvWejDQks4FLz
 LMGN513qnryZMWuhTXwBc5HdaQQ2Z7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-Qh_pUAB5PQy2_G7nDPWSWw-1; Fri, 28 Oct 2022 11:19:31 -0400
X-MC-Unique: Qh_pUAB5PQy2_G7nDPWSWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1128638145A0;
 Fri, 28 Oct 2022 15:19:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59622022EA2;
 Fri, 28 Oct 2022 15:19:28 +0000 (UTC)
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
Subject: [PATCH v2 3/3] vhost_vdpa: move VIRTIO_NET_F_STATUS handling to
 vhost_net
Date: Fri, 28 Oct 2022 17:19:17 +0200
Message-Id: <20221028151917.260038-4-eperezma@redhat.com>
In-Reply-To: <20221028151917.260038-1-eperezma@redhat.com>
References: <20221028151917.260038-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

Since it is emulated on all vhost backends it makes sense to move it.

Although this feature can be emulated by qemu it benefits from
information from the device. Ack it as long as the guest ack it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 13 +++++++++++++
 net/vhost-vdpa.c   |  1 -
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..b533744211 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -127,8 +127,21 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 
 void vhost_net_ack_features(struct vhost_net *net, uint64_t features)
 {
+    static const int status_feature_bit[] = {
+        VIRTIO_NET_F_STATUS,
+        VHOST_INVALID_FEATURE_BIT,
+    };
+
     net->dev.acked_features = net->dev.backend_features;
     vhost_ack_features(&net->dev, vhost_net_get_feature_bits(net), features);
+    if (net->dev.features & BIT_ULL(VIRTIO_NET_F_STATUS)) {
+        /*
+         * If device support _F_STATUS qemu should ack it so it reports link
+         * status changes. If not supported qemu emulates it reporting an
+         * always up link.
+         */
+        vhost_ack_features(&net->dev, status_feature_bit, features);
+    }
 }
 
 uint64_t vhost_net_get_max_queues(VHostNetState *net)
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6d64000202..854b27186c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -72,7 +72,6 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_HASH_REPORT,
     VIRTIO_NET_F_GUEST_ANNOUNCE,
-    VIRTIO_NET_F_STATUS,
     VHOST_INVALID_FEATURE_BIT
 };
 
-- 
2.31.1


