Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF258F284
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 20:49:23 +0200 (CEST)
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqle-0007ox-Cw
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 14:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfF-00028v-EG
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfB-0006h9-G3
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVnZ2eKVmApuP3yb5NRmJJpEHJ0ByEkMjNlf+83PBe4=;
 b=BqvoDfe/24qBefcCzmQGbRPcxXGTPG+jBASrFapC6LlIcJLWdzVKNNTujTh8RpUma89Pyq
 nAu4tNgpfUUW6U6GFTEiMalJNEFYMsp5Dt6ORBSxWUyjKKe+rHtei1T4dIRqT+36v9rvxe
 eHfZwVhL7AWKbWdmV52RuaOlblc1yqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-UZG9jtC1PJi8mjVY-bAVRg-1; Wed, 10 Aug 2022 14:42:31 -0400
X-MC-Unique: UZG9jtC1PJi8mjVY-bAVRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 437E7804196;
 Wed, 10 Aug 2022 18:42:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6DD7C15BA3;
 Wed, 10 Aug 2022 18:42:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 2/8] vdpa: Extract get_backend_features from
 vhost_vdpa_get_as_num
Date: Wed, 10 Aug 2022 20:42:14 +0200
Message-Id: <20220810184220.2362292-3-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-1-eperezma@redhat.com>
References: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

The series reuses it to check for SUSPEND feature bit.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 11241ebac4..85b10799bd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -602,9 +602,17 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
 };
 
-static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd)
+static uint64_t vhost_vdpa_get_backend_features(int fd)
 {
     uint64_t features;
+
+    /* No need to treat the error, only to know there is one */
+    int ret = ioctl(fd, VHOST_GET_BACKEND_FEATURES, &features);
+    return ret < 0 ? 0 : features;
+}
+
+static uint32_t vhost_vdpa_get_as_num(int vdpa_device_fd, uint64_t features)
+{
     unsigned num_as;
     int r;
 
@@ -733,7 +741,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
-    uint64_t features;
+    uint64_t features, backend_features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
@@ -765,9 +773,10 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         goto err;
     }
 
+    backend_features = vhost_vdpa_get_backend_features(vdpa_device_fd);
     svq_cvq = opts->x_svq;
     if (has_cvq && !opts->x_svq) {
-        num_as = vhost_vdpa_get_as_num(vdpa_device_fd);
+        num_as = vhost_vdpa_get_as_num(vdpa_device_fd, backend_features);
         svq_cvq = num_as > 1;
     }
 
-- 
2.31.1


