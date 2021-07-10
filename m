Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9F3C363E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 21:01:28 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2IEA-0001bY-4D
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 15:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2IBE-00080U-S1
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:58:24 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2IBC-00059c-Vr
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:58:24 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ee25so1370956edb.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7GMYG9kx9gyaDO8Y5Q5Qu1nbcLDtXJcZ+svAaZtMbg=;
 b=kLZELqgbt6F8p/a6uOdMDf5DXGPBahk0Z8L90CXQsUJuerPmJSEyosr6jg+TX9C5nk
 0UEZsME7ALYNlMdEn4EAKfaj/bt+u7ggMGIx/KEDzNujG+fqg5K5TrnE4nndiHQF5juT
 OWo0egmOexu3hmHE9SGU5a46U6fSFKTbsd0ToaVD2rYGNSP7g64IKCf4vi1W3UFFNIl0
 8A7uvh9bh9PwljioCS6Vg44M2yQh66vZ62j27hV80mTOTpDnftnRGiFC5BIK0tOA8+qa
 TUdvmSXrDh6gJqrGKUkrirxbQjHuvVjCEVzPFjJA+OZ9X63jjbblKd/vKNWzUkhM+EfM
 PwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O7GMYG9kx9gyaDO8Y5Q5Qu1nbcLDtXJcZ+svAaZtMbg=;
 b=iUZTzlWQr5sRgaLSofMqKEOjkcO7ezlg1wmIRO/N2b42kfAyPfr8hOe9Y4NxjkbJ/W
 IFoUIa8QMe0DrrZmyEOWi8g4PC+Avtf2zCcoeUilOzPnRr8pXP81PuAfj1HUdlsdCrqb
 Gab67pzPx7xrY6qwRWTAojGP6Qmdp/hNvnPyGYfBbV8o2v9BLoUe6P8YITLZ5oAL/nJ6
 rPeAjepGdTFWV4QTrzM4f5my7+3DSCiaSuoq0q1aXDhsCGeFjIvUif1CUkvYT1pWL37x
 dDMpiwypdxXUCztMnIgDFb4ckr70w/St5witVLfwJD2QLLFBULtqR/JPSkpwbdUI7e1n
 ojqw==
X-Gm-Message-State: AOAM533WSxnnqkjuzhFdqYuk7tCWGoWQ+WuFp7rV9KcNDS9/pmdKfX7w
 2es/v5qYc7pxq0sVGIPweqqZ0xI8Wt0=
X-Google-Smtp-Source: ABdhPJwHXFSLbSzy0w5SC4HMFtrcVtb52zAIQYO+8/nuXkT/Mwa+bVbv7o42TgXxXuyh8XROKi4hEQ==
X-Received: by 2002:a05:6402:16:: with SMTP id
 d22mr55433748edu.101.1625943501828; 
 Sat, 10 Jul 2021 11:58:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g8sm5096976edw.89.2021.07.10.11.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 11:58:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 48/48] meson: Use input/output for entitlements target
Date: Sat, 10 Jul 2021 20:58:18 +0200
Message-Id: <20210710185818.444407-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710185818.444407-1-pbonzini@redhat.com>
References: <20210710185818.444407-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

input/output parameters respect dependencies.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210709012533.58262-1-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build            | 30 +++++++++++++++++-------------
 scripts/entitlement.sh | 10 +++++-----
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index 651c3b114b..b2e8731410 100644
--- a/meson.build
+++ b/meson.build
@@ -2609,28 +2609,32 @@ foreach target : target_dirs
                link_args: link_args,
                gui_app: exe['gui'])
 
-    if 'CONFIG_HVF' in config_target
-      entitlements = meson.current_source_dir() / 'accel/hvf/entitlements.plist'
-    else
-      entitlements = '/dev/null'
-    endif
     if targetos == 'darwin'
-      icon = meson.current_source_dir() / 'pc-bios/qemu.rsrc'
+      icon = 'pc-bios/qemu.rsrc'
+      build_input = [emulator, files(icon)]
+      install_input = [
+        get_option('bindir') / exe_name,
+        meson.current_source_dir() / icon
+      ]
+      if 'CONFIG_HVF' in config_target
+        entitlements = 'accel/hvf/entitlements.plist'
+        build_input += files(entitlements)
+        install_input += meson.current_source_dir() / entitlements
+      endif
+
       emulators += {exe['name'] : custom_target(exe['name'],
-                   depends: emulator,
+                   input: build_input,
                    output: exe['name'],
                    command: [
-                     meson.current_source_dir() / 'scripts/entitlement.sh',
-                     meson.current_build_dir() / exe_name,
-                     meson.current_build_dir() / exe['name'],
-                     entitlements, icon
+                     files('scripts/entitlement.sh'),
+                     '@OUTPUT@',
+                     '@INPUT@'
                    ])
       }
 
       meson.add_install_script('scripts/entitlement.sh', '--install',
-                               get_option('bindir') / exe_name,
                                get_option('bindir') / exe['name'],
-                               entitlements, icon)
+                               install_input)
     else
       emulators += {exe['name']: emulator}
     endif
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
index d2a7079ce3..e2c956a3ac 100755
--- a/scripts/entitlement.sh
+++ b/scripts/entitlement.sh
@@ -8,10 +8,10 @@ if [ "$1" = --install ]; then
   in_place=false
 fi
 
-SRC="$1"
-DST="$2"
-ENTITLEMENT="$3"
-ICON="$4"
+DST="$1"
+SRC="$2"
+ICON="$3"
+ENTITLEMENT="$4"
 
 if $in_place; then
   trap 'rm "$DST.tmp"' exit
@@ -21,7 +21,7 @@ else
   cd "$MESON_INSTALL_DESTDIR_PREFIX"
 fi
 
-if test "$ENTITLEMENT" != '/dev/null'; then
+if test -n "$ENTITLEMENT"; then
   codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
 fi
 
-- 
2.31.1


