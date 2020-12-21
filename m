Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731C2DFD02
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:48:07 +0100 (CET)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMTm-0006kP-I2
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQg-0004hT-IA
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:54 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQe-0007cn-8M
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id 91so11311741wrj.7
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUIOh4Q+WvEg2+2buyUeFeWSyxEP3rr0TYbdSrhdRw4=;
 b=BECO+yOG+vI/hYg6ddf9g7aqWDpPAXsB5O5nQiJNXOpjafZmpdgJqg9xrb5Nm3KLqJ
 s79F+JwfPj1BmGMslJVKopkvdCsLVmpOD4/zebJyGDVB1fugBJY6AbTiPAMIWa/gI83V
 KklpyhOAMfes1ryA9en0Wgo3Li1Or/fF+gWoeURTJqRvzjo7Jk4rk4cDyv1623ijkU1G
 DF3IUcF4ca9AglqmOk5jyCLvJy/ftRq0bjXM/ojduWFtYXCmo1pzztCHVeAthtlOvDN2
 5rI/bBwEX9l1PWzWMGf7BuyNterQR8V3EM0GIsvwYqov4KNbXXS04pev1djLkLkZBAZQ
 BOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TUIOh4Q+WvEg2+2buyUeFeWSyxEP3rr0TYbdSrhdRw4=;
 b=FLYQ8tK3PzTmtTdporbecm0QNsY3x8R5mR2kMq9zqoV9ds09uUjs1AbwyUfb1WHt1I
 JinA1K4a+oRh7QNm8cXVdF5hMMYIgV/Rcodjv/2J5JycQMhdTII+hNKCkSqK54fA/4Ed
 EOPLhJmLsIsf3akcN4ElKX52ON2qTEQInbEXbICDWe686eYUWFxmTwHeL9QwqbFId6kb
 t/vpZl5KZhfB+H1HQ743cQ/Wg7BRfhoAUGpGMXdZB/CnHLCje7zOr50Q2Z63Oh0S/p/t
 5G6OpB8wcy8gTcSsc9BWORHKr+Ztl9qzANW6eNY4GfS9/wc7U4sqQJZ4afc6Mkf3poS6
 5qhA==
X-Gm-Message-State: AOAM531d/8gDBfwft1PGLkrCDDYCiFrqRPq3gy6civGhWw8/Fe8sZQOV
 iMwX2s2pdU3ZQXnbE26DVP67jd65f40=
X-Google-Smtp-Source: ABdhPJxYA89aK7KswgQn/QXxwUlWt0URNBjZRAFDLQY/ZyQiefp3n0axW0Nmk3jxU6tpX4wJG3mWnQ==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr18778726wrq.75.1608561890980; 
 Mon, 21 Dec 2020 06:44:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/55] configure: move gettext detection to meson.build
Date: Mon, 21 Dec 2020 15:43:54 +0100
Message-Id: <20201221144447.26161-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

This will allow meson to honour -Dauto_features=disabled later.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201210190417.31673-4-alex.bennee@linaro.org>
---
 configure         | 19 +++----------------
 meson_options.txt |  2 +-
 po/meson.build    |  2 +-
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index c228f7c21e..134f5de5ab 100755
--- a/configure
+++ b/configure
@@ -448,7 +448,7 @@ libdaxctl=""
 meson=""
 ninja=""
 skip_meson=no
-gettext=""
+gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
 
@@ -1016,9 +1016,9 @@ for opt do
   ;;
   --enable-vnc) vnc="enabled"
   ;;
-  --disable-gettext) gettext="false"
+  --disable-gettext) gettext="disabled"
   ;;
-  --enable-gettext) gettext="true"
+  --enable-gettext) gettext="enabled"
   ;;
   --oss-lib=*) oss_lib="$optarg"
   ;;
@@ -2847,19 +2847,6 @@ if test "$xen_pci_passthrough" != "disabled"; then
   fi
 fi
 
-##########################################
-# gettext probe
-if test "$gettext" != "false" ; then
-  if has xgettext; then
-    gettext=true
-  else
-    if test "$gettext" = "true" ; then
-      feature_not_found "gettext" "Install xgettext binary"
-    fi
-    gettext=false
-  fi
-fi
-
 ##########################################
 # X11 probe
 if $pkg_config --exists "x11"; then
diff --git a/meson_options.txt b/meson_options.txt
index 74ac853548..f8f053b5c8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -9,7 +9,7 @@ option('sphinx_build', type : 'string', value : '',
 
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
-option('gettext', type : 'boolean', value : true,
+option('gettext', type : 'feature', value : 'auto',
        description: 'Localization of the GTK+ user interface')
 option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
diff --git a/po/meson.build b/po/meson.build
index 1387fd979a..a863f0575f 100644
--- a/po/meson.build
+++ b/po/meson.build
@@ -1,6 +1,6 @@
 i18n = import('i18n')
 
-if get_option('gettext')
+if find_program('xgettext', required: get_option('gettext')).found()
   i18n.gettext(meson.project_name(),
                args: '--msgid-bugs-address=qemu-devel@nongnu.org',
                preset: 'glib')
-- 
2.29.2



