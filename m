Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7D5EA9E4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:13:14 +0200 (CEST)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpnE-0005Fy-RX
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2E-0003pa-S7
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:38 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:33172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2D-00044F-8C
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:38 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C832660225E;
 Mon, 26 Sep 2022 15:24:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664202273;
 bh=JS0Ve7s4ciIEACFsL6MbD6nY7syAF1LoJp9WfZQ0O6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ur58yp7hfI8RUIkPaOEVwctDrQBwo7h7PPpRTL5//L5PXr6mBpGsUQX3/bNkJiwsx
 GTg5TMD01J20RZoJNRMrfgWKUnZXR0fX6OEk09e/St3Ci4YNecPZYO38LNH47aKQtD
 ftBXd6Sho/en6O8BeaR4PMzsnfYkWT5VSana6FZCf6CGqXMgAbmznisILE4LVYIIvz
 9yb3GY3nUfbLWeS1Aolg5XlFl2sdCmuscCd8oO6dIHIrWriIQDtqf3957buVzM5Oll
 gFMYobUvFONHMj3NFnVSktX3NQpZdkc2/b4/Akv2DtCNry4c3Yc1+seLcpNcf/Byxf
 Dexi+p3ioIBdw==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 5/9] virtio-gpu: Unrealize
Date: Mon, 26 Sep 2022 16:24:18 +0200
Message-Id: <20220926142422.22325-6-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926142422.22325-1-antonio.caggiano@collabora.com>
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
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

Implement an unrealize function for virtio gpu device.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
v3: Call virtio_gpu_base_device_unrealize from virtio_gpu_device_unrealize

 hw/display/virtio-gpu-base.c   |  2 +-
 hw/display/virtio-gpu.c        | 11 +++++++++++
 include/hw/virtio/virtio-gpu.h |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 6c5f1f327f..5cb71e71ad 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -230,7 +230,7 @@ virtio_gpu_base_set_features(VirtIODevice *vdev, uint64_t features)
     trace_virtio_gpu_features(((features & virgl) == virgl));
 }
 
-static void
+void
 virtio_gpu_base_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(qdev);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 92cd96582e..f1772a15bb 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1349,6 +1349,16 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->fenceq);
 }
 
+static void virtio_gpu_device_unrealize(DeviceState *qdev)
+{
+    VirtIOGPU *g = VIRTIO_GPU(qdev);
+
+    qemu_bh_delete(g->cursor_bh);
+    qemu_bh_delete(g->ctrl_bh);
+
+    virtio_gpu_base_device_unrealize(qdev);
+}
+
 void virtio_gpu_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1447,6 +1457,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
+    vdc->unrealize = virtio_gpu_device_unrealize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
     vdc->set_config = virtio_gpu_set_config;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index a23efb9568..e9281c75f3 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -246,6 +246,7 @@ bool virtio_gpu_base_device_realize(DeviceState *qdev,
                                     VirtIOHandleOutput ctrl_cb,
                                     VirtIOHandleOutput cursor_cb,
                                     Error **errp);
+void virtio_gpu_base_device_unrealize(DeviceState *qdev);
 void virtio_gpu_base_reset(VirtIOGPUBase *g);
 void virtio_gpu_base_fill_display_info(VirtIOGPUBase *g,
                         struct virtio_gpu_resp_display_info *dpy_info);
-- 
2.34.1


