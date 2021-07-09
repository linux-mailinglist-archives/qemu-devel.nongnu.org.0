Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBB3C1CFE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:27:02 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1fID-0002n3-IV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1fGz-00019e-0W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 21:25:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1fGx-0000q5-4O
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 21:25:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso7331216pjc.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TCMcovb2XkRpdv2nToJwj5bMiFKFI+eovpMfc61V0xU=;
 b=D5ofqSP/RmcLPqse2Z//QSUFSgB99HeTxC4yxhAX+YFSdACbTNqYdMxnIjK/6jgSUf
 WasKYiL4zduR8NfVD1nIEQfSHTcVyHcfudsiw6wEmVqY7e8551Qq3dWkv5Xqj6XvObuR
 3bZn5GK23K6eapz393m5+LTCyOxPGNTyGOgphJjNy7jcGOVODQkLMhehzQY2bGpA9YC2
 PhX/VuNS/CvUYVuliSUAqc5SOfb6GeCL3cHljJVCSXaY7k4dW3u1V1B9NZPBh5wjrhPv
 LPGGSMJz3kBKiaB9aCVgtn2nCvigmnGWLERkQUoXiOaPGabfAX55ABpqYIoHzhZKC5Qg
 EkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TCMcovb2XkRpdv2nToJwj5bMiFKFI+eovpMfc61V0xU=;
 b=PNXa5DCgq4hLvcel/LyYOb/3S3s4/HXc2FkC+KoBXtK1sUFv+QihiP+/GnYmpAbfFp
 s40VaTi2foF+BQ2JlICtgT4/Tze89egexBbEpM6VFZ3eYPRuhUC0vpjxnmXC6unTKZ6d
 fM1aSA7uNkIsTUIb4b6kNUNCjQ1hbD/2f8Xdumb20sBXV0Y3xy96pECd7H1HWgeOZTxE
 d/t42QXn8ysPaYRrW1TXMNUuEQmMW6PE5//p/kRJFYDgHUn6jbblQQT6eUhqR2MA+5XL
 Ykce30KalGR/A5f/F+gPB3NjaD6BWf8gkaJYLE1OOnIrayp5VYOfumR6uZ8Cnf0XyZ8d
 5lzw==
X-Gm-Message-State: AOAM530BSy1a7xbIbkFM7pi+IAEvSmZvn5ZXN6UL5ipdVJhPF6uwM2SQ
 zLnAVeO9EhAlE/JsLe6F4xjKg8kzn1Sr+A==
X-Google-Smtp-Source: ABdhPJyxW2DyiFt4Woz0JSlBXMmecldILUFsSljQf/YxUMiVlf1Vi54Yc+nO3E98rq6SshS1GcwTQA==
X-Received: by 2002:a17:902:9a46:b029:129:acad:4551 with SMTP id
 x6-20020a1709029a46b0290129acad4551mr14350451plv.17.1625793941336; 
 Thu, 08 Jul 2021 18:25:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:206a:67b9:1ee9:8095])
 by smtp.gmail.com with ESMTPSA id g17sm5002955pgh.61.2021.07.08.18.25.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 18:25:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] meson: Use input/output for entitlements target
Date: Fri,  9 Jul 2021 10:25:33 +0900
Message-Id: <20210709012533.58262-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

input/output parameters respect dependencies.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build            | 30 +++++++++++++++++-------------
 scripts/entitlement.sh | 10 +++++-----
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index 7e12de01bec..d21adecc0d8 100644
--- a/meson.build
+++ b/meson.build
@@ -2521,28 +2521,32 @@ foreach target : target_dirs
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
index d2a7079ce3e..e2c956a3ac9 100755
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
2.30.1 (Apple Git-130)


