Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B039F504
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:33:22 +0200 (CEST)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZyz-0000i2-UA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpD-0006Wk-9V
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpB-0007z9-3V
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id c5so21118907wrq.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6UDWEf0DLDCUpQTKicBlzYssZ+vCxOEn0uxeWy/2xyI=;
 b=QpKQv1gOBrGXZHQna4vPYPILQRNKhkYurPhSWG9MgJejNKCDMnReI0SU/eXIxu8whL
 qonTKEPk3Qzs12MtUpoFV2JPb9zy8XfTY5nfJieZYI18XoPMe9sosjHraUIwqIs7kx0f
 fJKpwrIJJhTMrpd2nf7HXTTYUV3X7dqhYfWSoPoaaS3WRxCiUr4vkUiUhDXVO1PN1gmn
 51V14NFOIc+vFiZMGS/hFlPEOTzKEevspVhbDJPAvWFNxJn0WvF8O9PM5Xv8HRwu7oY1
 5NceOeHHTlO17OGMNsVBrbwyalrDfvYqY0Mz0mF1Jh/R0SZt9kv2IR0pYywl1Nkd+zN7
 TiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6UDWEf0DLDCUpQTKicBlzYssZ+vCxOEn0uxeWy/2xyI=;
 b=jlVgo8WaHh7zfYxTltt+4bA5MacICFMrYtczdNFVV1pYXkQpqinTW32DvaycoED9Jd
 HxZ1boxYKjBmT3+ALQGJS5IQ3tM8DtdSFMllyXNKO63i6UqOaxyV4xH2gajqr+UXM7pY
 5sjkEs6vCj1lPxtVyr5PrhRhITOUf5B9bwb5UzY1wlQTauwOYBwuuwiwJOLHOU9eyTUE
 G5PNOdI309Jnbn5fZjwnCs5U7SE4J7NbQzVIgMr8jJQt2aiHCWkEI6YnM6T40K+5hXpM
 2fBkHAPQXP6oOZNOoU9UULmrRa7ryml8henu4Q8Ihd+Va7g7w4mHXAD3+XiAP2jteek/
 ZD6g==
X-Gm-Message-State: AOAM533S2t+HKG0AF2OEGONUzf8sv697Wu4dasQwMzC8pZsBqS5shD6n
 2dejFOme0Bbb3idTq8xAQ0TDKIvknhYfyQ==
X-Google-Smtp-Source: ABdhPJxV27PQvMKDxxrAN5uuzxm54BCTqL01PXmaRKmvWXoGcVJDEDKLuwzIhNYRfR17ZHQg5QgBqw==
X-Received: by 2002:adf:b648:: with SMTP id i8mr15699630wre.425.1623151391155; 
 Tue, 08 Jun 2021 04:23:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/26] configure, meson: convert vte detection to meson
Date: Tue,  8 Jun 2021 13:22:44 +0200
Message-Id: <20210608112301.402434-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 meson.build       | 22 ++++++++++++++++------
 meson_options.txt |  2 ++
 3 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/configure b/configure
index 9a6217a3bf..d3351557e9 100755
--- a/configure
+++ b/configure
@@ -408,7 +408,7 @@ gnutls="auto"
 nettle="auto"
 gcrypt="auto"
 auth_pam="auto"
-vte="$default_feature"
+vte="auto"
 virglrenderer="$default_feature"
 tpm="$default_feature"
 libssh="$default_feature"
@@ -1395,9 +1395,9 @@ for opt do
   ;;
   --disable-pvrdma) pvrdma="no"
   ;;
-  --disable-vte) vte="no"
+  --disable-vte) vte="disabled"
   ;;
-  --enable-vte) vte="yes"
+  --enable-vte) vte="enabled"
   ;;
   --disable-virglrenderer) virglrenderer="no"
   ;;
@@ -2799,28 +2799,6 @@ EOF
   fi
 fi
 
