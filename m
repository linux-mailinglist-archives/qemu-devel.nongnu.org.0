Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173446EAA1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:06:19 +0100 (CET)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKzy-0007fU-6Y
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:06:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqo-0002r6-Su
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:50 -0500
Received: from [2a00:1450:4864:20::32b] (port=40919
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqk-0001aI-0b
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so6742634wmj.5
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8QmRx9+DNSp2O4mYDU/ok11SEV2qs8UF4yTcNX4blo=;
 b=E5OJOrZitnuGnRdRRbJhXnX2GTDYIChslnxRaqybWBcFa2uI5qW93v8vvNVpkAZq8J
 Dn9NGR5qS+N8KVHHW9jW+f9Z3r4iEzGP7AGOCwdNcFv1Mpr3E31GW5pD307zhPPFjKmS
 3FQ3uEKn0hJ36qmH9xef+1AKYESzNPTHCFlA+G1I0GdWCKy+5DXCHF7VnR+yxRwvhMdA
 26fpSo/6VSmYuapHPM3KnUx0jCuIuc6maC5qt7HN5QrDVfpfWTFIpPvsYRLG3WToVfE8
 fqbc1tzyrsBVj868BCZXYrkbmlwrGxpDqG2XlcP8q3pMhq+Wb0nojwyeqnKMJ6/5H+Bw
 oJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8QmRx9+DNSp2O4mYDU/ok11SEV2qs8UF4yTcNX4blo=;
 b=ZHj+1DelmF1zD8YDzvu7pzOqukagnh0Qfnb9HOvxeRKRDj25vbpOs8DbwcVaDSoe+A
 ZPwxQE/1kQn33hbOy22HVdVVVGNwXmpnUHYvi1ryUkZ64xbbLgGmDn812TVZ2ffdd6E+
 3WaVIkvwTylXGRwwYcggoVSD5uj+49/eB5SW0LSBV1Nmg3cwDS22z3a+xWNn1hUrekz2
 Z8iIm0uSr/RIuLfBGVj5O46GX/J6vdCRUxCMTGMQVP7r60D8klSWfx6zRdI5e5akAlyH
 OgFpPxIeYFUesvvhc8QLqVNRCAeS83+LoxwC3ov0kOxxNrQg3tjPel/JzNcBSmjJ6eQ2
 saWw==
X-Gm-Message-State: AOAM532ZysJMf55UD2mcXtscg6+Zo3U7X/tMF3HrungwZfCMLzeXta5x
 swLBjkB8T7VTmAnz/YNKT/Msmw==
X-Google-Smtp-Source: ABdhPJw11eBu25TZ0yIENvTKgifMQDbKLmR52fOC9tyX15zxds7FKV0JLLBcrDkUjF2S7nhNp17fMQ==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr8142088wmx.54.1639061803610; 
 Thu, 09 Dec 2021 06:56:43 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:43 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 8/8] tools/vhost-user-video: Add initial vhost-user-video vmm
Date: Thu,  9 Dec 2021 14:56:01 +0000
Message-Id: <20211209145601.331477-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 PDS_OTHER_BAD_TLD=1.861, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This vmm translates from virtio-video v3 protocol and writes
to a v4l2 mem2mem stateful decoder/encoder device [1]. v3 was
chosen as that is what the virtio-video Linux frontend driver
implements.

This allows for testing with the v4l2 vicodec test codec [2]
module in the Linux kernel, and is intended to also be used
with Arm SoCs that implement a v4l2 stateful decoder/encoder
drivers.

The advantage of developing & testing with vicodec is that
is allows quick development on a purely virtual setup with
qemu and a host Linux kernel. Also it allows ci systems like
lkft, kernelci to easily test the virtio interface.

Currently conversion from virtio-video to v4l2 stateless m2m
codec driver or VAAPI drivers is consiered out ot scope as
is emulation of a decoder device using a something like ffmpeg.
Although this could be added in the future.

Note some virtio & v4l2 helpers were based off virtio-video
Linux frontend driver and yavta utility, both GPL v2.

Example host commands
 modprobe vicodec
 vhost-user-video --v4l2-device=/dev/video3 -v --socket-path=video.sock

Run Qemu with
 -device vhost-user-video-pci,chardev=video,id=video

Guest decoder
 v4l2-ctl -d0 -x width=640,height=480 -v width=640,height=480,pixelformat=YU12
   --stream-mmap --stream-out-mmap --stream-from jelly_640_480-420P.fwht
   --stream-to out-jelly-640-480.YU12

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/
    v4l/dev-decoder.html

[2] https://lwn.net/Articles/760650/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 tools/vhost-user-video/50-qemu-rpmb.json.in   |    5 +
 tools/vhost-user-video/main.c                 | 1680 ++++++++++++++++
 tools/vhost-user-video/meson.build            |   10 +
 tools/vhost-user-video/v4l2_backend.c         | 1777 +++++++++++++++++
 tools/vhost-user-video/v4l2_backend.h         |   99 +
 tools/vhost-user-video/virtio_video_helpers.c |  462 +++++
 tools/vhost-user-video/virtio_video_helpers.h |  166 ++
 tools/vhost-user-video/vuvideo.h              |   43 +
 8 files changed, 4242 insertions(+)
 create mode 100644 tools/vhost-user-video/50-qemu-rpmb.json.in
 create mode 100644 tools/vhost-user-video/main.c
 create mode 100644 tools/vhost-user-video/meson.build
 create mode 100644 tools/vhost-user-video/v4l2_backend.c
 create mode 100644 tools/vhost-user-video/v4l2_backend.h
 create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
 create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
 create mode 100644 tools/vhost-user-video/vuvideo.h

