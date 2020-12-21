Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62182DFD10
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:53:32 +0100 (CET)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMZ1-0005PP-QM
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQi-0004iK-0e
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:56 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQf-0007ct-4y
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id m5so11277937wrx.9
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIdRuqNwJxUCNTtBWW3hlZRf3HEfcDV9b7k9felS6Q0=;
 b=sn20pyxPSZu4hBjOh/AYbZrRSZe0VJRFxd/MWd9Y1XBQSAj8YPOUOxIm4oW/eWwuxC
 iHW5FCbwQtom0TUhenpM1LMKL6FJR9isCdFkOSZHqJc2/K+/OApifRfTo6Tv8x61T3U3
 6b4X/FT4UZK+AoHkWXPwc0m995n3c+ZBTAUXz5vM+8wV+g9kvrMG6gMHBjwP9PbJ3V8r
 ygXH3K+Pp1fsvgsFwVUC4Cka7ODDxV0WuVn6sL46SPuTT4aFI0zlkrTERQ2KgTWRQ4gD
 fW+S7uefKove0dDgPwt5PkI/LEz8Ige+TfIOUSQ88cHLeindXXoIpUHMuKGuORUQXwXk
 ZZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vIdRuqNwJxUCNTtBWW3hlZRf3HEfcDV9b7k9felS6Q0=;
 b=GkkL/SJpp61WHHGCbGQZkY/k3nDupO8+5/mjOuMlX6bznJmyuXF2UCh/OCWdklSARM
 ZUqMTKAA2zMqAsvvSjf7ya/aR5AuZOGcHvDoCCCDIidovQ+tm3UVjJmOr5M3nAmOHErH
 mSqptKi7F7xoj4YseedXQstawB1uFuR96XqEt2MiNuJEYHDEEwiaKpMaR+bt8SQCP/EZ
 SQYhXxJPGKWE+Vbd3oR8H57LWqBMLxCs5vUtQQeH1y9nHbV+ZZjcjAuRC7+ZxG0Vn2FG
 APG2LQy606N527rgL9UJ0T0NERs1MfOg0Jfq3XOrRJorrEwL752gvEbfqJ/pCXTNnNmQ
 5sdA==
X-Gm-Message-State: AOAM532S3ubQX0acU9kj1M9Gysz5DN0S/srZB7dK2cOG/nF8P0D0F+Z9
 0GnQi09Mw+nAwmo8f/1OW9y1b+CeCUs=
X-Google-Smtp-Source: ABdhPJx+6F406V0zzTNKGXS82Dw7k7eVOR/Cw4avUjyrgHci9K0DZCe9bnxiPVVEgx99A4nwaTxCrA==
X-Received: by 2002:adf:c64f:: with SMTP id u15mr17132921wrg.270.1608561891800; 
 Mon, 21 Dec 2020 06:44:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/55] configure: add --without-default-features
Date: Mon, 21 Dec 2020 15:43:55 +0100
Message-Id: <20201221144447.26161-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

By default QEMU enables a lot of features if it can probe and find the
support libraries. It also enables a bunch of features by default.
This patch adds the ability to build --without-default-features which
can be paired with a --without-default-devices for a barely functional
build.

The main use case for this is testing our build assumptions and for
minimising the amount of stuff you build if you just want to test a
particular feature on your relatively slow emulated test system. On
it's own I go from:

  $ ls -lh qemu-system-aarch64
  -rwxr-xr-x 1 alex alex 120M Dec 10 12:45 qemu-system-aarch64*
  $ ldd qemu-system-aarch64 | wc -l
  170

to:

  $ ls -lh qemu-aarch64
  -rwxr-xr-x 1 alex alex 43M Dec 10 12:41 qemu-aarch64*
  $ ldd qemu-system-aarch64 | wc -l
  57

which is still able to run my default Debian ARM64 machine with a lot
less fat involved.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201210190417.31673-5-alex.bennee@linaro.org>
---
 configure | 155 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 85 insertions(+), 70 deletions(-)

diff --git a/configure b/configure
index 134f5de5ab..a5ee2d2a06 100755
--- a/configure
+++ b/configure
@@ -293,8 +293,19 @@ unset target_list_exclude
 # Distributions want to ensure that several features are compiled in, and it
 # is impossible without a --enable-foo that exits if a feature is not found.
 
-brlapi=""
-curl=""
+default_feature=""
+# parse CC options second
+for opt do
+  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
+  case "$opt" in
+      --without-default-features)
+          default_feature="no"
+  ;;
+  esac
+done
+
+brlapi="$default_feature"
+curl="$default_feature"
 iconv="auto"
 curses="auto"
 docs="auto"
@@ -303,52 +314,52 @@ netmap="no"
 sdl="auto"
 sdl_image="auto"
 virtiofsd="auto"
-virtfs=""
+virtfs="$default_feature"
 libudev="auto"
 mpath="auto"
 vnc="enabled"
 sparse="auto"
-vde=""
+vde="$default_feature"
 vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
 xkbcommon="auto"
-xen=""
-xen_ctrl_version=""
+xen="$default_feature"
+xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
-linux_aio=""
-linux_io_uring=""
-cap_ng=""
-attr=""
-libattr=""
-xfs=""
+linux_aio="$default_feature"
+linux_io_uring="$default_feature"
+cap_ng="$default_feature"
+attr="$default_feature"
+libattr="$default_feature"
+xfs="$default_feature"
 tcg="enabled"
