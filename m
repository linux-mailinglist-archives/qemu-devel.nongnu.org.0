Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C84341B5A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:23:25 +0100 (CET)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDDw-0001Lq-LY
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCa-0008Hg-Mu
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCZ-0007ef-4G
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yxbkPn7dkdOa7pe9daclhW9r72WRhaDltGH35jfc58=;
 b=e+ho4LCwbSkH5Xm0uI7f8rjg9NVdDItVHT6a4/39Bei+hfij8lTu+Rg1biZUZZ+ib2YToj
 wdZND6w7+shDr6pkk8IV6LzlDAQxEJ/k5j9B7u1B6AE1DYDII8whQZlZgQoRDhZksp0egu
 nn+012jUybbpVQTwPBPfHaFmt0fZwNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-LsT7wBBmOo-VkIHaHBQNbQ-1; Fri, 19 Mar 2021 07:21:56 -0400
X-MC-Unique: LsT7wBBmOo-VkIHaHBQNbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A962281431D;
 Fri, 19 Mar 2021 11:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF7C69108;
 Fri, 19 Mar 2021 11:21:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCF5C18003A5; Fri, 19 Mar 2021 12:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] virtio-gpu: add virtio-gpu-gl-pci
Date: Fri, 19 Mar 2021 12:21:35 +0100
Message-Id: <20210319112147.4138943-4-kraxel@redhat.com>
In-Reply-To: <20210319112147.4138943-1-kraxel@redhat.com>
References: <20210319112147.4138943-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 vivek.kasireddy@intel.com, tina.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add pci proxy for virtio-gpu-gl-device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu-pci.c | 27 +++++++++++++++++++++++++++
 util/module.c               |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index d742a30aecf7..f5c685862ef7 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -91,10 +91,37 @@ static const VirtioPCIDeviceTypeInfo virtio_gpu_pci_info = {
     .instance_init = virtio_gpu_initfn,
 };
 
+#define TYPE_VIRTIO_GPU_GL_PCI "virtio-gpu-gl-pci"
+typedef struct VirtIOGPUGLPCI VirtIOGPUGLPCI;
+DECLARE_INSTANCE_CHECKER(VirtIOGPUGLPCI, VIRTIO_GPU_GL_PCI,
+                         TYPE_VIRTIO_GPU_GL_PCI)
+
+struct VirtIOGPUGLPCI {
+    VirtIOGPUPCIBase parent_obj;
+    VirtIOGPUGL vdev;
+};
+
+static void virtio_gpu_gl_initfn(Object *obj)
+{
+    VirtIOGPUGLPCI *dev = VIRTIO_GPU_GL_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_GPU_GL);
+    VIRTIO_GPU_PCI_BASE(obj)->vgpu = VIRTIO_GPU_BASE(&dev->vdev);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_gpu_gl_pci_info = {
+    .generic_name = TYPE_VIRTIO_GPU_GL_PCI,
+    .parent = TYPE_VIRTIO_GPU_PCI_BASE,
+    .instance_size = sizeof(VirtIOGPUGLPCI),
+    .instance_init = virtio_gpu_gl_initfn,
+};
+
 static void virtio_gpu_pci_register_types(void)
 {
     type_register_static(&virtio_gpu_pci_base_info);
     virtio_pci_types_register(&virtio_gpu_pci_info);
+    virtio_pci_types_register(&virtio_gpu_gl_pci_info);
 }
 
 type_init(virtio_gpu_pci_register_types)
diff --git a/util/module.c b/util/module.c
index fb80b85fe606..f825b071baa2 100644
--- a/util/module.c
+++ b/util/module.c
@@ -304,6 +304,7 @@ static struct {
     { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
+    { "virtio-gpu-gl-pci",     "hw-", "display-virtio-gpu-pci" },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
-- 
2.30.2


