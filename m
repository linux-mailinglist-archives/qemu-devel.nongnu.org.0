Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAB5B6C0B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:57:07 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3bG-0003PK-6H
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oY3Ux-0006EI-4a
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:50:36 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:47298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oY3Uv-00019x-4I
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:50:34 -0400
Received: from dellino.fritz.box (host-79-51-37-159.retail.telecomitalia.it
 [79.51.37.159])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 710DC6602028;
 Tue, 13 Sep 2022 11:50:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663066231;
 bh=KFvIIfVO5dymfUCJCAgIQpVU7zuVm7u1+bbQkHJmCkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGUDRAeUVCqj+Eu/nYljN5x7bAzyujdlLDlrvR9jRbAisLel3VLrlsx+7Dv2z4Xi7
 YQTqGJG9zOts8mfcWuCzZKsGmZhHBBii86LlkA9SYZjUU/hkMB8RxEYNUD9m0jLBUX
 gCrP0YCxeHoYobsZIXuGx55b4L2TwzKvGKBbH8+1CIvDbycgNuYYAyIKbWKR4C25UV
 FIR8mv/0pWfSLfa9G7SfLcSaznmqBM1WQDlIHM9D+OHkW4ssj34zdYCojqkWHZZKMD
 re1GfzQKR2j1pe1k0jl7lNhrns9I4/p9fzsKTzA5J4r1lcXbzyMZCyOK4PFE0vVLhz
 Nzz2MnFkfZ2QA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob support is
 enabled
Date: Tue, 13 Sep 2022 12:50:22 +0200
Message-Id: <20220913105022.81953-5-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913105022.81953-1-antonio.caggiano@collabora.com>
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


