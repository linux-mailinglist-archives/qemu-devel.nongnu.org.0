Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E14EE082
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:34:22 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzcj-0006gf-33
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:34:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzAa-0005Rp-34
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzAY-0007eG-22
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezYTcu/aPLPMjWfufw2S8H5qEgyKxJbAT4R0X+HbWVs=;
 b=dyGqvJBHGxAqNLqwNhzg5zsVQnjKoesoH9yVef0gRHTK06QosL4qi+cGYXYZgiOj+Bye9T
 NMlY8gaXNZWLkxTCLS3G93m7DFp2bF//2XNAhxljKn3UBdn9zGvkLqV9zTUNXXeDzBFkDh
 wKt7sgZPITqvrLXPzOaz3//cmL/8ReU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-7xjNyv1iNdy7UirKvNY-Nw-1; Thu, 31 Mar 2022 14:05:08 -0400
X-MC-Unique: 7xjNyv1iNdy7UirKvNY-Nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9029B3800EA1;
 Thu, 31 Mar 2022 18:05:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB5A40CF8EB;
 Thu, 31 Mar 2022 18:05:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 20/20] vdpa: Add x-cvq-svq
Date: Thu, 31 Mar 2022 20:04:10 +0200
Message-Id: <20220331180410.531837-21-eperezma@redhat.com>
In-Reply-To: <20220331180410.531837-1-eperezma@redhat.com>
References: <20220331180410.531837-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Peter Xu <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This isolates shadow cvq in its own group.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 qapi/net.json    |   8 ++-
 net/vhost-vdpa.c | 179 +++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 171 insertions(+), 16 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 6a5460ce56..d54a137581 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -447,9 +447,12 @@
 #
 # @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.1)
 #         (default: false)
+# @x-cvq-svq: Start device with (experimental) shadow virtqueue in its own
+#             virtqueue group. (Since 7.1)
+#             (default: false)
 #
 # Features:
-# @unstable: Member @x-svq is experimental.
+# @unstable: Members @x-svq and x-cvq-svq are experimental.
 #
 # Since: 5.1
 ##
@@ -457,7 +460,8 @@
   'data': {
     '*vhostdev':     'str',
     '*queues':       'int',
-    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
+    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] },
+    '*x-cvq-svq':    {'type': 'bool', 'features' : [ 'unstable'] } } }
 
 ##
 # @NetClientDriver:
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fae9a43b86..13767e6d3c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -354,10 +354,13 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.iova_tree = iova_tree;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
-        qemu_del_net_client(nc);
-        return NULL;
+        goto err;
     }
     return nc;
+
+err:
+    qemu_del_net_client(nc);
+    return NULL;
 }
 
 static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
@@ -370,6 +373,17 @@ static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
     return ret;
 }
 
+static int vhost_vdpa_get_backend_features(int fd, uint64_t *features,
+                                           Error **errp)
+{
+    int ret = ioctl(fd, VHOST_GET_BACKEND_FEATURES, features);
+    if (ret) {
+        error_setg_errno(errp, errno,
+            "Fail to query backend features from vhost-vDPA device");
+    }
+    return ret;
+}
+
 static int vhost_vdpa_get_max_queue_pairs(int fd, uint64_t features,
                                           int *has_cvq, Error **errp)
 {
@@ -403,16 +417,112 @@ static int vhost_vdpa_get_max_queue_pairs(int fd, uint64_t features,
     return 1;
 }
 
+/**
+ * Check vdpa device to support CVQ group asid 1
+ *
+ * @vdpa_device_fd: Vdpa device fd
+ * @queue_pairs: Queue pairs
+ * @errp: Error
+ */
+static int vhost_vdpa_check_cvq_svq(int vdpa_device_fd, int queue_pairs,
+                                    Error **errp)
+{
+    uint64_t backend_features;
+    unsigned num_as;
+    int r;
+
+    r = vhost_vdpa_get_backend_features(vdpa_device_fd, &backend_features,
+                                        errp);
+    if (unlikely(r)) {
+        return -1;
+    }
+
+    if (unlikely(!(backend_features & VHOST_BACKEND_F_IOTLB_ASID))) {
+        error_setg(errp, "Device without IOTLB_ASID feature");
+        return -1;
+    }
+
+    r = ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
+    if (unlikely(r)) {
+        error_setg_errno(errp, errno,
+                         "Cannot retrieve number of supported ASs");
+        return -1;
+    }
+    if (unlikely(num_as < 2)) {
+        error_setg(errp, "Insufficient number of ASs (%u, min: 2)", num_as);
+    }
+
+    return 0;
+}
+
+/**
+ * Check if CVQ lives in an isolated group.
+ *
+ * Note that vdpa QEMU needs to be the owner of vdpa device (in other words, to
+ * have called VHOST_SET_OWNER) for this to succeed.
+ *
+ * @vdpa_device_fd: vdpa device fd
+ * @vq_index: vq index to start asking for group
+ * @nvq: Number of vqs to check
+ * @cvq_device_index: cvq device index
+ * @cvq_group: cvq group
+ * @errp: Error
+ */
+static bool vhost_vdpa_is_cvq_isolated_group(int vdpa_device_fd,
+                                           unsigned vq_index,
+                                           unsigned nvq,
+                                           unsigned cvq_device_index,
+                                           struct vhost_vring_state *cvq_group,
+                                           Error **errp)
+{
+    int r;
+
+    if (cvq_group->index == 0) {
+        cvq_group->index = cvq_device_index;
+        r = ioctl(vdpa_device_fd, VHOST_VDPA_GET_VRING_GROUP, cvq_group);
+        if (unlikely(r)) {
+            error_setg_errno(errp, errno,
+                             "Cannot get control vq index %d group",
+                             cvq_group->index);
+            false;
+        }
+    }
+
+    for (int k = vq_index; k < vq_index + nvq; ++k) {
+        struct vhost_vring_state s = {
+            .index = k,
+        };
+
+        r = ioctl(vdpa_device_fd, VHOST_VDPA_GET_VRING_GROUP, &s);
+        if (unlikely(r)) {
+            error_setg_errno(errp, errno, "Cannot get vq %d group", k);
+            return false;
+        }
+
+        if (unlikely(s.num == cvq_group->num)) {
+            error_setg(errp, "Data virtqueue %d has the same group as cvq (%d)",
+                       k, s.num);
+            return false;
+        }
+    }
+
+    return true;
+}
+
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    struct vhost_vdpa_iova_range iova_range;
+    struct vhost_vring_state cvq_group = {};
     uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
     int queue_pairs, r, i, has_cvq = 0;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
+    g_autoptr(VhostIOVATree) cvq_iova_tree = NULL;
+    ERRP_GUARD();
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -437,8 +547,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         qemu_close(vdpa_device_fd);
         return queue_pairs;
     }
