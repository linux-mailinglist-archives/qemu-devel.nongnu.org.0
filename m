Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B5341B5C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:23:30 +0100 (CET)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDE1-0001Yf-T6
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCe-0008Mc-Hq
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCc-0007il-U5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yIAG3Al8HNgrwLzCfgMacdoXn6DrIUneGS5xZzZMIA=;
 b=T8emCjz+8TxgM8mDhZAewB7W/KvgF4qp4ywm8GrEPdtrQ4AYyCwoXLjsXLLnPIMZ7YXils
 XT69mSmlnjvGLLVHEVJWZBM1ZPIpCNnHklAThz1b22D2Qe3LwedDylBbaZPrCk/3vu8QJ2
 CkHfTpNOSxJY2WcmcfcgPhd7X4b3hik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-yZLpKJQTO5mwO7N-TYDOow-1; Fri, 19 Mar 2021 07:21:58 -0400
X-MC-Unique: yZLpKJQTO5mwO7N-TYDOow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58734802B7E;
 Fri, 19 Mar 2021 11:21:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F5A5D9F2;
 Fri, 19 Mar 2021 11:21:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA27918003A8; Fri, 19 Mar 2021 12:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] virtio-gpu: add virtio-vga-gl
Date: Fri, 19 Mar 2021 12:21:36 +0100
Message-Id: <20210319112147.4138943-5-kraxel@redhat.com>
In-Reply-To: <20210319112147.4138943-1-kraxel@redhat.com>
References: <20210319112147.4138943-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

Add pci proxy for virtio-gpu-gl-device, with vga compatibility.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-vga.c | 30 ++++++++++++++++++++++++++++++
 util/module.c           |  1 +
 2 files changed, 31 insertions(+)

diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index d3c640406152..f45ebe97d3ed 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -269,10 +269,40 @@ static VirtioPCIDeviceTypeInfo virtio_vga_info = {
     .instance_init = virtio_vga_inst_initfn,
 };
 
+#define TYPE_VIRTIO_VGA_GL "virtio-vga-gl"
+
+typedef struct VirtIOVGAGL VirtIOVGAGL;
+DECLARE_INSTANCE_CHECKER(VirtIOVGAGL, VIRTIO_VGA_GL,
+                         TYPE_VIRTIO_VGA_GL)
+
+struct VirtIOVGAGL {
+    VirtIOVGABase parent_obj;
+
+    VirtIOGPUGL   vdev;
+};
+
+static void virtio_vga_gl_inst_initfn(Object *obj)
+{
+    VirtIOVGAGL *dev = VIRTIO_VGA_GL(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_GPU_GL);
+    VIRTIO_VGA_BASE(dev)->vgpu = VIRTIO_GPU_BASE(&dev->vdev);
+}
+
+
+static VirtioPCIDeviceTypeInfo virtio_vga_gl_info = {
+    .generic_name  = TYPE_VIRTIO_VGA_GL,
+    .parent        = TYPE_VIRTIO_VGA_BASE,
+    .instance_size = sizeof(VirtIOVGAGL),
+    .instance_init = virtio_vga_gl_inst_initfn,
+};
+
 static void virtio_vga_register_types(void)
 {
     type_register_static(&virtio_vga_base_info);
     virtio_pci_types_register(&virtio_vga_info);
+    virtio_pci_types_register(&virtio_vga_gl_info);
 }
 
 type_init(virtio_vga_register_types)
diff --git a/util/module.c b/util/module.c
index f825b071baa2..0bbe2b25fbec 100644
--- a/util/module.c
+++ b/util/module.c
@@ -308,6 +308,7 @@ static struct {
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
+    { "virtio-vga-gl",         "hw-", "display-virtio-vga"    },
     { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
     { "chardev-braille",       "chardev-", "baum"             },
     { "chardev-spicevmc",      "chardev-", "spice"            },
-- 
2.30.2


