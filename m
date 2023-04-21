Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38ED6EA0E0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKU-0002dX-Sj; Thu, 20 Apr 2023 21:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKP-0002dE-Hn
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:45 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKN-0008Ng-7s
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so1666207a12.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039561; x=1684631561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXY0t1sdRfO0Bja7CZEHyKYHZekZSXUgtaYjb6Qv2vI=;
 b=ai+yC73xbN5y2mUbJlOWqdztP4eW4XSWJT2GgEuUC+6O7WRTdZjUg3OvTCmq8ytRb3
 f7bMYZsDXvt1YZQLNaBSct62MGppKmy3idFly2lC+5sO62LTkObcAWiGSBiQRbBwnai9
 DXqkhWZnlEr4gPMmHu5nt2Lf+Nc+40udrVyQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039561; x=1684631561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXY0t1sdRfO0Bja7CZEHyKYHZekZSXUgtaYjb6Qv2vI=;
 b=FEYslvAbkyQUfXKnCZ/Gev87RmzF0C4yzgchDCszCpgvG3/Sg1tbRxKVoo9ryrf3JH
 gPdneZ+WSo2k7ITh6i8DjUyDDdqQHn2IPg+pGjTvHsRRyVy8XkAgVlKnirtI+Fzhz9CP
 pMjD10vqgGJpdvvga9PeKSOHwN49I7T0q0fbzLqyco5ZCL0fGobEbtN0k3Xp/zeA1jlc
 LPa/UamN3pa9FoC/lNHOy7sFLq5GaKT05rJCxiyt8RCJyCL5+U0a2AdNR6MSD2ALPtpj
 B7Q1DvrDEzEYFAKkCNzzuEsHVuEBEd6eC83ZG61RFvaPVnFr3EY68zted/7fP0Th6MuN
 9Ofw==
X-Gm-Message-State: AAQBX9c/k79SjrU64D0OmslkweQ+7cYMsr3l8FPNCkp07w+26kGqvQoT
 BEQkv9n/0WRLh1qAeNmQpHvUtSx6TGpRgclsBRO0aSK4
X-Google-Smtp-Source: AKy350b+atDUBAxIDdBUYZ8B5o+vmCDS071Zv2Ga7c8hBBFQkegilFV3f5SW9Oyvj70V2x2Zlf9//A==
X-Received: by 2002:a17:90a:5509:b0:247:a272:71d1 with SMTP id
 b9-20020a17090a550900b00247a27271d1mr3471120pji.7.1682039561419; 
 Thu, 20 Apr 2023 18:12:41 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:41 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 09/13] gfxstream + rutabaga: add required meson changes
Date: Thu, 20 Apr 2023 18:12:19 -0700
Message-Id: <20230421011223.718-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

- Add meson detection of rutabaga_gfx
- Compile stubs when rutabaga_gfx_ffi is not installed
- Compile stubs when virglrenderer is not installed

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/meson.build                 | 40 ++++++++++++++++++++------
 hw/display/virtio-gpu-rutabaga-stubs.c |  8 ++++++
 hw/display/virtio-gpu-virgl-stubs.c    |  8 ++++++
 include/hw/virtio/virtio-gpu.h         |  5 +++-
 meson.build                            |  8 ++++++
 meson_options.txt                      |  2 ++
 scripts/meson-buildoptions.sh          |  3 ++
 7 files changed, 64 insertions(+), 10 deletions(-)
 create mode 100644 hw/display/virtio-gpu-rutabaga-stubs.c
 create mode 100644 hw/display/virtio-gpu-virgl-stubs.c

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 4191694380..48785cfcb6 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -63,6 +63,8 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
 softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
 
+virgl_found = virgl.found() and opengl.found()
+rutabaga_found = rutabaga.found()
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
@@ -73,12 +75,27 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
-  if virgl.found() and opengl.found()
-    virtio_gpu_gl_ss = ss.source_set()
-    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
-                         if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
-    hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
+  virtio_gpu_gl_ss = ss.source_set()
+  if virgl_found or rutabaga_found
+    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU'],
+                         if_true: [files('virtio-gpu-gl.c'), pixman])
   endif
+
+  if virgl_found
+    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU'],
+                         if_true: [files('virtio-gpu-virgl.c'), virgl])
+  else
+    virtio_gpu_gl_ss.add([files('virtio-gpu-virgl-stubs.c')])
+  endif
+
+  if rutabaga_found
+    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU'],
+                         if_true: [files('virtio-gpu-rutabaga.c'), rutabaga])
+  else
+    virtio_gpu_gl_ss.add([files('virtio-gpu-rutabaga-stubs.c')])
+  endif
+
+  hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
@@ -89,9 +106,10 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
                         if_true: files('vhost-user-gpu-pci.c'))
   hw_display_modules += {'virtio-gpu-pci': virtio_gpu_pci_ss}
 
