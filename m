Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14A2DCEFE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:01:02 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq5k-0007Vw-3u
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmU-0004uV-6r
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:06 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmG-0007iU-3h
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:05 -0500
Received: by mail-ed1-x536.google.com with SMTP id g24so2327430edw.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TdvZIaVS2PKvVRM9fsWZ4iOV5QJRNYL/FLyT44crNg8=;
 b=namBqQ6kdwnwlOSMVvRAmcPmqJtIMQAm3jhKmpXcWabZWY7ZbaZK2QWZuzBfaP6oHa
 e5WZW7CvMXMpTFscFtyAmKdFphOarnmCVlogBvl5UCSx2/rEtbYBcClxWDVBwk/6WMRM
 INIvPHzSiVdfojLNLp20rYScLB9xpGx8JOGnEeewIUWdRrNfHDcZLKrjtx4RfTFN3JUC
 Sr7KJ037urPnd7tTdErrUf/eHDEMmMFDtd7CGz+aNydg9mF1akcLnZ0lOLJWzOkCPMrx
 W5lP+RPTJi3Pyi5mj2YB9eGnYI7/qw4SpMGU2z1w3KGmfmN41mueDGb+lWG7/d0uQ0Fa
 C/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TdvZIaVS2PKvVRM9fsWZ4iOV5QJRNYL/FLyT44crNg8=;
 b=TVAxU0jIEsnXMazik1ObppqforrLQ1wQYkAWjk9XKECxl528WqsLoTP9gpWmGphoYR
 upqs2TJxVwcyTzyPQvjOhspJ1N9+RDqOfWs4FZ4ES3AnHCuumAWWWkDx0LySt1MH9kuT
 hI0QxnK7J04qIVMJsPcXSOxIS9BC0KIcw3NoWWZzce5330j4wldLbf5MXm6O4gtcyE2G
 68ZabWxs1mXeLRUKm36QN8Aw1kEiBX1UZEqXMfcWNL06AIRaN/PlL1TNGEIPaicrd1D0
 mrwOGK/14sagqrjgOb1AZlZj9fCgiw0eFUaTQzw2vjBPM5paEPTz1+/hPN5AeN6BLqDD
 1BHw==
X-Gm-Message-State: AOAM530d4AQ1Ul52c3FKyglFUdoaWtoVXJYm9AmHrIspRVx6cdDRECh5
 3mmR8rn3wh4WKtOuYJ56epO5qKyURIk=
X-Google-Smtp-Source: ABdhPJw35xDD82hK/qKSNNOt3+JmuoOsUe8X1+NNGDyVm5vvdQgZ0ZQZw2sTiv3bz8S9jmc9xdBI3g==
X-Received: by 2002:a50:955b:: with SMTP id v27mr36991445eda.324.1608198050733; 
 Thu, 17 Dec 2020 01:40:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/18] glusterfs: convert to meson
Date: Thu, 17 Dec 2020 10:40:30 +0100
Message-Id: <20201217094044.46462-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
 configure         | 102 ++--------------------------------------------
 meson.build       |  46 +++++++++++++++++++--
 meson_options.txt |   2 +
 3 files changed, 48 insertions(+), 102 deletions(-)

diff --git a/configure b/configure
index 71196b1fe7..5529ac4b32 100755
--- a/configure
+++ b/configure
@@ -415,13 +415,7 @@ crypto_afalg="no"
 cfi="false"
 cfi_debug="false"
 seccomp="$default_feature"
-glusterfs="$default_feature"
-glusterfs_xlator_opt="no"
-glusterfs_discard="no"
-glusterfs_fallocate="no"
-glusterfs_zerofill="no"
-glusterfs_ftruncate_has_stat="no"
-glusterfs_iocb_has_stat="no"
+glusterfs="auto"
 gtk="$default_feature"
 gtk_gl="no"
 tls_priority="NORMAL"
