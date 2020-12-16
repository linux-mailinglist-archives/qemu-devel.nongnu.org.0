Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F6C2DC41C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:27:46 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZeS-0002iI-Vw
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXH-0002FA-5h
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXE-0006Wl-Sl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:18 -0500
Received: by mail-ej1-x62e.google.com with SMTP id g20so33598917ejb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8na5XyV6Q3dO/cfg5nIyrTRUkt6ipTXcWtK/AtR680=;
 b=VnvO7UuDL2nvdSShLU5k4JSjoaFR8kopUyVVS+NgWcq99IyjLopjbMe+39M3HNUbUB
 TsXGAguPvk9MwKj/NGTIYTtPyElYVNhZFWQQdqbCzowL6J7r5wKeX7a5we/ESlJbBMyt
 9lFACZ86lGQY76T2vVVECIpd8i5HD2eACqiCDEnqNIuirPocjj5GVO5mxb0OO7sFb0xU
 dy9F9/oQYpVmcDgQthzaKYYRoAPizsLj+zibw+103lqR8+Vnz/UyJc+tsuwqheZkfTBb
 dqOgsrp22DjxmEe0WT9p11TpkZy6aLw3B7dVgMY21/qOh7zoCpE8MZIXppSaAPrZgvp+
 VSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u8na5XyV6Q3dO/cfg5nIyrTRUkt6ipTXcWtK/AtR680=;
 b=TOwotLBuFU92tHR2b0IM+ttOJesADfXUUDgr4NJQBo9z7eB7rkVSO2HwnqpFczD31u
 2SpFRZZVQzEGIEtphBQ5ZuOCmpTA8luE0LchvNk+DxK/7X1T8ueRjR0Olv9I4HBw1pKF
 627dEEDXqEAn7ErEOpSmPtJNlOJH/MBe05UgyLWDXR3jTipHSegIpb0vSbckNl22/YqW
 UTMR4pzmCkpDUUfR2ehJitN7ikjJ+n3FhywaE8zO8kEpG4dLd2api0ushDgvUxKRRZy2
 DdVAP9n9Sr9K5+zmaIdsCJl8Ods+Y1fER3ttnqmfRPSCQjHaQKM5nucF+kUw2OCn0Pjl
 RdQg==
X-Gm-Message-State: AOAM530jALDrHvk0hJ2yzTOzU8S4tCrwqkOBS6D2foXEr+PStrEIVXwD
 fkG1rt+BMVHWeP/nr2SfN+i+x3h1xt8=
X-Google-Smtp-Source: ABdhPJxwLirO85e6iC9561YM3In4FljNT0xRq7rP/Wnf7a/Scp4NeiUNjK+ZOSYBJU0YMqyt5A+rrA==
X-Received: by 2002:a17:907:700c:: with SMTP id
 wr12mr30857229ejb.398.1608135615135; 
 Wed, 16 Dec 2020 08:20:15 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] meson: cleanup Kconfig.host handling
Date: Wed, 16 Dec 2020 17:20:06 +0100
Message-Id: <20201216162006.433850-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the array of command line arguments coming from config_host
once for all targets.  Add all accelerators to accel/Kconfig so
that the command line arguments for accelerators can be computed
easily in the existing "foreach sym: accelerators" loop.

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
index 0b36fb38f1..bb198f792a 100644
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


