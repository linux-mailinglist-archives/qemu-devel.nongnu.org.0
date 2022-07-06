Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917556924E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:02:31 +0200 (CEST)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AIA-00014R-Ic
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xr-0005d4-PU
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xl-0000vH-4R
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6RMZ31CQp3UEAC5pDU+a65ORFdNDnmqt/5vMRiq4B8=;
 b=iyK2WjdFtawYUiIksSMrx+n39jJ636p57DYHu4jSsAwCDPmLm79q8R3+somwLE3yrbCHEd
 5g63Xm9ieQQUF354YESbDLOFnmlgaRy9QlPiYs4En6Q3aJGrq4/EkWivOeMCsRUHwXjoYf
 dz1VXo0vvqX8/+Sr6mlVOaTcXp1FM98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-A8TzJd9AP4u2vibckSVrTQ-1; Wed, 06 Jul 2022 14:41:08 -0400
X-MC-Unique: A8TzJd9AP4u2vibckSVrTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E1A0185A7A4;
 Wed,  6 Jul 2022 18:41:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72B9E1415116;
 Wed,  6 Jul 2022 18:41:05 +0000 (UTC)
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
Subject: [RFC PATCH v9 19/23] vdpa: Extract get features part from
 vhost_vdpa_get_max_queue_pairs
Date: Wed,  6 Jul 2022 20:40:04 +0200
Message-Id: <20220706184008.1649478-20-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

To know the device features is needed for CVQ SVQ, so SVQ knows if it
can handle all commands or not. Extract from
vhost_vdpa_get_max_queue_pairs so we can reuse it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index df1e69ee72..b0158f625e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -219,20 +219,24 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
-static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
+static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
+{
+    int ret = ioctl(fd, VHOST_GET_FEATURES, features);
+    if (ret) {
+        error_setg_errno(errp, errno,
+                         "Fail to query features from vhost-vDPA device");
+    }
+    return ret;
+}
+
+static int vhost_vdpa_get_max_queue_pairs(int fd, uint64_t features,
+                                          int *has_cvq, Error **errp)
 {
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
     g_autofree struct vhost_vdpa_config *config = NULL;
     __virtio16 *max_queue_pairs;
-    uint64_t features;
     int ret;
 
-    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
-    if (ret) {
-        error_setg(errp, "Fail to query features from vhost-vDPA device");
-        return ret;
-    }
-
     if (features & (1 << VIRTIO_NET_F_CTRL_VQ)) {
         *has_cvq = 1;
     } else {
@@ -262,10 +266,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
-    int queue_pairs, i, has_cvq = 0;
+    int queue_pairs, r, i, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -279,7 +284,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
+    r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
+    if (r) {
+        return r;
+    }
+
+    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
                                                  &has_cvq, errp);
     if (queue_pairs < 0) {
         qemu_close(vdpa_device_fd);
-- 
2.31.1


