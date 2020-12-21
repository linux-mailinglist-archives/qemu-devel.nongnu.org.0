Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962B2DFD40
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:09:39 +0100 (CET)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMoY-000089-GV
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRN-000554-0k
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRG-0007uj-O9
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id e25so11196015wme.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NWGI23omPGUEZY71SQdPtP5PXqGrOMFaLCwsxeEHtMo=;
 b=lHDSk4Ih/3wmMH8IeSeBOc4WeRR4GgbBWpEXgGTjL8VewHn6mbcSVVCSI1LZrCLHaJ
 bjtwZ/MwZLxn4EbzV6CBgRk/JbLHWgZgC34MMG4I670hXr025qdhdUca1g22Kx4GoPl3
 liYCHajfDVXEMGFMgj22gIo4WoegYvGg6GwBGAvM5S16NYQgjsnlJHkUJP7Pi2xRstOi
 Zku9TqMUqcW+NQ8Ah7dMYHOkKcLq53/rEIMepqi25YN2qOwqDaokftD1HM7Btp3ZyDYd
 jwa098sFG0sx6KPcvbXO8aQu4C4VfvrS9vZqv8PPoZRuetmsn1ewk4A8zFvBNqMAOouB
 xB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NWGI23omPGUEZY71SQdPtP5PXqGrOMFaLCwsxeEHtMo=;
 b=fi8CcFVhAO3io38V6NV64Yg1D66kpQ9Lw29Q5Pw9JJZi3a+LUPuC94zMnV0DQNSgwO
 DfDa+Yamx1zHFtzbW3yb8G2vQe0L7sLxXSIqr/xybAAL/lADOd8fqFh5mStvkwYAsyqG
 Ev9sGCc8NPlLKNC435Pg1zkLRPWWBKThTnFhPvFIt3Wn1+5TuekN5VmeV4TGcu5SH+AC
 cGuNOKMG7AZOVzl3hN6HIGSey+aqrHdVtsJodFW/wFei4s+YK7u3acgOClummu1odqua
 ttgmtb2b7FYVgIzJsykr4cazpZ239a3T0lom+VHOP4g8jfwqCyaFwZWe8TC0vkr/BLbM
 2q0w==
X-Gm-Message-State: AOAM530aVJK5Qt1jw0H1Tb/AjjtXYmFJdM8qz6JS1Xx/R6Nb84aOiDyM
 lv/TfqzjlvrXhZeCO0Jh1+5dhcTxTrg=
X-Google-Smtp-Source: ABdhPJwVUhPa86oteoYxqsvaAbycwr3/3NEOmTCBXZ29Ii8CU3a6+gFxrwcz1jmdw02lUxJ5w+0X6A==
X-Received: by 2002:a1c:630b:: with SMTP id x11mr16835651wmb.138.1608561928389; 
 Mon, 21 Dec 2020 06:45:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/55] rbd: convert to meson
Date: Mon, 21 Dec 2020 15:44:36 +0100
Message-Id: <20201221144447.26161-45-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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
 configure         | 35 ++++-------------------------------
 meson.build       | 22 +++++++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/configure b/configure
index 0350b59624..a2e4796053 100755
--- a/configure
+++ b/configure
@@ -383,7 +383,7 @@ qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
 spice="$default_feature"
-rbd="$default_feature"
+rbd="auto"
 smartcard="$default_feature"
 u2f="auto"
 libusb="$default_feature"
@@ -1285,9 +1285,9 @@ for opt do
   ;;
   --enable-opengl) opengl="yes"
   ;;
-  --disable-rbd) rbd="no"
+  --disable-rbd) rbd="disabled"
   ;;
-  --enable-rbd) rbd="yes"
+  --enable-rbd) rbd="enabled"
   ;;
   --disable-xfsctl) xfs="no"
   ;;
@@ -3605,29 +3605,6 @@ if compile_prog "" "$pthread_lib" ; then
   pthread_setname_np_wo_tid=yes
 fi
 
-##########################################
-# rbd probe
-if test "$rbd" != "no" ; then
-  cat > $TMPC <<EOF
-#include <stdio.h>
-#include <rbd/librbd.h>
-int main(void) {
-    rados_t cluster;
-    rados_create(&cluster, NULL);
-    return 0;
-}
-EOF
-  rbd_libs="-lrbd -lrados"
-  if compile_prog "" "$rbd_libs" ; then
-    rbd=yes
-  else
-    if test "$rbd" = "yes" ; then
-      feature_not_found "rados block device" "Install librbd/ceph devel"
-    fi
-    rbd=no
-  fi
-fi
-
 ##########################################
 # linux-aio probe
 
@@ -6182,10 +6159,6 @@ fi
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
-if test "$rbd" = "yes" ; then
-  echo "CONFIG_RBD=y" >> $config_host_mak
-  echo "RBD_LIBS=$rbd_libs" >> $config_host_mak
-fi
 
 echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
@@ -6724,7 +6697,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh \
+        -Dlibssh=$libssh -Drbd=$rbd \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index e448624212..92fe7007ef 100644
--- a/meson.build
+++ b/meson.build
@@ -612,9 +612,24 @@ else
 endif
 
 rbd = not_found
-if 'CONFIG_RBD' in config_host
-  rbd = declare_dependency(link_args: config_host['RBD_LIBS'].split())
+if not get_option('rbd').auto() or have_block
+  librados = cc.find_library('rados', required: get_option('rbd'),
+                             static: enable_static)
+  librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
+                           required: get_option('rbd'),
+                           static: enable_static)
+  if librados.found() and librbd.found() and cc.links('''
+    #include <stdio.h>
+    #include <rbd/librbd.h>
+    int main(void) {
+      rados_t cluster;
+      rados_create(&cluster, NULL);
+      return 0;
+    }''', dependencies: [librbd, librados])
+    rbd = declare_dependency(dependencies: [librbd, librados])
+  endif
 endif
+
 glusterfs = not_found
 glusterfs_ftruncate_has_stat = false
 glusterfs_iocb_has_stat = false
@@ -947,6 +962,7 @@ config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
+config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2297,7 +2313,7 @@ if config_host['TRACE_BACKENDS'].split().contains('simple')
 endif
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
-summary_info += {'rbd support':       config_host.has_key('CONFIG_RBD')}
+summary_info += {'rbd support':       rbd.found()}
 summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': config_host.has_key('CONFIG_SMARTCARD')}
 summary_info += {'U2F support':       u2f.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 6466dc67f6..630c9dceb7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
        description: 'curses UI')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
+option('rbd', type : 'feature', value : 'auto',
+       description: 'Ceph block device driver')
 option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
-- 
2.29.2



