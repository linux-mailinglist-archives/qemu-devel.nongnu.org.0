Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D664AB1C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rrz-0007Bu-3j; Mon, 12 Dec 2022 18:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrn-0007B7-Ak
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:47 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrk-0004Jb-Uo
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:46 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i15so15332703edf.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtZ4cgzKl55c5IR/jgqaC1y4yIycxamtTp9YNAr02b8=;
 b=i+mxb/y8kZlNdVca1eTR33mPDMnFi3jtMyjpBrIIrvb3Q66D6X0aU4Q1X8eiAUxedn
 gyYdnX6e/av1w/QkvI9N+f70WLcgfPRb2L61JVHKYfm9HHftzQsnktMvDlLxh6ZJnUW0
 yhokDs1HM3K7v2uS7dMUmU/Wmv2a1u+AXC/+JrAZs0bpEvEBi+mftv7y/PTN8SRq2T7v
 Xz+XQALSyETcWDK1hDL5bm7XGHuAAqPKwftHhoYramHsOZHb9EkS31LsSBWKfwKQq6xo
 5NpPO3ILTPd2fRZJlfxXDoXvu3NFlD0DU6PFOEnd1G99iXH/l8B4TgPVpl2s3xKJ5pdP
 3duQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtZ4cgzKl55c5IR/jgqaC1y4yIycxamtTp9YNAr02b8=;
 b=ebRSExVX9mYKsGXb0Bqp9+PiAM/jVNWlr/mWbFLDVn2h+WpoWND48r48buZNLeKzyY
 g7vGCTtPoP+Ux6WKrJ8B6ir1g63jgloy0Vt2fWBaXtj4SEohjLz9rNk9WAlUOs3dxyib
 dBOKnhgC5LtGaKgo5IoOpPV1JganTm4rE0UlROHgtTyCImraGECEjKAy9jeliomx+jPG
 R/12kxDqTKRfkl2D73kuuqfgIitTv3JQuGtyK7/kX+j4ppNd5iRMzE/WbJRRO+zSfJX/
 nabiPbrYRfcIk451sCpqf8bMXxTmsxL0T/R2WM6fs9hk2PrJcBMBvtS3N47rRUW50kV5
 L3tA==
X-Gm-Message-State: ANoB5pkN9icUA/DHngpW3824q66xOO4G4tf0cTG0BxexorRW81mFTfJa
 yXVgrlgzHWc9pUDFcLHVxRFmES+0cNrpcCYww+Y=
X-Google-Smtp-Source: AA0mqf7LpZFoK6i0QspyY2CUHjxyVK4G2nFURGUWepQdLKbl51ViVT2h9mRBJjgDOaPZR1wSZk5jBw==
X-Received: by 2002:aa7:cb81:0:b0:467:86c7:c4a8 with SMTP id
 r1-20020aa7cb81000000b0046786c7c4a8mr13773841edt.41.1670886342976; 
 Mon, 12 Dec 2022 15:05:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a50d6d4000000b00463b9d47e1fsm4353425edj.71.2022.12.12.15.05.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:05:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 04/10] hw/virtio: Extract config read/write accessors
 to virtio-config.c
Date: Tue, 13 Dec 2022 00:05:11 +0100
Message-Id: <20221212230517.28872-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

These config helpers use the target-dependent LD/ST API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/meson.build     |   1 +
 hw/virtio/virtio-config.c | 204 ++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio.c        | 190 -----------------------------------
 3 files changed, 205 insertions(+), 190 deletions(-)
 create mode 100644 hw/virtio/virtio-config.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 23a980efaa..097220b4b5 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -5,6 +5,7 @@ softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
+specific_virtio_ss.add(files('virtio-config.c'))
 
 if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
diff --git a/hw/virtio/virtio-config.c b/hw/virtio/virtio-config.c
new file mode 100644
index 0000000000..ad78e0b9bc
--- /dev/null
+++ b/hw/virtio/virtio-config.c
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
index f54cc23304..1f19c8e0f0 100644
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
@@ -2552,195 +2551,6 @@ void virtio_reset(void *opaque)
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


