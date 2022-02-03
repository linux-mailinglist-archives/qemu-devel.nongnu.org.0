Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11174A8A99
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:48:27 +0100 (CET)
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgDa-0002kV-O7
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:48:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzm-0004qg-A4
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:10 -0500
Received: from [2a00:1450:4864:20::62c] (port=36658
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzj-0008Fd-T9
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:10 -0500
Received: by mail-ej1-x62c.google.com with SMTP id s13so11054143ejy.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=im8PSycb8+9PT0p7rB532pHpabiajNULghi9j1RLlHM=;
 b=lfRjFtShOhHxnxZOR3k/0BFOjAhiAA/39lHczqhuMx27tfmU1u3wqw3vPBXjfrRm+n
 6KnW3izYzjdtlLwHHTrL6EgFQeSKaQANyJZjDo4kDmAq8Im3WClaFswwSn7oXEmKgLFS
 rEfqE8eXIO2O4WgYjMCLiHJgmLR4VpWsDgnA9Be2cbZnN2W9/6J7wJF+q8EipXrAvCoG
 35eD8gkSOqqZk5tR+mBn09ik03rJ/BpicKsIDQY2S0dT14TaU+2gV23P2SoZVpE0f/td
 +d009YjXxwX+2HBwIAhe9F10xQCFpXla0q7pwkgY9b0lQgUU3wysLA2Je9AhrbtW/9Fo
 4tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=im8PSycb8+9PT0p7rB532pHpabiajNULghi9j1RLlHM=;
 b=wHjpkRRdhLHKaazYLEjDs3GX4czsUufjRjlhjjdqq3W45gBKMBafURPz79ZVN9rFUn
 H93pGGw+J83tJxLYKIOclYQAPS/yTBufNXB5RQBdi/W0q1G3ytecY0+wtvP3HYgmZiO3
 4jYoBAQ3XAUb2mlw2LTMhh6y1wsilEKZpwH3TIxkYUamrZEnXF4KjNC7iZnbKmTDUa7L
 k0vncDt3fcU29JHAycUVPd6oVEpFZYB72bNG/PZIC5UUDI13kpAt7WgC50cOReNWaqGe
 G/vFxkTWNvkpTsr0wLs6AGBDjowRf09QgzSjIZ8FH9vwI/+cep0uydyIlFsxKSwT2TXe
 PsZQ==
X-Gm-Message-State: AOAM531Yxfj4jBUdsWh8vW01gM4i8mUqgJ0C1wszUKSLTA07o1Clyy43
 N1F4qm4EmGMjJwLhRypZ4uGMNTooT+4=
X-Google-Smtp-Source: ABdhPJxhdaEK+p1PwVcX6JCO/HaEBJRK6t3/zBhczS2ywYK5CdpCoVMqRMAp6KfPFCsndjn88py86A==
X-Received: by 2002:a17:907:94c6:: with SMTP id
 dn6mr24434339ejc.425.1643909646314; 
 Thu, 03 Feb 2022 09:34:06 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/27] configure, meson: move TPM check to meson
Date: Thu,  3 Feb 2022 18:33:39 +0100
Message-Id: <20220203173359.292068-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check is simply for a POSIX system.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/tpm/meson.build      | 14 ++++++--------
 configure                     | 25 -------------------------
 docs/devel/kconfig.rst        |  2 +-
 hw/acpi/meson.build           |  4 +++-
 meson.build                   |  9 +++++++--
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 softmmu/meson.build           |  5 ++++-
 8 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/backends/tpm/meson.build b/backends/tpm/meson.build
index 857929082e..7f2503f84e 100644
--- a/backends/tpm/meson.build
+++ b/backends/tpm/meson.build
@@ -1,8 +1,6 @@
-tpm_ss = ss.source_set()
-
-tpm_ss.add(files('tpm_backend.c'))
-tpm_ss.add(files('tpm_util.c'))
-tpm_ss.add(when: 'CONFIG_TPM_PASSTHROUGH', if_true: files('tpm_passthrough.c'))
-tpm_ss.add(when: 'CONFIG_TPM_EMULATOR', if_true: files('tpm_emulator.c'))
-
-softmmu_ss.add_all(when: 'CONFIG_TPM', if_true: tpm_ss)
+if have_tpm
+  softmmu_ss.add(files('tpm_backend.c'))
+  softmmu_ss.add(files('tpm_util.c'))
+  softmmu_ss.add(when: 'CONFIG_TPM_PASSTHROUGH', if_true: files('tpm_passthrough.c'))
+  softmmu_ss.add(when: 'CONFIG_TPM_EMULATOR', if_true: files('tpm_emulator.c'))
+endif
diff --git a/configure b/configure
index afb6e8744a..10cff5df1f 100755
--- a/configure
+++ b/configure
@@ -330,7 +330,6 @@ coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
 tls_priority="NORMAL"
