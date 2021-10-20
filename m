Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00DE43447D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:07:29 +0200 (CEST)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3p2-0002T7-Qo
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3fA-00032T-FP
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3f8-0008JC-OE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634705834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43Jm9K450mbhD0UtrD3UtteVJ6ijXYwDTlgFb2IXOpo=;
 b=eihidJkskdVSbM177U/z89u2hCIx2iyXVNdUkRNst+vX25LJjjkWwK1UVFGMwRgLaaqHbS
 DiiQqmjJ0H5AOE7rQprVSiMXFXxnCQ+pTruTYHyUZrevmIVML7kEKpSrVbSYctNusfcRWD
 x4egWdBm4/zq3s7co+5SJbf2DSrpMfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-7dbN4Z9nNSCaJuZ4nvcB0g-1; Wed, 20 Oct 2021 00:57:11 -0400
X-MC-Unique: 7dbN4Z9nNSCaJuZ4nvcB0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6FC802575;
 Wed, 20 Oct 2021 04:57:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-13.pek2.redhat.com [10.72.13.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B245760BF1;
 Wed, 20 Oct 2021 04:57:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V5 10/10] vhost-vdpa: multiqueue support
Date: Wed, 20 Oct 2021 12:56:00 +0800
Message-Id: <20211020045600.16082-11-jasowang@redhat.com>
In-Reply-To: <20211020045600.16082-1-jasowang@redhat.com>
References: <20211020045600.16082-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the multiqueue support for vhost-vdpa. This is
done simply by reading the number of queue pairs from the config space
and initialize the datapath and control path net client.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c |   2 +-
 net/vhost-vdpa.c       | 105 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 40987188cf..ce0a297481 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -630,7 +630,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (dev->vq_index + dev->nvqs != dev->last_index) {
         return 0;
     }
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 151f60184d..49ab322511 100644
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
@@ -51,6 +52,14 @@ const int vdpa_feature_bits[] = {
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
@@ -81,7 +90,8 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static int vhost_vdpa_add(NetClientState *ncs, void *be)
+static int vhost_vdpa_add(NetClientState *ncs, void *be,
+                          int queue_pair_index, int nvqs)
 {
     VhostNetOptions options;
     struct vhost_net *net = NULL;
@@ -94,7 +104,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
-    options.nvqs = 2;
+    options.nvqs = nvqs;
 
     net = vhost_net_init(&options);
     if (!net) {
@@ -172,18 +182,28 @@ static NetClientInfo net_vhost_vdpa_info = {
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
-                                           int vdpa_device_fd)
+                                           int vdpa_device_fd,
+                                           int queue_pair_index,
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
+    s->vhost_vdpa.index = queue_pair_index;
+    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
         return NULL;
@@ -191,12 +211,52 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
+static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
+{
+    unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
+    struct vhost_vdpa_config *config;
+    __virtio16 *max_queue_pairs;
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
+        config = g_malloc0(config_size + sizeof(*max_queue_pairs));
+        config->off = offsetof(struct virtio_net_config, max_virtqueue_pairs);
+        config->len = sizeof(*max_queue_pairs);
+
+        ret = ioctl(fd, VHOST_VDPA_GET_CONFIG, config);
+        if (ret) {
+            error_setg(errp, "Fail to get config from vhost-vDPA device");
+            return -ret;
+        }
+
+        max_queue_pairs = (__virtio16 *)&config->buf;
+
+        return lduw_le_p(max_queue_pairs);
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
+    int queue_pairs, i, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -206,11 +266,38 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
-    if (!nc) {
+    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
+                                                 &has_cvq, errp);
+    if (queue_pairs < 0) {
         qemu_close(vdpa_device_fd);
-        return -1;
+        return queue_pairs;
+    }
+
+    ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
+
+    for (i = 0; i < queue_pairs; i++) {
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


