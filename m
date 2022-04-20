Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14F508D1A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:20:19 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD3x-0006yX-Lf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM5-00029I-7G
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM2-00011D-7N
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g18so2768215wrb.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6YeEYNXxiEZk3H4p+EBnu8YAIb1J5C6cGP3OatBH70=;
 b=Kyj7QMoK/+la7pQzkxx/b1P8uzJvfPvPBFW7jy+5SlpWYe1vFbEVDVgU/SfHW8Ry+7
 Hf/ejQZC3qx9KU1AJlFLOvbr1pu/tUFAC5ZPmyA9c4rRjFeyz1F23a+KZkf3inQv6y2W
 w7drb94Tt7h0gXlIycChfv4sKGK14iycsWKaRe4IqeF/ld04CP7IuAPL6hb52noyajz/
 EKrSThscKA7ZOnidqDFgzLCbD30MkvKIIvg98ctYQ3vGi4xw+5ysXn72Egz2WCnbze8H
 tvKUe8CF+n3XvbhaCf44NLtVf/UxZ/KTITIDpLGd/bx3EgP6w2d0m8ioDSRb5AJsvD9V
 tQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X6YeEYNXxiEZk3H4p+EBnu8YAIb1J5C6cGP3OatBH70=;
 b=jIKVuclt08xBJAXQRqhTg8dLD2rLyrpqUjRqLK/Yaif3HMifgUq57HLd5Bl01IWz9g
 E6/5L5hEgcW3R6t/RzpFjpFQBT/j5OGA21UWT17dbtm1oyQf0pr0Q+TS/FdgpHAW1XAP
 F4pVJsAAH3FqNc5w/J6sx9gOPM9bwx4RmNuHo4mcwe7qyMBeG7BIMdEwXRi7dgagMKEv
 JGJRjjQ454BvW1RMlTj2BxzbUcvK4W9VA7DiNuM/kzYEu/ggoukGyPUuQXn3OG4LgFQp
 mNYnYeyzxQBaxTxRZIv+wBJkmIjWAsTaC7NmNH3tqZCbZaVNQcBi5dEOBbbvMmtf8WAe
 njRA==
X-Gm-Message-State: AOAM532LQWrOmM0JSnDa/a1RiQb5TxeQYvSEVlMUv5A85O1tHnvzNWfT
 Xq0j9/6+HuIyYSj/eQuZoToyuI7aw1WNhQ==
X-Google-Smtp-Source: ABdhPJw/jjA2FUmub25Fg1cgT8Nbk2RHF8XzEIYuCm104YO0vJyd9IXekQohkm4FxvZHd6A2c1ClBw==
X-Received: by 2002:a05:6000:144a:b0:20a:a329:aa46 with SMTP id
 v10-20020a056000144a00b0020aa329aa46mr8116528wrx.36.1650468892595; 
 Wed, 20 Apr 2022 08:34:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/34] build: move vhost-vsock configuration to Kconfig
Date: Wed, 20 Apr 2022 17:34:02 +0200
Message-Id: <20220420153407.73926-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-vsock and vhost-user-vsock are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 16 ----------------
 hw/virtio/Kconfig | 10 ++++++++++
 meson.build       |  1 -
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 2aa4dc3ce1..a3b57877e5 100755
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
index ff5c076805..033d0c9aa1 100644
--- a/meson.build
+++ b/meson.build
@@ -3678,7 +3678,6 @@ summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNE
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-- 
2.35.1



