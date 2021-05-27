Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96539310D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:38:42 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH9l-0001FW-Ar
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGx9-0000yo-TT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGx3-0005Bm-GG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSV69lT7H3OzP1ZcG8G8Fqv5wM/aSayOBaTmmMaOXdI=;
 b=UpR03s6K6fpWjVzLNFuWvRKWGVY5dYLZpcZDra/OEURK++wtNKz/DM9wllwtSFbJAaOfCU
 PYeIGeqA7kY78Oir3b+Mz4BkepJCzB7MbhJ4RXSuUO/lAl/lZ5lLkoc0RDG1PpdKpN8j5f
 PkuDllCX9Dnii6lNW6qzPSt+crTtwL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-VbXVwbzaNQGOYb7R6a56Yg-1; Thu, 27 May 2021 10:25:29 -0400
X-MC-Unique: VbXVwbzaNQGOYb7R6a56Yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85367501E3;
 Thu, 27 May 2021 14:25:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A8445D6D3;
 Thu, 27 May 2021 14:25:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB1A81800867; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] virtio-gpu: Add initial definitions for blob resources
Date: Thu, 27 May 2021 16:23:34 +0200
Message-Id: <20210527142340.1352791-18-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Add the property bit, configuration flag and other relevant
macros and definitions associated with this feature.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-9-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  3 +++
 hw/display/virtio-gpu-base.c   |  3 +++
 hw/display/virtio-gpu.c        | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index dad9a1d221f9..66e7aaad0e98 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -89,6 +89,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_STATS_ENABLED,
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
+    VIRTIO_GPU_FLAG_BLOB_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -99,6 +100,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_EDID_ENABLED))
 #define virtio_gpu_dmabuf_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
+#define virtio_gpu_blob_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index afb3ee7d9afc..dd294276cb38 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -208,6 +208,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_edid_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_EDID);
     }
+    if (virtio_gpu_blob_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 7a0db3a8602e..f77a7fc7dd21 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1108,6 +1108,18 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
+    if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+        if (!virtio_gpu_have_udmabuf()) {
+            error_setg(errp, "cannot enable blob resources without udmabuf");
+            return;
+        }
+
+        if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
+            error_setg(errp, "blobs and virgl are not compatible (yet)");
+            return;
+        }
+    }
+
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
                                         virtio_gpu_handle_cursor_cb,
@@ -1201,6 +1213,8 @@ static Property virtio_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf),
     DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf_max_hostmem,
                      256 * MiB),
+    DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


