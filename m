Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2CF68EBE9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:43:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgyx-00050t-5G; Wed, 08 Feb 2023 04:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgyu-0004zz-VX
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgyq-0005Md-8y
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIlHBRUuqaWxdpypKS8k9nPXvNlZJx/L50KFWlh9jH8=;
 b=RQjU3J0PpMQOJG9nBJ+U2lFH8IMFaPXOXveFMxCz5Oji+xEvhTS148WE1vflSpR3ThaL/l
 KKvdOPWQw5NkLY9AFfYVuXUpl67X3FI2ASdXbRU+SVw9UoD49ZPJDW6w87R50L3hn6quKD
 wWftHW/IvZJsZ+phiu+uRTaBAcrArj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-wKCKScPAOFq-02_YWO0DNA-1; Wed, 08 Feb 2023 04:43:03 -0500
X-MC-Unique: wKCKScPAOFq-02_YWO0DNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEB87802314;
 Wed,  8 Feb 2023 09:43:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB0DF2166B2B;
 Wed,  8 Feb 2023 09:42:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 01/13] vdpa net: move iova tree creation from init to start
Date: Wed,  8 Feb 2023 10:42:41 +0100
Message-Id: <20230208094253.702672-2-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Only create iova_tree if and when it is needed.

The cleanup keeps being responsible of last VQ but this change allows it
to merge both cleanup functions.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 71 insertions(+), 28 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index de5ed8ff22..a9e6c8f28e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -178,13 +178,9 @@ err_init:
 static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-    struct vhost_dev *dev = &s->vhost_net->dev;
 
     qemu_vfree(s->cvq_cmd_out_buffer);
     qemu_vfree(s->status);
-    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
-        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
-    }
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
     return size;
 }
 
+/** From any vdpa net client, get the netclient of first queue pair */
+static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
+{
+    NICState *nic = qemu_get_nic(s->nc.peer);
+    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
+
+    return DO_UPCAST(VhostVDPAState, nc, nc0);
+}
+
+static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
+{
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+
+    if (v->shadow_vqs_enabled) {
+        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
+                                           v->iova_range.last);
+    }
+}
+
+static int vhost_vdpa_net_data_start(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (v->index == 0) {
+        vhost_vdpa_net_data_start_first(s);
+        return 0;
+    }
+
+    if (v->shadow_vqs_enabled) {
+        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
+        v->iova_tree = s0->vhost_vdpa.iova_tree;
+    }
+
+    return 0;
+}
+
+static void vhost_vdpa_net_client_stop(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_dev *dev;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    dev = s->vhost_vdpa.dev;
+    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+    }
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
         .receive = vhost_vdpa_receive,
+        .start = vhost_vdpa_net_data_start,
+        .stop = vhost_vdpa_net_client_stop,
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
@@ -351,7 +401,7 @@ dma_map_err:
 
 static int vhost_vdpa_net_cvq_start(NetClientState *nc)
 {
-    VhostVDPAState *s;
+    VhostVDPAState *s, *s0;
     struct vhost_vdpa *v;
     uint64_t backend_features;
     int64_t cvq_group;
@@ -425,6 +475,15 @@ out:
         return 0;
     }
 
+    s0 = vhost_vdpa_net_first_nc_vdpa(s);
+    if (s0->vhost_vdpa.iova_tree) {
+        /* SVQ is already configured for all virtqueues */
+        v->iova_tree = s0->vhost_vdpa.iova_tree;
+    } else {
+        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
+                                           v->iova_range.last);
+    }
+
     r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
                                vhost_vdpa_net_cvq_cmd_page_len(), false);
     if (unlikely(r < 0)) {
@@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     if (s->vhost_vdpa.shadow_vqs_enabled) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
-        if (!s->always_svq) {
-            /*
-             * If only the CVQ is shadowed we can delete this safely.
-             * If all the VQs are shadows this will be needed by the time the
-             * device is started again to register SVQ vrings and similar.
-             */
-            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
-        }
     }
+
+    vhost_vdpa_net_client_stop(nc);
 }
 
 static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
@@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int nvqs,
                                        bool is_datapath,
                                        bool svq,
-                                       struct vhost_vdpa_iova_range iova_range,
-                                       VhostIOVATree *iova_tree)
+                                       struct vhost_vdpa_iova_range iova_range)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-    s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
@@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
-    g_autoptr(VhostIOVATree) iova_tree = NULL;
     struct vhost_vdpa_iova_range iova_range;
     NetClientState *nc;
     int queue_pairs, r, i = 0, has_cvq = 0;
@@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         goto err;
     }
 
-    if (opts->x_svq) {
-        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
-            goto err_svq;
-        }
-
-        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
+        goto err;
     }
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
@@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range, iova_tree);
+                                     iova_range);
         if (!ncs[i])
             goto err;
     }
@@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range, iova_tree);
+                                 opts->x_svq, iova_range);
         if (!nc)
             goto err;
     }
 
-    /* iova_tree ownership belongs to last NetClientState */
-    g_steal_pointer(&iova_tree);
     return 0;
 
 err:
@@ -849,7 +893,6 @@ err:
         }
     }
 
-err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
2.31.1


