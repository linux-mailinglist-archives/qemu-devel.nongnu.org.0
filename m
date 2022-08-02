Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88213587A9C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:24:42 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIp4r-0004fn-LE
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohH-0004tZ-ER
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohF-0006DB-8K
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id z17so12497650wrq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BeukRfDDjs+xL5noIXV/lsICwMCkD6JOsmbjcLzfdS8=;
 b=CUwEGBL5C/JqKOJP/LBMM278xBWStj22K4nHZJAPkribGRw5iqexJFwPZBAez6ibLv
 tNuauOhaPA2UjJQ6D1uvPaeLHajCB3Lgbfawg71HQK7VJAWY+9CMjY82mR0IbUE7vYS6
 fOYcNr8VdOPJ3eQCQBBA01JYLuIiFyHN2/dw5cauOp9PnvR4prnLwoW2ASx0rZoF5Daf
 Hb/jvCbdN8YL+ioeD+/Xxy1pcIeyMbelgel1uePoQsxMpQj0IBDykKW6k2fB7ODlvTQQ
 EtG5wesmUXzLPr49JjyOsEYJf+tuBQKn5w6ykduLhArNfvOOt47S9o6U8/+vbfnZXdVR
 2PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BeukRfDDjs+xL5noIXV/lsICwMCkD6JOsmbjcLzfdS8=;
 b=PUW75qpbWQVVdNUONw/dD0mEHtKz2+7QUWE2U5K7a+OjBg6lvoHaE0KApi5VmZfEvy
 IAJEqE2aoDEekJv3OqBrOT0Vrx6EbQ7REYZ18xYwRXE1L+5UERDeKQ9iC6W47K9u1Ug7
 Fm44x9898lsgfjYxQE/CvyWNbJEDpHwA3C5LjTpBmdhupOZ4ite1CrDCxTqUqGEN/UBf
 lIfWqBmiYLGD+Rd6e+How6sZQ+O9kXJgY9xkji33frTdd/ah42beogfin/kb7RIHusIj
 bfDcRDGlMrexsSTKF87fSiitCuEPh89HancnYRTz/aWqCZJnrOks+XmyRTrIIprSm38t
 EEtw==
X-Gm-Message-State: ACgBeo0XO8T9S5oJIsMv+BK83b/xLZAoiJyVw9tEHDhWoZShoT0szvQF
 uD4pg3/gH35qJPz9l9BLjU0J7A==
X-Google-Smtp-Source: AA6agR44fKH6EUhIbL5qmGxJ2mI7kf0rVMdw6Q8m0ArqbP4W6WOJZtpFfZcfLdnjr4+9Ov38zWz6FQ==
X-Received: by 2002:adf:e542:0:b0:21e:c148:3ef2 with SMTP id
 z2-20020adfe542000000b0021ec1483ef2mr12520966wrm.533.1659434415386; 
 Tue, 02 Aug 2022 03:00:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffb84000000b0021e51c039c5sm14656208wrr.80.2022.08.02.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:00:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEF741FFC3;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 virtio-fs@redhat.com (open list:virtiofs)
Subject: [PATCH v4 11/22] hw/virtio: move vhd->started check into helper and
 add FIXME
Date: Tue,  2 Aug 2022 10:49:59 +0100
Message-Id: <20220802095010.3330793-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
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

