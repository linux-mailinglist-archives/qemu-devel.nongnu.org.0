Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633D3AE22F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:24:22 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBTw-0001x5-Sd
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBO5-0003qO-6g
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBO2-0001ck-Eo
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpf+Uh8UzmMewQ4hXygzli1Dklmm70XRu30C05qcqNM=;
 b=AnLABP4vE6k0VY+iAbsOLGui/atomSr49to/mIplaOmH6dxFWDo/wDMDgCTFDIkZlgRwKd
 JdhCGcVwl9IZbIiGyWP6Su3FzsPjWZnH3d7gRASNPqQarzOliNd8vGEWrCy6ZY/O6CzmvP
 OHtiC6pbjZZn2oQrY+jimaS5/vBNyR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-ruwwUQkTO-K3tv2ZdrbzoQ-1; Mon, 21 Jun 2021 00:18:12 -0400
X-MC-Unique: ruwwUQkTO-K3tv2ZdrbzoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A1F4800C60;
 Mon, 21 Jun 2021 04:18:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE4FE608BA;
 Mon, 21 Jun 2021 04:18:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 18/18] vhost-vdpa: multiqueue support
Date: Mon, 21 Jun 2021 12:16:50 +0800
Message-Id: <20210621041650.5826-19-jasowang@redhat.com>
In-Reply-To: <20210621041650.5826-1-jasowang@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the multiqueue support for vhost-vdpa. This is
done simply by reading the number of queue pairs from the config space
and initialize the datapath and control path net client.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c |  3 +-
 net/vhost-vdpa.c    | 98 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5074b521cf..2c2ed98c0b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3370,7 +3370,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 
     n->max_ncs = MAX(n->nic_conf.peers.queues, 1);
 
-    /* Figure out the datapath queue pairs since the bakcend could
+    /*
+     * Figure out the datapath queue pairs since the bakcend could
      * provide control queue via peers as well.
      */
     if (n->nic_conf.peers.queues) {
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index cc11b2ec40..048344b4bc 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qapi/error.h"
+#include <linux/vhost.h>
 #include <sys/ioctl.h>
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
@@ -52,6 +53,8 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_HOST_UFO,
     VIRTIO_NET_F_MRG_RXBUF,
     VIRTIO_NET_F_MTU,
+    VIRTIO_NET_F_MQ,
+    VIRTIO_NET_F_CTRL_VQ,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
     VIRTIO_NET_F_RSS,
@@ -82,7 +85,8 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static int vhost_vdpa_add(NetClientState *ncs, void *be)
+static int vhost_vdpa_add(NetClientState *ncs, void *be, int qp_index,
+                          int nvqs)
 {
     VhostNetOptions options;
     struct vhost_net *net = NULL;
@@ -95,7 +99,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
-    options.nvqs = 2;
+    options.nvqs = nvqs;
 
     net = vhost_net_init(&options);
     if (!net) {
@@ -159,18 +163,28 @@ static NetClientInfo net_vhost_vdpa_info = {
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
-                                           int vdpa_device_fd)
+                                           int vdpa_device_fd,
+                                           int qp_index,
+                                           int nvqs,
+                                           bool is_datapath)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
     int ret = 0;
     assert(name);
-    nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
+    if (is_datapath) {
+        nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
+                                 name);
+    } else {
+        nc = qemu_new_net_control_client(&net_vhost_vdpa_info, peer,
+                                         device, name);
+    }
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
-    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
+    s->vhost_vdpa.index = qp_index;
+    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, qp_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
         return NULL;
@@ -196,12 +210,52 @@ static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+static int vhost_vdpa_get_max_qps(int fd, int *has_cvq, Error **errp)
+{
+    unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
+    struct vhost_vdpa_config *config;
+    __virtio16 *max_qps;
+    uint64_t features;
+    int ret;
+
+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
+    if (ret) {
+        error_setg(errp, "Fail to query features from vhost-vDPA device");
+        return ret;
+    }
+
+    if (features & (1 << VIRTIO_NET_F_CTRL_VQ)) {
+        *has_cvq = 1;
+    } else {
+        *has_cvq = 0;
+    }
+
+    if (features & (1 << VIRTIO_NET_F_MQ)) {
+        config = g_malloc0(config_size + sizeof(*max_qps));
+        config->off = offsetof(struct virtio_net_config, max_virtqueue_pairs);
+        config->len = sizeof(*max_qps);
+
+        ret = ioctl(fd, VHOST_VDPA_GET_CONFIG, config);
+        if (ret) {
+            error_setg(errp, "Fail to get config from vhost-vDPA device");
+            return -ret;
+        }
+
+        max_qps = (__virtio16 *)&config->buf;
+
+        return lduw_le_p(max_qps);
+    }
+
+    return 1;
+}
+
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
     int vdpa_device_fd;
-    NetClientState *nc;
+    NetClientState **ncs, *nc;
+    int qps, i, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -216,11 +270,37 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
-    if (!nc) {
+    qps = vhost_vdpa_get_max_qps(vdpa_device_fd, &has_cvq, errp);
+    if (qps < 0) {
         qemu_close(vdpa_device_fd);
-        return -1;
+        return qps;
+    }
+
+    ncs = g_malloc0(sizeof(*ncs) * qps);
+
+    for (i = 0; i < qps; i++) {
+        ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
+                                     vdpa_device_fd, i, 2, true);
+        if (!ncs[i])
+            goto err;
     }
 
+    if (has_cvq) {
+        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
+                                 vdpa_device_fd, i, 1, false);
+        if (!nc)
+            goto err;
+    }
+
+    g_free(ncs);
     return 0;
+
+err:
+    if (i) {
+        qemu_del_net_client(ncs[0]);
+    }
+    qemu_close(vdpa_device_fd);
+    g_free(ncs);
+
+    return -1;
 }
-- 
2.25.1