diff --git a/tools/vhost-user-video/50-qemu-rpmb.json.in b/tools/vhost-user-video/50-qemu-rpmb.json.in
new file mode 100644
index 0000000000..2b033cda56
--- /dev/null
+++ b/tools/vhost-user-video/50-qemu-rpmb.json.in
@@ -0,0 +1,5 @@
+{
+  "description": "QEMU vhost-user-rpmb",
+  "type": "block",
+  "binary": "@libexecdir@/vhost-user-rpmb"
+}
diff --git a/tools/vhost-user-video/main.c b/tools/vhost-user-video/main.c
new file mode 100644
index 0000000000..a944efadb6
--- /dev/null
+++ b/tools/vhost-user-video/main.c
@@ -0,0 +1,1680 @@
+/*
+ * VIRTIO Video Emulation via vhost-user
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define G_LOG_DOMAIN "vhost-user-video"
+#define G_LOG_USE_STRUCTURED 1
+
+#include <glib.h>
+#include <gio/gio.h>
+#include <gio/gunixsocketaddress.h>
+#include <glib-unix.h>
+#include <glib/gstdio.h>
+#include <stdio.h>
+#include <string.h>
+#include <inttypes.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/mman.h>
+#include <unistd.h>
+#include <endian.h>
+#include <assert.h>
+
+#include "libvhost-user-glib.h"
+#include "libvhost-user.h"
+#include "standard-headers/linux/virtio_video.h"
+
+#include "qemu/compiler.h"
+#include "qemu/iov.h"
+
+#include "vuvideo.h"
+#include "v4l2_backend.h"
+#include "virtio_video_helpers.h"
+
+#ifndef container_of
+#define container_of(ptr, type, member) ({                      \
+        const typeof(((type *) 0)->member) * __mptr = (ptr);     \
+        (type *) ((char *) __mptr - offsetof(type, member)); })
+#endif
+
+static gchar *socket_path;
+static gchar *v4l2_path;
+static gint socket_fd = -1;
+static gboolean print_cap;
+static gboolean verbose;
+static gboolean debug;
+
+static GOptionEntry options[] = {
+    { "socket-path", 0, 0, G_OPTION_ARG_FILENAME, &socket_path,
+      "Location of vhost-user Unix domain socket, "
+      "incompatible with --fd", "PATH" },
+    { "v4l2-device", 0, 0, G_OPTION_ARG_FILENAME, &v4l2_path,
+      "Location of v4l2 device node", "PATH" },
+    { "fd", 0, 0, G_OPTION_ARG_INT, &socket_fd,
+      "Specify the fd of the backend, "
+      "incompatible with --socket-path", "FD" },
+    { "print-capabilities", 0, 0, G_OPTION_ARG_NONE, &print_cap,
+      "Output to stdout the backend capabilities "
+      "in JSON format and exit", NULL},
+    { "verbose", 'v', 0, G_OPTION_ARG_NONE, &verbose,
+      "Be more verbose in output", NULL},
+    { "debug", 0, 0, G_OPTION_ARG_NONE, &debug,
+      "Include debug output", NULL},
+    { NULL }
+};
+
+enum {
+    VHOST_USER_VIDEO_MAX_QUEUES = 2,
+};
+
+/* taken from util/iov.c */
+size_t video_iov_size(const struct iovec *iov, const unsigned int iov_cnt)
+{
+    size_t len;
+    unsigned int i;
+
+    len = 0;
+    for (i = 0; i < iov_cnt; i++) {
+        len += iov[i].iov_len;
+    }
+    return len;
+}
+
+static size_t video_iov_to_buf(const struct iovec *iov,
+                               const unsigned int iov_cnt,
+                               size_t offset, void *buf, size_t bytes)
+{
+    size_t done;
+    unsigned int i;
+    for (i = 0, done = 0; (offset || done < bytes) && i < iov_cnt; i++) {
+        if (offset < iov[i].iov_len) {
+            size_t len = MIN(iov[i].iov_len - offset, bytes - done);
+            memcpy(buf + done, iov[i].iov_base + offset, len);
+            done += len;
+            offset = 0;
+        } else {
+            offset -= iov[i].iov_len;
+        }
+    }
+    assert(offset == 0);
+    return done;
+}
+
+static size_t video_iov_from_buf(const struct iovec *iov, unsigned int iov_cnt,
+                                 size_t offset, const void *buf, size_t bytes)
+{
+    size_t done;
+    unsigned int i;
+    for (i = 0, done = 0; (offset || done < bytes) && i < iov_cnt; i++) {
+        if (offset < iov[i].iov_len) {
+            size_t len = MIN(iov[i].iov_len - offset, bytes - done);
+            memcpy(iov[i].iov_base + offset, buf + done, len);
+            done += len;
+            offset = 0;
+        } else {
+            offset -= iov[i].iov_len;
+        }
+    }
+    assert(offset == 0);
+    return done;
+}
+
+static void video_panic(VuDev *dev, const char *msg)
+{
+    g_critical("%s\n", msg);
+    exit(EXIT_FAILURE);
+}
+
+static uint64_t video_get_features(VuDev *dev)
+{
+    g_info("%s: replying", __func__);
+    return 0;
+}
+
+static void video_set_features(VuDev *dev, uint64_t features)
+{
+    if (features) {
+        g_autoptr(GString) s = g_string_new("Requested un-handled feature");
+        g_string_append_printf(s, " 0x%" PRIx64 "", features);
+        g_info("%s: %s", __func__, s->str);
+    }
+}
+
+/*
+ * The configuration of the device is static and set when we start the
+ * daemon.
+ */
+static int
+video_get_config(VuDev *dev, uint8_t *config, uint32_t len)
+{
+    VuVideo *v = container_of(dev, VuVideo, dev.parent);
+
+    g_return_val_if_fail(len <= sizeof(struct virtio_video_config), -1);
+    v->virtio_config.version = 0;
+    v->virtio_config.max_caps_length = MAX_CAPS_LEN;
+    v->virtio_config.max_resp_length = MAX_CAPS_LEN;
+
+    memcpy(config, &v->virtio_config, len);
+
+    g_debug("%s: config.max_caps_length = %d", __func__
+           , ((struct virtio_video_config *)config)->max_caps_length);
+    g_debug("%s: config.max_resp_length = %d", __func__
+           , ((struct virtio_video_config *)config)->max_resp_length);
+
+    return 0;
+}
+
+static int
+video_set_config(VuDev *dev, const uint8_t *data,
+                 uint32_t offset, uint32_t size,
+                 uint32_t flags)
+{
+    g_debug("%s: ", __func__);
+    /* ignore */
+    return 0;
+}
+
+/*
+ * Handlers for individual control messages
+ */
+
+static void
+handle_set_params_cmd(struct VuVideo *v, struct vu_video_ctrl_command *vio_cmd)
+{
+    int ret = 0;
+    enum v4l2_buf_type buf_type;
+    struct virtio_video_set_params *cmd =
+        (struct virtio_video_set_params *) vio_cmd->cmd_buf;
+    struct stream *s;
+
+    g_debug("%s: type(x%x) stream_id(%d) %s ", __func__,
+            cmd->hdr.type, cmd->hdr.stream_id,
+            vio_queue_name(le32toh(cmd->params.queue_type)));
+    g_debug("%s: format=0x%x frame_width(%d) frame_height(%d)",
+            __func__, le32toh(cmd->params.format),
+            le32toh(cmd->params.frame_width),
+            le32toh(cmd->params.frame_height));
+    g_debug("%s: min_buffers(%d) max_buffers(%d)", __func__,
+            le32toh(cmd->params.min_buffers), le32toh(cmd->params.max_buffers));
+    g_debug("%s: frame_rate(%d) num_planes(%d)", __func__,
+            le32toh(cmd->params.frame_rate), le32toh(cmd->params.num_planes));
+    g_debug("%s: crop top=%d, left=%d, width=%d, height=%d", __func__,
+            le32toh(cmd->params.crop.left), le32toh(cmd->params.crop.top),
+            le32toh(cmd->params.crop.width), le32toh(cmd->params.crop.height));
+
+    s = find_stream(v, cmd->hdr.stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found", __func__, cmd->hdr.stream_id);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    buf_type = get_v4l2_buf_type(le32toh(cmd->params.queue_type),
+                                 s->has_mplane);
+
+    ret = v4l2_video_set_format(s->fd, buf_type, &cmd->params);
+    if (ret < 0) {
+        g_error("%s: v4l2_video_set_format() failed", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+
+    if (is_capture_queue(buf_type)) {
+        /* decoder supports composing on CAPTURE */
+        struct v4l2_selection sel;
+        memset(&sel, 0, sizeof(struct v4l2_selection));
+
+        sel.r.left = le32toh(cmd->params.crop.left);
+        sel.r.top = le32toh(cmd->params.crop.top);
+        sel.r.width = le32toh(cmd->params.crop.width);
+        sel.r.height = le32toh(cmd->params.crop.height);
+
+        ret = v4l2_video_set_selection(s->fd, buf_type, &sel);
+        if (ret < 0) {
+            g_printerr("%s: v4l2_video_set_selection failed: %s (%d).\n"
+                       , __func__, g_strerror(errno), errno);
+            cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+            goto out_unlock;
+        }
+    }
+
+    cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+
+out_unlock:
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+out:
+    return;
+}
+
+static void
+handle_get_params_cmd(struct VuVideo *v, struct vu_video_ctrl_command *vio_cmd)
+{
+    int ret;
+    struct v4l2_format fmt;
+    struct v4l2_selection sel;
+    enum v4l2_buf_type buf_type;
+    struct virtio_video_get_params *cmd =
+        (struct virtio_video_get_params *) vio_cmd->cmd_buf;
+    struct virtio_video_get_params_resp getparams_reply;
+    struct stream *s;
+
+    g_debug("%s: type(0x%x) stream_id(%d) %s", __func__,
+            cmd->hdr.type, cmd->hdr.stream_id,
+            vio_queue_name(le32toh(cmd->queue_type)));
+
+    s = find_stream(v, cmd->hdr.stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found\n"
+                   , __func__, cmd->hdr.stream_id);
+        getparams_reply.hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    getparams_reply.hdr.stream_id = cmd->hdr.stream_id;
+    getparams_reply.params.queue_type = cmd->queue_type;
+
+    buf_type = get_v4l2_buf_type(cmd->queue_type, s->has_mplane);
+
+    ret = v4l2_video_get_format(s->fd, buf_type, &fmt);
+    if (ret < 0) {
+        g_printerr("v4l2_video_get_format failed\n");
+        getparams_reply.hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+
+    if (is_capture_queue(buf_type)) {
+        ret = v4l2_video_get_selection(s->fd, buf_type, &sel);
+        if (ret < 0) {
+            g_printerr("v4l2_video_get_selection failed\n");
+            getparams_reply.hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+            goto out_unlock;
+        }
+    }
+
+    /* convert from v4l2 to virtio */
+    v4l2_to_virtio_video_params(v->v4l2_dev, &fmt, &sel,
+                                &getparams_reply);
+
+    getparams_reply.hdr.type = VIRTIO_VIDEO_RESP_OK_GET_PARAMS;
+
+out_unlock:
+    vio_cmd->finished = true;
+    send_ctrl_response(vio_cmd, (uint8_t *)&getparams_reply,
+                       sizeof(struct virtio_video_get_params_resp));
+    g_mutex_unlock(&s->mutex);
+out:
+    return;
+}
+
+struct stream *find_stream(struct VuVideo *v, uint32_t stream_id)
+{
+    GList *l;
+    struct stream *s;
+
+    for (l = v->streams; l != NULL; l = l->next) {
+        s = (struct stream *)l->data;
+        if (s->stream_id == stream_id) {
+            return s;
+        }
+    }
+
+    return NULL;
+}
+
+int add_resource(struct stream *s, struct resource *r, uint32_t queue_type)
+{
+
+    if (!s || !r) {
+        return -EINVAL;
+    }
+
+    switch (queue_type) {
+    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
+        s->inputq_resources = g_list_append(s->inputq_resources, r);
+        break;
+
+    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
+        s->outputq_resources = g_list_append(s->outputq_resources, r);
+        break;
+    default:
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+void free_resource_mem(struct resource *r)
+{
+
+    /*
+     * Frees the memory allocated for resource_queue_cmd
+     * not the memory allocated in resource_create
+     */
+
+    if (r->vio_q_cmd) {
+        g_free(r->vio_q_cmd->cmd_buf);
+        r->vio_q_cmd->cmd_buf = NULL;
+        free(r->vio_q_cmd);
+        r->vio_q_cmd = NULL;
+    }
+}
+
+void remove_all_resources(struct stream *s, uint32_t queue_type)
+{
+    GList **resource_list;
+    struct resource *r;
+
+    /* assumes stream mutex is held by caller */
+
+    switch (queue_type) {
+    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
+        resource_list =  &s->inputq_resources;
+        break;
+    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
+        resource_list = &s->outputq_resources;
+        break;
+    default:
+        g_critical("%s: Invalid virtio queue!", __func__);
+        return;
+    }
+
+    g_debug("%s: resource_list has %d elements", __func__
+            , g_list_length(*resource_list));
+
+    GList *l = *resource_list;
+    while (l != NULL) {
+        GList *next = l->next;
+        r = (struct resource *)l->data;
+        if (r) {
+            g_debug("%s: Removing resource_id(%d) resource=%p"
+                    , __func__, r->vio_resource.resource_id, r);
+
+            /*
+             * Assumes that either QUEUE_CLEAR or normal dequeuing
+             * of buffers will have freed resource_queue cmd memory
+             */
+
+            /* free resource memory allocated in resource_create() */
+            g_free(r->iov);
+            g_free(r);
+            *resource_list = g_list_delete_link(*resource_list, l);
+        }
+        l = next;
+   }
+}
+
+struct resource *find_resource(struct stream *s, uint32_t resource_id,
+                                uint32_t queue_type)
+{
+    GList *l;
+    struct resource *r;
+
+    switch (queue_type) {
+    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
+        l = s->inputq_resources;
+        break;
+
+    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
+        l = s->outputq_resources;
+        break;
+    default:
+        g_error("%s: Invalid queue type!", __func__);
+    }
+
+    for (; l != NULL; l = l->next) {
+        r = (struct resource *)l->data;
+        if (r->vio_resource.resource_id == resource_id) {
+            return r;
+        }
+    }
+
+    return NULL;
+}
+
+struct resource *find_resource_by_v4l2index(struct stream *s,
+                                             enum v4l2_buf_type buf_type,
+                                             uint32_t v4l2_index)
+{
+    GList *l = NULL;
+    struct resource *r;
+
+    switch (buf_type) {
+    case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+        l = s->outputq_resources;
+        break;
+
+    case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+        l = s->inputq_resources;
+        break;
+
+    default:
+        g_error("Unsupported buffer type\n");
+    }
+
+    for (; l != NULL; l = l->next) {
+        r = (struct resource *)l->data;
+        if (r->v4l2_index == v4l2_index) {
+            g_debug("%s: found Resource=%p streamid(%d) resourceid(%d) "
+                    "numplanes(%d) planes_layout(0x%x) vio_q_cmd=%p", __func__,
+                    r, r->stream_id, r->vio_resource.resource_id,
+                    r->vio_resource.num_planes, r->vio_resource.planes_layout,
+                    r->vio_q_cmd);
+            return r;
+        }
+    }
+    return NULL;
+}
+
+#define EVENT_WQ_IDX 1
+
+static void *stream_worker_thread(gpointer data)
+{
+    int ret;
+    struct stream *s = data;
+    VuVideo *v = s->video;
+    VugDev *vugdev = &v->dev;
+    VuDev *vudev = &vugdev->parent;
+    VuVirtq *vq = vu_get_queue(vudev, EVENT_WQ_IDX);
+    VuVirtqElement *elem;
+    size_t len;
+
+    struct v4l2_event ev;
+    struct virtio_video_event vio_event;
+
+    /* select vars */
+    fd_set efds, rfds, wfds;
+    bool have_event, have_read, have_write;
+    enum v4l2_buf_type buf_type;
+
+    fcntl(s->fd, F_SETFL, fcntl(s->fd, F_GETFL) | O_NONBLOCK);
+
+    while (true) {
+            int res;
+
+            g_mutex_lock(&s->mutex);
+
+            /* wait for STREAMING or DESTROYING state */
+            while (s->stream_state != STREAM_DESTROYING &&
+                   s->stream_state != STREAM_STREAMING &&
+                   s->stream_state != STREAM_DRAINING)
+                g_cond_wait(&s->stream_cond, &s->mutex);
+
+            if (s->stream_state == STREAM_DESTROYING) {
+                g_debug("stream worker thread exiting!");
+                s->stream_state = STREAM_DESTROYED;
+                g_cond_signal(&s->stream_cond);
+                g_mutex_unlock(&s->mutex);
+                g_thread_exit(0);
+            }
+
+            g_mutex_unlock(&s->mutex);
+
+            FD_ZERO(&efds);
+            FD_SET(s->fd, &efds);
+            FD_ZERO(&rfds);
+            FD_SET(s->fd, &rfds);
+            FD_ZERO(&wfds);
+            FD_SET(s->fd, &wfds);
+
+            struct timeval tv = { 0 , 500000 };
+            res = select(s->fd + 1, &rfds, &wfds, &efds, &tv);
+            if (res < 0) {
+                g_printerr("%s:%d - select() failed errno(%s)\n", __func__,
+                           __LINE__, g_strerror(errno));
+                break;
+            }
+
+            if (res == 0) {
+                g_debug("%s:%d - select() timeout", __func__, __LINE__);
+                continue;
+            }
+
+            have_event = FD_ISSET(s->fd, &efds);
+            have_read = FD_ISSET(s->fd, &rfds);
+            have_write = FD_ISSET(s->fd, &wfds);
+            /* read is capture queue, write is output queue */
+
+            g_debug("%s:%d have_event=%d, have_write=%d, have_read=%d\n"
+                    , __func__, __LINE__, FD_ISSET(s->fd, &efds)
+                    , FD_ISSET(s->fd, &wfds), FD_ISSET(s->fd, &rfds));
+
+            g_mutex_lock(&s->mutex);
+
+            if (have_event) {
+                g_debug("%s: have_event!", __func__);
+                res = ioctl(s->fd, VIDIOC_DQEVENT, &ev);
+                if (res < 0) {
+                    g_printerr("%s:%d - VIDIOC_DQEVENT failed: errno(%s)\n",
+                               __func__, __LINE__, g_strerror(errno));
+                    break;
+                }
+                v4l2_to_virtio_event(&ev, &vio_event);
+
+                /* get event workqueue */
+                elem = vu_queue_pop(vudev, vq, sizeof(struct VuVirtqElement));
+                if (!elem) {
+                    g_debug("%s:%d\n", __func__, __LINE__);
+                    break;
+                }
+
+                len = video_iov_from_buf(elem->in_sg,
+                                         elem->in_num, 0, (void *) &vio_event,
+                                         sizeof(struct virtio_video_event));
+
+                vu_queue_push(vudev, vq, elem, len);
+                vu_queue_notify(vudev, vq);
+            }
+
+            if (have_read && s->capture_streaming == true) {
+                /* TODO assumes decoder */
+                buf_type = s->has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
+                    : V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+                ret = v4l2_dequeue_buffer(s->fd, buf_type, s);
+                if (ret < 0) {
+                    g_info("%s: v4l2_dequeue_buffer() failed CAPTURE ret(%d)"
+                           , __func__, ret);
+
+                    if (errno == EPIPE) {
+                        /* dequeued last buf, so stop streaming */
+                        ioctl_streamoff(s, buf_type);
+                    }
+                 }
+            }
+
+            if (have_write  && s->output_streaming == true) {
+                buf_type = s->has_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
+                    : V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+                ret = v4l2_dequeue_buffer(s->fd, buf_type, s);
+                if (ret < 0) {
+                    g_info("%s: v4l2_dequeue_buffer() failed OUTPUT ret(%d)"
+                           , __func__, ret);
+                }
+            }
+
+            g_mutex_unlock(&s->mutex);
+    }
+
+    return NULL;
+}
+
+void handle_queue_clear_cmd(struct VuVideo *v,
+                       struct vu_video_ctrl_command *vio_cmd)
+{
+    struct virtio_video_queue_clear *cmd =
+        (struct virtio_video_queue_clear *)vio_cmd->cmd_buf;
+    int ret = 0;
+    struct stream *s;
+    uint32_t stream_id = le32toh(cmd->hdr.stream_id);
+    enum virtio_video_queue_type queue_type = le32toh(cmd->queue_type);
+
+    g_debug("%s: stream_id(%d) %s\n", __func__, stream_id,
+            vio_queue_name(queue_type));
+
+    if (!v || !cmd) {
+        return;
+    }
+
+    s = find_stream(v, stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found", __func__, stream_id);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    enum v4l2_buf_type buf_type =
+        get_v4l2_buf_type(le32toh(cmd->queue_type), s->has_mplane);
+
+    /*
+     * QUEUE_CLEAR behaviour from virtio-video spec
+     * Return already queued buffers back from the input or the output queue
+     * of the device. The device SHOULD return all of the buffers from the
+     * respective queue as soon as possible without pushing the buffers through
+     * the processing pipeline.
+     *
+     * From v4l2 PoV we issue a VIDIOC_STREAMOFF on the queue which will abort
+     * or finish any DMA in progress, unlocks any user pointer buffers locked
+     * in physical memory, and it removes all buffers from the incoming and
+     * outgoing queues.
+     */
+
+    /* issue streamoff  */
+    ret = ioctl_streamoff(s, buf_type);
+    if (ret < 0) {
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+
+    /* iterate the queues resources list - and send a reply to each one */
+
+    /*
+     * If the processing was stopped due to VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
+     * the device MUST respond with VIRTIO_VIDEO_RESP_OK_NODATA as a response
+     * type and VIRTIO_- VIDEO_BUFFER_FLAG_ERR in flags.
+     */
+
+    g_list_foreach(get_resource_list(s, queue_type),
+                   (GFunc)send_qclear_res_reply, s);
+
+    cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+
+out_unlock:
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+out:
+    return;
+}
+
+GList *get_resource_list(struct stream *s, uint32_t queue_type)
+{
+    switch (queue_type) {
+    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
+        return s->inputq_resources;
+        break;
+
+    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
+        return s->outputq_resources;
+        break;
+    default:
+        g_critical("%s: Unknown queue type!", __func__);
+        return NULL;
+    }
+}
+
+void send_ctrl_response(struct vu_video_ctrl_command *vio_cmd,
+                       uint8_t *resp, size_t resp_len)
+{
+    size_t len;
+
+    virtio_video_ctrl_hdr_htole((struct virtio_video_cmd_hdr *)resp);
+
+    /* send virtio_video_resource_queue_resp */
+    len = video_iov_from_buf(vio_cmd->elem.in_sg,
+                             vio_cmd->elem.in_num, 0, resp, resp_len);
+
+    if (len != resp_len) {
+        g_critical("%s: response size incorrect %zu vs %zu",
+                   __func__, len, resp_len);
+    }
+
+    vu_queue_push(vio_cmd->dev, vio_cmd->vq, &vio_cmd->elem, len);
+    vu_queue_notify(vio_cmd->dev, vio_cmd->vq);
+
+    if (vio_cmd->finished) {
+        g_free(vio_cmd->cmd_buf);
+        free(vio_cmd);
+    }
+}
+
+void send_ctrl_response_nodata(struct vu_video_ctrl_command *vio_cmd)
+{
+    send_ctrl_response(vio_cmd, vio_cmd->cmd_buf,
+                       sizeof(struct virtio_video_cmd_hdr));
+}
+
+void send_qclear_res_reply(gpointer data, gpointer user_data)
+{
+    struct resource *r = data;
+    struct vu_video_ctrl_command *vio_cmd = r->vio_q_cmd;
+    struct virtio_video_queue_clear *cmd =
+        (struct virtio_video_queue_clear *) vio_cmd->cmd_buf;
+    struct virtio_video_resource_queue_resp resp;
+
+    /*
+     * only need to send replies for buffers that are
+     * inflight
+     */
+
+    if (r->queued) {
+
+        resp.hdr.stream_id = cmd->hdr.stream_id;
+        resp.hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+        resp.flags = htole32(VIRTIO_VIDEO_BUFFER_FLAG_ERR);
+        resp.timestamp = htole64(r->vio_res_q.timestamp);
+
+        g_debug("%s: stream_id=%d type=0x%x flags=0x%x resource_id=%d t=%llx"
+                , __func__, resp.hdr.stream_id, resp.hdr.type, resp.flags,
+                r->vio_resource.resource_id, resp.timestamp);
+
+        vio_cmd->finished = true;
+        send_ctrl_response(vio_cmd, (uint8_t *) &resp,
+                           sizeof(struct virtio_video_resource_queue_resp));
+    }
+    return;
+}
+
+static int
+handle_resource_create_cmd(struct VuVideo *v,
+                           struct vu_video_ctrl_command *vio_cmd)
+{
+    int ret = 0, i;
+    uint32_t total_entries = 0;
+    uint32_t stream_id ;
+    struct virtio_video_resource_create *cmd =
+        (struct virtio_video_resource_create *)vio_cmd->cmd_buf;
+    struct virtio_video_mem_entry *mem;
+    struct resource *res;
+    struct virtio_video_resource_create *r;
+    struct stream *s;
+    enum virtio_video_mem_type mem_type;
+
+    stream_id = cmd->hdr.stream_id;
+
+    s = find_stream(v, stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found", __func__, stream_id);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    if (le32toh(cmd->resource_id) == 0) {
+        g_critical("%s: resource id 0 is not allowed", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+
+    /* check resource id doesn't already exist */
+    res = find_resource(s, le32toh(cmd->resource_id), le32toh(cmd->queue_type));
+    if (res) {
+        g_critical("%s: resource_id:%d already exists"
+                   , __func__, le32toh(cmd->resource_id));
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
+        goto out_unlock;
+    } else {
+        res = g_new0(struct resource, 1);
+        res->vio_resource.resource_id = le32toh(cmd->resource_id);
+        res->vio_resource.queue_type = le32toh(cmd->queue_type);
+        res->vio_resource.planes_layout = le32toh(cmd->planes_layout);
+
+        res->vio_resource.num_planes = le32toh(cmd->num_planes);
+        r = &res->vio_resource;
+
+        ret = add_resource(s, res, le32toh(cmd->queue_type));
+        if (ret) {
+            g_critical("%s: resource_add id:%d failed"
+                       , __func__, le32toh(cmd->resource_id));
+            cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
+            goto out_unlock;
+        }
+
+        g_debug("%s: resource=%p streamid(%d) resourceid(%d) numplanes(%d)"
+                "planes_layout(0x%x) %s",
+                __func__, res, res->stream_id, r->resource_id, r->num_planes,
+                r->planes_layout, vio_queue_name(r->queue_type));
+    }
+
+    if (r->planes_layout & VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE) {
+        g_debug("%s: streamid(%d) resourceid(%d) planes_layout(0x%x)"
+                , __func__, res->stream_id, r->resource_id, r->planes_layout);
+
+        for (i = 0; i < r->num_planes; i++) {
+            total_entries += le32toh(cmd->num_entries[i]);
+            g_debug("%s: streamid(%d) resourceid(%d) num_entries[%d]=%d"
+                    , __func__, res->stream_id, r->resource_id,
+                    i, le32toh(cmd->num_entries[i]));
+        }
+    } else {
+        total_entries = 1;
+    }
+
+    /*
+     * virtio_video_resource_create is followed by either
+     * - struct virtio_video_mem_entry entries[]
+     *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
+     * - struct virtio_video_object_entry entries[]
+     *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
+     */
+
+    if (r->queue_type == VIRTIO_VIDEO_QUEUE_TYPE_INPUT) {
+        mem_type = s->vio_stream.in_mem_type;
+    } else {
+        mem_type = s->vio_stream.out_mem_type;
+    }
+    /*
+     * Followed by either
+     * - struct virtio_video_mem_entry entries[]
+     *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
+     * - struct virtio_video_object_entry entries[]
+     *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
+     */
+
+    if (mem_type == VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES) {
+        mem = (void *)cmd + sizeof(struct virtio_video_resource_create);
+
+        res->iov = g_malloc0(sizeof(struct iovec) * total_entries);
+        for (i = 0; i < total_entries; i++) {
+            uint64_t len = le32toh(mem[i].length);
+            g_debug("%s: mem[%d] addr=0x%lx", __func__
+                    , i, le64toh(mem[i].addr));
+
+            res->iov[i].iov_len = le32toh(mem[i].length);
+            res->iov[i].iov_base =
+                vu_gpa_to_va(&v->dev.parent, &len, le64toh(mem[i].addr));
+            g_debug("%s: [%d] iov_len = 0x%lx", __func__
+                    , i, res->iov[i].iov_len);
+            g_debug("%s: [%d] iov_base = 0x%p", __func__
+                    , i, res->iov[i].iov_base);
+        }
+        res->iov_count = total_entries;
+
+    } else if (mem_type == VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT) {
+        g_critical("%s: VIRTIO_OBJECT not implemented!", __func__);
+        /* TODO implement VIRTIO_OBJECT support */
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+
+    /* check underlying driver supports GUEST_PAGES */
+    enum v4l2_buf_type buf_type =
+        get_v4l2_buf_type(r->queue_type, s->has_mplane);
+
+    ret = v4l2_resource_create(s, buf_type, mem_type, res);
+    if (ret < 0) {
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+
+    cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+
+out_unlock:
+    /* send response */
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+out:
+    return ret;
+}
+
+static int
+handle_resource_queue_cmd(struct VuVideo *v,
+                          struct vu_video_ctrl_command *vio_cmd)
+{
+    struct virtio_video_resource_queue *cmd =
+        (struct virtio_video_resource_queue *)vio_cmd->cmd_buf;
+    struct resource *res;
+    struct stream *s;
+    uint32_t stream_id;
+    int ret = 0;
+
+    g_debug("%s: type(0x%x) %s resource_id(%d)", __func__,
+            cmd->hdr.type, vio_queue_name(le32toh(cmd->queue_type)),
+            le32toh(cmd->resource_id));
+    g_debug("%s: num_data_sizes = %d", __func__, le32toh(cmd->num_data_sizes));
+    g_debug("%s: data_sizes[0] = %d", __func__, le32toh(cmd->data_sizes[0]));
+
+    stream_id = cmd->hdr.stream_id;
+
+    s = find_stream(v, stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found", __func__, stream_id);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    if (cmd->resource_id == 0) {
+        g_critical("%s: resource id 0 is not allowed", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
+        goto out_unlock;
+    }
+
+    /* get resource object */
+    res = find_resource(s, le32toh(cmd->resource_id), le32toh(cmd->queue_type));
+    if (!res) {
+        g_critical("%s: resource_id:%d does not exist!"
+                   , __func__, le32toh(cmd->resource_id));
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID;
+        goto out_unlock;
+    }
+
+    res->vio_res_q.timestamp = le64toh(cmd->timestamp);
+    res->vio_res_q.num_data_sizes = le32toh(cmd->num_data_sizes);
+    res->vio_res_q.queue_type = le32toh(cmd->queue_type);
+    res->vio_q_cmd = vio_cmd;
+
+    g_debug("%s: res=%p res->vio_q_cmd=0x%p", __func__, res, res->vio_q_cmd);
+
+    enum v4l2_buf_type buf_type = get_v4l2_buf_type(
+        cmd->queue_type, s->has_mplane);
+
+
+    ret = v4l2_queue_buffer(s->fd, buf_type, cmd, res, s, v->v4l2_dev);
+    if (ret < 0) {
+        g_critical("%s: v4l2_queue_buffer failed", __func__);
+        /* virtio error set by v4l2_queue_buffer */
+        goto out_unlock;
+    }
+
+    /*
+     * let the stream worker thread do the dequeueing of output and
+     * capture queue buffers and send the resource_queue replies
+     */
+
+    g_mutex_unlock(&s->mutex);
+    return ret;
+
+out_unlock:
+    /* send response */
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+out:
+    return ret;
+}
+
+
+static void
+handle_resource_destroy_all_cmd(struct VuVideo *v,
+                                struct vu_video_ctrl_command *vio_cmd)
+{
+    struct virtio_video_resource_destroy_all *cmd =
+        (struct virtio_video_resource_destroy_all *)vio_cmd->cmd_buf;
+    enum v4l2_buf_type buf_type;
+    struct stream *s;
+    int ret = 0;
+
+    g_debug("%s: type(0x%x) %s stream_id(%d)", __func__,
+            cmd->hdr.type, vio_queue_name(le32toh(cmd->queue_type)),
+            cmd->hdr.stream_id);
+
+    s = find_stream(v, cmd->hdr.stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found", __func__, cmd->hdr.stream_id);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    buf_type = get_v4l2_buf_type(le32toh(cmd->queue_type), s->has_mplane);
+
+    ret = v4l2_free_buffers(s->fd, buf_type);
+    if (ret) {
+        g_critical("%s: v4l2_free_buffers() failed", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    remove_all_resources(s, le32toh(cmd->queue_type));
+
+    /* free resource objects from queue list */
+    cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+
+out:
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+}
+
+static void
+handle_stream_create_cmd(struct VuVideo *v,
+                         struct vu_video_ctrl_command *vio_cmd)
+{
+    int ret = 0;
+    struct stream *s;
+    uint32_t req_stream_id;
+    uint32_t coded_format;
+
+    struct virtio_video_stream_create *cmd =
+        (struct virtio_video_stream_create *)vio_cmd->cmd_buf;
+
+    g_debug("%s: type(0x%x) stream_id(%d) in_mem_type(0x%x) "
+            "out_mem_type(0x%x) coded_format(0x%x)",
+            __func__, cmd->hdr.type, cmd->hdr.stream_id,
+            le32toh(cmd->in_mem_type), le32toh(cmd->out_mem_type),
+            le32toh(cmd->coded_format));
+
+    req_stream_id = cmd->hdr.stream_id;
+    coded_format = le32toh(cmd->coded_format);
+
+    if ((le32toh(cmd->in_mem_type) == VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT) ||
+        (le32toh(cmd->out_mem_type) == VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT)) {
+        /* TODO implement VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT */
+        g_printerr("%s: MEM_TYPE_VIRTIO_OBJECT not supported yet", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out;
+    }
+
+    if (!find_stream(v, req_stream_id)) {
+        s = g_new0(struct stream, 1);
+        /* copy but bswap */
+        s->vio_stream.in_mem_type = le32toh(cmd->in_mem_type);
+        s->vio_stream.out_mem_type = le32toh(cmd->out_mem_type);
+        s->vio_stream.coded_format = le32toh(cmd->coded_format);
+        strncpy((char *)&s->vio_stream.tag, (char *)cmd->tag,
+                sizeof(cmd->tag) - 1);
+        s->vio_stream.tag[sizeof(cmd->tag) - 1] = 0;
+        s->stream_id = req_stream_id;
+        s->video = v;
+        s->stream_state = STREAM_STOPPED;
+        s->has_mplane = v->v4l2_dev->has_mplane;
+        g_mutex_init(&s->mutex);
+        g_cond_init(&s->stream_cond);
+        v->streams = g_list_append(v->streams, s);
+
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+    } else {
+        g_debug("%s: Stream ID in use - ", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID;
+        goto out;
+    }
+
+    /* set the requested coded format */
+    ret = v4l2_stream_create(v->v4l2_dev, coded_format, s);
+    if (ret < 0) {
+        g_printerr("%s: v4l2_stream_create() failed", __func__);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+
+        v->streams = g_list_remove(v->streams, s);
+        g_free(s);
+    }
+
+    /*
+     * create thread to handle
+     *  - dequeing buffers from output & capture queues
+     *  - sending resource replies for buffers
+     *  - handling EOS and dynamic-resoltion events
+     */
+    s->worker_thread = g_thread_new("vio-video stream worker",
+                                    stream_worker_thread, s);
+
+out:
+    /* send response */
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+}
+
+static void
+handle_stream_drain_cmd(struct VuVideo *v,
+                          struct vu_video_ctrl_command *vio_cmd)
+{
+    int ret;
+    struct stream *s;
+    uint32_t stream_id;
+    struct virtio_video_stream_drain *cmd =
+        (struct virtio_video_stream_drain *)vio_cmd->cmd_buf;
+
+    stream_id = cmd->hdr.stream_id;
+
+    g_debug("%s: stream_id(%d)", __func__, stream_id);
+
+    s = find_stream(v, stream_id);
+    if (!s) {
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID;
+        return;
+    }
+
+    g_debug("%s: Found stream=0x%p", __func__, s);
+
+    g_mutex_lock(&s->mutex);
+
+    ret = v4l2_issue_cmd(s->fd, V4L2_DEC_CMD_STOP, 0);
+    if (ret < 0) {
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        goto out_unlock;
+    }
+    s->stream_state = STREAM_DRAINING;
+    g_cond_signal(&s->stream_cond);
+
+    cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+
+out_unlock:
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+}
+
+static void
+handle_stream_destroy_cmd(struct VuVideo *v,
+                          struct vu_video_ctrl_command *vio_cmd)
+{
+    struct stream *s;
+    uint32_t stream_id;
+    struct virtio_video_stream_destroy *cmd =
+        (struct virtio_video_stream_destroy *)vio_cmd->cmd_buf;
+    enum v4l2_buf_type buftype;
+
+    if (!v || !vio_cmd) {
+        return;
+    }
+
+    stream_id = cmd->hdr.stream_id;
+
+    g_debug("%s: stream_id=(%d)", __func__, stream_id);
+
+    s = find_stream(v, stream_id);
+
+    if (!s) {
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID;
+        return;
+    }
+
+    if (s) {
+        g_debug("%s: Found stream=0x%p", __func__, s);
+
+        g_mutex_lock(&s->mutex);
+        /* TODO assumes decoder */
+        buftype = s->has_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
+            : V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+        v4l2_streamoff(buftype, s);
+
+        /* signal worker thread */
+        s->stream_state = STREAM_DESTROYING;
+        g_cond_signal(&s->stream_cond);
+        g_mutex_unlock(&s->mutex);
+
+        /* wait for DESTROYED state */
+        g_mutex_lock(&s->mutex);
+        while (s->stream_state != STREAM_DESTROYED) {
+            g_cond_wait(&s->stream_cond, &s->mutex);
+        }
+
+        /* stream worker thread now exited */
+
+        /* deallocate the buffers */
+        v4l2_free_buffers(s->fd, buftype);
+        remove_all_resources(s, VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
+
+        buftype = s->has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+            V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+        v4l2_free_buffers(s->fd, buftype);
+        remove_all_resources(s, VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
+
+        g_cond_clear(&s->stream_cond);
+
+        v4l2_close(s->fd);
+
+        v->streams = g_list_remove(v->streams, (gconstpointer) s);
+        cmd->hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+    }
+
+    /* send response */
+    vio_cmd->finished = true;
+    send_ctrl_response_nodata(vio_cmd);
+    g_mutex_unlock(&s->mutex);
+    g_mutex_clear(&s->mutex);
+    g_free(s);
+
+    return;
+}
+
+struct virtio_video_get_control_resp_level {
+    struct virtio_video_cmd_hdr hdr;
+    struct virtio_video_control_val_level level;
+};
+
+struct virtio_video_get_control_resp_profile {
+    struct virtio_video_cmd_hdr hdr;
+    struct virtio_video_control_val_profile profile;
+};
+
+struct virtio_video_get_control_resp_bitrate {
+    struct virtio_video_cmd_hdr hdr;
+    struct virtio_video_control_val_bitrate bitrate;
+};
+
+static int
+handle_get_control_cmd(struct VuVideo *v, struct vu_video_ctrl_command *vio_cmd)
+{
+    int ret;
+    uint32_t v4l2_control;
+    int32_t value;
+
+    struct virtio_video_get_control_resp ctl_resp_err;
+    struct virtio_video_get_control_resp_level   ctl_resp_level;
+    struct virtio_video_get_control_resp_profile ctl_resp_profile;
+    struct virtio_video_get_control_resp_bitrate ctl_resp_bitrate;
+
+    struct stream *s;
+
+    struct virtio_video_query_control *cmd =
+        (struct virtio_video_query_control *)vio_cmd->cmd_buf;
+
+    g_debug("%s: type(0x%x) stream_id(%d) control(0x%x)", __func__,
+            cmd->hdr.type, cmd->hdr.stream_id, le32toh(cmd->control));
+
+    s = find_stream(v, cmd->hdr.stream_id);
+    if (!s) {
+        g_critical("%s: stream_id(%d) not found", __func__, cmd->hdr.stream_id);
+        goto out;
+    }
+
+    g_mutex_lock(&s->mutex);
+
+    v4l2_control = virtio_video_control_to_v4l2(le32toh(cmd->control));
+    if (!v4l2_control) {
+        goto out_err_unlock;
+    }
+
+
+    switch (le32toh(cmd->control)) {
+    case VIRTIO_VIDEO_CONTROL_BITRATE:
+        g_debug("%s: VIRTIO_VIDEO_CONTROL_BITRATE", __func__);
+
+        ctl_resp_bitrate.hdr.stream_id = cmd->hdr.stream_id;
+        ctl_resp_bitrate.hdr.type = VIRTIO_VIDEO_RESP_OK_GET_PARAMS;
+
+        if (v->v4l2_dev->dev_type == STATEFUL_ENCODER) {
+            ret = v4l2_video_get_control(s->fd, v4l2_control, &value);
+            if (ret < 0) {
+                g_printerr("v4l2_video_get_control() failed\n");
+                goto out_err_unlock;
+            }
+            ctl_resp_bitrate.bitrate.bitrate = htole32(value);
+
+        } else {
+            g_debug("%s: CONTROL_BITRATE unsupported for decoders!", __func__);
+            goto out_err_unlock;
+        }
+
+        vio_cmd->finished = true;
+        send_ctrl_response(vio_cmd, (uint8_t *)&ctl_resp_bitrate,
+                           sizeof(struct virtio_video_get_control_resp_bitrate));
+        break;
+
+    case VIRTIO_VIDEO_CONTROL_PROFILE:
+        g_debug("%s: VIRTIO_VIDEO_CONTROL_PROFILE", __func__);
+
+        ctl_resp_profile.hdr.stream_id = cmd->hdr.stream_id;
+        ctl_resp_profile.hdr.type = VIRTIO_VIDEO_RESP_OK_GET_PARAMS;
+
+        ret = v4l2_video_get_control(s->fd, v4l2_control, &value);
+        if (ret < 0) {
+            g_printerr("v4l2_video_get_control() failed\n");
+            goto out_err_unlock;
+        }
+
+        ctl_resp_profile.profile.profile = htole32(value);
+
+        vio_cmd->finished = true;
+        send_ctrl_response(vio_cmd, (uint8_t *)&ctl_resp_profile,
+                           sizeof(struct virtio_video_get_control_resp_profile));
+
+        /*
+         * TODO need to determine "in use" codec to (h264/vp8/vp9) to map to
+         * v4l2 control for PROFILE?
+         */
+
+        break;
+
+    case VIRTIO_VIDEO_CONTROL_LEVEL:
+        g_debug("%s: VIRTIO_VIDEO_CONTROL_LEVEL", __func__);
+
+        ctl_resp_level.hdr.stream_id = cmd->hdr.stream_id;
+        ctl_resp_level.hdr.type = VIRTIO_VIDEO_RESP_OK_GET_PARAMS;
+
+        ret = v4l2_video_get_control(s->fd, v4l2_control, &value);
+        if (ret < 0) {
+            g_printerr("v4l2_video_get_control() failed\n");
+            goto out_err_unlock;
+        }
+
+        ctl_resp_level.level.level = htole32(value);
+
+        vio_cmd->finished = true;
+        send_ctrl_response(vio_cmd, (uint8_t *)&ctl_resp_level,
+                           sizeof(struct virtio_video_get_control_resp_level));
+        break;
+
+    default:
+        g_critical("Unknown control requested!");
+        goto out_err_unlock;
+        break;
+    }
+
+    return 0;
+
+out_err_unlock:
+    ctl_resp_err.hdr.stream_id = cmd->hdr.stream_id;
+    ctl_resp_err.hdr.type = VIRTIO_VIDEO_RESP_ERR_UNSUPPORTED_CONTROL;
+    vio_cmd->finished = true;
+    send_ctrl_response(vio_cmd, (uint8_t *)&ctl_resp_err,
+                       sizeof(struct virtio_video_get_control_resp));
+    g_mutex_unlock(&s->mutex);
+out:
+    return -EINVAL;
+}
+
+static int
+handle_query_capability_cmd(struct VuVideo *v,
+                            struct vu_video_ctrl_command *cmd)
+{
+    GList *fmt_l;
+    int ret;
+    enum v4l2_buf_type buf_type;
+    struct virtio_video_query_capability *qcmd =
+        (struct virtio_video_query_capability *)cmd->cmd_buf;
+    GByteArray *querycapresp;
+
+    /* hdr bswapped already */
+    g_debug("%s: type(0x%x) stream_id(%d) %s", __func__,
+            qcmd->hdr.type, qcmd->hdr.stream_id,
+            vio_queue_name(le32toh(qcmd->queue_type)));
+
+    buf_type = get_v4l2_buf_type(le32toh(qcmd->queue_type),
+                                 v->v4l2_dev->has_mplane);
+
+    /* enumerate formats */
+    ret = video_enum_formats(v->v4l2_dev, buf_type, &fmt_l, false);
+    if (ret < 0) {
+        g_printerr("video_enum_formats failed");
+        return ret;
+    }
+
+    querycapresp = g_byte_array_new();
+    querycapresp = create_query_cap_resp(qcmd, &fmt_l, querycapresp);
+    cmd->finished = true;
+    send_ctrl_response(cmd, querycapresp->data, querycapresp->len);
+
+    video_free_formats(&fmt_l);
+    g_byte_array_free(querycapresp, true);
+
+    return 0;
+}
+
+/* for v3 virtio-video spec currently */
+static void
+video_handle_ctrl(VuDev *dev, int qidx)
+{
+    VuVirtq *vq = vu_get_queue(dev, qidx);
+    VuVideo *video = container_of(dev, VuVideo, dev.parent);
+    size_t cmd_len, len;
+
+    struct vu_video_ctrl_command *cmd;
+
+    for (;;) {
+
+        cmd = vu_queue_pop(dev, vq, sizeof(struct vu_video_ctrl_command));
+        if (!cmd) {
+            break;
+        }
+
+        cmd->vq = vq;
+        cmd->error = 0;
+        cmd->finished = false;
+        cmd->dev = dev;
+
+        cmd_len = video_iov_size(cmd->elem.out_sg, cmd->elem.out_num);
+        cmd->cmd_buf = g_malloc0(cmd_len);
+        len = video_iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
+                         0, cmd->cmd_buf, cmd_len);
+
+        if (len != cmd_len) {
+            g_warning("%s: command size incorrect %zu vs %zu\n",
+                      __func__, len, cmd_len);
+        }
+
+        /* header is first on every cmd struct */
+        cmd->cmd_hdr = (struct virtio_video_cmd_hdr *) cmd->cmd_buf;
+        /*bswap header */
+        virtio_video_ctrl_hdr_letoh(cmd->cmd_hdr);
+
+        switch (cmd->cmd_hdr->type) {
+        case VIRTIO_VIDEO_CMD_QUERY_CAPABILITY:
+            g_debug("Received VIRTIO_VIDEO_CMD_QUERY_CAPABILITY cmd");
+            handle_query_capability_cmd(video, cmd);
+            break;
+
+        case VIRTIO_VIDEO_CMD_STREAM_CREATE:
+            g_debug("Received VIRTIO_VIDEO_CMD_STREAM_CREATE cmd");
+            handle_stream_create_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_STREAM_DESTROY:
+            g_debug("Received VIRTIO_VIDEO_CMD_STREAM_DESTROY cmd");
+            handle_stream_destroy_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_STREAM_DRAIN:
+            g_debug("Received VIRTIO_VIDEO_CMD_STREAM_DRAIN cmd");
+            handle_stream_drain_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_RESOURCE_CREATE:
+            g_debug("Received VIRTIO_VIDEO_CMD_RESOURCE_CREATE cmd");
+            handle_resource_create_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_RESOURCE_QUEUE:
+            g_debug("Received VIRTIO_VIDEO_CMD_RESOURCE_QUEUE cmd");
+            handle_resource_queue_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL:
+            g_debug("Received VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL cmd");
+            handle_resource_destroy_all_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_QUEUE_CLEAR:
+            g_debug("Received VIRTIO_VIDEO_CMD_QUEUE_CLEAR cmd");
+            handle_queue_clear_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_GET_PARAMS:
+            g_debug("Received VIRTIO_VIDEO_CMD_GET_PARAMS cmd");
+            handle_get_params_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_SET_PARAMS:
+            g_debug("Received VIRTIO_VIDEO_CMD_SET_PARAMS cmd");
+            handle_set_params_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_QUERY_CONTROL:
+            g_error("**** VIRTIO_VIDEO_CMD_QUERY_CONTROL unimplemented!");
+            break;
+        case VIRTIO_VIDEO_CMD_GET_CONTROL:
+            g_debug("Received VIRTIO_VIDEO_CMD_GET_CONTROL cmd");
+            handle_get_control_cmd(video, cmd);
+            break;
+        case VIRTIO_VIDEO_CMD_SET_CONTROL:
+            g_error("**** VIRTIO_VIDEO_CMD_SET_CONTROL unimplemented!");
+            break;
+        default:
+            g_error("Unknown VIRTIO_VIDEO command!");
+            break;
+        }
+    }
+}
+
+static void
+video_queue_set_started(VuDev *dev, int qidx, bool started)
+{
+    VuVirtq *vq = vu_get_queue(dev, qidx);
+
+    g_debug("queue started %d:%d\n", qidx, started);
+
+    switch (qidx) {
+    case 0:
+        vu_set_queue_handler(dev, vq, started ? video_handle_ctrl : NULL);
+        break;
+    default:
+        break;
+    }
+}
+
+/*
+ * video_process_msg: process messages of vhost-user interface
+ *
+ * Any that are not handled here are processed by the libvhost library
+ * itself.
+ */
+static int video_process_msg(VuDev *dev, VhostUserMsg *msg, int *do_reply)
+{
+    VuVideo *r = container_of(dev, VuVideo, dev.parent);
+
+    g_debug("%s: msg %d", __func__, msg->request);
+
+    switch (msg->request) {
+    case VHOST_USER_NONE:
+        g_main_loop_quit(r->loop);
+        return 1;
+    default:
+        return 0;
+    }
+
+    return 0;
+}
+
+static const VuDevIface vuiface = {
+    .set_features = video_set_features,
+    .get_features = video_get_features,
+    .queue_set_started = video_queue_set_started,
+    .process_msg = video_process_msg,
+    .get_config = video_get_config,
+    .set_config = video_set_config,
+};
+
+static void video_destroy(VuVideo *v)
+{
+    vug_deinit(&v->dev);
+    if (socket_path) {
+        unlink(socket_path);
+    }
+
+    v4l2_backend_free(v->v4l2_dev);
+}
+
+/* Print vhost-user.json backend program capabilities */
+static void print_capabilities(void)
+{
+    printf("{\n");
+    printf("  \"type\": \"misc\"\n");
+    printf("}\n");
+}
+
+static gboolean hangup(gpointer user_data)
+{
+    GMainLoop *loop = (GMainLoop *) user_data;
+    g_info("%s: caught hangup/quit signal, quitting main loop", __func__);
+    g_main_loop_quit(loop);
+    return true;
+}
+
+int main(int argc, char *argv[])
+{
+    GError *error = NULL;
+    GOptionContext *context;
+    g_autoptr(GSocket) socket = NULL;
+    VuVideo video = {  };
+
+    context = g_option_context_new("vhost-user emulation of video device");
+    g_option_context_add_main_entries(context, options, "vhost-user-video");
+    if (!g_option_context_parse(context, &argc, &argv, &error)) {
+        g_printerr("option parsing failed: %s\n", error->message);
+        exit(1);
+    }
+
+    g_option_context_free(context);
+
+    if (print_cap) {
+        print_capabilities();
+        exit(0);
+    }
+
+    if (!socket_path && socket_fd < 0) {
+        g_printerr("Please specify either --fd or --socket-path\n");
+        exit(EXIT_FAILURE);
+    }
+
+    if (verbose || debug) {
+        g_log_set_handler(NULL, G_LOG_LEVEL_MASK, g_log_default_handler, NULL);
+        if (debug) {
+            g_setenv("G_MESSAGES_DEBUG", "all", true);
+        }
+    } else {
+        g_log_set_handler(NULL,
+                          G_LOG_LEVEL_WARNING | G_LOG_LEVEL_CRITICAL
+                          | G_LOG_LEVEL_ERROR,
+                          g_log_default_handler, NULL);
+    }
+
+    /*
+     * Open the v4l2 device and enumerate supported formats.
+     * Use this to determine whether it is a stateful encoder/decoder.
+     */
+    if (!v4l2_path || !g_file_test(v4l2_path, G_FILE_TEST_EXISTS)) {
+        g_printerr("Please specify a valid --v4l2-device\n");
+        exit(EXIT_FAILURE);
+    } else {
+        video.v4l2_dev = v4l2_backend_init(v4l2_path);
+        if (!video.v4l2_dev) {
+            g_printerr("v4l2 backend init failed!\n");
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    /*
+     * Now create a vhost-user socket that we will receive messages
+     * on. Once we have our handler set up we can enter the glib main
+     * loop.
+     */
+    if (socket_path) {
+        g_autoptr(GSocketAddress) addr = g_unix_socket_address_new(socket_path);
+        g_autoptr(GSocket) bind_socket =
+            g_socket_new(G_SOCKET_FAMILY_UNIX, G_SOCKET_TYPE_STREAM,
+                         G_SOCKET_PROTOCOL_DEFAULT, &error);
+
+        if (!g_socket_bind(bind_socket, addr, false, &error)) {
+            g_printerr("Failed to bind to socket at %s (%s).\n",
+                       socket_path, error->message);
+            exit(EXIT_FAILURE);
+        }
+        if (!g_socket_listen(bind_socket, &error)) {
+            g_printerr("Failed to listen on socket %s (%s).\n",
+                       socket_path, error->message);
+        }
+        g_message("awaiting connection to %s", socket_path);
+        socket = g_socket_accept(bind_socket, NULL, &error);
+        if (!socket) {
+            g_printerr("Failed to accept on socket %s (%s).\n",
+                       socket_path, error->message);
+        }
+    } else {
+        socket = g_socket_new_from_fd(socket_fd, &error);
+        if (!socket) {
+            g_printerr("Failed to connect to FD %d (%s).\n",
+                       socket_fd, error->message);
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    /*
+     * Create the main loop first so all the various sources can be
+     * added. As well as catching signals we need to ensure vug_init
+     * can add it's GSource watches.
+     */
+
+    video.loop = g_main_loop_new(NULL, FALSE);
+    /* catch exit signals */
+    g_unix_signal_add(SIGHUP, hangup, video.loop);
+    g_unix_signal_add(SIGINT, hangup, video.loop);
+
+    if (!vug_init(&video.dev, VHOST_USER_VIDEO_MAX_QUEUES,
+                  g_socket_get_fd(socket),
+                  video_panic, &vuiface)) {
+        g_printerr("Failed to initialize libvhost-user-glib.\n");
+        exit(EXIT_FAILURE);
+    }
+
+    g_message("entering main loop, awaiting messages");
+    g_main_loop_run(video.loop);
+    g_message("finished main loop, cleaning up");
+
+    g_main_loop_unref(video.loop);
+    video_destroy(&video);
+}
diff --git a/tools/vhost-user-video/meson.build b/tools/vhost-user-video/meson.build
new file mode 100644
index 0000000000..931e73c15d
--- /dev/null
+++ b/tools/vhost-user-video/meson.build
@@ -0,0 +1,10 @@
+executable('vhost-user-video', files(
+  'main.c', 'v4l2_backend.c', 'virtio_video_helpers.c'),
+  dependencies: [qemuutil, glib, gio, vhost_user],
+  install: true,
+  install_dir: get_option('libexecdir'))
+
+configure_file(input: '50-qemu-rpmb.json.in',
+               output: '50-qemu-rpmb.json',
+               configuration: config_host,
+               install_dir: qemu_datadir / 'vhost-user')
diff --git a/tools/vhost-user-video/v4l2_backend.c b/tools/vhost-user-video/v4l2_backend.c
new file mode 100644
index 0000000000..f90b76b172
--- /dev/null
+++ b/tools/vhost-user-video/v4l2_backend.c
@@ -0,0 +1,1777 @@
+/*
+ * virtio-video video v4l2 backend
+ *
+ * The purpose of this backend is to interface with
+ * v4l2 stateful encoder and decoder devices in the kernel.
+ *
+ * v4l2 stateless devices are NOT supported currently.
+ *
+ * Some v4l2 helper functions taken from yatva
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * Copyright (C) 2005-2010 Laurent Pinchart
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <linux/videodev2.h>
+
+#include <glib.h>
+#include <glib/gstdio.h>
+
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <sys/epoll.h>
+#include <sys/ioctl.h>
+
+#include <unistd.h>
+#include "virtio_video_helpers.h"
+#include "v4l2_backend.h"
+#include "standard-headers/linux/virtio_video.h"
+#include "vuvideo.h"
+
+/* function prototypes */
+
+static const struct v4l2_format_info *v4l2_format_by_fourcc(unsigned int fourcc);
+static const char *v4l2_format_name(unsigned int fourcc);
+static const char *v4l2_buf_type_name(enum v4l2_buf_type type);
+static const char *v4l2_field_name(enum v4l2_field field);
+
+static int video_enum_frame_intervals(struct v4l2_device *dev,
+                                      __u32 pixelformat,
+                                      unsigned int width, unsigned int height,
+                                      GList **p_vid_fmt_frm_rate_l);
+
+static int video_enum_frame_sizes(struct v4l2_device *dev, __u32 pixelformat,
+                                  GList **p_vid_fmt_frm_l);
+static int video_querycap(struct v4l2_device *dev);
+static GByteArray *iterate_frame_rate_list(GByteArray *resp,
+                                            GList *frm_rate_l);
+static GByteArray *iterate_format_frame_list(GByteArray *resp,
+                                             GList *fmt_frm_l);
+static GByteArray *iterate_format_desc_list(GByteArray *resp,
+                                            GList *fmt_desc_l);
+
+/* v4l2 to str tables & helpers taken from yavta to make prettier logs */
+
+static struct v4l2_format_info {
+    const char *name;
+    unsigned int fourcc;
+    unsigned char n_planes;
+} pixel_formats[] = {
+    { "RGB332", V4L2_PIX_FMT_RGB332, 1 },
+    { "RGB444", V4L2_PIX_FMT_RGB444, 1 },
+    { "ARGB444", V4L2_PIX_FMT_ARGB444, 1 },
+    { "XRGB444", V4L2_PIX_FMT_XRGB444, 1 },
+    { "RGB555", V4L2_PIX_FMT_RGB555, 1 },
+    { "ARGB555", V4L2_PIX_FMT_ARGB555, 1 },
+    { "XRGB555", V4L2_PIX_FMT_XRGB555, 1 },
+    { "RGB565", V4L2_PIX_FMT_RGB565, 1 },
+    { "RGB555X", V4L2_PIX_FMT_RGB555X, 1 },
+    { "RGB565X", V4L2_PIX_FMT_RGB565X, 1 },
+    { "BGR666", V4L2_PIX_FMT_BGR666, 1 },
+    { "BGR24", V4L2_PIX_FMT_BGR24, 1 },
+    { "RGB24", V4L2_PIX_FMT_RGB24, 1 },
+    { "BGR32", V4L2_PIX_FMT_BGR32, 1 },
+    { "ABGR32", V4L2_PIX_FMT_ABGR32, 1 },
+    { "XBGR32", V4L2_PIX_FMT_XBGR32, 1 },
+    { "RGB32", V4L2_PIX_FMT_RGB32, 1 },
+    { "ARGB32", V4L2_PIX_FMT_ARGB32, 1 },
+    { "XRGB32", V4L2_PIX_FMT_XRGB32, 1 },
+    { "HSV24", V4L2_PIX_FMT_HSV24, 1 },
+    { "HSV32", V4L2_PIX_FMT_HSV32, 1 },
+    { "Y8", V4L2_PIX_FMT_GREY, 1 },
+    { "Y10", V4L2_PIX_FMT_Y10, 1 },
+    { "Y12", V4L2_PIX_FMT_Y12, 1 },
+    { "Y16", V4L2_PIX_FMT_Y16, 1 },
+    { "UYVY", V4L2_PIX_FMT_UYVY, 1 },
+    { "VYUY", V4L2_PIX_FMT_VYUY, 1 },
+    { "YUYV", V4L2_PIX_FMT_YUYV, 1 },
+    { "YVYU", V4L2_PIX_FMT_YVYU, 1 },
+    { "NV12", V4L2_PIX_FMT_NV12, 1 },
+    { "NV12M", V4L2_PIX_FMT_NV12M, 2 },
+    { "NV21", V4L2_PIX_FMT_NV21, 1 },
+    { "NV21M", V4L2_PIX_FMT_NV21M, 2 },
+    { "NV16", V4L2_PIX_FMT_NV16, 1 },
+    { "NV16M", V4L2_PIX_FMT_NV16M, 2 },
+    { "NV61", V4L2_PIX_FMT_NV61, 1 },
+    { "NV61M", V4L2_PIX_FMT_NV61M, 2 },
+    { "NV24", V4L2_PIX_FMT_NV24, 1 },
+    { "NV42", V4L2_PIX_FMT_NV42, 1 },
+    { "YU12", V4L2_PIX_FMT_YVU420, 1},
+    { "YUV420M", V4L2_PIX_FMT_YUV420M, 3 },
+    { "YUV422M", V4L2_PIX_FMT_YUV422M, 3 },
+    { "YUV444M", V4L2_PIX_FMT_YUV444M, 3 },
+    { "YVU420M", V4L2_PIX_FMT_YVU420M, 3 },
+    { "YVU422M", V4L2_PIX_FMT_YVU422M, 3 },
+    { "YVU444M", V4L2_PIX_FMT_YVU444M, 3 },
+    { "SBGGR8", V4L2_PIX_FMT_SBGGR8, 1 },
+    { "SGBRG8", V4L2_PIX_FMT_SGBRG8, 1 },
+    { "SGRBG8", V4L2_PIX_FMT_SGRBG8, 1 },
+    { "SRGGB8", V4L2_PIX_FMT_SRGGB8, 1 },
+    { "SBGGR10_DPCM8", V4L2_PIX_FMT_SBGGR10DPCM8, 1 },
+    { "SGBRG10_DPCM8", V4L2_PIX_FMT_SGBRG10DPCM8, 1 },
+    { "SGRBG10_DPCM8", V4L2_PIX_FMT_SGRBG10DPCM8, 1 },
+    { "SRGGB10_DPCM8", V4L2_PIX_FMT_SRGGB10DPCM8, 1 },
+    { "SBGGR10", V4L2_PIX_FMT_SBGGR10, 1 },
+    { "SGBRG10", V4L2_PIX_FMT_SGBRG10, 1 },
+    { "SGRBG10", V4L2_PIX_FMT_SGRBG10, 1 },
+    { "SRGGB10", V4L2_PIX_FMT_SRGGB10, 1 },
+    { "SBGGR10P", V4L2_PIX_FMT_SBGGR10P, 1 },
+    { "SGBRG10P", V4L2_PIX_FMT_SGBRG10P, 1 },
+    { "SGRBG10P", V4L2_PIX_FMT_SGRBG10P, 1 },
+    { "SRGGB10P", V4L2_PIX_FMT_SRGGB10P, 1 },
+    { "SBGGR12", V4L2_PIX_FMT_SBGGR12, 1 },
+    { "SGBRG12", V4L2_PIX_FMT_SGBRG12, 1 },
+    { "SGRBG12", V4L2_PIX_FMT_SGRBG12, 1 },
+    { "SRGGB12", V4L2_PIX_FMT_SRGGB12, 1 },
+    { "IPU3_SBGGR10", V4L2_PIX_FMT_IPU3_SBGGR10, 1 },
+    { "IPU3_SGBRG10", V4L2_PIX_FMT_IPU3_SGBRG10, 1 },
+    { "IPU3_SGRBG10", V4L2_PIX_FMT_IPU3_SGRBG10, 1 },
+    { "IPU3_SRGGB10", V4L2_PIX_FMT_IPU3_SRGGB10, 1 },
+    { "DV", V4L2_PIX_FMT_DV, 1 },
+    { "MJPEG", V4L2_PIX_FMT_MJPEG, 1 },
+    { "MPEG", V4L2_PIX_FMT_MPEG, 1 },
+    { "FWHT", V4L2_PIX_FMT_FWHT, 1 },
+};
+
+bool video_is_mplane(enum v4l2_buf_type type)
+{
+    return type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+        type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+}
+
+bool video_is_splane(enum v4l2_buf_type type)
+{
+    return type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+        type == V4L2_BUF_TYPE_VIDEO_OUTPUT;
+}
+bool video_is_meta(enum v4l2_buf_type type)
+{
+    return type == V4L2_BUF_TYPE_META_CAPTURE ||
+        type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+bool is_capture_queue(enum v4l2_buf_type type)
+{
+    return type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+        type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+        type == V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+bool is_output_queue(enum v4l2_buf_type type)
+{
+    return type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
+        type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
+        type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+static const struct v4l2_format_info *v4l2_format_by_fourcc(unsigned int fourcc)
+{
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(pixel_formats); ++i) {
+        if (pixel_formats[i].fourcc == fourcc) {
+            return &pixel_formats[i];
+        }
+    }
+
+    return NULL;
+}
+
+static const char *v4l2_format_name(unsigned int fourcc)
+{
+    const struct v4l2_format_info *info;
+    static char name[5];
+    unsigned int i;
+
+    info = v4l2_format_by_fourcc(fourcc);
+    if (info) {
+        return info->name;
+    }
+
+    for (i = 0; i < 4; ++i) {
+        name[i] = fourcc & 0xff;
+        fourcc >>= 8;
+    }
+
+    name[4] = '\0';
+    return name;
+}
+
+static struct {
+    enum v4l2_buf_type type;
+    bool supported;
+    const char *name;
+} buf_types_array[] = {
+    { V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 1, "Video capture mplanes", },
+    { V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, 1, "Video output mplanes", },
+    { V4L2_BUF_TYPE_VIDEO_CAPTURE, 1, "Video capture", },
+    { V4L2_BUF_TYPE_VIDEO_OUTPUT, 1, "Video output", },
+    { V4L2_BUF_TYPE_VIDEO_OVERLAY, 0, "Video overlay", },
+    { V4L2_BUF_TYPE_META_CAPTURE, 0, "Meta-data capture", },
+    { V4L2_BUF_TYPE_META_OUTPUT, 0, "Meta-data output", },
+};
+
+static const char *v4l2_buf_type_name(enum v4l2_buf_type type)
+{
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(buf_types_array); ++i) {
+        if (buf_types_array[i].type == type) {
+            return buf_types_array[i].name;
+        }
+    }
+
+    if (type & V4L2_BUF_TYPE_PRIVATE) {
+        return "Private";
+    } else {
+        return "Unknown";
+    }
+}
+
+static const struct {
+    const char *name;
+    enum v4l2_field field;
+} fields[] = {
+    { "any", V4L2_FIELD_ANY },
+    { "none", V4L2_FIELD_NONE },
+    { "top", V4L2_FIELD_TOP },
+    { "bottom", V4L2_FIELD_BOTTOM },
+    { "interlaced", V4L2_FIELD_INTERLACED },
+    { "seq-tb", V4L2_FIELD_SEQ_TB },
+    { "seq-bt", V4L2_FIELD_SEQ_BT },
+    { "alternate", V4L2_FIELD_ALTERNATE },
+    { "interlaced-tb", V4L2_FIELD_INTERLACED_TB },
+    { "interlaced-bt", V4L2_FIELD_INTERLACED_BT },
+};
+
+static const char *v4l2_field_name(enum v4l2_field field)
+{
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(fields); ++i) {
+        if (fields[i].field == field) {
+            return fields[i].name;
+        }
+    }
+
+    return "unknown";
+}
+
+int v4l2_open(const gchar *devname)
+{
+    int fd;
+
+    if (!devname) {
+        return -EINVAL;
+    }
+
+    fd = open(devname, O_RDWR | O_NONBLOCK);
+    if (fd < 0) {
+        g_printerr("Error opening device %s: %s (%d).\n", devname,
+                   g_strerror(errno), errno);
+        return fd;
+    }
+
+    g_print("Device %s opened fd(%d).\n", devname, fd);
+
+    return fd;
+}
+
+int v4l2_close(int fd)
+{
+    int ret;
+    ret = close(fd);
+
+    if (ret < 0) {
+        g_printerr("%s: close failed errno(%s)", __func__, g_strerror(errno));
+    }
+    return ret;
+}
+
+static int video_enum_frame_intervals(struct v4l2_device *dev,
+                                      __u32 pixelformat,
+                                      unsigned int width, unsigned int height,
+                                      GList **p_vid_fmt_frm_rate_l)
+{
+    struct v4l2_frmivalenum ival;
+    GList *vid_fmt_frm_rate_l = NULL;
+    struct video_format_frame_rates *fmt_frm_rate;
+    unsigned int i;
+    int ret = 0;
+
+    for (i = 0; ; ++i) {
+        memset(&ival, 0, sizeof ival);
+        ival.index = i;
+        ival.pixel_format = pixelformat;
+        ival.width = width;
+        ival.height = height;
+        ret = ioctl(dev->fd, VIDIOC_ENUM_FRAMEINTERVALS, &ival);
+        if (ret < 0) {
+            if (errno == EINVAL) /* EINVAL means no more frame intervals */
+                ret = 0;
+            else
+                g_printerr("%s: VIDIOC_ENUM_FRAMEINTERVALS failed %s\n"
+                           , __func__, g_strerror(errno));
+            break;
+        }
+
+        /* driver sanity checks */
+        if (i != ival.index)
+            g_printerr("Warning: driver returned wrong ival index "
+                       "%u.\n", ival.index);
+        if (pixelformat != ival.pixel_format)
+            g_printerr("Warning: driver returned wrong ival pixel "
+                       "format %08x.\n", ival.pixel_format);
+        if (width != ival.width)
+            g_printerr("Warning: driver returned wrong ival width "
+                       "%u.\n", ival.width);
+        if (height != ival.height)
+            g_printerr("Warning: driver returned wrong ival height "
+                       "%u.\n", ival.height);
+
+        if (i != 0) {
+            g_print(", ");
+        }
+
+        /* allocate video_format_frame */
+        fmt_frm_rate = g_new0(struct video_format_frame_rates, 1);
+        /* keep a copy of v4l2 frmsizeenum struct */
+        memcpy(&fmt_frm_rate->v4l_ival, &ival,
+               sizeof(struct v4l2_frmivalenum));
+        vid_fmt_frm_rate_l =
+            g_list_append(vid_fmt_frm_rate_l, fmt_frm_rate);
+
+        switch (ival.type) {
+        case V4L2_FRMIVAL_TYPE_DISCRETE:
+            g_debug("%u/%u",
+                    ival.discrete.numerator,
+                    ival.discrete.denominator);
+
+            fmt_frm_rate->frame_rates.min = ival.discrete.denominator;
+
+            break;
+
+        case V4L2_FRMIVAL_TYPE_CONTINUOUS:
+            g_debug("%u/%u - %u/%u",
+                    ival.stepwise.min.numerator,
+                    ival.stepwise.min.denominator,
+                    ival.stepwise.max.numerator,
+                    ival.stepwise.max.denominator);
+
+            fmt_frm_rate->frame_rates.min = ival.stepwise.min.denominator;
+            fmt_frm_rate->frame_rates.max = ival.stepwise.max.denominator;
+            fmt_frm_rate->frame_rates.step = 1;
+
+            goto out;
+
+        case V4L2_FRMIVAL_TYPE_STEPWISE:
+            g_debug("%u/%u - %u/%u (by %u/%u)",
+                    ival.stepwise.min.numerator,
+                    ival.stepwise.min.denominator,
+                    ival.stepwise.max.numerator,
+                    ival.stepwise.max.denominator,
+                    ival.stepwise.step.numerator,
+                    ival.stepwise.step.denominator);
+
+            fmt_frm_rate->frame_rates.min = ival.stepwise.min.denominator;
+            fmt_frm_rate->frame_rates.max = ival.stepwise.max.denominator;
+            fmt_frm_rate->frame_rates.step = ival.stepwise.step.denominator;
+
+            goto out;
+
+        default:
+            break;
+        }
+    }
+
+out:
+    if (ret == 0) {
+        g_print("\n%s: Enumerated %d frame intervals\n", __func__
+                , g_list_length(vid_fmt_frm_rate_l));
+        g_return_val_if_fail(i == g_list_length(vid_fmt_frm_rate_l), -EINVAL);
+        *p_vid_fmt_frm_rate_l = vid_fmt_frm_rate_l;
+    }
+
+    return ret;
+}
+
+static int video_enum_frame_sizes(struct v4l2_device *dev,
+                                  __u32 pixelformat, GList **p_vid_fmt_frm_l)
+{
+    struct v4l2_frmsizeenum frame;
+    struct video_format_frame *vid_frame = NULL;
+    GList *vid_fmt_frm_l = NULL;
+    unsigned int i;
+    int ret;
+
+    if (!dev) {
+        return -EINVAL;
+    }
+
+    for (i = 0; ; ++i) {
+        memset(&frame, 0, sizeof frame);
+        frame.index = i;
+        frame.pixel_format = pixelformat;
+        ret = ioctl(dev->fd, VIDIOC_ENUM_FRAMESIZES, &frame);
+        if (ret < 0) {
+            if (errno == EINVAL) /* EINVAL means no more frame sizes */
+                ret = 0;
+            else
+                g_printerr("%s: VIDIOC_ENUM_FRAMESIZES failed %s\n",
+                           __func__, g_strerror(errno));
+            break;
+        }
+
+        /* driver sanity checks */
+        if (i != frame.index)
+            g_printerr("Warning: driver returned wrong frame index "
+                       "%u.\n", frame.index);
+        if (pixelformat != frame.pixel_format)
+            g_printerr("Warning: driver returned wrong frame pixel "
+                       "format %08x.\n", frame.pixel_format);
+
+        /* allocate video_format_frame */
+        vid_frame = g_new0(struct video_format_frame, 1);
+        /* keep a copy of v4l2 frmsizeenum struct */
+        memcpy(&vid_frame->v4l_framesize, &frame,
+               sizeof(struct v4l2_frmsizeenum));
+        vid_fmt_frm_l = g_list_append(vid_fmt_frm_l, vid_frame);
+
+        switch (frame.type) {
+        case V4L2_FRMSIZE_TYPE_DISCRETE:
+            g_debug("\tFrame size (D): %ux%u (", frame.discrete.width,
+                    frame.discrete.height);
+
+            vid_frame->frame.width.min = htole32(frame.discrete.width);
+            vid_frame->frame.width.max = htole32(frame.discrete.width);
+            vid_frame->frame.height.min = htole32(frame.discrete.height);
+            vid_frame->frame.height.max = htole32(frame.discrete.height);
+
+            if (video_enum_frame_intervals(dev, frame.pixel_format,
+                                           frame.discrete.width,
+                                           frame.discrete.height,
+                                           &vid_frame->frm_rate_l) < 0)
+                g_printerr("%s: video_enum_frame_intervals failed!", __func__);
+            g_debug(")");
+            break;
+
+        case V4L2_FRMSIZE_TYPE_CONTINUOUS:
+            g_debug("\tFrame size (C): %ux%u - %ux%u (",
+                    frame.stepwise.min_width,
+                    frame.stepwise.min_height,
+                    frame.stepwise.max_width,
+                    frame.stepwise.max_height);
+
+            vid_frame->frame.width.min = htole32(frame.stepwise.min_width);
+            vid_frame->frame.width.max = htole32(frame.stepwise.max_width);
+            vid_frame->frame.width.step = htole32(frame.stepwise.step_width);
+            vid_frame->frame.height.min = htole32(frame.stepwise.min_height);
+            vid_frame->frame.height.max = htole32(frame.stepwise.max_height);
+            vid_frame->frame.height.step = htole32(frame.stepwise.step_height);
+
+            /* driver sanity check */
+            if (frame.stepwise.step_height != 1 ||
+                frame.stepwise.step_width != 1) {
+                g_printerr("Warning: invalid step for continuous framesize");
+            }
+
+            if (video_enum_frame_intervals(dev, frame.pixel_format,
+                                           frame.stepwise.max_width,
+                                           frame.stepwise.max_height,
+                                           &vid_frame->frm_rate_l) < 0)
+                g_printerr("%s: video_enum_frame_intervals failed!\n"
+                           , __func__);
+
+            g_debug(")");
+            break;
+
+        case V4L2_FRMSIZE_TYPE_STEPWISE:
+            g_debug("\tFrame size (S): %ux%u - %ux%u (by %ux%u) (",
+                    frame.stepwise.min_width,
+                    frame.stepwise.min_height,
+                    frame.stepwise.max_width,
+                    frame.stepwise.max_height,
+                    frame.stepwise.step_width,
+                    frame.stepwise.step_height);
+
+            vid_frame->frame.width.min = htole32(frame.stepwise.min_width);
+            vid_frame->frame.width.max = htole32(frame.stepwise.max_width);
+            vid_frame->frame.width.step = htole32(frame.stepwise.step_width);
+            vid_frame->frame.height.min = htole32(frame.stepwise.min_height);
+            vid_frame->frame.height.max = htole32(frame.stepwise.max_height);
+            vid_frame->frame.height.step = htole32(frame.stepwise.step_height);
+
+            if (video_enum_frame_intervals(dev, frame.pixel_format,
+                                       frame.stepwise.max_width,
+                                       frame.stepwise.max_height,
+                                       &vid_frame->frm_rate_l) < 0)
+                g_printerr("%s: video_enum_frame_intervals failed!\n"
+                           , __func__);
+
+            g_debug(")");
+            break;
+
+        default:
+            break;
+        }
+    }
+    if (ret == 0) {
+        g_print("%s: Enumerated %d frame sizes and %d frame intervals\n",
+                __func__, g_list_length(vid_fmt_frm_l),
+                g_list_length(vid_frame->frm_rate_l));
+
+        vid_frame->frame.num_rates =
+            htole32(g_list_length(vid_frame->frm_rate_l));
+
+        g_return_val_if_fail(i == g_list_length(vid_fmt_frm_l), -EINVAL);
+        *p_vid_fmt_frm_l = vid_fmt_frm_l;
+    }
+
+    return ret;
+}
+
+int video_send_decoder_start_cmd(struct v4l2_device *dev)
+{
+    int ret = 0;
+    struct v4l2_decoder_cmd cmd;
+    g_debug("%s: ", __func__);
+
+    cmd.cmd = V4L2_DEC_CMD_START;
+    cmd.flags = 0;
+    cmd.start.speed = 1000;
+
+    memset(&cmd, 0, sizeof cmd);
+
+    ret = ioctl(dev->fd, VIDIOC_DECODER_CMD, &cmd);
+    if (ret < 0) {
+        g_printerr("%s: %s (%d)\n", __func__, g_strerror(errno), errno);
+    }
+
+    return ret;
+}
+
+static int video_querycap(struct v4l2_device *dev)
+{
+        struct v4l2_capability cap;
+        unsigned int caps;
+        bool has_video;
+        bool has_meta;
+        bool has_capture;
+        bool has_output;
+        bool has_mplane;
+        int ret;
+
+        memset(&cap, 0, sizeof cap);
+        ret = ioctl(dev->fd, VIDIOC_QUERYCAP, &cap);
+        if (ret < 0) {
+                return 0;
+        }
+
+        caps = cap.capabilities & V4L2_CAP_DEVICE_CAPS
+             ? cap.device_caps : cap.capabilities;
+
+        has_video = caps & (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+                            V4L2_CAP_VIDEO_CAPTURE |
+                            V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+                            V4L2_CAP_VIDEO_OUTPUT);
+        has_meta = caps & (V4L2_CAP_META_CAPTURE |
+                           V4L2_CAP_META_OUTPUT);
+        has_capture = caps & (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+                              V4L2_CAP_VIDEO_CAPTURE |
+                              V4L2_CAP_META_CAPTURE);
+        has_output = caps & (V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+                             V4L2_CAP_VIDEO_OUTPUT |
+                             V4L2_CAP_META_OUTPUT);
+        has_mplane = caps & (V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+                             V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+                             V4L2_CAP_VIDEO_M2M_MPLANE);
+
+        g_print("Device `%s' on `%s' (driver '%s') "
+                "supports%s%s%s%s %s mplanes.\n",
+                cap.card, cap.bus_info, cap.driver,
+                has_video ? " video," : "",
+                has_meta ? " meta-data," : "",
+                has_capture ? " capture," : "",
+                has_output ? " output," : "",
+                has_mplane ? "with" : "without");
+
+        dev->capabilities = caps;
+        dev->has_mplane = has_mplane;
+
+        return 0;
+}
+
+void v4l2_set_device_type(struct v4l2_device *dev, enum v4l2_buf_type type,
+                          struct v4l2_fmtdesc *fmt_desc)
+{
+    if (fmt_desc->flags & V4L2_FMT_FLAG_COMPRESSED) {
+
+        switch (fmt_desc->pixelformat) {
+        case V4L2_PIX_FMT_H263:
+        case V4L2_PIX_FMT_H264:
+        case V4L2_PIX_FMT_H264_NO_SC:
+        case V4L2_PIX_FMT_H264_MVC:
+        case V4L2_PIX_FMT_MPEG1:
+        case V4L2_PIX_FMT_MPEG2:
+        case V4L2_PIX_FMT_MPEG4:
+        case V4L2_PIX_FMT_XVID:
+        case V4L2_PIX_FMT_VC1_ANNEX_G:
+        case V4L2_PIX_FMT_VC1_ANNEX_L:
+        case V4L2_PIX_FMT_VP8:
+        case V4L2_PIX_FMT_VP9:
+        case V4L2_PIX_FMT_HEVC:
+        case V4L2_PIX_FMT_FWHT:
+            if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+                dev->dev_type |= STATEFUL_DECODER;
+            }
+            if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+                dev->dev_type |= STATEFUL_DECODER;
+            }
+            if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+                dev->dev_type |= STATEFUL_ENCODER;
+            }
+            if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+                dev->dev_type |= STATEFUL_ENCODER;
+            }
+            break;
+        case V4L2_PIX_FMT_MPEG2_SLICE:
+        case V4L2_PIX_FMT_FWHT_STATELESS:
+            if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+                dev->dev_type |= STATELESS_DECODER;
+            }
+            if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+                dev->dev_type |= STATELESS_DECODER;
+            }
+            if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+                dev->dev_type |= STATELESS_ENCODER;
+            }
+            if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+                dev->dev_type |= STATELESS_ENCODER;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+}
+
+enum v4l2_buf_type get_v4l2_buf_type (enum virtio_video_queue_type queue_type,
+                                      bool has_mplane)
+{
+    enum v4l2_buf_type buf_type;
+
+    switch (queue_type) {
+    case VIRTIO_VIDEO_QUEUE_TYPE_INPUT:
+        buf_type = has_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
+            : V4L2_BUF_TYPE_VIDEO_OUTPUT;
+        break;
+    case VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT:
+        buf_type = has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
+            : V4L2_BUF_TYPE_VIDEO_CAPTURE;
+        break;
+
+    default:
+        g_warning("%s: Unknown queue_type!", __func__);
+    }
+
+    g_debug("%s: queue_type(0x%x) has_mplane(%d), buf_type(%s)"
+            , __func__, queue_type, has_mplane, v4l2_buf_type_name(buf_type));
+
+    return buf_type;
+}
+
+int v4l2_free_buffers(int fd, enum v4l2_buf_type type)
+{
+    struct v4l2_requestbuffers reqbuf;
+    int ret;
+    g_debug("%s: v4l2_buf_type: %s: Issuing REQBUFS 0"
+            , __func__, v4l2_buf_type_name(type));
+
+    memset(&reqbuf, 0, sizeof(reqbuf));
+    reqbuf.type = type;
+    reqbuf.count = 0;
+
+    /*TODO must save this when creating resource on queue */
+    reqbuf.memory = V4L2_MEMORY_USERPTR;
+
+    /*
+     * Applications can call ioctl VIDIOC_REQBUFS again to change the number
+     * of buffers. Note that if any buffers are still mapped or exported via
+     * DMABUF, then ioctl VIDIOC_REQBUFS can only succeed if the
+     * V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS capability is set. Otherwise ioctl
+     * VIDIOC_REQBUFS will return the EBUSY error code. If
+     * V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS is set, then these buffers are
+     * orphanedand will be freed when they are unmapped or when the exported
+     * DMABUF fds are closed. A count value of zero frees or orphans all
+     * buffers, after aborting or finishing any DMA in progress, an implicit
+     * VIDIOC_STREAMOFF.
+     */
+
+    /* TODO support V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS */
+
+    ret = ioctl(fd, VIDIOC_REQBUFS, &reqbuf);
+    if (ret == -1) {
+        if (errno == EBUSY) {
+            g_critical("%s: EBUSY: buffers for %s still mapped or exported!\n"
+                       , __func__, v4l2_buf_type_name(type));
+        } else {
+            g_printerr("VIDIOC_REQBUFS failed: %s (%d)\n"
+                       , g_strerror(errno), errno);
+        }
+        goto out;
+    }
+    g_debug("%s: VIDIOC_REQBUFS capabilities(0x%x) granted(%d)"
+            , __func__, reqbuf.capabilities, reqbuf.count);
+
+out:
+    return ret;
+}
+
+int v4l2_resource_create(struct stream *s, enum v4l2_buf_type type,
+                         enum virtio_video_mem_type mem_type,
+                         struct resource *res)
+{
+    struct v4l2_requestbuffers reqbuf;
+    int ret;
+    g_debug("%s: v4l2_buf_type: %s", __func__, v4l2_buf_type_name(type));
+
+    memset(&reqbuf, 0, sizeof(reqbuf));
+    reqbuf.type = type;
+    reqbuf.count = 1;
+
+    if (is_output_queue(type)) {
+        reqbuf.count = s->output_bufcount + 1;
+    } else if (is_capture_queue(type)) {
+        reqbuf.count = s->capture_bufcount + 1;
+    }
+
+    if (mem_type == VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES) {
+        reqbuf.memory = V4L2_MEMORY_USERPTR;
+    } else if (mem_type == VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT) {
+        /* TODO */
+        g_error("%s: VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT not implemented\n"
+                , __func__);
+        ret = -EINVAL;
+        goto out;
+    }
+
+    ret = ioctl(s->fd, VIDIOC_REQBUFS, &reqbuf);
+    if (ret == -1) {
+        g_printerr("VIDIOC_REQBUFS failed: %s (%d)\n"
+                   , g_strerror(errno), errno);
+        goto out;
+    }
+    g_debug("%s: VIDIOC_REQBUFS capabilities(0x%x) granted(%d)!"
+            , __func__, reqbuf.capabilities, reqbuf.count);
+
+    if (is_output_queue(type)) {
+        s->output_bufcount = reqbuf.count;
+        res->v4l2_index = reqbuf.count - 1;
+    } else if (is_capture_queue(type)) {
+        s->capture_bufcount = reqbuf.count;
+        res->v4l2_index = reqbuf.count - 1;
+    }
+
+    res->type = type;
+out:
+    return ret;
+}
+
+/* timestamp in nsecs */
+void convert_to_timeval(uint64_t timestamp, struct timeval *t)
+{
+    uint64_t f_nsecs;
+
+    uint64_t nsecs;
+
+    /* convert to seconds */
+    t->tv_sec = timestamp / 1000000000;
+
+    /* deal with fraction of a second */
+    f_nsecs = t->tv_sec * 1000000000;
+    t->tv_usec = (timestamp - f_nsecs) / 1000;
+
+    /* sanity check above conversion */
+    nsecs = t->tv_sec * 1000000000;
+    nsecs += (t->tv_usec * 1000);
+
+    if (timestamp != nsecs) {
+        g_critical("%s: timestamp != nsecs", __func__);
+    }
+}
+
+int ioctl_streamon(struct stream *s, enum v4l2_buf_type type)
+{
+    int ret = 0;
+    ret = ioctl(s->fd, VIDIOC_STREAMON, &type);
+    if (ret < 0) {
+        g_printerr("VIDIOC_STREAMON failed: fd=(%d) buf type=%s %s (%d).\n"
+                   , s->fd, v4l2_buf_type_name(type), g_strerror(errno), errno);
+    } else {
+        g_debug("%s: VIDIOC_STREAMON OK fd=(%d) buf type: %s"
+                , __func__, s->fd, v4l2_buf_type_name(type));
+        if (is_output_queue(type)) {
+            s->output_streaming = true;
+        }
+        if (is_capture_queue(type)) {
+            s->capture_streaming = true;
+        }
+    }
+    return ret;
+}
+
+int ioctl_streamoff(struct stream *s, enum v4l2_buf_type type)
+{
+    int ret = 0;
+    ret = ioctl(s->fd, VIDIOC_STREAMOFF, &type);
+    if (ret < 0) {
+        g_printerr("VIDIOC_STREAMOFF failed: fd=(%d) buf type=%s: %s (%d).\n"
+                   , s->fd, v4l2_buf_type_name(type), g_strerror(errno), errno);
+    } else {
+        g_debug("%s: VIDIOC_STREAMOFF OK buf type: %s"
+                , __func__, v4l2_buf_type_name(type));
+
+        if (is_output_queue(type)) {
+            s->output_streaming = false;
+        }
+        if (is_capture_queue(type)) {
+            s->capture_streaming = false;
+        }
+
+        /*
+         * if either queue has STREAMOFF applied, then we enter STOPPED
+         * Assumes that s->mutex is held by calling function
+         */
+        s->stream_state = STREAM_STOPPED;
+        g_cond_signal(&s->stream_cond);
+    }
+    return ret;
+}
+
+/* activate streaming on both queues */
+int v4l2_streamon(struct v4l2_device *dev, enum v4l2_buf_type type,
+                  struct stream *s)
+{
+    int ret = 0;
+    bool is_mplane = video_is_mplane(type);
+    enum v4l2_buf_type type2;
+
+    if (!s->subscribed_events) {
+        /* subscribe for SOURCE_CHANGE event */
+        if (dev->sup_dyn_res_switching) {
+            ret = v4l2_subscribe_event(s, V4L2_EVENT_SOURCE_CHANGE, 0);
+            if (ret < 0) {
+                g_printerr("%s: V4L2_EVENT_SOURCE_CHANGE failed\n", __func__);
+            }
+        }
+        /* subscribe for EOS event */
+        ret = v4l2_subscribe_event(s, V4L2_EVENT_EOS, 0);
+        if (ret < 0) {
+            g_printerr("%s: V4L2_EVENT_EOS failed\n", __func__);
+        }
+        s->subscribed_events = true;
+    }
+
+    switch (type) {
+    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+    case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+    case V4L2_BUF_TYPE_META_OUTPUT:
+        if (s->output_streaming == false) {
+            ret |= ioctl_streamon(s, type);
+        }
+
+        if (s->capture_streaming == false) {
+            type2 = is_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+                V4L2_BUF_TYPE_VIDEO_CAPTURE;
+            ret |= ioctl_streamon(s, type2);
+        }
+        break;
+
+    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+    case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+    case V4L2_BUF_TYPE_META_CAPTURE:
+        if (s->capture_streaming == false) {
+            ret |= ioctl_streamon(s, type);
+        }
+        if (s->output_streaming == false) {
+            type2 = is_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
+                V4L2_BUF_TYPE_VIDEO_OUTPUT;
+            ret |= ioctl_streamon(s, type2);
+        }
+        break;
+
+    default:
+        g_printerr("%s: unknown v4l2 buffer type!", __func__);
+        ret = EINVAL;
+    }
+
+    if (s->stream_state != STREAM_DRAINING) {
+        s->stream_state = STREAM_STREAMING;
+        g_cond_signal(&s->stream_cond);
+    }
+
+    return ret;
+}
+
+int v4l2_streamoff(enum v4l2_buf_type type, struct stream *s)
+{
+    int ret = 0;
+    bool is_mplane = video_is_mplane(type);
+    enum v4l2_buf_type type2;
+
+    switch (type) {
+    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+    case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+    case V4L2_BUF_TYPE_META_OUTPUT:
+        if (s->output_streaming == true) {
+            ret |= ioctl_streamoff(s, type);
+        }
+
+        if (s->capture_streaming == true) {
+            type2 = is_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
+                : V4L2_BUF_TYPE_VIDEO_CAPTURE;
+            ret |= ioctl_streamoff(s, type2);
+        }
+        break;
+
+    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+    case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+    case V4L2_BUF_TYPE_META_CAPTURE:
+        if (s->capture_streaming == true) {
+            ret |= ioctl_streamoff(s, type);
+        }
+        if (s->output_streaming == true) {
+            type2 = is_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
+                : V4L2_BUF_TYPE_VIDEO_OUTPUT;
+            ret |= ioctl_streamoff(s, type2);
+        }
+        break;
+
+    default:
+        g_printerr("%s: unknown v4l2 buffer type!", __func__);
+        ret = EINVAL;
+    }
+
+    return ret;
+}
+
+int v4l2_subscribe_event(struct stream *s,
+                         uint32_t event_type, uint32_t id)
+{
+    int ret = 0;
+    struct v4l2_event_subscription sub;
+
+    memset(&sub, 0, sizeof(sub));
+    sub.type = event_type;
+    sub.id = 0;
+
+    if (event_type == V4L2_EVENT_SOURCE_CHANGE) {
+        sub.id = id;
+    }
+
+    ret = ioctl(s->fd, VIDIOC_SUBSCRIBE_EVENT, &sub);
+    if (ret < 0) {
+        g_printerr("%s: VIDIOC_SUBSCRIBE_EVENT failed", __func__);
+        return ret;
+    }
+
+    g_debug("%s event(0x%x) OK!", __func__, event_type);
+
+    return ret;
+}
+
+void v4l2_print_event(const struct v4l2_event *ev)
+{
+    g_debug("%s: %ld.%06ld: event %u, pending %u: ", __func__,
+            ev->timestamp.tv_sec, ev->timestamp.tv_nsec / 1000,
+            ev->sequence, ev->pending);
+    switch (ev->type) {
+    case V4L2_EVENT_VSYNC:
+        g_debug("%s: vsync\n", __func__);
+        break;
+    case V4L2_EVENT_EOS:
+        g_debug("%s: eos\n", __func__);
+        break;
+    case V4L2_EVENT_CTRL:
+        g_debug("%s: eos\n", __func__);
+        break;
+    case V4L2_EVENT_FRAME_SYNC:
+        g_debug("%s: frame_sync %d\n", __func__, ev->u.frame_sync.frame_sequence);
+        break;
+    case V4L2_EVENT_SOURCE_CHANGE:
+        g_debug("%s: source_change!: pad/input=%d changes: %x\n"
+                , __func__, ev->id, ev->u.src_change.changes);
+         break;
+    case V4L2_EVENT_MOTION_DET:
+        if (ev->u.motion_det.flags & V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ) {
+            g_debug("%s: motion_det frame %d, regions 0x%x\n", __func__,
+                    ev->u.motion_det.frame_sequence,
+                    ev->u.motion_det.region_mask);
+        } else {
+            g_debug("%s: motion_det regions 0x%x\n", __func__
+                    , ev->u.motion_det.region_mask);
+        }
+        break;
+    default:
+        if (ev->type >= V4L2_EVENT_PRIVATE_START) {
+            g_debug("unknown private event (%08x)\n", ev->type);
+        } else {
+            g_debug("unknown event (%08x)\n", ev->type);
+        }
+        break;
+    }
+}
+
+int v4l2_queue_buffer(int fd, enum v4l2_buf_type type,
+                      struct virtio_video_resource_queue *qcmd,
+                      struct resource *res, struct stream *s,
+                      struct v4l2_device *dev)
+{
+    struct v4l2_buffer vbuf;
+    int ret = 0;
+
+    memset(&vbuf, 0, sizeof(vbuf));
+    vbuf.index = res->v4l2_index;
+
+    vbuf.type = type;
+    vbuf.field = V4L2_FIELD_NONE;
+    vbuf.flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+
+    g_debug("%s: type=%s index=%d", __func__,
+            v4l2_buf_type_name(type), vbuf.index);
+
+    convert_to_timeval(le64toh(qcmd->timestamp), &vbuf.timestamp);
+
+    /* if using GUEST_PAGES queued using USERPTR mechanism */
+    vbuf.memory = V4L2_MEMORY_USERPTR;
+
+    if (video_is_mplane(type)) {
+        /* for mplane length field is number of elements in planes array */
+        vbuf.length = res->vio_resource.num_planes;
+        vbuf.m.planes = g_malloc0(sizeof(struct v4l2_plane)
+                                  * res->vio_resource.num_planes);
+
+        for (int i = 0; i < vbuf.length; i++) {
+            vbuf.m.planes[i].m.userptr = (unsigned long)res->iov[i].iov_base;
+            vbuf.m.planes[i].length = (unsigned long)res->iov[i].iov_len;
+        }
+    } else {
+        /* m is a union of userptr, *planes and fd */
+        vbuf.m.userptr = (unsigned long)res->iov[0].iov_base;
+        vbuf.length = res->iov[0].iov_len;
+        g_debug("%s: iov_base = 0x%p", __func__, res->iov[0].iov_base);
+        g_debug("%s: iov_len = 0x%lx", __func__, res->iov[0].iov_len);
+    }
+
+    ret = v4l2_streamon(dev, type, s);
+    if (ret < 0) {
+        g_printerr("v4l2_streamon failed (%d)", ret);
+        /* only print error, as v4l2_streamon() does both queues */
+    }
+
+    ret = ioctl(fd, VIDIOC_QBUF, &vbuf);
+    if (ret < 0) {
+        qcmd->hdr.type = VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER;
+        g_printerr("Unable to QBUF: %s (%d).\n", g_strerror(errno), errno);
+        return ret;
+    }
+
+    res->queued = true;
+    if (video_is_mplane(type)) {
+        g_free(vbuf.m.planes);
+    }
+
+    g_debug("%s: Queued resource-id(%d) buf_type=%s v4l2_index(%d) "
+            "virtio_queue(0x%x)", __func__, res->vio_resource.resource_id,
+            v4l2_buf_type_name(type), res->v4l2_index,
+            res->vio_resource.queue_type);
+
+    return ret;
+
+}
+
+int v4l2_dequeue_buffer(int fd, enum v4l2_buf_type type,
+                        struct stream *s)
+{
+    struct v4l2_buffer vbuf;
+    int ret = 0;
+    struct resource *r;
+    struct virtio_video_resource_queue_resp resp;
+    struct vu_video_ctrl_command *vio_cmd;
+
+    memset(&vbuf, 0, sizeof(vbuf));
+
+    vbuf.type = type;
+    vbuf.memory =  V4L2_MEMORY_USERPTR;
+
+    vbuf.field = V4L2_FIELD_NONE;
+    vbuf.flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+
+    if (video_is_mplane(type)) {
+        /* for mplane length field is number of elements in planes array */
+        vbuf.length = VIRTIO_VIDEO_MAX_PLANES;
+        vbuf.m.planes = g_malloc0(sizeof(struct v4l2_plane)
+                                  * VIRTIO_VIDEO_MAX_PLANES);
+
+        g_debug("%s: mplane allocating planes array", __func__);
+    }
+
+    ret = ioctl(fd, VIDIOC_DQBUF, &vbuf);
+    if (ret < 0) {
+        g_printerr("Unable to DQBUF: %s (%d).\n", g_strerror(errno), errno);
+        return ret;
+    }
+
+    g_debug("%s: VIDIOC_DQBUF OK index(%d)!", __func__, vbuf.index);
+
+    if (video_is_mplane(type)) {
+        g_free(vbuf.m.planes);
+    }
+
+    r = find_resource_by_v4l2index(s, type, vbuf.index);
+    if (!r) {
+        g_printerr("%s: Can't find resource for dequeued buffer!", __func__);
+        return -EINVAL;
+    }
+
+    r->queued = false;
+    vio_cmd = r->vio_q_cmd;
+
+    resp.hdr.stream_id = r->stream_id;
+    resp.hdr.type = VIRTIO_VIDEO_RESP_OK_NODATA;
+    resp.timestamp = htole64(r->vio_res_q.timestamp);
+
+    /* encoder only */
+    resp.size = htole32(vbuf.bytesused);
+
+    if (vbuf.flags & V4L2_BUF_FLAG_LAST &&
+        s->stream_state == STREAM_DRAINING) {
+        resp.flags |= VIRTIO_VIDEO_BUFFER_FLAG_EOS;
+        s->stream_state = STREAM_STOPPED;
+        g_cond_signal(&s->stream_cond);
+    }
+
+    if (vbuf.flags & V4L2_BUF_FLAG_KEYFRAME) {
+        resp.flags |= VIRTIO_VIDEO_BUFFER_FLAG_IFRAME;
+    }
+    if (vbuf.flags & V4L2_BUF_FLAG_PFRAME) {
+        resp.flags |= VIRTIO_VIDEO_BUFFER_FLAG_PFRAME;
+    }
+    if (vbuf.flags & V4L2_BUF_FLAG_BFRAME) {
+        resp.flags |= VIRTIO_VIDEO_BUFFER_FLAG_PFRAME;
+    }
+
+    if (vbuf.flags & V4L2_BUF_FLAG_ERROR) {
+        resp.flags |= VIRTIO_VIDEO_BUFFER_FLAG_ERR;
+        g_critical("%s: V4L2_BUF_FLAG_ERROR\n", __func__);
+    }
+
+    g_debug("%s: Send queue_buffer reply: stream_id=%d type=0x%x "
+            "flags=0x%x resource_id=%d t=%llx", __func__,
+            resp.hdr.stream_id, resp.hdr.type, resp.flags,
+            r->vio_resource.resource_id, resp.timestamp);
+
+    send_ctrl_response(vio_cmd, (uint8_t *) &resp,
+                       sizeof(struct virtio_video_resource_queue_resp));
+
+    vio_cmd->finished = true;
+    free_resource_mem(r);
+
+    return ret;
+}
+
+int v4l2_video_get_selection(int fd, enum v4l2_buf_type type,
+                             struct v4l2_selection *sel)
+{
+    int ret = 0;
+
+    if (!sel) {
+        return -EINVAL;
+    }
+
+    memset(sel, 0, sizeof(struct v4l2_selection));
+
+    sel->type = type;
+
+    if (is_capture_queue(type)) {
+        sel->target = V4L2_SEL_TGT_COMPOSE;
+    } else if (is_output_queue(type)) {
+        sel->target = V4L2_SEL_TGT_CROP;
+    }
+
+    ret = ioctl(fd, VIDIOC_G_SELECTION, sel);
+    if (ret < 0) {
+        g_printerr("Unable to get selection: %s (%d).\n", g_strerror(errno),
+               errno);
+        return ret;
+    }
+
+    g_debug("%s: VIDIOC_G_SELECTION: fd=(%d) %s: left=(%d) "
+            "top=(%d) width=(%d) height=(%d)",
+            __func__, fd, v4l2_buf_type_name(type), sel->r.left,
+            sel->r.top, sel->r.width, sel->r.height);
+
+    return ret;
+}
+
+int v4l2_video_set_selection(int fd, enum v4l2_buf_type type,
+                             struct v4l2_selection *sel)
+{
+    int ret = 0;
+
+    if (!sel) {
+        return -EINVAL;
+    }
+
+    sel->type = type;
+    sel->target = V4L2_SEL_TGT_COMPOSE;
+    /* flags 0 - the driver can adjust the rect size freely */
+    sel->flags = 0;
+
+    ret = ioctl(fd, VIDIOC_S_SELECTION, sel);
+    if (ret < 0) {
+        g_printerr("Unable to set selection: fd=(%d) left=(%d) top=(%d)"
+                   "width=(%d) height=(%d): %s (%d).\n", fd, sel->r.left,
+                   sel->r.top, sel->r.width, sel->r.height, g_strerror(errno),
+                   errno);
+        return ret;
+    }
+
+    g_debug("%s: VIDIOC_S_SELECTION: fd=(%d) left=(%d) "
+            "top=(%d) width=(%d) height=(%d)",
+            __func__, fd, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
+
+    return ret;
+}
+
+int v4l2_issue_cmd(int fd,  uint32_t cmd, uint32_t flags)
+{
+    int ret = 0;
+    struct v4l2_decoder_cmd decoder_cmd;
+    memset(&decoder_cmd, 0, sizeof(struct v4l2_decoder_cmd));
+
+    decoder_cmd.cmd = cmd;
+    decoder_cmd.flags = flags;
+
+    ret = ioctl(fd, VIDIOC_DECODER_CMD, &decoder_cmd);
+    if (ret < 0) {
+        g_printerr("%s: VIDIOC_DECODER_CMD(%d) failed fd(%d): %s: (%d).\n"
+                   , __func__, cmd, fd, g_strerror(errno), errno);
+        return ret;
+    }
+
+    g_debug("%s: VIDIOC_DECODER_CMD(%d) fd(%d)OK\n", __func__, cmd, fd);
+
+    return ret;
+}
+
+int v4l2_video_get_param(int fd, enum v4l2_buf_type type,
+                          struct v4l2_streamparm *sparam)
+{
+    int ret = 0;
+
+    if (!sparam) {
+        return -EINVAL;
+    }
+
+    memset(sparam, 0, sizeof(struct v4l2_streamparm));
+    sparam->type = type;
+
+    ret = ioctl(fd, VIDIOC_G_PARM, sparam);
+    if (ret < 0) {
+        g_printerr("Unable to VIDIOC_G_PARAM: %s (%d).\n", g_strerror(errno),
+               errno);
+        return ret;
+    }
+
+    g_debug("%s: VIDIOC_G_PARM timeperframe (%d/%d)", __func__,
+            sparam->parm.capture.timeperframe.numerator,
+            sparam->parm.capture.timeperframe.denominator);
+
+    return ret;
+}
+
+int v4l2_video_get_format(int fd, enum v4l2_buf_type type,
+                          struct v4l2_format *fmt)
+{
+    unsigned int i;
+    int ret;
+
+    if (!fmt) {
+        return -EINVAL;
+    }
+
+    memset(fmt, 0, sizeof(struct v4l2_format));
+    fmt->type = type;
+
+    ret = ioctl(fd, VIDIOC_G_FMT, fmt);
+    if (ret < 0) {
+        g_printerr("Unable to get format: %s (%d).\n", g_strerror(errno),
+               errno);
+        return ret;
+    }
+
+    if (video_is_mplane(type)) {
+        g_print("Video format: %s (%08x) %ux%u field %s, %u planes:\n",
+                v4l2_format_name(fmt->fmt.pix_mp.pixelformat),
+                fmt->fmt.pix_mp.pixelformat,
+                fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height,
+                v4l2_field_name(fmt->fmt.pix_mp.field),
+                fmt->fmt.pix_mp.num_planes);
+
+        for (i = 0; i < fmt->fmt.pix_mp.num_planes; i++) {
+            g_print(" * Stride %u, buffer size %u\n",
+                   fmt->fmt.pix_mp.plane_fmt[i].bytesperline,
+                   fmt->fmt.pix_mp.plane_fmt[i].sizeimage);
+        }
+    } else if (video_is_meta(type)) {
+        g_print("Meta-data format: %s (%08x) buffer size %u\n",
+                v4l2_format_name(fmt->fmt.meta.dataformat),
+                fmt->fmt.meta.dataformat,
+                fmt->fmt.meta.buffersize);
+    } else {
+        g_print("Video format: %s (%08x) %ux%u (stride %u) field %s "
+                "buffer size %u\n",
+                v4l2_format_name(fmt->fmt.pix.pixelformat),
+                fmt->fmt.pix.pixelformat,
+                fmt->fmt.pix.width, fmt->fmt.pix.height,
+                fmt->fmt.pix.bytesperline,
+                v4l2_field_name(fmt->fmt.pix_mp.field),
+                fmt->fmt.pix.sizeimage);
+    }
+
+    return 0;
+}
+
+int v4l2_video_get_control(int fd , uint32_t control, int32_t *value)
+{
+    int ret = 0;
+    struct v4l2_control ctrl;
+
+    g_debug("%s:%d", __func__, __LINE__);
+
+    ctrl.id = control;
+
+    ret = ioctl(fd, VIDIOC_G_CTRL, &ctrl);
+    if (ret < 0) {
+        g_printerr("Unable to get control: %s (%d).\n", g_strerror(errno),
+               errno);
+        return ret;
+    }
+
+    *value = ctrl.value;
+    g_debug("%s: ctrl=0x%x value=0x%x", __func__, control, *value);
+
+    return ret;
+}
+
+int v4l2_video_set_format(int fd, enum v4l2_buf_type type,
+                            struct virtio_video_params *p)
+{
+    struct v4l2_format fmt;
+    int ret = 0;
+    unsigned int i;
+    uint32_t pixfmt;
+
+    if (!p) {
+        return -EINVAL;
+    }
+
+    memset(&fmt, 0, sizeof fmt);
+    fmt.type = type;
+    pixfmt = virtio_video_format_to_v4l2(le32toh(p->format));
+
+    if (video_is_mplane(type)) {
+        fmt.fmt.pix_mp.width = le32toh(p->frame_width);
+        fmt.fmt.pix_mp.height = le32toh(p->frame_height);
+        fmt.fmt.pix_mp.pixelformat = pixfmt;
+        /*
+         * V4L2_FIELD_NONE - matches what Linux frontend driver does in
+         * virtio_video_format_from_info()
+         */
+        fmt.fmt.pix_mp.field = V4L2_FIELD_NONE;
+        /*fmt.fmt.pix_mp.num_planes = info->n_planes;*/
+        fmt.fmt.pix_mp.num_planes = le32toh(p->num_planes);
+        fmt.fmt.pix_mp.flags = 0;
+
+        for (i = 0; i < le32toh(p->num_planes); i++) {
+            fmt.fmt.pix_mp.plane_fmt[i].bytesperline =
+                le32toh(p->plane_formats[i].stride);
+            fmt.fmt.pix_mp.plane_fmt[i].sizeimage =
+                le32toh(p->plane_formats[i].plane_size);
+        }
+    } else if (video_is_splane(type)) {
+        fmt.fmt.pix.width = le32toh(p->frame_width);
+        fmt.fmt.pix.height = le32toh(p->frame_height);
+        fmt.fmt.pix.pixelformat = pixfmt;
+        fmt.fmt.pix.field = V4L2_FIELD_NONE;
+        fmt.fmt.pix.bytesperline = le32toh(p->plane_formats[0].stride);
+        fmt.fmt.pix.sizeimage = le32toh(p->plane_formats[0].plane_size);
+        fmt.fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+        fmt.fmt.pix.flags = 0;
+    }
+
+    ret = ioctl(fd, VIDIOC_S_FMT, &fmt);
+    if (ret < 0) {
+        g_printerr("Unable to set format: %s (%d).\n", g_strerror(errno),
+               errno);
+    }
+    return ret;
+}
+
+int v4l2_set_pixel_format(int fd, enum v4l2_buf_type buf_type,
+                          uint32_t pixelformat)
+{
+    int ret = 0;
+    struct v4l2_format cur_fmt;
+
+    g_debug("%s: buf_type=0x%x pixelformat=0x%x", __func__,
+            buf_type, pixelformat);
+
+    /* get the currently set format */
+    ret = v4l2_video_get_format(fd, buf_type, &cur_fmt);
+    if (ret < 0) {
+        g_printerr("%s: v4l2_video_get_format() failed\n", __func__);
+        return ret;
+    }
+
+    /* keep defaults and set correct pixel format */
+    if (video_is_mplane(cur_fmt.type)) {
+        g_print("%s: Format is mplane\n", __func__);
+        cur_fmt.fmt.pix_mp.pixelformat = pixelformat;
+    } else if (video_is_splane(cur_fmt.type)) {
+        g_print("%s: Format is splane\n", __func__);
+        cur_fmt.fmt.pix.pixelformat = pixelformat;
+    }
+
+    ret = ioctl(fd, VIDIOC_S_FMT, &cur_fmt);
+    if (ret < 0) {
+        g_printerr("Unable to set format: %s (%d).\n", g_strerror(errno),
+                   errno);
+    }
+
+    return ret;
+}
+
+int video_enum_formats(struct v4l2_device *dev, enum v4l2_buf_type type,
+                       GList **p_fmt_list, bool only_enum_fmt)
+{
+    struct v4l2_fmtdesc fmt;
+    struct video_format *vid_fmt = NULL;
+    GList *fmt_list = NULL;
+    unsigned int index;
+    int ret = 0;
+
+    if (!dev) {
+        return -EINVAL;
+    }
+
+    for (index = 0; ; ++index) {
+        memset(&fmt, 0, sizeof fmt);
+        fmt.index = index;
+        fmt.type = type;
+        ret = ioctl(dev->fd, VIDIOC_ENUM_FMT, &fmt);
+
+        if (ret < 0) {
+            if (errno == EINVAL) {
+                ret = 0;
+            } else{
+                g_printerr("%s: VIDIOC_ENUM_FMT failed %s\n", __func__,
+                           g_strerror(errno));
+            }
+        break;
+        }
+
+        /* do some driver sanity checks */
+        if (index != fmt.index) {
+            g_warning("v4l2 driver modified index %u.\n", fmt.index);
+        }
+        if (type != fmt.type) {
+            g_warning("v4l2 driver modified type %u.\n", fmt.type);
+        }
+        g_debug("\tFormat %u: %s (%08x)", index,
+               v4l2_format_name(fmt.pixelformat), fmt.pixelformat);
+        g_debug("\tType: %s (%u)", v4l2_buf_type_name(fmt.type),
+               fmt.type);
+        g_debug("\tName: %.32s", fmt.description);
+        g_debug("\tFlags: 0x%x", fmt.flags);
+
+        if (fmt.flags & V4L2_FMT_FLAG_DYN_RESOLUTION &&
+            fmt.flags & V4L2_FMT_FLAG_COMPRESSED) {
+            g_print("dynamic resolution switching supported\n");
+            dev->sup_dyn_res_switching = true;
+        }
+
+        /* test if pixelformat converts to virtio */
+        if (!virtio_video_v4l2_format_to_virtio(fmt.pixelformat)) {
+            g_info("Skipping Format %s (%08x) - no virtio-video equivalent"
+                      , v4l2_format_name(fmt.pixelformat), fmt.pixelformat);
+            continue;
+        }
+
+        /* allocate video_format struct */
+        vid_fmt = g_new0(struct video_format, 1);
+
+        /* keep a copy of v4l2 struct */
+        memcpy(&vid_fmt->fmt, &fmt, sizeof(struct v4l2_fmtdesc));
+
+        /* add it to linked list */
+        fmt_list = g_list_append(fmt_list, vid_fmt);
+
+        if (!only_enum_fmt) {
+            /* pass video_format to enum_frame_sizes */
+            ret = video_enum_frame_sizes(dev, fmt.pixelformat,
+                                         &vid_fmt->vid_fmt_frm_l);
+            if (ret < 0) {
+                g_printerr("video_enum_frame_sizes failed\n");
+            }
+
+            /* convert to virtio format */
+            v4l2_to_virtio_fmtdesc(dev, vid_fmt, type);
+        }
+
+        /* determine type of v4l2 device */
+        v4l2_set_device_type(dev, type, &fmt);
+    }
+
+    if (ret == 0) {
+        g_print("%s: Enumerated %d formats on v4l2 %s queue", __func__
+                , index, v4l2_buf_type_name(type));
+        g_print(" %d formats are representable by virtio-video\n"
+                , g_list_length(fmt_list));
+        if (!only_enum_fmt)
+            g_print("%s: Enumerated %d frame sizes\n", __func__,
+                    g_list_length(vid_fmt->vid_fmt_frm_l));
+
+        *p_fmt_list = fmt_list;
+    }
+
+    return ret;
+}
+
+void video_free_frame_intervals(GList *frm_intervals_l)
+{
+    GList *l;
+    struct video_format_frame_rates *vid_fmt_frm_rate;
+    for (l = frm_intervals_l; l != NULL; l = l->next) {
+        vid_fmt_frm_rate = l->data;
+        g_free(vid_fmt_frm_rate);
+    }
+}
+
+void video_free_frame_sizes(GList *frm_sz_l)
+{
+    GList *l;
+    struct video_format_frame *vid_frame;
+    for (l = frm_sz_l; l != NULL; l = l->next) {
+        vid_frame = l->data;
+        if (vid_frame->frm_rate_l) {
+            video_free_frame_intervals(vid_frame->frm_rate_l);
+        }
+        g_free(vid_frame);
+    }
+}
+
+void video_free_formats(GList **fmt_l)
+{
+    GList *l;
+    struct video_format *vid_fmt;
+
+    for (l = *fmt_l; l != NULL; l = l->next) {
+        vid_fmt = l->data;
+        if (vid_fmt->vid_fmt_frm_l) {
+            video_free_frame_sizes(vid_fmt->vid_fmt_frm_l);
+        }
+
+        g_free(vid_fmt);
+    }
+}
+
+
+static GByteArray *iterate_frame_rate_list(GByteArray *resp, GList *frm_rate_l)
+{
+    struct video_format_frame_rates *vid_fmt_frm_rate;
+
+    /* iterate frame_rate list */
+    for (; frm_rate_l != NULL; frm_rate_l = frm_rate_l->next) {
+        vid_fmt_frm_rate = frm_rate_l->data;
+
+        resp = g_byte_array_append(resp,
+                                   (guint8 *) &vid_fmt_frm_rate->frame_rates,
+                                   sizeof(struct virtio_video_format_range));
+        }
+    return resp;
+}
+
+static GByteArray *iterate_format_frame_list(GByteArray *resp, GList *fmt_frm_l)
+{
+    struct video_format_frame *vid_fmt_frm;
+    GList *frm_rate_l = NULL;
+
+    /* iterate format_frame list */
+    for (; fmt_frm_l != NULL; fmt_frm_l = fmt_frm_l->next) {
+        vid_fmt_frm = fmt_frm_l->data;
+
+        if (!vid_fmt_frm->frm_rate_l) {
+            vid_fmt_frm->frame.num_rates = htole32(0);
+        } else {
+            frm_rate_l = vid_fmt_frm->frm_rate_l;
+            vid_fmt_frm->frame.num_rates = htole32(g_list_length(frm_rate_l));
+
+        }
+
+        g_debug("%s: num_rates(%d)", __func__,
+                le32toh(vid_fmt_frm->frame.num_rates));
+
+        resp = g_byte_array_append(resp,
+                                   (guint8 *) &vid_fmt_frm->frame,
+                                   sizeof(struct virtio_video_format_frame));
+
+        if (frm_rate_l) {
+            resp = iterate_frame_rate_list(resp, frm_rate_l);
+        }
+    }
+
+    return resp;
+}
+
+static GByteArray *iterate_format_desc_list(GByteArray *resp, GList *fmt_desc_l)
+{
+    struct video_format *vid_fmt;
+    GList *fmt_frm_l = NULL;
+
+    for (; fmt_desc_l != NULL; fmt_desc_l = fmt_desc_l->next) {
+        vid_fmt = fmt_desc_l->data;
+
+        /* does video_format have a list of format_frame? */
+        if (!vid_fmt->vid_fmt_frm_l) {
+            vid_fmt->desc.num_frames = htole32(0);
+        } else {
+            fmt_frm_l = vid_fmt->vid_fmt_frm_l;
+            vid_fmt->desc.num_frames = htole32(g_list_length(fmt_frm_l));
+        }
+
+        g_debug("%s: num_frames(%d)", __func__,
+                le32toh(vid_fmt->desc.num_frames));
+
+        resp = g_byte_array_append(resp,
+                                   (guint8 *) &vid_fmt->desc,
+                                   sizeof(struct virtio_video_format_desc));
+
+        if (fmt_frm_l) {
+            resp = iterate_format_frame_list(resp, fmt_frm_l);
+        }
+    }
+
+    return resp;
+}
+
+GByteArray *create_query_cap_resp(struct virtio_video_query_capability *qcmd,
+                           GList **fmt_l, GByteArray *resp)
+{
+    GList *fmt_desc_l;
+    struct virtio_video_query_capability_resp cap_resp;
+
+    fmt_desc_l = *fmt_l;
+
+    cap_resp.hdr.type = VIRTIO_VIDEO_RESP_OK_QUERY_CAPABILITY;
+    cap_resp.hdr.stream_id = qcmd->hdr.stream_id;
+    cap_resp.num_descs = htole32(g_list_length(fmt_desc_l));
+
+    assert(le32toh(cap_resp.num_descs) < MAX_FMT_DESCS);
+
+    resp = g_byte_array_append(resp, (guint8 *) &cap_resp, sizeof(cap_resp));
+    resp = iterate_format_desc_list(resp, fmt_desc_l);
+
+    return resp;
+}
+
+void v4l2_backend_free(struct v4l2_device *dev)
+{
+    if (dev && dev->opened) {
+        close(dev->fd);
+    }
+    g_free(dev);
+}
+
+struct v4l2_device *v4l2_backend_init(const gchar *devname)
+{
+    struct v4l2_device *dev;
+    int ret = 0;
+    GList *vid_output_fmt_l = NULL;
+    GList *vid_capture_fmt_l = NULL;
+    enum v4l2_buf_type buf_type;
+
+    if (!devname) {
+        return NULL;
+    }
+
+    dev = g_malloc0(sizeof(struct v4l2_device));
+
+    /* open the device */
+    dev->fd = v4l2_open(devname);
+    if (dev->fd < 0) {
+        g_printerr("v4l2_open() failed!\n");
+        goto err;
+    }
+
+    dev->opened = 1;
+    dev->devname = devname;
+
+    ret = video_querycap(dev);
+
+    buf_type = dev->has_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
+        : V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+    /* enumerate coded formats on OUTPUT */
+    ret = video_enum_formats(dev, buf_type,
+                             &vid_output_fmt_l, true);
+    if (ret < 0) {
+        g_printerr("video_enum_formats() failed OUTPUT\n");
+        goto err;
+    }
+
+    buf_type = dev->has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
+        : V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+    /* enumerate coded formats on CAPTURE */
+    ret = video_enum_formats(dev, buf_type,
+                             &vid_capture_fmt_l, true);
+    if (ret < 0) {
+        g_printerr("video_enum_formats() failed CAPTURE\n");
+        goto err2;
+    }
+
+    if (dev->dev_type & STATEFUL_ENCODER)
+        g_print("%s: %s is a stateful encoder (0x%x)!\n", __func__,
+                devname, dev->dev_type);
+
+    if (dev->dev_type & STATEFUL_DECODER)
+        g_print("%s: %s is a stateful decoder (0x%x)!\n", __func__,
+                devname, dev->dev_type);
+
+    video_free_formats(&vid_output_fmt_l);
+    video_free_formats(&vid_capture_fmt_l);
+
+    if (!(dev->dev_type & STATEFUL_ENCODER ||
+          dev->dev_type & STATEFUL_DECODER)) {
+        g_printerr("v4l2 device not supported! v4l2 backend only supports "
+                   "stateful codec devices currently(%d)!\n", dev->dev_type);
+        goto err3;
+    }
+
+    g_debug("%s: success!\n", __func__);
+    return dev;
+
+err3:
+    video_free_formats(&vid_capture_fmt_l);
+err2:
+    video_free_formats(&vid_output_fmt_l);
+err:
+    v4l2_backend_free(dev);
+    return NULL;
+}
diff --git a/tools/vhost-user-video/v4l2_backend.h b/tools/vhost-user-video/v4l2_backend.h
new file mode 100644
index 0000000000..e3617256b3
--- /dev/null
+++ b/tools/vhost-user-video/v4l2_backend.h
@@ -0,0 +1,99 @@
+/*
+ * Virtio vhost-user VIDEO Device
+ *
+ * Copyright Linaro 2021
+ *
+ * Authors: *     Peter Griffin <peter.griffin@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef V4L2_BACKEND_H
+#define V4L2_BACKEND_H
+
+#include "standard-headers/linux/virtio_video.h"
+#include "virtio_video_helpers.h"
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+#define MAX_CAPS_LEN 4096
+#define MAX_FMT_DESCS 64
+
+#define STATEFUL_ENCODER (1 << 0)
+#define STATEFUL_DECODER (1 << 1)
+#define STATELESS_ENCODER (1 << 2)
+#define STATELESS_DECODER (1 << 3)
+
+/* Function protoypes */
+
+struct v4l2_device *v4l2_backend_init(const gchar *devname);
+void v4l2_backend_free(struct v4l2_device *dev);
+
+GByteArray *create_query_cap_resp(struct virtio_video_query_capability *qcmd,
+                            GList **fmt_l, GByteArray *querycapresp);
+enum v4l2_buf_type get_v4l2_buf_type (enum virtio_video_queue_type queue_type,
+                                      bool has_mplane);
+
+void v4l2_set_device_type(struct v4l2_device *dev, enum v4l2_buf_type type,
+                          struct v4l2_fmtdesc *fmt_desc);
+int v4l2_video_get_format(int fd, enum v4l2_buf_type type,
+                          struct v4l2_format *fmt);
+
+int v4l2_video_set_format(int fd, enum v4l2_buf_type type,
+                          struct virtio_video_params *p);
+
+int v4l2_video_get_control(int fd, uint32_t control, int32_t *value);
+
+int v4l2_queue_buffer(int fd, enum v4l2_buf_type type,
+                      struct virtio_video_resource_queue *qcmd,
+                      struct resource *res, struct stream *s,
+                      struct v4l2_device *dev);
+
+int v4l2_dequeue_buffer(int fd, enum v4l2_buf_type type,
+                        struct stream *s);
+
+int v4l2_dequeue_event(struct v4l2_device *dev);
+
+int v4l2_set_pixel_format(int fd, enum v4l2_buf_type buf_type,
+                          uint32_t pixelformat);
+int v4l2_release_buffers(int fd, enum v4l2_buf_type type);
+int v4l2_resource_create(struct stream *s, enum v4l2_buf_type type,
+                         enum virtio_video_mem_type mem_type,
+                         struct resource *res);
+int v4l2_subscribe_event(struct stream *s,
+                         uint32_t event_type, uint32_t id);
+
+int v4l2_video_get_param(int fd, enum v4l2_buf_type type,
+                         struct v4l2_streamparm *param);
+
+int v4l2_video_get_selection(int fd, enum v4l2_buf_type type,
+                             struct v4l2_selection *sel);
+
+int v4l2_video_set_selection(int fd, enum v4l2_buf_type type,
+                             struct v4l2_selection *sel);
+
+int video_send_decoder_start_cmd(struct v4l2_device *dev);
+void video_free_frame_intervals(GList *frm_intervals_l);
+void video_free_frame_sizes(GList *frm_sz_l);
+int video_enum_formats(struct v4l2_device *dev, enum v4l2_buf_type type,
+                       GList **p_fmt_list, bool only_enum_fmt);
+void video_free_formats(GList **fmt_l);
+bool video_is_mplane(enum v4l2_buf_type type);
+bool video_is_splane(enum v4l2_buf_type type);
+bool video_is_meta(enum v4l2_buf_type type);
+bool is_capture_queue(enum v4l2_buf_type type);
+bool is_output_queue(enum v4l2_buf_type type);
+int ioctl_streamon(struct stream *s, enum v4l2_buf_type type);
+int ioctl_streamoff(struct stream *s, enum v4l2_buf_type type);
+int v4l2_streamon(struct v4l2_device *dev, enum v4l2_buf_type type,
+                  struct stream *s);
+int v4l2_streamoff(enum v4l2_buf_type type, struct stream *s);
+void v4l2_print_event(const struct v4l2_event *ev);
+int v4l2_open(const gchar *devname);
+int v4l2_close(int fd);
+int v4l2_free_buffers(int fd, enum v4l2_buf_type type);
+void convert_to_timeval(uint64_t timestamp, struct timeval *t);
+int v4l2_issue_cmd(int fd,  uint32_t cmd, uint32_t flags);
+
+#endif
diff --git a/tools/vhost-user-video/virtio_video_helpers.c b/tools/vhost-user-video/virtio_video_helpers.c
new file mode 100644
index 0000000000..71353804ea
--- /dev/null
+++ b/tools/vhost-user-video/virtio_video_helpers.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-video helpers
+ *
+ * Copyright Linaro 2021
+ * Copyright 2019 OpenSynergy GmbH.
+ *
+ * Authors:
+ *     Peter Griffin <peter.griffin@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include <assert.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <inttypes.h>
+
+#include <glib.h>
+#include <glib/gstdio.h>
+
+#include "standard-headers/linux/virtio_video.h"
+#include <linux/videodev2.h>
+#include "v4l2_backend.h"
+#include "virtio_video_helpers.h"
+
+struct virtio_video_convert_table {
+    uint32_t virtio_value;
+    uint32_t v4l2_value;
+};
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+static struct virtio_video_convert_table level_table[] = {
+    { VIRTIO_VIDEO_LEVEL_H264_1_0, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
+    { VIRTIO_VIDEO_LEVEL_H264_1_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
+    { VIRTIO_VIDEO_LEVEL_H264_1_2, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
+    { VIRTIO_VIDEO_LEVEL_H264_1_3, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
+    { VIRTIO_VIDEO_LEVEL_H264_2_0, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
+    { VIRTIO_VIDEO_LEVEL_H264_2_1, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
+    { VIRTIO_VIDEO_LEVEL_H264_2_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
+    { VIRTIO_VIDEO_LEVEL_H264_3_0, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
+    { VIRTIO_VIDEO_LEVEL_H264_3_1, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
+    { VIRTIO_VIDEO_LEVEL_H264_3_2, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
+    { VIRTIO_VIDEO_LEVEL_H264_4_0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
+    { VIRTIO_VIDEO_LEVEL_H264_4_1, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
+    { VIRTIO_VIDEO_LEVEL_H264_4_2, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
+    { VIRTIO_VIDEO_LEVEL_H264_5_0, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
+    { VIRTIO_VIDEO_LEVEL_H264_5_1, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+    { 0 },
+};
+
+uint32_t virtio_video_level_to_v4l2(uint32_t level)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(level_table); idx++) {
+        if (level_table[idx].virtio_value == level) {
+            return level_table[idx].v4l2_value;
+        }
+    }
+
+    return 0;
+}
+
+uint32_t virtio_video_v4l2_level_to_virtio(uint32_t v4l2_level)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(level_table); idx++) {
+        if (level_table[idx].v4l2_value == v4l2_level) {
+            return level_table[idx].virtio_value;
+        }
+    }
+
+    return 0;
+}
+
+static struct virtio_video_convert_table profile_table[] = {
+    { VIRTIO_VIDEO_PROFILE_H264_BASELINE,
+      V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
+    { VIRTIO_VIDEO_PROFILE_H264_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
+    { VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
+      V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED },
+    { VIRTIO_VIDEO_PROFILE_H264_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
+    { VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
+      V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10 },
+    { VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
+      V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422},
+    { VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
+      V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE },
+    { VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
+      V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE },
+    { VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
+      V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH },
+    { VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
+      V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
+    { VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
+      V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
+    { 0 },
+};
+
+uint32_t virtio_video_profile_to_v4l2(uint32_t profile)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(profile_table); idx++) {
+        if (profile_table[idx].virtio_value == profile) {
+            return profile_table[idx].v4l2_value;
+        }
+    }
+
+    return 0;
+}
+
+uint32_t virtio_video_v4l2_profile_to_virtio(uint32_t v4l2_profile)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(profile_table); idx++) {
+        if (profile_table[idx].v4l2_value == v4l2_profile) {
+            return profile_table[idx].virtio_value;
+        }
+    }
+
+    return 0;
+}
+
+
+static struct virtio_video_convert_table format_table[] = {
+    { VIRTIO_VIDEO_FORMAT_ARGB8888, V4L2_PIX_FMT_ARGB32 },
+    { VIRTIO_VIDEO_FORMAT_BGRA8888, V4L2_PIX_FMT_ABGR32 },
+    { VIRTIO_VIDEO_FORMAT_NV12, V4L2_PIX_FMT_NV12 },
+    { VIRTIO_VIDEO_FORMAT_YUV420, V4L2_PIX_FMT_YUV420 },
+    { VIRTIO_VIDEO_FORMAT_YVU420, V4L2_PIX_FMT_YVU420 },
+    { VIRTIO_VIDEO_FORMAT_MPEG2, V4L2_PIX_FMT_MPEG2 },
+    { VIRTIO_VIDEO_FORMAT_MPEG4, V4L2_PIX_FMT_MPEG4 },
+    { VIRTIO_VIDEO_FORMAT_H264, V4L2_PIX_FMT_H264 },
+    { VIRTIO_VIDEO_FORMAT_HEVC, V4L2_PIX_FMT_HEVC },
+    { VIRTIO_VIDEO_FORMAT_VP8, V4L2_PIX_FMT_VP8 },
+    { VIRTIO_VIDEO_FORMAT_VP9, V4L2_PIX_FMT_VP9 },
+    { VIRTIO_VIDEO_FORMAT_FWHT, V4L2_PIX_FMT_FWHT },
+    { 0 },
+};
+
+uint32_t virtio_video_format_to_v4l2(uint32_t format)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(format_table); idx++) {
+        if (format_table[idx].virtio_value == format) {
+            return format_table[idx].v4l2_value;
+        }
+    }
+
+    return 0;
+}
+
+uint32_t virtio_video_v4l2_format_to_virtio(uint32_t v4l2_format)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(format_table); idx++) {
+        if (format_table[idx].v4l2_value == v4l2_format) {
+            return format_table[idx].virtio_value;
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * TODO FIXME PROFILE and LEVEL seem wrong here as tied to H264 codec.
+ * V4L2_CID_MPEG_VIDEO_VP9_PROFILE
+ * e.g. https://elixir.bootlin.com/linux/v5.12.1/source/
+ * include/uapi/linux/v4l2-controls.h#L669
+ */
+static struct virtio_video_convert_table control_table[] = {
+    { VIRTIO_VIDEO_CONTROL_BITRATE, V4L2_CID_MPEG_VIDEO_BITRATE },
+    { VIRTIO_VIDEO_CONTROL_PROFILE, V4L2_CID_MPEG_VIDEO_H264_PROFILE },
+    { VIRTIO_VIDEO_CONTROL_LEVEL, V4L2_CID_MPEG_VIDEO_H264_LEVEL },
+    { VIRTIO_VIDEO_CONTROL_FORCE_KEYFRAME,
+      V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME },
+    { 0 },
+};
+
+uint32_t virtio_video_control_to_v4l2(uint32_t control)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(control_table); idx++) {
+        if (control_table[idx].virtio_value == control) {
+            return control_table[idx].v4l2_value;
+        }
+    }
+
+    return 0;
+}
+
+uint32_t virtio_video_v4l2_control_to_virtio(uint32_t v4l2_control)
+{
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(control_table); idx++) {
+        if (control_table[idx].v4l2_value == v4l2_control) {
+            return control_table[idx].virtio_value;
+        }
+    }
+
+    return 0;
+}
+
+/* new helper functions (not from Linux frontend driver) */
+
+const char *vio_queue_name(enum virtio_video_queue_type queue)
+{
+    if (queue == VIRTIO_VIDEO_QUEUE_TYPE_INPUT) {
+        return "Queue Input";
+    }
+    if (queue == VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT) {
+        return "Queue Output";
+    }
+
+    return "Queue type unknown";
+}
+
+
+__le64 virtio_fmtdesc_generate_mask(GList **p_list)
+{
+    uint64_t mask = 0;
+    unsigned int bit = 0;
+    GList *l;
+
+    for (l = *p_list; l != NULL; l = l->next) {
+        mask |= (1 << bit);
+        bit++;
+    }
+    g_debug("%s: mask(0x%lx)\n", __func__, mask);
+
+    return mask;
+}
+
+/* vio_codedformat endian swapped by upper level */
+
+int v4l2_stream_create(struct v4l2_device *dev, uint32_t vio_codedformat,
+                       struct stream *s)
+{
+    enum v4l2_buf_type buf_type;
+    uint32_t v4l2_pixformat;
+    int ret;
+
+    /* buf type for coded format depends on device type */
+    if (dev->dev_type & STATEFUL_DECODER) {
+        buf_type = dev->has_mplane ?  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
+            : V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+    } else if (dev->dev_type & STATEFUL_ENCODER) {
+        buf_type = dev->has_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+            V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    } else {
+        g_critical("Unknown device type %d!", dev->dev_type);
+        return -EINVAL;
+    }
+
+    s->fd = v4l2_open(dev->devname);
+    if (s->fd < 0) {
+        g_printerr("Error opening device %s: %s (%d).\n", dev->devname,
+                   g_strerror(errno), errno);
+    }
+
+    v4l2_pixformat = virtio_video_format_to_v4l2(vio_codedformat);
+    if (v4l2_pixformat == 0) {
+        g_error("%s: virtio to v4l2 format translation failed!", __func__);
+        ret = -EINVAL;
+        return ret;
+    }
+
+    /* set the requested coded format */
+    ret = v4l2_set_pixel_format(s->fd, buf_type, v4l2_pixformat);
+    if (ret < 0) {
+        g_printerr("%s: v4l2_video_set_pixel_format() failed", __func__);
+    }
+
+    return ret;
+}
+
+void v4l2_to_virtio_fmtdesc(struct v4l2_device *dev,
+                            struct video_format *vid_fmt,
+                            enum v4l2_buf_type type)
+{
+    struct v4l2_fmtdesc *v4l2_fmtdsc = &vid_fmt->fmt;
+    struct virtio_video_format_desc *virtio_fmtdesc = &vid_fmt->desc;
+    enum v4l2_buf_type buftype;
+    int ret;
+
+    if (!vid_fmt) {
+        return;
+    }
+
+    virtio_fmtdesc->format =
+        htole32(virtio_video_v4l2_format_to_virtio(v4l2_fmtdsc->pixelformat));
+
+    /*
+     * To generate the mask we need to check the FORMAT is already set.
+     * before we enumerate the other queue to generate the mask
+     */
+
+    ret = v4l2_set_pixel_format(dev->fd, type, vid_fmt->fmt.pixelformat);
+    if (ret < 0) {
+        g_printerr("%s: v4l2_video_get_format() failed\n", __func__);
+    }
+
+    /* enumerate formats on the other queue now the format is set */
+    GList *vid_fmts_l = NULL;
+
+    if (is_output_queue(type)) {
+        buftype = video_is_mplane(type) ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
+            : V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    }
+
+    if (is_capture_queue(type)) {
+        buftype = video_is_mplane(type) ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
+            V4L2_BUF_TYPE_VIDEO_OUTPUT;
+    }
+
+    ret = video_enum_formats(dev, buftype, &vid_fmts_l, true);
+
+    /*
+     * generate the capability mask. bitset represents the supported
+     * combinations of input and output formats.
+     */
+
+    virtio_fmtdesc->mask = htole64(virtio_fmtdesc_generate_mask(&vid_fmts_l));
+
+    virtio_fmtdesc->planes_layout =
+        htole32(VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER);
+
+    /* TODO need to set plane_align */
+    if ((!v4l2_fmtdsc->flags & V4L2_FMT_FLAG_COMPRESSED) &&
+        (le32toh(virtio_fmtdesc->planes_layout) &
+         VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER)) {
+        g_critical("%s: TODO need to set plane_align field", __func__);
+    }
+
+    virtio_fmtdesc->num_frames = htole32(g_list_length(vid_fmt->vid_fmt_frm_l));
+
+    video_free_formats(&vid_fmts_l);
+}
+
+void v4l2_to_virtio_video_params(struct v4l2_device *dev,
+                                 struct v4l2_format *fmt,
+                                 struct v4l2_selection *sel,
+                                 struct virtio_video_get_params_resp *resp)
+{
+    struct virtio_video_params *vid_params = &resp->params;
+    int i;
+
+    /* min/max_buffers default (taken from crosvm) */
+    vid_params->min_buffers = htole32(1);
+    vid_params->max_buffers = htole32(32);
+
+    if (video_is_mplane(fmt->type)) {
+
+        vid_params->format =
+            virtio_video_v4l2_format_to_virtio(fmt->fmt.pix.pixelformat);
+        vid_params->frame_width = htole32(fmt->fmt.pix_mp.width);
+        vid_params->frame_height = htole32(fmt->fmt.pix_mp.height);
+
+        vid_params->num_planes = htole32(fmt->fmt.pix_mp.num_planes);
+
+        for (i = 0; i < fmt->fmt.pix_mp.num_planes; i++) {
+            vid_params->plane_formats[i].stride = \
+                htole32(fmt->fmt.pix_mp.plane_fmt[i].bytesperline);
+
+            vid_params->plane_formats[i].plane_size = \
+                htole32(fmt->fmt.pix_mp.plane_fmt[i].sizeimage);
+
+            g_debug(" ** Stride %u, buffer size %u\n",
+                    fmt->fmt.pix_mp.plane_fmt[i].bytesperline,
+                    fmt->fmt.pix_mp.plane_fmt[i].sizeimage);
+        }
+    } else if (video_is_splane(fmt->type)) {
+
+        vid_params->format =
+            virtio_video_v4l2_format_to_virtio(fmt->fmt.pix.pixelformat);
+        vid_params->frame_width = htole32(fmt->fmt.pix.width);
+        vid_params->frame_height = htole32(fmt->fmt.pix.height);
+        vid_params->num_planes = htole32(1);
+
+        vid_params->plane_formats[0].stride = \
+            htole32(fmt->fmt.pix.bytesperline);
+
+        vid_params->plane_formats[0].plane_size = \
+            htole32(fmt->fmt.pix.sizeimage);
+
+    }
+
+    /* cropping rectangle */
+    if (is_capture_queue(fmt->type)) {
+        vid_params->crop.left = htole32(sel->r.left);
+        vid_params->crop.top = htole32(sel->r.top);
+        vid_params->crop.width = htole32(sel->r.width);
+        vid_params->crop.height = htole32(sel->r.height);
+
+        g_debug("%s: crop: left=(%d) top=(%d) width=(%d) height=(%d)"
+                , __func__, sel->r.left, sel->r.top, sel->r.width,
+                sel->r.height);
+    }
+
+    /* TODO frame_rate field for encoder */
+}
+
+void v4l2_to_virtio_event(struct v4l2_event *ev,
+                          struct virtio_video_event *vio_ev)
+{
+    g_debug("%s:%d", __func__, __LINE__);
+    g_debug("%ld.%06ld: event %u, pending %u: ",
+            ev->timestamp.tv_sec, ev->timestamp.tv_nsec / 1000,
+            ev->sequence, ev->pending);
+
+    switch (ev->type) {
+    case V4L2_EVENT_VSYNC:
+        g_debug("vsync\n");
+        break;
+    case V4L2_EVENT_EOS:
+        g_debug("eos\n");
+        break;
+    case V4L2_EVENT_CTRL:
+        g_debug("eos\n");
+        break;
+    case V4L2_EVENT_FRAME_SYNC:
+        g_debug("frame_sync %d\n", ev->u.frame_sync.frame_sequence);
+        break;
+    case V4L2_EVENT_SOURCE_CHANGE:
+        g_debug("source_change!: pad/input=%d changes: %x\n"
+                , ev->id, ev->u.src_change.changes);
+
+        vio_ev->event_type =
+            htole32(VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED);
+        /* TODO need proper mapping from v4l2 streamid to virtio streamid */
+        vio_ev->stream_id = htole32(ev->id) + 1;
+        break;
+    case V4L2_EVENT_MOTION_DET:
+        if (ev->u.motion_det.flags & V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ) {
+            g_debug("motion_det frame %d, regions 0x%x\n",
+                    ev->u.motion_det.frame_sequence,
+                    ev->u.motion_det.region_mask);
+        } else {
+            g_debug("motion_det regions 0x%x\n", ev->u.motion_det.region_mask);
+        }
+        break;
+    default:
+        if (ev->type >= V4L2_EVENT_PRIVATE_START) {
+            g_debug("unknown private event (%08x)\n", ev->type);
+        } else {
+            g_debug("unknown event (%08x)\n", ev->type);
+        }
+        break;
+    }
+}
diff --git a/tools/vhost-user-video/virtio_video_helpers.h b/tools/vhost-user-video/virtio_video_helpers.h
new file mode 100644
index 0000000000..9c46f4105a
--- /dev/null
+++ b/tools/vhost-user-video/virtio_video_helpers.h
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-video helpers
+ *
+ * Copyright Linaro 2021
+ *
+ * Authors:
+ *     Peter Griffin <peter.griffin@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef VIRTIO_VIDEO_HELPERS_H
+#define VIRTIO_VIDEO_HELPERS_H
+
+#include <stdint.h>
+#include "standard-headers/linux/virtio_video.h"
+#include <linux/videodev2.h>
+#include "libvhost-user-glib.h"
+#include "libvhost-user.h"
+
+/*
+ * Structure to track internal state of VIDEO Device
+ */
+
+typedef struct VuVideo {
+    VugDev dev;
+    struct virtio_video_config virtio_config;
+    GMainLoop *loop;
+    struct v4l2_device *v4l2_dev;
+    GList *streams;
+} VuVideo;
+
+struct v4l2_device {
+    gchar *devname;
+    unsigned int dev_type;
+    unsigned int capabilities;
+    int fd;
+    int epollfd;
+    int opened;
+    bool has_mplane;
+    bool sup_dyn_res_switching;
+};
+
+struct vu_video_ctrl_command {
+    VuVirtqElement elem;
+    VuVirtq *vq;
+    VuDev *dev;
+    struct virtio_video_cmd_hdr *cmd_hdr;
+    uint32_t error;
+    bool finished;
+    uint8_t *cmd_buf;
+};
+
+
+/*
+ * Structure to track internal state of a Stream
+ */
+
+struct stream {
+    struct virtio_video_stream_create vio_stream;
+    uint32_t stream_id;
+    GList *inputq_resources;
+    GList *outputq_resources;
+    VuVideo *video;
+    GThread *worker_thread;
+    uint32_t stream_state;
+    GMutex mutex;
+    GCond stream_cond;
+    bool output_streaming;
+    bool capture_streaming;
+    bool subscribed_events;
+    bool has_mplane;
+    int fd;
+    uint32_t output_bufcount;
+    uint32_t capture_bufcount;
+};
+
+#define STREAM_STOPPED   1
+#define STREAM_STREAMING 2
+#define STREAM_DRAINING  3
+#define STREAM_DESTROYING 4
+#define STREAM_DESTROYED 5
+
+/* Structure to track resources */
+
+struct resource {
+    uint32_t stream_id;
+    struct virtio_video_resource_create vio_resource;
+    struct virtio_video_resource_queue vio_res_q;
+    struct iovec *iov;
+    uint32_t iov_count;
+    uint32_t v4l2_index;
+    enum v4l2_buf_type type;
+    struct vu_video_ctrl_command *vio_q_cmd;
+    bool queued;
+};
+
+struct video_format_frame_rates {
+    struct virtio_video_format_range frame_rates;
+    struct v4l2_frmivalenum v4l_ival;
+};
+
+struct video_format_frame {
+    struct virtio_video_format_frame frame;
+    struct v4l2_frmsizeenum v4l_framesize;
+    GList *frm_rate_l;
+};
+
+struct video_format {
+    struct v4l2_fmtdesc fmt;
+    struct virtio_video_format_desc desc;
+    GList *vid_fmt_frm_l;
+};
+
+/* function prototypes */
+int v4l2_stream_create(struct v4l2_device *dev,
+                       uint32_t vio_codedformat, struct stream *s);
+void v4l2_to_virtio_video_params(struct v4l2_device *dev,
+                                 struct v4l2_format *fmt,
+                                 struct v4l2_selection *sel,
+                                 struct virtio_video_get_params_resp *resp);
+
+void v4l2_to_virtio_fmtdesc(struct v4l2_device *dev,
+                            struct video_format *vid_fmt,
+                            enum v4l2_buf_type type);
+
+void v4l2_to_virtio_event(struct v4l2_event *ev,
+                          struct virtio_video_event *vio_ev);
+
+struct resource *find_resource_by_v4l2index(struct stream *s,
+                                             enum v4l2_buf_type buf_type,
+                                             uint32_t v4l2_index);
+/*
+ * The following conversion helpers and tables taken from Linux
+ * frontend driver from opensynergy
+ */
+
+uint32_t virtio_video_level_to_v4l2(uint32_t level);
+uint32_t virtio_video_v4l2_level_to_virtio(uint32_t v4l2_level);
+uint32_t virtio_video_profile_to_v4l2(uint32_t profile);
+uint32_t virtio_video_v4l2_profile_to_virtio(uint32_t v4l2_profile);
+uint32_t virtio_video_format_to_v4l2(uint32_t format);
+uint32_t virtio_video_v4l2_format_to_virtio(uint32_t v4l2_format);
+uint32_t virtio_video_control_to_v4l2(uint32_t control);
+uint32_t virtio_video_v4l2_control_to_virtio(uint32_t v4l2_control);
+__le64 virtio_fmtdesc_generate_mask(GList **p_list);
+
+/* Helpers for logging */
+const char *vio_queue_name(enum virtio_video_queue_type queue);
+
+static inline void
+virtio_video_ctrl_hdr_letoh(struct virtio_video_cmd_hdr *hdr)
+{
+    hdr->type = le32toh(hdr->type);
+    hdr->stream_id = le32toh(hdr->stream_id);
+}
+
+static inline void
+virtio_video_ctrl_hdr_htole(struct virtio_video_cmd_hdr *hdr)
+{
+    hdr->type = htole32(hdr->type);
+    hdr->stream_id = htole32(hdr->stream_id);
+}
+#endif
diff --git a/tools/vhost-user-video/vuvideo.h b/tools/vhost-user-video/vuvideo.h
new file mode 100644
index 0000000000..de02e05b46
--- /dev/null
+++ b/tools/vhost-user-video/vuvideo.h
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * vhost-user-video header
+ *
+ * Copyright Linaro 2021
+ *
+ * Authors:
+ *     Peter Griffin <peter.griffin@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef VUVIDEO_H
+#define VUVIDEO_H
+
+#include "virtio_video_helpers.h"
+#include "v4l2_backend.h"
+#include "vuvideo.h"
+
+size_t video_iov_size(const struct iovec *iov, const unsigned int iov_cnt);
+
+GList *get_resource_list(struct stream *s, uint32_t queue_type);
+void send_qclear_res_reply(gpointer data, gpointer user_data);
+
+struct stream *find_stream(struct VuVideo *v, uint32_t stream_id);
+int add_resource(struct stream *s, struct resource *r, uint32_t queue_type);
+int remove_resource(struct stream *s, struct resource *r, uint32_t queue_type);
+struct resource *find_resource(struct stream *s, uint32_t resource_id,
+                                uint32_t queue_type);
+
+void send_ctrl_response(struct vu_video_ctrl_command *vio_cmd,
+                       uint8_t *resp, size_t resp_len);
+
+void send_ctrl_response_nodata(struct vu_video_ctrl_command *vio_cmd);
+
+void free_resource_mem(struct resource *r);
+void remove_all_resources(struct stream *s, uint32_t queue_type);
+
+void handle_queue_clear_cmd(struct VuVideo *v,
+                           struct vu_video_ctrl_command *vio_cmd);
+
+#endif
-- 
2.25.1


