Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0E47FDD3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 15:31:20 +0100 (CET)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1r1z-0004ls-5s
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 09:31:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzO-0001in-0D
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:38 -0500
Received: from [2607:f8b0:4864:20::1033] (port=35643
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzI-00031u-Of
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso5502045pje.0
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 06:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbiVyScK7Ebz11C8E/2SekdrjorCd1xxRN+8KjKE9io=;
 b=yCLvQMOacJKiuN6SZKKMHd7EEtUXE07aQUw7/602YXPegMOEKXsb7wDK5UVGO8KwYA
 FtldIluqhvoszjQOsDBRJ6izuftIrV6lM2Jn3nfqEeZ347G89sY6RVaHEBxoMTwXwOZC
 ZT+c2esL50mMZvqvzRpm+9lWZSTvNxXhf+EiP3nnYiWSA36wtFMduQtQuLUbTv5Wffz8
 gkRKlhK8Wr2DBDYhR9LLojqpcaLiJh/C1y7gTMshqw4DLCQumWg5lYhDP6NfYnx0xE5B
 TMnifZvJhoVIeG8bTchcG81C6997Q+GFvx6tbston5YjEaLdoCMHSoX1oqQGHcfZHZOH
 erMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbiVyScK7Ebz11C8E/2SekdrjorCd1xxRN+8KjKE9io=;
 b=OznfWCBEFXweqL5k3sKPQwdoO0uMRBrAmNzpK0rcP3OuLVt4tSBzFw99BNPbt2i0Dv
 ACp/Z6Vdi0QHQh8wQyN87koy+s/s/626GjQLvchCf/aBrHrJd9sCgqelhdQCXYUCX+LT
 PdCmN782BhpRy5X7+HXN0n5p7pZFHFI5jA+SbpKZ7H7wHi7Ku3sN3RCQsHruReWT1TTV
 tm/fkMqsu0wUEZJ0sbnlPVffyDYocKSNHxZPkEakXzcx9T4RrPkJWqasEwxTxcKbKh/b
 IOj0ZOpX++mUQu+pq5bSvlBKLVor9RvTOfHRnL0hcRvH8JdE3pYHeulnhZNf2zMmdOle
 4Ngg==
X-Gm-Message-State: AOAM532X2Zje3QC2QGxZOIvGUdX12Vy5vzyLf1DBFJl8b1vFoFef/Tn/
 UFxXrJGt53NQhwvkaVdr2d3ukA==
X-Google-Smtp-Source: ABdhPJwq73d55NYm/yQsgkyfeB4LWRGqhwOIKOqqa2VFK09OShWYOTW5UFFTU6gy9IRWFG5arh8vXA==
X-Received: by 2002:a17:902:f284:b0:149:699d:49bf with SMTP id
 k4-20020a170902f28400b00149699d49bfmr11645812plc.11.1640615310781; 
 Mon, 27 Dec 2021 06:28:30 -0800 (PST)
Received: from libai.bytedance.net ([153.254.110.96])
 by smtp.gmail.com with ESMTPSA id p2sm15072916pgn.73.2021.12.27.06.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:28:30 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com
Subject: [PATCH 1/5] camera: Introduce camera subsystem and builtin driver
Date: Mon, 27 Dec 2021 22:27:30 +0800
Message-Id: <20211227142734.691900-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227142734.691900-1-pizhenwei@bytedance.com>
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
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

Web camera is an important port of a desktop instance, QEMU supports
USB passthrough and USB redirect to support for general cases.
Several problems we have hit:
  1, the heavy bandwidth of network. a 1080*720@30FPS(MJPEG) uses
     ~5MB/s.
  2, Issues of USB passthrough, Ex USB reset from guest side triggers
     wrong state of host side.
  3, extention features, Ex to limit FPS/width&height of a camera
     device by hypervisor.
  ...

So introduce camera subsystem to QEMU, abstruct basic API to operate
a camera device. Also introduce a builtin driver which draws pure
color, rainbow and digital rain background, and shows information for
guest side to debug by libcairo.

The full picture of QEMU camera subsystem works like this:

   +----------+       +------------+     +---------------+
   |UVC(ready)|       |virtio(TODO)|     |other HW device|
   +----------+       +------------+     +---------------+
         |                 |                     |
         |            +--------+                 |
	 +------------+ Camera +-----------------+
                      +----+---+
                           |
         +-----------------+---------------------+
         |                 |                     |
     +---+---+       +-----+-----+        +-------------+
     |builtin|       |v4l2(ready)|        |other drivers|
     +-------+       +-----------+        +-------------+

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 camera/builtin.c        | 717 ++++++++++++++++++++++++++++++++++++++++
 camera/camera-int.h     |  19 ++
 camera/camera.c         | 522 +++++++++++++++++++++++++++++
 camera/meson.build      |  16 +
 camera/trace-events     |  24 ++
 camera/trace.h          |   1 +
 include/camera/camera.h | 238 +++++++++++++
 meson.build             |  20 +-
 meson_options.txt       |   3 +
 qapi/camera.json        |  84 +++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qemu-options.hx         |  10 +
 softmmu/vl.c            |   4 +
 14 files changed, 1659 insertions(+), 1 deletion(-)
 create mode 100644 camera/builtin.c
 create mode 100644 camera/camera-int.h
 create mode 100644 camera/camera.c
 create mode 100644 camera/meson.build
 create mode 100644 camera/trace-events
 create mode 100644 camera/trace.h
 create mode 100644 include/camera/camera.h
 create mode 100644 qapi/camera.json

diff --git a/camera/builtin.c b/camera/builtin.c
new file mode 100644
index 0000000000..26828e74d1
--- /dev/null
+++ b/camera/builtin.c
@@ -0,0 +1,717 @@
+/*
+ * Builtin camera backend implemention
+ *
+ * Copyright 2021 Bytedance, Inc.
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
+
+#ifdef CONFIG_VNC_JPEG /* TODO shoud it rename to CONFIG_LIB_JPEG? */
+#include <jpeglib.h>
+#endif
+
+#include <cairo/cairo.h>
+
+#define TYPE_CAMERA_BUILTIN TYPE_CAMERADEV"-builtin"
+
+#define CAMERA_BUILTIN_DEF_WIDTH 640
+#define CAMERA_BUILTIN_MAX_WIDTH 3840
+#define CAMERA_BUILTIN_MIN_WIDTH 160
+#define CAMERA_BUILTIN_DEF_HEIGHT 480
+#define CAMERA_BUILTIN_MAX_HEIGHT 2880
+#define CAMERA_BUILTIN_MIN_HEIGHT 120
+#define CAMERA_BUILTIN_DEF_FPS 10
+#define CAMERA_BUILTIN_MAX_FPS 60
+#define CAMERA_BUILTIN_MIN_FPS 1
+
+/* mjpeg, yuv, rgb565 */
+#define CAMERA_BUILTIN_MAX_PIXFMT 3
+
+enum AttributeIndex {
+    ATTRIBUTE_DEF,
+    ATTRIBUTE_MIN,
+    ATTRIBUTE_MAX,
+    ATTRIBUTE_CUR,
+    ATTRIBUTE_STEP,
+
+    ATTRIBUTE_ALL
+};
+
+typedef struct CameraBuiltin {
+    QEMUCamera parent;
+
+    /* opts */
+    uint16_t width;
+    uint16_t height;
+    uint16_t fps;
+    bool debug;
+    bool mjpeg;
+    bool yuv;
+    bool rgb565;
+    ColorType bgcolor;
+
+    /* state */
+    QEMUTimer *frame_timer;
+    cairo_surface_t *surface;
+    cairo_t *cr;
+    size_t image_size;
+    uint8_t *image;
+    uint8_t pixbytes;
+    uint8_t npixfmts;
+    uint32_t pixfmts[CAMERA_BUILTIN_MAX_PIXFMT];
+    uint32_t pixfmt; /* current in use */
+    void *opaque; /* used by driver itself */
+
+    /* debug infomations */
+    uint32_t sequence;
+    int32_t ctrl[QEMUCameraControlMax][ATTRIBUTE_ALL];
+} CameraBuiltin;
+
+DECLARE_INSTANCE_CHECKER(CameraBuiltin, CAMERA_BUILTIN_DEV, TYPE_CAMERA_BUILTIN)
+
+static inline uint8_t pixel_clip(int x)
+{
+    if (x > 255) {
+        return 255;
+    } else if (x < 0) {
+        return 0;
+    }
+
+    return x;
+}
+
+static void camera_builtin_rgb24_to_yuyv(uint8_t *rgb, uint8_t *yuv, int width,
+                                         int height, uint8_t pixbytes)
+{
+    int r1, g1, b1, r2, g2, b2, y1, u1, y2, v1;
+    int x, y;
+    uint8_t *dst, *src;
+    uint32_t val;
+
+    for (x = 0; x < height; x++) {
+        for (y = 0; y < width / 2; y++) {
+            src = rgb + x * width * pixbytes + y * pixbytes * 2;
+            val = le32_to_cpu(*(uint32_t *)src);
+            r1 = (val >> 16) & 0xff;
+            g1 = (val >> 8) & 0xff;
+            b1 = val & 0xff;
+            val = le32_to_cpu(*(uint32_t *)(src + pixbytes));
+            r2 = (val >> 16) & 0xff;
+            g2 = (val >> 8) & 0xff;
+            b2 = val & 0xff;
+
+            y1 = pixel_clip(((66 * r1 + 129 * g1 + 25 * b1 + 128) >> 8) + 16);
+            u1 = pixel_clip((((-38 * r1 - 74 * g1 + 112 * b1 + 128) >> 8)
+                            + ((-38 * r2 - 74 * g2 + 112 * b2 + 128) >> 8)) / 2
+                            + 128);
+            y2 = pixel_clip(((66 * r2 + 129 * g2 + 25 * b2 + 128) >> 8) + 16);
+            v1 = pixel_clip((((112 * r1 - 94 * g1 - 18 * b1 + 128) >> 8)
+                            + ((112 * r2 - 94 * g2 - 18 * b2 + 128) >> 8)) / 2
+                            + 128);
+            dst = yuv + x * width * 2 + y * 4;
+            *dst++ = y1;
+            *dst++ = u1;
+            *dst++ = y2;
+            *dst = v1;
+        }
+    }
+}
+
+static void camera_builtin_draw_info(QEMUCamera *camera)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    char text[32];
+    uint16_t fontsize = 20;
+    uint16_t y = fontsize;
+    QEMUCameraControlType t;
+
+    cairo_set_source_rgb(builtin->cr, 1, 1, 1);
+    cairo_select_font_face(builtin->cr, "Georgia", CAIRO_FONT_SLANT_NORMAL,
+                           CAIRO_FONT_WEIGHT_BOLD);
+
+    cairo_set_font_size(builtin->cr, fontsize);
+    cairo_move_to(builtin->cr, 0, y);
+    sprintf(text, "Sequence %d", builtin->sequence++);
+    cairo_show_text(builtin->cr, text);
+
+    for (t = 0; (t < QEMUCameraControlMax)&&(y <= builtin->height); t++) {
+        y += fontsize;
+        cairo_move_to(builtin->cr, 0, y);
+        sprintf(text, "%s %d", QEMUCameraControlTypeString(t),
+                builtin->ctrl[t][ATTRIBUTE_CUR]);
+        cairo_show_text(builtin->cr, text);
+    }
+}
+
+static void camera_builtin_draw_pure_color(QEMUCamera *camera, ColorType color)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    uint8_t r = 0, g = 0, b = 0;
+
+    switch ((int)color) {
+    case COLOR_TYPE_RED:
+        r = 1;
+        break;
+    case COLOR_TYPE_GREEN:
+        g = 1;
+        break;
+    case COLOR_TYPE_BLUE:
+        b = 1;
+        break;
+    }
+
+    cairo_move_to(builtin->cr, 0, 0);
+    cairo_set_source_rgb(builtin->cr, r, g, b);
+    cairo_rectangle(builtin->cr, 0, 0, builtin->width, builtin->height);
+    cairo_fill(builtin->cr);
+}
+
+static void camera_builtin_draw_rainbow(QEMUCamera *camera)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    uint16_t colors;
+    uint16_t lines = builtin->height / 7;
+    uint8_t rainbow[7][3] = {
+        {0xff, 0x00, 0x00}, /* red */
+        {0xff, 0xa5, 0x00}, /* orange */
+        {0xff, 0xff, 0x00}, /* yellow */
+        {0x00, 0x80, 0x00}, /* green */
+        {0x00, 0x00, 0xff}, /* blue */
+        {0x4b, 0x00, 0x82}, /* indigo */
+        {0xee, 0x82, 0xee}, /* violet */
+    };
+    uint8_t *addr;
+
+    for (colors = 0 ; colors < 7; colors++) {
+        cairo_move_to(builtin->cr, 0, lines * colors);
+        addr = rainbow[colors];
+        cairo_set_source_rgb(builtin->cr, addr[0] / (float)255,
+                             addr[1] / (float)255, addr[2] / (float)255);
+        cairo_rectangle(builtin->cr, 0, lines * colors, builtin->width, lines);
+        cairo_fill(builtin->cr);
+    }
+}
+
+static void camera_builtin_draw_digital_rain(QEMUCamera *camera)
+{
+#define DIGITAL_RAIN_FONT 20
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    int rain_rows = builtin->width / 2 / DIGITAL_RAIN_FONT;
+    int rain_len = builtin->height * 2 / DIGITAL_RAIN_FONT;
+    int i, j, x, y, asterisks, first, last;
+    char *addr, *base;
+    char text[2] = {0};
+    int len = rain_len / 2;
+
+    if (!builtin->opaque) {
+        builtin->opaque = g_malloc(rain_rows * rain_len);
+        memset(builtin->opaque, '*', rain_rows * rain_len);
+    }
+
+    base = builtin->opaque;
+
+    cairo_set_source_rgb(builtin->cr, 0, 0, 0);
+    cairo_rectangle(builtin->cr, 0, 0, builtin->width, builtin->height);
+    cairo_fill(builtin->cr);
+
+    cairo_select_font_face(builtin->cr, "Georgia", CAIRO_FONT_SLANT_NORMAL,
+                           CAIRO_FONT_WEIGHT_BOLD);
+    cairo_set_font_size(builtin->cr, DIGITAL_RAIN_FONT);
+    for (i = 0; i < rain_rows; i++) {
+        addr = base + i * rain_len + len;
+        asterisks = 0;
+
+        for (j = 0; (j < len) && (addr[j] == '*'); j++) {
+            asterisks++;
+        }
+
+        if (asterisks == len) {
+rerandom:
+            first = random() % len;
+            last = random() % len;
+            if ((first + len / 4) >= last) {
+                goto rerandom;
+            }
+
+            for (j = first; j < last; j++) {
+                *(addr + j) = random() % 26 + 'A' + (random() % 2) * 32;
+            }
+        }
+
+        addr = base + i * rain_len;
+
+        for (j = 0; (j < len) && (addr[j] == '*'); ) {
+            j++;
+        }
+
+        if (j == len) {
+            goto update_frame;
+        }
+
+        cairo_set_source_rgb(builtin->cr, 1, 1, 1); /* first char of row */
+        x = DIGITAL_RAIN_FONT * i * 2;
+        y = DIGITAL_RAIN_FONT * (len - j);
+        cairo_move_to(builtin->cr, x, y);
+        sprintf(text, "%c", addr[j]);
+        cairo_show_text(builtin->cr, text);
+
+        for (j++; j < len; j++) {
+            if (addr[j] == '*') {
+                continue;
+            }
+            x = DIGITAL_RAIN_FONT * i * 2;
+            y = DIGITAL_RAIN_FONT * (len - j);
+            cairo_set_source_rgb(builtin->cr, 0, 1, 0);
+            cairo_move_to(builtin->cr, x, y);
+
+            sprintf(text, "%c", addr[j]);
+            cairo_show_text(builtin->cr, text);
+        }
+
+update_frame:
+        addr = base + i * rain_len;
+        memmove(addr, addr + 1, 2 * len - 1);
+        addr[2 * len - 1] = '*';
+    }
+}
+
+#ifdef CONFIG_VNC_JPEG
+static void camera_builtin_jpeg_init_destination(j_compress_ptr cinfo)
+{
+    CameraBuiltin *builtin = cinfo->client_data;
+
+    cinfo->dest->next_output_byte = builtin->image;
+    cinfo->dest->free_in_buffer = builtin->image_size;
+}
+
+static void camera_builtin_jpeg_term_destination(j_compress_ptr cinfo)
+{
+    /* nothing to do, but avoid libjpeg to crash! */
+}
+
+static void camera_builtin_rgb24_to_jpeg_line(uint8_t *rgb, uint8_t *jpeg,
+                                              uint16_t width, uint8_t pixbytes)
+{
+    uint16_t x;
+    uint32_t val;
+    uint8_t *dst, *src;
+
+    for (x = 0; x < width; x++) {
+        src = rgb + x * pixbytes;
+        val = le32_to_cpu(*(uint32_t *)src);
+        dst = jpeg + 3 * x;
+        *(dst++) = (val >> 16) & 0xff; /* R */
+        *(dst++) = (val >> 8) & 0xff; /* G */
+        *dst = val & 0xff; /* B */
+    }
+}
+
+static size_t camera_builtin_rgb24_to_jpeg(QEMUCamera *camera, uint8_t *rgb,
+                                           uint8_t *jpeg, uint16_t width,
+                                           int height, uint8_t pixbytes)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    struct jpeg_compress_struct cinfo;
+    struct jpeg_error_mgr jerr;
+    struct jpeg_destination_mgr manager = {0};
+    JSAMPROW row_pointer[1];
+    g_autofree uint8_t *linebuf = g_malloc(width * 3);
+    uint8_t *addr;
+    int quality = 50;
+
+    cinfo.err = jpeg_std_error(&jerr);
+    jpeg_create_compress(&cinfo);
+    cinfo.client_data = builtin;
+    cinfo.image_width = builtin->width;
+    cinfo.image_height = builtin->height;
+    cinfo.input_components = 3;
+    cinfo.in_color_space = JCS_RGB;
+    jpeg_set_defaults(&cinfo);
+    jpeg_set_quality(&cinfo, quality, TRUE);
+    manager.init_destination = camera_builtin_jpeg_init_destination;
+    manager.term_destination = camera_builtin_jpeg_term_destination;
+    cinfo.dest = &manager;
+    row_pointer[0] = linebuf;
+
+    jpeg_start_compress(&cinfo, true);
+
+    while (cinfo.next_scanline < cinfo.image_height) {
+        addr = rgb + cinfo.next_scanline * width * pixbytes;
+        camera_builtin_rgb24_to_jpeg_line(addr, linebuf, width, pixbytes);
+        jpeg_write_scanlines(&cinfo, row_pointer, 1);
+    }
+
+    jpeg_finish_compress(&cinfo);
+    jpeg_destroy_compress(&cinfo);
+
+    return builtin->image_size - cinfo.dest->free_in_buffer;
+}
+#else
+static size_t camera_builtin_rgb24_to_jpeg(QEMUCamera *camera, uint8_t *rgb,
+                                           uint8_t *jpeg, uint16_t width,
+                                           int height, uint8_t pixbytes)
+{
+    return -1;
+}
+#endif
+
+static void camera_builtin_frame_timer(void *opaque)
+{
+    QEMUCamera *camera = opaque;
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    uint8_t *image_addr = cairo_image_surface_get_data(builtin->surface);
+    size_t image_bytes = 0;
+    uint16_t w = builtin->width, h = builtin->height;
+
+    /* 1, draw a frame by cairo */
+    switch (builtin->bgcolor) {
+    case COLOR_TYPE_BLUE:
+    case COLOR_TYPE_GREEN:
+    case COLOR_TYPE_RED:
+        camera_builtin_draw_pure_color(camera, builtin->bgcolor);
+        break;
+
+    case COLOR_TYPE_RAINBOW:
+        camera_builtin_draw_rainbow(camera);
+        break;
+
+    case COLOR_TYPE_DIGITAL_RAIN:
+        camera_builtin_draw_digital_rain(camera);
+        break;
+
+    case COLOR_TYPE__MAX:
+    default:
+        return;
+    }
+
+    if (builtin->debug) {
+        camera_builtin_draw_info(camera);
+    }
+
+    /* 2, convert to a suitable format */
+    switch (builtin->pixfmt) {
+    case QEMU_CAMERA_PIX_FMT_MJPEG:
+        image_bytes = camera_builtin_rgb24_to_jpeg(camera, image_addr,
+                          builtin->image, w, h, builtin->pixbytes);
+        image_addr = builtin->image;
+        break;
+    case QEMU_CAMERA_PIX_FMT_YUYV:
+        camera_builtin_rgb24_to_yuyv(image_addr, builtin->image, w, h,
+                                     builtin->pixbytes);
+        image_bytes = w * h * 2;
+        image_addr = builtin->image;
+        break;
+    case QEMU_CAMERA_PIX_FMT_RGB565:
+        /* no need to convert, just put builtin->surface to uplayer */
+        image_bytes = w * h * 2;
+        break;
+    }
+
+    /* 3, delivery to uplayer */
+    qemu_camera_new_image(camera, image_addr, image_bytes);
+
+    /* 4, modify timer for next frame */
+    timer_mod(builtin->frame_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
+              + NANOSECONDS_PER_SECOND / builtin->fps);
+
+    trace_camera_builtin_timer(qemu_camera_id(camera));
+}
+
+static int camera_builtin_enum_pixel_format(QEMUCamera *camera,
+                                            uint32_t *pixfmts, int npixfmt,
+                                            Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    int index, total = 0;
+
+    for (index = 0; index < MIN(npixfmt, builtin->npixfmts); index++) {
+        pixfmts[total++] = builtin->pixfmts[index];
+    }
+
+    return total;
+}
+
+static int camera_builtin_enum_frame_size(QEMUCamera *camera, uint32_t pixfmt,
+                                          QEMUCameraFrameSize *frmszs,
+                                          int nfrmsz, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    QEMUCameraFrameSize *frmsz;
+
+    if (nfrmsz < 1) {
+        return 0;
+    }
+
+    frmsz = frmszs;
+    frmsz->pixel_format = pixfmt;
+    frmsz->type = QEMU_CAMERA_FRMSIZE_TYPE_DISCRETE;
+    frmsz->d.width = builtin->width;
+    frmsz->d.height = builtin->height;
+
+    return 1;
+}
+
+static int camera_builtin_enum_frame_interval(QEMUCamera *camera,
+                                              const QEMUCameraFormat *format,
+                                              QEMUCameraFrameInterval *frmivals,
+                                              int nfrmival, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    QEMUCameraFrameInterval *frmival;
+
+    if (nfrmival < 1) {
+        return 0;
+    }
+
+    if (format->width != builtin->width || format->height != builtin->height) {
+        error_setg(errp, "%s: enum frame interval unsupported mismatched "
+                   "width(%d)/height(%d)", TYPE_CAMERA_BUILTIN, format->width,
+                   format->height);
+        return 0;
+    }
+
+    frmival = frmivals;
+    frmival->pixel_format = format->pixel_format;
+    frmival->width = format->width;
+    frmival->height = format->height;
+    frmival->type = QEMU_CAMERA_FRMIVAL_TYPE_DISCRETE;
+    frmival->d.numerator = 1;
+    frmival->d.denominator = builtin->fps;
+
+    return 1;
+}
+
+static int camera_builtin_set_frame_interval(QEMUCamera *camera,
+               const QEMUCameraFrameInterval *frmival, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+
+    if (frmival->width != builtin->width
+        || frmival->height != builtin->height) {
+        error_setg(errp, "%s: set frame interval unsupported mismatched "
+                   "width(%d)/height(%d)", TYPE_CAMERA_BUILTIN, frmival->width,
+                   frmival->height);
+        return 0;
+    }
+
+    builtin->pixfmt = frmival->pixel_format;
+
+    return 0;
+}
+
+static int camera_builtin_enum_control(QEMUCamera *camera,
+               QEMUCameraControl *controls, int ncontrols, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    QEMUCameraControl *control;
+    QEMUCameraControlType t;
+
+    for (t = 0; t < QEMUCameraControlMax; t++) {
+        control = controls + t;
+        control->type = t;
+        control->cur = builtin->ctrl[t][ATTRIBUTE_CUR];
+        control->def = builtin->ctrl[t][ATTRIBUTE_DEF];
+        control->min = builtin->ctrl[t][ATTRIBUTE_MIN];
+        control->max = builtin->ctrl[t][ATTRIBUTE_MAX];
+        control->step = builtin->ctrl[t][ATTRIBUTE_STEP];
+    }
+
+    return t;
+}
+
+static int camera_builtin_set_control(QEMUCamera *camera,
+               const QEMUCameraControl *control, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+
+    builtin->ctrl[control->type][ATTRIBUTE_CUR] = control->cur;
+
+    return 0;
+}
+
+#define CHECK_AND_GET_OPTS(x, y)                               \
+    do {                                                       \
+        if (builtinopts->has_##x) {                            \
+            if (builtinopts->x > CAMERA_BUILTIN_MAX_##y        \
+               || builtinopts->x < CAMERA_BUILTIN_MIN_##y) {   \
+                error_setg(errp, "%s: unsupported %s(%d, %d)", \
+                           TYPE_CAMERA_BUILTIN, #x,            \
+                           CAMERA_BUILTIN_MIN_##y,             \
+                           CAMERA_BUILTIN_MAX_##y);            \
+                return;                                        \
+            }                                                  \
+            builtin->x = builtinopts->x;                       \
+        } else {                                               \
+            builtin->x = CAMERA_BUILTIN_DEF_##y;               \
+        }                                                      \
+    } while (0)
+
+#define CHECK_AND_GET_VAL(x, def)                              \
+    do {                                                       \
+        if (builtinopts->has_##x) {                            \
+            builtin->x = builtinopts->x;                       \
+        } else {                                               \
+            builtin->x = def;                                  \
+        }                                                      \
+    } while (0)
+
+static void camera_builtin_open(QEMUCamera *camera, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    CameraBuiltinOptions *builtinopts = &camera->dev->u.builtin;
+
+    CHECK_AND_GET_OPTS(width, WIDTH);
+    CHECK_AND_GET_OPTS(height, HEIGHT);
+    CHECK_AND_GET_OPTS(fps, FPS);
+    CHECK_AND_GET_VAL(bgcolor, COLOR_TYPE_BLUE);
+    CHECK_AND_GET_VAL(debug, false);
+    CHECK_AND_GET_VAL(yuv, true);
+    CHECK_AND_GET_VAL(rgb565, true);
+#ifdef CONFIG_VNC_JPEG
+    CHECK_AND_GET_VAL(mjpeg, true);
+#else
+    if (builtinopts->has_mjpeg && builtinopts->mjpeg) {
+        error_setg(errp, "%s: no libjpeg supported", TYPE_CAMERA_BUILTIN);
+        return;
+    }
+#endif
+
+    if (builtin->mjpeg) {
+        builtin->pixfmts[builtin->npixfmts++] = QEMU_CAMERA_PIX_FMT_MJPEG;
+    }
+
+    if (builtin->yuv) {
+        builtin->pixfmts[builtin->npixfmts++] = QEMU_CAMERA_PIX_FMT_YUYV;
+    }
+
+    if (builtin->rgb565) {
+        builtin->pixfmts[builtin->npixfmts++] = QEMU_CAMERA_PIX_FMT_RGB565;
+    }
+
+    if (!builtin->npixfmts) {
+        error_setg(errp, "%s: all formats disabled", TYPE_CAMERA_BUILTIN);
+    }
+}
+
+static void camera_builtin_stream_on(QEMUCamera *camera, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    cairo_format_t cairofmt;
+    size_t imagesize;
+
+    imagesize = builtin->height * builtin->width * 2;
+    if (builtin->pixfmt == QEMU_CAMERA_PIX_FMT_RGB565) {
+        cairofmt = CAIRO_FORMAT_RGB16_565;
+        builtin->pixbytes = 2;
+    } else {
+        cairofmt = CAIRO_FORMAT_RGB24;
+        builtin->pixbytes = 4; /* see enum cairo_format_t in cairo.h */
+    }
+    builtin->surface = cairo_image_surface_create(cairofmt, builtin->width,
+                                                  builtin->height);
+    builtin->cr = cairo_create(builtin->surface);
+    qemu_camera_alloc_image(camera, imagesize, errp);
+    builtin->image_size = imagesize;
+    builtin->image = g_malloc(imagesize);
+
+    builtin->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                               camera_builtin_frame_timer, camera);
+    timer_mod(builtin->frame_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
+              + NANOSECONDS_PER_SECOND / builtin->fps);
+}
+
+static void camera_builtin_stream_off(QEMUCamera *camera, Error **errp)
+{
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+
+    timer_free(builtin->frame_timer);
+
+    qemu_camera_free_image(camera);
+    g_free(builtin->image);
+    builtin->image = NULL;
+    builtin->sequence = 0;
+
+    cairo_destroy(builtin->cr);
+    cairo_surface_destroy(builtin->surface);
+
+    g_free(builtin->opaque);
+    builtin->opaque = NULL;
+}
+
+
+static void camera_builtin_init(Object *obj)
+{
+    QEMUCamera *camera = CAMERADEV(obj);
+    CameraBuiltin *builtin = CAMERA_BUILTIN_DEV(camera);
+    int i;
+
+    /*
+     * Because builtin camera is designed for debug purpose only, so this table
+     * does't keep align with the read camera, just to make the code easy.
+     */
+    for (i = 0; i < QEMUCameraControlMax; i++) {
+        builtin->ctrl[i][ATTRIBUTE_DEF] = 0x7f;
+        builtin->ctrl[i][ATTRIBUTE_MIN] = 0;
+        builtin->ctrl[i][ATTRIBUTE_MAX] = 0xff;
+        builtin->ctrl[i][ATTRIBUTE_CUR] = 0;
+        builtin->ctrl[i][ATTRIBUTE_STEP] = 1;
+    }
+
+    builtin->ctrl[QEMUCameraHueAuto][ATTRIBUTE_DEF] = 0;
+    builtin->ctrl[QEMUCameraHueAuto][ATTRIBUTE_MIN] = 0;
+    builtin->ctrl[QEMUCameraHueAuto][ATTRIBUTE_MAX] = 1;
+}
+
+static void camera_builtin_finalize(Object *obj)
+{
+    QEMUCamera *camera = CAMERADEV(obj);
+    Error *local_err = NULL;
+
+    camera_builtin_stream_off(camera, &local_err);
+}
+
+static void camera_builtin_class_init(ObjectClass *oc, void *data)
+{
+    QEMUCameraClass *klass = CAMERADEV_CLASS(oc);
+
+    klass->open = camera_builtin_open;
+    klass->stream_on = camera_builtin_stream_on;
+    klass->stream_off = camera_builtin_stream_off;
+    klass->enum_pixel_format = camera_builtin_enum_pixel_format;
+    klass->enum_frame_size = camera_builtin_enum_frame_size;
+    klass->enum_frame_interval = camera_builtin_enum_frame_interval;
+    klass->set_frame_interval = camera_builtin_set_frame_interval;
+    klass->enum_control = camera_builtin_enum_control;
+    klass->set_control = camera_builtin_set_control;
+}
+
+static const TypeInfo camera_builtin_type_info = {
+    .name = TYPE_CAMERA_BUILTIN,
+    .parent = TYPE_CAMERADEV,
+    .instance_size = sizeof(CameraBuiltin),
+    .instance_init = camera_builtin_init,
+    .instance_finalize = camera_builtin_finalize,
+    .class_init = camera_builtin_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&camera_builtin_type_info);
+}
+
+type_init(register_types);
diff --git a/camera/camera-int.h b/camera/camera-int.h
new file mode 100644
index 0000000000..f3f67ac43e
--- /dev/null
+++ b/camera/camera-int.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU Camera subsystem
+ *
+ * Copyright 2021 Bytedance, Inc.
+ *
+ * Authors:
+ *   zhenwei pi <pizhenwei@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_CAMERA_INT_H
+#define QEMU_CAMERA_INT_H
+
+void qemu_camera_alloc_image(QEMUCamera *camera, size_t size, Error **errp);
+void qemu_camera_free_image(QEMUCamera *camera);
+void qemu_camera_new_image(QEMUCamera *camera, const void *addr, size_t size);
+
+#endif /* QEMU_CAMERA_INT_H */
diff --git a/camera/camera.c b/camera/camera.c
new file mode 100644
index 0000000000..0bbc60b8fc
--- /dev/null
+++ b/camera/camera.c
@@ -0,0 +1,522 @@
+/*
+ * QEMU camera subsystem
+ *
+ * Copyright 2021 Bytedance, Inc.
+ *
+ * Authors:
+ *   zhenwei pi <pizhenwei@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/help_option.h"
+#include "qemu/iov.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/qemu-print.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-camera.h"
+#include "camera/camera.h"
+#include "camera-int.h"
+#include "trace.h"
+
+static QLIST_HEAD(, QEMUCamera) qemu_cameras;
+
+const char *qemu_camera_id(QEMUCamera *camera)
+{
+    if (camera->dev && camera->dev->id) {
+        return camera->dev->id;
+    }
+
+    return "";
+}
+
+QEMUCamera *qemu_camera_by_id(const char *id)
+{
+    QEMUCamera *camera;
+
+    if (!id) {
+        return NULL;
+    }
+
+    QLIST_FOREACH(camera, &qemu_cameras, list) {
+        if (!strcmp(qemu_camera_id(camera), id)) {
+            return camera;
+        }
+    }
+
+    return NULL;
+}
+
+static const QEMUCameraClass *camera_get_class(const char *typename,
+                                               Error **errp)
+{
+    ObjectClass *oc;
+
+    oc = module_object_class_by_name(typename);
+
+    if (!object_class_dynamic_cast(oc, TYPE_CAMERADEV)) {
+        error_setg(errp, "%s: missing %s implementation",
+                   TYPE_CAMERADEV, typename);
+        return NULL;
+    }
+
+    if (object_class_is_abstract(oc)) {
+        error_setg(errp, "%s: %s is abstract type", TYPE_CAMERADEV, typename);
+        return NULL;
+    }
+
+    return CAMERADEV_CLASS(oc);
+}
+
+static QEMUCamera *qemu_camera_new(Cameradev *dev, Error **errp)
+{
+    Object *obj;
+    QEMUCamera *camera = NULL;
+    g_autofree char *typename = NULL;
+    Error *local_err = NULL;
+    QEMUCameraClass *klass;
+    const char *driver = CameradevDriver_str(dev->driver);
+
+    typename = g_strdup_printf("%s-%s", TYPE_CAMERADEV, driver);
+    if (!camera_get_class(typename, errp)) {
+        return NULL;
+    }
+
+    obj = object_new(typename);
+    if (!obj) {
+        return NULL;
+    }
+
+    camera = CAMERADEV(obj);
+    camera->dev = dev;
+
+    klass = CAMERADEV_GET_CLASS(camera);
+    if (klass->open) {
+        klass->open(camera, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            goto error;
+        }
+    }
+
+    QLIST_INSERT_HEAD(&qemu_cameras, camera, list);
+    trace_qemu_camera_new(qemu_camera_id(camera), typename);
+
+    return camera;
+
+error:
+    if (obj) {
+        object_unref(obj);
+    }
+
+    return NULL;
+}
+
+typedef struct CameradevClassFE {
+    void (*fn)(const char *name, void *opaque);
+    void *opaque;
+} CameradevClassFE;
+
+static void cameradev_class_foreach(ObjectClass *klass, void *opaque)
+{
+    CameradevClassFE *fe = opaque;
+
+    assert(g_str_has_prefix(object_class_get_name(klass), TYPE_CAMERADEV"-"));
+    fe->fn(object_class_get_name(klass) + 10, fe->opaque);
+}
+
+static void cameradev_name_foreach(void (*fn)(const char *name, void *opaque),
+                                   void *opaque)
+{
+    CameradevClassFE fe = { .fn = fn, .opaque = opaque };
+
+    object_class_foreach(cameradev_class_foreach, TYPE_CAMERADEV, false, &fe);
+}
+
+static void help_string_append(const char *name, void *opaque)
+{
+    GString *str = opaque;
+
+    g_string_append_printf(str, "\n  %s", name);
+}
+
+void qemu_camera_new_from_opts(const char *opt)
+{
+    Cameradev *dev;
+
+    if (opt && is_help_option(opt)) {
+        GString *str = g_string_new("");
+
+        cameradev_name_foreach(help_string_append, str);
+
+        qemu_printf("Available cameradev backend types: %s\n", str->str);
+        g_string_free(str, true);
+        return;
+    }
+
+    Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
+    visit_type_Cameradev(v, NULL, &dev, &error_fatal);
+    visit_free(v);
+
+    if (qemu_camera_by_id(dev->id)) {
+        error_setg(&error_fatal, "%s: id %s already existed",
+                   TYPE_CAMERADEV, dev->id);
+    }
+
+    if (!qemu_camera_new(dev, &error_fatal)) {
+        qapi_free_Cameradev(dev);
+    }
+}
+
+void qemu_camera_del(QEMUCamera *camera)
+{
+    Error *local_err = NULL;
+
+    trace_qemu_camera_del(qemu_camera_id(camera));
+
+    qemu_camera_stream_off(camera, &local_err);
+    QLIST_REMOVE(camera, list);
+    qapi_free_Cameradev(camera->dev);
+    object_unref(camera);
+}
+
+int qemu_camera_enum_pixel_format(QEMUCamera *camera, uint32_t *pixfmts,
+                                  int npixfmt, Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+    int ret, i;
+
+    if (!klass->enum_pixel_format) {
+        error_setg(errp, "%s: %s missing enum pixel format implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return -ENOTSUP;
+    }
+
+    ret = klass->enum_pixel_format(camera, pixfmts, npixfmt, errp);
+    if (ret > 0) {
+        for (i = 0; i < ret; i++) {
+            trace_qemu_camera_enum_pixel_format(qemu_camera_id(camera),
+                pixfmts[i]);
+        }
+    } else {
+        trace_qemu_camera_enum_pixel_format_ret(qemu_camera_id(camera), ret);
+    }
+
+    return ret;
+}
+
+int qemu_camera_enum_frame_size(QEMUCamera *camera, uint32_t pixfmt,
+                                QEMUCameraFrameSize *frmszs, int nfrmsz,
+                                Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+    int ret, i;
+
+    if (!klass->enum_frame_size) {
+        error_setg(errp, "%s: %s missing enum frame size implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return -ENOTSUP;
+    }
+
+    ret = klass->enum_frame_size(camera, pixfmt, frmszs, nfrmsz, errp);
+    if (ret > 0) {
+        QEMUCameraFrameSize *frmsz;
+
+        for (i = 0; i < ret; i++) {
+            frmsz = frmszs + i;
+            if (frmsz->type == QEMU_CAMERA_FRMSIZE_TYPE_DISCRETE)
+                trace_qemu_camera_enum_frame_size_d(qemu_camera_id(camera),
+                    frmsz->pixel_format, frmsz->d.width, frmsz->d.height);
+            }
+    } else {
+        trace_qemu_camera_enum_frame_size_ret(qemu_camera_id(camera), ret);
+    }
+
+    return ret;
+}
+
+int qemu_camera_enum_frame_interval(QEMUCamera *camera,
+                                    const QEMUCameraFormat *format,
+                                    QEMUCameraFrameInterval *frmivals,
+                                    int nfrmival, Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+    int ret, i;
+
+    if (!klass->enum_frame_interval) {
+        error_setg(errp, "%s: %s missing enum frame interval implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return -ENOTSUP;
+    }
+
+    ret = klass->enum_frame_interval(camera, format, frmivals, nfrmival, errp);
+    if (ret > 0) {
+        QEMUCameraFrameInterval *frmival;
+
+        for (i = 0; i < ret; i++) {
+            frmival = frmivals + i;
+            if (frmival->type == QEMU_CAMERA_FRMIVAL_TYPE_DISCRETE) {
+                trace_qemu_camera_enum_frame_interval_d(qemu_camera_id(camera),
+                    frmival->pixel_format, frmival->width, frmival->height,
+                    frmival->d.numerator, frmival->d.denominator);
+            }
+        }
+    } else {
+        trace_qemu_camera_enum_frame_interval_ret(qemu_camera_id(camera), ret);
+    }
+
+    return ret;
+}
+
+int qemu_camera_set_frame_interval(QEMUCamera *camera,
+                                   const QEMUCameraFrameInterval *frmival,
+                                   Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+    int ret;
+
+    if (!klass->set_frame_interval) {
+        error_setg(errp, "%s: %s missing set frame interval implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return -ENOTSUP;
+    }
+
+    ret = klass->set_frame_interval(camera, frmival, errp);
+    if (frmival->type == QEMU_CAMERA_FRMIVAL_TYPE_DISCRETE) {
+        trace_qemu_camera_set_frame_interval(qemu_camera_id(camera),
+            frmival->pixel_format, frmival->width, frmival->height,
+            frmival->d.numerator, frmival->d.denominator, ret);
+    }
+
+    return ret;
+}
+
+int qemu_camera_enum_control(QEMUCamera *camera, QEMUCameraControl *controls,
+                             int ncontrols, Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+    int ret, i;
+
+    if (!klass->enum_control) {
+        error_setg(errp, "%s: %s missing enum control implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return -ENOTSUP;
+    }
+
+    ret = klass->enum_control(camera, controls, ncontrols, errp);
+    if (ret > 0) {
+        QEMUCameraControl *control;
+
+        for (i = 0; i < ret; i++) {
+            control = controls + i;
+            trace_qemu_camera_enum_control(qemu_camera_id(camera),
+                QEMUCameraControlTypeString(control->type), control->def,
+                control->min, control->max, control->step);
+        }
+    } else {
+        trace_qemu_camera_enum_control_ret(qemu_camera_id(camera), ret);
+    }
+
+    return ret;
+}
+
+int qemu_camera_set_control(QEMUCamera *camera,
+                            const QEMUCameraControl *control, Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+
+    if (!klass->set_control) {
+        error_setg(errp, "%s: %s missing set control implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return -ENOTSUP;
+    }
+
+    trace_qemu_camera_set_control(qemu_camera_id(camera),
+        QEMUCameraControlTypeString(control->type), control->cur);
+
+    return klass->set_control(camera, control, errp);
+}
+
+void qemu_camera_stream_on(QEMUCamera *camera, qemu_camera_image_cb cb,
+                           void *opaque, Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+
+    if (!klass->stream_on) {
+        error_setg(errp, "%s: %s missing stream on implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return;
+    }
+
+    qemu_mutex_lock(&camera->image_lock);
+    camera->cb_fn = cb;
+    camera->cb_opaque = opaque;
+    qemu_mutex_unlock(&camera->image_lock);
+
+    klass->stream_on(camera, errp);
+    assert(camera->image_addr);
+    assert(camera->image_size);
+
+    trace_qemu_camera_stream_on(qemu_camera_id(camera));
+}
+
+void qemu_camera_stream_off(QEMUCamera *camera, Error **errp)
+{
+    QEMUCameraClass *klass = CAMERADEV_GET_CLASS(camera);
+
+    if (!klass->stream_off) {
+        error_setg(errp, "%s: %s missing stream off implementation",
+                   TYPE_CAMERADEV, qemu_camera_id(camera));
+        return;
+    }
+
+    qemu_mutex_lock(&camera->image_lock);
+    camera->cb_fn = NULL;
+    camera->cb_opaque = NULL;
+    qemu_mutex_unlock(&camera->image_lock);
+
+    klass->stream_off(camera, errp);
+
+    trace_qemu_camera_stream_off(qemu_camera_id(camera));
+}
+
+size_t qemu_camera_stream_length(QEMUCamera *camera)
+{
+    size_t length = 0;
+
+    qemu_mutex_lock(&camera->image_lock);
+    assert(camera->image_pos <= camera->image_bytes);
+    length = camera->image_bytes - camera->image_pos;
+    qemu_mutex_unlock(&camera->image_lock);
+
+    return length;
+}
+
+size_t qemu_camera_stream_read(QEMUCamera *camera, const struct iovec *iov,
+                               const uint32_t iov_cnt, size_t offset,
+                               size_t size)
+{
+    size_t length = 0;
+    void *addr;
+
+    qemu_mutex_lock(&camera->image_lock);
+
+    assert(camera->image_pos <= camera->image_bytes);
+    length = camera->image_bytes - camera->image_pos;
+    length = MIN(size, length);
+    if (!length) {
+        goto out;
+    }
+
+    addr = camera->image_addr + camera->image_pos;
+    iov_from_buf(iov, iov_cnt, offset, addr, size);
+    camera->image_pos += length;
+    if (camera->image_pos == camera->image_bytes) {
+        /* previous frame already fully read*/
+        camera->image_frames = camera->image_sequence;
+        camera->image_pos = 0;
+        camera->image_bytes = 0;
+    }
+
+out:
+    qemu_mutex_unlock(&camera->image_lock);
+
+    trace_qemu_camera_stream_read(qemu_camera_id(camera), length);
+
+    return length;
+}
+
+
+static void camera_init(Object *obj)
+{
+    QEMUCamera *camera = CAMERADEV(obj);
+
+    qemu_mutex_init(&camera->image_lock);
+}
+
+static void camera_finalize(Object *obj)
+{
+    QEMUCamera *camera = CAMERADEV(obj);
+
+    qemu_mutex_destroy(&camera->image_lock);
+}
+
+static const TypeInfo camera_type_info = {
+    .name = TYPE_CAMERADEV,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(QEMUCamera),
+    .instance_init = camera_init,
+    .instance_finalize = camera_finalize,
+    .abstract = true,
+    .class_size = sizeof(QEMUCameraClass),
+};
+
+static void register_types(void)
+{
+    type_register_static(&camera_type_info);
+}
+
+type_init(register_types);
+
+/* internal functions, declared in camera-int.h */
+
+void qemu_camera_alloc_image(QEMUCamera *camera, size_t size, Error **errp)
+{
+    trace_qemu_camera_alloc_image(qemu_camera_id(camera), size);
+
+    qemu_mutex_lock(&camera->image_lock);
+    if (camera->image_size == size) {
+        /* no need to re-allocate the same size image buffer */
+        goto out;
+    }
+
+    g_free(camera->image_addr);
+    camera->image_addr = g_malloc0(size);
+    camera->image_size = size;
+    camera->image_pos = 0;
+    camera->image_bytes = 0;
+
+out:
+    qemu_mutex_unlock(&camera->image_lock);
+}
+
+void qemu_camera_free_image(QEMUCamera *camera)
+{
+    trace_qemu_camera_free_image(qemu_camera_id(camera));
+
+    qemu_mutex_lock(&camera->image_lock);
+    g_free(camera->image_addr);
+    camera->image_addr = NULL;
+    camera->image_size = 0;
+    camera->image_pos = 0;
+    camera->image_bytes = 0;
+    qemu_mutex_unlock(&camera->image_lock);
+}
+
+void qemu_camera_new_image(QEMUCamera *camera, const void *addr, size_t size)
+{
+    trace_qemu_camera_new_image(qemu_camera_id(camera), camera->image_sequence,
+                                size);
+    qemu_mutex_lock(&camera->image_lock);
+
+    assert(camera->image_addr);
+    assert(size <= camera->image_size);
+
+    camera->image_sequence++;
+
+    if (camera->image_pos) {
+        /* previous frame in process */
+        goto out;
+    }
+
+    memcpy(camera->image_addr, addr, size);
+    camera->image_bytes = size;
+
+out:
+    qemu_mutex_unlock(&camera->image_lock);
+}
diff --git a/camera/meson.build b/camera/meson.build
new file mode 100644
index 0000000000..d50ee5ebf7
--- /dev/null
+++ b/camera/meson.build
@@ -0,0 +1,16 @@
+camera_ss.add([files(
+  'camera.c',
+)])
+
+camera_modules = {}
+foreach m : [
+  ['builtin', cairo, files('builtin.c')],
+]
+  if m[1].found()
+    module_ss = ss.source_set()
+    module_ss.add(m[1], m[2])
+    camera_modules += {m[0] : module_ss}
+  endif
+endforeach
+
+modules += {'camera': camera_modules}
diff --git a/camera/trace-events b/camera/trace-events
new file mode 100644
index 0000000000..2f4d93e924
--- /dev/null
+++ b/camera/trace-events
@@ -0,0 +1,24 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# camera.c
+qemu_camera_new(const char *dev, char *typename) "%s: new camera with type %s"
+qemu_camera_del(const char *dev) "%s: delete camera"
+qemu_camera_set_control(const char *dev, const char *type, int value) "%s: set control type %s, value %d"
+qemu_camera_stream_on(const char *dev) "%s: stream on"
+qemu_camera_stream_off(const char *dev) "%s: stream off"
+qemu_camera_stream_read(const char *dev, size_t length) "%s: stream read length %ld"
+qemu_camera_alloc_image(const char *dev, size_t size) "%s: alloc image size %ld"
+qemu_camera_free_image(const char *dev) "%s: free image size"
+qemu_camera_new_image(const char *dev, uint32_t seq, size_t size) "%s: new image sequence %u, size %ld"
+qemu_camera_enum_pixel_format(const char *dev, uint32_t pixfmt) "%s: pixfmt 0x%x"
+qemu_camera_enum_pixel_format_ret(const char *dev, int ret) "%s: ret %d"
+qemu_camera_enum_frame_size_d(const char *dev, uint32_t pixfmt, uint32_t w, uint32_t h) "%s: pixfmt 0x%x, discrete width %u, height %u"
+qemu_camera_enum_frame_size_ret(const char *dev, int ret) "%s: ret %d"
+qemu_camera_enum_frame_interval_d(const char *dev, uint32_t pixfmt, uint32_t w, uint32_t h, uint32_t n, uint32_t d) "%s: pixfmt 0x%x, width %u, height %u, discrete numerator %u, denominator %u"
+qemu_camera_enum_frame_interval_ret(const char *dev, int ret) "%s: ret %d"
+qemu_camera_set_frame_interval(const char *dev, uint32_t pixfmt, uint32_t w, uint32_t h, uint32_t n, uint32_t d, int ret) "%s: pixfmt 0x%x, width %u, height %u, discrete numerator %u, denominator %u, retval %d"
+qemu_camera_enum_control(const char *dev, const char *type, int def, int min, int max, int step) "%s: type %s, def %d, min %d, max %d, step %d"
+qemu_camera_enum_control_ret(const char *dev, int ret) "%s: ret %d"
+
+# builtin.c
+camera_builtin_timer(const char *dev) "%s: new image"
diff --git a/camera/trace.h b/camera/trace.h
new file mode 100644
index 0000000000..f248af5c9b
--- /dev/null
+++ b/camera/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-camera.h"
diff --git a/include/camera/camera.h b/include/camera/camera.h
new file mode 100644
index 0000000000..edf6d01d58
--- /dev/null
+++ b/include/camera/camera.h
@@ -0,0 +1,238 @@
+/*
+ * QEMU Camera subsystem
+ *
+ * Copyright 2021 Bytedance, Inc.
+ *
+ * Authors:
+ *   zhenwei pi <pizhenwei@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_CAMERA_H
+#define QEMU_CAMERA_H
+
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "qapi/qapi-types-camera.h"
+#include "qemu/queue.h"
+
+#define camera_fourcc_code(a, b, c, d) \
+                          ((uint32_t)(a) | ((uint32_t)(b) << 8) | \
+                          ((uint32_t)(c) << 16) | ((uint32_t)(d) << 24))
+
+#define QEMU_CAMERA_PIX_FMT_MJPEG  camera_fourcc_code('M', 'J', 'P', 'G')
+#define QEMU_CAMERA_PIX_FMT_YUYV   camera_fourcc_code('Y', 'U', 'Y', 'V')
+#define QEMU_CAMERA_PIX_FMT_RGB565 camera_fourcc_code('R', 'G', 'B', 'P')
+
+static inline bool qemu_camera_pixel_supported(uint32_t pixfmt)
+{
+    /* only process MJPEG & YUYV, may support others in future */
+    if ((pixfmt == QEMU_CAMERA_PIX_FMT_MJPEG)
+        || (pixfmt == QEMU_CAMERA_PIX_FMT_YUYV)
+        || (pixfmt == QEMU_CAMERA_PIX_FMT_RGB565)) {
+        return true;
+    }
+
+    return false;
+}
+
+#define QEMU_CAMERA_FRMSIZE_TYPE_DISCRETE 0x00
+#define QEMU_CAMERA_FRMSIZE_TYPE_STEPWISE 0x01
+
+typedef struct QEMUCameraFrameSize {
+    uint32_t pixel_format;
+
+    uint32_t type;
+    union {
+        struct FrameSizeDiscrete {
+            uint32_t width;
+            uint32_t height;
+        } d;
+
+        struct FrameSizeStepwise {
+            uint32_t min_width;
+            uint32_t max_width;
+            uint32_t step_width;
+            uint32_t min_height;
+            uint32_t max_height;
+            uint32_t step_height;
+        } s;
+    };
+} QEMUCameraFrameSize;
+
+typedef struct QEMUCameraFormat {
+    uint32_t pixel_format;
+    uint32_t width;
+    uint32_t height;
+} QEMUCameraFormat;
+
+#define QEMU_CAMERA_FRMIVAL_TYPE_DISCRETE 0x00
+#define QEMU_CAMERA_FRMIVAL_TYPE_STEPWISE 0x01
+
+typedef struct QEMUCameraFrameInterval {
+    uint32_t pixel_format;
+    uint32_t width;
+    uint32_t height;
+
+    uint32_t type;
+    union {
+        struct FrameIntervalDiscrete {
+            uint32_t numerator;
+            uint32_t denominator;
+        } d;
+
+        struct FrameIntervalStepwise {
+            struct FrameIntervalDiscrete min;
+            struct FrameIntervalDiscrete max;
+            struct FrameIntervalDiscrete step;
+        } s;
+    };
+} QEMUCameraFrameInterval;
+
+typedef enum QEMUCameraControlType {
+    QEMUCameraBrightness,
+    QEMUCameraContrast,
+    QEMUCameraGain,
+    QEMUCameraGamma,
+    QEMUCameraHue,
+    QEMUCameraHueAuto,
+    QEMUCameraSaturation,
+    QEMUCameraSharpness,
+    QEMUCameraWhiteBalanceTemperature,
+    QEMUCameraControlMax
+} QEMUCameraControlType;
+
+static const char *QEMUCameraControlTypeStr[] = {
+    "Brightness",
+    "Contrast",
+    "Gain",
+    "Gamma",
+    "Hue",
+    "HueAuto",
+    "Saturation",
+    "Sharpness",
+    "WhiteBalanceTemperature",
+    "Max",
+};
+
+static inline const char *QEMUCameraControlTypeString(QEMUCameraControlType t)
+{
+    if (t > QEMUCameraControlMax) {
+        return "";
+    }
+
+    return QEMUCameraControlTypeStr[t];
+}
+
+typedef struct QEMUCameraControl {
+    QEMUCameraControlType type;
+    int32_t cur;
+    int32_t def;
+    int32_t min;
+    int32_t max;
+    int32_t step;
+} QEMUCameraControl;
+
+#define TYPE_CAMERADEV "cameradev"
+
+typedef void (*qemu_camera_image_cb) (void *opaque, void *buf, ssize_t avail);
+
+struct QEMUCamera {
+    Object parent_obj;
+
+    char *model;
+    Cameradev *dev;
+
+    /* camera image buffer to store recent frame */
+    QemuMutex image_lock;
+    /* sequence number generated by driver */
+    uint32_t image_sequence;
+    /* frame sequence number currently work on */
+    uint32_t image_frames;
+    unsigned char *image_addr;
+    /* size of buffer */
+    ssize_t image_size;
+    /* real size of this frame, clear to zero after fully read*/
+    ssize_t image_bytes;
+    /* offset already read, clear to zero after fully read */
+    ssize_t image_pos;
+    qemu_camera_image_cb cb_fn;
+    void *cb_opaque;
+
+    QLIST_ENTRY(QEMUCamera) list;
+};
+
+OBJECT_DECLARE_TYPE(QEMUCamera, QEMUCameraClass, CAMERADEV)
+
+struct QEMUCameraClass {
+    ObjectClass parent_class;
+
+    void (*open)(QEMUCamera *camera, Error **errp);
+
+    void (*stream_on)(QEMUCamera *camera, Error **errp);
+
+    void (*stream_off)(QEMUCamera *camera, Error **errp);
+
+    int (*enum_pixel_format)(QEMUCamera *camera, uint32_t *pixfmts,
+                             int npixfmt, Error **errp);
+
+    int (*enum_frame_size)(QEMUCamera *camera, uint32_t pixfmt,
+                           QEMUCameraFrameSize *frmszs, int nfrmsz,
+                           Error **errp);
+
+    int (*enum_frame_interval)(QEMUCamera *camera,
+                               const QEMUCameraFormat *format,
+                               QEMUCameraFrameInterval *frmivals, int nfrmival,
+                               Error **errp);
+
+    int (*set_frame_interval)(QEMUCamera *camera,
+                              const QEMUCameraFrameInterval *frmival,
+                              Error **errp);
+
+    int (*enum_control)(QEMUCamera *camera, QEMUCameraControl *controls,
+                        int ncontrols, Error **errp);
+
+    int (*set_control)(QEMUCamera *camera, const QEMUCameraControl *control,
+                       Error **errp);
+};
+
+void qemu_camera_new_from_opts(const char *opt);
+void qemu_camera_del(QEMUCamera *camera);
+const char *qemu_camera_id(QEMUCamera *camera);
+QEMUCamera *qemu_camera_by_id(const char *id);
+
+int qemu_camera_enum_pixel_format(QEMUCamera *camera, uint32_t *pixfmts,
+                                  int npixfmt, Error **errp);
+
+int qemu_camera_enum_frame_size(QEMUCamera *camera, uint32_t pixfmt,
+                                QEMUCameraFrameSize *frmszs, int nfrmsz,
+                                Error **errp);
+
+int qemu_camera_enum_frame_interval(QEMUCamera *camera,
+                                    const QEMUCameraFormat *format,
+                                    QEMUCameraFrameInterval *frmivals,
+                                    int nfrmival, Error **errp);
+
+int qemu_camera_set_frame_interval(QEMUCamera *camera,
+                                   const QEMUCameraFrameInterval *frmival,
+                                   Error **errp);
+
+int qemu_camera_enum_control(QEMUCamera *camera, QEMUCameraControl *controls,
+                             int ncontrols, Error **errp);
+
+int qemu_camera_set_control(QEMUCamera *camera,
+                            const QEMUCameraControl *control, Error **errp);
+
+void qemu_camera_stream_on(QEMUCamera *camera, qemu_camera_image_cb cb,
+                           void *opaque, Error **errp);
+
+void qemu_camera_stream_off(QEMUCamera *camera, Error **errp);
+
+size_t qemu_camera_stream_length(QEMUCamera *camera);
+
+size_t qemu_camera_stream_read(QEMUCamera *camera, const struct iovec *iov,
+                               const uint32_t iov_cnt, size_t offset,
+                               size_t size);
+
+#endif /* QEMU_CAMERA_H */
diff --git a/meson.build b/meson.build
index 886f0a9343..f0b51a0861 100644
--- a/meson.build
+++ b/meson.build
@@ -423,6 +423,13 @@ if 'ust' in get_option('trace_backends')
   lttng = dependency('lttng-ust', required: true, method: 'pkg-config',
                      kwargs: static_kwargs)
 endif
