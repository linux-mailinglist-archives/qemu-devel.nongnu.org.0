Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64235240CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 20:10:49 +0200 (CEST)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5CG0-0006ap-DH
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 14:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BMB-0003zn-Na
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:13:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23830
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BM7-0003Or-UD
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ldF5vktZKv/6sjUYMRCr3Ec+GwjStLwYCly0+awW5fA=;
 b=CsMNwAQAJTRcTUX3D+lAGbVKVYU+iLbDnXxxuosdNVJskHdj0VfrhdevdpG1unck3Q1vFS
 YoVDNoE9w3lYzsMcJGliMo9/Is55fgMDNx1PfA1H0ON5cob2H14utUAjvgTT6k52Ou986w
 3W2VIbhJRu98jcUgS9x+EBC8nv6wvfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-KCECoNFlNuOny2ozDakHsQ-1; Mon, 10 Aug 2020 13:13:01 -0400
X-MC-Unique: KCECoNFlNuOny2ozDakHsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F79D1005504
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:13:00 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6562C5F1EA
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:12:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 142/147] meson: convert VNC and dependent libraries to meson
Date: Mon, 10 Aug 2020 19:09:00 +0200
Message-Id: <1597079345-42801-143-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:31:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 configure         | 122 ++++++------------------------------------------------
 meson.build       |  40 +++++++++++-------
 meson_options.txt |   4 ++
 ui/meson.build    |  10 ++---
 4 files changed, 45 insertions(+), 131 deletions(-)

diff --git a/configure b/configure
index 9f8ae94..ce9669e 100755
--- a/configure
+++ b/configure
@@ -381,12 +381,12 @@ sdl="auto"
 sdl_image="auto"
 virtfs=""
 mpath=""
-vnc="yes"
+vnc="enabled"
 sparse="no"
 vde=""
-vnc_sasl=""
-vnc_jpeg=""
-vnc_png=""
+vnc_sasl="auto"
+vnc_jpeg="auto"
+vnc_png="auto"
 xkbcommon=""
 xen=""
 xen_ctrl_version=""
@@ -1112,9 +1112,9 @@ for opt do
   ;;
   --enable-mpath) mpath="yes"
   ;;
-  --disable-vnc) vnc="no"
+  --disable-vnc) vnc="disabled"
   ;;
-  --enable-vnc) vnc="yes"
+  --enable-vnc) vnc="enabled"
   ;;
   --oss-lib=*) oss_lib="$optarg"
   ;;
@@ -1150,17 +1150,17 @@ for opt do
   ;;
   --disable-strip) strip_opt="no"
   ;;
-  --disable-vnc-sasl) vnc_sasl="no"
+  --disable-vnc-sasl) vnc_sasl="disabled"
   ;;
-  --enable-vnc-sasl) vnc_sasl="yes"
+  --enable-vnc-sasl) vnc_sasl="enabled"
   ;;
-  --disable-vnc-jpeg) vnc_jpeg="no"
+  --disable-vnc-jpeg) vnc_jpeg="disabled"
   ;;
-  --enable-vnc-jpeg) vnc_jpeg="yes"
+  --enable-vnc-jpeg) vnc_jpeg="enabled"
   ;;
-  --disable-vnc-png) vnc_png="no"
+  --disable-vnc-png) vnc_png="disabled"
   ;;
-  --enable-vnc-png) vnc_png="yes"
+  --enable-vnc-png) vnc_png="enabled"
   ;;
   --disable-slirp) slirp="no"
   ;;
@@ -3371,85 +3371,6 @@ EOF
 fi
 
 ##########################################