-##########################################
-# VTE probe
-
-if test "$vte" != "no"; then
-    vteminversion="0.32.0"
-    if $pkg_config --exists "vte-2.91"; then
-      vtepackage="vte-2.91"
-    else
-      vtepackage="vte-2.90"
-    fi
-    if $pkg_config --exists "$vtepackage >= $vteminversion"; then
-        vte_cflags=$($pkg_config --cflags $vtepackage)
-        vte_libs=$($pkg_config --libs $vtepackage)
-        vteversion=$($pkg_config --modversion $vtepackage)
-        vte="yes"
-    elif test "$vte" = "yes"; then
-        feature_not_found "vte" "Install libvte-2.90/2.91 devel"
-    else
-        vte="no"
-    fi
-fi
-
 ##########################################
 # RDMA needs OpenFabrics libraries
 if test "$rdma" != "no" ; then
@@ -5486,11 +5464,6 @@ fi
 if test "$have_copy_file_range" = "yes" ; then
     echo "HAVE_COPY_FILE_RANGE=y" >> $config_host_mak
 fi
-if test "$vte" = "yes" ; then
-  echo "CONFIG_VTE=y" >> $config_host_mak
-  echo "VTE_CFLAGS=$vte_cflags" >> $config_host_mak
-  echo "VTE_LIBS=$vte_libs" >> $config_host_mak
-fi
 if test "$virglrenderer" = "yes" ; then
   echo "CONFIG_VIRGL=y" >> $config_host_mak
   echo "VIRGL_CFLAGS=$virgl_cflags" >> $config_host_mak
@@ -6154,7 +6127,7 @@ if test "$skip_meson" = no; then
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir \
+        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/meson.build b/meson.build
index ae40bdf7c4..f3af9ee3cf 100644
--- a/meson.build
+++ b/meson.build
@@ -860,6 +860,7 @@ endif
 
 gtk = not_found
 gtkx11 = not_found
+vte = not_found
 if not get_option('gtk').auto() or (have_system and not cocoa.found())
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
@@ -871,14 +872,22 @@ if not get_option('gtk').auto() or (have_system and not cocoa.found())
                         required: false,
                         kwargs: static_kwargs)
     gtk = declare_dependency(dependencies: [gtk, gtkx11])
+
+    if not get_option('vte').auto() or have_system
+      vte = dependency('vte-2.91', version: '>=0.32.0',
+                       method: 'pkg-config',
+                       required: get_option('vte'),
+                       kwargs: static_kwargs)
+      if not vte.found()
+        vte = dependency('vte-2.90', version: '>=0.32.0',
+                         method: 'pkg-config',
+                         required: get_option('vte'),
+                         kwargs: static_kwargs)
+      endif
+    endif
   endif
 endif
 
-vte = not_found
-if 'CONFIG_VTE' in config_host
-  vte = declare_dependency(compile_args: config_host['VTE_CFLAGS'].split(),
-                           link_args: config_host['VTE_LIBS'].split())
-endif
 x11 = not_found
 if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
@@ -1207,6 +1216,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
 config_host_data.set('CONFIG_GTK', gtk.found())
+config_host_data.set('CONFIG_VTE', vte.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_EBPF', libbpf.found())
@@ -2764,7 +2774,7 @@ summary_info += {'SDL image support': sdl_image.found()}
 summary_info += {'GTK support':       gtk.found()}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
-summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
+summary_info += {'VTE support':       vte.found()}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
 summary_info += {'libtasn1':          tasn1.found()}
diff --git a/meson_options.txt b/meson_options.txt
index f7ec9bee27..8af42987f4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -118,6 +118,8 @@ option('vnc_png', type : 'feature', value : 'auto',
        description: 'PNG compression for VNC server')
 option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
+option('vte', type : 'feature', value : 'auto',
+       description: 'vte support for the gtk UI')
 option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
 option('zstd', type : 'feature', value : 'auto',
-- 
2.31.1



