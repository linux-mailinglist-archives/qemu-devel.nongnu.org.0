Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3F5368C1
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 00:24:02 +0200 (CEST)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuiNF-0002lH-9g
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 18:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuiJq-00072S-48; Fri, 27 May 2022 18:20:30 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuiJn-0000Rh-Hz; Fri, 27 May 2022 18:20:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5306F2199A;
 Fri, 27 May 2022 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653690025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BhmhYdQH9TJ9VFY7ogeLN92IqaqddF5V5hcfRrY1SUQ=;
 b=kCBJkOitO3yKxslO/On693S/6ro0tltG1I1hb0s4R/xp4cKrHYYnom/4yWWKI4BlEwJh1d
 KSWQ0R8VZdm8Tx1PpZtY2BSutUDzAvOA5mx5dqCg/yLjzZNeHequxNNTw6e6kCBgypb5Kf
 XJBcbJsBucj/CajG6AZIQYZjBVy5OFk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8E7113A84;
 Fri, 27 May 2022 22:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7nM+NqhOkWKgJAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Fri, 27 May 2022 22:20:24 +0000
Subject: [RESEND PATCH 1/2] modules: introduces module_kconfig directive
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: "Jose R. Ziviani" <jziviani@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Date: Sat, 28 May 2022 00:20:23 +0200
Message-ID: <165369002370.5857.12150544416563557322.stgit@work>
In-Reply-To: <165368982364.5857.13012746434823168062.stgit@work>
References: <165368982364.5857.13012746434823168062.stgit@work>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=dfaggioli@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jose R. Ziviani <jziviani@suse.de>

module_kconfig is a new directive that should be used with module_obj
whenever that module depends on the Kconfig to be enabled.

When the module is enabled in Kconfig we are sure that its dependencies
will be enabled as well, thus the module will be loaded without any
problem.

The correct way to use module_kconfig is by passing the Kconfig option
to module_kconfig (or the *config-devices.mak without CONFIG_).

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-s390x@nongnu.org
---
 hw/display/qxl.c                |    1 +
 hw/display/vhost-user-gpu-pci.c |    1 +
 hw/display/vhost-user-gpu.c     |    1 +
 hw/display/vhost-user-vga.c     |    1 +
 hw/display/virtio-gpu-base.c    |    1 +
 hw/display/virtio-gpu-gl.c      |    1 +
 hw/display/virtio-gpu-pci-gl.c  |    1 +
 hw/display/virtio-gpu-pci.c     |    1 +
 hw/display/virtio-gpu.c         |    1 +
 hw/display/virtio-vga-gl.c      |    1 +
 hw/display/virtio-vga.c         |    1 +
 hw/s390x/virtio-ccw-gpu.c       |    1 +
 hw/usb/ccid-card-emulated.c     |    1 +
 hw/usb/ccid-card-passthru.c     |    1 +
 hw/usb/host-libusb.c            |    1 +
 hw/usb/redirect.c               |    1 +
 include/qemu/module.h           |   10 ++++++++++
 scripts/modinfo-generate.py     |    2 ++
 18 files changed, 28 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 2db34714fb..5b10f697f1 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2515,6 +2515,7 @@ static const TypeInfo qxl_primary_info = {
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
index 96e56c4467..3340ef9e5f 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -606,6 +606,7 @@ static const TypeInfo vhost_user_gpu_info = {
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
index 8ba5da4312..790cec333c 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -260,6 +260,7 @@ static const TypeInfo virtio_gpu_base_info = {
     .abstract = true
 };
 module_obj(TYPE_VIRTIO_GPU_BASE);
+module_kconfig(VIRTIO_GPU);
 
 static void
 virtio_register_types(void)
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 0bca887703..e06be60dfb 100644
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
index 529b5246b2..cd4a56056f 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1452,6 +1452,7 @@ static const TypeInfo virtio_gpu_info = {
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
index 7b55c8d0e7..c206b5da38 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -231,6 +231,7 @@ static const TypeInfo virtio_vga_base_info = {
     .abstract      = true,
 };
 module_obj(TYPE_VIRTIO_VGA_BASE);
+module_kconfig(VIRTIO_VGA);
 
 #define TYPE_VIRTIO_VGA "virtio-vga"
 
diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index 8d995fcb33..0642c5281d 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -69,6 +69,7 @@ static const TypeInfo virtio_ccw_gpu = {
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
index f530ab2565..07ee42f304 100644
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
index 2b35cb6cdd..28f8af8941 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1809,6 +1809,7 @@ static const TypeInfo usb_host_dev_info = {
     .instance_init = usb_host_instance_init,
 };
 module_obj(TYPE_USB_HOST_DEVICE);
+module_kconfig(USB);
 
 static void usb_host_register_types(void)
 {
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 3bc4dee7fe..fd7df599bc 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -2620,6 +2620,7 @@ static const TypeInfo usbredir_dev_info = {
     .instance_init = usbredir_instance_init,
 };
 module_obj(TYPE_USB_REDIR);
+module_kconfig(USB);
 
 static void usbredir_register_types(void)
 {
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 5fcc323b2a..bd73607104 100644
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



