Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144415A166F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 18:13:10 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRFTh-0001Sc-8D
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 12:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oRFR7-0006uO-2A
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:10:29 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:53164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oRFR4-000490-SM
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:10:28 -0400
Received: from dellino.fritz.box (host-95-235-60-93.retail.telecomitalia.it
 [95.235.60.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C80C56601EAD;
 Thu, 25 Aug 2022 17:10:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661443823;
 bh=57kr8Z/T1KRB+B0OrzcC/0fewSqexB3LHayzhQfgcWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nu0FkSzeFvG4u1zkIJjjW5jYSNQiMHOBCdMOSFGawDtS+y9Cn0KrhrOA13azCwLtv
 e77Dovt/pEtj+nqhJBYPa1nK+pE8npAfvG/TxegmQ23xdhkWH3Lia7n7Q+iGxmokxp
 Np+y9uok3fy63KNHceeHCcIY1FZBWWZ0mR00VmiKorXVx2DI5WqdmX8VYaXW1cxxW4
 FUF91wgmrIqhC6TOwiRkKnE913o9lOtxOgRvHwgiHBkTET3z0zvxGR3xDk/pi1K8zM
 ZUbLWVKdEXKCFip0pHPoSzoA2ff7S1SqDniUxnxCjXl3nhnyItZrOMfKOuiAtHZ4mE
 2rYYfAUNmg6DA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 1/1] virtio-gpu: CONTEXT_INIT feature
Date: Thu, 25 Aug 2022 18:10:13 +0200
Message-Id: <20220825161013.385296-2-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825161013.385296-1-antonio.caggiano@collabora.com>
References: <20220825161013.385296-1-antonio.caggiano@collabora.com>
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

Create virgl renderer context with flags using context_id when valid.

v2:
- The feature can be enabled via the context_init config option.
- A warning message will be emitted and the feature will not be used
  when linking with virglrenderer versions without context_init support.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-base.c   |  3 +++
 hw/display/virtio-gpu-virgl.c  | 19 +++++++++++++++++--
 hw/display/virtio-gpu.c        |  2 ++
 include/hw/virtio/virtio-gpu.h |  3 +++
 meson.build                    | 18 ++++++++++++++++++
 5 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index a29f191aa8..6c5f1f327f 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_context_init_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 73cb92c8d5..d70a0006b1 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -97,8 +97,23 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
                                     cc.debug_name);
 
-    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
-                                  cc.debug_name);
+    if (cc.context_init) {
+#if VIRGL_RENDERER_HAS_CONTEXT_INIT
+        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
+                                                 cc.context_init,
+                                                 cc.nlen,
+                                                 cc.debug_name);
+        return;
+#else
+        qemu_log_mask(LOG_UNIMP,
+                      "Virglrenderer %d.%d.%d does not support context-init\n",
+                      VIRGL_RENDERER_VERSION_MAJOR,
+                      VIRGL_RENDERER_VERSION_MINOR,
+                      VIRGL_RENDERER_VERSION_MICRO);
+#endif
+    }
+    
+    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
 }
 
 static void virgl_cmd_context_destroy(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 20cc703dcc..fa667ec234 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1424,6 +1424,8 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2e28507efe..c6f5cfde47 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_context_init_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
diff --git a/meson.build b/meson.build
index 20fddbd707..0d834ff027 100644
--- a/meson.build
+++ b/meson.build
@@ -718,6 +718,24 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
+
+  if virgl.found()
+    virgl_compile_args = [
+      '-DVIRGL_RENDERER_VERSION_MAJOR=' + virgl.version().split('.')[0],
+      '-DVIRGL_RENDERER_VERSION_MINOR=' + virgl.version().split('.')[1],
+      '-DVIRGL_RENDERER_VERSION_MICRO=' + virgl.version().split('.')[2],
+    ]
+    if cc.has_function('virgl_renderer_context_create_with_flags',
+                       prefix: '#include <virglrenderer.h>',
+                       dependencies: virgl)
+                       message('context_init')
+      virgl_compile_args += ['-DVIRGL_RENDERER_HAS_CONTEXT_INIT']
+    endif
+
+    virgl = declare_dependency(version: virgl.version(),
+                               compile_args: virgl_compile_args,
+                               dependencies: virgl)
+  endif
 endif
 curl = not_found
 if not get_option('curl').auto() or have_block
-- 
2.34.1


