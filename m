Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CC3B19C1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:19:24 +0200 (CEST)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1ql-0003CP-AX
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m7-0003xc-Md
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:35 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m5-000230-Ru
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id h17so3111090edw.11
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d32XUzLMeRriXItMsV+5xfA+70J9flcGtyFqi4t8lOc=;
 b=HHwI4lsinn2ua4/Ze5YpDoLU+2/pJ8hq5s52mBZi5YciOjxEHuWyB5QjpK6o3IQ/LP
 KYfOd17Jru5J3p3YjPC4J10hKSWXByEmNZmgMwV6QCj03LrGjfkqpkDv+m9hvdQM4iPn
 eQRhalxSqIysLOiE6NJRWXeNytFyhu7lkmuYKUdE94EQo6aLhI8NLdp635TSjcctPRw6
 +ag3x3VuWheec7DP74BYXHb/vbDDwNhTp6aF/v2tHn1hGWeG42aa/znVmVwVeTvuq2KZ
 eLfaewL5gnmPK4swbfApBuaItf9CVQvI2oTKRxZq3z0nAnZc9FIWnFUNRZMeNIuPxYm8
 tbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d32XUzLMeRriXItMsV+5xfA+70J9flcGtyFqi4t8lOc=;
 b=QmHD6Jv7wEWGqrnbOroX23PzNwtFjsQGKiIWhabIGBd8EUY6UGa0xAfi/KR1dn2Rij
 tYlSfJ/Bf+/3JiWx+C00x1VJZvSUr3z2Ra3jVsJ7gT+r88MkFr6hFX7Dw6GS5Ud/NYKY
 LsEIodXu7tRhVgCqGWRQVy2quzZB/zYZbIuA6g66bP8+FhBqK/QcxDcMXosNqjCD3iBq
 LjCSGkAxntMQeZIC8mklO34DRn3YTkM1yA5QwnZgqEgC30SOru5XGTNTV9xIVSZJTWA1
 KGXg11PuR/x/j5n5jZVigl6y9siVi6Zoan+M9v9BP6q7e5fzTwekupXNxxI45zuJeHoc
 wasQ==
X-Gm-Message-State: AOAM5337vZbbls0expcw7Td/A/i4Q6XIoU0adkeYaUit92WFDk6oFq4m
 3gSA5uqMPCqmVGaaD6MTYpiyZ1ylunc=
X-Google-Smtp-Source: ABdhPJwu0Ou0BKLrrl2WjycQE6Kkk9d6SlNiJf1qkRMFgc7exR6xE8P1fzQq3DT+P3XYua9eLrpIag==
X-Received: by 2002:aa7:dd57:: with SMTP id o23mr11810521edw.6.1624450472466; 
 Wed, 23 Jun 2021 05:14:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] configure, meson: convert libcacard detection to meson
Date: Wed, 23 Jun 2021 14:14:22 +0200
Message-Id: <20210623121424.1259496-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
index e54d06b99e..02b0acc1f5 100755
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
@@ -5611,12 +5597,6 @@ if test "$spice" = "yes" ; then
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
@@ -6195,7 +6175,7 @@ if test "$skip_meson" = no; then
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
index 58d3a3bdc9..3172b7e63d 100644
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
@@ -2780,7 +2781,7 @@ summary_info += {'bpf support': libbpf.found()}
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



