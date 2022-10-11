Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0565FB2A5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:47:48 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEfi-0000X9-06
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oiCiY-00055d-EU
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oiCiS-0007sX-DO
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPFDxTBnsRnQpeGqKNXXcky9QctdLhlpbSkmYK5HBIE=;
 b=R9q49byznFIGg17R3cdaR8ttH9Nles67sBil/BVfAxUb+K2EwdU6lcdzry6sLOKDtwgizD
 ISDqGkrySYdyzLOTYrn0OcQN+biN8rPdPU2ox8pBbsDuJ1R9k8IPVU3JAHfMQ9fU32w6A/
 CZA9PIR2VW4q2OYpqG75GSErpmo/1Cg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-yt_mMouoNPeu7-wkdTlNQQ-1; Tue, 11 Oct 2022 06:42:22 -0400
X-MC-Unique: yt_mMouoNPeu7-wkdTlNQQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62B28380390B;
 Tue, 11 Oct 2022 10:42:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30ADA492B09;
 Tue, 11 Oct 2022 10:42:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH v5 6/6] vdpa: Always start CVQ in SVQ mode
Date: Tue, 11 Oct 2022 12:41:54 +0200
Message-Id: <20221011104154.1209338-7-eperezma@redhat.com>
In-Reply-To: <20221011104154.1209338-1-eperezma@redhat.com>
References: <20221011104154.1209338-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Isolate control virtqueue in its own group, allowing to intercept control
commands but letting dataplane run totally passthrough to the guest.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5:
* Fixing the not adding cvq buffers when x-svq=on is specified.
* Move vring state in vhost_vdpa_get_vring_group instead of using a
  parameter.
* Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID

v4:
* Squash vhost_vdpa_cvq_group_is_independent.
* Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
* Do not check for cvq index on vhost_vdpa_net_prepare, we only have one
  that callback registered in that NetClientInfo.

v3:
* Make asid related queries print a warning instead of returning an
  error and stop the start of qemu.
---
 hw/virtio/vhost-vdpa.c |   3 +-
 net/vhost-vdpa.c       | 118 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 115 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 29d009c02b..fd4de06eab 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -682,7 +682,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index f7831aeb8d..6f6ef59ea3 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -38,6 +38,9 @@ typedef struct VhostVDPAState {
     void *cvq_cmd_out_buffer;
     virtio_net_ctrl_ack *status;
 
+    /* Number of address spaces supported by the device */
+    unsigned address_space_num;
+
     /* The device always have SVQ enabled */
     bool always_svq;
     bool started;
@@ -102,6 +105,9 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
+#define VHOST_VDPA_NET_DATA_ASID 0
+#define VHOST_VDPA_NET_CVQ_ASID 1
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -226,6 +232,34 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static uint32_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
+{
+    struct vhost_vring_state state = {
+        .index = vq_index,
+    };
+    int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
+
+    return r < 0 ? 0 : state.num;
+}
+
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
+        warn_report("Can't set vq group %u asid %u, errno=%d (%s)",
+            asid.index, asid.num, errno, g_strerror(errno));
+    }
+    return ret;
+}
+
 static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
 {
     VhostIOVATree *tree = v->iova_tree;
@@ -300,11 +334,50 @@ dma_map_err:
 static int vhost_vdpa_net_cvq_start(NetClientState *nc)
 {
     VhostVDPAState *s;
-    int r;
+    struct vhost_vdpa *v;
+    uint32_t cvq_group;
+    int cvq_index, r;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
     s = DO_UPCAST(VhostVDPAState, nc, nc);
+    v = &s->vhost_vdpa;
+
+    v->listener_shadow_vq = s->always_svq;
+    v->shadow_vqs_enabled = s->always_svq;
+    s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_DATA_ASID;
+
+    if (s->always_svq) {
+        goto out;
+    }
+
+    if (s->address_space_num < 2) {
+        return 0;
+    }
+
+    /**
+     * Check if all the virtqueues of the virtio device are in a different vq
+     * than the last vq. VQ group of last group passed in cvq_group.
+     */
+    cvq_index = v->dev->vq_index_end - 1;
+    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
+    for (int i = 0; i < cvq_index; ++i) {
+        uint32_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
+
+        if (unlikely(group == cvq_group)) {
+            warn_report("CVQ %u group is the same as VQ %u one (%u)", cvq_group,
+                        i, group);
+            return 0;
+        }
+    }
+
+    r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
+    if (r == 0) {
+        v->shadow_vqs_enabled = true;
+        s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
+    }
+
+out:
     if (!s->vhost_vdpa.shadow_vqs_enabled) {
         return 0;
     }
@@ -576,12 +649,38 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
 };
 
+static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd)
+{
+    uint64_t features;
+    unsigned num_as;
+    int r;
+
+    r = ioctl(vdpa_device_fd, VHOST_GET_BACKEND_FEATURES, &features);
+    if (unlikely(r < 0)) {
+        warn_report("Cannot get backend features");
+        return 1;
+    }
+
+    if (!(features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
+        return 1;
+    }
+
+    r = ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
+    if (unlikely(r < 0)) {
+        warn_report("Cannot retrieve number of supported ASs");
+        return 1;
+    }
+
+    return num_as;
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
@@ -600,6 +699,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
 
+    s->address_space_num = nas;
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
@@ -686,6 +786,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autoptr(VhostIOVATree) iova_tree = NULL;
     NetClientState *nc;
     int queue_pairs, r, i = 0, has_cvq = 0;
+    unsigned num_as = 1;
+    bool svq_cvq;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -711,7 +813,13 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return queue_pairs;
     }
 
-    if (opts->x_svq) {
+    svq_cvq = opts->x_svq;
+    if (has_cvq && !opts->x_svq) {
+        num_as = vhost_vdpa_get_as_num(vdpa_device_fd);
+        svq_cvq = num_as > 1;
+    }
+
+    if (opts->x_svq || svq_cvq) {
         struct vhost_vdpa_iova_range iova_range;
 
         uint64_t invalid_dev_features =
@@ -734,15 +842,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
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


