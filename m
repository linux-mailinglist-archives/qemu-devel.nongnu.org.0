Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCE50CA63
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:08:36 +0200 (CEST)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFV5-0004EW-Ea
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFM-00079U-Nv
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFL-000587-5Y
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:20 -0400
Received: by mail-ej1-x633.google.com with SMTP id ks6so21215655ejb.1
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLWsnYF+UqLfKCHc9OyeJDEOn8a2VanbNuZfq+VHH+U=;
 b=CiCI0egPHy+0WEKiifD8Wua3pufTReNNOFVZx3iMKgT/0Wchhnduk1CjFV+sToyiiP
 49XQojUgyXi/GtmB2imshEPpcG52HHJfqG2lUWMKeH5YmBoRsi8AEDoNT2vnlGtXoFtr
 nZzPvLlV/c1avHMTT6ooCbiYMBfrKb09Y763xSeVgwdY/71Ro4lpDMLx7oFMfvfBEnZr
 WpWa/Th+V7qHk161rESHnn1fqQ2veVhYC+GmV34Zw7uk2YYt+ztGoHnGXDxyqdeq/GHM
 ulRRBr27weNl1zlymvWTvjYthTlpLt6mSKahrHMieE9cnbQPKp75Uz7tfr/PiEYyiyMM
 zlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GLWsnYF+UqLfKCHc9OyeJDEOn8a2VanbNuZfq+VHH+U=;
 b=fd8F3P4hbAAeUCzdGRpsy9VGnS7I6HZ1C90D7fFSjKB96aczr6k9CRZn9XYtxttDt5
 lSliTxJCazqalf/tYbXq2fY1roZq9jtd3GGfHeA78eE7oAQkQkE6JPv2xTz156ph7sbF
 dm8V/YEI/Lg3feFdE5gSSpIphYlAae9ouLhapKz9nnqF8AzbEZfFgjHMqd+cOl4iINBF
 AJlDrINoCbvQ5ixHYS6YjEh8OCnaMJ+yDZrgGpz86eDdrq35hiz/YJxRxC9q54DQPPRO
 sZ6EDxS1samD/prw8VGu5c96HXmhh6t1wdgs9rOH4lTnV67mB2YZzsknIjJGLnoluatp
 kzTA==
X-Gm-Message-State: AOAM5305YZ3EPjnC8rG6cx8lWbbrX/80vg9OJBMc/6Lr3s0eJUWLO0VT
 lfEcj7Z4xmxo98IjvbBet6hK5HrzmROi5Q==
X-Google-Smtp-Source: ABdhPJzrklrfntxoRFfs9A7KbpkZvIbJ+syov2Esu40kSXtktsZcBumZQVIc+jYdR8J+2jRAPWU1Jw==
X-Received: by 2002:a17:906:5d10:b0:6f3:65e6:5fcb with SMTP id
 g16-20020a1709065d1000b006f365e65fcbmr5221665ejt.212.1650718337843; 
 Sat, 23 Apr 2022 05:52:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/34] meson, configure: move usbfs test to meson
Date: Sat, 23 Apr 2022 14:51:27 +0200
Message-Id: <20220423125151.27821-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
index b39b157222..a26eb878ea 100644
--- a/meson.build
+++ b/meson.build
@@ -1938,6 +1938,19 @@ config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
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



