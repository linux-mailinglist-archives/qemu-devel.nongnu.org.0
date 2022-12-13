Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302E64B3FF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 12:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p53I7-0004OV-6t; Tue, 13 Dec 2022 06:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53I4-0004MP-4v
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p53I1-0002Nh-54
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 06:17:39 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so7607713wmb.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20qiCSyBuRvA2agy+mA00cXv9PUs69i2cg2fmTzeXmk=;
 b=qCwRXET8S+LYlnlzSCVTuDEURl7xqRahEkmfauAGjOttw+Pq8bVE9J0ndXfvyN84wj
 cUyAYjk+HLpLBmlpODzywqNMkALe4CIHa07rOJ47a9D8oGGKR7gUrp9ksuVICSeKqV+0
 u423UfYZ1YsGdqhvKb8yD2PJPNstJKV2xQlrcTCj/xy8d27E283NRhQokFbVdJnaN/ve
 W0cYVv0+JtIBM0RtyePH2mEhBV9TAqlHrTITyPH4HMDO+jx3YmK04Tjg7ipkUY/Em86m
 WtqizH/RAmQDZeI3Om+0ioMbhUxqiRpcYvnldpNSs7Mh7E9mLdQ0QvapBqwpaeOin8tL
 1MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20qiCSyBuRvA2agy+mA00cXv9PUs69i2cg2fmTzeXmk=;
 b=EmeaK3igtIm4dQtFQqjrzijsz9SFmeOjhML0iAhQemz8m6uUySmyKg8tFZ/t6rg3ua
 mURaQvv55fkMyK9CxTXKX1xXPkvAXPEf13eQevxrG3SGqupaGVQ2QYy1xoxvN70zXNjN
 KO1hZmN9+RgxmTnBt0cxuFfbAbtseya7QOCyZTcpM9dvwX9U9Tnzbhj4y/nv5qHy8H9M
 LvIMEiqK8k3ZyHzBHsP4sk3l45ZVB/34o/LE5L92d+WJtw8de8U+ETQsuNk99vAR2tE2
 lhMh64GqA5x4whyxuZA6sF74hHNBsrnAM84pPOps2BvfISCfij+3l+Dkp2z5cP/xnCft
 12Gg==
X-Gm-Message-State: ANoB5pnjqwpckTojjhhFU1xc4GyEWbaNo4mZGRuIuXBUkhzv7//mkmFN
 nHSiEpjIw5mMPYtfpUUHtGT3HW0xzgcobCtucyg=
X-Google-Smtp-Source: AA0mqf5HJIsbwZPuiuipIyV8d3Bfsk733WqTKcJHyk4zW8fo9OXfXyV7QKb9nD7OnHo6JCo3m7kbog==
X-Received: by 2002:a05:600c:3514:b0:3cf:a83c:184a with SMTP id
 h20-20020a05600c351400b003cfa83c184amr15091197wmq.24.1670930255541; 
 Tue, 13 Dec 2022 03:17:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az25-20020a05600c601900b003cf9bf5208esm13122809wmb.19.2022.12.13.03.17.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 03:17:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Jonah Palmer <jonah.palmer@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 5/6] hw/virtio: Extract config read/write accessors
 to virtio-config-io.c
Date: Tue, 13 Dec 2022 12:17:06 +0100
Message-Id: <20221213111707.34921-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213111707.34921-1-philmd@linaro.org>
References: <20221213111707.34921-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These config helpers use the target-dependent LD/ST API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/meson.build        |   1 +
 hw/virtio/virtio-config-io.c | 204 +++++++++++++++++++++++++++++++++++
 hw/virtio/virtio.c           | 190 --------------------------------
 3 files changed, 205 insertions(+), 190 deletions(-)
 create mode 100644 hw/virtio/virtio-config-io.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 23a980efaa..4a3b00d3bf 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -5,6 +5,7 @@ softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
+specific_virtio_ss.add(files('virtio-config-io.c'))
 
 if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
