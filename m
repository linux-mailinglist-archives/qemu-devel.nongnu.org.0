Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A657D1FA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:51:32 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZOd-0005Xq-Im
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZHN-0002CY-JX
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZHJ-0000Zs-GR
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CjziT1UBw21jrbOH7M2X1DMuGYwRwLgzVjUEMxY290=;
 b=O9BPX/KkETXZhGmuCup8ctqhmedfKhJ3X4H7DX5WOx11NmMd308KZTBWM8+GWxJnVLGzc8
 G8r8vkd5vmehhrp1I/oaIsJ8th6Js60bf1u9Fq0XULx9vEggOBpb9u6/1+ePbFzdhsN3G9
 kjK2KXtbh+eRlgSjUFcWFpZyARFL1q0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-nKamh-HIOQSkTkggyhg0XA-1; Thu, 21 Jul 2022 12:43:53 -0400
X-MC-Unique: nKamh-HIOQSkTkggyhg0XA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2AC7801755;
 Thu, 21 Jul 2022 16:43:52 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 656EE40D282F;
 Thu, 21 Jul 2022 16:43:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 6/6] vdpa: Always start CVQ in SVQ mode
Date: Thu, 21 Jul 2022 18:43:31 +0200
Message-Id: <20220721164331.3328625-7-eperezma@redhat.com>
In-Reply-To: <20220721164331.3328625-1-eperezma@redhat.com>
References: <20220721164331.3328625-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Isolate control virtqueue in its own group, allowing to intercept control
commands but letting dataplane run totally passthrough to the guest.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/net/vhost-vdpa.h |   1 +
 hw/net/vhost_net.c       |   4 +
 hw/virtio/vhost-vdpa.c   |   3 +-
 net/vhost-vdpa.c         | 156 ++++++++++++++++++++++++++++++++++++++-
 4 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
index 38d65e845d..ea0ba06efb 100644
--- a/include/net/vhost-vdpa.h
+++ b/include/net/vhost-vdpa.h
@@ -15,6 +15,7 @@
 #define TYPE_VHOST_VDPA "vhost-vdpa"
 
 struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
+void vhost_vdpa_net_prepare(NetClientState *nc);
 int vhost_vdpa_start(NetClientState *nc);
 
 extern const int vdpa_feature_bits[];
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index f9cebd9716..d42df02706 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -244,6 +244,10 @@ static int vhost_net_start_one(struct vhost_net *net,
     struct vhost_vring_file file = { };
     int r;
 
+    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        vhost_vdpa_net_prepare(net->nc);
+    }
+
     r = vhost_dev_enable_notifiers(&net->dev, dev);
     if (r < 0) {
         goto fail_notifiers;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 30f3e204a0..65ed20de23 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -668,7 +668,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 90394fefdf..1312f6d7dc 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -37,6 +37,9 @@ typedef struct VhostVDPAState {
     /* Control commands shadow buffers */
     void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
 
+    /* Number of address spaces supported by the device */
+    unsigned address_space_num;
+
     /* The device always have SVQ enabled */
     bool always_svq;
     bool started;
@@ -100,6 +103,8 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
+#define VHOST_VDPA_NET_CVQ_ASID 1
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -224,6 +229,46 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static int vhost_vdpa_get_vring_group(int device_fd,
+                                      struct vhost_vring_state *state)
+{
+    int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, state);
+    return r < 0 ? -errno : 0;
+}
+
+/**
+ * Check if all the virtqueues of the virtio device are in a different vq than
+ * the last vq. VQ group of last group passed in cvq_group.
+ */
+static bool vhost_vdpa_cvq_group_is_independent(struct vhost_vdpa *v,
+                                            struct vhost_vring_state cvq_group)
+{
+    struct vhost_dev *dev = v->dev;
+    int ret;
+
+    for (int i = 0; i < (dev->vq_index_end - 1); ++i) {
+        struct vhost_vring_state vq_group = {
+            .index = i,
+        };
+
+        ret = vhost_vdpa_get_vring_group(v->device_fd, &vq_group);
+        if (unlikely(ret)) {
+            goto call_err;
+        }
+        if (unlikely(vq_group.num == cvq_group.num)) {
+            error_report("CVQ %u group is the same as VQ %u one (%u)",
+                         cvq_group.index, vq_group.index, cvq_group.num);
+            return false;
+        }
+    }
+
+    return true;
+
+call_err:
+    error_report("Can't read vq group, errno=%d (%s)", -ret, g_strerror(-ret));
+    return false;
+}
+
 static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
 {
     VhostIOVATree *tree = v->iova_tree;
@@ -378,6 +423,68 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
     return VIRTIO_NET_OK;
 }
 
+static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
+                                           unsigned vq_group,
+                                           unsigned asid_num)
+{
+    struct vhost_vring_state asid = {
+        .index = vq_group,
+        .num = asid_num,
+    };
+    int ret;
+
+    ret = ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
+    if (unlikely(ret < 0)) {
+        error_report("Can't set vq group %u asid %u, errno=%d (%s)",
+            asid.index, asid.num, errno, g_strerror(errno));
+    }
+    return ret;
+}
+
+void vhost_vdpa_net_prepare(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+    struct vhost_vring_state cvq_group = {
+        .index = v->dev->vq_index_end - 1,
+    };
+    int r;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (v->dev->vq_index + v->dev->nvqs != v->dev->vq_index_end) {
+        /* Only interested in CVQ */
+        return;
+    }
+
+    if (s->always_svq) {
+        /* SVQ is already enabled */
+        return;
+    }
+
+    if (s->address_space_num < 2) {
+        v->shadow_vqs_enabled = false;
+        return;
+    }
+
+    r = vhost_vdpa_get_vring_group(v->device_fd, &cvq_group);
+    if (unlikely(r)) {
+        error_report("Can't read cvq group, errno=%d (%s)", r, g_strerror(-r));
+        v->shadow_vqs_enabled = false;
+        return;
+    }
+
+    if (!vhost_vdpa_cvq_group_is_independent(v, cvq_group)) {
+        v->shadow_vqs_enabled = false;
+        return;
+    }
+
+    r = vhost_vdpa_set_address_space_id(v, cvq_group.num,
+                                        VHOST_VDPA_NET_CVQ_ASID);
+    v->shadow_vqs_enabled = r == 0;
+    s->vhost_vdpa.address_space_id = r == 0 ? 1 : 0;
+}
+
 int vhost_vdpa_start(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -538,12 +645,40 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
 };
 
