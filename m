Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8FF5463EC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:37:30 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzc1C-0005ZH-1F
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapx-00008x-4T
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapv-0001qE-Ck
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654852905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTTJvnegxxvfJsWseZ7+SmUjba5GRnY9ME/e3uOvaP0=;
 b=imjBiHtSoLqoauq8RYIYjARRrN02krEVHWekcPUK74s2DuPbNdvpF9ecIfH5YxCtpaWx+s
 MrGmqdUupAg2uJKp8mrWKHZDSRWoGnvKAwaAdMmkHAX+cGVOYDHFjKhFcI+Q3OzlV56bCB
 qnsnB79H6+wDJsW3GjmSL8hILkcdaKE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-qygipjx1NYupOP8hE8i2Jw-1; Fri, 10 Jun 2022 05:21:42 -0400
X-MC-Unique: qygipjx1NYupOP8hE8i2Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F31F01C05AB7;
 Fri, 10 Jun 2022 09:21:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A49F140D2827;
 Fri, 10 Jun 2022 09:21:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6241F1800865; Fri, 10 Jun 2022 11:20:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 15/17] ui/console: Do not return a value with ui_info
Date: Fri, 10 Jun 2022 11:20:41 +0200
Message-Id: <20220610092043.1874654-16-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The returned value is not used and misleading.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220226115516.59830-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h         | 2 +-
 hw/display/virtio-gpu-base.c | 6 +++---
 hw/display/virtio-vga.c      | 5 ++---
 hw/vfio/display.c            | 8 +++-----
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index c44b28a972ca..642d6f5248cf 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -432,7 +432,7 @@ typedef struct GraphicHwOps {
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
     void (*update_interval)(void *opaque, uint64_t interval);
-    int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
+    void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
 
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 790cec333c8c..b21d6e5b0be8 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -69,12 +69,12 @@ static void virtio_gpu_notify_event(VirtIOGPUBase *g, uint32_t event_type)
     virtio_notify_config(&g->parent_obj);
 }
 
-static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+static void virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 {
     VirtIOGPUBase *g = opaque;
 
     if (idx >= g->conf.max_outputs) {
-        return -1;
+        return;
     }
 
     g->req_state[idx].x = info->xoff;
@@ -92,7 +92,7 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 
     /* send event to guest */
     virtio_gpu_notify_event(g, VIRTIO_GPU_EVENT_DISPLAY);
-    return 0;
+    return;
 }
 
 static void
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index c206b5da384b..4dcb34c4a740 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -47,15 +47,14 @@ static void virtio_vga_base_text_update(void *opaque, console_ch_t *chardata)
     }
 }
 
-static int virtio_vga_base_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+static void virtio_vga_base_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 {
     VirtIOVGABase *vvga = opaque;
     VirtIOGPUBase *g = vvga->vgpu;
 
     if (g->hw_ops->ui_info) {
-        return g->hw_ops->ui_info(g, idx, info);
+        g->hw_ops->ui_info(g, idx, info);
     }
-    return -1;
 }
 
 static void virtio_vga_base_gl_block(void *opaque, bool block)
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index 89bc90508fb8..78f4d82c1c35 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -106,14 +106,14 @@ err:
     return;
 }
 
-static int vfio_display_edid_ui_info(void *opaque, uint32_t idx,
-                                     QemuUIInfo *info)
+static void vfio_display_edid_ui_info(void *opaque, uint32_t idx,
+                                      QemuUIInfo *info)
 {
     VFIOPCIDevice *vdev = opaque;
     VFIODisplay *dpy = vdev->dpy;
 
     if (!dpy->edid_regs) {
-        return 0;
+        return;
     }
 
     if (info->width && info->height) {
@@ -121,8 +121,6 @@ static int vfio_display_edid_ui_info(void *opaque, uint32_t idx,
     } else {
         vfio_display_edid_update(vdev, false, 0, 0);
     }
-
-    return 0;
 }
 
 static void vfio_display_edid_init(VFIOPCIDevice *vdev)
-- 
2.36.1


