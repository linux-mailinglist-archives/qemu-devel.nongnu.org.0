Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36EE40EEC4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 03:31:54 +0200 (CEST)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR2jJ-0001Ua-Oi
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 21:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mR2go-0008TV-3q
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 21:29:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mR2gm-000273-8D
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 21:29:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75A2F20255;
 Fri, 17 Sep 2021 01:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631842154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRe8BotprcYmLgv2jEYrvMQEO2bkQ7SMvSpjBUVFwLo=;
 b=NaFVuy3vAAG3G399Jq8X1LGQ3uVuU2C67vbuw6laQqh1C6P4QXoso5l5a08tkc9s3EX/Uv
 hkSCICqwP2dABwKzBu6wdsLkTd4Nitk5kQ537Y3fClev2MikZ5E3n46DmtWCvWwPe6UEXu
 1c+AdtNr2HA7u539UMm1HGBT9zpVi2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631842154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRe8BotprcYmLgv2jEYrvMQEO2bkQ7SMvSpjBUVFwLo=;
 b=WQ2pv5g9mc4BicyM+p1x0Nv9r9os29jw4GFX1MTKmm0XIOyznpt/YZrP4ldpeARyc+MO4w
 tj1OmhQJXZ4QKFBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0013D13DEF;
 Fri, 17 Sep 2021 01:29:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mNImLWjvQ2GsFgAAMHmgww
 (envelope-from <jziviani@suse.de>); Fri, 17 Sep 2021 01:29:12 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: introduce modules_arch
Date: Thu, 16 Sep 2021 22:29:03 -0300
Message-Id: <20210917012904.26544-2-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917012904.26544-1-jziviani@suse.de>
References: <20210917012904.26544-1-jziviani@suse.de>
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

This variable keeps track of all modules enabled for a target
architecture. This will be used in modinfo to refine the
architectures that can really load the .so to avoid errors.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 hw/display/meson.build | 48 ++++++++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build     | 36 +++++++++++++++++++++++++++++++
 meson.build            |  1 +
 3 files changed, 85 insertions(+)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 861c43ff98..ba06f58ff1 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -43,6 +43,18 @@ if config_all_devices.has_key('CONFIG_QXL')
   qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
                                            pixman, spice])
   hw_display_modules += {'qxl': qxl_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_QXL') and cfg_target['CONFIG_QXL'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'qxl': archs}
 endif
 
 softmmu_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
@@ -65,6 +77,18 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
                        if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
   hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_VIRTIO_GPU') and cfg_target['CONFIG_VIRTIO_GPU'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'virtio-gpu': archs, 'virtio-gpu-gl': archs}
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
@@ -79,6 +103,18 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
   virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
                            if_true: [files('virtio-gpu-pci-gl.c'), pixman])
   hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_VIRTIO_PCI') and cfg_target['CONFIG_VIRTIO_PCI'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'virtio-gpu-pci': archs, 'virtio-gpu-pci-gl': archs}
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
@@ -93,6 +129,18 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
                        if_true: [files('virtio-vga-gl.c'), pixman])
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_VIRTIO_VGA') and cfg_target['CONFIG_VIRTIO_VGA'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'virtio-vga': archs, 'virtio-vga-gl': archs}
 endif
 
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index de853d780d..6b889d2ee2 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -54,6 +54,18 @@ if cacard.found()
   usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD',
                       if_true: [cacard, files('ccid-card-emulated.c', 'ccid-card-passthru.c')])
   hw_usb_modules += {'smartcard': usbsmartcard_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_USB_SMARTCARD') and cfg_target['CONFIG_USB_SMARTCARD'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'smartcard': archs}
 endif
 
 # U2F
@@ -69,6 +81,18 @@ if usbredir.found()
   usbredir_ss.add(when: 'CONFIG_USB',
                   if_true: [usbredir, files('redirect.c', 'quirks.c')])
   hw_usb_modules += {'redirect': usbredir_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_USB') and cfg_target['CONFIG_USB'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'redirect': archs}
 endif
 
 # usb pass-through
@@ -77,6 +101,18 @@ if libusb.found()
   usbhost_ss.add(when: ['CONFIG_USB', libusb],
                  if_true: files('host-libusb.c'))
   hw_usb_modules += {'host': usbhost_ss}
+
+  archs = []
+  foreach target: target_dirs
+    if target.endswith('-softmmu')
+      cfg_target = config_target_mak[target]
+      if cfg_target.has_key('CONFIG_USB') and cfg_target['CONFIG_USB'] == 'y'
+        archs += [cfg_target['TARGET_NAME']]
+      endif
+    endif
+  endforeach
+
+  modules_arch += {'host': archs}
 endif
 
 softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
diff --git a/meson.build b/meson.build
index 2711cbb789..d1d3fd84ec 100644
--- a/meson.build
+++ b/meson.build
@@ -2071,6 +2071,7 @@ tcg_module_ss = ss.source_set()
 
 modules = {}
 target_modules = {}
+modules_arch = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
-- 
2.33.0


