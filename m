Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079C42DCE97
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:44:10 +0100 (CET)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpppR-0007Y7-1D
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmF-0004fg-F9
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:52 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmD-0007i0-Mi
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:51 -0500
Received: by mail-ed1-x529.google.com with SMTP id q16so27921462edv.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t+Y7UFYFTZ7LLffq17YS+EHmwTw0jFbFP2FYxjrbxAs=;
 b=NQAAXx8gYuS5CsLgK92IlTPoLEaKaBBncwA0LpD3ysSPvP7Bb1RMpwAaqfHMpyZQht
 vxmw7i7EBBLDk69Ae4bdPaTlW3YRcoMsB67Ytc5oRYYFRiOXwsunVpOObOx6B0z8bY5O
 NCTCEk4155KE9QqDHhbn91yQ5QPIzjPtXBQqfqW51c1qUfbSZR9G5eFuAXOIWiSILXwv
 joKDNBrFaRnBIg0pQ8dZgK5cpQC07iaDtEb1YM67LDkfHyCGqMfomQ4vaXkhz6tlYMVi
 pXBbR+WGT42GEmnHsMqKKt7oAR99s68c4NY98AVpSododI3rtcpd6YqWq5N+Ldm581vZ
 chlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t+Y7UFYFTZ7LLffq17YS+EHmwTw0jFbFP2FYxjrbxAs=;
 b=DS5nv0mlEIewvgLeI4hcRoeiYds+wWmnJsk4ABregAVRbYW/7OZ0h6+8bPhE7EsEcD
 Ffmhk1zmgRTQpAPy58syElqnhg9azcYjwkaSLwoXWPmQcNuAV9sp89GzfHT5NLnVkI0G
 SRLQH9SAMX2PtTuzuneQ4MLgxbxuOIcJWZDmadT/JqQ7wGTQcmmbrNDvfozQO0nqWWzB
 6C275XcRZyHp/h/HZnzxic+Qp0UkRQ/Awdbsr9aik6ijEhM8Ege8LJtJPel01tTFaHWE
 8m7AEYEl/yHjbwWsI6Sf+/0D6ePOCvj7t5cf3iN/bl3rvhCyK0LnctSBAT4Aropil1Uw
 zx/Q==
X-Gm-Message-State: AOAM532+EIG2dF94wNHd77ymQkoCcgzO6xkMQVRhOlo9vbZ57sq/aIFH
 qXvlaCcJh+AoawGkBZE4su9w8ndN9Ac=
X-Google-Smtp-Source: ABdhPJy0w8rB5W6OP21OZURf61bbtf2hocaulLP0fDBV3hS7Gh+N80bNx3HogUw8Gs2iOXQUehbsRg==
X-Received: by 2002:a50:bacb:: with SMTP id x69mr22169835ede.39.1608198048251; 
 Thu, 17 Dec 2020 01:40:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/18] brlapi: convert to meson
Date: Thu, 17 Dec 2020 10:40:27 +0100
Message-Id: <20201217094044.46462-2-pbonzini@redhat.com>
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
 chardev/meson.build |  2 +-
 configure           | 32 ++++----------------------------
 meson.build         | 20 +++++++++++++++++---
 meson_options.txt   |  2 ++
 4 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/chardev/meson.build b/chardev/meson.build
index 4e19722c5e..32377af383 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -29,7 +29,7 @@ softmmu_ss.add(files('msmouse.c', 'wctablet.c', 'testdev.c'))
 
 chardev_modules = {}
 
-if config_host.has_key('CONFIG_BRLAPI')
+if brlapi.found()
   module_ss = ss.source_set()
   module_ss.add(when: [brlapi], if_true: [files('baum.c'), pixman])
   chardev_modules += { 'baum': module_ss }
diff --git a/configure b/configure
index 74eebfd692..42b39544d4 100755
--- a/configure
+++ b/configure
@@ -306,7 +306,7 @@ for opt do
   esac
 done
 
