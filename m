Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02866FCA72
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:45:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPWP-0004yr-Bb; Tue, 09 May 2023 11:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWN-0004xd-JO
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWL-0005OD-HT
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUER96h0HoYaiiFIFOwTTkdsyGnO2Up9vXF3ihxR/gM=;
 b=LXZovm0HvkU0rE65q7R1jUijGvSNg0KEyemUCqIzjvIujL9Db3Un9AkXlKLLVdSgvRAAGD
 V1Dp52k24pZJsZOxjW1LW1kD1ArG/ZAOuhCH15xpzqzy7pkVkSGEqsXEC5yw8+54pJ4+X6
 KXKrdFGXDHsZGAz32pbqWlLNJ2oLOfQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-oi9McflMOR6xwnx7hfWYKQ-1; Tue, 09 May 2023 11:44:55 -0400
X-MC-Unique: oi9McflMOR6xwnx7hfWYKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A28A229AA387;
 Tue,  9 May 2023 15:44:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03B1BC15BA0;
 Tue,  9 May 2023 15:44:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 longpeng2@huawei.com, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, alvaro.karsz@solid-run.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 si-wei.liu@oracle.com, Shannon Nelson <snelson@pensando.io>,
 Lei Yang <leiyang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v3 5/5] vdpa: move CVQ isolation check to net_init_vhost_vdpa
Date: Tue,  9 May 2023 17:44:35 +0200
Message-Id: <20230509154435.1410162-6-eperezma@redhat.com>
In-Reply-To: <20230509154435.1410162-1-eperezma@redhat.com>
References: <20230509154435.1410162-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Evaluating it at start time instead of initialization time may make the
guest capable of dynamically adding or removing migration blockers.

Also, moving to initialization reduces the number of ioctls in the
migration, reducing failure possibilities.

As a drawback we need to check for CVQ isolation twice: one time with no
MQ negotiated and another one acking it, as long as the device supports
it.  This is because Vring ASID / group management is based on vq
indexes, but we don't know the index of CVQ before negotiating MQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
v3: Only record cvq_isolated, true if the device have cvq isolated in
    both !MQ and MQ configurations.
---
 net/vhost-vdpa.c | 178 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 135 insertions(+), 43 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 3fb833fe76..29054b77a9 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -43,6 +43,10 @@ typedef struct VhostVDPAState {
 
     /* The device always have SVQ enabled */
     bool always_svq;
+
+    /* The device can isolate CVQ in its own ASID */
+    bool cvq_isolated;
+
     bool started;
 } VhostVDPAState;
 
