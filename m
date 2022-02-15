Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC694B67D7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:40:53 +0100 (CET)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuKK-00018e-Vd
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:40:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCJ-000425-IU
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:35 -0500
Received: from [2a00:1450:4864:20::62d] (port=42826
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCH-0008Qt-6p
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:35 -0500
Received: by mail-ej1-x62d.google.com with SMTP id hw13so14354374ejc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCDUNjf44S0gmQlhAow9hp61ImWk+aCFVeZk76vSUJQ=;
 b=bQCwlqJdhVz6P3Ul3gtWOKMUaGslDym33iRwLonoBhuMC4NV81ZCKZkDjSLHrFZ2PB
 RCuQA0kVpeTaqT6C5z+Aiy3g4iuL+jceMeP5tD8iBUEUx4kjNV7n6WqufTnB7bWgw4r2
 oXrWRHIXGyJmZbE0zuZXmgdxKwWlwZNQ+pknCe4BS5MS6PoGkoMN9cGwW1sZ1hJOlRmq
 BkYfEc5OhEPH/hPS/6ENGVgnrgJuNRMkrOrKDkPHZwZ97GTs4qgAHjJVFFQKUw2X7XmN
 itaBhEO6pySBQ/7ru4Wgmk/5PHGeMSBswMVE4Lt+y5kr+ndlGyk/NnmHuJm475CLin8L
 Jxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iCDUNjf44S0gmQlhAow9hp61ImWk+aCFVeZk76vSUJQ=;
 b=VvRi34asSNkv1bzeGK7dbYwP328oDM73QQ+TmkuCWCJTtadPn1xAqvrZgxOUx3XQm8
 M7m7aTX+d0gvVWbmET41lq/xk14ebfHCh9v52B1yyKct2NMZU19DRIaUdWFwLC9uy76U
 kaqy0aKUpO1xw7WCCuWPGku2txqqkair6M2/8U9/ow2iJJkYpru7s6iWgrZ4woBbJIOR
 LZDGhnWdTo46aprwC/2YxoFpZU8F6OVjSnXFfDlQ0YcYX+GR7FM6tJ+Q8fbc0mA+LIxY
 BgvtZs/a2yPNpg6Cp82pCfbud8hYkbj/WdYpioNqhPfKeABFDNLppnVqkxl2boiVdukh
 8g8g==
X-Gm-Message-State: AOAM532R/roG1DFMFqxJh2S/Fh42nacDM43Hi70CYX18qzlrPry2kVlA
 Y0Jl9HDcKWSd2+kv1DG1G0pz4tAgcrg=
X-Google-Smtp-Source: ABdhPJzHqmgyUf23n5SRSTOecJElrwBAzQFDgwkyQptZR6WVRQU09n5STqTns57I+mUdRo1qKqFAKg==
X-Received: by 2002:a17:906:7a09:: with SMTP id
 d9mr2140163ejo.103.1644917552001; 
 Tue, 15 Feb 2022 01:32:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] configure, meson: move TPM check to meson
Date: Tue, 15 Feb 2022 10:32:03 +0100
Message-Id: <20220215093223.110827-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index f536f53106..54eb954296 100755
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
@@ -1378,7 +1373,6 @@ cat << EOF
   vhost-vdpa      vhost-vdpa kernel backend support
   live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
-  tpm             TPM support
   replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
@@ -2395,21 +2389,6 @@ if test "$modules" = yes; then
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
 
@@ -3274,10 +3253,6 @@ if test "$live_block_migration" = "yes" ; then
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
index f5b22983bb..8bea2e6933 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -25,7 +25,9 @@ acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
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
index f8b83f64db..02137be91e 100644
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
@@ -3556,7 +3561,7 @@ if targetos == 'windows'
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
index d46d7181e7..3f107e5724 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -86,6 +86,7 @@ meson_options_help() {
   printf "%s\n" '  spice           Spice server support'
   printf "%s\n" '  spice-protocol  Spice protocol support'
   printf "%s\n" '  tcg             TCG support'
+  printf "%s\n" '  tpm             TPM support'
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
@@ -256,6 +257,8 @@ _meson_option_parse() {
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