diff --git a/hw/virtio/virtio-config-io.c b/hw/virtio/virtio-config-io.c
new file mode 100644
index 0000000000..ad78e0b9bc
--- /dev/null
+++ b/hw/virtio/virtio-config-io.c
@@ -0,0 +1,204 @@
+/*
+ * Virtio Support
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio.h"
+#include "cpu.h"
+
+uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint8_t val;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return (uint32_t)-1;
+    }
+
+    k->get_config(vdev, vdev->config);
+
+    val = ldub_p(vdev->config + addr);
+    return val;
+}
+
+uint32_t virtio_config_readw(VirtIODevice *vdev, uint32_t addr)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint16_t val;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return (uint32_t)-1;
+    }
+
+    k->get_config(vdev, vdev->config);
+
+    val = lduw_p(vdev->config + addr);
+    return val;
+}
+
+uint32_t virtio_config_readl(VirtIODevice *vdev, uint32_t addr)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint32_t val;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return (uint32_t)-1;
+    }
+
+    k->get_config(vdev, vdev->config);
+
+    val = ldl_p(vdev->config + addr);
+    return val;
+}
+
+void virtio_config_writeb(VirtIODevice *vdev, uint32_t addr, uint32_t data)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint8_t val = data;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return;
+    }
+
+    stb_p(vdev->config + addr, val);
+
+    if (k->set_config) {
+        k->set_config(vdev, vdev->config);
+    }
+}
+
+void virtio_config_writew(VirtIODevice *vdev, uint32_t addr, uint32_t data)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint16_t val = data;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return;
+    }
+
+    stw_p(vdev->config + addr, val);
+
+    if (k->set_config) {
+        k->set_config(vdev, vdev->config);
+    }
+}
+
+void virtio_config_writel(VirtIODevice *vdev, uint32_t addr, uint32_t data)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint32_t val = data;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return;
+    }
+
+    stl_p(vdev->config + addr, val);
+
+    if (k->set_config) {
+        k->set_config(vdev, vdev->config);
+    }
+}
+
+uint32_t virtio_config_modern_readb(VirtIODevice *vdev, uint32_t addr)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint8_t val;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return (uint32_t)-1;
+    }
+
+    k->get_config(vdev, vdev->config);
+
+    val = ldub_p(vdev->config + addr);
+    return val;
+}
+
+uint32_t virtio_config_modern_readw(VirtIODevice *vdev, uint32_t addr)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint16_t val;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return (uint32_t)-1;
+    }
+
+    k->get_config(vdev, vdev->config);
+
+    val = lduw_le_p(vdev->config + addr);
+    return val;
+}
+
+uint32_t virtio_config_modern_readl(VirtIODevice *vdev, uint32_t addr)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint32_t val;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return (uint32_t)-1;
+    }
+
+    k->get_config(vdev, vdev->config);
+
+    val = ldl_le_p(vdev->config + addr);
+    return val;
+}
+
+void virtio_config_modern_writeb(VirtIODevice *vdev,
+                                 uint32_t addr, uint32_t data)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint8_t val = data;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return;
+    }
+
+    stb_p(vdev->config + addr, val);
+
+    if (k->set_config) {
+        k->set_config(vdev, vdev->config);
+    }
+}
+
+void virtio_config_modern_writew(VirtIODevice *vdev,
+                                 uint32_t addr, uint32_t data)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint16_t val = data;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return;
+    }
+
+    stw_le_p(vdev->config + addr, val);
+
+    if (k->set_config) {
+        k->set_config(vdev, vdev->config);
+    }
+}
+
+void virtio_config_modern_writel(VirtIODevice *vdev,
+                                 uint32_t addr, uint32_t data)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    uint32_t val = data;
+
+    if (addr + sizeof(val) > vdev->config_len) {
+        return;
+    }
+
+    stl_le_p(vdev->config + addr, val);
+
+    if (k->set_config) {
+        k->set_config(vdev, vdev->config);
+    }
+}
+
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f2298bb437..01d043b3c6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -18,7 +18,6 @@
 #include "qapi/qapi-commands-qom.h"
 #include "qapi/qapi-visit-virtio.h"
 #include "qapi/qmp/qjson.h"
-#include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
@@ -2580,195 +2579,6 @@ void virtio_reset(void *opaque)
     }
 }
 
-uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint8_t val;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return (uint32_t)-1;
-    }
-
-    k->get_config(vdev, vdev->config);
-
-    val = ldub_p(vdev->config + addr);
-    return val;
-}
-
-uint32_t virtio_config_readw(VirtIODevice *vdev, uint32_t addr)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint16_t val;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return (uint32_t)-1;
-    }
-
-    k->get_config(vdev, vdev->config);
-
-    val = lduw_p(vdev->config + addr);
-    return val;
-}
-
-uint32_t virtio_config_readl(VirtIODevice *vdev, uint32_t addr)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint32_t val;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return (uint32_t)-1;
-    }
-
-    k->get_config(vdev, vdev->config);
-
-    val = ldl_p(vdev->config + addr);
-    return val;
-}
-
-void virtio_config_writeb(VirtIODevice *vdev, uint32_t addr, uint32_t data)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint8_t val = data;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return;
-    }
-
-    stb_p(vdev->config + addr, val);
-
-    if (k->set_config) {
-        k->set_config(vdev, vdev->config);
-    }
-}
-
-void virtio_config_writew(VirtIODevice *vdev, uint32_t addr, uint32_t data)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint16_t val = data;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return;
-    }
-
-    stw_p(vdev->config + addr, val);
-
-    if (k->set_config) {
-        k->set_config(vdev, vdev->config);
-    }
-}
-
-void virtio_config_writel(VirtIODevice *vdev, uint32_t addr, uint32_t data)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint32_t val = data;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return;
-    }
-
-    stl_p(vdev->config + addr, val);
-
-    if (k->set_config) {
-        k->set_config(vdev, vdev->config);
-    }
-}
-
-uint32_t virtio_config_modern_readb(VirtIODevice *vdev, uint32_t addr)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint8_t val;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return (uint32_t)-1;
-    }
-
-    k->get_config(vdev, vdev->config);
-
-    val = ldub_p(vdev->config + addr);
-    return val;
-}
-
-uint32_t virtio_config_modern_readw(VirtIODevice *vdev, uint32_t addr)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint16_t val;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return (uint32_t)-1;
-    }
-
-    k->get_config(vdev, vdev->config);
-
-    val = lduw_le_p(vdev->config + addr);
-    return val;
-}
-
-uint32_t virtio_config_modern_readl(VirtIODevice *vdev, uint32_t addr)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint32_t val;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return (uint32_t)-1;
-    }
-
-    k->get_config(vdev, vdev->config);
-
-    val = ldl_le_p(vdev->config + addr);
-    return val;
-}
-
-void virtio_config_modern_writeb(VirtIODevice *vdev,
-                                 uint32_t addr, uint32_t data)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint8_t val = data;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return;
-    }
-
-    stb_p(vdev->config + addr, val);
-
-    if (k->set_config) {
-        k->set_config(vdev, vdev->config);
-    }
-}
-
-void virtio_config_modern_writew(VirtIODevice *vdev,
-                                 uint32_t addr, uint32_t data)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint16_t val = data;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return;
-    }
-
-    stw_le_p(vdev->config + addr, val);
-
-    if (k->set_config) {
-        k->set_config(vdev, vdev->config);
-    }
-}
-
-void virtio_config_modern_writel(VirtIODevice *vdev,
-                                 uint32_t addr, uint32_t data)
-{
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    uint32_t val = data;
-
-    if (addr + sizeof(val) > vdev->config_len) {
-        return;
-    }
-
-    stl_le_p(vdev->config + addr, val);
-
-    if (k->set_config) {
-        k->set_config(vdev, vdev->config);
-    }
-}
-
 void virtio_queue_set_addr(VirtIODevice *vdev, int n, hwaddr addr)
 {
     if (!vdev->vq[n].vring.num) {
-- 
2.38.1


