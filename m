Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964F7653150
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynw-0006pw-BJ; Wed, 21 Dec 2022 08:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynu-0006lV-4R
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yns-0004Ws-0u
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZ8rNZ9vkLJ1qZu/EVJ3tU3Fcrp5MNrh20xbY6fHBcE=;
 b=cV+Bt+930n8alEE+D90x8qZQpLiVIcG8OorH1GUCjbiBwl6CydC9L8Q9Y4Jtk6VmoC038N
 lLzpwI/AGZD1K3RS8tRLUtsbJ+JNABCkyoR0Pj1IXCrjsENArR7GpwBkQ3vuTQvVRkpyIj
 jTOWr3/ooDTlfw0fjIE2Zc/O7Tpo+uI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-3NtK34RdPEuMUT9QwBdrtQ-1; Wed, 21 Dec 2022 08:06:33 -0500
X-MC-Unique: 3NtK34RdPEuMUT9QwBdrtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so915349wme.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZ8rNZ9vkLJ1qZu/EVJ3tU3Fcrp5MNrh20xbY6fHBcE=;
 b=nLGszy6fEWxYub4R3d/r/sUl6cyzyTKGXQi9F7y4gAhv2rInl3SxvEAKtlF4mQQKjR
 lIU600K65FKzwg7DfF+CR3z+KbX8Hf8utWTDjgouGp5pXUJFwtYM9o8VFWdpkxQmq2Zc
 6hdYvX4hd/jr6UKL5ZbaPWCsJyAGMalXnKeVzUwseOrNwnS2puW3MWUkrpp9OytqeCKU
 JWTUTNN7D4R5mtecppsgGPq1CX+0bQNzgh3N1gjqQEgz5SeZ02gq2v/DMSzKENC2RS82
 +wtWyt9stRKqGmLGO4pwhk/W31Ksv40j8xXpbdxxS/PN6HBF0II9PAQ7TsfQvXvz2Csw
 6XGg==
X-Gm-Message-State: AFqh2kpBKD97irUDswc1VussgBTkurSzza7WqqOOil/HONYSDmZ/475k
 +sc49auxV/oZGkIgqEontnPLhGhqIxu5Sw8c1fM3I7j7pSnDjkRRq8TUkbKsmGJ++lXd7f8fr4P
 vW65Bhq6AMPzpkt26yQhYjoKdGNbSnT/1HuWLatsjQAxqTKoRxY0rpMy842b9
X-Received: by 2002:a1c:2906:0:b0:3d2:3d7b:6115 with SMTP id
 p6-20020a1c2906000000b003d23d7b6115mr1689806wmp.7.1671627991879; 
 Wed, 21 Dec 2022 05:06:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtM1gSVWtcKLKkk5NrpRd5t8Jj3solEyGQYAE7p9oCPEoc4DWnTKVGNxu0C23QWm210tizjUQ==
X-Received: by 2002:a1c:2906:0:b0:3d2:3d7b:6115 with SMTP id
 p6-20020a1c2906000000b003d23d7b6115mr1689781wmp.7.1671627991552; 
 Wed, 21 Dec 2022 05:06:31 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c230500b003d1e051f671sm2214645wmo.9.2022.12.21.05.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:31 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 38/41] hw/virtio: Extract config read/write accessors to
 virtio-config-io.c
Message-ID: <20221221130339.1234592-39-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

These config helpers use the target-dependent LD/ST API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221213111707.34921-6-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-config-io.c | 204 +++++++++++++++++++++++++++++++++++
 hw/virtio/virtio.c           | 190 --------------------------------
 hw/virtio/meson.build        |   1 +
 3 files changed, 205 insertions(+), 190 deletions(-)
 create mode 100644 hw/virtio/virtio-config-io.c

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
index 989c96229c..e0aa70248a 100644
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
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 0d1ea1fea6..a52f4e5c01 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -5,6 +5,7 @@ softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
+specific_virtio_ss.add(files('virtio-config-io.c'))
 
 if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
-- 
MST


