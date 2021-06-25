Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A373B45A1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:33:18 +0200 (CEST)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmtR-0003jW-6j
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfD-0002z8-A5
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfA-0003AJ-W0
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id o11so2223504ejd.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xs9h6JVvEzIMS5Kp/ZSehjw8VqtorUSKIK1nTr/EzMM=;
 b=AigWCR7U8GmDuRneXJjhm111zMfyZgEZN277tSuxHFmMsbp6swxAP/yctgYBWWfOGg
 cRrhhwpwVp48DwY/4Ul1ryTIgNnDj8oH+gAEqHHT9VBXJMjICNkf+FF1nYikiAuDulDj
 svbkpmgY/MT9iBFIkxyyJpFdjP9ugyyT0KCVdqzZEHgNGQ5zCSIj0Tj9CtJ4tgpoBCgL
 qusSEj2hKDboPyBYbq/MoKUBkxhtPz7I9LSYBatRhBjrpQE0yydR1EQ2nQ7Lw70jgitL
 Bv0jim0goC1qgZ0z8sQstuEV5B8ef12juP95kPh1o5QmaEAGvWB7I2fu50FIXvUC25p7
 HJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xs9h6JVvEzIMS5Kp/ZSehjw8VqtorUSKIK1nTr/EzMM=;
 b=EqDcelgWqzZaZdIsRxFcB+aCqTwMzR76AJlBPg+W2fPruKzyupgLex6xRQBGxLuQv2
 eqDiX99s2UAXsXVEUe3OKllyMBVvWPIV9+MdXEXz7Sso5X9iijZdQDun4xhMzqF66BS7
 OQJnQfpSMIh7mJluFoadnjVrAglu4pGS1oa2AtDrzs/QWBTVhbnYywnOHekiDN21zAtJ
 4EHpiXxBUB/SNM7vS6wy8a2DjA9E7N3NU7sBzp3AXRyi/4RMOlocJWeKEgFj+ov4rUB3
 iKeDopwR89X9sERtlqN9UF2175iuWsvE37H/V+2csW2l49zcVOA2NYk4RS3wBr+Wuz4x
 /s/Q==
X-Gm-Message-State: AOAM531mHoCcvdW0JZPUsLEx0ol8zow5K09kJsNxOscg01Wh/dpVFwfu
 zHZpfg8vzWCcKLCVKo1FQiLeH5FlPM8=
X-Google-Smtp-Source: ABdhPJzAbPofI186io/sUrHdpHe0K9BW5uS7bq+soczPpsqFwZUctvruL/Abx5SK0XRtcJvjB61UcQ==
X-Received: by 2002:a17:906:2c43:: with SMTP id
 f3mr10874405ejh.505.1624630711693; 
 Fri, 25 Jun 2021 07:18:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] configure, meson: convert libusb detection to meson
Date: Fri, 25 Jun 2021 16:18:03 +0200
Message-Id: <20210625141822.1368639-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
 configure          | 27 ++++-----------------------
 hw/usb/meson.build |  2 +-
 meson.build        | 11 +++++++----
 meson_options.txt  |  2 ++
 4 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index 237e99c3d0..e54d06b99e 100755
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
@@ -5631,12 +5617,6 @@ if test "$smartcard" = "yes" ; then
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
@@ -6215,6 +6195,7 @@ if test "$skip_meson" = no; then
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
index d3025e05fc..0b4b55b9da 100644
--- a/meson.build
+++ b/meson.build
@@ -992,10 +992,12 @@ if 'CONFIG_USB_REDIR' in config_host
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
@@ -1211,6 +1213,7 @@ config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
+config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -2780,7 +2783,7 @@ summary_info += {'rbd support':       rbd.found()}
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



