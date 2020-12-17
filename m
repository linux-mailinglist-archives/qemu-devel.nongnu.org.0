Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5F2DCEF3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:58:15 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq34-0004uR-AA
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmZ-0004xp-6J
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:12 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmO-0007lz-9O
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:10 -0500
Received: by mail-ed1-x529.google.com with SMTP id u19so27970860edx.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUEGmeFPHcUwApgJAGGVOl2ZiRp6LKFQ+cuO5XM1h3A=;
 b=QT0sAwsLm8D72z1rfPVe/OujjYpt3IrICOlaWgE7LrWJI38YOy4ZhTKbq6EpRhGefr
 ZOM+ow/JKwcBGsaOwPMp6c4AHT84z6ZX765OHGiRAT5aZw/6eEbJk4rSrL1+oTrItwVo
 cLYHsqz47BcSENOZZMuUbnFGMemTdeiEuVq3KkQi0CCeroXULWTstNFs9BQkL7tMqFvs
 j/zI0A9uM2Ur+rf/Y8c2T48uUKEJLaHnhRsoJMnKsdrwVVTg/+ZXnZR1ih2xUTfrNdaR
 zWtmdg4tPUVVpv8S0v9Zk9Lp/BF4mkHMHYk0xO+KdphxNbIHRPUCNCarxClKgwr3zjL5
 su0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vUEGmeFPHcUwApgJAGGVOl2ZiRp6LKFQ+cuO5XM1h3A=;
 b=nd4odI0qlZ2r4ySwc46ZWp5wdcMtnW2p8NvBJoKrYB6ie/QQTihDcbrNQTyScxM0Tq
 PRrw7k2WOI2KNngKvOAF0I7M6YjUKyu/Ctgnk909vLlrmbmx/zs2NM3x3ta05hciTbmP
 w1s3hSt/2SMBMCSHA1O27cpk8iMXjq2v6Ce+Ym4a7lX7TE6rpmSSnv/fCjD+rah5N9rz
 +vOVf6l0cUM+PzHjovftuOV/Z8Dlr/UuskT88FQ6YQuiggXuWonMlK5WVwO23l3ycFOl
 mBDTzyANFC0Cd8LvzVhiFwAz8XUYm0hobmq8Ez2FOBVqZkuKZcdIRSmIINuhocgsV+EB
 H8hA==
X-Gm-Message-State: AOAM531JPi+f2y9DS0hmfZAf7KOG/vcjDfyKNdNXpyENHNXuzRrDkjKe
 7qtgbl+Uj16EPzN0BLQUTTl9+P4z5NI=
X-Google-Smtp-Source: ABdhPJw4ztnqBQnOiDDIDCvaK0ZcUrN7biIYMJAFJR1xYG1d2JS9vgaZr32XEkAKXD9ImPqylJXmkw==
X-Received: by 2002:a50:fc8b:: with SMTP id f11mr37869388edq.11.1608198059079; 
 Thu, 17 Dec 2020 01:40:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/18] seccomp: convert to meson
Date: Thu, 17 Dec 2020 10:40:40 +0100
Message-Id: <20201217094044.46462-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index 649da881a2..00c2d61a96 100755
--- a/configure
+++ b/configure
@@ -414,7 +414,7 @@ debug_stack_usage="no"
 crypto_afalg="no"
 cfi="false"
 cfi_debug="false"
-seccomp="$default_feature"
+seccomp="auto"
 glusterfs="auto"
 gtk="$default_feature"
 gtk_gl="no"
@@ -1356,9 +1356,9 @@ for opt do
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
@@ -2458,24 +2458,6 @@ EOF
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
 
@@ -6053,12 +6035,6 @@ if test "$avx512f_opt" = "yes" ; then
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
@@ -6606,7 +6582,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd \
+        -Dzstd=$zstd -Dseccomp=$seccomp \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 93a95d7a7f..a0132730d7 100644
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
@@ -993,6 +994,7 @@ config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
@@ -2361,7 +2363,7 @@ if targetos == 'windows'
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