+static bool vhost_vdpa_get_as_num(int vdpa_device_fd, unsigned *num_as,
+                                  Error **errp)
+{
+    uint64_t features;
+    int r;
+
+    r = ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &features);
+    if (unlikely(r < 0)) {
+        error_setg_errno(errp, errno, "Cannot get backend features");
+        return r;
+    }
+
+    if (!(features & VHOST_BACKEND_F_IOTLB_ASID)) {
+        *num_as = 1;
+        return 0;
+    }
+
+    r = ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, num_as);
+    if (unlikely(r < 0)) {
+        error_setg_errno(errp, errno,
+                         "Cannot retrieve number of supported ASs");
+        return r;
+    }
+
+    return 0;
+}
+
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
                                            int vdpa_device_fd,
                                            int queue_pair_index,
                                            int nvqs,
+                                           unsigned nas,
                                            bool is_datapath,
                                            bool svq,
                                            VhostIOVATree *iova_tree)
@@ -562,6 +697,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
 
+    s->address_space_num = nas;
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
@@ -646,7 +782,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autofree NetClientState **ncs = NULL;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
     NetClientState *nc;
+    unsigned num_as = 1;
     int queue_pairs, r, i, has_cvq = 0;
+    bool svq_cvq;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -672,7 +810,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return queue_pairs;
     }
 
-    if (opts->x_svq) {
+    svq_cvq = opts->x_svq;
+    if (has_cvq && !opts->x_svq) {
+        r = vhost_vdpa_get_as_num(vdpa_device_fd, &num_as, errp);
+        if (unlikely(r < 0)) {
+            return r;
+        }
+
+        svq_cvq = num_as > 1;
+    }
+
+    if (opts->x_svq || svq_cvq) {
         struct vhost_vdpa_iova_range iova_range;
 
         uint64_t invalid_dev_features =
@@ -695,15 +843,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_tree);
+                                     vdpa_device_fd, i, 2, num_as, true,
+                                     opts->x_svq, iova_tree);
         if (!ncs[i])
             goto err;
     }
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false,
+                                 vdpa_device_fd, i, 1, num_as, false,
                                  opts->x_svq, iova_tree);
         if (!nc)
             goto err;
-- 
2.31.1


