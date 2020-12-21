Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB92DFD23
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:01:53 +0100 (CET)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMh6-0007jY-Jr
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRH-0004rk-7A
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007mE-T4
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id e25so11195424wme.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dooPjFN1B8tfi4MCbVcoop9IWaOfHRSgoH9hXmEYAc=;
 b=Mrm6b4Tlw3FOQNyP41JtEUpH2bXLZC6fHeg74yd9HqpaUVVXq+9abJmeHssfO1xBRM
 bxKQgohvJpcRAJq9SOhEeJ6xDu0dAhncMqBUfrG5Dk7dXbSR5saTRhm8N0sDOfTxGqVD
 Qzq+DMwDGwX3F208ea//apTx2JDPERpkM2XZePbtF49/Kr9KHOXpSz8n3p+h3b3fSJQ0
 nLXntkA8SRdLMUrhnsFrRFyh90mKVLBnw+Vbd6nEvsA7LJOFBKw/H2OBPkOfxSDucJ4m
 5//v7C/nfrp8GYToPQcV3plDwFMmTs251lrkpqF4ukOZVGtGTRKGeqqns+ru/mVrFeXN
 /wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6dooPjFN1B8tfi4MCbVcoop9IWaOfHRSgoH9hXmEYAc=;
 b=P4swmPoFG9K+cUBuYb/7IfkHt0tC+cKpDk9a6Mce9UXjFJcvacUysLj6ZxflO3U7Qc
 IStPR5J0DX/6XriZKyFxd86/nswgCr0GMNtBuuGeyRXD6ftocbAH5C94ZiG5Hb1YNpeP
 EsK6uiJa8BydOnRUvI+7U3kvkWYrwicsoiWxOmWKvT+NOOYspjVcswyoKChhcHzYDeh3
 NAoV6uWB0yU0wRbHiRRLD7mru1ChyIkhNSWvPsBRwIH9Mm+MYs9g2gv+iqR/12nVLp9x
 U/xmtKylMGnX0aNmy90qKrDZEZdIClmysSW0SSrMKlSKhNpAeAKk+91B+xH0YCU3vHSz
 +B3A==
X-Gm-Message-State: AOAM532GR7hnT17c7G43Ods7U9DLJda3yjUpQrmvJPpwQrNtZCBtYK1P
 59ozc/VcMRgRgarl0IeD2p83coceuu8=
X-Google-Smtp-Source: ABdhPJxLxn6kbI/IPk+Xx0gwDc6aoW6EjkMgyywa9LBZFgROMK9aBczPTz+E47aRHwq/97DUZrBK9Q==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr17305575wmg.168.1608561916381; 
 Mon, 21 Dec 2020 06:45:16 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/55] meson: cleanup Kconfig.host handling
Date: Mon, 21 Dec 2020 15:44:23 +0100
Message-Id: <20201221144447.26161-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the array of command line arguments coming from config_host
once for all targets.  Add all accelerators to accel/Kconfig so
that the command line arguments for accelerators can be computed
easily in the existing "foreach sym: accelerators" loop.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/Kconfig          |  9 +++++++++
 docs/devel/kconfig.rst | 19 +++++++++----------
 meson.build            | 43 +++++++++++++++++-------------------------
 3 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 2ad94a3839..461104c771 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,3 +1,12 @@
+config WHPX
+    bool
+
+config HAX
+    bool
+
+config HVF
+    bool
+
 config TCG
     bool
 
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index 336ba0e8e5..cb2d7ffac0 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -288,21 +288,20 @@ they will include all these symbols and some help text on what they do.
 ----------------
 
 In some special cases, a configurable element depends on host features
-that are detected by QEMU's configure script; for example some devices
-depend on the availability of KVM or on the presence of a library on
-the host.
+that are detected by QEMU's configure or ``meson.build`` scripts; for
+example some devices depend on the availability of KVM or on the presence
+of a library on the host.
 
 These symbols should be listed in ``Kconfig.host`` like this::
 
-    config KVM
+    config TPM
       bool
 
-and also listed as follows in the top-level Makefile's ``MINIKCONF_ARGS``
+and also listed as follows in the top-level meson.build's host_kconfig
 variable::
 
-    MINIKCONF_ARGS = \
-      $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
-      CONFIG_KVM=$(CONFIG_KVM) \
-      CONFIG_SPICE=$(CONFIG_SPICE) \
-      CONFIG_TPM=$(CONFIG_TPM) \
+    host_kconfig = \
+      ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
+      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
+      ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/meson.build b/meson.build
index 45155114d3..3e584499bc 100644
--- a/meson.build
+++ b/meson.build
@@ -954,21 +954,19 @@ if link_language == 'cpp'
   }
 endif
 
-kconfig_external_symbols = [
-  'CONFIG_KVM',
-  'CONFIG_XEN',
-  'CONFIG_TPM',
-  'CONFIG_SPICE',
-  'CONFIG_IVSHMEM',
-  'CONFIG_OPENGL',
-  'CONFIG_X11',
-  'CONFIG_VHOST_USER',
-  'CONFIG_VHOST_VDPA',
-  'CONFIG_VHOST_KERNEL',
-  'CONFIG_VIRTFS',
-  'CONFIG_LINUX',
-  'CONFIG_PVRDMA',
-]
+host_kconfig = \
+  ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
+  ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
+  ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+  ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
+  ('CONFIG_X11' in config_host ? ['CONFIG_X11=y'] : []) + \
+  ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
+  ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
+  ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
+  ('CONFIG_VIRTFS' in config_host ? ['CONFIG_VIRTFS=y'] : []) + \
+  ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
+  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : [])
+
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
 default_targets = 'CONFIG_DEFAULT_TARGETS' in config_host
@@ -1003,7 +1001,7 @@ foreach target : target_dirs
     }
   endif
 
-  have_accel = false
+  accel_kconfig = []
   foreach sym: accelerators
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
       config_target += { sym: 'y' }
@@ -1011,10 +1009,10 @@ foreach target : target_dirs
       if sym == 'CONFIG_XEN' and have_xen_pci_passthrough
         config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
-      have_accel = true
+      accel_kconfig += [ sym + '=y' ]
     endif
   endforeach
-  if not have_accel
+  if accel_kconfig.length() == 0
     if default_targets
       continue
     endif
@@ -1068,13 +1066,6 @@ foreach target : target_dirs
                                                configuration: config_target_data)}
 
   if target.endswith('-softmmu')
-    base_kconfig = []
-    foreach sym : kconfig_external_symbols
-      if sym in config_target or sym in config_host
-        base_kconfig += '@0@=y'.format(sym)
-      endif
-    endforeach
-
     config_devices_mak = target + '-config-devices.mak'
     config_devices_mak = configure_file(
       input: ['default-configs/devices' / target + '.mak', 'Kconfig'],
@@ -1083,7 +1074,7 @@ foreach target : target_dirs
       capture: true,
       command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
                 config_devices_mak, '@DEPFILE@', '@INPUT@',
-                base_kconfig])
+                host_kconfig, accel_kconfig])
 
     config_devices_data = configuration_data()
     config_devices = keyval.load(config_devices_mak)
-- 
2.29.2



