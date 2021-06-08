Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0639F4F8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:30:34 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZwH-0003PY-5D
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpA-0006V8-I3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp8-0007yp-NA
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id o127so1587171wmo.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G61MEnWdFvevbLBmfZeLg3VT1jlEJuO/IOD5W0UALKo=;
 b=ukKAZjCs45KFmOKoMhPw8ChpEtqEl8a1LjM1BCjHzMjE/hwKhUBfg/OIgqRXrfBxm0
 7+ATOx96j6scP1ozVCjwsRB9susDzw0LLeJm2qgK3o7vRf0yCTJ0nG5r6NZau8PaqQUx
 FvYHGyWyqraW6zjUU5V0eAIDqowWepiNsr3tLln2R2RUpKuMrk6bBbH4dhKQhG8kZqq+
 hrzJIE+MBFWE5hZb6CSWOQVvv5qw8VNE57Dm9QCdKepXgaYtQAUSWxdu0gH7U9FBhXki
 QZNTtiVgZ78xp3CthNwBpwVsMgUQAra9OI2faKFhAbsZAlfO8AdJXfSfAt5dhY+rGAjr
 VIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G61MEnWdFvevbLBmfZeLg3VT1jlEJuO/IOD5W0UALKo=;
 b=PxT9lgIxO9ZRRzt50TmI5ZfUlkvTDjPC1KOs0KZJrFWB1Qfx5DtavzgGNWJRV8HKNw
 w5yldBEt8pRthYpQb1F69+fkQGQbtj+orpVhkdWPVmZgOlOeYhXExXLCGTSaGdM3e1Su
 DbPW08wLapV9A36iWmT5Uv0f8I/2qc9JmVtlnq4aGyr0u8fgFHfxntOP3tBFe4kNUFgr
 dbW1sEeNb/2cfZdOB+qURmPAme3a9MfJFGIEeQAW7XW3DP12uWOKewMG+xDfx4vIu6AW
 BfOrUhpyxDkTV4mjfqztzfgKFGHLZNjycCEm5kU6QkACUDhh44J0c80yRHOpZM1/iAed
 nDMA==
X-Gm-Message-State: AOAM530BU8y2TnHiSX3br/6SpT0aOSD7NnAYIQTypzr855mAZfq0Llbw
 BVccynDH9Dw1UK8CDbWy8gNjc9GoiAjnuw==
X-Google-Smtp-Source: ABdhPJyfYnBe1A3TjIHxePHyoitCaoVA/49D7YH5Np6SXDb2CX+o/CxTTXzodX+nTc6kkcPmyT8rTw==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr21261272wmh.104.1623151389312; 
 Tue, 08 Jun 2021 04:23:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/26] configure, meson: convert libcacard detection to meson
Date: Tue,  8 Jun 2021 13:22:42 +0200
Message-Id: <20210608112301.402434-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
index 651273c023..591acd0750 100755
--- a/configure
+++ b/configure
@@ -372,7 +372,7 @@ trace_file="trace"
 spice="$default_feature"
 spice_protocol="auto"
 rbd="auto"
-smartcard="$default_feature"
+smartcard="auto"
 u2f="auto"
 libusb="auto"
 usb_redir="$default_feature"
@@ -1277,9 +1277,9 @@ for opt do
   ;;
   --enable-xfsctl) xfs="yes"
   ;;
-  --disable-smartcard) smartcard="no"
+  --disable-smartcard) smartcard="disabled"
   ;;
-  --enable-smartcard) smartcard="yes"
+  --enable-smartcard) smartcard="enabled"
   ;;
   --disable-u2f) u2f="disabled"
   ;;
@@ -3980,20 +3980,6 @@ EOF
   fi
 fi
 
-# check for smartcard support
-if test "$smartcard" != "no"; then
-    if $pkg_config --atleast-version=2.5.1 libcacard; then
-        libcacard_cflags=$($pkg_config --cflags libcacard)
-        libcacard_libs=$($pkg_config --libs libcacard)
-        smartcard="yes"
-    else
-        if test "$smartcard" = "yes"; then
-            feature_not_found "smartcard" "Install libcacard devel"
-        fi
-        smartcard="no"
-    fi
-fi
-
 # check for usbredirparser for usb network redirection support
 if test "$usb_redir" != "no" ; then
     if $pkg_config --atleast-version=0.6 libusbredirparser-0.5; then
@@ -5606,12 +5592,6 @@ if test "$spice" = "yes" ; then
   echo "SPICE_LIBS=$spice_libs" >> $config_host_mak
 fi
 
-if test "$smartcard" = "yes" ; then
-  echo "CONFIG_SMARTCARD=y" >> $config_host_mak
-  echo "SMARTCARD_CFLAGS=$libcacard_cflags" >> $config_host_mak
-  echo "SMARTCARD_LIBS=$libcacard_libs" >> $config_host_mak
-fi
-
 if test "$usb_redir" = "yes" ; then
   echo "CONFIG_USB_REDIR=y" >> $config_host_mak
   echo "USB_REDIR_CFLAGS=$usb_redir_cflags" >> $config_host_mak
@@ -6194,7 +6174,7 @@ if test "$skip_meson" = no; then
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dlibusb=$libusb \
+        -Dlibusb=$libusb -Dsmartcard=$smartcard \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index bd3f8735b9..df9effbb10 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -49,7 +49,7 @@ softmmu_ss.add(when: ['CONFIG_POSIX', 'CONFIG_USB_STORAGE_MTP'], if_true: files(
 # smartcard
 softmmu_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true: files('dev-smartcard-reader.c'))
 
-if config_host.has_key('CONFIG_SMARTCARD')
+if cacard.found()
   usbsmartcard_ss = ss.source_set()
   usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD',
                       if_true: [cacard, files('ccid-card-emulated.c', 'ccid-card-passthru.c')])
diff --git a/meson.build b/meson.build
index 2a4a47d281..d2efa6178a 100644
--- a/meson.build
+++ b/meson.build
@@ -975,9 +975,10 @@ if 'CONFIG_XEN_BACKEND' in config_host
                            link_args: config_host['XEN_LIBS'].split())
 endif
 cacard = not_found
-if 'CONFIG_SMARTCARD' in config_host
-  cacard = declare_dependency(compile_args: config_host['SMARTCARD_CFLAGS'].split(),
-                              link_args: config_host['SMARTCARD_LIBS'].split())
+if not get_option('smartcard').auto() or have_system
+  cacard = dependency('libcacard', required: get_option('smartcard'),
+                      version: '>=2.5.1', method: 'pkg-config',
+                      kwargs: static_kwargs)
 endif
 u2f = not_found
 if have_system
@@ -2794,7 +2795,7 @@ summary_info += {'bpf support': libbpf.found()}
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
 summary_info += {'rbd support':       rbd.found()}
 summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
-summary_info += {'smartcard support': config_host.has_key('CONFIG_SMARTCARD')}
+summary_info += {'smartcard support': cacard.found()}
 summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            libusb.found()}
 summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
diff --git a/meson_options.txt b/meson_options.txt
index 02c14d4751..cd9374384e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -102,6 +102,8 @@ option('sdl_image', type : 'feature', value : 'auto',
        description: 'SDL Image support for icons')
 option('seccomp', type : 'feature', value : 'auto',
        description: 'seccomp support')
+option('smartcard', type : 'feature', value : 'auto',
+       description: 'CA smartcard emulation support')
 option('snappy', type : 'feature', value : 'auto',
        description: 'snappy compression support')
 option('u2f', type : 'feature', value : 'auto',
-- 
2.31.1



