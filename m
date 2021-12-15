Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680DA4753DE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:46:37 +0100 (CET)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOzk-00058j-Ee
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnw-00039G-NB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnv-0004Ik-0m
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z48alLw/im+ochSlr+Mo16B/ARMNqNw59dEjukANF7w=;
 b=hKylKGdRMPby3b0NCP5GV329iwmrjk0GGj35tQjOj9+ONdcF8aKbvr1ayGVgxAUrohoiSS
 SW3T3pbwXf2j1cvZs0AvD091uO2oHfZ/r/cFxxZih8Zbt+ekaV0VhDcoD8d9Drp75uVK9r
 rdCm3uxBCYj/BSU6faRxvxHGF9HIvt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296--XnwA5wzNuuSJepgcZwnNg-1; Wed, 15 Dec 2021 02:34:20 -0500
X-MC-Unique: -XnwA5wzNuuSJepgcZwnNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3CA2F45;
 Wed, 15 Dec 2021 07:34:19 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EE721092790;
 Wed, 15 Dec 2021 07:34:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] Move the libssh setup from configure to meson.build
Date: Wed, 15 Dec 2021 08:33:55 +0100
Message-Id: <20211215073402.144286-10-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's easier to do this in meson.build now.

Message-Id: <20211209144801.148388-1-thuth@redhat.com>
Acked-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                     | 27 ---------------------------
 meson.build                   | 13 +++++++++----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 48c21775f3..bb99a40ed0 100755
--- a/configure
+++ b/configure
@@ -344,7 +344,6 @@ debug_stack_usage="no"
 crypto_afalg="no"
 tls_priority="NORMAL"
 tpm="$default_feature"
-libssh="$default_feature"
 live_block_migration=${default_feature:-yes}
 numa="$default_feature"
 replication=${default_feature:-yes}
@@ -1078,10 +1077,6 @@ for opt do
   ;;
   --enable-tpm) tpm="yes"
   ;;
-  --disable-libssh) libssh="no"
-  ;;
-  --enable-libssh) libssh="yes"
-  ;;
   --disable-live-block-migration) live_block_migration="no"
   ;;
   --enable-live-block-migration) live_block_migration="yes"
@@ -1448,7 +1443,6 @@ cat << EOF
   live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
   tpm             TPM support
-  libssh          ssh block device support
   numa            libnuma support
   avx2            AVX2 optimization support
   avx512f         AVX512F optimization support
@@ -2561,21 +2555,6 @@ if test "$modules" = yes; then
     fi
 fi
 
-##########################################
-# libssh probe
-if test "$libssh" != "no" ; then
-  if $pkg_config --exists "libssh >= 0.8.7"; then
-    libssh_cflags=$($pkg_config libssh --cflags)
-    libssh_libs=$($pkg_config libssh --libs)
-    libssh=yes
-  else
-    if test "$libssh" = "yes" ; then
-      error_exit "libssh required for --enable-libssh"
-    fi
-    libssh=no
-  fi
-fi
-
 ##########################################
 # TPM emulation is only on POSIX
 
@@ -3636,12 +3615,6 @@ if test "$cmpxchg128" = "yes" ; then
   echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
 fi
 
-if test "$libssh" = "yes" ; then
-  echo "CONFIG_LIBSSH=y" >> $config_host_mak
-  echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
-  echo "LIBSSH_LIBS=$libssh_libs" >> $config_host_mak
-fi
-
 if test "$live_block_migration" = "yes" ; then
   echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 96de1a6ef9..ae67ca28ab 100644
--- a/meson.build
+++ b/meson.build
@@ -874,11 +874,15 @@ if not get_option('glusterfs').auto() or have_block
     ''', dependencies: glusterfs)
   endif
 endif
+
 libssh = not_found
-if 'CONFIG_LIBSSH' in config_host
-  libssh = declare_dependency(compile_args: config_host['LIBSSH_CFLAGS'].split(),
-                              link_args: config_host['LIBSSH_LIBS'].split())
+if not get_option('libssh').auto() or have_block
+  libssh = dependency('libssh', version: '>=0.8.7',
+                    method: 'pkg-config',
+                    required: get_option('libssh'),
+                    kwargs: static_kwargs)
 endif
+
 libbzip2 = not_found
 if not get_option('bzip2').auto() or have_block
   libbzip2 = cc.find_library('bz2', has_headers: ['bzlib.h'],
@@ -1451,6 +1455,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
 config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
+config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
@@ -3430,7 +3435,7 @@ endif
 summary_info += {'seccomp support':   seccomp}
 summary_info += {'GlusterFS support': glusterfs}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
-summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
+summary_info += {'libssh support':    libssh}
 summary_info += {'lzo support':       lzo}
 summary_info += {'snappy support':    snappy}
 summary_info += {'bzip2 support':     libbzip2}
diff --git a/meson_options.txt b/meson_options.txt
index e392323732..4114bfcaa4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -105,6 +105,8 @@ option('libdaxctl', type : 'feature', value : 'auto',
        description: 'libdaxctl support')
 option('libpmem', type : 'feature', value : 'auto',
        description: 'libpmem support')
+option('libssh', type : 'feature', value : 'auto',
+       description: 'ssh block device support')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 7a17ff4218..ae8f18edc2 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -53,6 +53,7 @@ meson_options_help() {
   printf "%s\n" '  libiscsi        libiscsi userspace initiator'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
+  printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
   printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
@@ -177,6 +178,8 @@ _meson_option_parse() {
     --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
     --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
     --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
+    --enable-libssh) printf "%s" -Dlibssh=enabled ;;
+    --disable-libssh) printf "%s" -Dlibssh=disabled ;;
     --enable-libudev) printf "%s" -Dlibudev=enabled ;;
     --disable-libudev) printf "%s" -Dlibudev=disabled ;;
     --enable-libusb) printf "%s" -Dlibusb=enabled ;;
-- 
2.27.0


