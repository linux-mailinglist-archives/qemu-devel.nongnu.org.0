Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29E2DFD2C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:06:43 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMll-0004pM-V0
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRL-00050e-BA
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:35 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRD-0007rC-MB
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:34 -0500
Received: by mail-wm1-x334.google.com with SMTP id x22so10081179wmc.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0IPpgfXJIG4wmc/dJzLIQz8n37gZPgs0r3/il0rSCBQ=;
 b=Ooo6NM9Jcil0b4ei/71psljq9lII19QKlYtYe98l+lLaMuh0biapanfkk3231MJWVZ
 pNp8WKRjkO4faKp45zNZ1vx1NusA4fwtGS+N99xpLg3iDfih39IWVm95Vb04/ZQp2vI6
 sp6P/t4KB6cWWSg3blm1hDulNuF1YYQW3zOFhiipJyjJlJdpeyeGLxaTfV8cFwrlvSuT
 9pcMFjHZ2CtWmZykSkR0yyV8/1D8Vtw480c+oCVdi/JSfbW9aWrIA/eKS1QsxDIN7cD7
 2sUHKd1Dahnaxpi3QUUAgUiUmEWnxy63Th86+xk9JX+QBM8HvQTocJc/XVlmg4JPKfv4
 rnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0IPpgfXJIG4wmc/dJzLIQz8n37gZPgs0r3/il0rSCBQ=;
 b=AVe4nKHECadNjiO6RwOUy21WLRNIYsZfTTXXsYX3/AepKMOXawjWs7wftiLz+o0rR6
 UwgssOwoR5mKnrlZkIxkCUB9XEexfweTiD6oyP1cEFKe4vYW9GCyAjTfKHMpmtvIfCZy
 2cBEDFz/zbBSS2JrKqmueK48XbqHWTeleI2gwLKIq0nK9sS6OVUlGuddlqIJQSOa0KYS
 b274nJFbuHff0+X4Ji5rtlucMNjVIA4UQKMBNpnbS85zp/fq0WtnYtsMrz+Q6jpF6J+Q
 cyfQceBZoYRsUvv9mWuQ0aEpw+kn0AcFBZq0ROYwkvSz7dbP2RoZAq6HtaPTEwjDWYvc
 fS3g==
X-Gm-Message-State: AOAM531ErBvo7rI12QZr3K4WAjR/8A7AFDeYqikfV6SvadUEMZ70lpzD
 WuvqlozYAne4l5MjHoq+z36L3PEHfX4=
X-Google-Smtp-Source: ABdhPJyIZPxlGbx/e8/mgPPHTn/25KXjxdGKwIIvajT0SRnDtBGOsKyg6GNReMg7GWizdQwh8CzBKQ==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr17292435wmg.152.1608561925764; 
 Mon, 21 Dec 2020 06:45:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/55] libiscsi: convert to meson
Date: Mon, 21 Dec 2020 15:44:33 +0100
Message-Id: <20201221144447.26161-42-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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
 block/meson.build                   |  2 +-
 configure                           | 29 ++++-------------------------
 contrib/vhost-user-scsi/meson.build |  2 +-
 meson.build                         | 10 ++++++----
 meson_options.txt                   |  2 ++
 5 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index b02cb14aad..134034abb4 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -59,7 +59,7 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
 block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true: files('parallels.c'))
 block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
-block_ss.add(when: 'CONFIG_LIBISCSI', if_true: files('iscsi-opts.c'))
+block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
 block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
 block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
 block_ss.add(when: 'CONFIG_SHEEPDOG', if_true: files('sheepdog.c'))
diff --git a/configure b/configure
index 3d65c1e196..30084af631 100755
--- a/configure
+++ b/configure
@@ -405,7 +405,7 @@ guest_agent_msi="$default_feature"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
-libiscsi="$default_feature"
+libiscsi="auto"
 libnfs="$default_feature"
 coroutine=""
 coroutine_pool="$default_feature"
@@ -1138,9 +1138,9 @@ for opt do
   ;;
   --enable-spice) spice="yes"
   ;;
-  --disable-libiscsi) libiscsi="no"
+  --disable-libiscsi) libiscsi="disabled"
   ;;
