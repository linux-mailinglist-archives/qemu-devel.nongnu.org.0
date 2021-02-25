Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93796324DC5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:18:20 +0100 (CET)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDit-0006Pr-JQ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDeR-0001rq-Ux
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:43 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFDeQ-0008Cy-8e
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:43 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t25so3483528pga.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qe7V9NX2D2tPRuYtggPsQjNU/bEiJn0CIOtYm4LfNUs=;
 b=I+M27bZfc8r5jw76LfXHG2CMpmW518brFuMixdztRvqRAkMiNNFYFxYIejXiufikiJ
 eQpKQfj8TymMNAYPH2HhmvTp8xWQMaXDyS3q1qs/ZRCI6SSRzTXML6lrTKZDamrEHVGK
 9j234pxexLTOoDfrFh4LG84KNziHBpvpOPAvAsqvrwx2f5GntdAjmnXOya6AxDZBfOZJ
 Kto0JNMwoZDmrlVs8sjzz3h5nrGVUtzVMuwr7++bHBRvsJfla/ATx9ujymuGuUIrCSL8
 0zCE9LFzLPWo11SjfACCUGDPDDg3aFSN2R/L3mrBcq3rvW68wntPRHxpl+VqPVIVQMVM
 8h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qe7V9NX2D2tPRuYtggPsQjNU/bEiJn0CIOtYm4LfNUs=;
 b=IXs9VVrxfCtPfaK5n9j8r7HX1ho7IHc7byqFex21eC9t/YE0PPp0RjuDfslgdczQDd
 tAJsFnrqs45jDrmQ5PgzQOdPk81dLxh4wJKZf9Pg3Ua2PVKqpZnNLlXTOEy68/H/nvKJ
 x6REK0Nej0WfFilhCgg6ornIR2Y3kkpGFyQLpxjMHKfIGbMstpYbqR4oBnL2bD4CWR9g
 50KrJl9PycoJvgW08Nl22iU0dMQbYkB/O56LpkcJehAbgm31hz7a0pu946I88Tlyq4/7
 vZPtcrPUnI1gSdTvqd+A/GgH6oYgbpo0Sr0HbjETgQ6h08CPqBYSKwb/kJrQwiA8jHsD
 24eQ==
X-Gm-Message-State: AOAM5339809SRmDJfS/TFgJpllnYdFtTiVWTYBm0Xt6TMBUPEkZIRcAM
 /ZskBwjZ7qejdASmwGLvcFV/iai+MOgH7Q==
X-Google-Smtp-Source: ABdhPJyJqdJ73TBUte9Hi2zFe959VUP83oTFZe+6ubKJMoWWA9QnpEL4x0NkOytq1AsgZZZEIKezqw==
X-Received: by 2002:a62:602:0:b029:1ed:d3fb:7edb with SMTP id
 2-20020a6206020000b02901edd3fb7edbmr2641509pfg.22.1614248020735; 
 Thu, 25 Feb 2021 02:13:40 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id o18sm5630833pjq.44.2021.02.25.02.13.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:13:40 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v4 3/3] virtio-gpu: Do not distinguish the primary console
Date: Thu, 25 Feb 2021 19:13:16 +0900
Message-Id: <20210225101316.83940-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210225101316.83940-1-akihiko.odaki@gmail.com>
References: <20210225101316.83940-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the past, virtio-gpu set NULL as the surface for the secondary
consoles to hide its window. The distinction is now handled in
ui/console and the display backends and virtio-gpu does no longer
have to do that.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/vhost-user-gpu.c  |  6 ++----
 hw/display/virtio-gpu-3d.c   | 10 +++-------
 hw/display/virtio-gpu-base.c |  3 ---
 hw/display/virtio-gpu.c      |  9 +--------
 4 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 3e911da795e..a01f9315e19 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -193,10 +193,8 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         s = &g->parent_obj.scanout[m->scanout_id];
         con = s->con;
 
-        if (m->scanout_id == 0 && m->width == 0) {
-            s->ds = qemu_create_placeholder_surface(640, 480,
-                                                    "Guest disabled display.");
-            dpy_gfx_replace_surface(con, s->ds);
+        if (m->width == 0) {
+            dpy_gfx_replace_surface(con, NULL);
         } else {
             s->ds = qemu_create_displaysurface(m->width, m->height);
             /* replace surface on next update */
diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index 0b0c11474dd..9eb489077b1 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -179,10 +179,8 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
             info.width, info.height,
             ss.r.x, ss.r.y, ss.r.width, ss.r.height);
     } else {
-        if (ss.scanout_id != 0) {
-            dpy_gfx_replace_surface(
-                g->parent_obj.scanout[ss.scanout_id].con, NULL);
-        }
+        dpy_gfx_replace_surface(
+            g->parent_obj.scanout[ss.scanout_id].con, NULL);
         dpy_gl_scanout_disable(g->parent_obj.scanout[ss.scanout_id].con);
     }
     g->parent_obj.scanout[ss.scanout_id].resource_id = ss.resource_id;
@@ -595,9 +593,7 @@ void virtio_gpu_virgl_reset(VirtIOGPU *g)
 
     virgl_renderer_reset();
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
-        if (i != 0) {
-            dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
-        }
+        dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
         dpy_gl_scanout_disable(g->parent_obj.scanout[i].con);
     }
 }
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 4a57350917c..25f8920fdb6 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -193,9 +193,6 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     for (i = 0; i < g->conf.max_outputs; i++) {
         g->scanout[i].con =
             graphic_console_init(DEVICE(g), i, &virtio_gpu_ops, g);
-        if (i > 0) {
-            dpy_gfx_replace_surface(g->scanout[i].con, NULL);
-        }
     }
 
     return true;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c1f17bec17e..c9f5e36fd07 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -325,7 +325,6 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     struct virtio_gpu_simple_resource *res;
-    DisplaySurface *ds = NULL;
 
     if (scanout->resource_id == 0) {
         return;
@@ -336,13 +335,7 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
         res->scanout_bitmask &= ~(1 << scanout_id);
     }
 
-    if (scanout_id == 0) {
-        /* primary head */
-        ds = qemu_create_placeholder_surface(scanout->width  ?: 640,
-                                             scanout->height ?: 480,
-                                             "Guest disabled display.");
-    }
-    dpy_gfx_replace_surface(scanout->con, ds);
+    dpy_gfx_replace_surface(scanout->con, NULL);
     scanout->resource_id = 0;
     scanout->ds = NULL;
     scanout->width = 0;
-- 
2.24.3 (Apple Git-128)


