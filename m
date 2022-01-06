Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B064861D4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:09:41 +0100 (CET)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5OmC-0005nI-Hx
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:09:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n5OXO-0005lF-BH
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:54:22 -0500
Received: from [2607:f8b0:4864:20::52b] (port=36402
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n5OXL-0004n0-5E
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:54:21 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 200so2031459pgg.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XAjikOxmx33T46UFaieExUuxe+tuqxaaPcO/VN3/LAQ=;
 b=5+k97uGWwyj+UFeGvDmDqPOyO4ha6HJ03vebpm/X5NezesLsg3GcslYamK/2grRN/D
 n/0U0VjLzhjsYriwsmgfjdEHkqX/beN3IZYKBgfAYf9qw0V9BDx68UHEoGQa0UJL+hcN
 DXQ8MyU20hZqPb2jkH3gdpOro9MxQIH/M72hIaPph7ube7nDcpUt0PbGQbA9bdRd8EF/
 2fXANMzSbQpkd4TZeGu2lm6PxcMNeyDFoN3QWKAZswnfJoa0umHrBeB7T7tqmh0NQ8ix
 VJPyNBw7I1hLQdjpSJHAScTG7D2LCskZ3ToAid2EGSFD/3IHWk3tNcIIyJyM5CRX4QvZ
 IwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XAjikOxmx33T46UFaieExUuxe+tuqxaaPcO/VN3/LAQ=;
 b=u4nH1qxkFYk7+DQNsXaUsKTpWxlJlQpw7+nlxEqbcgY4Gkkk0Xz0wSvWyNyCiMdCFc
 X71//1fiANb19pkK3rpepnYyXhs7f+4b/HHq0rBA9jxU3l6Sku+ghRciNHKizX2Gd+7t
 AJXTXt+RFK+v3FECG+8KYq/hGSj+AFDNGoHPoqJcSoJGA7imUvY5pkjrxx2V+54RnBUp
 4qqrkEYuQAER7ATYvuN+xapguQKa2SixCGGrdvf6N6dZmzcsrRKdZ0JEpKb83G+5wjqz
 08xFbN+K0LuTa+6wsBUc8JQ0B88NWSVa1T6Wa4T9LOkEHv0HQSNSA6J2hA2LbPZe0esj
 XB/w==
X-Gm-Message-State: AOAM533sPVqF0PJJWmvqI3qB2XVGSKA3D/fPVJQJabnOf18rcYrCLAWY
 Oln6mq1kYj2nkx22VIo7ivEbXA==
X-Google-Smtp-Source: ABdhPJzSt7PLDzxiJtY2qi6qMmcf+3uz4So/rIWa8iq6V/JLN3QQBRuHpYMS50GlS0ZiBfbb0qgvtQ==
X-Received: by 2002:a63:8f02:: with SMTP id n2mr53380925pgd.270.1641459257742; 
 Thu, 06 Jan 2022 00:54:17 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id o11sm1474355pjs.9.2022.01.06.00.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 00:54:17 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, eblake@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 2/2] camera: v4l2: Introduce v4l2 camera driver
Date: Thu,  6 Jan 2022 16:53:04 +0800
Message-Id: <20220106085304.795010-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106085304.795010-1-pizhenwei@bytedance.com>
References: <20220106085304.795010-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On a Linux platform, user process could accesses /dev/videoX to
capture video frames.

We can run QEMU like this:
   qemu-system-x86_64 ... -cameradev v4l2,path=/dev/video0,id=camera0

To test a /dev/videoX device support video capture, install v4l-utils
package and run command:
 ~# v4l2-ctl --info -d /dev/video0
 ...
    Device Caps      : 0x04200001
            Video Capture
 ...

The basic logic of v4l2 driver:
   stream on -> qbuf -> dqbuf(drive by POLLIN event) -> qbuf -> dqbuf
     ... -> stream off

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 camera/meson.build  |   4 +
 camera/trace-events |   4 +
 camera/v4l2.c       | 637 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/camera.json    |  21 +-
 qemu-options.hx     |   3 +
 5 files changed, 667 insertions(+), 2 deletions(-)
 create mode 100644 camera/v4l2.c

