Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B541B8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 22:50:34 +0200 (CEST)
Received: from localhost ([::1]:35482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVK3d-0004aB-Ks
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 16:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVJzt-00082m-Kf
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:46:42 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:46564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVJzq-0006fU-Rp
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:46:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47EAC202D1;
 Tue, 28 Sep 2021 20:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632861996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwMMyt9TwL0/VEUc/5gpG8CnJJQ9xpwtjskusEHZUVw=;
 b=aPpyS7EGHaWf+pj0Qxl3kOsQTpwSnoriAsM4lGWbchpYTXkfrijs8P1XFwxh9iwF5UqwAN
 0d/awwgqU2e6MUTKJhDgCwaXaLX/nnuPHwoeB+DRsSJeTLLsZvANIA0aUQvI1k57An5y2G
 0mUPq3GX4aEHUUo/XY2JQeEbNsdevXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632861996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwMMyt9TwL0/VEUc/5gpG8CnJJQ9xpwtjskusEHZUVw=;
 b=jeaAEn/uMSIb+XKBaFMaSY0DdM4pHaWXhTNChkToGZhVSdOA2AMsz5GW6K2tn1NLpwppKV
 Y0n+5CryAJjtm/DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C809A13E72;
 Tue, 28 Sep 2021 20:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cHNyIip/U2HdegAAMHmgww
 (envelope-from <jziviani@suse.de>); Tue, 28 Sep 2021 20:46:34 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] modules: introduces module_kconfig directive
Date: Tue, 28 Sep 2021 17:46:27 -0300
Message-Id: <20210928204628.20001-2-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928204628.20001-1-jziviani@suse.de>
References: <20210928204628.20001-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

module_kconfig is a new directive that should be used with module_obj
whenever that module depends on the Kconfig to be enabled.

When the module is enabled in Kconfig we are sure that its dependencies
will be enabled as well, thus the module will be loaded without any
problem.

The correct way to use module_kconfig is by passing the Kconfig option
to module_kconfig (or the *config-devices.mak without CONFIG_).

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 hw/display/qxl.c                |  1 +
 hw/display/vhost-user-gpu-pci.c |  1 +
 hw/display/vhost-user-gpu.c     |  1 +
 hw/display/vhost-user-vga.c     |  1 +
 hw/display/virtio-gpu-base.c    |  1 +
 hw/display/virtio-gpu-gl.c      |  1 +
 hw/display/virtio-gpu-pci-gl.c  |  1 +
 hw/display/virtio-gpu-pci.c     |  1 +
 hw/display/virtio-gpu.c         |  1 +
 hw/display/virtio-vga-gl.c      |  1 +
 hw/display/virtio-vga.c         |  1 +
 hw/s390x/virtio-ccw-gpu.c       |  1 +
 hw/usb/ccid-card-emulated.c     |  1 +
 hw/usb/ccid-card-passthru.c     |  1 +
 hw/usb/host-libusb.c            |  1 +
 hw/usb/redirect.c               |  1 +
 include/qemu/module.h           | 10 ++++++++++
 scripts/modinfo-generate.py     |  2 ++
 18 files changed, 28 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 29c80b4289..d02d50014b 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2494,6 +2494,7 @@ static const TypeInfo qxl_primary_info = {
     .class_init    = qxl_primary_class_init,
 };
 module_obj("qxl-vga");