@@ -362,15 +366,8 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
-/**
- * Get vring virtqueue group
- *
- * @device_fd  vdpa device fd
- * @vq_index   Virtqueue index
- *
- * Return -errno in case of error, or vq group if success.
- */
-static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
+static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index,
+                                          Error **errp)
 {
     struct vhost_vring_state state = {
         .index = vq_index,
@@ -379,8 +376,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
 
     if (unlikely(r < 0)) {
         r = -errno;
-        error_report("Cannot get VQ %u group: %s", vq_index,
-                     g_strerror(errno));
+        error_setg_errno(errp, errno, "Cannot get VQ %u group", vq_index);
         return r;
     }
 
@@ -480,9 +476,9 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
 {
     VhostVDPAState *s, *s0;
     struct vhost_vdpa *v;
-    uint64_t backend_features;
     int64_t cvq_group;
-    int cvq_index, r;
+    int r;
+    Error *err = NULL;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
@@ -502,41 +498,22 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     /*
      * If we early return in these cases SVQ will not be enabled. The migration
      * will be blocked as long as vhost-vdpa backends will not offer _F_LOG.
-     *
-     * Calling VHOST_GET_BACKEND_FEATURES as they are not available in v->dev
-     * yet.
      */
-    r = ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
-    if (unlikely(r < 0)) {
-        error_report("Cannot get vdpa backend_features: %s(%d)",
-            g_strerror(errno), errno);
-        return -1;
+    if (!vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
+        return 0;
     }
-    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
-        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
+
+    if (!s->cvq_isolated) {
         return 0;
     }
 
-    /*
-     * Check if all the virtqueues of the virtio device are in a different vq
-     * than the last vq. VQ group of last group passed in cvq_group.
-     */
-    cvq_index = v->dev->vq_index_end - 1;
-    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
+    cvq_group = vhost_vdpa_get_vring_group(v->device_fd,
+                                           v->dev->vq_index_end - 1,
+                                           &err);
     if (unlikely(cvq_group < 0)) {
+        error_report_err(err);
         return cvq_group;
     }
-    for (int i = 0; i < cvq_index; ++i) {
-        int64_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
-
-        if (unlikely(group < 0)) {
-            return group;
-        }
-
-        if (group == cvq_group) {
-            return 0;
-        }
-    }
 
     r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
     if (unlikely(r < 0)) {
@@ -799,6 +776,111 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
 };
 
+/**
+ * Probe the device to check control virtqueue is isolated.
+ *
+ * @device_fd vhost-vdpa file descriptor
+ * @features features to negotiate
+ * @cvq_index Control vq index
+ *
+ * Returns -1 in case of error, 0 if false and 1 if true
+ */
+static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
+                                      unsigned cvq_index, Error **errp)
+{
+    int64_t cvq_group;
+    int r;
+
+    r = vhost_vdpa_set_dev_features_fd(device_fd, features);
+    if (unlikely(r < 0)) {
+        error_setg_errno(errp, -r, "Cannot set device features");
+        return r;
+    }
+
+    cvq_group = vhost_vdpa_get_vring_group(device_fd, cvq_index, errp);
+    if (unlikely(cvq_group < 0)) {
+        return cvq_group;
+    }
+
+    for (int i = 0; i < cvq_index; ++i) {
+        int64_t group = vhost_vdpa_get_vring_group(device_fd, i, errp);
+
+        if (unlikely(group < 0)) {
+            return group;
+        }
+
+        if (group == (int64_t)cvq_group) {
+            return 0;
+        }
+    }
+
+    return 1;
+}
+
+/**
+ * Probe if CVQ is isolated when the device is MQ and when it is not MQ
+ *
+ * @device_fd         The vdpa device fd
+ * @features          Features offered by the device.
+ * @cvq_index         The control vq index if mq is negotiated. Ignored
+ *                    otherwise.
+ *
+ * Returns <0 in case of failure, 0 if false and 1 if true.
+ */
+static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
+                                          int cvq_index, Error **errp)
+{
+    uint64_t backend_features;
+    int r;
+
+    ERRP_GUARD();
+
+    r = ioctl(device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
+    if (unlikely(r < 0)) {
+        error_setg_errno(errp, errno, "Cannot get vdpa backend_features");
+        return r;
+    }
+
+    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
+        return 0;
+    }
+
+    r = vhost_vdpa_cvq_is_isolated(device_fd,
+                                   features & ~BIT_ULL(VIRTIO_NET_F_MQ), 2,
+                                   errp);
+    if (unlikely(r < 0)) {
+        if (r != -ENOTSUP) {
+            return r;
+        }
+
+        /*
+         * The kernel report VHOST_BACKEND_F_IOTLB_ASID if the vdpa frontend
+         * support ASID even if the parent driver does not.  The CVQ cannot be
+         * isolated in this case.
+         */
+        error_free(*errp);
+        *errp = NULL;
+        return 0;
+    }
+
+    if (r == 0) {
+        return 0;
+    }
+
+    vhost_vdpa_reset_status_fd(device_fd);
+    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
+        return 0;
+    }
+
+    r = vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2, errp);
+    if (unlikely(r < 0)) {
+        return r;
+    }
+
+    vhost_vdpa_reset_status_fd(device_fd);
+    return r;
+}
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        const char *device,
                                        const char *name,
@@ -808,16 +890,25 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        bool is_datapath,
                                        bool svq,
                                        struct vhost_vdpa_iova_range iova_range,
-                                       uint64_t features)
+                                       uint64_t features,
+                                       Error **errp)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
     int ret = 0;
     assert(name);
+    int cvq_isolated;
+
     if (is_datapath) {
         nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
                                  name);
     } else {
+        cvq_isolated = vhost_vdpa_probe_cvq_isolation(vdpa_device_fd, features,
+                                                      queue_pair_index, errp);
+        if (unlikely(cvq_isolated < 0)) {
+            return NULL;
+        }
+
         nc = qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, peer,
                                          device, name);
     }
@@ -844,6 +935,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
+        s->cvq_isolated = cvq_isolated;
 
         /*
          * TODO: We cannot migrate devices with CVQ as there is no way to set
@@ -972,7 +1064,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range, features);
+                                     iova_range, features, errp);
         if (!ncs[i])
             goto err;
     }
@@ -980,7 +1072,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range, features);
+                                 opts->x_svq, iova_range, features, errp);
         if (!nc)
             goto err;
     }
-- 
2.31.1


