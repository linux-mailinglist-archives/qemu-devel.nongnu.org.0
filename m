Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C0508D39
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:26:23 +0200 (CEST)
Received: from localhost ([::1]:38676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD9q-0002Dt-Og
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM6-0002Av-OI
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:35:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM5-00011u-5R
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bv16so2769089wrb.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9QVfTgIB1vwAMcs7awvqyPjLD3CHyqK31FD2jUQMSE=;
 b=S7lKrZJWJYw1cuBOueiC2sIvvlg0m6wPUlnq5GtOwNzvf/XWOZiadHTqnRQI4Lvbb2
 DhzhUpqe+kMvl8SkZwNrW/jW/NfF2arYXy7zSgLgz1XFwy4k9Z4DATKicTKXHIQtK9QU
 q+UDBFGSSHZ7gHi0NCC16pgCCImcOWaVvlXCAKpYAhYZPLpLtE0NIUr94UWpcc3VVWQB
 Mbh8N1Q3x+2qGN9l+YeD83ICdmf/bTDqBdLHz9/pIbmvZ172rFH3R1h/UoSr37NgL5rd
 WR4j78td1qSigpJ+YKmo4KbinZx29YgUhU2dxNX/DePMM8Ev828QIOKV1pkJ8yWRU1m/
 IxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p9QVfTgIB1vwAMcs7awvqyPjLD3CHyqK31FD2jUQMSE=;
 b=vLqKfJmM9rPFbplnlJ2WS0YTD+ndmoBEQgXKjIH7ddusDoBcxtsaVBCjIm0tJEmtoP
 HL5dvfKuWz1QP3fOhC0Ws8YGMfs6u48n9gqnZ5D7FbTJpfxfDPhjlpZQBzmTNxr8I4Ud
 /wzHclW7HiT8j26AueD9e+WA0z/i1v1ZzjlIQOWE6PD/DRYEIILA3FK/nl39IpXkH6co
 zEI3wGY0yi/a41pXVM1PWhGHpf0NE+YMtwPXxdOnPeWfN4kWZC8fViHQUz4RUb2rSiZy
 vUYjCfVEzzc7tk7eYr/XPxERKkyl+Ev+kO9po1dks9oWnnWq8W+0vItpo754ZmTJkE/D
 o4dQ==
X-Gm-Message-State: AOAM531XCpJQZE4lSGOzTex58d9B68bGja+Ygw23qI30e08F7Q0FE2qy
 Za/xhZIh4YGzHb4UaoDsSDdCYygmbH+ZPw==
X-Google-Smtp-Source: ABdhPJwIR3jyEs4FOaU9PPZKtqm9MIFOEs8y6xSOmhb1ePrbVUvlvIkUx3bJEjie7eGEjSkP6v967A==
X-Received: by 2002:adf:f783:0:b0:207:a8ce:c155 with SMTP id
 q3-20020adff783000000b00207a8cec155mr16100705wrp.258.1650468895850; 
 Wed, 20 Apr 2022 08:34:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/34] build: move vhost-user-fs configuration to Kconfig
Date: Wed, 20 Apr 2022 17:34:04 +0200
Message-Id: <20220420153407.73926-32-pbonzini@redhat.com>
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

vhost-user-fs is a device and it should be possible to enable/disable
it with --without-default-devices, not --without-default-features.
Compute its default value in Kconfig to obtain the more intuitive
behavior.

In this case the configure options were undocumented, too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 12 ------------
 hw/virtio/Kconfig |  5 +++++
 meson.build       |  1 -
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 65ae2c0c1f..3b38ff3c63 100755
--- a/configure
+++ b/configure
@@ -286,7 +286,6 @@ vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_user="no"
-vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
 debug_tcg="no"
 sanitizers="no"
@@ -872,10 +871,6 @@ for opt do
   ;;
   --enable-vhost-crypto) vhost_crypto="yes"
   ;;
-  --disable-vhost-user-fs) vhost_user_fs="no"
-  ;;
-  --enable-vhost-user-fs) vhost_user_fs="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
@@ -1536,10 +1531,6 @@ test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-crypto requires --enable-vhost-user"
 fi
-test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
-if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
-fi
 
 # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
 if test "$vhost_net" = ""; then
@@ -2088,9 +2079,6 @@ fi
 if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_VDPA=y" >> $config_host_mak
 fi
-if test "$vhost_user_fs" = "yes" ; then
-  echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
-fi
 
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index b642ae1081..f8e235f814 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -78,3 +78,8 @@ config VHOST_USER_RNG
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_FS
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/meson.build b/meson.build
index b18731ee84..870dd8dee0 100644
--- a/meson.build
+++ b/meson.build
@@ -3679,7 +3679,6 @@ summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'build guest agent': have_ga}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
-- 
2.35.1



