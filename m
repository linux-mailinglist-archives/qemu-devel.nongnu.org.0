Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1539F4F9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:30:36 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZwI-0003S5-3s
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp9-0006T4-P0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp7-0007yb-Fa
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id f2so21118531wri.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryYpyCa0TSy+bqr+nzscGtPe1ekDpgp26HoVE89U+pY=;
 b=rcP+1Fmo8QBpva58NtbWPYEPlNs7ewvf4xIC9Oq3T/CioghrZWC5y+ZPeMtik6tXb7
 /gh0HoqBaO+UGzDH+z6TToh458R0vj8mruiJbbqWsS7buge+LzfNLwVM6Fc0MF94wUak
 rVKVM0oRtlRgPWWMjA1EQXkORPdjISsJILEVu9a4FuRe56MscV78PHU0W3kR3mo4VFXo
 lNzgfrbgQYA077FKhRnIv7jsyn6YcCjCN8KuLCg+KvWlDj8kYRKjuKRH25mzAWN/ep7P
 ZfeC2MRzwXVfHcKcczo7ayDkoEnY3dFIdXwfVoGdckDX9lTFicm/pTas2XBIFJTPu/dH
 eIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ryYpyCa0TSy+bqr+nzscGtPe1ekDpgp26HoVE89U+pY=;
 b=cMGQ/Hk/xAYrmyu/nwHii4zHhenrfi91yCynBFf1b1K0J+b1wq3VvlSvPDJ2uPLoFm
 T6OZmQFKJ6T9/AIzszkv96CqmAjbwrsZpU/AJjAgZZJHwG4Y/aHA5bIKBI0vFv4wyWsO
 l/vFb9wQYlXpO5FXrLThmCrs5BGcORzC5+be/jfyeAGD3ufAzWHq3DWlqVrZK7z618Js
 qbtgQ8+hyL5r2UT5z7Y3DDHzV4Xp4Wp4wBrdTj+bSoM0jdRxz9lmNuGgqt6PxURkd5OQ
 3AUiud/Np26DmY3l8TceSdUVnWKkq+W/QPVU2VFVq/R5pQJqcNUeCFPU7YnbWC7JYEth
 JDjg==
X-Gm-Message-State: AOAM531RZGDsF+/rRE/8vhODsCTVdazLurwdcdZDk0/aqNCmfVjTHN4n
 +EYJ0BSo0Vx21cYonwMU8k4/KSp36G6dfQ==
X-Google-Smtp-Source: ABdhPJyfiVGbDpmG/pY0X+Lj1LzLr7+FvNN2T8ScD/oifo2bDo6UY0HoMkPMdj66VRQ+BDMkOV8gIg==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr22237625wry.4.1623151388282; 
 Tue, 08 Jun 2021 04:23:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/26] configure, meson: convert libusb detection to meson
Date: Tue,  8 Jun 2021 13:22:41 +0200
Message-Id: <20210608112301.402434-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
 configure          | 27 ++++-----------------------
 hw/usb/meson.build |  2 +-
 meson.build        | 11 +++++++----
 meson_options.txt  |  2 ++
 4 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index d3c2e8ccaf..651273c023 100755
--- a/configure
+++ b/configure
@@ -374,7 +374,7 @@ spice_protocol="auto"
 rbd="auto"
 smartcard="$default_feature"
 u2f="auto"
-libusb="$default_feature"
+libusb="auto"
 usb_redir="$default_feature"
 opengl="$default_feature"
 cpuid_h="no"
@@ -1285,9 +1285,9 @@ for opt do
   ;;
   --enable-u2f) u2f="enabled"
   ;;
-  --disable-libusb) libusb="no"
+  --disable-libusb) libusb="disabled"
   ;;
-  --enable-libusb) libusb="yes"
+  --enable-libusb) libusb="enabled"
   ;;
   --disable-usb-redir) usb_redir="no"
   ;;
