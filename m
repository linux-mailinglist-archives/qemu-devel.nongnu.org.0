Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B32DFD61
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:19:44 +0100 (CET)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMyO-0001Ea-0F
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRP-0005Bv-Es
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRL-0007xv-FV
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id q18so11334116wrn.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RdW2HjhcohpbvrKSbpoMZNbyc1Eg4tJlxHdWFEO6tHw=;
 b=eh32L3WCLk/tlJLc+CvQoyoRMRnXuAtCdbWqfRRyWiSypBnF5Lwr6OzXFW6qw3LYSn
 iu/Fxe//pcRhzPyN3BsxvYtAMI5UmXi8sHgmS5+TK8PiT0ILcc+zSxhuEp9Ow+L1qx9P
 WIkYwBpDdqVaXESCAwiTfc8A9LupQkSEXNQEVOyVEgS+3CEhtnZMPGqXystr7nsIe0ux
 PqE34FZu5F7wMXqn66uSj3KgT9He1HSi7qkiJC6CaMyZbuqEUArNBWnlmvuUSJMagPH8
 Y2mHySAadiAovA5ySI/ORwkuB3ovTuEJxrcIf2wpyNuCpYnbtxZiieJHT8B5a7Tc0/qP
 aJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RdW2HjhcohpbvrKSbpoMZNbyc1Eg4tJlxHdWFEO6tHw=;
 b=Rq0x+GrAZojAhYDD7I13yL13Qt5HAFbF9PvqbiQzhMBHlxbqyRTzBhYP0411mB+Iid
 RMMSEl01TucomK1cpBI+MV+5aidrA0aq3i74Tb96qOvERv2VPt8ElpGoz0eXOdS62Vqy
 Rf57kPN/iXJEJeyLJ3A1TCht/fEvaF9cq0VH241ZJ1biJfusnYpo1qwOGMVqszKSS5nu
 hs7L6fygs/1sXZae87YvVouR42nC1PUcDvHbWPpNJwMzui2IWP/aP8pyft10N0XcOVFb
 RT8zjChYkoSWUYrGvCHaxuDvDd36hUTnqiYGSSiPA4VCmvUJWQ5HEXxLP4YY+HwgPfxS
 mtVg==
X-Gm-Message-State: AOAM531TIiWehZVHDOwelVT0rIXyWhyTUuNE0ktX3g8lSFv01+rG2HIG
 h7f3Z5Y5XPMNDbhte/SUBR9wV/M25qQ=
X-Google-Smtp-Source: ABdhPJyInkrbSD+sMh+0q+F1BVZtJUvgyrwt9t7+0Iwyvy+rELx04Ti5pSnwbl5lmx7nCFE6/sLVLg==
X-Received: by 2002:a5d:67c1:: with SMTP id n1mr18824035wrw.205.1608561934012; 
 Mon, 21 Dec 2020 06:45:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/55] cap_ng: convert to meson
Date: Mon, 21 Dec 2020 15:44:43 +0100
Message-Id: <20201221144447.26161-52-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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
 configure         | 34 ++++------------------------------
 meson.build       | 24 ++++++++++++++++++++----
 meson_options.txt |  2 ++
 tools/meson.build |  4 ++--
 4 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/configure b/configure
index 46ee3da40e..569396248b 100755
--- a/configure
+++ b/configure
@@ -330,7 +330,7 @@ xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
 linux_aio="$default_feature"
 linux_io_uring="$default_feature"
-cap_ng="$default_feature"
+cap_ng="auto"
 attr="$default_feature"
 libattr="$default_feature"
 xfs="$default_feature"
@@ -1122,9 +1122,9 @@ for opt do
   ;;
   --enable-tcg-interpreter) tcg_interpreter="yes"
   ;;
-  --disable-cap-ng)  cap_ng="no"
+  --disable-cap-ng)  cap_ng="disabled"
   ;;
-  --enable-cap-ng) cap_ng="yes"
+  --enable-cap-ng) cap_ng="enabled"
   ;;
   --disable-tcg) tcg="disabled"
   ;;
