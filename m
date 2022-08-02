Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F37587A2B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:57:32 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoeZ-0008SG-R4
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXl-0001L3-1m
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXj-0002Mu-7q
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id z17so12467710wrq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=x448FCGsB6jl4t/PEZTiuqAxlBX+i+OighRCNvx3IrY=;
 b=a2o70i6ozgrkoN+0syJ6dPIbzVBJa9qJmDlahBv+BChgsvfUIast9YimY1+nJjhzEc
 Rp4qxINM/eb26p2DShObyo0xHy8Z6Xjbf16z+cMYY0Jwzn+Jx3tgAXZR3wBxQ46mwmlu
 dkJW5rcJmxcRC218sQeh0E8GOlL/p740hcxz4qFWgUB22oCwxARhtBpcXRM17NZ+7bOA
 gcRP2QgKO4lbjWf9Vt5ohl/Nhbg2bg8VrU5/KiGdeK/9WX+EnRaUlVNZzx0ym1FM9FPB
 9MIdIqitVw3Hnxjih5SB5O0z4Io9GkYyAmpHXRLoJlLmioTXu4XmGwfRPohyVHqSZYWt
 E7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=x448FCGsB6jl4t/PEZTiuqAxlBX+i+OighRCNvx3IrY=;
 b=oNBjFJufNuIVCjqUwPV9bVVSGlVGxgUJI0OtgJyNEpJ/njb7pRCsTksqqJuA/S272u
 A2wQ4t6jlBdbEL/4yqS9M7bOhRoZdh1bE1r3J+3lGzPxSDkNXq+Fr31OCVgjL9iFZhmT
 u7oGNDWR0Hf0xJYj5Idf+bxh0p94MZnLnTXHxa8wqldMhXDeNDuhXMJbl2WMcUUlvQs2
 TzpEJgELG8ecAHzJYfLIsuvGr4td+fC79Ni+Kd3yXvFQarqDfaj0R16lXSTOJlEGDFhH
 CZbu1GpA+VjUD6be+ngpoTuFAyfBdLKaBWvLa9IfAlfIPt+WY5e06OXcqRek8sx1yfom
 /RFw==
X-Gm-Message-State: ACgBeo3cF1lcWnr7Zl0VrSnCXsj5aJCPddJUWok7BcZ6AyUU4sHVnMq/
 B3kGaT6ThBjx1aHR6+kQ/Nnnqw==
X-Google-Smtp-Source: AA6agR5meWse+7HgSqjXMLgsqNKtCEqU4qvT3Btoa1U4hS/hLUVtFnxKbTW55JvlcxGDPBkv8TA0Aw==
X-Received: by 2002:a5d:6c63:0:b0:220:5e4d:c6e9 with SMTP id
 r3-20020a5d6c63000000b002205e4dc6e9mr7856582wrz.250.1659433826495; 
 Tue, 02 Aug 2022 02:50:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05600c21cc00b0039747cf8354sm17660436wmj.39.2022.08.02.02.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7FAFB1FFC2;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com (open list:virtiofs)
Subject: [PATCH v4 10/22] hw/virtio: move vm_running check to
 virtio_device_started
Date: Tue,  2 Aug 2022 10:49:58 +0100
Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

All the boilerplate virtio code does the same thing (or should at
least) of checking to see if the VM is running before attempting to
start VirtIO. Push the logic up to the common function to avoid
getting a copy and paste wrong.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h   | 5 +++++
 hw/virtio/vhost-user-fs.c    | 6 +-----
 hw/virtio/vhost-user-i2c.c   | 6 +-----
 hw/virtio/vhost-user-rng.c   | 6 +-----
 hw/virtio/vhost-user-vsock.c | 6 +-----
 hw/virtio/vhost-vsock.c      | 6 +-----
 6 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 9bb2485415..74e7ad5a92 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -100,6 +100,7 @@ struct VirtIODevice
     VirtQueue *vq;
     MemoryListener listener;
     uint16_t device_id;
+    /* @vm_running: current VM running state via virtio_vmstate_change() */
     bool vm_running;
     bool broken; /* device in invalid state, needs reset */
     bool use_disabled_flag; /* allow use of 'disable' flag when needed */
@@ -376,6 +377,10 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
         return vdev->started;
     }
 
+    if (!vdev->vm_running) {
+        return false;
+    }
+
     return status & VIRTIO_CONFIG_S_DRIVER_OK;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index e513e4fdda..d2bebba785 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -122,11 +122,7 @@ static void vuf_stop(VirtIODevice *vdev)
 static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (fs->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 6020eee093..b930cf6d5e 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -93,11 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
 static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (i2c->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 3a7bf8e32d..a9c1c4bc79 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -90,11 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
 static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (rng->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 0f8ff99f85..22c1616ebd 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -55,11 +55,7 @@ const VhostDevConfigOps vsock_ops = {
 static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (vvc->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 0338de892f..8031c164a5 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -70,13 +70,9 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
 static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+    bool should_start = virtio_device_started(vdev, status);
     int ret;
 
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
-
     if (vvc->vhost_dev.started == should_start) {
         return;
     }
-- 
2.30.2


