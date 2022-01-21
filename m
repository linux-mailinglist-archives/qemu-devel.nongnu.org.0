Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D996D496725
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:12:24 +0100 (CET)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1Cp-0002mi-B5
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0g6-0003tS-86
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:38:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0g3-00078s-VM
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LGql8TZY0s6ZwIZaFQtscJKDocmuPbrDn2lBnqG4fU=;
 b=PoZ14edl49IFX+cq6gbHWB0fPpz16G8L9KQn0uezrjBABMzLdXY1lPbEE5e0sJaVTQESA7
 VTAXtie9nwM9pLQJSBvypRKNMpVah53ru6SUXhLZy2f6RwUiSlcyh88HcE6mSSsSmqWbpY
 M4AKf1ka49IkJQTdw9vhISgewexqoao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-Ftd5LJo0Mpm09sDyIJm2Dw-1; Fri, 21 Jan 2022 15:38:27 -0500
X-MC-Unique: Ftd5LJo0Mpm09sDyIJm2Dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB1238145E0;
 Fri, 21 Jan 2022 20:38:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3C07E2D3;
 Fri, 21 Jan 2022 20:37:44 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/31] vdpa: Add x-svq to NetdevVhostVDPAOptions
Date: Fri, 21 Jan 2022 21:27:33 +0100
Message-Id: <20220121202733.404989-32-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finally offering the possibility to enable SVQ from the command line.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json    |  5 ++++-
 net/vhost-vdpa.c | 27 ++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..d243701527 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -445,12 +445,15 @@
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
+# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
+#
 # Since: 5.1
 ##
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
-    '*queues':       'int' } }
+    '*queues':       'int',
+    '*x-svq':        'bool' } }
 
 ##
 # @NetClientDriver:
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index cc9cecf8d1..9e443fa715 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -128,7 +128,11 @@ err_init:
 static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_dev *dev = s->vhost_vdpa.dev;
 
+    if (dev && dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+    }
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -206,7 +210,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int queue_pair_index,
                                        int nvqs,
                                        bool is_datapath,
-                                       struct vhost_vdpa_iova_range iova_range)
+                                       bool svq,
+                                       struct vhost_vdpa_iova_range iova_range,
+                                       VhostIOVATree *iova_tree)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -225,6 +231,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->vhost_vdpa.iova_range = iova_range;
+    s->vhost_vdpa.shadow_vqs_enabled = svq;
+    s->vhost_vdpa.iova_tree = iova_tree;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
@@ -281,6 +289,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
     int queue_pairs, i, has_cvq = 0;
+    g_autoptr(VhostIOVATree) iova_tree = NULL;
     struct vhost_vdpa_iova_range iova_range;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
@@ -302,29 +311,41 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return queue_pairs;
     }
     vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+    if (opts->x_svq) {
+        if (has_cvq) {
+            error_setg(errp, "vdpa svq does not work with cvq");
+            goto err_svq;
+        }
+        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+    }
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, true, iova_range);
+                                     vdpa_device_fd, i, 2, true, opts->x_svq,
+                                     iova_range, iova_tree);
         if (!ncs[i])
             goto err;
     }
 
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, false, iova_range);
+                                 vdpa_device_fd, i, 1, false, opts->x_svq,
+                                 iova_range, iova_tree);
         if (!nc)
             goto err;
     }
 
+    iova_tree = NULL;
     return 0;
 
 err:
     if (i) {
         qemu_del_net_client(ncs[0]);
     }
+
+err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
2.27.0


