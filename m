Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB45512D40
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:44:22 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyp3-00074T-CB
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2D-0000SU-U8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:54 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2C-00057j-Bu
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:53 -0400
Received: by mail-ej1-x636.google.com with SMTP id l18so7593555ejc.7
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dssSWM493xy0rMyl8qHyVLudLAho+fC1PyDd65Xf9oU=;
 b=bvc3enIKqL+zCCY0r6znEb6+YxfxIcsyWZttRynexgV3pX+LS7daSFpkG9sIqPcWmg
 v/D7/64XpUXPeaDLlKIpcSz9V6h1JcdwCEZEfFHuadYkvJn7MAq+GEOtt5SZtcg4OB5f
 GeWXLJ8NrcJbjYbIWVcfNMQNqeqn4NY7n9vrAuNmvIoFipN7GzSWERN4ZvyobIXaJVrv
 YT+6YoObnPhh009XGT17LVs3u1gCoam1Mx1/o3+s9oxRuk7IsJrYFk//4v3qjeymTUc1
 yCBEA1QDjchFQthpeAw/hvu2LLGmz4sPW29Srt+04VMi96fCtwlMBUFk37LISJHom6jv
 raow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dssSWM493xy0rMyl8qHyVLudLAho+fC1PyDd65Xf9oU=;
 b=auqcFNej73ZKf3drg6i9jgCZPQ7EsIg9bzCyzqy1rXBOiW89GK3GdRG82bQw/U4joY
 wcQHv3SSxOzeLSt7q3JHj3CAcH1ALbMenG89yqDzpXx2y0pdnC4N14zYX56FlMLrx5uV
 /mvTNqbe2APBNNRO/T6XZxbRU3Y9hbDkTuhi2uI5gLmoOmmN72Gm2AK60jwH3riNcsAl
 q+Znwkn0blZk4fRoWPZtdS7AnqaWJi+/RY4To1lpOLv3tmjcrQoZKLo05LdEuRlFrAAN
 X5X0IFWR0NLmtxoI/LtrS7C2Nbik2ZzGpmgNN4dAdJH4TPLY6HcCmiXN+Rt3womDwvWQ
 Edfw==
X-Gm-Message-State: AOAM531X373Ee/oiNoChebdaDj18zSPPSJW8n8dCflAoBpI35ob/PzOw
 usK5xZr8SnW/StBg9e4iObzJIgyIGnekNg==
X-Google-Smtp-Source: ABdhPJwz/kMvpFO9hJccme5fXs4RiylgXoFQH3cLKrlFwjxbZ9SxK715YAIPMJVtmRGRQqnVV0yLMw==
X-Received: by 2002:a17:906:7c96:b0:6f3:b6c4:7b2 with SMTP id
 w22-20020a1709067c9600b006f3b6c407b2mr10978277ejo.676.1651128828434; 
 Wed, 27 Apr 2022 23:53:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] meson, configure: move usbfs test to meson
Date: Thu, 28 Apr 2022 08:53:31 +0200
Message-Id: <20220428065335.189795-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 28 ----------------------------
 meson.build | 13 +++++++++++++
 2 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index 313579019d..d527a9c22e 100755
--- a/configure
+++ b/configure
@@ -2160,31 +2160,6 @@ case "$fdt" in
     ;;
 esac
 
-##########################################
-# check for usbfs
-have_usbfs=no
-if test "$linux_user" = "yes"; then
-  cat > $TMPC << EOF
-#include <linux/usbdevice_fs.h>
-
-#ifndef USBDEVFS_GET_CAPABILITIES
-#error "USBDEVFS_GET_CAPABILITIES undefined"
-#endif
-
-#ifndef USBDEVFS_DISCONNECT_CLAIM
-#error "USBDEVFS_DISCONNECT_CLAIM undefined"
-#endif
-
-int main(void)
-{
-    return 0;
-}
-EOF
-  if compile_prog "" ""; then
-    have_usbfs=yes
-  fi
-fi
-
 ##########################################
 # capstone
 
@@ -2641,9 +2616,6 @@ fi
 if test "$module_upgrades" = "yes"; then
   echo "CONFIG_MODULE_UPGRADES=y" >> $config_host_mak
 fi
-if test "$have_usbfs" = "yes" ; then
-  echo "CONFIG_USBFS=y" >> $config_host_mak
-fi
 if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 64161dffe7..c99b28a5ef 100644
--- a/meson.build
+++ b/meson.build
@@ -1940,6 +1940,19 @@ config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
     return getauxval(AT_HWCAP) == 0;
   }'''))
 
+config_host_data.set('CONFIG_USBFS', have_linux_user and cc.compiles('''
+  #include <linux/usbdevice_fs.h>
+
+  #ifndef USBDEVFS_GET_CAPABILITIES
+  #error "USBDEVFS_GET_CAPABILITIES undefined"
+  #endif
+
+  #ifndef USBDEVFS_DISCONNECT_CLAIM
+  #error "USBDEVFS_DISCONNECT_CLAIM undefined"
+  #endif
+
+  int main(void) { return 0; }'''))
+
 have_keyring = get_option('keyring') \
   .require(targetos == 'linux', error_message: 'keyring is only available on Linux') \
   .require(cc.compiles('''
-- 
2.35.1