-    if (opts->x_svq) {
-        struct vhost_vdpa_iova_range iova_range;
+    if (opts->x_cvq_svq || opts->x_svq) {
+        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+
         uint64_t invalid_dev_features =
             features & ~vdpa_svq_device_features &
             /* Transport are all accepted at this point */
@@ -448,9 +559,25 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         if (invalid_dev_features) {
             error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
                        invalid_dev_features);
-            goto err_svq;
+            goto err_svq_features;
         }
-        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
+    }
+
+    if (opts->x_cvq_svq) {
+        if (!has_cvq) {
+            error_setg(errp, "Cannot use x-cvq-svq with a device without cvq");
+            goto err_cvq_svq;
+        }
+
+        r = vhost_vdpa_check_cvq_svq(vdpa_device_fd, queue_pairs, errp);
+        if (unlikely(r)) {
+            error_prepend(errp, "Cannot configure CVQ SVQ: ");
+            goto err_cvq_svq;
+        }
+
+        cvq_iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+    }
+    if (opts->x_svq) {
         iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
     }
 
@@ -458,31 +585,55 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                     vdpa_device_fd, i, 2, 0,
-                                     queue_pairs + has_cvq, true, opts->x_svq,
-                                     iova_tree);
+                                     vdpa_device_fd, i, 2, 0, 2 * queue_pairs,
+                                     true, opts->x_svq, iova_tree);
         if (!ncs[i])
             goto err;
+
+        if (opts->x_cvq_svq &&
+            !vhost_vdpa_is_cvq_isolated_group(vdpa_device_fd, i * 2, 2,
+                                              queue_pairs * 2, &cvq_group,
+                                              errp)) {
+            goto err_cvq_svq;
+        }
     }
 
     if (has_cvq) {
-        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
-                                 vdpa_device_fd, i, 1, 0,
-                                 queue_pairs + has_cvq, false, opts->x_svq,
-                                 iova_tree);
+        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd,
+                                 i, 1, !!opts->x_cvq_svq,
+                                 2 * queue_pairs + 1, false,
+                                 opts->x_cvq_svq || opts->x_svq,
+                                 cvq_iova_tree);
         if (!nc)
             goto err;
+
+        if (opts->x_cvq_svq) {
+            struct vhost_vring_state asid = {
+                .index = 1,
+                .num = 1,
+            };
+
+            r = ioctl(vdpa_device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
+            if (unlikely(r)) {
+                error_setg_errno(errp, errno,
+                                 "Cannot set cvq group independent asid");
+                goto err;
+            }
+        }
+
+        cvq_iova_tree = NULL;
     }
 
     iova_tree = NULL;
     return 0;
 
 err:
+err_cvq_svq:
     if (i) {
         qemu_del_net_client(ncs[0]);
     }
 
-err_svq:
+err_svq_features:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
2.27.0


