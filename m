Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C793A6C7167
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 20:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfR1A-0003ID-Qu; Thu, 23 Mar 2023 15:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pfR17-0003HX-R6
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pfR16-0007SF-27
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679601271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np2EKvRi2WJXUCP9UYg5mok3CE+biqSLgMQXjuNG6dQ=;
 b=JsWjClHOdFwPzUnOlnjOC0FLgVZCOhWbwdojGrlfeXoCmf4BuCLr/0+4YSOO7VgQuYRvcK
 Sc91ml1mI1aWiQaEiamlcm3CEtRjvojCdUoI9UpK96aDylwqhuRfLJPY8fKOGDapIznAlF
 IoaX9mqj9VKsHPyaZk1ywIOANSgPimk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-5PXJLPKCPSKMKckgL49F5w-1; Thu, 23 Mar 2023 15:54:28 -0400
X-MC-Unique: 5PXJLPKCPSKMKckgL49F5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6EDF101A550;
 Thu, 23 Mar 2023 19:54:26 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F59051FF;
 Thu, 23 Mar 2023 19:54:23 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, Eli Cohen <eli@mellanox.com>,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH for 8.1 v2 6/6] vdpa: Cache cvq group in VhostVDPAState
Date: Thu, 23 Mar 2023 20:54:04 +0100
Message-Id: <20230323195404.1247326-7-eperezma@redhat.com>
In-Reply-To: <20230323195404.1247326-1-eperezma@redhat.com>
References: <20230323195404.1247326-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Continue the move of code that interacts with the device from control
virtqueue start to control virtqueue init.

As with previous patches, it reduces the number of ioctls in the
migration, reducing failure possibilities.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index db2c9afcb3..6a60e8cc2b 100644
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
@@ -810,6 +813,7 @@ static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
         return cvq_group;
     }
 
+    *pcvq_group = (uint32_t)cvq_group;
     for (int i = 0; i < cvq_index; ++i) {
         int64_t group = vhost_vdpa_get_vring_group(device_fd, i, errp);
 
@@ -836,12 +840,15 @@ static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
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
@@ -850,6 +857,8 @@ static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
 
     *cvq_isolated = false;
     *cvq_isolated_mq = false;
+    *cvq_group = 0;
+    *cvq_group_mq = 0;
     r = ioctl(device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
     if (unlikely(r < 0)) {
         error_setg_errno(errp, errno, "Cannot get vdpa backend_features");
@@ -862,7 +871,7 @@ static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
 
     r = vhost_vdpa_cvq_is_isolated(device_fd,
                                    features & ~BIT_ULL(VIRTIO_NET_F_MQ), 2,
-                                   errp);
+                                   cvq_group, errp);
     if (unlikely(r < 0)) {
         if (r == -ENOTSUP) {
             /*
@@ -884,7 +893,8 @@ static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
         return 0;
     }
 
-    r = vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2, errp);
+    r = vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2,
+                                   cvq_group_mq, errp);
     if (unlikely(r < 0)) {
         return r;
     }
@@ -911,6 +921,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     int ret = 0;
     assert(name);
     bool cvq_isolated, cvq_isolated_mq;
+    uint32_t cvq_group, cvq_group_mq;
 
     if (is_datapath) {
         nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
@@ -918,7 +929,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     } else {
         ret = vhost_vdpa_probe_cvq_isolation(vdpa_device_fd, features,
                                              queue_pair_index, &cvq_isolated,
-                                             &cvq_isolated_mq, errp);
+                                             &cvq_isolated_mq, &cvq_group,
+                                             &cvq_group_mq, errp);
         if (unlikely(ret)) {
             return NULL;
         }
@@ -951,6 +963,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
         s->cvq_isolated = cvq_isolated;
         s->cvq_isolated_mq = cvq_isolated_mq;
+        s->cvq_group = cvq_group;
+        s->cvq_group_mq = cvq_group_mq;
 
         /*
          * TODO: We cannot migrate devices with CVQ as there is no way to set
-- 
2.31.1


