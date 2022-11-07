Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8861F2B6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:15:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os11B-00058q-CH; Mon, 07 Nov 2022 07:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os119-000586-9b
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:14:19 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os116-0005Hs-Vd
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:14:19 -0500
Received: by mail-wr1-x435.google.com with SMTP id z14so15906446wrn.7
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 04:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFCsyExQ//XpqZxSiU1dFxN6RC2odVQF6gPqeaRbPxk=;
 b=R0r4Zsb8TFLYlYNZo8TCB9XS042cnktbOK0r000VDsKmNB0K2FL4q4WuSP3YWBNrFZ
 rQETTyQJQCw/WulRxJFhqRvZJh+erVZOIgY/mUU4r86ZfPLREG6lwQrR8vrR3HJ+AEzq
 a+7EXCGW3VO6brgkFfTMn5vqv03xj9FhaLeL1ZFtTLZ4uNWW7qMiMpbNs0hzGVneqgu7
 xPiEO8Abxhp/t7geEVILaZYztnsyg3kKOckdJ3Td/S45sFAXFRc0MkpMGAm0Md8PR2RK
 5/Yher0n5hFMiLaUnDcVh4Z2WoioA1lAPMBfO34AVNY+5UXQthsRVuTAsQsx9otZ/m3C
 ql7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFCsyExQ//XpqZxSiU1dFxN6RC2odVQF6gPqeaRbPxk=;
 b=iCJwsZw+KODp17M6/QZkbVFbzHXCMzCPlCj+TLn50dDhsAoxh2R2hjl3r4RTqEDUQE
 PcKnBFcWG57ip+rFZFBoUKJgjU8+jvO1GBOp7A8VhOOYnV0uHuVPA+QPVEkSb33ANmFj
 +yTddzyaGPqEVUtuZ9RS9WyiYX6GshlhRi9ZPrYNVgwuSnYJi9nXUZHuI9Fl5J7qiulf
 5gvLGPLUEkaAbf4BoTUixja1rO1Oq324IX1HMxNPuGnvs0fUxrhku8x4XjjU4RO0BrgX
 T95sy4EVEQ9Mw0pkiFLw88graAxadtsYhEnY8Wbvus9zpsW4CsI+XjV0m4fLlNTNe1V0
 E1Aw==
X-Gm-Message-State: ACrzQf2ugq4USPaM9ME4+yQQfPb2dOkssE47ljW2I4JFpD5gnF0Ur/Ru
 lmmpvyL5myKlgeIAxB4IkFFcKA==
X-Google-Smtp-Source: AMsMyM7cHC+PNFVQ8Uv8zriOabAkmCCyowO1PxrJ61eITR0zMkkB/N5gjpfx7YGHQr5DDLAyKP21qw==
X-Received: by 2002:adf:ef86:0:b0:238:a9cb:2903 with SMTP id
 d6-20020adfef86000000b00238a9cb2903mr13573940wro.560.1667823255307; 
 Mon, 07 Nov 2022 04:14:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b003b4a68645e9sm12704966wmq.34.2022.11.07.04.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 04:14:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB31E1FFB7;
 Mon,  7 Nov 2022 12:14:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 qemu-block@nongnu.org (open list:Block layer core),
 virtio-fs@redhat.com (open list:virtiofs)
Subject: [RFC PATCH] hw/virtio: introduce virtio_device_should_start
Date: Mon,  7 Nov 2022 12:14:07 +0000
Message-Id: <20221107121407.1010913-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The previous fix to virtio_device_started revealed a problem in its
use by both the core and the device code. The core code should be able
to handle the device "starting" while the VM isn't running to handle
the restoration of migration state. To solve this duel use introduce a
new helper for use by the vhost-user backends who all use it to feed a
should_start variable.

We can also pick up a change vhost_user_blk_set_status while we are at
it which follows the same pattern.

Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
---
 include/hw/virtio/virtio.h   | 18 ++++++++++++++++++
 hw/block/vhost-user-blk.c    |  6 +-----
 hw/virtio/vhost-user-fs.c    |  2 +-
 hw/virtio/vhost-user-gpio.c  |  2 +-
 hw/virtio/vhost-user-i2c.c   |  2 +-
 hw/virtio/vhost-user-rng.c   |  2 +-
 hw/virtio/vhost-user-vsock.c |  2 +-
 hw/virtio/vhost-vsock.c      |  2 +-
 8 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f41b4a7e64..3191c618f3 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -389,6 +389,24 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
         return vdev->started;
     }
 
+    return status & VIRTIO_CONFIG_S_DRIVER_OK;
+}
+
+/**
+ * virtio_device_should_start() - check if device startable
+ * @vdev - the VirtIO device
+ * @status - the devices status bits
+ *
+ * This is similar to virtio_device_started() but also encapsulates a
+ * check on the VM status which would prevent a device starting
+ * anyway.
+ */
+static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
+{
+    if (vdev->use_started) {
+        return vdev->started;
+    }
+
     if (!vdev->vm_running) {
         return false;
     }
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 13bf5cc47a..8feaf12e4e 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -222,14 +222,10 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
 static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
     Error *local_err = NULL;
     int ret;
 
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
-
     if (!s->connected) {
         return;
     }
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ad0f91c607..1c40f42045 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -123,7 +123,7 @@ static void vuf_stop(VirtIODevice *vdev)
 static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 8b40fe450c..677d1c7730 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -152,7 +152,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
 static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     trace_virtio_gpio_set_status(status);
 
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index bc58b6c0d1..864eba695e 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -93,7 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
 static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index bc1f36c5ac..8b47287875 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -90,7 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
 static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 7b67e29d83..9431b9792c 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -55,7 +55,7 @@ const VhostDevConfigOps vsock_ops = {
 static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 7dc3c73931..aa16d584ee 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -70,7 +70,7 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
 static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
     int ret;
 
     if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
-- 
2.34.1