-# VNC SASL detection
-if test "$vnc" = "yes" && test "$vnc_sasl" != "no" ; then
-  cat > $TMPC <<EOF
-#include <sasl/sasl.h>
-#include <stdio.h>
-int main(void) { sasl_server_init(NULL, "qemu"); return 0; }
-EOF
-  # Assuming Cyrus-SASL installed in /usr prefix
-  # QEMU defines struct iovec in "qemu/osdep.h",
-  # we don't want libsasl to redefine it in <sasl/sasl.h>.
-  vnc_sasl_cflags="-DSTRUCT_IOVEC_DEFINED"
-  vnc_sasl_libs="-lsasl2"
-  if compile_prog "$vnc_sasl_cflags" "$vnc_sasl_libs" ; then
-    vnc_sasl=yes
-    libs_softmmu="$vnc_sasl_libs $libs_softmmu"
-    QEMU_CFLAGS="$QEMU_CFLAGS $vnc_sasl_cflags"
-  else
-    if test "$vnc_sasl" = "yes" ; then
-      feature_not_found "vnc-sasl" "Install Cyrus SASL devel"
-    fi
-    vnc_sasl=no
-  fi
-fi
-
-##########################################
-# VNC JPEG detection
-if test "$vnc" = "yes" && test "$vnc_jpeg" != "no" ; then
-cat > $TMPC <<EOF
-#include <stdio.h>
-#include <jpeglib.h>
-int main(void) { struct jpeg_compress_struct s; jpeg_create_compress(&s); return 0; }
-EOF
-    vnc_jpeg_cflags=""
-    vnc_jpeg_libs="-ljpeg"
-  if compile_prog "$vnc_jpeg_cflags" "$vnc_jpeg_libs" ; then
-    vnc_jpeg=yes
-    libs_softmmu="$vnc_jpeg_libs $libs_softmmu"
-    QEMU_CFLAGS="$QEMU_CFLAGS $vnc_jpeg_cflags"
-  else
-    if test "$vnc_jpeg" = "yes" ; then
-      feature_not_found "vnc-jpeg" "Install libjpeg-turbo devel"
-    fi
-    vnc_jpeg=no
-  fi
-fi
-
-##########################################
-# VNC PNG detection
-if test "$vnc" = "yes" && test "$vnc_png" != "no" ; then
-cat > $TMPC <<EOF
-//#include <stdio.h>
-#include <png.h>
-#include <stddef.h>
-int main(void) {
-    png_structp png_ptr;
-    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
-    return png_ptr != 0;
-}
-EOF
-  if $pkg_config libpng --exists; then
-    vnc_png_cflags=$($pkg_config libpng --cflags)
-    vnc_png_libs=$($pkg_config libpng --libs)
-  else
-    vnc_png_cflags=""
-    vnc_png_libs="-lpng"
-  fi
-  if compile_prog "$vnc_png_cflags" "$vnc_png_libs" ; then
-    vnc_png=yes
-    libs_softmmu="$vnc_png_libs $libs_softmmu"
-    QEMU_CFLAGS="$QEMU_CFLAGS $vnc_png_cflags"
-  else
-    if test "$vnc_png" = "yes" ; then
-      feature_not_found "vnc-png" "Install libpng devel"
-    fi
-    vnc_png=no
-  fi
-fi
-
-##########################################
 # xkbcommon probe
 if test "$xkbcommon" != "no" ; then
   if $pkg_config xkbcommon --exists; then
@@ -6836,24 +6757,6 @@ if test "$audio_win_int" = "yes" ; then
 fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
-if test "$vnc" = "yes" ; then
-  echo "CONFIG_VNC=y" >> $config_host_mak
-fi
-if test "$vnc_sasl" = "yes" ; then
-  echo "CONFIG_VNC_SASL=y" >> $config_host_mak
-fi
-echo "SASL_CFLAGS=$vnc_sasl_cflags" >> $config_host_mak
-echo "SASL_LIBS=$vnc_sasl_libs" >> $config_host_mak
-if test "$vnc_jpeg" = "yes" ; then
-  echo "CONFIG_VNC_JPEG=y" >> $config_host_mak
-fi
-echo "JPEG_CFLAGS=$vnc_jpeg_cflags" >> $config_host_mak
-echo "JPEG_LIBS=$vnc_jpeg_libs" >> $config_host_mak
-if test "$vnc_png" = "yes" ; then
-  echo "CONFIG_VNC_PNG=y" >> $config_host_mak
-fi
-echo "PNG_CFLAGS=$vnc_png_cflags" >> $config_host_mak
-echo "PNG_LIBS=$vnc_png_libs" >> $config_host_mak
 if test "$xkbcommon" = "yes" ; then
   echo "CONFIG_XKBCOMMON=y" >> $config_host_mak
   echo "XKBCOMMON_CFLAGS=$xkbcommon_cflags" >> $config_host_mak
@@ -8300,6 +8203,7 @@ NINJA=$PWD/ninjatool $meson setup \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
 	-Dsdl=$sdl -Dsdl_image=$sdl_image \