diff --git a/camera/meson.build b/camera/meson.build
index d50ee5ebf7..6e7aeb5ebd 100644
--- a/camera/meson.build
+++ b/camera/meson.build
@@ -2,6 +2,10 @@ camera_ss.add([files(
   'camera.c',
 )])
 
+camera_ss.add(when: 'CONFIG_LINUX', if_true: files(
+  'v4l2.c',
+))
+
 camera_modules = {}
 foreach m : [
   ['builtin', cairo, files('builtin.c')],
diff --git a/camera/trace-events b/camera/trace-events
index 2f4d93e924..4527303d58 100644
--- a/camera/trace-events
+++ b/camera/trace-events
@@ -22,3 +22,7 @@ qemu_camera_enum_control_ret(const char *dev, int ret) "%s: ret %d"
 
 # builtin.c
 camera_builtin_timer(const char *dev) "%s: new image"
+
+# v4l2.c
+camera_v4l2_qbuf(const char *dev, uint32_t index) "%s: qbuf index %u"
+camera_v4l2_dqbuf(const char *dev, uint32_t index) "%s: qbuf index %u"
diff --git a/camera/v4l2.c b/camera/v4l2.c
new file mode 100644
index 0000000000..075ddafc16
--- /dev/null
+++ b/camera/v4l2.c
@@ -0,0 +1,637 @@
+/*
+ * V4L2 camera backend implemention
+ *
+ * Copyright 2021-2022 Bytedance, Inc.
+ *
+ * Authors:
+ *   zhenwei pi <pizhenwei@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qapi-visit-camera.h"
+#include "camera/camera.h"
+#include "camera-int.h"
+#include "trace.h"
+#include <linux/videodev2.h>
+#include <sys/ioctl.h>
+
+#define TYPE_CAMERA_V4L2 TYPE_CAMERADEV"-v4l2"
+
+#define CAMERA_V4L2_BUFFER_MAX 16
+#define CAMERA_V4L2_BUFFER_DEF 2
+
+typedef struct CameraV4l2Buffer {
+    unsigned char *addr;
+    uint32_t length;
+} CameraV4l2Buffer;
+
+typedef struct CameraV4l2 {
+    QEMUCamera parent;
+
+    int devfd;
+    size_t sizeimage;
+    uint8_t nbuffers;
+    CameraV4l2Buffer buffers[CAMERA_V4L2_BUFFER_MAX];
+} CameraV4l2;
+
+DECLARE_INSTANCE_CHECKER(CameraV4l2, CAMERA_V4L2_DEV, TYPE_CAMERA_V4L2)
+
+typedef struct CameraV4l2Ctrl {
+    QEMUCameraControlType q;
+    uint32_t v;
+} CameraV4l2Ctrl;
+
+static CameraV4l2Ctrl camera_v4l2_ctrl_table[] = {
+    { .q = QEMUCameraBrightness,
+      .v = V4L2_CID_BRIGHTNESS },
+    { .q = QEMUCameraContrast,
+      .v = V4L2_CID_CONTRAST },
+    { .q = QEMUCameraGain,
+      .v = V4L2_CID_GAIN },
+    { .q = QEMUCameraGamma,
+      .v = V4L2_CID_GAMMA },
+    { .q = QEMUCameraHue,
+      .v = V4L2_CID_HUE },
+    { .q = QEMUCameraHueAuto,
+      .v = V4L2_CID_HUE_AUTO },
+    { .q = QEMUCameraSaturation,
+      .v = V4L2_CID_SATURATION },
+    { .q = QEMUCameraSharpness,
+      .v = V4L2_CID_SHARPNESS },
+    { .q = QEMUCameraWhiteBalanceTemperature,
+      .v = V4L2_CID_WHITE_BALANCE_TEMPERATURE },
+};
+
+static QEMUCameraControlType camera_v4l2_control_to_qemu(uint32_t id)
+{
+    CameraV4l2Ctrl *ctrl;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(camera_v4l2_ctrl_table); i++) {
+        ctrl = &camera_v4l2_ctrl_table[i];
+        if (ctrl->v == id) {
+            return ctrl->q;
+        }
+    }
+
+    return QEMUCameraControlMax;
+}
+
+static uint32_t camera_qemu_control_to_v4l2(QEMUCameraControlType type)
+{
+    CameraV4l2Ctrl *ctrl;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(camera_v4l2_ctrl_table); i++) {
+        ctrl = &camera_v4l2_ctrl_table[i];
+        if (ctrl->q == type) {
+            return ctrl->v;
+        }
+    }
+
+    return 0;
+}
+
+static int camera_v4l2_enum_pixel_format(QEMUCamera *camera, uint32_t *pixfmts,
+                                         int npixfmt, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    struct v4l2_fmtdesc v4l2_fmt;
+    int index, total = 0;
+
+    for (index = 0; total < npixfmt; index++) {
+        v4l2_fmt.index = index;
+        v4l2_fmt.type = V4L2_CAP_VIDEO_CAPTURE;
+        if (ioctl(v4l2->devfd, VIDIOC_ENUM_FMT, &v4l2_fmt) < 0) {
+            if (errno == EINVAL) {
+                break; /* the last one */
+            }
+
+            error_setg(errp, "%s: enum fmt on device %s failed, %s",
+                       TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+            return -errno;
+        }
+
+        if (!qemu_camera_pixel_supported(v4l2_fmt.pixelformat)) {
+            continue;
+        }
+
+        pixfmts[total++] = v4l2_fmt.pixelformat;
+    }
+
+    return total;
+}
+
+static int camera_v4l2_enum_frame_size(QEMUCamera *camera, uint32_t pixfmt,
+                                       QEMUCameraFrameSize *frmszs, int nfrmsz,
+                                       Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    QEMUCameraFrameSize *frmsz;
+    struct v4l2_frmsizeenum v4l2_frmsz;
+    int index, total = 0;
+
+    if (!qemu_camera_pixel_supported(pixfmt)) {
+        return -EINVAL;
+    }
+
+    for (index = 0; total < nfrmsz; index++) {
+        v4l2_frmsz.index = index;
+        v4l2_frmsz.pixel_format = pixfmt;
+        if (ioctl(v4l2->devfd, VIDIOC_ENUM_FRAMESIZES, &v4l2_frmsz) < 0) {
+            if (errno == EINVAL) {
+                break; /* the last one */
+            }
+
+            error_setg(errp, "%s: enum frame size device %s failed, %s",
+                       TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+            return -errno;
+        }
+
+        if (v4l2_frmsz.type != V4L2_FRMSIZE_TYPE_DISCRETE) {
+            continue; /* TODO stepwise support in future*/
+        }
+
+        frmsz = frmszs + total++;
+        frmsz->pixel_format = v4l2_frmsz.pixel_format;
+        frmsz->type = QEMU_CAMERA_FRMSIZE_TYPE_DISCRETE;
+        frmsz->d.width = v4l2_frmsz.discrete.width;
+        frmsz->d.height = v4l2_frmsz.discrete.height;
+    }
+
+    return total;
+}
+
+static int camera_v4l2_enum_frame_interval(QEMUCamera *camera,
+                                           const QEMUCameraFormat *format,
+                                           QEMUCameraFrameInterval *frmivals,
+                                           int nfrmival, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    QEMUCameraFrameInterval *frmival;
+    struct v4l2_frmivalenum v4l2_frmival;
+    int index, total = 0;
+
+    for (index = 0; total < nfrmival; index++) {
+        v4l2_frmival.index = index;
+        v4l2_frmival.pixel_format = format->pixel_format;
+        v4l2_frmival.width = format->width;
+        v4l2_frmival.height = format->height;
+        if (ioctl(v4l2->devfd, VIDIOC_ENUM_FRAMEINTERVALS, &v4l2_frmival) < 0) {
+            if (errno == EINVAL) {
+                break; /* the last one */
+            }
+
+            error_setg(errp, "%s: enum frame intervals on device %s failed, %s",
+                       TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+            return -errno;
+        }
+
+        if (v4l2_frmival.type != V4L2_FRMIVAL_TYPE_DISCRETE) {
+            continue; /* TODO stepwise support in future*/
+        }
+
+        frmival = frmivals + total++;
+        frmival->pixel_format = v4l2_frmival.pixel_format;
+        frmival->type = QEMU_CAMERA_FRMIVAL_TYPE_DISCRETE;
+        frmival->width = v4l2_frmival.width;
+        frmival->height = v4l2_frmival.height;
+        frmival->d.numerator = v4l2_frmival.discrete.numerator;
+        frmival->d.denominator = v4l2_frmival.discrete.denominator;
+    }
+
+    return total;
+}
+
+static int camera_v4l2_get_format(QEMUCamera *camera, QEMUCameraFormat *format,
+                                  Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    struct v4l2_format v4l2_fmt = {.type = V4L2_BUF_TYPE_VIDEO_CAPTURE};
+    struct v4l2_pix_format *v4l2_pix = &v4l2_fmt.fmt.pix;
+
+    if (ioctl(v4l2->devfd, VIDIOC_G_FMT, &v4l2_fmt) < 0) {
+        error_setg(errp, "%s: get fmt on device %s failed, %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+        return -errno;
+    }
+
+    if (format) {
+        format->pixel_format = v4l2_pix->pixelformat;
+        format->width = v4l2_pix->width;
+        format->height = v4l2_pix->height;
+    }
+
+    v4l2->sizeimage = v4l2_pix->sizeimage;
+
+    return 0;
+}
+
+static int camera_v4l2_set_format(QEMUCamera *camera,
+                                  const QEMUCameraFormat *format, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    struct v4l2_format v4l2_fmt = {0};
+    struct v4l2_pix_format *v4l2_pix;
+
+    v4l2_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    v4l2_pix = &v4l2_fmt.fmt.pix;
+    v4l2_pix->pixelformat = format->pixel_format;
+    v4l2_pix->width = format->width;
+    v4l2_pix->height = format->height;
+    if (ioctl(v4l2->devfd, VIDIOC_S_FMT, &v4l2_fmt) < 0) {
+        error_setg(errp, "%s: set fmt on device %s failed, %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+        return -errno;
+    }
+
+    v4l2->sizeimage = v4l2_pix->sizeimage;
+
+    return 0;
+}
+
+static int camera_v4l2_set_frame_interval(QEMUCamera *camera,
+               const QEMUCameraFrameInterval *frmival, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    QEMUCameraFormat fmt;
+    struct v4l2_streamparm streamparm;
+    struct v4l2_captureparm *capture;
+    int ret;
+
+    if (frmival->type != QEMU_CAMERA_FRMIVAL_TYPE_DISCRETE) {
+        error_setg(errp, "%s: only support discrete mode", TYPE_CAMERA_V4L2);
+        return -ENOTSUP;
+    }
+
+    fmt.pixel_format = frmival->pixel_format;
+    fmt.width = frmival->width;
+    fmt.height = frmival->height;
+    ret = camera_v4l2_set_format(camera, &fmt, errp);
+    if (ret) {
+        return ret;
+    }
+
+    streamparm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    capture = &streamparm.parm.capture;
+    capture->timeperframe.numerator = frmival->d.numerator;
+    capture->timeperframe.denominator = frmival->d.denominator;
+    if (ioctl(v4l2->devfd, VIDIOC_S_PARM, &streamparm) < 0) {
+        error_setg(errp, "%s: set stream parm on device %s failed, %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int camera_v4l2_enum_control(QEMUCamera *camera,
+               QEMUCameraControl *controls, int ncontrols, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    QEMUCameraControl *control;
+    struct v4l2_queryctrl v4l2_ctrl = {0};
+    QEMUCameraControlType type;
+    int index, total = 0;
+
+    for (index = 0; total < ncontrols; index++) {
+        v4l2_ctrl.id |= V4L2_CTRL_FLAG_NEXT_CTRL;
+        if (ioctl(v4l2->devfd, VIDIOC_QUERYCTRL, &v4l2_ctrl) < 0) {
+            if (errno == EINVAL) {
+                break; /* the last one */
+            }
+
+            error_setg(errp, "%s: enum control on device %s failed, %s",
+                       TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+            return -errno;
+        }
+
+        if (v4l2_ctrl.flags & V4L2_CTRL_FLAG_INACTIVE) {
+            continue;
+        }
+
+        type = camera_v4l2_control_to_qemu(v4l2_ctrl.id);
+        if (type == QEMUCameraControlMax) {
+            continue;
+        }
+
+        control = controls + total++;
+        control->type = type;
+        control->def = v4l2_ctrl.default_value;
+        control->min = v4l2_ctrl.minimum;
+        control->max = v4l2_ctrl.maximum;
+        control->step = v4l2_ctrl.step;
+    }
+
+    return total;
+}
+
+static int camera_v4l2_set_control(QEMUCamera *camera,
+               const QEMUCameraControl *control, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    struct v4l2_control v4l2_ctrl;
+    uint32_t cid;
+
+    cid = camera_qemu_control_to_v4l2(control->type);
+    if (!cid) {
+        error_setg(errp, "%s: unsupported control type %d",
+                   TYPE_CAMERA_V4L2, control->type);
+        return -EINVAL;
+    }
+
+    v4l2_ctrl.id = cid;
+    v4l2_ctrl.value = control->cur;
+    if (ioctl(v4l2->devfd, VIDIOC_S_CTRL, &v4l2_ctrl) < 0) {
+        error_setg(errp, "%s: set ctrl on device %s failed, %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int camera_v4l2_qbuf(QEMUCamera *camera, int index)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    struct v4l2_buffer buffer = {0};
+
+    trace_camera_v4l2_qbuf(qemu_camera_id(camera), index);
+
+    buffer.index = index;
+    buffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    buffer.field = V4L2_FIELD_ANY;
+    buffer.memory = V4L2_MEMORY_MMAP;
+
+    return ioctl(v4l2->devfd, VIDIOC_QBUF, &buffer);
+}
+
+static int camera_v4l2_dqbuf(QEMUCamera *camera)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    struct v4l2_buffer buffer;
+
+    buffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    buffer.memory = V4L2_MEMORY_MMAP;
+
+    if (ioctl(v4l2->devfd, VIDIOC_DQBUF, &buffer) < 0) {
+        return -errno;
+    }
+
+    trace_camera_v4l2_dqbuf(qemu_camera_id(camera), buffer.index);
+
+    return buffer.index;
+}
+
+static void camera_v4l2_free_buffers(QEMUCamera *camera)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    struct v4l2_requestbuffers v4l2_reqbufs = {0};
+    CameraV4l2Buffer *buffer;
+    int index;
+
+    /* 1, try to dequeue all buffers */
+    for (index = 0; index < v4l2->nbuffers; index++) {
+        camera_v4l2_dqbuf(camera);
+    }
+
+    /* 2, try to unmap all buffers */
+    for (index = 0; index < v4l2->nbuffers; index++) {
+        buffer = &v4l2->buffers[index];
+        if (buffer->addr) {
+            munmap(buffer->addr, buffer->length);
+            buffer->addr = NULL;
+            buffer->length = 0;
+        }
+    }
+
+    /* 3, free all the v4l2 reqbufs */
+    v4l2_reqbufs.count = 0;
+    v4l2_reqbufs.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    v4l2_reqbufs.memory = V4L2_MEMORY_MMAP;
+    ioctl(v4l2->devfd, VIDIOC_REQBUFS, &v4l2_reqbufs);
+}
+
+static int camera_v4l2_request_buffers(QEMUCamera *camera, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    struct v4l2_requestbuffers v4l2_reqbufs = {0};
+    struct v4l2_buffer v4l2_buf;
+    CameraV4l2Buffer *buffer;
+    void *addr;
+    int index;
+
+    v4l2_reqbufs.count = v4l2->nbuffers;
+    v4l2_reqbufs.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    v4l2_reqbufs.memory = V4L2_MEMORY_MMAP;
+    if (ioctl(v4l2->devfd, VIDIOC_REQBUFS, &v4l2_reqbufs) < 0) {
+        return -errno;
+    }
+
+    for (index = 0; index < v4l2->nbuffers; index++) {
+        v4l2_buf.index = index;
+        v4l2_buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+        v4l2_buf.memory = V4L2_MEMORY_MMAP;
+        v4l2_buf.length = 0;
+        if (ioctl(v4l2->devfd, VIDIOC_QUERYBUF, &v4l2_buf) < 0) {
+            goto error;
+        }
+
+        if (v4l2_buf.type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+            continue; /* TODO V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE support */
+        }
+
+        addr = mmap(NULL, v4l2_buf.length, PROT_READ | PROT_WRITE, MAP_SHARED,
+                    v4l2->devfd, v4l2_buf.m.offset);
+        if (addr == MAP_FAILED) {
+            goto error;
+        }
+
+        if (camera_v4l2_qbuf(camera, index) < 0) {
+            goto error;
+        }
+
+        buffer = &v4l2->buffers[index];
+        buffer->addr = addr;
+        buffer->length = v4l2_buf.length;
+    }
+
+    return 0;
+
+error:
+    camera_v4l2_free_buffers(camera);
+
+    return -errno;
+}
+
+static void camera_v4l2_open(QEMUCamera *camera, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    struct v4l2_capability v4l2_cap = {0};
+
+    if (v4l2opts->has_buffers) {
+        if (!v4l2opts->buffers || v4l2opts->buffers > CAMERA_V4L2_BUFFER_MAX) {
+            error_setg(errp, "%s: zero buffers or too large(max %d)",
+                       TYPE_CAMERA_V4L2, CAMERA_V4L2_BUFFER_MAX);
+            return;
+        }
+
+        v4l2->nbuffers = v4l2opts->buffers;
+    } else {
+        v4l2->nbuffers = CAMERA_V4L2_BUFFER_DEF;
+    }
+
+    if (!v4l2opts->has_path) {
+        error_setg(errp, "%s: missing device path", TYPE_CAMERA_V4L2);
+        return;
+    }
+
+    v4l2->devfd = open(v4l2opts->path, O_RDWR | O_NONBLOCK);
+    if (v4l2->devfd == -1) {
+        error_setg(errp, "%s: open device %s failed, %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+        return;
+    }
+
+    if (ioctl(v4l2->devfd, VIDIOC_QUERYCAP, &v4l2_cap) < 0) {
+        error_setg(errp, "%s: query device %s failed, %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path, strerror(errno));
+        goto error;
+    }
+
+    if (!(v4l2_cap.capabilities & V4L2_CAP_VIDEO_CAPTURE) ||
+        !(v4l2_cap.device_caps & V4L2_CAP_VIDEO_CAPTURE)) {
+        error_setg(errp, "%s: %s is not a video capture device",
+                   TYPE_CAMERA_V4L2, v4l2opts->path);
+        goto error;
+    }
+
+    if (camera_v4l2_get_format(camera, NULL, errp) < 0) {
+        goto error;
+    }
+
+    return;
+
+error:
+    if (v4l2->devfd > 0) {
+        close(v4l2->devfd);
+    }
+}
+
+static void camera_v4l2_read_handler(void *opaque)
+{
+    QEMUCamera *camera = (QEMUCamera *)opaque;
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Buffer *buffer;
+    int index;
+
+    index = camera_v4l2_dqbuf(camera);
+    if (index < 0) {
+        return;
+    }
+
+    buffer = &v4l2->buffers[index];
+    qemu_camera_new_image(camera, buffer->addr, buffer->length);
+
+    camera_v4l2_qbuf(camera, index);
+}
+
+static void camera_v4l2_stream_on(QEMUCamera *camera, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    int type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+    qemu_camera_alloc_image(camera, v4l2->sizeimage, errp);
+
+    if (camera_v4l2_request_buffers(camera, errp)) {
+        return;
+    }
+
+    if (ioctl(v4l2->devfd, VIDIOC_STREAMON, &type) < 0) {
+        error_setg(errp, "%s: stream on failed on %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path);
+        camera_v4l2_free_buffers(camera);
+        return;
+    }
+
+    qemu_set_fd_handler(v4l2->devfd, camera_v4l2_read_handler, NULL, camera);
+}
+
+static void camera_v4l2_stream_off(QEMUCamera *camera, Error **errp)
+{
+    CameraV4l2 *v4l2 = CAMERA_V4L2_DEV(camera);
+    CameraV4l2Options *v4l2opts = &camera->dev->u.v4l2;
+    int type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+    qemu_set_fd_handler(v4l2->devfd, NULL, NULL, camera);
+
+    if (ioctl(v4l2->devfd, VIDIOC_STREAMOFF, &type) < 0) {
+        error_setg(errp, "%s: stream off failed on %s",
+                   TYPE_CAMERA_V4L2, v4l2opts->path);
+    }
+
+    camera_v4l2_free_buffers(camera);
+
+    qemu_camera_free_image(camera);
+}
+
+static void camera_v4l2_init(Object *obj)
+{
+}
+
+static void camera_v4l2_finalize(Object *obj)
+{
+    QEMUCamera *camera = CAMERADEV(obj);
+    Error *local_err = NULL;
+
+    camera_v4l2_stream_off(camera, &local_err);
+}
+
+static void camera_v4l2_class_init(ObjectClass *oc, void *data)
+{
+    QEMUCameraClass *klass = CAMERADEV_CLASS(oc);
+
+    klass->open = camera_v4l2_open;
+    klass->stream_on = camera_v4l2_stream_on;
+    klass->stream_off = camera_v4l2_stream_off;
+    klass->enum_pixel_format = camera_v4l2_enum_pixel_format;
+    klass->enum_frame_size = camera_v4l2_enum_frame_size;
+    klass->enum_frame_interval = camera_v4l2_enum_frame_interval;
+    klass->set_frame_interval = camera_v4l2_set_frame_interval;
+    klass->enum_control = camera_v4l2_enum_control;
+    klass->set_control = camera_v4l2_set_control;
+}
+
+static const TypeInfo camera_v4l2_type_info = {
+    .name = TYPE_CAMERA_V4L2,
+    .parent = TYPE_CAMERADEV,
+    .instance_size = sizeof(CameraV4l2),
+    .instance_init = camera_v4l2_init,
+    .instance_finalize = camera_v4l2_finalize,
+    .class_init = camera_v4l2_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&camera_v4l2_type_info);
+}
+
+type_init(register_types);
diff --git a/qapi/camera.json b/qapi/camera.json
index 6d189637f9..513bbb465e 100644
--- a/qapi/camera.json
+++ b/qapi/camera.json
@@ -9,6 +9,22 @@
 # = Camera
 ##
 
+##
+# @CameraV4l2Options:
+#
+# Options of the v4l2 camera.
+#
+# @path: video capture device path
+#
+# @buffers: buffer count of v4l2 driver
+#
+# Since: 6.3
+##
+{ 'struct': 'CameraV4l2Options',
+  'data': {
+    '*path': 'str',
+    '*buffers': 'uint32' } }
+
 ##
 # @ColorType:
 #
@@ -62,7 +78,7 @@
 # Since: 6.3
 ##
 { 'enum': 'CameradevDriver',
-  'data': [ 'builtin' ] }
+  'data': [ 'builtin', 'v4l2' ] }
 
 ##
 # @Cameradev:
@@ -81,4 +97,5 @@
     'driver':      'CameradevDriver'},
   'discriminator': 'driver',
   'data': {
-    'builtin':     'CameraBuiltinOptions' } }
+    'builtin':     'CameraBuiltinOptions',
+    'v4l2':        'CameraV4l2Options' } }
diff --git a/qemu-options.hx b/qemu-options.hx
index fa439134dc..60975d6c3d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3535,6 +3535,9 @@ DEF("cameradev", HAS_ARG, QEMU_OPTION_cameradev,
     "-cameradev help\n"
 #ifdef CONFIG_CAIRO
     "-cameradev builtin,id=id[,debug=true|false][,fps=FPS][,width=WIDTH][,height=HEIGHT][,mjpeg=true|false][,yuv=true|false][,rgb565=true|false][,bgcolor=blue|gree|red|rainbow|digital-rain]\n"
+#endif
+#ifdef CONFIG_LINUX
+    "-cameradev v4l2,id=id[,path=PATH][,buffers=COUNT]\n"
 #endif
     , QEMU_ARCH_ALL
 )
-- 
2.25.1


