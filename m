Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C534DCDA1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:36:12 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUuyq-0006QX-0q
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:36:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUuna-0000Zq-Qm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUunV-00066b-G7
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cp+pLK6qQUIS+VZf9K6pYU4iR+sCDEsaxpbkxBhnqMI=;
 b=ZuefRa1GYl3NSejr8EF9fRVRHATHK4dJ35caRCLU2UDG3hOTGMbBfZAwPgmj60vOL70m4X
 SpywFbQcO8DXsSRRV2kIjXmaD/rFgNUePEBl9RBKLyUbuhiZYjeNNmG2KMjFfzsTobizPk
 zADILF8V2T0MS5r+Srff9u324758tLY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-yBtKaxpeO_G6c4oePJhfUQ-1; Thu, 17 Mar 2022 14:24:27 -0400
X-MC-Unique: yBtKaxpeO_G6c4oePJhfUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2378329AB3EE;
 Thu, 17 Mar 2022 18:24:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4E6E1454539;
 Thu, 17 Mar 2022 18:24:24 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/18] vdpa: Extract get geatures part from
 vhost_vdpa_get_max_queue_pairs
Date: Thu, 17 Mar 2022 19:23:47 +0100
Message-Id: <20220317182400.651508-7-eperezma@redhat.com>
In-Reply-To: <20220317182400.651508-1-eperezma@redhat.com>
References: <20220317182400.651508-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To know the device features is also needed for CVQ SVQ. Extract from
vhost_vdpa_get_max_queue_pairs so we can reuse it.

Report errno in case of failure getting them while we're at it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index def738998b..290aa01e13 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -235,20 +235,24 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
-static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
+static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
+{
+    int ret = ioctl(fd, VHOST_GET_FEATURES, features);
+    if (ret) {
+        error_setg_errno(errp, errno,
+                         "Fail to query features from vhost-vDPA device");
+    }
+    return ret;
+}
+
+static int vhost_vdpa_get_max_queue_pairs(int fd, uint64_t features,
+                                          int *has_cvq, Error **errp)
 {
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
     g_autofree struct vhost_vdpa_config *config = NULL;
     __virtio16 *max_queue_pairs;
-    uint64_t features;
     int ret;
 
-    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
-    if (ret) {
-        error_setg(errp, "Fail to query features from vhost-vDPA device");
-        return ret;
-    }
-
     if (features & (1 << VIRTIO_NET_F_CTRL_VQ)) {
         *has_cvq = 1;
     } else {
@@ -278,10 +282,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
-    int queue_pairs, i, has_cvq = 0;
+    int queue_pairs, r, i, has_cvq = 0;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
@@ -296,7 +301,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
+    r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
+    if (r) {
+        return r;
+    }
+
+    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
                                                  &has_cvq, errp);
     if (queue_pairs < 0) {
         qemu_close(vdpa_device_fd);
-- 
2.27.0


