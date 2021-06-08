Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DAF39F4F6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:29:26 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZvB-0000L3-4p
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpB-0006WG-9L
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp9-0007z4-I9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1632062wmq.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3BHzzehIAd6rLWsdffGUKDOovWe+Q46KfbqgPwO3Ny4=;
 b=d+eDGFdViaoWBKenOh2tf31JJYKlvU0vf47RcMhuOAZhST5BPQwrcDkMjIdzyL8hd4
 w4p4yGV5fGNNAZn0z2Yu15TztX7jpInXIYxpu1pqq6TDq+ZcyFHteOXxmBdpzptbkClU
 Z3tb7OxkB6Zm02R/66cvO9XK2gnxS2zNmGM+3u/ZvVEKyH2ZKn8wMNKEaRGUpXRXloWM
 uMsPVKDckabXrbFcaWLSl3AAKXTJqrjoxzBdNISN7nTsQaL4RqhW0F5OKkRFuRKIujNr
 RM5WF84oAR/Kz3mU2466c2/+gOlRFRqoXUmT2ABvmd6kmTY3GWv5brXgnsNCOf5eww4q
 wVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3BHzzehIAd6rLWsdffGUKDOovWe+Q46KfbqgPwO3Ny4=;
 b=kiLMe9j/NOkCAg+FaOqA7WAzorKBn4T0YKk/AFwhG5AULw3KJKqp4Ytm6OEGnwrksw
 zYZT52EJDPVQKO0nKHph5t9zsxA/ULTNiIeXh7uel/8Har77WQnMlasIOGFSH/6EAEuo
 stRAR+HB0FOIwaRqDXD9399HK8zeTbkmRvxhznLxwk1lhlLufH6FCoZ04fggtMrfYnay
 IB7iUm6CfS55x3CfAGhH3svv8v6TlM7ibEYD535n6Cfg50JTHsBbK61j5piPTFmT+0E+
 6glUwPY6vGwpI55aindqvrw1l/8+KuJmlo6xhmVaP1OIV615nntak2n0I72p8N8qPhMk
 2LZg==
X-Gm-Message-State: AOAM531kPk5SJ369lq59cvBAJzeP6AHyJiSe8kqTXlOjMJtsCeNqeGV5
 +ZUm+rmfeohg8oZr/X2Chj7gDynO4c1JSg==
X-Google-Smtp-Source: ABdhPJyrSQkInCe6YwfCqieCVkEvSGXju1IRi9fn7KUx/xtNXnkh5jenWV/cF5ad1pj1Q9Q8yOgC5w==
X-Received: by 2002:a05:600c:3ba2:: with SMTP id
 n34mr13265634wms.120.1623151390219; 
 Tue, 08 Jun 2021 04:23:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/26] configure, meson: convert libusbredir detection to meson
Date: Tue,  8 Jun 2021 13:22:43 +0200
Message-Id: <20210608112301.402434-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
 configure          | 28 ++++------------------------
 hw/usb/meson.build |  2 +-
 meson.build        |  9 +++++----
 meson_options.txt  |  2 ++
 4 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/configure b/configure
index 591acd0750..9a6217a3bf 100755
--- a/configure
+++ b/configure
@@ -375,7 +375,7 @@ rbd="auto"
 smartcard="auto"
 u2f="auto"
 libusb="auto"
-usb_redir="$default_feature"
+usb_redir="auto"
 opengl="$default_feature"
 cpuid_h="no"
 avx2_opt="$default_feature"
@@ -1289,9 +1289,9 @@ for opt do
   ;;
   --enable-libusb) libusb="enabled"
   ;;
-  --disable-usb-redir) usb_redir="no"
+  --disable-usb-redir) usb_redir="disabled"
   ;;
-  --enable-usb-redir) usb_redir="yes"
+  --enable-usb-redir) usb_redir="enabled"
   ;;
   --disable-zlib-test)
   ;;
@@ -3980,20 +3980,6 @@ EOF
   fi
 fi
 
-# check for usbredirparser for usb network redirection support
-if test "$usb_redir" != "no" ; then
-    if $pkg_config --atleast-version=0.6 libusbredirparser-0.5; then
-        usb_redir="yes"
-        usb_redir_cflags=$($pkg_config --cflags libusbredirparser-0.5)
-        usb_redir_libs=$($pkg_config --libs libusbredirparser-0.5)
-    else
-        if test "$usb_redir" = "yes"; then
-            feature_not_found "usb-redir" "Install usbredir devel"
-        fi
-        usb_redir="no"
-    fi
-fi
-
 ##########################################
 # check if we have VSS SDK headers for win
 
@@ -5592,12 +5578,6 @@ if test "$spice" = "yes" ; then
   echo "SPICE_LIBS=$spice_libs" >> $config_host_mak
 fi
 
-if test "$usb_redir" = "yes" ; then
-  echo "CONFIG_USB_REDIR=y" >> $config_host_mak
-  echo "USB_REDIR_CFLAGS=$usb_redir_cflags" >> $config_host_mak
-  echo "USB_REDIR_LIBS=$usb_redir_libs" >> $config_host_mak
-fi
-
 if test "$opengl" = "yes" ; then
   echo "CONFIG_OPENGL=y" >> $config_host_mak
   echo "OPENGL_CFLAGS=$opengl_cflags" >> $config_host_mak
@@ -6174,7 +6154,7 @@ if test "$skip_meson" = no; then
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dlibusb=$libusb -Dsmartcard=$smartcard \
+        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index df9effbb10..4f24b5274d 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -64,7 +64,7 @@ if u2f.found()
 endif
 
 # usb redirect
-if config_host.has_key('CONFIG_USB_REDIR')
+if usbredir.found()
   usbredir_ss = ss.source_set()
   usbredir_ss.add(when: 'CONFIG_USB',
                   if_true: [usbredir, files('redirect.c', 'quirks.c')])
diff --git a/meson.build b/meson.build
index d2efa6178a..ae40bdf7c4 100644
--- a/meson.build
+++ b/meson.build
@@ -987,9 +987,10 @@ if have_system
                    kwargs: static_kwargs)
 endif
 usbredir = not_found
-if 'CONFIG_USB_REDIR' in config_host
-  usbredir = declare_dependency(compile_args: config_host['USB_REDIR_CFLAGS'].split(),
-                                link_args: config_host['USB_REDIR_LIBS'].split())
+if not get_option('usb_redir').auto() or have_system
+  usbredir = dependency('libusbredirparser-0.5', required: get_option('usb_redir'),
+                        version: '>=0.6', method: 'pkg-config',
+                        kwargs: static_kwargs)
 endif
 libusb = not_found
 if not get_option('libusb').auto() or have_system
@@ -2798,7 +2799,7 @@ summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': cacard.found()}
 summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            libusb.found()}
-summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
+summary_info += {'usb net redir':     usbredir.found()}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
 summary_info += {'libiscsi support':  libiscsi.found()}
diff --git a/meson_options.txt b/meson_options.txt
index cd9374384e..f7ec9bee27 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -108,6 +108,8 @@ option('snappy', type : 'feature', value : 'auto',
        description: 'snappy compression support')
 option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
+option('usb_redir', type : 'feature', value : 'auto',
+       description: 'libusbredir support')
 option('vnc', type : 'feature', value : 'enabled',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
-- 
2.31.1



