Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316A4508C66
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:48:21 +0200 (CEST)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCZ2-0000bl-9j
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLb-0001ON-Mt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLY-0000uz-Us
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1477314wmz.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJFWLBx1qgTPO4K//YqBRHJ2aHyd4vG27x4r9P8ldo8=;
 b=APDmze/rvttgA63RpVyvrDsUKh3YVi8FG3dnu9JWdeYtAkWruyo32IPK9lYvnVY4eS
 4wVanzGIGYiGgDlTYdslDcWNIsT5Il9Vtnn8Qz0PCo3xjNDiTstMHyx/wOgCqoWvzkzE
 cYNiGxcU68PZbNARrmbBbtRwTtTuDVY/6cT+JTyfuPao6nMixbBUroGRmWAWkhVnncXT
 yAub8ASb0kKAdxTVSSvmdvCNPknohdJU6eC4y04JvgA11z5RGXq1OLorXhkc4ttfPhw9
 4jD19KgcisWFrz3yJjptpoWIUUpkgdVWOudoWyDS1JIjyQ/XQb7aLyG8kR17UTVJMFRU
 EExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dJFWLBx1qgTPO4K//YqBRHJ2aHyd4vG27x4r9P8ldo8=;
 b=h1JRvJzsKzGYmMmmpJPw2p/BV11HpPW/9+M/TBiHyB5vwMBL8MUW6vp+q/p5X3ef2N
 GgFHhwlz4lZEWltbUgGNEgBZl7ssX0T6q5CT5l/LGcTgMEe06wfjipWXspHR7THUaNM3
 Rr34N4a3XLyz4K9YSfcxvyxaecY9Jy2O1HGGjBxiOtESgEahAp/Kp9zTtKsGdCi63I+n
 8pLfFrKWGhnYJe57fdmwFymdOukD/7/ammr8pSRzvYsheoBTib0N5zKz/NeYnJGpRLjD
 TUWfdW864BQhMAP9L5AK5O/j7TcvlnmpHqxjXc9qJ4OGOnTnLQDoUsfbd12ex++kitia
 JkLg==
X-Gm-Message-State: AOAM5325BUQFJfQ+tpvW9i8fRf/6UZ1hTMFUILUJir1czniLYHOdro44
 0AzdXLOoRxRqbM4T+LpV/Wb6pO4PFds1dw==
X-Google-Smtp-Source: ABdhPJxtXcvIJVFMyr8jtyuou1+XtoKhJ+IuWdHqBIn1aQY/YO71WoNpFsZ6EkuykTgtoxDfzhVOwg==
X-Received: by 2002:a05:600c:5006:b0:392:3077:789c with SMTP id
 n6-20020a05600c500600b003923077789cmr4324145wmr.50.1650468863311; 
 Wed, 20 Apr 2022 08:34:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/34] meson, configure: move usbfs test to meson
Date: Wed, 20 Apr 2022 17:33:43 +0200
Message-Id: <20220420153407.73926-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 28 ----------------------------
 meson.build | 13 +++++++++++++
 2 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/configure b/configure
index 1c74d2c5f2..d4d7c001f6 100755
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
index 066bb69174..c0b2838d2e 100644
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