@@ -1366,7 +1360,7 @@ for opt do
   ;;
   --disable-seccomp) seccomp="no"
   ;;
-  --disable-glusterfs) glusterfs="no"
+  --disable-glusterfs) glusterfs="disabled"
   ;;
   --disable-avx2) avx2_opt="no"
   ;;
@@ -1377,7 +1371,7 @@ for opt do
   --enable-avx512f) avx512f_opt="yes"
   ;;
 
-  --enable-glusterfs) glusterfs="yes"
+  --enable-glusterfs) glusterfs="enabled"
   ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
@@ -3871,64 +3865,6 @@ if test "$libxml2" != "no" ; then
     fi
 fi
 
-##########################################
-# glusterfs probe
-if test "$glusterfs" != "no" ; then
-  if $pkg_config --atleast-version=3 glusterfs-api; then
-    glusterfs="yes"
-    glusterfs_cflags=$($pkg_config --cflags glusterfs-api)
-    glusterfs_libs=$($pkg_config --libs glusterfs-api)
-    if $pkg_config --atleast-version=4 glusterfs-api; then
-      glusterfs_xlator_opt="yes"
-    fi
-    if $pkg_config --atleast-version=5 glusterfs-api; then
-      glusterfs_discard="yes"
-    fi
-    if $pkg_config --atleast-version=6 glusterfs-api; then
-      glusterfs_fallocate="yes"
-      glusterfs_zerofill="yes"
-    fi
-    cat > $TMPC << EOF
-#include <glusterfs/api/glfs.h>
-
-int
-main(void)
-{
-	/* new glfs_ftruncate() passes two additional args */
-	return glfs_ftruncate(NULL, 0, NULL, NULL);
-}
-EOF
-    if compile_prog "$glusterfs_cflags" "$glusterfs_libs" ; then
-      glusterfs_ftruncate_has_stat="yes"
-    fi
-    cat > $TMPC << EOF
-#include <glusterfs/api/glfs.h>
-
-/* new glfs_io_cbk() passes two additional glfs_stat structs */
-static void
-glusterfs_iocb(glfs_fd_t *fd, ssize_t ret, struct glfs_stat *prestat, struct glfs_stat *poststat, void *data)
-{}
-
-int
-main(void)
-{
-	glfs_io_cbk iocb = &glusterfs_iocb;
-	iocb(NULL, 0 , NULL, NULL, NULL);
-	return 0;
-}
-EOF
-    if compile_prog "$glusterfs_cflags" "$glusterfs_libs" ; then
-      glusterfs_iocb_has_stat="yes"
-    fi
-  else
-    if test "$glusterfs" = "yes" ; then
-      feature_not_found "GlusterFS backend support" \
-          "Install glusterfs-api devel >= 3"
-    fi
-    glusterfs="no"
-  fi
-fi
-
 # Check for inotify functions when we are building linux-user
 # emulator.  This is done because older glibc versions don't
 # have syscall stubs for these implemented.  In that case we
@@ -6415,36 +6351,6 @@ if test "$getauxval" = "yes" ; then
   echo "CONFIG_GETAUXVAL=y" >> $config_host_mak
 fi
 
-if test "$glusterfs" = "yes" ; then
-  echo "CONFIG_GLUSTERFS=y" >> $config_host_mak
-  echo "GLUSTERFS_CFLAGS=$glusterfs_cflags" >> $config_host_mak
-  echo "GLUSTERFS_LIBS=$glusterfs_libs" >> $config_host_mak
-fi
-
-if test "$glusterfs_xlator_opt" = "yes" ; then
-  echo "CONFIG_GLUSTERFS_XLATOR_OPT=y" >> $config_host_mak
-fi
-
-if test "$glusterfs_discard" = "yes" ; then
-  echo "CONFIG_GLUSTERFS_DISCARD=y" >> $config_host_mak
-fi
-
-if test "$glusterfs_fallocate" = "yes" ; then
-  echo "CONFIG_GLUSTERFS_FALLOCATE=y" >> $config_host_mak
-fi
-
-if test "$glusterfs_zerofill" = "yes" ; then
-  echo "CONFIG_GLUSTERFS_ZEROFILL=y" >> $config_host_mak
-fi
-
-if test "$glusterfs_ftruncate_has_stat" = "yes" ; then
-  echo "CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT=y" >> $config_host_mak
-fi
-
-if test "$glusterfs_iocb_has_stat" = "yes" ; then
-  echo "CONFIG_GLUSTERFS_IOCB_HAS_STAT=y" >> $config_host_mak
-fi
-
 if test "$libssh" = "yes" ; then
   echo "CONFIG_LIBSSH=y" >> $config_host_mak
   echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
