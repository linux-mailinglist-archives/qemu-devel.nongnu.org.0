Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D232489B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:40:12 +0100 (CET)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5dT-00019K-AG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5Zz-0007Jp-0s
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:36:35 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5Zw-0004u6-Tt
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:36:34 -0500
Received: by mail-pl1-x62f.google.com with SMTP id ba1so2322425plb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEUljLDlicyF+K7oIs4yg0PWicD1HtbRXU5+ExPpqM0=;
 b=ZoJvd2jW3nO5+B/PpJogVx3zeat4YpJb5qzYnvfg211IncVUDazWpFPVItZzJbTYVf
 01a2Hmea37c4G95aJBJP/1XurVJ4RY+HQGtw9sqHU5DFYMmG6uBm0b1hNdmPKGOjElUg
 08ixLT2n+4LQqbcxCH7ddebtoR1rikgW6DTMLRozAZ8s/oDw/ArngAy/2h8uQ4Gomuwb
 XI4rsLP3vOyPzBDnJPqBZ42akWdQiDbwbwMlRzZz5oZW8cEsAS6SNYIqcsOxtYUcSqPt
 PaijyAumnC71cwafKcDLUIna7cSu2cJRsCeukHO4WQXIqxe++aSigV95anoQIUtFWYdb
 qriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oEUljLDlicyF+K7oIs4yg0PWicD1HtbRXU5+ExPpqM0=;
 b=tTHRgriVphXeKl2+84gmUsNRg3eiN79Bp2S2XcHLXTyJrEL1LKWKfVl6udyoDKkvym
 QqvhPSydu/aUYWdkA4+/p8I3FabGKhDx72T72gufOIyMpMAw3FDRSUI0o6WdyeF9HXu5
 pLRF0OPZTLRICNemveg9jIdpHOBlyE+VSSTGl0iXZm8L1YJdjRnezA3t10ZoOenRhemd
 yH+QJtB7Om3F70oJQBlBtUBvFD0A/atky0UbuVkiJ5F78r6heWGYIS8q/vCbSWenzuIh
 YPueOus6Gv/nM8mrodya6FTzJZ4tuROQG1ILCgOINgQm74ayb9SYR+ZGx6TxL8kiBgIw
 stoQ==
X-Gm-Message-State: AOAM53247lm4cAhwcWXB7VgV+l7jkwfMnOWfQ6Zt7jLrqvAhxOF6iU2K
 QhqSJR3KVvAllQt4iYAbbr24ZBEcW3esig==
X-Google-Smtp-Source: ABdhPJzEkBtA9VgyQFpMgKAqlehNult2QX80NY+VmMDcFk752JZJvnuquS3ULWdWxRUhgsnxZm5xmQ==
X-Received: by 2002:a17:903:228a:b029:da:d645:ab58 with SMTP id
 b10-20020a170903228ab02900dad645ab58mr871574plh.25.1614216989750; 
 Wed, 24 Feb 2021 17:36:29 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id 137sm3817135pgb.80.2021.02.24.17.36.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:36:29 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 3/3] virtio-gpu: Do not distinguish the primary console
Date: Thu, 25 Feb 2021 10:36:09 +0900
Message-Id: <20210225013609.73388-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210225013609.73388-1-akihiko.odaki@gmail.com>
References: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
 <20210225013609.73388-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62f.google.com
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
 hw/display/vhost-user-gpu.c  |  2 +-
 hw/display/virtio-gpu-3d.c   | 10 +++-------
 hw/display/virtio-gpu-base.c |  3 ---
 hw/display/virtio-gpu.c      | 12 +++++-------
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 3e911da795e..cb729ed5bc4 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -193,7 +193,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         s = &g->parent_obj.scanout[m->scanout_id];
         con = s->con;
 
-        if (m->scanout_id == 0 && m->width == 0) {
+        if (m->width == 0) {
             s->ds = qemu_create_placeholder_surface(640, 480,
                                                     "Guest disabled display.");
             dpy_gfx_replace_surface(con, s->ds);
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
index c1f17bec17e..f6c86cb75c6 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -325,7 +325,7 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     struct virtio_gpu_simple_resource *res;
-    DisplaySurface *ds = NULL;
+    DisplaySurface *ds;
 
     if (scanout->resource_id == 0) {
         return;
@@ -336,12 +336,10 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
         res->scanout_bitmask &= ~(1 << scanout_id);
     }
 
-    if (scanout_id == 0) {
-        /* primary head */
-        ds = qemu_create_placeholder_surface(scanout->width  ?: 640,
-                                             scanout->height ?: 480,
-                                             "Guest disabled display.");
-    }
+    /* primary head */
+    ds = qemu_create_placeholder_surface(scanout->width  ?: 640,
+                                         scanout->height ?: 480,
+                                         "Guest disabled display.");
     dpy_gfx_replace_surface(scanout->con, ds);
     scanout->resource_id = 0;
     scanout->ds = NULL;
-- 
2.24.3 (Apple Git-128)


