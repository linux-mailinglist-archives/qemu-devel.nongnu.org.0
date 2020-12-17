Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980952DCECD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:48:42 +0100 (CET)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpptp-00043T-JV
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmY-0004wp-BD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:10 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmK-0007jt-8X
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:10 -0500
Received: by mail-ej1-x636.google.com with SMTP id g20so36942627ejb.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ed2gqJphg3Tl6K+vVMJ7D7AAx0eSWTNxNjJBcE2fDoY=;
 b=cO/5NPcaFez+ivVWzvxMNgFjXJppfc7MmHftFS/y5pdlp/mfYdMdA1hpEKKicmwYRh
 gxJ5Ujh4w8PJcItTCd4j2/Fe4mtv6GBrwevz27drlAPQU1jhmxK9BFuSARrqrCWSVJad
 rdixoP3oDxdNHKTFmKuQu+6k6vikRjyUoJRZGLd1IOPYGAPeSiJiDUDXOEmQAMeU4sQi
 z10P1dKRWZJPtjO2GDimEcpijpHBMQUVEBnsr/rm/0/zbVCXJO8TEcHvHyVEEbiDK4Cp
 4hBmIA51526ej7x/p0FjR8ST1bVqHXOhhjeHJexG1iHZbuhE7tPcy4y/BjmNipHrPvD0
 Er1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ed2gqJphg3Tl6K+vVMJ7D7AAx0eSWTNxNjJBcE2fDoY=;
 b=qgp6Mpf/f2sDuG7FTJDCeBL7qnODlAatC+BlLkqnP8nypowTGBCfII+ks9bGLsdHRz
 fWcRb/qtFKklY64Vhep9P/InjQwkUBvFN/Ex6+rCgIASeZqBH5Q+LWEBS+cXo/QmKQfX
 AIr6d+bcYDp6qi2zIUVMaSflQxQ2a5ThYJtbdRZ+sqNEkmn/QqKqlm4c5tdjRUMU+4Ra
 7HWU5fcyku2NfSHGCCTRZFSvbfAkznTGSkncCJyuBjdkCPfS0TWg/h4ixCojdgfiu7NY
 4tVxRvvabpcjjBOQvYMxcXiP0LCq8T66FPoNODan4FfoQvksbq49HBXLVOsbCFP+xCBx
 Bwkg==
X-Gm-Message-State: AOAM532XaZvw/aoijgnMEE+J+JgD025iJT9y7HroEuh3apomfaEEYeEF
 xmJ7Pr68KXhoBqtdPXNQkAt7YCWLPT0=
X-Google-Smtp-Source: ABdhPJzuWnxaRp3SKWX6SPY5EWYLwSJjMWVvkVuPH7gE8FZWjVX2pD5zYwMTQ1fT4TXi6U3HEA0NBg==
X-Received: by 2002:a17:906:3711:: with SMTP id
 d17mr10232769ejc.121.1608198055004; 
 Thu, 17 Dec 2020 01:40:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] rbd: convert to meson
Date: Thu, 17 Dec 2020 10:40:35 +0100
Message-Id: <20201217094044.46462-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
 configure         | 35 ++++-------------------------------
 meson.build       | 22 +++++++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/configure b/configure
index f3271381f1..e34885d505 100755
--- a/configure
+++ b/configure
@@ -384,7 +384,7 @@ qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
 spice="$default_feature"
-rbd="$default_feature"
+rbd="auto"
 smartcard="$default_feature"
 u2f="auto"
 libusb="$default_feature"
@@ -1286,9 +1286,9 @@ for opt do
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
@@ -3607,29 +3607,6 @@ if compile_prog "" "$pthread_lib" ; then
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
 
@@ -6184,10 +6161,6 @@ fi
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
-if test "$rbd" = "yes" ; then
-  echo "CONFIG_RBD=y" >> $config_host_mak
-  echo "RBD_LIBS=$rbd_libs" >> $config_host_mak
-fi
 
 echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
@@ -6726,7 +6699,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh \
+        -Dlibssh=$libssh -Drbd=$rbd \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 2d6660aa46..6fa80e2d7e 100644
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
@@ -941,6 +956,7 @@ config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
+config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2290,7 +2306,7 @@ if config_host['TRACE_BACKENDS'].split().contains('simple')
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



