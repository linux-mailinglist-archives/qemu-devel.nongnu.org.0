Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28EC50CA7C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:16:48 +0200 (CEST)
Received: from localhost ([::1]:39232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFd2-0001CB-0E
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFy-0007VJ-HZ
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:53:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFw-0005Dh-UB
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:58 -0400
Received: by mail-ed1-x529.google.com with SMTP id p18so8282962edr.7
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDnImgCAgaRY7z2Eq1k1yAkMOPoehsLN+hIZ3vkai8I=;
 b=ABgjccIfpeaLdNFz/71aiHHmy2obf9EoTq1buk91t0mwWyRbaiMbTifLVkT67OPxyt
 +Hdh7YpYYF3eZuT0kMHUZxPekabVOv2C7LW/VqqULj2lE/QkRSjsiL05mxOL51497Cuj
 dCfpEEXRV8d7cCEC4XPp52Bs3ROWV0KwceTmqkAwW3y/O/v879hQsKes69/TGMmHaH7H
 MCb/abA641qIolibIN+02hogA9NRNVcXcty1t40WUiTkbe7KZ3dzbqrEGVvl+hL8DYNm
 i7UC8F7qXvU36fWZFERt7we1VY9EKrvzt0CVrMEUR6JyhSY9g2rCXKqbehlf6WEGQhc8
 tNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MDnImgCAgaRY7z2Eq1k1yAkMOPoehsLN+hIZ3vkai8I=;
 b=kO0OdF0kEPOFz8zL9wdaxLh31i5h1pxPvrosrZMAELr1gaswjw0a9fMmGuti6crcNj
 0ERizU0OGsjTGpG+HT/Pt0Z3qyT2yf8U4+7SmZpcYRBgKMAXHiMKtgQ/8Q/t3EshnuMG
 lIT/h9JUEUYdO/XJE7mQ4iZAuZ3dDb4OpjEXdr4yWw6xGLpW8gAzig9zNb77+VoLGYBZ
 v9EaahO0ECmOiY0pxfDiwsBSmaVPAuZrDdHYrSV+PGHu7ZAtUVdNbbEmR9Eu2ZOg8V3P
 ekDHc9wrHzpAXuY70GjdvCglk1oKH8VcWNI6ISkccz7lG5WbxN0zFl2h/66GerIbhci4
 69sg==
X-Gm-Message-State: AOAM531veHS8IMzt23+x2eEMsu8KA/Yzh6Ra70l3P14gDZC46seb1n1c
 SOG5V2GqcNTKSs4k6jXlUssUlrrJecgq3g==
X-Google-Smtp-Source: ABdhPJzudpocQPGQN1rYO1juvyD/GIxPTP7e0AuO6t19m4FtdVelWdN6whT6F3H3utr8QH7aW2zh1Q==
X-Received: by 2002:a05:6402:3584:b0:423:e4d0:34f with SMTP id
 y4-20020a056402358400b00423e4d0034fmr10027651edc.72.1650718375621; 
 Sat, 23 Apr 2022 05:52:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/34] build: move vhost-vsock configuration to Kconfig
Date: Sat, 23 Apr 2022 14:51:46 +0200
Message-Id: <20220423125151.27821-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-vsock and vhost-user-vsock are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 16 ----------------
 hw/virtio/Kconfig | 10 ++++++++++
 meson.build       |  1 -
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index c5bffcf703..18b18a6551 100755
--- a/configure
+++ b/configure
@@ -286,7 +286,6 @@ vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
-vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
@@ -878,10 +877,6 @@ for opt do
   ;;
   --enable-vhost-scsi) vhost_scsi="yes"
   ;;
-  --disable-vhost-vsock) vhost_vsock="no"
-  ;;
-  --enable-vhost-vsock) vhost_vsock="yes"
-  ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
@@ -1108,7 +1103,6 @@ cat << EOF
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   vhost-net       vhost-net kernel acceleration support
-  vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
@@ -1548,10 +1542,6 @@ test "$vhost_scsi" = "" && vhost_scsi=$vhost_kernel
 if test "$vhost_scsi" = "yes" && test "$vhost_kernel" != "yes"; then
   error_exit "--enable-vhost-scsi requires --enable-vhost-kernel"
 fi
-test "$vhost_vsock" = "" && vhost_vsock=$vhost_kernel
-if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
-  error_exit "--enable-vhost-vsock requires --enable-vhost-kernel"
-fi
 
 # vhost-user backends
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
@@ -2104,12 +2094,6 @@ fi
 if test "$vhost_crypto" = "yes" ; then
   echo "CONFIG_VHOST_CRYPTO=y" >> $config_host_mak
 fi
-if test "$vhost_vsock" = "yes" ; then
-  echo "CONFIG_VHOST_VSOCK=y" >> $config_host_mak
-  if test "$vhost_user" = "yes" ; then
-    echo "CONFIG_VHOST_USER_VSOCK=y" >> $config_host_mak
-  fi
-fi
 if test "$vhost_kernel" = "yes" ; then
   echo "CONFIG_VHOST_KERNEL=y" >> $config_host_mak
 fi
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index c144d42f9b..b642ae1081 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -59,6 +59,16 @@ config VIRTIO_MEM
     depends on VIRTIO_MEM_SUPPORTED
     select MEM_DEVICE
 
+config VHOST_VSOCK
+    bool
+    default y
+    depends on VIRTIO && VHOST_KERNEL
+
+config VHOST_USER_VSOCK
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
+
 config VHOST_USER_I2C
     bool
     default y
diff --git a/meson.build b/meson.build
index 6913ab0251..a2de079801 100644
--- a/meson.build
+++ b/meson.build
@@ -3689,7 +3689,6 @@ summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNE
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.35.1



