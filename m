Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F23BC16C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:11:35 +0200 (CEST)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RBy-00009s-6M
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1H-0001Du-Qk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1E-0003Zx-EP
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id n9so5307566wrs.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03obOzQzFKxxGK58An9x0R6rMsF9scgR64kQ9BUIJJE=;
 b=MDZN7UNIt+agyCv8SQsPZTJ/kOWhD2XUYEsmpMvlKy1FQd4JDy3gUXYXVXu6v3RMCP
 LVgc3TAXWyHSREX1WX+orVeMUkQXSr5EJ1Y5Tu5RdTFlEUQnfvn6L4VZWXVgchM6Vr6c
 2n0ASNSdaC+f3fnho6tZs422v7+Tmpp9tfljj9pEJgUeBIxdDK8UYHweN2cyAA6VlYMt
 G+K+b5edAvMPUkOEhCxjvrKMfis6sCWD1AsLr0f0IGBrdo7geTm2Poxa/EAwVeNndwB9
 awzUQQP5kJ2ix7ysjpxBHi4plA//Tc7ICwIEvVeV8KtOenJvLa4uTOtsDoQ1ZdNPti9P
 khNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=03obOzQzFKxxGK58An9x0R6rMsF9scgR64kQ9BUIJJE=;
 b=YtnDFWL+4bbhIgN7oFPmswycs7CW64ghU21WFX4fc91kJSJVEvxWnA54/hKMCk8eNd
 v5TpbtKDG9i1s5vQIHjaxX8sk4jSsHLmkGbxq8zQO9kTw6wUSxSqOxgjAXxJgbcu85of
 iveI4B9rbW5ozBjOETUh5jNYCyHXQy8KoHsfCMTMVoExZ+Pr+DnozAUf3MEojon2a9b0
 kG+QbjN03F9E/1EpAyLVYlb1rFbXneqqcYoeJQk/BNGP5AmLPrq+JltyyWnqsIvhGS31
 nXdbOZJjswPJFLdXvR9aX2D8wi8bL6AGC2bvyMhsON9/1ycAeC0WISNYDnciA89tVu3Z
 x2aw==
X-Gm-Message-State: AOAM532e63aLrFhoyQ2zL4Y7hTq6g/uorb7OEh/V9cpjywF2muEJ5fKv
 AxWE8XBT9hxCHZvFgQCRhhWf3bbc4Vc=
X-Google-Smtp-Source: ABdhPJzhJjfX9wFdLYLggSfXjXxPZ6YP6WgvZOucx9t4EtGskA3rdSMkh5IhaHzWDe7xo9lOLnFAsg==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr16520991wrn.99.1625500821679; 
 Mon, 05 Jul 2021 09:00:21 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.21 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] configure, meson: convert vte detection to meson
Date: Mon,  5 Jul 2021 18:00:03 +0200
Message-Id: <20210705160018.241397-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 29 ++++-------------------------
 meson.build       | 16 ++++++++++------
 meson_options.txt |  2 ++
 3 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 27841f82ed..fe86da4fdd 100755
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
@@ -2799,22 +2799,6 @@ EOF
   fi
 fi
 
-##########################################
-# VTE probe
-
-if test "$vte" != "no"; then
-    if $pkg_config --exists "vte-2.91"; then
-        vte_cflags=$($pkg_config --cflags vte-2.91)
-        vte_libs=$($pkg_config --libs vte-2.91)
-        vteversion=$($pkg_config --modversion vte-2.91)
-        vte="yes"
-    elif test "$vte" = "yes"; then
-        feature_not_found "vte" "Install libvte-2.91 devel"
-    else
-        vte="no"
-    fi
-fi
-
 ##########################################
 # RDMA needs OpenFabrics libraries
 if test "$rdma" != "no" ; then
@@ -5482,11 +5466,6 @@ fi
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
@@ -6149,7 +6128,7 @@ if test "$skip_meson" = no; then
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir \
+        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/meson.build b/meson.build
index db6789af9c..b15c1ee4fd 100644
--- a/meson.build
+++ b/meson.build
@@ -860,6 +860,7 @@ endif
 
 gtk = not_found
 gtkx11 = not_found
+vte = not_found
 if not get_option('gtk').auto() or (have_system and not cocoa.found())
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
@@ -871,14 +872,16 @@ if not get_option('gtk').auto() or (have_system and not cocoa.found())
                         required: false,
                         kwargs: static_kwargs)
     gtk = declare_dependency(dependencies: [gtk, gtkx11])
+
+    if not get_option('vte').auto() or have_system
+      vte = dependency('vte-2.91',
+                       method: 'pkg-config',
+                       required: get_option('vte'),
+                       kwargs: static_kwargs)
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
@@ -1208,6 +1211,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
 config_host_data.set('CONFIG_GTK', gtk.found())
+config_host_data.set('CONFIG_VTE', vte.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_EBPF', libbpf.found())
@@ -2756,7 +2760,7 @@ summary_info += {'SDL image support': sdl_image.found()}
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



