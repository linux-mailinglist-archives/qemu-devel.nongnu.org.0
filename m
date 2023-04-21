Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD826EA0D5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:13:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKP-0002cc-Hi; Thu, 20 Apr 2023 21:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKL-0002bL-58
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:41 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKF-0008MB-R4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:40 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-51f597c97c5so1282399a12.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039553; x=1684631553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JR0TNlvN0Q7HJGAqqrRHfNCdk0Mlg/TBNVfhiBqdfsQ=;
 b=fYrWNOrFQsEGzlYRMZAT2/EbmPnjloBYibQ9Xk3tCg+LPY3+SMR4GPLHulxQMSSi9F
 1CzS3v1HoyIBSxY9uDCpXiqnOZ/2B9eFhfvN0KfaBobrja77xfSqFgUnW/cMbw4op82A
 jc6OuE+puIyY0fVVLqBfoZTzfS3NeGQSCY/ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039553; x=1684631553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JR0TNlvN0Q7HJGAqqrRHfNCdk0Mlg/TBNVfhiBqdfsQ=;
 b=YdVv7ZxMFVDLgMMhgIqcFCH6cJHs94Vq+kwEsj9fuSGQEvEMkgnb6063YqguLdB82C
 MkwML41GM4T+u106rDx61KWxxw5qlnxXfkapAUTi+GcMTkxeE2iKyPqbZEdIDBCVwkhU
 z/qfw/8XebOqt4d93mCS3KseQ+QjKmBSGVzjNUHLG/D4VxmUnvFBKPpDbuUJlag1siFY
 P3xiDjw6oprPvX7wsKDF85KXKU0P6F+IbrHp/y7FjSBw7mmcZ2VsbnrGUFUZSR3PinFE
 kQGrjZLZQbKaSwLCPxfu88NxIniDf/woLA2D+To05JN5PhPq9xSbVaOFwLSD5rxqpT8H
 ybEQ==
X-Gm-Message-State: AAQBX9eSSSTmqFzx1BQa8VzW0zL/9Tyq7I78mjqrxcJLg1Uys39qe+Yi
 eKw7U0Uco1HpCOktNI+nJrTikdw1zyjAg0HgdHsDBfyq
X-Google-Smtp-Source: AKy350YC8dooTZS+VUOi3yAR4i/VOznAebA6XHBaO4JCiK9BfYb4PjLAKf01UwCLk50HdT9TBxk0YA==
X-Received: by 2002:a17:90b:3a88:b0:247:6023:f884 with SMTP id
 om8-20020a17090b3a8800b002476023f884mr3577333pjb.15.1682039553353; 
 Thu, 20 Apr 2023 18:12:33 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:33 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 04/13] virtio-gpu: CONTEXT_INIT feature
Date: Thu, 20 Apr 2023 18:12:14 -0700
Message-Id: <20230421011223.718-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pg1-x52e.google.com
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

From: Antonio Caggiano <antonio.caggiano@collabora.com>

The feature can be enabled when a backend wants it.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-base.c   | 3 +++
 include/hw/virtio/virtio-gpu.h | 3 +++
 2 files changed, 6 insertions(+)

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
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 326988e4d5..adee17968d 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -93,6 +93,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -107,6 +108,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
 #define virtio_gpu_hostmem_enabled(_cfg) \
     (_cfg.hostmem > 0)
+#define virtio_gpu_context_init_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
-- 
2.40.0.634.g4ca3ef3211-goog


