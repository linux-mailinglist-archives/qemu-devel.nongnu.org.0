Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFD5E7C35
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:48:02 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obj27-0007jV-T0
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1obiyK-0003J1-LZ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:44:04 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:51288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1obiyH-0001ZQ-GN
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:44:04 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F0E16602249;
 Fri, 23 Sep 2022 14:43:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663940638;
 bh=eH8FQd+aNxSvn7jw39RMwXieOu3FtgSPJYS4kD0AOkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=drB8kcwUrgklcvNADN/s0XhUjXp9xUbF5eBUxopexhGN9EiI4jTEbsBUI2ybkBMd2
 1gvolaPGHxvdk6TZ4ZQtkCYYzEGq0+R00FqvnQ+I8wcZgTHgdIlOPJFfqGxE5BOM58
 mhvfS0jo5D9WEr+jD+D6r6L7z6++JAEhihZR83oxbZiyiGVVlASq6qUoHiR62iAlnq
 SZQazZ41CCcjYuNMbofVrShxRhloPjJKJYTmWLxc0LBf+47RehdbgWUIqI33Og9F6Y
 eztiTZw53SfebsXREInRj7+4aZAPFIb+c66y21eQk7gwgfk8bkjxcoXD8Qjch1KZds
 A/vBQBCGozeoA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 1/2] virtio-gpu: Unrealize
Date: Fri, 23 Sep 2022 15:43:49 +0200
Message-Id: <20220923134350.324402-2-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923134350.324402-1-antonio.caggiano@collabora.com>
References: <20220923134350.324402-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
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
 hw/display/virtio-gpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 20cc703dcc..412f0fb7ec 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1345,6 +1345,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->fenceq);
 }
 
+void virtio_gpu_device_unrealize(DeviceState *qdev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
+    VirtIOGPU *g = VIRTIO_GPU(qdev);
+
+    qemu_bh_delete(g->cursor_bh);
+    qemu_bh_delete(g->ctrl_bh);
+}
+
 void virtio_gpu_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1440,6 +1449,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
+    vdc->unrealize = virtio_gpu_device_unrealize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
     vdc->set_config = virtio_gpu_set_config;
-- 
2.34.1


