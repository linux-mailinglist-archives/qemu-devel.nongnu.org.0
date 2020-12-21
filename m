Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F5B2DFD86
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:27:15 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN5e-0000uL-5v
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRO-0005AR-Uo
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:38 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRJ-0007xG-OT
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:38 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i9so11319998wrc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S41BGPZRveGqkm5mvgfMqkVIT2lorAEsSBbiL0WKr8I=;
 b=iqqHT01kwFs6PSC8Vv7jk4rybJ+yb7gbjuIu2YrUffr9PVlrOSU9MEnTkA4to6d1NG
 K2of5vsXxro0VNyb46HgYcGkZJJiKUnd+8OX7oZZZZ4GpWamCHfqdC2XxItRbpUvI5jM
 Lf1TEeNydE0V2yf6c6HX47Zo10YIWJAcjF4OZD6BlWJyEToItqzvkH8ldgYbdZX2NVkm
 k+3KF1q0+G8jWd+ExczW25zYs57Gk3uDtzyLgb5Hdtp4aG3XsF0BCSNEYkw9CioZfeIM
 UtGB7892uhVnvDry5at9WSJ3mvWXOzpY1Kbz7IZ6o8zQjLybZWV6vikFGuY5uXWaIvox
 aq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S41BGPZRveGqkm5mvgfMqkVIT2lorAEsSBbiL0WKr8I=;
 b=F8Zu//9OA/FLDD7so72JtH5P/wUCUzHpvVa+s0GG1I8xSJd6YCKEWB9H9y22LaYCAz
 pyznUtCgUUV5adZgHGhIjIr6bSmT1O6f1Yd3tiBUCZCoUdlNNF5L+59b+t0ySvvfpAtl
 4BUsCvT9xGabzlunROTbNM1OIb9Si63D562N1VqRdqZgWG3LzjSK6sSGaxib7WNGOfR/
 m6E5CQIdcwB8zj8R6GQDLDzV8T9tKbX0pqsBPl6YDkUhvTTcukFM3fJV1SAZ91Iby1fm
 T9NDYH/pHBgI+8YJwzqwGF8rePXxtt7hJdNaIqayhV5hO3QNMzgWkaRL8zdmfp0nljiY
 ObBA==
X-Gm-Message-State: AOAM5312AXWPxK1t0kCqIynvyPhXqcnkdOovcGh24X8k9+LHOlf45xx2
 jt3PtmDCNKpO3C6S6l/uwskYJKVO1yk=
X-Google-Smtp-Source: ABdhPJwN5MjV7X/wfszSb/tWNfWqUmIoYKqbWOBHRqynbYRerbUYQWOT0lCfG1KMs4wH5rDcyb40Nw==
X-Received: by 2002:adf:e688:: with SMTP id r8mr18775408wrm.20.1608561932342; 
 Mon, 21 Dec 2020 06:45:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/55] seccomp: convert to meson
Date: Mon, 21 Dec 2020 15:44:41 +0100
Message-Id: <20201221144447.26161-50-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 32 ++++----------------------------
 meson.build            | 10 ++++++----
 meson_options.txt      |  2 ++
 softmmu/meson.build    |  2 +-
 softmmu/qemu-seccomp.c |  2 --
 tools/meson.build      |  4 ++--
 6 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/configure b/configure
index 0c0eef7713..ba8c6e74be 100755
--- a/configure
+++ b/configure
@@ -413,7 +413,7 @@ debug_stack_usage="no"
 crypto_afalg="no"
 cfi="false"
 cfi_debug="false"
-seccomp="$default_feature"
+seccomp="auto"
 glusterfs="auto"
 gtk="$default_feature"
 gtk_gl="no"
@@ -1355,9 +1355,9 @@ for opt do
   ;;
   --disable-tools) want_tools="no"
   ;;
-  --enable-seccomp) seccomp="yes"
+  --enable-seccomp) seccomp="enabled"
   ;;
-  --disable-seccomp) seccomp="no"
+  --disable-seccomp) seccomp="disabled"
   ;;
   --disable-glusterfs) glusterfs="disabled"
   ;;
@@ -2456,24 +2456,6 @@ EOF
   fi
 fi
 
