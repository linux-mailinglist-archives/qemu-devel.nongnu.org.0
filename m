Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06FE3BC800
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:40:33 +0200 (CEST)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gd5-0000jN-Us
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRz-00035d-I5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRx-00039z-9D
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ysYdL7xkz/8dJdysAt7gkNLr9hPSEVhMUOR1B+TLlE=;
 b=R7qSMnSXXrrz7siZm4e28p85yxTb11vGC2o5ZG2FLoGl2sWFDngphDZdGZ4ikeCR/lXvIU
 6vhgxWAZSg8bzZNSp2Ci4NX9pVU/OnppGKjrg9qtStHfvzZYWm7C5BManlbZim2WGT006J
 8b9AzE2COj3gYyM2HjWN1tDpYicB6x4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-AI4m0MGlNhOEyYAujsjpgw-1; Tue, 06 Jul 2021 04:28:54 -0400
X-MC-Unique: AI4m0MGlNhOEyYAujsjpgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 678D0804140;
 Tue,  6 Jul 2021 08:28:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-227.pek2.redhat.com
 [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B97472EB19;
 Tue,  6 Jul 2021 08:28:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2 18/18] vhost-vdpa: multiqueue support
Date: Tue,  6 Jul 2021 16:27:17 +0800
Message-Id: <20210706082717.37730-19-jasowang@redhat.com>
In-Reply-To: <20210706082717.37730-1-jasowang@redhat.com>
References: <20210706082717.37730-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 net/vhost-vdpa.c | 104 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 9 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index cc11b2ec40..01a667deb9 100644
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
@@ -52,6 +53,14 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_HOST_UFO,
     VIRTIO_NET_F_MRG_RXBUF,
     VIRTIO_NET_F_MTU,
+    VIRTIO_NET_F_CTRL_RX,
+    VIRTIO_NET_F_CTRL_RX_EXTRA,
+    VIRTIO_NET_F_CTRL_VLAN,
+    VIRTIO_NET_F_GUEST_ANNOUNCE,
+    VIRTIO_NET_F_CTRL_MAC_ADDR,
+    VIRTIO_NET_F_RSS,
+    VIRTIO_NET_F_MQ,
+    VIRTIO_NET_F_CTRL_VQ,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
     VIRTIO_NET_F_RSS,
@@ -82,7 +91,8 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static int vhost_vdpa_add(NetClientState *ncs, void *be)
+static int vhost_vdpa_add(NetClientState *ncs, void *be, int qp_index,
+                          int nvqs)
 {
     VhostNetOptions options;
     struct vhost_net *net = NULL;
@@ -95,7 +105,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
-    options.nvqs = 2;
+    options.nvqs = nvqs;
 
     net = vhost_net_init(&options);
     if (!net) {
@@ -159,18 +169,28 @@ static NetClientInfo net_vhost_vdpa_info = {
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
@@ -196,12 +216,52 @@ static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
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
@@ -216,11 +276,37 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
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
+    }
+
+    if (has_cvq) {
+        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
+                                 vdpa_device_fd, i, 1, false);
+        if (!nc)
+            goto err;
     }
 
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


