Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8516BEBF5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBVD-0000T4-3J; Fri, 17 Mar 2023 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBV9-0000Ri-6I
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBV6-0007LY-Ut
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679064971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFHn4XW+UavDoe4jloqdSWbaWn9IBPuMyjVQ0mDdSGY=;
 b=BbTJXrWpqTAzWYcjg4neP3+ojfJORZ/o+4jhGWsAb54S9HW5p+T7FQH38CMPZQhwxG8MTk
 8VsZm1tJBW45ernxgf7/2wEAqskZ+XpHuScJN0DdYAGy374Xy6Bzzwq60J7X/b7feHnAt9
 3nF5LDNmNBZo4sSST5tjnk8V4L/OS+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-5s2Ejd16N7uZaMNsR_nWHw-1; Fri, 17 Mar 2023 10:56:05 -0400
X-MC-Unique: 5s2Ejd16N7uZaMNsR_nWHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5F080A209;
 Fri, 17 Mar 2023 14:56:03 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B8D243FBE;
 Fri, 17 Mar 2023 14:56:01 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: alvaro.karsz@solid-run.com, Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, Stefano Garzarella <sgarzare@redhat.com>,
 longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: [RFC PATCH for 8.1 6/6] vdpa: Cache cvq group in VhostVDPAState
Date: Fri, 17 Mar 2023 15:55:42 +0100
Message-Id: <20230317145542.347368-7-eperezma@redhat.com>
In-Reply-To: <20230317145542.347368-1-eperezma@redhat.com>
References: <20230317145542.347368-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Continue the move of code that interacts with the device from control
virtqueue start to control virtqueue init.

As with previous patches, it reduces the number of ioctls in the
migration, reducing failure possibilities.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 818a24fb0e..fe0ec62060 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -41,6 +41,12 @@ typedef struct VhostVDPAState {
     void *cvq_cmd_out_buffer;
     virtio_net_ctrl_ack *status;
 
+    /* CVQ group if cvq_isolated_mq */
+    uint32_t cvq_group_mq;
+
+    /* CVQ group if cvq_isolated */
+    uint32_t cvq_group;
+
     /* The device always have SVQ enabled */
     bool always_svq;
 
@@ -480,7 +486,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     struct vhost_vdpa *v;
     int64_t cvq_group;
     int r;
-    Error *err = NULL;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
@@ -509,18 +514,14 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
         if (!s->cvq_isolated_mq) {
             return 0;
         }
+
+        cvq_group = s->cvq_group_mq;
     } else {
         if (!s->cvq_isolated) {
             return 0;
         }
-    }
 
-    cvq_group = vhost_vdpa_get_vring_group(v->device_fd,
-                                           v->dev->vq_index_end - 1,
-                                           &err);
-    if (unlikely(cvq_group < 0)) {
-        error_report_err(err);
-        return cvq_group;
+        cvq_group = s->cvq_group;
     }
 
     r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
@@ -790,11 +791,13 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
  * @device_fd vhost-vdpa file descriptor
  * @features features to negotiate
  * @cvq_index Control vq index
+ * @pcvq_group: Returns CVQ group if cvq is isolated.
  *
  * Returns -1 in case of error, 0 if false and 1 if true
  */
 static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
-                                      unsigned cvq_index, Error **errp)
+                                      unsigned cvq_index, uint32_t *pcvq_group,
+                                      Error **errp)
 {
     int64_t cvq_group;
     int r;
@@ -812,6 +815,7 @@ static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
         goto out;
     }
 
+    *pcvq_group = (uint32_t)cvq_group;
     for (int i = 0; i < cvq_index; ++i) {
         int64_t group = vhost_vdpa_get_vring_group(device_fd, i, errp);
 
@@ -844,12 +848,15 @@ out:
  *                    negotiated.
  * @cvq_isolated_mq   It'll be set to true if cvq is isolated if mq is
  *                    negotiated.
+ * @cvq_group         CVQ group if MQ is not negotiated.
+ * @cvq_group_mq      CVQ group if MQ is negotiated.
  *
  * Returns -1 in case of failure
  */
 static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
                                           int cvq_index, bool *cvq_isolated,
-                                          bool *cvq_isolated_mq, Error **errp)
+                                          bool *cvq_isolated_mq, uint32_t *cvq_group,
+                                          uint32_t *cvq_group_mq, Error **errp)
 {
     uint64_t backend_features;
     int r;
@@ -858,6 +865,8 @@ static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
 
     *cvq_isolated = false;
     *cvq_isolated_mq = false;
+    *cvq_group = 0;
+    *cvq_group_mq = 0;
     r = ioctl(device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
     if (unlikely(r < 0)) {
         error_setg_errno(errp, errno, "Cannot get vdpa backend_features");
@@ -870,7 +879,7 @@ static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
 
     r = vhost_vdpa_cvq_is_isolated(device_fd,
                                    features & ~BIT_ULL(VIRTIO_NET_F_MQ), 2,
-                                   errp);
+                                   cvq_group, errp);
     if (unlikely(r < 0)) {
         if (r == -ENOTSUP) {
             /*
@@ -891,7 +900,8 @@ static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
         return 0;
     }
 
-    r = vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2, errp);
+    r = vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2,
+                                   cvq_group_mq, errp);
     if (unlikely(r < 0)) {
         return r;
     }
@@ -917,6 +927,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     int ret = 0;
     assert(name);
     bool cvq_isolated, cvq_isolated_mq;
+    uint32_t cvq_group, cvq_group_mq;
 
     if (is_datapath) {
         nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
@@ -924,7 +935,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     } else {
         ret = vhost_vdpa_probe_cvq_isolation(vdpa_device_fd, features,
                                              queue_pair_index, &cvq_isolated,
-                                             &cvq_isolated_mq, errp);
+                                             &cvq_isolated_mq, &cvq_group,
+                                             &cvq_group_mq, errp);
         if (unlikely(ret)) {
             return NULL;
         }
@@ -957,6 +969,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
         s->cvq_isolated = cvq_isolated;
         s->cvq_isolated_mq = cvq_isolated_mq;
+        s->cvq_group = cvq_group;
+        s->cvq_group_mq = cvq_group_mq;
 
         /*
          * TODO: We cannot migrate devices with CVQ as there is no way to set
-- 
2.31.1