@@ -6919,7 +6825,7 @@ NINJA=$ninja $meson setup \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl \
+        -Dcurl=$curl -Dglusterfs=$glusterfs \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/meson.build b/meson.build
index 83dbc61acd..409b958a7f 100644
--- a/meson.build
+++ b/meson.build
@@ -613,9 +613,40 @@ if 'CONFIG_RBD' in config_host
   rbd = declare_dependency(link_args: config_host['RBD_LIBS'].split())
 endif
 glusterfs = not_found
-if 'CONFIG_GLUSTERFS' in config_host
-  glusterfs = declare_dependency(compile_args: config_host['GLUSTERFS_CFLAGS'].split(),
-                                 link_args: config_host['GLUSTERFS_LIBS'].split())
+glusterfs_ftruncate_has_stat = false
+glusterfs_iocb_has_stat = false
+if not get_option('glusterfs').auto() or have_block
+  glusterfs = dependency('glusterfs-api', version: '>=3',
+                         required: get_option('glusterfs'),
+                         method: 'pkg-config', static: enable_static)
+  if glusterfs.found()
+    glusterfs_ftruncate_has_stat = cc.links('''
+      #include <glusterfs/api/glfs.h>
+
+      int
+      main(void)
+      {
+          /* new glfs_ftruncate() passes two additional args */
+          return glfs_ftruncate(NULL, 0, NULL, NULL);
+      }
+    ''', dependencies: glusterfs)
+    glusterfs_iocb_has_stat = cc.links('''
+      #include <glusterfs/api/glfs.h>
+
+      /* new glfs_io_cbk() passes two additional glfs_stat structs */
+      static void
+      glusterfs_iocb(glfs_fd_t *fd, ssize_t ret, struct glfs_stat *prestat, struct glfs_stat *poststat, void *data)
+      {}
+
+      int
+      main(void)
+      {
+          glfs_io_cbk iocb = &glusterfs_iocb;
+          iocb(NULL, 0 , NULL, NULL, NULL);
+          return 0;
+      }
+    ''', dependencies: glusterfs)
+  endif
 endif
 libssh = not_found
 if 'CONFIG_LIBSSH' in config_host
@@ -876,6 +907,13 @@ config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
+config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
+config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT', glusterfs.version().version_compare('>=4'))
+config_host_data.set('CONFIG_GLUSTERFS_DISCARD', glusterfs.version().version_compare('>=5'))
+config_host_data.set('CONFIG_GLUSTERFS_FALLOCATE', glusterfs.version().version_compare('>=6'))
+config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL', glusterfs.version().version_compare('>=6'))
+config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
+config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2252,7 +2290,7 @@ summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
 summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
-summary_info += {'GlusterFS support': config_host.has_key('CONFIG_GLUSTERFS')}
+summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
diff --git a/meson_options.txt b/meson_options.txt
index 2b845ac62b..b5d84bb88b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -46,6 +46,8 @@ option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('curl', type : 'feature', value : 'auto',
        description: 'CURL block device driver')
+option('glusterfs', type : 'feature', value : 'auto',
+       description: 'Glusterfs block device driver')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
 option('iconv', type : 'feature', value : 'auto',
-- 
2.29.2