@@ -3191,28 +3191,6 @@ EOF
   fi
 fi
 
-##########################################
-# libcap-ng library probe
-if test "$cap_ng" != "no" ; then
-  cap_libs="-lcap-ng"
-  cat > $TMPC << EOF
-#include <cap-ng.h>
-int main(void)
-{
-    capng_capability_to_name(CAPNG_EFFECTIVE);
-    return 0;
-}
-EOF
-  if compile_prog "" "$cap_libs" ; then
-    cap_ng=yes
-  else
-    if test "$cap_ng" = "yes" ; then
-      feature_not_found "cap_ng" "Install libcap-ng devel"
-    fi
-    cap_ng=no
-  fi
-fi
-
 ##########################################
 # Sound support libraries probe
 
@@ -5669,10 +5647,6 @@ fi
 if test "$gprof" = "yes" ; then
   echo "CONFIG_GPROF=y" >> $config_host_mak
 fi
-if test "$cap_ng" = "yes" ; then
-  echo "CONFIG_LIBCAP_NG=y" >> $config_host_mak
-  echo "LIBCAP_NG_LIBS=$cap_libs" >> $config_host_mak
-fi
 echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
 for drv in $audio_drv_list; do
     def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
@@ -6559,7 +6533,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs \
+        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 22413b4f16..f580f2f67f 100644
--- a/meson.build
+++ b/meson.build
@@ -334,10 +334,25 @@ if not get_option('libiscsi').auto() or have_system or have_tools
                        required: get_option('seccomp'),
                        method: 'pkg-config', static: enable_static)
 endif
-libcap_ng = not_found
-if 'CONFIG_LIBCAP_NG' in config_host
-  libcap_ng = declare_dependency(link_args: config_host['LIBCAP_NG_LIBS'].split())
+
+libcap_ng = cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
+                      required: get_option('cap_ng'),
+                      static: enable_static)
+if libcap_ng.found() and not cc.links('''
+   #include <cap-ng.h>
+   int main(void)
+   {
+     capng_capability_to_name(CAPNG_EFFECTIVE);
+     return 0;
+   }''', dependencies: libcap_ng)
+  libcap_ng = not_found
+  if get_option('cap_ng').enabled()
+    error('could not link libcap-ng')
+  else
+    warning('could not link libcap-ng, disabling')
+  endif
 endif
+
 if get_option('xkbcommon').auto() and not have_system and not have_tools
   xkbcommon = not_found
 else
@@ -1012,6 +1027,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
+config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
@@ -2355,7 +2371,7 @@ summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
 summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
 summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
 summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
-summary_info += {'libcap-ng support': config_host.has_key('CONFIG_LIBCAP_NG')}
+summary_info += {'libcap-ng support': libcap_ng.found()}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
diff --git a/meson_options.txt b/meson_options.txt
index 59a8a50e5b..12a1872f20 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -44,6 +44,8 @@ option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')
 option('bzip2', type : 'feature', value : 'auto',
        description: 'bzip2 support for DMG images')
+option('cap_ng', type : 'feature', value : 'auto',
+       description: 'cap_ng support')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('curl', type : 'feature', value : 'auto',
diff --git a/tools/meson.build b/tools/meson.build
index 5c52d79fe4..fdce66857d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,14 +1,14 @@
 have_virtiofsd = (targetos == 'linux' and
     have_tools and
     seccomp.found() and
-    'CONFIG_LIBCAP_NG' in config_host and
+    libcap_ng.found() and
     'CONFIG_VHOST_USER' in config_host)
 
 if get_option('virtiofsd').enabled()
   if not have_virtiofsd
     if targetos != 'linux'
       error('virtiofsd requires Linux')
-    elif not seccomp.found() or 'CONFIG_LIBCAP_NG' not in config_host
+    elif not seccomp.found() or not libcap_ng.found()
       error('virtiofsd requires libcap-ng-devel and seccomp-devel')
     elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
       error('virtiofsd needs tools and vhost-user support')
-- 
2.29.2



