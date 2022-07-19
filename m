Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56785579FC3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:36:13 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnOW-00078O-G3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6n-0008Kq-UE
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6l-0004uv-Fi
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pL2ZxKrydkutONIq+ZR1u/YsAXLfXFqczH5+W0Bzus=;
 b=EwxyHRx3umxbcoeWeWjl0x3dTlwoJIEeSN8bgb7m6bdafSjueDc3DkaciAHQwkkX+/8JBN
 jSCefhWkFkOQM+G8uNVWSxes87+XT8PCNxlgUJpLrZR93kQEw7LsrECinu5Ngf7Hqeu+hw
 nYFE9QWabL4kPUo0e44XLi61q/rHnM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-6PcT4V0tMlOQTPGSYiCr-Q-1; Tue, 19 Jul 2022 09:17:49 -0400
X-MC-Unique: 6PcT4V0tMlOQTPGSYiCr-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E07CC38149AA;
 Tue, 19 Jul 2022 13:17:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4487740CFD0A;
 Tue, 19 Jul 2022 13:17:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/24] vdpa: Add x-svq to NetdevVhostVDPAOptions
Date: Tue, 19 Jul 2022 21:16:33 +0800
Message-Id: <20220719131637.46131-21-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

Finally offering the possibility to enable SVQ from the command line.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
 qapi/net.json    |  9 ++++++-
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6e3e9f3..6abad27 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -75,6 +75,28 @@ const int vdpa_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
+/** Supported device specific feature bits with SVQ */
+static const uint64_t vdpa_svq_device_features =
+    BIT_ULL(VIRTIO_NET_F_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_MTU) |
+    BIT_ULL(VIRTIO_NET_F_MAC) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_ECN) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_UFO) |
+    BIT_ULL(VIRTIO_NET_F_HOST_TSO4) |
+    BIT_ULL(VIRTIO_NET_F_HOST_TSO6) |
+    BIT_ULL(VIRTIO_NET_F_HOST_ECN) |
+    BIT_ULL(VIRTIO_NET_F_HOST_UFO) |
+    BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
+    BIT_ULL(VIRTIO_NET_F_STATUS) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
+    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
+    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
+    BIT_ULL(VIRTIO_NET_F_STANDBY);
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -133,9 +155,13 @@ err_init:
 static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_dev *dev = &s->vhost_net->dev;
 
     qemu_vfree(s->cvq_cmd_out_buffer);
     qemu_vfree(s->cvq_cmd_in_buffer);
+    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+    }
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -437,7 +463,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            int vdpa_device_fd,
                                            int queue_pair_index,
                                            int nvqs,
-                                           bool is_datapath)
+                                           bool is_datapath,
+                                           bool svq,
+                                           VhostIOVATree *iova_tree)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -455,6 +483,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
@@ -465,6 +495,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
+        error_setg(&s->vhost_vdpa.migration_blocker,
+                   "Migration disabled: vhost-vdpa uses CVQ.");
     }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
@@ -474,6 +506,14 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
+static int vhost_vdpa_get_iova_range(int fd,
+                                     struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    return ret < 0 ? -errno : 0;
+}
+
 static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
 {
     int ret = ioctl(fd, VHOST_GET_FEATURES, features);
@@ -524,6 +564,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
+    g_autoptr(VhostIOVATree) iova_tree = NULL;
     NetClientState *nc;
     int queue_pairs, r, i, has_cvq = 0;
 
@@ -551,22 +592,45 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return queue_pairs;
     }
 
+    if (opts->x_svq) {
+        struct vhost_vdpa_iova_range iova_range;
+
+        uint64_t invalid_dev_features =
+            features & ~vdpa_svq_device_features &
+            /* Transport are all accepted at this point */
+            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+        if (invalid_dev_features) {
+            error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
+                       invalid_dev_features);
+            goto err_svq;
+        }
+
+        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+    }
+
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, true);
+                                     vdpa_device_fd, i, 2, true, opts->x_svq,
+                                     iova_tree);
         if (!ncs[i])
             goto err;
     }
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false);
+                                 vdpa_device_fd, i, 1, false,
+                                 opts->x_svq, iova_tree);
         if (!nc)
             goto err;
     }
 
+    /* iova_tree ownership belongs to last NetClientState */
+    g_steal_pointer(&iova_tree);
     return 0;
 
 err:
@@ -575,6 +639,8 @@ err:
             qemu_del_net_client(ncs[i]);
         }
     }
+
+err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
diff --git a/qapi/net.json b/qapi/net.json
index 9af11e9..75ba2cb 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -445,12 +445,19 @@
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
+# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.1)
+#         (default: false)
+#
+# Features:
+# @unstable: Member @x-svq is experimental.
+#
 # Since: 5.1
 ##
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
-    '*queues':       'int' } }
+    '*queues':       'int',
+    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
 
 ##
 # @NetdevVmnetHostOptions:
-- 
2.7.4


