Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A95EAA3B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:20:27 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpuE-0001Wq-4W
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2I-0003x2-D0
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:42 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:33180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2E-00044k-Kk
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:42 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D1F7D6602261;
 Mon, 26 Sep 2022 15:24:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664202276;
 bh=yyEkMbpfoyqOC7Bjvc1demiUi5fDwZG9YfIFnDv7TqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDj69LVdt1OfS8MOiI3ZD3oZishsIaiMHKY724/u1DhzWEB6VNgEHkI+8Op5o1fF+
 WX0L3F16HOAd9zv58xPk6ovpvmnA+hl815N3mfniMexRYnf8VqRUY2h/kld6ufCw7z
 OfYOozTGCNt9nyxAcfBwxQUUto5lj6WKqIHo+AAP6Bug1QXdIUnGhd7O3UPUUguckc
 yPz5LbtoTUSURpPxgfchuC+3x+zlXcWeN7GiXxjA0jwPmdicx5vhiIbTuw7ccoemFu
 KeUFaaxMkwhhIiihov+00ptaNUao9r4SKf0A60dK/FDyjprbvu1ED5Dbkn/Gp/u8zW
 QrJ5qJvTFG+fA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 9/9] virtio-gpu: Get EGL Display callback
Date: Mon, 26 Sep 2022 16:24:22 +0200
Message-Id: <20220926142422.22325-10-antonio.caggiano@collabora.com>
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

Implement get_egl_display callback for virglrenderer.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-virgl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 0f17bdddd0..0fd9ad8a3d 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -18,6 +18,7 @@
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
 #include "hw/virtio/virtio-iommu.h"
+#include <epoxy/egl.h>
 
 #include <virglrenderer.h>
 
@@ -743,12 +744,18 @@ static int virgl_make_context_current(void *opaque, int scanout_idx,
                                    qctx);
 }
 
+static void *virgl_get_egl_display(void *opaque)
+{
+    return eglGetCurrentDisplay();
+}
+
 static struct virgl_renderer_callbacks virtio_gpu_3d_cbs = {
-    .version             = 1,
+    .version             = 4,
     .write_fence         = virgl_write_fence,
     .create_gl_context   = virgl_create_context,
     .destroy_gl_context  = virgl_destroy_context,
     .make_current        = virgl_make_context_current,
+    .get_egl_display     = virgl_get_egl_display,
 };
 
 static void virtio_gpu_print_stats(void *opaque)
-- 
2.34.1