-##########################################
-# libseccomp check
-
-if test "$seccomp" != "no" ; then
-    libseccomp_minver="2.3.0"
-    if $pkg_config --atleast-version=$libseccomp_minver libseccomp ; then
-        seccomp_cflags="$($pkg_config --cflags libseccomp)"
-        seccomp_libs="$($pkg_config --libs libseccomp)"
-        seccomp="yes"
-    else
-        if test "$seccomp" = "yes" ; then
-            feature_not_found "libseccomp" \
-                 "Install libseccomp devel >= $libseccomp_minver"
-        fi
-        seccomp="no"
-    fi
-fi
-
 ##########################################
 # xen probe
 
@@ -6051,12 +6033,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$seccomp" = "yes"; then
-  echo "CONFIG_SECCOMP=y" >> $config_host_mak
-  echo "SECCOMP_CFLAGS=$seccomp_cflags" >> $config_host_mak
-  echo "SECCOMP_LIBS=$seccomp_libs" >> $config_host_mak
-fi
-
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
@@ -6604,7 +6580,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd \
+        -Dzstd=$zstd -Dseccomp=$seccomp \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index b4313951a6..99c4d0dd1a 100644
--- a/meson.build
+++ b/meson.build
@@ -329,9 +329,10 @@ if 'CONFIG_ATTR' in config_host
   libattr = declare_dependency(link_args: config_host['LIBATTR_LIBS'].split())
 endif
 seccomp = not_found
-if 'CONFIG_SECCOMP' in config_host
-  seccomp = declare_dependency(compile_args: config_host['SECCOMP_CFLAGS'].split(),
-                               link_args: config_host['SECCOMP_LIBS'].split())
+if not get_option('libiscsi').auto() or have_system or have_tools
+  seccomp = dependency('libseccomp', version: '>=2.3.0',
+                       required: get_option('seccomp'),
+                       method: 'pkg-config', static: enable_static)
 endif
 libcap_ng = not_found
 if 'CONFIG_LIBCAP_NG' in config_host
@@ -999,6 +1000,7 @@ config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
@@ -2368,7 +2370,7 @@ if targetos == 'windows'
   summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
-summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
+summary_info += {'seccomp support':   seccomp.found()}
 summary_info += {'CFI support':       get_option('cfi')}
 summary_info += {'CFI debug support': get_option('cfi_debug')}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
diff --git a/meson_options.txt b/meson_options.txt
index 5a1de9b1fe..1854a9639f 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -74,6 +74,8 @@ option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
        description: 'SDL Image support for icons')
+option('seccomp', type : 'feature', value : 'auto',
+       description: 'seccomp support')
 option('snappy', type : 'feature', value : 'auto',
        description: 'snappy compression support')
 option('u2f', type : 'feature', value : 'auto',
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 2dab6c7eb6..d8e03018ab 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -28,5 +28,5 @@ softmmu_ss.add(files(
 ), sdl, libpmem, libdaxctl)
 
 softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-softmmu_ss.add(when: 'CONFIG_SECCOMP', if_true: [files('qemu-seccomp.c'), seccomp])
+softmmu_ss.add(when: seccomp, if_true: files('qemu-seccomp.c'))
 softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 8325ecb766..377ef6937c 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -202,7 +202,6 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
     return rc < 0 ? -1 : 0;
 }
 
-#ifdef CONFIG_SECCOMP
 int parse_sandbox(void *opaque, QemuOpts *opts, Error **errp)
 {
     if (qemu_opt_get_bool(opts, "enable", false)) {
@@ -328,4 +327,3 @@ static void seccomp_register(void)
     }
 }
 opts_init(seccomp_register);
-#endif
diff --git a/tools/meson.build b/tools/meson.build
index 76bf84df52..5c52d79fe4 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,6 +1,6 @@
 have_virtiofsd = (targetos == 'linux' and
     have_tools and
-    'CONFIG_SECCOMP' in config_host and
+    seccomp.found() and
     'CONFIG_LIBCAP_NG' in config_host and
     'CONFIG_VHOST_USER' in config_host)
 
@@ -8,7 +8,7 @@ if get_option('virtiofsd').enabled()
   if not have_virtiofsd
     if targetos != 'linux'
       error('virtiofsd requires Linux')
-    elif 'CONFIG_SECCOMP' not in config_host or 'CONFIG_LIBCAP_NG' not in config_host
+    elif not seccomp.found() or 'CONFIG_LIBCAP_NG' not in config_host
       error('virtiofsd requires libcap-ng-devel and seccomp-devel')
     elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
       error('virtiofsd needs tools and vhost-user support')
-- 
2.29.2