The `started` field is manipulated internally within the vhost code
except for one place, vhost-user-blk via f5b22d06fb (vhost: recheck
dev state in the vhost_migration_log routine). Mark that as a FIXME
because it introduces a potential race. I think the referenced fix
should be tracking its state locally.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost.h      | 12 ++++++++++++
 hw/block/vhost-user-blk.c      | 10 ++++++++--
 hw/scsi/vhost-scsi.c           |  4 ++--
 hw/scsi/vhost-user-scsi.c      |  2 +-
 hw/virtio/vhost-user-fs.c      |  3 ++-
 hw/virtio/vhost-user-i2c.c     |  4 ++--
 hw/virtio/vhost-user-rng.c     |  4 ++--
 hw/virtio/vhost-user-vsock.c   |  2 +-
 hw/virtio/vhost-vsock-common.c |  3 ++-
 hw/virtio/vhost-vsock.c        |  2 +-
 10 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 586c5457e2..61b957e927 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -94,6 +94,7 @@ struct vhost_dev {
     uint64_t protocol_features;
     uint64_t max_queues;
     uint64_t backend_cap;
+    /* @started: is the vhost device started? */
     bool started;
     bool log_enabled;
     uint64_t log_size;
@@ -165,6 +166,17 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
  */
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
+/**
+ * vhost_dev_is_started() - report status of vhost device
+ * @hdev: common vhost_dev structure
+ *
+ * Return the started status of the vhost device
+ */
+static inline bool vhost_dev_is_started(struct vhost_dev *hdev)
+{
+    return hdev->started;
+}
+
 /**
  * vhost_dev_start() - start the vhost device
  * @hdev: common vhost_dev structure
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..2bba42478d 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -229,7 +229,7 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
         return;
     }
 
-    if (s->dev.started == should_start) {
+    if (vhost_dev_is_started(&s->dev) == should_start) {
         return;
     }
 
@@ -286,7 +286,7 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    if (s->dev.started) {
+    if (vhost_dev_is_started(&s->dev)) {
         return;
     }
 
@@ -415,6 +415,12 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
              * the vhost migration code. If disconnect was caught there is an
              * option for the general vhost code to get the dev state without
              * knowing its type (in this case vhost-user).
+             *
+             * FIXME: this is sketchy to be reaching into vhost_dev
+             * now because we are forcing something that implies we
+             * have executed vhost_dev_stop() but that won't happen
+             * until vhost_user_blk_stop() gets called from the bh.
+             * Really this state check should be tracked locally.
              */
             s->dev.started = false;
         }
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 3059068175..bdf337a7a2 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -120,7 +120,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev, uint8_t val)
         start = false;
     }
 
-    if (vsc->dev.started == start) {
+    if (vhost_dev_is_started(&vsc->dev) == start) {
         return;
     }
 
@@ -147,7 +147,7 @@ static int vhost_scsi_pre_save(void *opaque)
 
     /* At this point, backend must be stopped, otherwise
      * it might keep writing to memory. */
-    assert(!vsc->dev.started);
+    assert(!vhost_dev_is_started(&vsc->dev));
 
     return 0;
 }
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 1b2f7eed98..bc37317d55 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -49,7 +49,7 @@ static void vhost_user_scsi_set_status(VirtIODevice *vdev, uint8_t status)
     VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
     bool start = (status & VIRTIO_CONFIG_S_DRIVER_OK) && vdev->vm_running;
 
-    if (vsc->dev.started == start) {
+    if (vhost_dev_is_started(&vsc->dev) == start) {
         return;
     }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index d2bebba785..ad0f91c607 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -20,6 +20,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
+#include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
@@ -124,7 +125,7 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
     VHostUserFS *fs = VHOST_USER_FS(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (fs->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
         return;
     }
 
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index b930cf6d5e..bc58b6c0d1 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -95,7 +95,7 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (i2c->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
         return;
     }
 
@@ -174,7 +174,7 @@ static void vu_i2c_disconnect(DeviceState *dev)
     }
     i2c->connected = false;
 
-    if (i2c->vhost_dev.started) {
+    if (vhost_dev_is_started(&i2c->vhost_dev)) {
         vu_i2c_stop(vdev);
     }
 }
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index a9c1c4bc79..bc1f36c5ac 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -92,7 +92,7 @@ static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (rng->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
         return;
     }
 
@@ -160,7 +160,7 @@ static void vu_rng_disconnect(DeviceState *dev)
 
     rng->connected = false;
 
-    if (rng->vhost_dev.started) {
+    if (vhost_dev_is_started(&rng->vhost_dev)) {
         vu_rng_stop(vdev);
     }
 }
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 22c1616ebd..7b67e29d83 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -57,7 +57,7 @@ static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (vvc->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
     }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 7394818e00..29b9ab4f72 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -14,6 +14,7 @@
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
+#include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
@@ -199,7 +200,7 @@ int vhost_vsock_common_pre_save(void *opaque)
      * At this point, backend must be stopped, otherwise
      * it might keep writing to memory.
      */
-    assert(!vvc->vhost_dev.started);
+    assert(!vhost_dev_is_started(&vvc->vhost_dev));
 
     return 0;
 }
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 8031c164a5..7dc3c73931 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -73,7 +73,7 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
     bool should_start = virtio_device_started(vdev, status);
     int ret;
 
-    if (vvc->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
     }
 
-- 
2.30.2


