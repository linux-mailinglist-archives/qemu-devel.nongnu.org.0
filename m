Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F075BCCED
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:21:36 +0200 (CEST)
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGiL-0005hD-Gw
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oaGeL-0008Oa-Bi
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:36 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:55426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oaGeG-00067w-IV
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:23 -0400
Received: from dellino.fritz.box (host-82-49-101-130.retail.telecomitalia.it
 [82.49.101.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B4D76601DF0;
 Mon, 19 Sep 2022 14:17:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663593438;
 bh=KFvIIfVO5dymfUCJCAgIQpVU7zuVm7u1+bbQkHJmCkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k4SdfaO81B5pii4mM8PSCzQLrXI0eX9VkKtsxHJZe9O624O/ywinAf7po8W1bSVrT
 qNbqVO/ZZ/CV3Lm3d0H3vDa/VYiYVyN+JmU+U+1nmszPH4hc28sInHsSFla2bY/stt
 uogJXkT814rZx9gi2G90scDo4e7yEMjXofeU+GnaZg9HFfNSWeJ3o87xjZNeBvDg1b
 XRRcBIDuQaUS9naKmzQvXxrzdEekpOj7efYe6IQMjuCc2Cf20e8D45m8KgUUXtoPdM
 uCjcgDVfgyZCsnNbykBDRqPi7hgWBNZ2mvxS4+7aCcGiCsDIOiS0k8i3HXvw68AEj6
 PE1Ls/Y2oCHMQ==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 4/4] virtio-gpu: Don't require udmabuf when blob support is
 enabled
Date: Mon, 19 Sep 2022 15:17:02 +0200
Message-Id: <20220919131702.94875-5-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919131702.94875-1-antonio.caggiano@collabora.com>
References: <20220919131702.94875-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Host blobs don't need udmabuf, it's only needed by guest blobs. The host
blobs are utilized by the Mesa virgl driver when persistent memory mapping
is needed by a GL buffer, otherwise virgl driver doesn't use blobs.
Persistent mapping support bumps GL version from 4.3 to 4.5 in guest.
Relax the udmabuf requirement.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index f79693d44d..767142cf5d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -367,7 +367,9 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
         return;
     }
 
-    virtio_gpu_init_udmabuf(res);
+    if (cblob.blob_mem == VIRTIO_GPU_BLOB_MEM_GUEST) {
+        virtio_gpu_init_udmabuf(res);
+    }
     QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
@@ -1319,19 +1321,13 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
-    if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
-        if (!virtio_gpu_have_udmabuf()) {
-            error_setg(errp, "cannot enable blob resources without udmabuf");
-            return;
-        }
-
 #ifndef HAVE_VIRGL_RESOURCE_BLOB
-        if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
-            error_setg(errp, "Linked virglrenderer does not support blob resources");
-            return;
-        }
-#endif
+    if (virtio_gpu_blob_enabled(g->parent_obj.conf) &&
+        virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
+        error_setg(errp, "Linked virglrenderer does not support blob resources");
+        return;
     }
+#endif
 
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
-- 
2.34.1


