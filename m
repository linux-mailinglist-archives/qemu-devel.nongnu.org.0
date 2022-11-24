Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50687637D5E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEWp-0002bd-Or; Thu, 24 Nov 2022 10:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyEWe-0002b1-LR
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyEWd-0004G6-4o
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669305150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhSLPDhzhFxcNenczXsbaDgqHh/5TPD4sy5gJvmX1zw=;
 b=A/bbnGKCJzjJ1Vk+vTlHQ7udDMyCVWoO8pTvZ+oZZNTtGaE7XFfSc6AojgJS9OFCsTahiM
 8PAcMaIDQ5OWh3bSjQAsgqgg4t3+sJeKt9fXPNLAM6d8Xw4+ylMzfNyrf7BHfLUkOQNXs9
 cPuRkH4cOpeDlAnZKut/pefGqugxfXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-EUNe_WFbMRmg49YabOmcBw-1; Thu, 24 Nov 2022 10:52:27 -0500
X-MC-Unique: EUNe_WFbMRmg49YabOmcBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86A9B811E75;
 Thu, 24 Nov 2022 15:52:26 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7706F111E3F8;
 Thu, 24 Nov 2022 15:52:23 +0000 (UTC)
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
Subject: [PATCH for 8.0 v8 06/12] vdpa: extract
 vhost_vdpa_svq_allocate_iova_tree
Date: Thu, 24 Nov 2022 16:51:52 +0100
Message-Id: <20221124155158.2109884-7-eperezma@redhat.com>
In-Reply-To: <20221124155158.2109884-1-eperezma@redhat.com>
References: <20221124155158.2109884-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

It can be allocated either if all virtqueues must be shadowed or if
vdpa-net detects it can shadow only cvq.

Extract in its own function so we can reuse it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 88e0eec5fa..9ee3bc4cd3 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -240,6 +240,22 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static int vhost_vdpa_get_iova_range(int fd,
+                                     struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    return ret < 0 ? -errno : 0;
+}
+
+static VhostIOVATree *vhost_vdpa_svq_allocate_iova_tree(int vdpa_device_fd)
+{
+    struct vhost_vdpa_iova_range iova_range;
+
+    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+    return vhost_iova_tree_new(iova_range.first, iova_range.last);
+}
+
 static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
 {
     VhostIOVATree *tree = v->iova_tree;
@@ -587,14 +603,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
-static int vhost_vdpa_get_iova_range(int fd,
-                                     struct vhost_vdpa_iova_range *iova_range)
-{
-    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
-
-    return ret < 0 ? -errno : 0;
-}
-
 static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
 {
     int ret = ioctl(fd, VHOST_GET_FEATURES, features);
@@ -690,14 +698,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     }
 
     if (opts->x_svq) {
-        struct vhost_vdpa_iova_range iova_range;
-
         if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
             goto err_svq;
         }
 
-        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
-        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+        iova_tree = vhost_vdpa_svq_allocate_iova_tree(vdpa_device_fd);
     }
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
-- 
2.31.1


