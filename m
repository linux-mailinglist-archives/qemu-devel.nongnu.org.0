Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CF60DE73
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:55:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ond6v-000505-Gg; Wed, 26 Oct 2022 05:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ond6W-0003uW-LR
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ond6V-0001lf-11
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666778022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKc8QhW0a44IXrmCQDktTysNmCO3rhAoscJ2ndiXmSE=;
 b=ZtF7IbZqkKCLcK+XMkuwsJnf61XGp/TKeJ8dkNf7JEaB0DDTXf4RrjezUM3Nz+L7WmeoUf
 qeirhASLiJMBu5vQAHZVgIebxIwUbZjuCTUYkedLZOUTnb3wI5dKmoFOgl6Du9HpJJNezS
 xRlfl4xjJYnkZkiOFE5EG+EdnBPRfd8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-a5Ez1-zAOD6TLJ4kny3LQw-1; Wed, 26 Oct 2022 05:53:37 -0400
X-MC-Unique: a5Ez1-zAOD6TLJ4kny3LQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057663C0F237;
 Wed, 26 Oct 2022 09:53:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E48F492B1E;
 Wed, 26 Oct 2022 09:53:29 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH 3/3] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
Date: Wed, 26 Oct 2022 11:53:03 +0200
Message-Id: <20221026095303.37907-4-eperezma@redhat.com>
In-Reply-To: <20221026095303.37907-1-eperezma@redhat.com>
References: <20221026095303.37907-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

Now that qemu can handle and emulate it if the vdpa backend does not
support it we can offer it always.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/net/vhost-vdpa.h |  1 +
 hw/net/vhost_net.c       | 16 ++++++++++++++--
 net/vhost-vdpa.c         |  3 +++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
index b81f9a6f2a..cfbcce6427 100644
--- a/include/net/vhost-vdpa.h
+++ b/include/net/vhost-vdpa.h
@@ -17,5 +17,6 @@
 struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
 
 extern const int vdpa_feature_bits[];
+extern const uint64_t vhost_vdpa_net_added_feature_bits;
 
 #endif /* VHOST_VDPA_H */
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..7c15cc6e8f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_bits(struct vhost_net *net)
     return feature_bits;
 }
 
+static uint64_t vhost_net_add_feature_bits(struct vhost_net *net)
+{
+    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        return vhost_vdpa_net_added_feature_bits;
+    }
+
+    return 0;
+}
+
 uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t features)
 {
-    return vhost_get_features(&net->dev, vhost_net_get_feature_bits(net),
-            features);
+    uint64_t ret = vhost_get_features(&net->dev,
+                                      vhost_net_get_feature_bits(net),
+                                      features);
+
+    return ret | vhost_net_add_feature_bits(net);
 }
 int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
                          uint32_t config_len)
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6d64000202..24d2857593 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
+const uint64_t vhost_vdpa_net_added_feature_bits =
+    BIT_ULL(VIRTIO_NET_F_STATUS);
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-- 
2.31.1


