Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C10515E15
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:14:18 +0200 (CEST)
Received: from localhost ([::1]:58144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknrV-0000e0-5G
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkniu-00076a-HX
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 10:05:25 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkniq-0002g3-W5
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 10:05:22 -0400
Received: by mail-ej1-x62e.google.com with SMTP id j6so20230974ejc.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJxu7WCQ/xCcbHI3JQSo83NN+4n0aIgNjHe2qYzuiPo=;
 b=UtSMhIYk24qEtA4pnF5j3K2VL2H8NclGPrYxS+1YeNiCyMyWBTj7jTkyXZ7R/n44kg
 8uZARM5zgjGxpn75hCSBXrggZL09VR3l3Hh4NPSKCZVY0Fl/WrYxIY31lgD1uCq1Je2E
 BhOt/ShythIK1tn1XZhrVbcgZJ9itsuLcGHnQlztpQdQ8bRYEcN5sAeAxaBMuefwonIF
 xcPveUrPpkKms1HR3r0dNCyJkPktzAzP7QZH6OWHLdfrqPe2fqRy/IulN1gdOastjiz4
 RWvmuqHktl1okv+F2f2lI0/RepCw1RYL8mPmP2eoLkNyMGncu6Wpy5+oQDLu4WWn+USY
 +Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HJxu7WCQ/xCcbHI3JQSo83NN+4n0aIgNjHe2qYzuiPo=;
 b=jHNcWJC8rIPdXd4b7PIZgjacw3cScaWaZPGmDTW51HX0o7UKtt9ziyPeItobpoRDpB
 BHX7c4STOgPrHTsjoko6DvOoXtnwHXy4r6OMgNuNfnFrv/k6H1KGeE5yM9Dxp1GA/Ri8
 Fgw639xbZozw4kYtYmXCnNvgDOEx79iCJ6Sz0r8KErrtCN36yHCZAu4YrCaTrq/yPswi
 2dMLOPb0qHrQ+PqEdbV4jruV/gviPgnFpLGd5jV2jfghx2nKVBPJ0Zg/qeImqsVaozQW
 cnoj1W6B0tT5CDy72LjcdcO85aXbaUVY8OUfmK28q9VXbhI/hyqE3kxztOuGwZ8AsWQH
 1VAA==
X-Gm-Message-State: AOAM5311tw/wGnrKhsMfjPOBqFv6DHtkv9ozdZFVHk2R2W1lxzoO15Xp
 JLO9E0w/zIVtTyoJbhChBwLac5roKEbkGA==
X-Google-Smtp-Source: ABdhPJzW0gnT0CJaxmCLU2RB6VxBVYv+Ij/QxG1E2YvXe0RsZBl6i9CqDsYqfdgpeje1RUEvQDhPFw==
X-Received: by 2002:a17:906:7949:b0:6f3:eefb:6560 with SMTP id
 l9-20020a170906794900b006f3eefb6560mr3973582ejo.373.1651327519581; 
 Sat, 30 Apr 2022 07:05:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa7c55a000000b0042617ba6392sm4101003edr.28.2022.04.30.07.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 07:05:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 19/25] build: move vhost-vsock configuration to Kconfig
Date: Sat, 30 Apr 2022 16:05:16 +0200
Message-Id: <20220430140517.460997-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220430140517.460997-1-pbonzini@redhat.com>
References: <20220430140517.460997-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-vsock and vhost-user-vsock are two devices of their own; it should
be possible to enable/disable them with --without-default-devices, not
--without-default-features.  Compute their default value in Kconfig to
obtain the more intuitive behavior.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                       | 16 ----------------
 hw/virtio/Kconfig                               | 10 ++++++++++
 meson.build                                     |  1 -
 scripts/ci/org.centos/stream/8/x86_64/configure |  1 -
 4 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index d6ddd4f05f..603434fc7f 100755
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
@@ -879,10 +878,6 @@ for opt do
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
@@ -1109,7 +1104,6 @@ cat << EOF
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   vhost-net       vhost-net kernel acceleration support
-  vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
@@ -1549,10 +1543,6 @@ test "$vhost_scsi" = "" && vhost_scsi=$vhost_kernel
 if test "$vhost_scsi" = "yes" && test "$vhost_kernel" != "yes"; then
   error_exit "--enable-vhost-scsi requires --enable-vhost-kernel"
 fi
-test "$vhost_vsock" = "" && vhost_vsock=$vhost_kernel
-if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
-  error_exit "--enable-vhost-vsock requires --enable-vhost-kernel"
-fi
 
 # vhost-user backends
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
@@ -2105,12 +2095,6 @@ fi
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
index 7c52ef135c..8621f84916 100644
--- a/meson.build
+++ b/meson.build
@@ -3691,7 +3691,6 @@ summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNE
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index 08225ee514..54e55ea328 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -136,7 +136,6 @@
 --disable-vhost-user \
 --disable-vhost-user-blk-server \
 --disable-vhost-vdpa \
---disable-vhost-vsock \
 --disable-virglrenderer \
 --disable-virtfs \
 --disable-virtiofsd \
-- 
2.35.1