-  if virgl.found() and opengl.found()
+
+  if virgl_found or rutabaga_found
     virtio_gpu_pci_gl_ss = ss.source_set()
-    virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
+    virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI'],
                              if_true: [files('virtio-gpu-pci-gl.c'), pixman])
     hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
   endif
@@ -108,8 +126,12 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga': virtio_vga_ss}
 
   virtio_vga_gl_ss = ss.source_set()
-  virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
-                       if_true: [files('virtio-vga-gl.c'), pixman])
+
+  if virgl_found or rutabaga_found
+    virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA'],
+                         if_true: [files('virtio-vga-gl.c'), pixman])
+  endif
+
   virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
                                             if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
diff --git a/hw/display/virtio-gpu-rutabaga-stubs.c b/hw/display/virtio-gpu-rutabaga-stubs.c
new file mode 100644
index 0000000000..26c38d3892
--- /dev/null
+++ b/hw/display/virtio-gpu-rutabaga-stubs.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio-gpu.h"
+
+void virtio_gpu_rutabaga_device_realize(DeviceState *qdev, Error **errp)
+{
+    /* nothing (stub) */
+}
diff --git a/hw/display/virtio-gpu-virgl-stubs.c b/hw/display/virtio-gpu-virgl-stubs.c
new file mode 100644
index 0000000000..b29e35f990
--- /dev/null
+++ b/hw/display/virtio-gpu-virgl-stubs.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio-gpu.h"
+
+void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
+{
+    /* nothing (stub) */
+}
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index a35ade3608..034c71e8f5 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -300,7 +300,10 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              struct virtio_gpu_framebuffer *fb,
                              struct virtio_gpu_rect *r);
 
-/* virtio-gpu-3d.c */
+/* virtio-gpu-virgl.c or virtio-gpu-virgl-stubs.c */
 void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp);
+/* virtio-gpu-rutabaga.c or virtio-gpu-rutabaga-stubs.c */
+void virtio_gpu_rutabaga_device_realize(DeviceState *qdev, Error **errp);
+
 
 #endif
diff --git a/meson.build b/meson.build
index c44d05a13f..ba1c1905fb 100644
--- a/meson.build
+++ b/meson.build
@@ -777,6 +777,13 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
 endif
+rutabaga = not_found
+if not get_option('rutabaga_gfx').auto() or have_system or have_vhost_user_gpu
+  rutabaga = dependency('rutabaga_gfx_ffi',
+                         method: 'pkg-config',
+                         required: get_option('rutabaga_gfx'),
+                         kwargs: static_kwargs)
+endif
 blkio = not_found
 if not get_option('blkio').auto() or have_block
   blkio = dependency('blkio',
@@ -3963,6 +3970,7 @@ summary_info += {'PAM':               pam}
 summary_info += {'iconv support':     iconv}
 summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
+summary_info += {'rutabaga support':  rutabaga}
 summary_info += {'blkio support':     blkio}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..3b4249c2fe 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -213,6 +213,8 @@ option('vmnet', type : 'feature', value : 'auto',
        description: 'vmnet.framework network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('rutabaga_gfx', type : 'feature', value : 'auto',
+       description: 'rutabaga_gfx support')
 option('png', type : 'feature', value : 'auto',
        description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..ce35c44926 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -144,6 +144,7 @@ meson_options_help() {
   printf "%s\n" '  rbd             Ceph block device driver'
   printf "%s\n" '  rdma            Enable RDMA-based migration'
   printf "%s\n" '  replication     replication support'
+  printf "%s\n" '  rutabaga-gfx    rutabaga_gfx support'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
   printf "%s\n" '  seccomp         seccomp support'
@@ -394,6 +395,8 @@ _meson_option_parse() {
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
     --disable-rng-none) printf "%s" -Drng_none=false ;;
+    --enable-rutabaga-gfx) printf "%s" -Drutabaga_gfx=enabled ;;
+    --disable-rutabaga-gfx) printf "%s" -Drutabaga_gfx=disabled ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
     --disable-sdl) printf "%s" -Dsdl=disabled ;;
     --enable-sdl-image) printf "%s" -Dsdl_image=enabled ;;
-- 
2.40.0.634.g4ca3ef3211-goog


