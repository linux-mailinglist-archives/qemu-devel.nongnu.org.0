Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517493B1A1F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:29:41 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw20i-00022X-DI
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m8-0003zl-Eq
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m6-00023C-Hj
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id ji1so3701486ejc.4
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFzdldg2EyRCSItr1sneSdB29YIgEZbKKLYDNLVcEbA=;
 b=LsJGpLHUvEEBdrtzzkfzc+Vbz2JbDTUWsPOSFkKjjTDi6BFkhjtGIijLs49ARfTkuz
 YTNhxyarA8QknfqxxIAnDmpVpzsKbKaB/gIl2Cb6QCj4f61NDqLcvNjIUDFUxWwhew0m
 8lMbivU1Dy0sx9Jco9FA9RM8t+TOae3JCo+gHxVoWtb7mgKUyV++SFNtqysgZsZEOsIy
 Luvm06Xj/dLbl96xwB3XHNVXvQtXUAerGBeIP3nNLtoboPCSgqJiU5XtyQ+9s9VS2Ii+
 yPKw3/g2RlgEBm9v3cSCl/Paheuc/Iy/nBvEi67QYfAiVR2dVCKr6H5KZ3QHWYt9JQJ2
 qYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kFzdldg2EyRCSItr1sneSdB29YIgEZbKKLYDNLVcEbA=;
 b=o2Dt/2+DZGnnfSLV1Dn+VCrUraeG2hcbyEIfYM2ceruVTWarmnwZLskv3/SaiQ30eI
 oUD9+HVeQcyumqweClP0WMrLj+oO1DFgRQIQoC7OTq8UcGFaT7oIkK5lZGDCoi8tIsRV
 AXIo/9TXuHtPqtQ3ZDdh6X6ICRN2Zr/4IXXIk/0RuMQk3Xt7WxfWDPEz44m4DeQb0b5C
 GY59uFa+jCODMm8J8BlQB+TJHLnZV5XOSuKf/z4hiWrzdrAmqEnk6aUFZbzPjm7LEpWS
 WsqOLHVz7Uf/m6ieDMdderQVoYAruWEfvIuo9pi+/M76/fE46YUiKNabH3vmToP/sZnI
 Z6Iw==
X-Gm-Message-State: AOAM532w4GIfolobzq4TGVV3lXOW89j8b6GemxUwAlQBVkL9akCS8ENS
 XIt/D4aH1fv1QGEl8Z44mLt8QJdHQ30=
X-Google-Smtp-Source: ABdhPJwuwaCm3XM6r4VUOgx9hVUB0oUvaz4df6WiRrWmPNqYF++nd9HR8/X0Fdb9wj1knjj6vyPOxw==
X-Received: by 2002:a17:907:da4:: with SMTP id
 go36mr9421822ejc.21.1624450473193; 
 Wed, 23 Jun 2021 05:14:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] configure, meson: convert libusbredir detection to meson
Date: Wed, 23 Jun 2021 14:14:23 +0200
Message-Id: <20210623121424.1259496-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure          | 28 ++++------------------------
 hw/usb/meson.build |  2 +-
 meson.build        |  9 +++++----
 meson_options.txt  |  2 ++
 4 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/configure b/configure
index 02b0acc1f5..e799d908a3 100755
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
 
@@ -5597,12 +5583,6 @@ if test "$spice" = "yes" ; then
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
@@ -6175,7 +6155,7 @@ if test "$skip_meson" = no; then
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
index 3172b7e63d..c8505bb367 100644
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
@@ -2784,7 +2785,7 @@ summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
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