+
+cairo = not_found
+if have_system
+  cairo = dependency('cairo', required: have_system,
+                     method: 'pkg-config', kwargs: static_kwargs)
+endif
+
 pixman = not_found
 if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
@@ -1452,6 +1459,7 @@ config_host_data.set('HOST_' + host_arch.to_upper(), 1)
 
 config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
+config_host_data.set('CONFIG_CAIRO', cairo.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
 config_host_data.set('CONFIG_GCOV', get_option('b_coverage'))
@@ -2395,6 +2403,7 @@ genh += hxdep
 authz_ss = ss.source_set()
 blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
+camera_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 common_user_ss = ss.source_set()
@@ -2453,6 +2462,7 @@ if have_system
     'audio',
     'backends',
     'backends/tpm',
+    'camera',
     'chardev',
     'ebpf',
     'hw/9pfs',
@@ -2572,6 +2582,7 @@ endif
 
 subdir('audio')
 subdir('io')
+subdir('camera')
 subdir('chardev')
 subdir('fsdev')
 subdir('dump')
@@ -2848,6 +2859,13 @@ libchardev = static_library('chardev', chardev_ss.sources() + genh,
 
 chardev = declare_dependency(link_whole: libchardev)
 
+camera_ss = camera_ss.apply(config_host, strict: false)
+libcamera = static_library('camera', camera_ss.sources() + genh,
+                           name_suffix: 'fa',
+                           build_by_default: false)
+
+camera = declare_dependency(link_whole: libcamera)
+
 hwcore_ss = hwcore_ss.apply(config_host, strict: false)
 libhwcore = static_library('hwcore', sources: hwcore_ss.sources() + genh,
                            name_suffix: 'fa',
@@ -2867,7 +2885,7 @@ foreach m : block_mods + softmmu_mods
                 install_dir: qemu_moddir)
 endforeach
 
-softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
+softmmu_ss.add(authz, blockdev, camera, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
 
 common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..d51729441a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -208,3 +208,6 @@ option('fdt', type: 'combo', value: 'auto',
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
+
+option('camera', type: 'feature', value: 'auto',
+       description: 'Camera subsystem support')
diff --git a/qapi/camera.json b/qapi/camera.json
new file mode 100644
index 0000000000..2c8314ba4a
--- /dev/null
+++ b/qapi/camera.json
@@ -0,0 +1,84 @@
+# -*- mode: python -*-
+#
+# Copyright (C) 2021 zhenwei pi<pizhenwei@bytedance.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+
+##
+# = Camera
+##
+
+##
+# @ColorType:
+#
+# An enumeration of color type.
+#
+# Since: 6.3
+##
+{ 'enum': 'ColorType',
+  'data': [ 'blue', 'green', 'red', 'rainbow', 'digital-rain' ] }
+
+##
+# @CameraBuiltinOptions:
+#
+# Options of the builtin camera.
+#
+# @debug: enable/disable debug information in camera video
+#
+# @fps: the FPS of builtin camera
+#
+# @width: the width of frame
+#
+# @height: the height of frame
+#
+# @mjpeg: enable/disable mjpeg format
+#
+# @yuv: enable/disable yuv format
+#
+# @rgb565: enable/disable rgb565 format
+#
+# @bgcolor: background color of camera
+#
+# Since: 6.3
+##
+{ 'struct': 'CameraBuiltinOptions',
+  'data': {
+    '*debug': 'bool',
+    '*fps': 'uint32',
+    '*width': 'uint32',
+    '*height': 'uint32',
+    '*mjpeg': 'bool',
+    '*yuv': 'bool',
+    '*rgb565': 'bool',
+    '*bgcolor': 'ColorType' } }
+
+
+##
+# @CameradevDriver:
+#
+# An enumeration of possible camera backend drivers.
+#
+# Since: 6.3
+##
+{ 'enum': 'CameradevDriver',
+  'data': [ 'builtin' ] }
+
+##
+# @Cameradev:
+#
+# Options of an camera backend.
+#
+# @id: identifier of the backend
+#
+# @driver: the backend driver to use
+#
+# Since: 6.3
+##
+{ 'union': 'Cameradev',
+  'base': {
+    'id':          'str',
+    'driver':      'CameradevDriver'},
+  'discriminator': 'driver',
+  'data': {
+    'builtin':     'CameraBuiltinOptions' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..404eb2e573 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -59,6 +59,7 @@ if have_system
     'rdma',
     'rocker',
     'tpm',
+    'camera',
   ]
 endif
 if have_system or have_tools
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e..58afb77639 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'camera.json' }
diff --git a/qemu-options.hx b/qemu-options.hx
index 7d47510947..fa439134dc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3529,6 +3529,16 @@ The available backends are:
     traffic identified by a name (preferably a fqdn).
 ERST
 
+DEFHEADING(Camera device options:)
+
+DEF("cameradev", HAS_ARG, QEMU_OPTION_cameradev,
+    "-cameradev help\n"
+#ifdef CONFIG_CAIRO
+    "-cameradev builtin,id=id[,debug=true|false][,fps=FPS][,width=WIDTH][,height=HEIGHT][,mjpeg=true|false][,yuv=true|false][,rgb565=true|false][,bgcolor=blue|gree|red|rainbow|digital-rain]\n"
+#endif
+    , QEMU_ARCH_ALL
+)
+
 DEFHEADING()
 
 #ifdef CONFIG_TPM
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1367..3c5f483355 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -94,6 +94,7 @@
 #ifdef CONFIG_VIRTFS
 #include "fsdev/qemu-fsdev.h"
 #endif
+#include "camera/camera.h"
 #include "sysemu/qtest.h"
 
 #include "disas/disas.h"
@@ -3244,6 +3245,9 @@ void qemu_init(int argc, char **argv, char **envp)
                              qemu_opt_get(opts, "mount_tag"), &error_abort);
                 break;
             }
+            case QEMU_OPTION_cameradev:
+                qemu_camera_new_from_opts(optarg);
+                break;
             case QEMU_OPTION_serial:
                 add_device_config(DEV_SERIAL, optarg);
                 default_serial = 0;
-- 
2.25.1


