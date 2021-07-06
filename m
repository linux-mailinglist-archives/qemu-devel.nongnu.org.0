Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC43BC999
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:24:03 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iFG-0001JN-N6
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htv-0000xO-6e
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htr-0002Ip-8K
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:58 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g10so7313776wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TlOzwIT4gtytQD0QVEnnLxCV4g3S+nSjH2SRuBjT3ZE=;
 b=qHof6KqAAAIEUS51mrgRdc7OgEiuGD9/9uLf4wjOz9R/vKTt+YKgrq2wGzKiblwmLD
 W0maiHDv3aeM5APIuJSv87x5rgT9RbKgyrNop61tUpvtTNWNAYbN5T+NJL/LzRKyPEEz
 rrtjw4g+venEAWoRKS2QIF3cB83gqwc2nSu2cIGX9sviqwEmouZvxWExWozx0ppgEERd
 jM6sEWgTB7Ond1kFPR+tPhDebZGmIVAourtR88msGjdLbrTD3uPfJ5y+Za0GsJYLLdP9
 fjMGvp91HkD6cPXpteVThckJBGGO+FAC5ANY4CaZRpZay10wBxeEgp7rxl5g0Cd7zp1h
 cnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TlOzwIT4gtytQD0QVEnnLxCV4g3S+nSjH2SRuBjT3ZE=;
 b=cJDMphE108puahVqpJqlvjJBjEtJl9jXO58mZQVJfwHxgJof7e5jEDolQW7DG6PmXF
 1DpsDxHJ4PilirdxC7RSz7ha+uoGIyhRRsGCvGP5eyvnLqjh2ZRMEi3Vpyk+Fe4ztC89
 4mQGVZq9dSCWsumVBlIgWjw97ph5eQ6o5UsGFG8T7uHNd/Jjt85MaP+45zQeY5XxQst0
 4Ohk2qbYxE5BogDAblA8SsJL1IboorCAKYMPXtGXwNGSHzRvjRz9yyTIp3oN3SYfczJ5
 YyI669WLgrdig3aQbwAyDfohlFL+gBile0uGfZmsVHhxuOiHN57TD34T+oUwYERdnErt
 zOXQ==
X-Gm-Message-State: AOAM533x2ax9M8uOEpDJK6llX/wOyfhsQ8kj1GZfgVRJKeMClf763UGA
 qwxbV2nKBw1bsxBrauXkwfNEAXvYfA0=
X-Google-Smtp-Source: ABdhPJyMg5p17jflfQVxlh9CZHMFK9BKZDpMeaJ8PVEe0jTpfgVZGl02vOocCS//aKUexT0InZjdrQ==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr3843539wmh.69.1625565713814;
 Tue, 06 Jul 2021 03:01:53 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/40] configure, meson: convert vte detection to meson
Date: Tue,  6 Jul 2021 12:01:18 +0200
Message-Id: <20210706100141.303960-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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



