Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDB2DFDA2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:37:32 +0100 (CET)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNFb-0002IA-HQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRL-000513-Eh
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRE-0007sI-3w
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id q75so11189640wme.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4JzR2yr+0oCeHu8Tpy2fW0hmDHgTGenqGpT5qkUnxc=;
 b=e0THxxveWRmhxNHqxBAnnA2gkwzSqN5qRriw6kiqQ7l/ZR1RNtzektVifbwNWoMuFm
 LIE242Y+OarvIj4n/9EXLtzBFfupBFAhdLHFV+W5m33rezkEJKXwN0tnhXkFF3WMhFxc
 KtyPtuKyWmdXafbD2Jojgt6T1jlmUAmvOq8bfHreITmPl74ImojtZIGY7UhWyt7nd3rB
 phl0VE5A+nT/DAXXA17IaadAZOH4Ww2RLst2NwwAWn7/c28qdWHYfVS57fELLLzL6pTi
 eJMoTnkt5ZlTL572Pz6K+FVeXZjmCJQYGBYiPE59JKt4xD3cL317mDQEGWn3xOWJvpzC
 J80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S4JzR2yr+0oCeHu8Tpy2fW0hmDHgTGenqGpT5qkUnxc=;
 b=RN8HhPb4Q7oxjSZw+8xWIgYRCGt3y5LLXmri9+JAbGZuaFo3urJeLBWwFPREF9jadJ
 pLKrIBGcKhr3q2x3LtpnM7y+b8bd5HcJTaYfiP2hCVqu3rwawmQcuIaLrK9jaDY8u4CB
 FJMGhhZpbeO4ZQSe4ROuhiA/u/yvIlSfcaNrkwHKI/kiB47cv9LrT7b3hhXMh1HU7la7
 hj08UTA0Ae76uW01ewpNl9AzUsIAbD5+4aqLObZhoMUBKnnMiDuX7DHLvnRzTZodTbzp
 Wo9tNHw/S+qrURnMQWtqCLl54iFIbE48Y7oXm/ubAtuYD/6w480muUCFMaLqCwkoLaaB
 y6Iw==
X-Gm-Message-State: AOAM5337TZNG2af+kfKJvbI5BU11XTRZN08sj4rBPn4+qnqhIWKte0zZ
 5a6s9MBv/y/pgobbsGBMQT+7fvulcms=
X-Google-Smtp-Source: ABdhPJx3Qb1H0vU8hwhVauqrxHcpcc8xuCMgcFta2jyzo+3B2wcNQhrgWoXH7k1fYEnHpWTdHtZFhg==
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr17035861wmb.87.1608561926566; 
 Mon, 21 Dec 2020 06:45:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/55] libnfs: convert to meson
Date: Mon, 21 Dec 2020 15:44:34 +0100
Message-Id: <20201221144447.26161-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
 configure         | 27 ++++-----------------------
 meson.build       |  9 ++++++---
 meson_options.txt |  2 ++
 3 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/configure b/configure
index 30084af631..9b38368427 100755
--- a/configure
+++ b/configure
@@ -406,7 +406,7 @@ vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
 libiscsi="auto"
-libnfs="$default_feature"
+libnfs="auto"
 coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
@@ -1142,9 +1142,9 @@ for opt do
   ;;
   --enable-libiscsi) libiscsi="enabled"
   ;;
-  --disable-libnfs) libnfs="no"
+  --disable-libnfs) libnfs="disabled"
   ;;
-  --enable-libnfs) libnfs="yes"
+  --enable-libnfs) libnfs="enabled"
   ;;
   --enable-profiler) profiler="yes"
   ;;
@@ -5559,20 +5559,6 @@ if test "$have_ubsan" = "yes"; then
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
 fi
 
-##########################################
-# Do we have libnfs
-if test "$libnfs" != "no" ; then
-  if $pkg_config --atleast-version=1.9.3 libnfs; then
-    libnfs="yes"
-    libnfs_libs=$($pkg_config --libs libnfs)
-  else
-    if test "$libnfs" = "yes" ; then
-      feature_not_found "libnfs" "Install libnfs devel >= 1.9.3"
-    fi
-    libnfs="no"
-  fi
-fi
-
 ##########################################
 
 # Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
@@ -6214,11 +6200,6 @@ if test "$zstd" = "yes" ; then
   echo "ZSTD_LIBS=$zstd_libs" >> $config_host_mak
 fi
 
-if test "$libnfs" = "yes" ; then
-  echo "CONFIG_LIBNFS=y" >> $config_host_mak
-  echo "LIBNFS_LIBS=$libnfs_libs" >> $config_host_mak
-fi
-
 if test "$seccomp" = "yes"; then
   echo "CONFIG_SECCOMP=y" >> $config_host_mak
   echo "SECCOMP_CFLAGS=$seccomp_cflags" >> $config_host_mak
@@ -6780,7 +6761,7 @@ NINJA=$ninja $meson setup \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
-        -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
+        -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index d1cbea169c..9ed3ee31f9 100644
--- a/meson.build
+++ b/meson.build
@@ -319,8 +319,10 @@ if 'CONFIG_LIBXML2' in config_host
                                link_args: config_host['LIBXML2_LIBS'].split())
 endif
 libnfs = not_found
-if 'CONFIG_LIBNFS' in config_host
-  libnfs = declare_dependency(link_args: config_host['LIBNFS_LIBS'].split())
+if not get_option('libnfs').auto() or have_block
+  libnfs = dependency('libnfs', version: '>=1.9.3',
+                      required: get_option('libnfs'),
+                      method: 'pkg-config', static: enable_static)
 endif
 libattr = not_found
 if 'CONFIG_ATTR' in config_host
@@ -930,6 +932,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
+config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2289,7 +2292,7 @@ summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
 summary_info += {'libiscsi support':  libiscsi.found()}
-summary_info += {'libnfs support':    config_host.has_key('CONFIG_LIBNFS')}
+summary_info += {'libnfs support':    libnfs.found()}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 if targetos == 'windows'
   if 'WIN_SDK' in config_host
diff --git a/meson_options.txt b/meson_options.txt
index b562d4f1a6..4535bc4dc2 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -52,6 +52,8 @@ option('glusterfs', type : 'feature', value : 'auto',
        description: 'Glusterfs block device driver')
 option('libiscsi', type : 'feature', value : 'auto',
        description: 'libiscsi userspace initiator')
+option('libnfs', type : 'feature', value : 'auto',
+       description: 'libnfs block device driver')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
 option('iconv', type : 'feature', value : 'auto',
-- 
2.29.2