-tpm="$default_feature"
 live_block_migration=${default_feature:-yes}
 replication=${default_feature:-yes}
 bochs=${default_feature:-yes}
@@ -1039,10 +1038,6 @@ for opt do
   ;;
   --disable-pvrdma) pvrdma="no"
   ;;
-  --disable-tpm) tpm="no"
-  ;;
-  --enable-tpm) tpm="yes"
-  ;;
   --disable-live-block-migration) live_block_migration="no"
   ;;
   --enable-live-block-migration) live_block_migration="yes"
@@ -1392,7 +1387,6 @@ cat << EOF
   vhost-vdpa      vhost-vdpa kernel backend support
   live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
-  tpm             TPM support
   replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
@@ -2416,21 +2410,6 @@ if test "$modules" = yes; then
     fi
 fi
 
-##########################################
-# TPM emulation is only on POSIX
-
-if test "$tpm" = ""; then
-  if test "$mingw32" = "yes"; then
-    tpm=no
-  else
-    tpm=yes
-  fi
-elif test "$tpm" = "yes"; then
-  if test "$mingw32" = "yes" ; then
-    error_exit "TPM emulation only available on POSIX systems"
-  fi
-fi
-
 ##########################################
 # fdt probe
 
@@ -3295,10 +3274,6 @@ if test "$live_block_migration" = "yes" ; then
   echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
 fi
 
-if test "$tpm" = "yes"; then
-  echo 'CONFIG_TPM=y' >> $config_host_mak
-fi
-
 if test "$rdma" = "yes" ; then
   echo "CONFIG_RDMA=y" >> $config_host_mak
   echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index a1cdbec751..d6b55a6fe0 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -301,7 +301,7 @@ and also listed as follows in the top-level meson.build's host_kconfig
 variable::
 
     host_kconfig = \
-      ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
+      (have_tpm ? ['CONFIG_TPM=y'] : []) + \
       ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
       (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index adf6347bc4..e805ecc937 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -24,7 +24,9 @@ acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
+if have_tpm
+  acpi_ss.add(files('tpm.c'))
+endif
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
diff --git a/meson.build b/meson.build
index cfb02f31ca..9584587462 100644
--- a/meson.build
+++ b/meson.build
@@ -276,6 +276,10 @@ multiprocess_allowed = get_option('multiprocess') \
   .require(targetos == 'linux', error_message: 'Multiprocess QEMU is supported only on Linux') \
   .allowed()
 
+have_tpm = get_option('tpm') \
+  .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
+  .allowed()
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -1492,6 +1496,7 @@ config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
+config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -1942,7 +1947,7 @@ endif
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   (get_option('fuzzing') ? ['CONFIG_FUZZ=y'] : []) + \
-  ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
+  (have_tpm ? ['CONFIG_TPM=y'] : []) + \
   (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
@@ -3560,7 +3565,7 @@ if targetos == 'windows'
 endif
 summary_info += {'seccomp support':   seccomp}
 summary_info += {'GlusterFS support': glusterfs}
-summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
+summary_info += {'TPM support':       have_tpm}
 summary_info += {'libssh support':    libssh}
 summary_info += {'lzo support':       lzo}
 summary_info += {'snappy support':    snappy}
diff --git a/meson_options.txt b/meson_options.txt
index bb443023b5..1b44b4e666 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -68,6 +68,8 @@ option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
+option('tpm', type : 'feature', value : 'auto',
+       description: 'TPM support')
 
 # Do not enable it by default even for Mingw32, because it doesn't
 # work on Wine.
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 855c8df754..e040fa1501 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -87,6 +87,7 @@ meson_options_help() {
   printf "%s\n" '  spice           Spice server support'
   printf "%s\n" '  spice-protocol  Spice protocol support'
   printf "%s\n" '  tcg             TCG support'
+  printf "%s\n" '  tpm             TPM support'
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
@@ -259,6 +260,8 @@ _meson_option_parse() {
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
     --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
+    --enable-tpm) printf "%s" -Dtpm=enabled ;;
+    --disable-tpm) printf "%s" -Dtpm=disabled ;;
     --enable-trace-backends=*) quote_sh "-Dtrace_backends=$2" ;;
     --enable-u2f) printf "%s" -Du2f=enabled ;;
     --disable-u2f) printf "%s" -Du2f=disabled ;;
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018ab..39f766ce7c 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -27,6 +27,9 @@ softmmu_ss.add(files(
   'qdev-monitor.c',
 ), sdl, libpmem, libdaxctl)
 
-softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
+if have_tpm
+  softmmu_ss.add(files('tpm.c'))
+endif
+
 softmmu_ss.add(when: seccomp, if_true: files('qemu-seccomp.c'))
 softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
-- 
2.34.1



