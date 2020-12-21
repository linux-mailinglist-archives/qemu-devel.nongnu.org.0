Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58BD2DFD17
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:56:53 +0100 (CET)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMcG-0001jS-Lj
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRH-0004rt-8f
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007q3-Ej
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:30 -0500
Received: by mail-wm1-x335.google.com with SMTP id q75so11189439wme.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlh+izxa5vEMNNyEE/2INCc8XWxagZR6Muhe29rcraY=;
 b=o7bGX6bi4mpe4JI8pXu7ctfj2cY9RLYy/9l+Vru43imYQ09pVvbvtoi4Aepi5mfBTZ
 LTzpcpnDL6Cok+fwnaizrQpcANsYmC2ameCa3HPMCly8unL8zWfgQ+xweWl5j9i8QNz3
 kiltyjEGvmrBWHVwUoyjr/pacxPFDEVuZ8GFZ5ZCSZjFe3/CSG44u9HAGDicySnj9UBj
 sOdORVZRb7x06flphl6sN6r7f/QPzVXuyTHmuVlT7ijVRWMyJ7EjKd9xuIDUQl10qXDh
 qGCSU4Fd2W5w7Z8KEuNbRUUlz0XQnNGdkCw44xZGz54lutWglPrDxd+R/TkLFwcH22ak
 VLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mlh+izxa5vEMNNyEE/2INCc8XWxagZR6Muhe29rcraY=;
 b=SBgqj/y8WRjpo6M0SK8J3QIYKJuHOfZhNyxoNUFDZG2wSK+tyAhRx7RB9n+WkORl/9
 2WcH1CfLqJrHvR3O1uoGtVmrIeXuSOb6lyRzpq0Odj2LQMSY4OWIb0+mMAAG081MEUhh
 Gk86XpMXPKliEqv2vATypYjzZQx8AW+VSN39TJXFgjRuxntp3OD0sPCrAGxKg2W1T6Cp
 ZHjmHiDSU5QbNRXg/ky6zR6hmQRvYfUsukeB60ZjfbBSWCsgnTTzlaOCr/CKvpIsqL9u
 D8jsjT4FkVkz0jdg47YmL5xn41KPM226Uo+PPRtECwbpIeaydZu2MJ7WPcFSMn92DmrR
 454Q==
X-Gm-Message-State: AOAM5318U/5ppTaKJcXoQVi+RisBhRLUpOEW/WTktiWUq8EqJVja00PF
 y7ihuezFB7/vVZYQf5h+8hLiqgOUico=
X-Google-Smtp-Source: ABdhPJzjn98/9F4db+OyQ7uIgHvpgf/HQdwF7Trq+bLKAbH6aDvyLQyf23T2IdNgzBf4Ue3RFiABrw==
X-Received: by 2002:a1c:de41:: with SMTP id v62mr17074728wmg.135.1608561923087; 
 Mon, 21 Dec 2020 06:45:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/55] curl: convert to meson
Date: Mon, 21 Dec 2020 15:44:30 +0100
Message-Id: <20201221144447.26161-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   | 31 ++++---------------------------
 contrib/elf2dmp/meson.build |  2 +-
 meson.build                 | 11 +++++++----
 meson_options.txt           |  2 ++
 4 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index c75196beb1..bb6b8eefdb 100755
--- a/configure
+++ b/configure
@@ -306,7 +306,7 @@ for opt do
 done
 
 brlapi="auto"
-curl="$default_feature"
+curl="auto"
 iconv="auto"
 curses="auto"
 docs="auto"
@@ -1215,9 +1215,9 @@ for opt do
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
@@ -3423,25 +3423,6 @@ for drv in $audio_drv_list; do
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
 
@@ -6102,11 +6083,6 @@ fi
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
@@ -6941,6 +6917,7 @@ NINJA=$ninja $meson setup \
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
index ecc95207e5..1d5b00aef1 100644
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
@@ -2161,7 +2164,7 @@ summary_info += {'iconv support':     iconv.found()}
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



