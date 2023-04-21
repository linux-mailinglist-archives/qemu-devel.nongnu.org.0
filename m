Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CC6EA0D4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:13:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKo-0002i3-Po; Thu, 20 Apr 2023 21:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKV-0002eL-CD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:52 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKP-0008O6-Ti
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a6ebc66ca4so14052365ad.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039564; x=1684631564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIaMG88FZ7ZzQ9tREuZQMJNFNXVSeS7yq+zL/NQHUzg=;
 b=CodcqKhYaGr2c0hTW89XnTNyGkHt+zan+b6iMyODJeTYLqrm0vTsS4oYO9Il7kRAVM
 kqmFWE8KWvlpUXfChQfmEHYIhrN9sbImr8Tzh8xVch+9jRpaVbOmtvGXDlDFrSJYXOxp
 ElL+C3LdlsVLhRNECKBaCmPxzWoSW2/CshMZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039564; x=1684631564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIaMG88FZ7ZzQ9tREuZQMJNFNXVSeS7yq+zL/NQHUzg=;
 b=PBUJUEoqzNkcLnENETElRq+X7A0KpqYsdIun9URKQK1STWLI1PSrI++YsC5GdeFCAx
 K/2Yv+qlz8vL4lxNK89o4jbaTDbq1/BQjd18bYmWY9EHGZK5NV0Ot9YKgndzqNzQF9J4
 KLp41J2xxB56IxS8ViSfrPYhnullPQB9bu2CdIw9l5ZFMjUpyV0jhoIExcDviVv42uPN
 7i2SYygA4s1w26rZ0IGFfZ19OB0DCN5G5qlOBDo7iRR3lC1O3zpgsU0U2Sr2fYu/1pZZ
 qQl7faImg1ArJ1HMa0aEzdRUbor3WRZxDzYyxeatXRYhClGbLfztbeg4IAeQxJKI1oUE
 Y3jA==
X-Gm-Message-State: AAQBX9cZvohCF0KYL6O7Rh7Nw0wrp/Rp2NuDgljTi4u4x1CoP1HjV8VO
 5V7AnLrRujBA9iYJY1McoLUQhId0MNsufooK/15TYVue
X-Google-Smtp-Source: AKy350aHqYU2+Sg0xoEGbYUeVTKh3HQXuH5Y1Ss0rRQLGSzoBhNGZbDZ9wjFazOu3nLHIyk5/3McaQ==
X-Received: by 2002:a17:902:c951:b0:19e:8566:ea86 with SMTP id
 i17-20020a170902c95100b0019e8566ea86mr3964062pla.62.1682039564482; 
 Thu, 20 Apr 2023 18:12:44 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:44 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 11/13] gfxstream + rutabaga: enable rutabaga
Date: Thu, 20 Apr 2023 18:12:21 -0700
Message-Id: <20230421011223.718-12-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x62d.google.com
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

This change enables rutabaga to receive virtio-gpu-3d hypercalls
when it is active.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-base.c | 3 ++-
 hw/display/virtio-gpu-gl.c   | 9 ++++++++-
 hw/display/virtio-gpu.c      | 5 +++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 6c5f1f327f..7913d9b82e 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -206,7 +206,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
 {
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(vdev);
 
-    if (virtio_gpu_virgl_enabled(g->conf)) {
+    if (virtio_gpu_virgl_enabled(g->conf) ||
+        virtio_gpu_rutabaga_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_VIRGL);
     }
     if (virtio_gpu_edid_enabled(g->conf)) {
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 15270b0c8a..fc09900ed9 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,7 +23,14 @@
 
 static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
 {
-    virtio_gpu_virgl_device_realize(qdev, errp);
+    VirtIOGPUGL *virtio_gpu = VIRTIO_GPU_GL(qdev);
+    virtio_gpu->rutabaga = NULL;
+    virtio_gpu_rutabaga_device_realize(qdev, errp);
+
+    /* Fallback to virgl if rutabaga fails to initialize */
+    if (!virtio_gpu->rutabaga) {
+        virtio_gpu_virgl_device_realize(qdev, errp);
+    }
 }
 
 static Property virtio_gpu_gl_properties[] = {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 938eed9181..3e92f9db6b 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1314,8 +1314,9 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
     if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
-        if (!virtio_gpu_have_udmabuf()) {
-            error_setg(errp, "cannot enable blob resources without udmabuf");
+        if (!virtio_gpu_have_udmabuf() &&
+            !virtio_gpu_rutabaga_enabled(g->parent_obj.conf)) {
+            error_setg(errp, "need udmabuf or rutabaga for blob resources");
             return;
         }
 
-- 
2.40.0.634.g4ca3ef3211-goog


