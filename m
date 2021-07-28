Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2593D8F94
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:51:07 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jxi-0004qK-2D
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8juD-0005d1-4s
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:47:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8ju4-0005Tl-Mw
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:47:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 8D8CA1F4384C
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] virtio-gpu: Initialize Venus
Date: Wed, 28 Jul 2021 15:46:33 +0200
Message-Id: <20210728134634.2142156-8-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable VirGL unstable APIs and request Venus when initializing VirGL.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-virgl.c | 2 +-
 meson.build                   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index beb4b7d106..ea903172dd 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -621,7 +621,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
 
-    ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
+    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
     if (ret != 0) {
         return ret;
     }
diff --git a/meson.build b/meson.build
index f2e148eaf9..31b65050b7 100644
--- a/meson.build
+++ b/meson.build
@@ -483,6 +483,7 @@ if not get_option('virglrenderer').auto() or have_system
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
+  add_project_arguments('-DVIRGL_RENDERER_UNSTABLE_APIS', language : 'c')
 endif
 curl = not_found
 if not get_option('curl').auto() or have_block
-- 
2.30.2


