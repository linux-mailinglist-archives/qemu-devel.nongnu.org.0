Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAEC6F1CE0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:49:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRH2-0001Dr-Oz; Fri, 28 Apr 2023 12:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGt-0001C6-So
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGq-0004qo-QL
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:34 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a667067275so1394035ad.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682700511; x=1685292511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LV+7JElJ2Xmp+gBFLwDwvQU7tYwdJTHOJNNsbADmNr4=;
 b=VxGyUWmkedNPbX7MurxRCRfPhJwXXdJ/RUjjnUXg2akmuG44HCZTfgK3Fgji18Kq9K
 NVB1KS9JcpF9tLndn/+MKbxzxVgUkU48u85l/7G6tff2Ncz0qt5hlsJE0kuB+VXscJTi
 DK8LEjLuOQiGs2uFXps1/eHAtb9xLCkrsP0W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700511; x=1685292511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LV+7JElJ2Xmp+gBFLwDwvQU7tYwdJTHOJNNsbADmNr4=;
 b=lrEcaTfMJlj7FTvnnPZI26WWHjzfFalMC3CHnuRAmLjBehx9yBgaM/WXnRzlv70o97
 VAXCKgDRNlPmuvLe/F8w+rdG1Okq/fVVOsIN1CL1cGkb9CeyHeK/I9H/7uxJgOwCdkwb
 fsfkuWuUJKwzG1LQ5deih0A4H7CZ0cCQ1hOKQaxr8FD3W9poAYsY/hcvaTKORP6ODR0o
 ZPyje76ncKdIDpjzVl0HdWPUhc69ujNFkksceCg660wQoeqZ8tYNPYpRLaU/F0X9YtTo
 EA7cnGjcTsBG49dFo5bNTmyQBJGic+2+iaU3JoA0m7zGVdT3bxTd4ECZpIGVmi2hpjKr
 1ZFw==
X-Gm-Message-State: AC+VfDzB4KM1gsjOEJY0XkwjDYaPQL8iD5am+lx9MVEiI5H4PX8Y5JOZ
 bFDL6btu8NRLeNmVf8QNHNnCNi4YPDbhoRqO9lA=
X-Google-Smtp-Source: ACHHUZ48wb5KO5hyBIgDEMtOykyNajTbt1ll5UZoK9Pckepk/zFVSdEKeqAdi/dYQ+QXQS2MqHGrvg==
X-Received: by 2002:a17:902:e543:b0:1a9:5dfb:11c5 with SMTP id
 n3-20020a170902e54300b001a95dfb11c5mr6652450plf.35.1682700511171; 
 Fri, 28 Apr 2023 09:48:31 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:fdc4:a664:d93b:43db])
 by smtp.gmail.com with ESMTPSA id
 jf19-20020a170903269300b001a2806ae2f7sm13566796plb.83.2023.04.28.09.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:48:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [PATCH v2 5/5] virtio-gpu: CONTEXT_INIT feature
Date: Fri, 28 Apr 2023 09:48:23 -0700
Message-Id: <20230428164823.789-5-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230428164823.789-1-gurchetansingh@google.com>
References: <20230428164823.789-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
index d5808f2ab6..cf24d2e21b 100644
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
-- 
2.40.1.495.gc816e09b53d-goog