-brlapi="$default_feature"
+brlapi="auto"
 curl="$default_feature"
 iconv="auto"
 curses="auto"
@@ -1105,9 +1105,9 @@ for opt do
   ;;
   --enable-xen-pci-passthrough) xen_pci_passthrough="enabled"
   ;;
-  --disable-brlapi) brlapi="no"
+  --disable-brlapi) brlapi="disabled"
   ;;
-  --enable-brlapi) brlapi="yes"
+  --enable-brlapi) brlapi="enabled"
   ;;
   --disable-kvm) kvm="disabled"
   ;;
@@ -3425,26 +3425,6 @@ for drv in $audio_drv_list; do
     esac
 done
 
-##########################################
-# BrlAPI probe
-
-if test "$brlapi" != "no" ; then
-  brlapi_libs="-lbrlapi"
-  cat > $TMPC << EOF
-#include <brlapi.h>
-#include <stddef.h>
-int main( void ) { return brlapi__openConnection (NULL, NULL, NULL); }
-EOF
-  if compile_prog "" "$brlapi_libs" ; then
-    brlapi=yes
-  else
-    if test "$brlapi" = "yes" ; then
-      feature_not_found "brlapi" "Install brlapi devel"
-    fi
-    brlapi=no
-  fi
-fi
-
 ##########################################
 # curl probe
 if test "$curl" != "no" ; then
@@ -6134,10 +6114,6 @@ if test "$curl" = "yes" ; then
   echo "CURL_CFLAGS=$curl_cflags" >> $config_host_mak
   echo "CURL_LIBS=$curl_libs" >> $config_host_mak
 fi
-if test "$brlapi" = "yes" ; then
-  echo "CONFIG_BRLAPI=y" >> $config_host_mak
-  echo "BRLAPI_LIBS=$brlapi_libs" >> $config_host_mak
-fi
 if test "$gtk" = "yes" ; then
   echo "CONFIG_GTK=y" >> $config_host_mak
   echo "GTK_CFLAGS=$gtk_cflags" >> $config_host_mak
@@ -6971,7 +6947,7 @@ NINJA=$ninja $meson setup \
         -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
+        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/meson.build b/meson.build
index bb198f792a..70f81121d7 100644
--- a/meson.build
+++ b/meson.build
@@ -570,8 +570,21 @@ if have_system and not get_option('curses').disabled()
 endif
 
 brlapi = not_found
-if 'CONFIG_BRLAPI' in config_host
-  brlapi = declare_dependency(link_args: config_host['BRLAPI_LIBS'].split())
+if not get_option('brlapi').auto() or have_system
+  brlapi = cc.find_library('brlapi', has_headers: ['brlapi.h'],
+                         required: get_option('brlapi'),
+                         static: enable_static)
+  if brlapi.found() and not cc.links('''
+     #include <brlapi.h>
+     #include <stddef.h>
+     int main(void) { return brlapi__openConnection (NULL, NULL, NULL); }''', dependencies: brlapi)
+    brlapi = not_found
+    if get_option('brlapi').enabled()
+      error('could not link brlapi')
+    else
+      warning('could not link brlapi, disabling')
+    endif
+  endif
 endif
 
 sdl = not_found
@@ -854,6 +867,7 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
@@ -2164,7 +2178,7 @@ summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
 if config_host.has_key('CONFIG_XEN_BACKEND')
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
-summary_info += {'brlapi support':    config_host.has_key('CONFIG_BRLAPI')}
+summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'Documentation':     build_docs}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
diff --git a/meson_options.txt b/meson_options.txt
index 242e0769fb..62efe96a91 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -40,6 +40,8 @@ option('cfi', type: 'boolean', value: 'false',
 option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 
+option('brlapi', type : 'feature', value : 'auto',
+       description: 'brlapi character device driver')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('mpath', type : 'feature', value : 'auto',
-- 
2.29.2