+	-Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 3e7ff68..426f9d8 100644
--- a/meson.build
+++ b/meson.build
@@ -293,20 +293,24 @@ if 'CONFIG_GIO' in config_host
   gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
                            link_args: config_host['GIO_LIBS'].split())
 endif
+vnc = not_found
 png = not_found
-if 'CONFIG_VNC_PNG' in config_host
-  png = declare_dependency(compile_args: config_host['PNG_CFLAGS'].split(),
-                           link_args: config_host['PNG_LIBS'].split())
-endif
 jpeg = not_found
-if 'CONFIG_VNC_JPEG' in config_host
-  jpeg = declare_dependency(compile_args: config_host['JPEG_CFLAGS'].split(),
-                            link_args: config_host['JPEG_LIBS'].split())
-endif
 sasl = not_found
-if 'CONFIG_VNC_SASL' in config_host
-  sasl = declare_dependency(compile_args: config_host['SASL_CFLAGS'].split(),
-                            link_args: config_host['SASL_LIBS'].split())
+if get_option('vnc').enabled()
+  vnc = declare_dependency() # dummy dependency
+  png = dependency('libpng', required: get_option('vnc_png'),
+                   static: enable_static)
+  jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
+                         required: get_option('vnc_jpeg'),
+                         static: enable_static)
+  sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
+                         required: get_option('vnc_sasl'),
+                         static: enable_static)
+  if sasl.found()
+    sasl = declare_dependency(dependencies: sasl,
+                              compile_args: '-DSTRUCT_IOVEC_DEFINED')
+  endif
 endif
 fdt = not_found
 if 'CONFIG_FDT' in config_host
@@ -364,6 +368,10 @@ endif
 
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_VNC', vnc.found())
+config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
+config_host_data.set('CONFIG_VNC_PNG', png.found())
+config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -1275,11 +1283,11 @@ summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
 summary_info += {'VirtFS support':    config_host.has_key('CONFIG_VIRTFS')}
 summary_info += {'Multipath support': config_host.has_key('CONFIG_MPATH')}
-summary_info += {'VNC support':       config_host.has_key('CONFIG_VNC')}
-if config_host.has_key('CONFIG_VNC')
-  summary_info += {'VNC SASL support':  config_host.has_key('CONFIG_VNC_SASL')}
-  summary_info += {'VNC JPEG support':  config_host.has_key('CONFIG_VNC_JPEG')}
-  summary_info += {'VNC PNG support':   config_host.has_key('CONFIG_VNC_PNG')}
+summary_info += {'VNC support':       vnc.found()}
+if vnc.found()
+  summary_info += {'VNC SASL support':  sasl.found()}
+  summary_info += {'VNC JPEG support':  jpeg.found()}
+  summary_info += {'VNC PNG support':   png.found()}
 endif
 summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
 if config_host.has_key('CONFIG_XEN_BACKEND')
diff --git a/meson_options.txt b/meson_options.txt
index e548211..67455c5 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -1,2 +1,6 @@
 option('sdl', type : 'feature', value : 'auto')
 option('sdl_image', type : 'feature', value : 'auto')
+option('vnc', type : 'feature', value : 'enabled')
+option('vnc_jpeg', type : 'feature', value : 'auto')
+option('vnc_png', type : 'feature', value : 'auto')
+option('vnc_sasl', type : 'feature', value : 'auto')
diff --git a/ui/meson.build b/ui/meson.build
index 57160b3..3632455 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -27,14 +27,12 @@ vnc_ss.add(files(
   'vnc-ws.c',
   'vnc-jobs.c',
 ))
-vnc_ss.add(zlib)
-vnc_ss.add(when: 'CONFIG_VNC_SASL', if_true: [files('vnc-auth-sasl.c'), sasl])
-softmmu_ss.add_all(when: 'CONFIG_VNC', if_true: vnc_ss)
-softmmu_ss.add(when: 'CONFIG_VNC', if_false: files('vnc-stubs.c'))
+vnc_ss.add(zlib, png, jpeg)
+vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
+softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
+softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
 softmmu_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
 softmmu_ss.add(when: [opengl, 'CONFIG_OPENGL_DMABUF'], if_true: files('egl-headless.c'))
-softmmu_ss.add(when: 'CONFIG_VNC_PNG', if_true: png)
-softmmu_ss.add(when: 'CONFIG_VNC_JPEG', if_true: jpeg)
 
 ui_modules = []
 
-- 
1.8.3.1