-  --enable-libiscsi) libiscsi="yes"
+  --enable-libiscsi) libiscsi="enabled"
   ;;
   --disable-libnfs) libnfs="no"
   ;;
@@ -4313,21 +4313,6 @@ if compile_prog "" "" ; then
   bswap_h=yes
 fi
 
-##########################################
-# Do we have libiscsi >= 1.9.0
-if test "$libiscsi" != "no" ; then
-  if $pkg_config --atleast-version=1.9.0 libiscsi; then
-    libiscsi="yes"
-    libiscsi_cflags=$($pkg_config --cflags libiscsi)
-    libiscsi_libs=$($pkg_config --libs libiscsi)
-  else
-    if test "$libiscsi" = "yes" ; then
-      feature_not_found "libiscsi" "Install libiscsi >= 1.9.0"
-    fi
-    libiscsi="no"
-  fi
-fi
-
 ##########################################
 # Do we need librt
 # uClibc provides 2 versions of clock_gettime(), one with realtime
@@ -6229,12 +6214,6 @@ if test "$zstd" = "yes" ; then
   echo "ZSTD_LIBS=$zstd_libs" >> $config_host_mak
 fi
 
-if test "$libiscsi" = "yes" ; then
-  echo "CONFIG_LIBISCSI=y" >> $config_host_mak
-  echo "LIBISCSI_CFLAGS=$libiscsi_cflags" >> $config_host_mak
-  echo "LIBISCSI_LIBS=$libiscsi_libs" >> $config_host_mak
-fi
-
 if test "$libnfs" = "yes" ; then
   echo "CONFIG_LIBNFS=y" >> $config_host_mak
   echo "LIBNFS_LIBS=$libnfs_libs" >> $config_host_mak
@@ -6800,7 +6779,7 @@ NINJA=$ninja $meson setup \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 \
+        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/contrib/vhost-user-scsi/meson.build b/contrib/vhost-user-scsi/meson.build
index 044c50bf43..cc893f6f20 100644
--- a/contrib/vhost-user-scsi/meson.build
+++ b/contrib/vhost-user-scsi/meson.build
@@ -1,4 +1,4 @@
-if 'CONFIG_LIBISCSI' in config_host
+if libiscsi.found()
   executable('vhost-user-scsi', files('vhost-user-scsi.c'),
              dependencies: [qemuutil, libiscsi, vhost_user],
              build_by_default: targetos == 'linux',
diff --git a/meson.build b/meson.build
index 66e35598ce..d1cbea169c 100644
--- a/meson.build
+++ b/meson.build
@@ -372,9 +372,10 @@ if 'CONFIG_PLUGIN' in config_host
   libdl = cc.find_library('dl', required: true)
 endif
 libiscsi = not_found
-if 'CONFIG_LIBISCSI' in config_host
-  libiscsi = declare_dependency(compile_args: config_host['LIBISCSI_CFLAGS'].split(),
-                                link_args: config_host['LIBISCSI_LIBS'].split())
+if not get_option('libiscsi').auto() or have_block
+  libiscsi = dependency('libiscsi', version: '>=1.9.0',
+                         required: get_option('libiscsi'),
+                         method: 'pkg-config', static: enable_static)
 endif
 zstd = not_found
 if 'CONFIG_ZSTD' in config_host
@@ -928,6 +929,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
+config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2286,7 +2288,7 @@ summary_info += {'libusb':            config_host.has_key('CONFIG_USB_LIBUSB')}
 summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
-summary_info += {'libiscsi support':  config_host.has_key('CONFIG_LIBISCSI')}
+summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    config_host.has_key('CONFIG_LIBNFS')}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 if targetos == 'windows'
diff --git a/meson_options.txt b/meson_options.txt
index fd16f3b399..b562d4f1a6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -50,6 +50,8 @@ option('curl', type : 'feature', value : 'auto',
        description: 'CURL block device driver')
 option('glusterfs', type : 'feature', value : 'auto',
        description: 'Glusterfs block device driver')
+option('libiscsi', type : 'feature', value : 'auto',
+       description: 'libiscsi userspace initiator')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
 option('iconv', type : 'feature', value : 'auto',
-- 
2.29.2