@@ -3994,20 +3994,6 @@ if test "$smartcard" != "no"; then
     fi
 fi
 
-# check for libusb
-if test "$libusb" != "no" ; then
-    if $pkg_config --atleast-version=1.0.13 libusb-1.0; then
-        libusb="yes"
-        libusb_cflags=$($pkg_config --cflags libusb-1.0)
-        libusb_libs=$($pkg_config --libs libusb-1.0)
-    else
-        if test "$libusb" = "yes"; then
-            feature_not_found "libusb" "Install libusb devel >= 1.0.13"
-        fi
-        libusb="no"
-    fi
-fi
-
 # check for usbredirparser for usb network redirection support
 if test "$usb_redir" != "no" ; then
     if $pkg_config --atleast-version=0.6 libusbredirparser-0.5; then
@@ -5626,12 +5612,6 @@ if test "$smartcard" = "yes" ; then
   echo "SMARTCARD_LIBS=$libcacard_libs" >> $config_host_mak
 fi
 
-if test "$libusb" = "yes" ; then
-  echo "CONFIG_USB_LIBUSB=y" >> $config_host_mak
-  echo "LIBUSB_CFLAGS=$libusb_cflags" >> $config_host_mak
-  echo "LIBUSB_LIBS=$libusb_libs" >> $config_host_mak
-fi
-
 if test "$usb_redir" = "yes" ; then
   echo "CONFIG_USB_REDIR=y" >> $config_host_mak
   echo "USB_REDIR_CFLAGS=$usb_redir_cflags" >> $config_host_mak
@@ -6214,6 +6194,7 @@ if test "$skip_meson" = no; then
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
+        -Dlibusb=$libusb \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index f357270d0b..bd3f8735b9 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -72,7 +72,7 @@ if config_host.has_key('CONFIG_USB_REDIR')
 endif
 
 # usb pass-through
-softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_USB_LIBUSB', libusb],
+softmmu_ss.add(when: ['CONFIG_USB', libusb],
                if_true: files('host-libusb.c'),
                if_false: files('host-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('host-stub.c'))
diff --git a/meson.build b/meson.build
index 0d4b6fff16..2a4a47d281 100644
--- a/meson.build
+++ b/meson.build
@@ -991,10 +991,12 @@ if 'CONFIG_USB_REDIR' in config_host
                                 link_args: config_host['USB_REDIR_LIBS'].split())
 endif
 libusb = not_found
-if 'CONFIG_USB_LIBUSB' in config_host
-  libusb = declare_dependency(compile_args: config_host['LIBUSB_CFLAGS'].split(),
-                              link_args: config_host['LIBUSB_LIBS'].split())
+if not get_option('libusb').auto() or have_system
+  libusb = dependency('libusb-1.0', required: get_option('libusb'),
+                      version: '>=1.0.13', method: 'pkg-config',
+                      kwargs: static_kwargs)
 endif
+
 libpmem = not_found
 if 'CONFIG_LIBPMEM' in config_host
   libpmem = declare_dependency(compile_args: config_host['LIBPMEM_CFLAGS'].split(),
@@ -1213,6 +1215,7 @@ config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
+config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -2793,7 +2796,7 @@ summary_info += {'rbd support':       rbd.found()}
 summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': config_host.has_key('CONFIG_SMARTCARD')}
 summary_info += {'U2F support':       u2f.found()}
-summary_info += {'libusb':            config_host.has_key('CONFIG_USB_LIBUSB')}
+summary_info += {'libusb':            libusb.found()}
 summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
diff --git a/meson_options.txt b/meson_options.txt
index ac6e90da07..02c14d4751 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -86,6 +86,8 @@ option('gcrypt', type : 'feature', value : 'auto',
        description: 'libgcrypt cryptography support')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
+option('libusb', type : 'feature', value : 'auto',
+       description: 'libusb support for USB passthrough')
 option('lzfse', type : 'feature', value : 'auto',
        description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
-- 
2.31.1



