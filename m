Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A33650C45
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:59:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Fj8-0001Y4-H8; Mon, 19 Dec 2022 07:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fj6-0001Xj-8S
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:58:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fj4-00069Q-B7
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671454716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=++6ElqBzqc6tcD2oIpA/fTv6iIcqM4QF4FQ+G6ZO4Wk=;
 b=ReR+PYYRqW3RGJ2093Jx435wsfPcKM4yVz8v4BxMH+UVAHIc2gczRdrU+SW8qQqdSO9I6h
 huxCy2m7UXd63XQHpKpQxAkvhN+ktYO+VMfLIzd8WaelCd/IAqQhLx11K9Y47i30K+HsXh
 mpoiIu8C6mAA6xFR6pr+7GY0XhjvuXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-J1Nfk88hOvuOpO5TSim-QA-1; Mon, 19 Dec 2022 07:58:33 -0500
X-MC-Unique: J1Nfk88hOvuOpO5TSim-QA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B7C101A52E
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 12:58:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC16E492C14;
 Mon, 19 Dec 2022 12:58:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] hw/display: avoid creating empty loadable modules
Date: Mon, 19 Dec 2022 12:58:30 +0000
Message-Id: <20221219125830.2369169-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

When using --disable-virglrenderer, QEMU still creates

  hw-display-virtio-gpu-gl.so
  hw-display-virtio-vga-gl.so
  hw-display-virtio-gpu-pci-gl.so

but when these are loaded, they provide no functionality as the code
which registers types is not compiled in. Funtionally this is
relatively harmless, because QEMU is fine loading a module with no
types.

This is rather confusing for users and OS distro maintainers though,
as they think they have the GL functionality built, but in fact the
module they are looking at provides nothing of value.

The root cause is the use of 'when/if_true' rules when adding sources
to the module source set. If all the rules evaluate to false, then we
have declared the module, but not added anything to it.  We need to
put declaration of the entire module inside a condition based on
existance of the 3rd party library deps that are mandatory.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1352
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/display/meson.build | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 7a725ed80e..20a53d24a8 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -64,7 +64,7 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
 
 
-if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
+if config_all_devices.has_key('CONFIG_VIRTIO_GPU') and pixman.found()
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
@@ -73,13 +73,15 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
-  virtio_gpu_gl_ss = ss.source_set()
-  virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
-                       if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
-  hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
+  if virgl.found() and opengl.found()
+    virtio_gpu_gl_ss = ss.source_set()
+    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
+                         if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
+    hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
+  endif
 endif
 
-if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
+if config_all_devices.has_key('CONFIG_VIRTIO_PCI') and pixman.found()
   virtio_gpu_pci_ss = ss.source_set()
   virtio_gpu_pci_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI'],
                         if_true: [files('virtio-gpu-pci.c'), pixman])
@@ -87,10 +89,12 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
                         if_true: files('vhost-user-gpu-pci.c'))
   hw_display_modules += {'virtio-gpu-pci': virtio_gpu_pci_ss}
 
-  virtio_gpu_pci_gl_ss = ss.source_set()
-  virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
-                           if_true: [files('virtio-gpu-pci-gl.c'), pixman])
-  hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
+  if virgl.found() and opengl.found()
+    virtio_gpu_pci_gl_ss = ss.source_set()
+    virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
+                             if_true: [files('virtio-gpu-pci-gl.c'), pixman])
+    hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
+  endif
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
-- 
2.38.1


