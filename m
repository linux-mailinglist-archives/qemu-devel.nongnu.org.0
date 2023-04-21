Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A769E6EA0DC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKj-0002gn-CV; Thu, 20 Apr 2023 21:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKN-0002ca-F0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:43 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKL-0008N3-7w
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:42 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-51f6461af24so1299482a12.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039560; x=1684631560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJb6pN/TSibQ3w1Gl1G/ulXh2/oAF2ihyHqUQmiUUD0=;
 b=VtdBXoNf8EXAu1hTUwSTT7qAZlfwyqfi/0r3FOiQ1W/GrawKUDmWUNYvdoOCg3P/pF
 +yUxs4GO9pLcj/cJu7APeqRGtUGmrnSvgzHXdpW4Z0Y92N0Vp0jkyUYP3pqISKqupoqJ
 /FHyDSYk2QpqIyWTNPZ8TFkAyZA5thCLnKIyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039560; x=1684631560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJb6pN/TSibQ3w1Gl1G/ulXh2/oAF2ihyHqUQmiUUD0=;
 b=R9XSKCY60VYRHT5cI/fzJkOxrNPX8CV1djC82P80ndmaXU8XPyztWBAlzseQ1w4p5k
 kS5q48GETd5dzw51W+0udc5E5l95KMsrpNusZSlMBktaQ+6SOmYTeKyZJBUmJNxHAsLl
 ziiQ8VtJO+5cbmjKJslpz5UUrT7b9vx+q844GpvwjxzRVsdOZ3dTbD2e29pLua391PCW
 b+lfIZ2TYE1Z5vkPCLMgWDwndlvHM9J/SvI7fsKhwSWnh6DVeUha+SYtPvi54G6rx3C+
 7cJyNWAXPjKBHixxPtVrOJsH3d0EX+TgjKZAK69K8zFTDFsWW37/XEhoHwLCqupw92WP
 lljQ==
X-Gm-Message-State: AAQBX9erJP0e6K17fsvK0BY6Z+Uwyxxs67NkN1H0UmFoTa/52azHJF+z
 kniWpOhsQ4kzr5IkeFrWOXGmpF77PL4c5qsFI7X3tnm0
X-Google-Smtp-Source: AKy350a/e9I+LS6fyYFFJ3otd43DyvHG+K9NAIAjBTellfF4f7dvlydBRcVjX1w0D7kz/4nYvDmLUQ==
X-Received: by 2002:a17:90a:8993:b0:246:af1f:62ef with SMTP id
 v19-20020a17090a899300b00246af1f62efmr3322365pjn.5.1682039559817; 
 Thu, 20 Apr 2023 18:12:39 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:39 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 08/13] gfxstream + rutabaga prep: added need defintions,
 fields, and options
Date: Thu, 20 Apr 2023 18:12:18 -0700
Message-Id: <20230421011223.718-9-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pg1-x52d.google.com
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

This modifies the common virtio-gpu.h file have the fields and
defintions needed by gfxstream/rutabaga.  It also modifies VirtioGPUGL
to have the runtime options needed by rutabaga.  They are:

- a colon separated list of capset names, defined in the virtio spec
- a wayland socket path to enable guest Wayland passthrough

The command to run these would be:

-device virtio-vga-gl,capset_names=gfxstream:cross-domain, \
        wayland_socket_path=/run/user/1000/wayland-0,hostmem=8G  \

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-gl.c     | 2 ++
 include/hw/virtio/virtio-gpu.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 547e697333..15270b0c8a 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -29,6 +29,8 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
 static Property virtio_gpu_gl_properties[] = {
     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
+    DEFINE_PROP_STRING("capset_names", VirtIOGPUGL, capset_names),
+    DEFINE_PROP_STRING("wayland_socket_path", VirtIOGPUGL, wayland_socket_path),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 421733d751..a35ade3608 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -94,6 +94,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
     VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
+    VIRTIO_GPU_FLAG_RUTABAGA_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -106,6 +107,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_rutabaga_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RUTABAGA_ENABLED))
 #define virtio_gpu_hostmem_enabled(_cfg) \
     (_cfg.hostmem > 0)
 #define virtio_gpu_context_init_enabled(_cfg) \
@@ -217,6 +220,11 @@ struct VirtIOGPUGL {
 
     bool renderer_inited;
     bool renderer_reset;
+
+    char *capset_names;
+    char *wayland_socket_path;
+    uint32_t num_capsets;
+    void *rutabaga;
 };
 
 struct VhostUserGPU {
-- 
2.40.0.634.g4ca3ef3211-goog


