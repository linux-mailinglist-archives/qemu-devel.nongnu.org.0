Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542D4C55BE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:58:29 +0100 (CET)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNviW-000424-H4
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfp-000225-2d
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:41 -0500
Received: from [2607:f8b0:4864:20::1033] (port=46875
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfn-00042N-Hh
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:40 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so7155681pjw.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 03:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vVq5QSmFweuWNBdaYFtPRKPL3G9SHsp3hf2KVemRVo=;
 b=Y2+1zlnn4e2aOoUS/40z8+sK0+GHbu2IDCJKBrw6ym7cvsqogLskQzaDpI+4NzPStq
 fCbnbPNjpS36ByBqAxPA3Gf8FAnZmhZ2W0GtHN1NTpBTd7WVcEuZaenGC0xNiRH4IFJv
 0BRaqXxTI1LUCWMjoDXvUKnRRWslB1bWM2VTUWrUhKoHbU6y3XaXjZ4dsKOVWE8cMm/p
 5/GLFLpLWK4kefelCJte5v93tlm9W76ZeWNXM7jrEjfpcteMxKi9CugiZKrMycPZKTIh
 FHMnpOSu2GQtwB9yhO2uIrLa+UpcqUTPBKJ52O8Twk/GCCeAzB1u+OyouiJWxDXvQ521
 sXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vVq5QSmFweuWNBdaYFtPRKPL3G9SHsp3hf2KVemRVo=;
 b=vIAs03gHXPaMe9B3N+CZC3ptfQAvwmt0VcLqKmLpSK/rxm2n06NjrKPExTl01ZRVEe
 2/p0/oCSdJQukkhaMColk6fVtUiVXusDtx+T1BwpmJyi169aS1Te7ZUXLv0oin6I86Z8
 nvCYu+Md68bSN1xnHU4fD/JfgGxHaWE/7TebVuLUo0AGXIshmGeGyZUDPV9JnexUYyye
 hhC6TL+gm85hD5z/mppAOOzB4oNe5Q+8PRpF8YckRihMOmtpcurn4yup+k5PXVec22Yl
 D6tY5n69nJreuVvWhpgZdPysZv9drHaidQkh+jgLg0vgrQm1qU1FkDI2JbIhKIo/ogJa
 xIHA==
X-Gm-Message-State: AOAM533B1qNrrYuBiSq9/cDotTx6ZnyJzifqpt3NT1ue0ygm2HBNyDbd
 X8SUyDzyi3HCZTakf2+3G8Xx4E0IAX0=
X-Google-Smtp-Source: ABdhPJzv9vpq6EwhjOpHjxz1l51nFl8tdgYInJJ4xyQ8eyJ/15tOXY5qM2/17GCtdoEvEc2qD2VD8g==
X-Received: by 2002:a17:902:9045:b0:14f:14e7:f3aa with SMTP id
 w5-20020a170902904500b0014f14e7f3aamr11257393plz.69.1645876538010; 
 Sat, 26 Feb 2022 03:55:38 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 1/3] ui/console: Do not return a value with ui_info
Date: Sat, 26 Feb 2022 20:55:14 +0900
Message-Id: <20220226115516.59830-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226115516.59830-1-akihiko.odaki@gmail.com>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The returned value is not used and misleading.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/virtio-gpu-base.c | 6 +++---
 hw/display/virtio-vga.c      | 5 ++---
 hw/vfio/display.c            | 8 +++-----
 include/ui/console.h         | 2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index fff0fb4a828..c73b3aa06b8 100644
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
index 5a2f7a45408..84433d3557e 100644
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
index 89bc90508fb..78f4d82c1c3 100644
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
diff --git a/include/ui/console.h b/include/ui/console.h
index f590819880b..7f5374380f0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -427,7 +427,7 @@ typedef struct GraphicHwOps {
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
     void (*update_interval)(void *opaque, uint64_t interval);
-    int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
+    void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
 
-- 
2.32.0 (Apple Git-132)


