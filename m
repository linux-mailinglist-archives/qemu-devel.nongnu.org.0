Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C5569255
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:06:49 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AML-0005ar-1s
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99yF-0005lK-I0
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xn-0000vp-Pl
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtJZn7b4co1MW7/rkvX94ipbrIMLQU0n5KUJLlLQzxE=;
 b=eJrw7d+vZYB4D00K/BaAOheKyuaXXho8J74xQrmT5LZ/XcH+pCRKr+MXD6JD+GQNhiIEm8
 ZbZf//uMzHYD+LzQLT28rrLi1rcPHatlewDS1UgMr8XY59IxSvolh1TME2H+J/j+XO2T8L
 Aillt1bLqZ913T9fMZYwCfEksDz60qc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-rX_840pxOeaEhPYUOygVzw-1; Wed, 06 Jul 2022 14:41:20 -0400
X-MC-Unique: rX_840pxOeaEhPYUOygVzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BC48001EA;
 Wed,  6 Jul 2022 18:41:19 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCE45141511D;
 Wed,  6 Jul 2022 18:41:16 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 23/23] vdpa: Add x-svq to NetdevVhostVDPAOptions
Date: Wed,  6 Jul 2022 20:40:08 +0200
Message-Id: <20220706184008.1649478-24-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finally offering the possibility to enable SVQ from the command line.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json    |  9 +++++-
 net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 9af11e9a3b..75ba2cb989 100644
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
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index bb6ac7d96c..3f10636e05 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -93,6 +93,30 @@ const int vdpa_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
+/** Supported device specific feature bits with SVQ */
+static const uint64_t vdpa_svq_device_features =
+    BIT_ULL(VIRTIO_NET_F_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) |
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
+    BIT_ULL(VIRTIO_NET_F_MQ) |
+    BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
+    BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
+    BIT_ULL(VIRTIO_NET_F_STANDBY);
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -151,7 +175,11 @@ err_init:
 static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_dev *dev = &s->vhost_net->dev;
 
+    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+    }
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -454,6 +482,14 @@ static uint64_t vhost_vdpa_net_iov_len(const struct iovec *iov,
     return len;
 }
 
+static int vhost_vdpa_get_iova_range(int fd,
+                                     struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    return ret < 0 ? -errno : 0;
+}
+
 static CVQElement *vhost_vdpa_net_cvq_copy_elem(VhostVDPAState *s,
                                                 VirtQueueElement *elem)
 {
@@ -628,7 +664,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
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
@@ -646,6 +684,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
@@ -708,6 +748,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
+    g_autoptr(VhostIOVATree) iova_tree = NULL;
     NetClientState *nc;
     int queue_pairs, r, i, has_cvq = 0;
 
@@ -735,22 +776,45 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
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
@@ -759,6 +823,8 @@ err:
             qemu_del_net_client(ncs[i]);
         }
     }
+
+err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
2.31.1


