Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447A4FFB86
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:41:38 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neg3l-0007QB-GC
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefvA-0000Em-Vu
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefv9-0003DH-Fl
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvHzPKkgYSJ9FNqvTvhxXu9EQyJ7IkkijU8zmC0fr44=;
 b=NtufmMWfrCnWj3Nacjkob5BnRQScmHtUBfKp5VC3pN5VjKwZAF21ssmV1d+sktH+8jsC6D
 T7lke53xFYhbSD8U4CPYF4BlG/U8Ph1Zqhux9++7S54cRF0BTPjPE473XkN50PyXQRQuJo
 0Qy8YtIe7vHaf/trr49Cd4vP6kdCX9w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-SGvIv9-XPr29RnooUAH3OQ-1; Wed, 13 Apr 2022 12:32:40 -0400
X-MC-Unique: SGvIv9-XPr29RnooUAH3OQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 924343841D20;
 Wed, 13 Apr 2022 16:32:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E31B1457F1A;
 Wed, 13 Apr 2022 16:32:37 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 12/25] vdpa: Extract get features part from
 vhost_vdpa_get_max_queue_pairs
Date: Wed, 13 Apr 2022 18:31:53 +0200
Message-Id: <20220413163206.1958254-13-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-1-eperezma@redhat.com>
References: <20220413163206.1958254-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To know the device features is also needed for CVQ SVQ. Extract from
vhost_vdpa_get_max_queue_pairs so we can reuse it.

Report errno in case of failure getting them while we're at it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 9261101af2..a8dde49198 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -236,20 +236,24 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
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
@@ -279,10 +283,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     NetClientState *nc;
-    int queue_pairs, i, has_cvq = 0;
+    int queue_pairs, r, i, has_cvq = 0;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
@@ -297,7 +302,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
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
2.27.0


