Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5ED46EA92
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:05:18 +0100 (CET)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKz0-00074U-0d
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:05:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqk-0002eB-JR
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:46 -0500
Received: from [2a00:1450:4864:20::32d] (port=46617
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqi-0001Zx-Q7
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso4287914wmr.5
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ucRtCT/8uwpnsgdYhV7nphwjB8b91qloRsPjp9e3CEs=;
 b=tPTwBOt3NAUJGH+i3yviRxPIS2c+wBQKuKxfG1bARMoa4Q8CQJ/R0grYwMk841Gtda
 HuKx4Z4t/KrTeFB/Eb6Vd6RLrYwooKKOAiRsE7J/cLqaTWuqhYECBVuWTJ9kwoqmRdUm
 jkNbPfi4BBkm1uO8XACln1aQYIxpK99HphSQbhIwZ+1gobsNYHVb2QYLweDwEU6YAWp8
 kErbFi5msYnw+gvfz0c3UB2+MV8NvPN+WkVBbiplXVOtlFBgcENpfkhCDmdZs3DIAzLo
 Iuuzx7FSJh9So1LJVU3FR4m7fQE9QFbq5ekTf0VhXiLNDuAjfOmMGEvF/BmvI4W2J0ac
 DcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ucRtCT/8uwpnsgdYhV7nphwjB8b91qloRsPjp9e3CEs=;
 b=DOL9NZt8oZ0igbVsGB9W7BNjoZWi9ynoOl4oL1yKYAvxbk2W0e8hd8wknqK3iV5tso
 ZB10hJ/zJJOiZptNqKzcCXDz7x5dv/+FugL+9LmZd+nDZIn3P42Ha0ZhxSAvb0HJgFrC
 OfIUESq71U18ZOLPjHIBZP08wF9tiYn2f43i1BKTfjI8FvVj8V8Kr3O8UbCe2keoTDMS
 PRdXKWs0iX+jaA7PeKXFlMGodg5msebzF7rrJt72ki27XencmGNAhcWE+to/Vyzg0y/T
 XirbQ/0R7h8m2sR2yPxx+gtzEL8nSGpjre2dUJLuo7xogEhKCj6MiuPU1XzQcPS8sl+U
 6RcA==
X-Gm-Message-State: AOAM5301zG9ATHxosy3hfmUzcWIoJsiG1ciBwdmZZkooN6l7RZ6wvfF/
 bHZ/Ik7NlaxCdr44LdWulK74Jg==
X-Google-Smtp-Source: ABdhPJyPe/oYAPb9L64CsscqBYAFu1kvlIyTFlVv4Ty0HD+ce5x5m8CYVR8VQC8SRK1egL4h/qOQBw==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr8050810wmq.50.1639061802337; 
 Thu, 09 Dec 2021 06:56:42 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:41 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 7/8] hw/display: add vhost-user-video-pci
Date: Thu,  9 Dec 2021 14:56:00 +0000
Message-Id: <20211209145601.331477-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Add boiler plate code for vhost-user-video-pci.

Example
-device vhost-user-video-pci,chardev=video,id=video
-chardev socket,path=video.sock,id=video

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 hw/display/vhost-user-video-pci.c | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 hw/display/vhost-user-video-pci.c

diff --git a/hw/display/vhost-user-video-pci.c b/hw/display/vhost-user-video-pci.c
new file mode 100644
index 0000000000..ceeaad2742
--- /dev/null
+++ b/hw/display/vhost-user-video-pci.c
@@ -0,0 +1,82 @@
+/*
+ * Vhost-user VIDEO virtio device PCI glue
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-video.h"
+#include "hw/virtio/virtio-pci.h"
+
+struct VHostUserVIDEOPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserVIDEO vdev;
+};
+
+typedef struct VHostUserVIDEOPCI VHostUserVIDEOPCI;
+
+#define TYPE_VHOST_USER_VIDEO_PCI "vhost-user-video-pci-base"
+
+#define VHOST_USER_VIDEO_PCI(obj) \
+        OBJECT_CHECK(VHostUserVIDEOPCI, (obj), TYPE_VHOST_USER_VIDEO_PCI)
+
+static Property vuvideo_pci_properties[] = {
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vuvideo_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserVIDEOPCI *dev = VHOST_USER_VIDEO_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 1;
+    }
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), errp);
+    object_property_set_bool(OBJECT(vdev), "realized", true, errp);
+}
+
+static void vuvideo_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vuvideo_pci_realize;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, vuvideo_pci_properties);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_STORAGE_OTHER;
+}
+
+static void vuvideo_pci_instance_init(Object *obj)
+{
+    VHostUserVIDEOPCI *dev = VHOST_USER_VIDEO_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_VIDEO);
+}
+
+static const VirtioPCIDeviceTypeInfo vuvideo_pci_info = {
+    .base_name             = TYPE_VHOST_USER_VIDEO_PCI,
+    .non_transitional_name = "vhost-user-video-pci",
+    .instance_size = sizeof(VHostUserVIDEOPCI),
+    .instance_init = vuvideo_pci_instance_init,
+    .class_init    = vuvideo_pci_class_init,
+};
+
+static void vuvideo_pci_register(void)
+{
+    virtio_pci_types_register(&vuvideo_pci_info);
+}
+
+type_init(vuvideo_pci_register);
-- 
2.25.1


