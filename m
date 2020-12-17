Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD42DCE98
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:44:28 +0100 (CET)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpppj-0007oP-0U
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmJ-0004hE-AL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:56 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmF-0007iI-6V
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:53 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p22so27890989edu.11
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESpu4JIYwg0OY4jzmB8inm03RyD5oDmBeHHird1k/h8=;
 b=pARKOvJATZxNDhQ5Dy6+eYiMymbX/tP9fbjsYFOEnvr6qE+HUfMZVn1yna8E0T4sxx
 W1c3WraF0xzYO8gwpG45eCchozXsQRk6+I30EDdEQLHZD2nNK2sOMpt3Q8hChrYJaCIP
 WnWIXhIg/1y6qhjlCjgu2f9OmLD1/Cj6DRaxvAG78DQcmObQCJEDFtmyZ0vyroSKQeLH
 DhvB3EaQfcRKnq5wWanvSDB1JDnUDrYZcBkeO+9UnOCVnqINbv9ZM3LUQ6zBJDSZ+Pmr
 6Qe/LksSpwSBazwPMUE81vD62CTejU/3JnFj26XXs0y/yHYS6ifuStiYWtaUBU+AuPRi
 jrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ESpu4JIYwg0OY4jzmB8inm03RyD5oDmBeHHird1k/h8=;
 b=gZRa7J2Ih3m2Xf0NivYUr2F7iWqJyRKS8W6cr07mYt/bBQQulwNEqPPsXN+wy/3m6W
 avG350KJ6JJjJ5624yK55gUIpVwtVrYJfd3eCWvIspEcmEFLUIpBPH+Mede64CTKSmhF
 iJlZjvUDOy+lInw14Y69DJlIQt3x6tk43YfmwnmA692O4veCz9KYD5EucfJp6Q1M2BI/
 15vFfkYRpDV0S7hZ+Gl1r69vCAN4vdNuQiSI1u2uQHdr3EoCwAUAIXBHnK5LQ6Luiphi
 HoDgpax3YXNcuAJF9OZGneSLFlPgu1J/JVh6d3SP4Q0bg1YEk/m0DC1Pg+QSb8nrY6Wc
 M73g==
X-Gm-Message-State: AOAM532Mi4P73/Gti9Wef8Ol28E7hLdMAkI6dDCCa4DVxtT4Rko4wpnX
 7/rXRsmdscZ41VbZoCNjwZcBuez+muw=
X-Google-Smtp-Source: ABdhPJw1A6D+2IM4vWSO+YWy+lYqICRYhQI3XZloAEUYqN1FXuWBqtW9wYIetRt/BfJU6TO0Ngu24Q==
X-Received: by 2002:a50:eb96:: with SMTP id y22mr38045763edr.91.1608198049929; 
 Thu, 17 Dec 2020 01:40:49 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/18] curl: convert to meson
Date: Thu, 17 Dec 2020 10:40:29 +0100
Message-Id: <20201217094044.46462-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
 configure                   | 31 ++++---------------------------
 contrib/elf2dmp/meson.build |  2 +-
 meson.build                 | 11 +++++++----
 meson_options.txt           |  2 ++
 4 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index c0a3e1556b..71196b1fe7 100755
--- a/configure
+++ b/configure
@@ -307,7 +307,7 @@ for opt do
 done
 
 brlapi="auto"
-curl="$default_feature"
+curl="auto"
 iconv="auto"
 curses="auto"
 docs="auto"
@@ -1216,9 +1216,9 @@ for opt do
   ;;
   --enable-iconv) iconv="enabled"
   ;;
-  --disable-curl) curl="no"
+  --disable-curl) curl="disabled"
   ;;
-  --enable-curl) curl="yes"
+  --enable-curl) curl="enabled"
   ;;
   --disable-fdt) fdt="disabled"
   ;;
@@ -3425,25 +3425,6 @@ for drv in $audio_drv_list; do
     esac
 done
 
-##########################################
-# curl probe
-if test "$curl" != "no" ; then
-  cat > $TMPC << EOF
-#include <curl/curl.h>
-int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
-EOF
-  curl_cflags=$($pkg_config libcurl --cflags 2>/dev/null)
-  curl_libs=$($pkg_config libcurl --libs 2>/dev/null)
-  if compile_prog "$curl_cflags" "$curl_libs" ; then
-    curl=yes
-  else
-    if test "$curl" = "yes" ; then
-      feature_not_found "curl" "Install libcurl devel"
-    fi
-    curl=no
-  fi
-fi # test "$curl"
-
 ##########################################
 # glib support probe
 
@@ -6104,11 +6085,6 @@ fi
 if test "$bswap_h" = "yes" ; then
   echo "CONFIG_MACHINE_BSWAP_H=y" >> $config_host_mak
 fi
-if test "$curl" = "yes" ; then
-  echo "CONFIG_CURL=y" >> $config_host_mak
-  echo "CURL_CFLAGS=$curl_cflags" >> $config_host_mak
-  echo "CURL_LIBS=$curl_libs" >> $config_host_mak
-fi
 if test "$gtk" = "yes" ; then
   echo "CONFIG_GTK=y" >> $config_host_mak
   echo "GTK_CFLAGS=$gtk_cflags" >> $config_host_mak
@@ -6943,6 +6919,7 @@ NINJA=$ninja $meson setup \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
+        -Dcurl=$curl \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build
index b3de173316..4d86cb390a 100644
--- a/contrib/elf2dmp/meson.build
+++ b/contrib/elf2dmp/meson.build
@@ -1,4 +1,4 @@
-if 'CONFIG_CURL' in config_host
+if curl.found()
   executable('elf2dmp', files('main.c', 'addrspace.c', 'download.c', 'pdb.c', 'qemu_elf.c'),
              dependencies: [glib, curl],
              install: true)
diff --git a/meson.build b/meson.build
index 70f81121d7..83dbc61acd 100644
--- a/meson.build
+++ b/meson.build
@@ -392,9 +392,11 @@ if 'CONFIG_VIRGL' in config_host
                              link_args: config_host['VIRGL_LIBS'].split())
 endif
 curl = not_found
-if 'CONFIG_CURL' in config_host
-  curl = declare_dependency(compile_args: config_host['CURL_CFLAGS'].split(),
-                            link_args: config_host['CURL_LIBS'].split())
+if not get_option('curl').auto() or have_block
+  curl = dependency('libcurl', version: '>=7.29.0',
+                    method: 'pkg-config',
+                    required: get_option('curl'),
+                    static: enable_static)
 endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
@@ -872,6 +874,7 @@ config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
+config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
@@ -2160,7 +2163,7 @@ summary_info += {'iconv support':     iconv.found()}
 summary_info += {'curses support':    curses.found()}
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
-summary_info += {'curl support':      config_host.has_key('CONFIG_CURL')}
+summary_info += {'curl support':      curl.found()}
 summary_info += {'mingw32 support':   targetos == 'windows'}
 summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
diff --git a/meson_options.txt b/meson_options.txt
index 62efe96a91..2b845ac62b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -44,6 +44,8 @@ option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
+option('curl', type : 'feature', value : 'auto',
+       description: 'CURL block device driver')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
 option('iconv', type : 'feature', value : 'auto',
-- 
2.29.2