+module_kconfig(QXL);
 
 static void qxl_secondary_class_init(ObjectClass *klass, void *data)
 {
diff --git a/hw/display/vhost-user-gpu-pci.c b/hw/display/vhost-user-gpu-pci.c
index daefcf7101..d119bcae45 100644
--- a/hw/display/vhost-user-gpu-pci.c
+++ b/hw/display/vhost-user-gpu-pci.c
@@ -44,6 +44,7 @@ static const VirtioPCIDeviceTypeInfo vhost_user_gpu_pci_info = {
     .instance_init = vhost_user_gpu_pci_initfn,
 };
 module_obj(TYPE_VHOST_USER_GPU_PCI);
+module_kconfig(VHOST_USER_GPU);
 
 static void vhost_user_gpu_pci_register_types(void)
 {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 49df56cd14..c961d2a2d8 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -599,6 +599,7 @@ static const TypeInfo vhost_user_gpu_info = {
     .class_init = vhost_user_gpu_class_init,
 };
 module_obj(TYPE_VHOST_USER_GPU);
+module_kconfig(VHOST_USER_GPU);
 
 static void vhost_user_gpu_register_types(void)
 {
diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index 072c9c65bc..0c146080fd 100644
--- a/hw/display/vhost-user-vga.c
+++ b/hw/display/vhost-user-vga.c
@@ -45,6 +45,7 @@ static const VirtioPCIDeviceTypeInfo vhost_user_vga_info = {
     .instance_init = vhost_user_vga_inst_initfn,
 };
 module_obj(TYPE_VHOST_USER_VGA);
+module_kconfig(VHOST_USER_VGA);
 
 static void vhost_user_vga_register_types(void)
 {
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c8da4806e0..cde96325ca 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -257,6 +257,7 @@ static const TypeInfo virtio_gpu_base_info = {
     .abstract = true
 };
 module_obj(TYPE_VIRTIO_GPU_BASE);
+module_kconfig(VIRTIO_GPU);
 
 static void
 virtio_register_types(void)
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 6cc4313b1a..f7837cc44d 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -160,6 +160,7 @@ static const TypeInfo virtio_gpu_gl_info = {
     .class_init = virtio_gpu_gl_class_init,
 };
 module_obj(TYPE_VIRTIO_GPU_GL);
+module_kconfig(VIRTIO_GPU);
 
 static void virtio_register_types(void)
 {
diff --git a/hw/display/virtio-gpu-pci-gl.c b/hw/display/virtio-gpu-pci-gl.c
index 99b14a0718..a2819e1ca9 100644
--- a/hw/display/virtio-gpu-pci-gl.c
+++ b/hw/display/virtio-gpu-pci-gl.c
@@ -47,6 +47,7 @@ static const VirtioPCIDeviceTypeInfo virtio_gpu_gl_pci_info = {
     .instance_init = virtio_gpu_gl_initfn,
 };
 module_obj(TYPE_VIRTIO_GPU_GL_PCI);
+module_kconfig(VIRTIO_PCI);
 
 static void virtio_gpu_gl_pci_register_types(void)
 {
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index e36eee0c40..93f214ff58 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -65,6 +65,7 @@ static const TypeInfo virtio_gpu_pci_base_info = {
     .abstract = true
 };
 module_obj(TYPE_VIRTIO_GPU_PCI_BASE);
+module_kconfig(VIRTIO_PCI);
 
 #define TYPE_VIRTIO_GPU_PCI "virtio-gpu-pci"
 typedef struct VirtIOGPUPCI VirtIOGPUPCI;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 182e0868b0..6cc6bb1f1f 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1450,6 +1450,7 @@ static const TypeInfo virtio_gpu_info = {
     .class_init = virtio_gpu_class_init,
 };
 module_obj(TYPE_VIRTIO_GPU);
+module_kconfig(VIRTIO_GPU);
 
 static void virtio_register_types(void)
 {
diff --git a/hw/display/virtio-vga-gl.c b/hw/display/virtio-vga-gl.c
index f22549097c..984faa6b39 100644
--- a/hw/display/virtio-vga-gl.c
+++ b/hw/display/virtio-vga-gl.c
@@ -37,6 +37,7 @@ static VirtioPCIDeviceTypeInfo virtio_vga_gl_info = {
     .instance_init = virtio_vga_gl_inst_initfn,
 };
 module_obj(TYPE_VIRTIO_VGA_GL);
+module_kconfig(VIRTIO_VGA);
 
 static void virtio_vga_register_types(void)
 {
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 9e57f61e9e..2a55f88837 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -240,6 +240,7 @@ static TypeInfo virtio_vga_base_info = {
     .abstract      = true,
 };
 module_obj(TYPE_VIRTIO_VGA_BASE);
+module_kconfig(VIRTIO_VGA);
 
 #define TYPE_VIRTIO_VGA "virtio-vga"
 
diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index 5868a2a070..024e8990f4 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -60,6 +60,7 @@ static const TypeInfo virtio_ccw_gpu = {
     .class_init    = virtio_ccw_gpu_class_init,
 };
 module_obj(TYPE_VIRTIO_GPU_CCW);
+module_kconfig(VIRTIO_CCW);
 
 static void virtio_ccw_gpu_register(void)
 {
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 6c8c0355e0..1ddf7297f6 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -613,6 +613,7 @@ static const TypeInfo emulated_card_info = {
     .class_init    = emulated_class_initfn,
 };
 module_obj(TYPE_EMULATED_CCID);
+module_kconfig(USB);
 
 static void ccid_card_emulated_register_types(void)
 {
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index fa3040fb71..748544d170 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -415,6 +415,7 @@ static const TypeInfo passthru_card_info = {
     .class_init    = passthru_class_initfn,
 };
 module_obj(TYPE_CCID_PASSTHRU);
+module_kconfig(USB);
 
 static void ccid_card_passthru_register_types(void)
 {
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index d0d46dd0a4..4784b07b8f 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1809,6 +1809,7 @@ static TypeInfo usb_host_dev_info = {
     .instance_init = usb_host_instance_init,
 };
 module_obj(TYPE_USB_HOST_DEVICE);
+module_kconfig(USB);
 
 static void usb_host_register_types(void)
 {
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 5f0ef9cb3b..b0e5fb381e 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -2609,6 +2609,7 @@ static const TypeInfo usbredir_dev_info = {
     .instance_init = usbredir_instance_init,
 };
 module_obj(TYPE_USB_REDIR);
+module_kconfig(USB);
 
 static void usbredir_register_types(void)
 {
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 3deac0078b..382234859d 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -135,6 +135,16 @@ void module_allow_arch(const char *arch);
  */
 #define module_opts(name) modinfo(opts, name)
 
+/**
+ * module_kconfig
+ *
+ * @name: Kconfig requirement necessary to load the module
+ *
+ * This module requires a core module that should be implemented and
+ * enabled in Kconfig.
+ */
+#define module_kconfig(name) modinfo(kconfig, name)
+
 /*
  * module info database
  *
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index f559eed007..689f33c0f2 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -48,6 +48,8 @@ def generate(name, lines):
                 opts.append(data)
             elif kind == 'arch':
                 arch = data;
+            elif kind == 'kconfig':
+                pass # ignore
             else:
                 print("unknown:", kind)
                 exit(1)
-- 
2.33.0


