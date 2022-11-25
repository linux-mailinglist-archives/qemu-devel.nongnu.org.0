Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E730A63891A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGD-0005Zi-NV; Fri, 25 Nov 2022 06:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGB-0005XA-R0
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGA-000390-1m
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 h131-20020a1c2189000000b003d02dd48c45so166540wmh.0
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s28HkAEMCk57TyI0FXFERjAS9/PKS+59lX976L2sL8o=;
 b=YSkgwhJoTfdg0iDC+4au1XEJJ+8CmZQLK4XrYxPqIGxckEhmjkI6vn3768ieAis94N
 knV6DIKmiVaTYCvCSa8Pu2GC2xr5aAPk+NmmW6Pou9RtFr+pWHAyuOCrCN74jx9bAzXQ
 +4PycKvqYIWJmTRsIGmQGdCg+QNQnT5zlz90o3jdK+L3EX1ifNbZ03fcxU2Enu6ORKMd
 3uP07XR3SKNC/ZHmZXPs+6+YqV5FaQ9E1x2mb5Ptls7d6pw07N2VqiHRN4HfiQe50bz8
 wiDRod4WR5CcstakLKCnk4cyMQhRHQ8I82yrmiJ4Oebr93PvTh2AX3PGJbU1hZ9AAPWP
 +mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s28HkAEMCk57TyI0FXFERjAS9/PKS+59lX976L2sL8o=;
 b=bzy0k415YNJ9js3SyGjg/4ELTcIbeTSH40WoL1Nwwkl0WlqabToQnKv4hbreHa+zrp
 aTkQZSzBoaJKrhaGcCzYxYHVU2qgzLc4DKwWQO0Lbl4BdNxeUFYLC5xEhojuq295lhJK
 ix/R9qqvukuMRZE+aM+RGQNLIAYFTWoeXZLiRDFI4e4rsq8Dps7WwIQt7j6D/R9lkL/U
 mv5jXZc/0CAnsMqK8x2sXubRqrZBXOb/pxk5yIpFU4Aj4DiuUFzB0zk22tvI5d+pJ6u6
 5wqB5xemEK6KwJaKco+jPaSqV9syPo2rIrpXqjBdDoIAz/qiI9G6NrOQ+BQhiQtQdL6T
 Ka7A==
X-Gm-Message-State: ANoB5pn54GPfvuJQlF0wdge+B3rdfaW+LsHspa+yGUlhcsmDdHOyKGdP
 IZQuAYZTssLctxBUDUgW+pWoTfnqAiwzPA==
X-Google-Smtp-Source: AA0mqf4ldShfVfYENoYw7SQLc0SV7XhcD+85LzPMjGqQFQikBDeT6Rb5gu7qWX9O8bB79Tq2H/8SEg==
X-Received: by 2002:a05:600c:4894:b0:3b4:91f1:da83 with SMTP id
 j20-20020a05600c489400b003b491f1da83mr16823006wmp.127.1669377164396; 
 Fri, 25 Nov 2022 03:52:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 2/7] hw/display/virtio-vga: Convert
 TYPE_VIRTIO_VGA_BASE to 3-phase reset
Date: Fri, 25 Nov 2022 11:52:35 +0000
Message-Id: <20221125115240.3005559-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Convert the TYPE_VIRTIO_VGA_BASE class to 3-phase reset, so we
don't need to use device_class_set_parent_reset() any more.

Note that this is an abstract class itself; none of the subclasses
override its reset method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/virtio-vga.h |  2 +-
 hw/display/virtio-vga.c | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/display/virtio-vga.h b/hw/display/virtio-vga.h
index 977ad5edc29..0bd9db1ceea 100644
--- a/hw/display/virtio-vga.h
+++ b/hw/display/virtio-vga.h
@@ -23,7 +23,7 @@ struct VirtIOVGABase {
 struct VirtIOVGABaseClass {
     VirtioPCIClass parent_class;
 
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #endif /* VIRTIO_VGA_H */
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 4dcb34c4a74..e6fb0aa876c 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -165,13 +165,15 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     }
 }
 
-static void virtio_vga_base_reset(DeviceState *dev)
+static void virtio_vga_base_reset_hold(Object *obj)
 {
-    VirtIOVGABaseClass *klass = VIRTIO_VGA_BASE_GET_CLASS(dev);
-    VirtIOVGABase *vvga = VIRTIO_VGA_BASE(dev);
+    VirtIOVGABaseClass *klass = VIRTIO_VGA_BASE_GET_CLASS(obj);
+    VirtIOVGABase *vvga = VIRTIO_VGA_BASE(obj);
 
     /* reset virtio-gpu */
-    klass->parent_reset(dev);
+    if (klass->parent_phases.hold) {
+        klass->parent_phases.hold(obj);
+    }
 
     /* reset vga */
     vga_common_reset(&vvga->vga);
@@ -203,13 +205,14 @@ static void virtio_vga_base_class_init(ObjectClass *klass, void *data)
     VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
     VirtIOVGABaseClass *v = VIRTIO_VGA_BASE_CLASS(klass);
     PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     device_class_set_props(dc, virtio_vga_base_properties);
     dc->vmsd = &vmstate_virtio_vga_base;
     dc->hotpluggable = false;
-    device_class_set_parent_reset(dc, virtio_vga_base_reset,
-                                  &v->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, virtio_vga_base_reset_hold,
+                                       NULL, &v->parent_phases);
 
     k->realize = virtio_vga_base_realize;
     pcidev_k->romfile = "vgabios-virtio.bin";
-- 
2.25.1