-membarrier=""
-vhost_net=""
-vhost_crypto=""
-vhost_scsi=""
-vhost_vsock=""
+membarrier="$default_feature"
+vhost_net="$default_feature"
+vhost_crypto="$default_feature"
+vhost_scsi="$default_feature"
+vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_blk_server="auto"
-vhost_user_fs=""
+vhost_user_fs="$default_feature"
 kvm="auto"
 hax="auto"
 hvf="auto"
 whpx="auto"
-rdma=""
-pvrdma=""
+rdma="$default_feature"
+pvrdma="$default_feature"
 gprof="no"
 debug_tcg="no"
 debug="no"
 sanitizers="no"
 tsan="no"
-fortify_source=""
+fortify_source="$default_feature"
 strip_opt="yes"
 tcg_interpreter="no"
 bigendian="no"
 mingw32="no"
 gcov="no"
-EXESUF=""
+EXESUF="$default_feature"
 HOST_DSOSUF=".so"
 modules="no"
 module_upgrades="no"
@@ -370,81 +381,81 @@ pie=""
 qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
-spice=""
-rbd=""
-smartcard=""
+spice="$default_feature"
+rbd="$default_feature"
+smartcard="$default_feature"
 u2f="auto"
-libusb=""
-usb_redir=""
-opengl=""
+libusb="$default_feature"
+usb_redir="$default_feature"
+opengl="$default_feature"
 opengl_dmabuf="no"
 cpuid_h="no"
-avx2_opt=""
+avx2_opt="$default_feature"
 capstone="auto"
-lzo=""
-snappy=""
-bzip2=""
-lzfse=""
-zstd=""
-guest_agent=""
+lzo="$default_feature"
+snappy="$default_feature"
+bzip2="$default_feature"
+lzfse="$default_feature"
+zstd="$default_feature"
+guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
-guest_agent_msi=""
-vss_win32_sdk=""
+guest_agent_msi="$default_feature"
+vss_win32_sdk="$default_feature"
 win_sdk="no"
-want_tools=""
-libiscsi=""
-libnfs=""
+want_tools="$default_feature"
+libiscsi="$default_feature"
+libnfs="$default_feature"
 coroutine=""
-coroutine_pool=""
+coroutine_pool="$default_feature"
 debug_stack_usage="no"
 crypto_afalg="no"
-seccomp=""
-glusterfs=""
+seccomp="$default_feature"
+glusterfs="$default_feature"
 glusterfs_xlator_opt="no"
 glusterfs_discard="no"
 glusterfs_fallocate="no"
 glusterfs_zerofill="no"
 glusterfs_ftruncate_has_stat="no"
 glusterfs_iocb_has_stat="no"
-gtk=""
+gtk="$default_feature"
 gtk_gl="no"
 tls_priority="NORMAL"
-gnutls=""
-nettle=""
+gnutls="$default_feature"
+nettle="$default_feature"
 nettle_xts="no"
-gcrypt=""
+gcrypt="$default_feature"
 gcrypt_hmac="no"
 gcrypt_xts="no"
 qemu_private_xts="yes"
-auth_pam=""
-vte=""
-virglrenderer=""
-tpm=""
-libssh=""
-live_block_migration="yes"
-numa=""
+auth_pam="$default_feature"
+vte="$default_feature"
+virglrenderer="$default_feature"
+tpm="$default_feature"
+libssh="$default_feature"
+live_block_migration=${default_feature:-yes}
+numa="$default_feature"
 tcmalloc="no"
 jemalloc="no"
-replication="yes"
-bochs="yes"
-cloop="yes"
-dmg="yes"
-qcow1="yes"
-vdi="yes"
-vvfat="yes"
-qed="yes"
-parallels="yes"
+replication=${default_feature:-yes}
+bochs=${default_feature:-yes}
+cloop=${default_feature:-yes}
+dmg=${default_feature:-yes}
+qcow1=${default_feature:-yes}
+vdi=${default_feature:-yes}
+vvfat=${default_feature:-yes}
+qed=${default_feature:-yes}
+parallels=${default_feature:-yes}
 sheepdog="no"
-libxml2=""
+libxml2="$default_feature"
 debug_mutex="no"
-libpmem=""
+libpmem="$default_feature"
 default_devices="yes"
 plugins="no"
 fuzzing="no"
 rng_none="no"
-secret_keyring=""
-libdaxctl=""
+secret_keyring="$default_feature"
+libdaxctl="$default_feature"
 meson=""
 ninja=""
 skip_meson=no
@@ -455,7 +466,7 @@ fuse_lseek="auto"
 bogus_os="no"
 malloc_trim="auto"
 
-# parse CC options first
+# parse CC options second
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -798,7 +809,7 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
-  vhost_user="yes"
+  vhost_user=${default_feature:-yes}
 ;;
 esac
 
@@ -942,6 +953,8 @@ for opt do
   ;;
   --without-default-devices) default_devices="no"
   ;;
+  --without-default-features) # processed above
+  ;;
   --enable-gprof) gprof="yes"
   ;;
   --enable-gcov) gcov="yes"
@@ -1747,7 +1760,8 @@ Advanced options (experts only):
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
 
 Optional features, enabled with --enable-FEATURE and
-disabled with --disable-FEATURE, default is enabled if available:
+disabled with --disable-FEATURE, default is enabled if available
+(unless built with --without-default-features):
 
   system          all system emulation targets
   user            supported user emulation targets
@@ -6957,6 +6971,7 @@ NINJA=$ninja $meson setup \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
+        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.29.2



