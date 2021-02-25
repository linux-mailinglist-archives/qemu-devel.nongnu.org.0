Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C393247C0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 01:07:28 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF4Bi-00043u-PE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 19:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF4Aq-0003d1-UX
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 19:06:32 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF4Ap-00072z-8m
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 19:06:32 -0500
Received: by mail-pl1-x630.google.com with SMTP id d16so2219225plg.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 16:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilFMwL81/HJFzXmHdgxxjT1vA6PLPohohxbATIDyLVY=;
 b=j6od4SeZAM48wVB3yF5QKLpzSPH9xRMceEfFYygS/GXwgBv62HciDhH99r3DEaah9f
 q6aeuzf23HwzSziJehqYMP7Bs6R1owy2VQK10U6JT3im42dGbO7byHWAg16V0eVV6pnh
 NH+YG6WUj002IsXbyrFxBMZ6G7aXU4/aci1BoBRarAoKrVsrVWNnCUXRBDk7YPdf1tvs
 R39G2fCpXUGGGcUByBQTij5YNNKDQKriVl+BmEEGhgwHWlcPKUblmXLpwtJUwhxzMh4x
 KVFhAb91pBf9BkLfGcEbZQAfC0KtVq0LGpRMq5SkmnQlbjupAWZIo1uhLplXNB8eSxfW
 NbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilFMwL81/HJFzXmHdgxxjT1vA6PLPohohxbATIDyLVY=;
 b=YhNY5d4AdDrPBOUEbcP0nsKCqSQ1dCm4b+GR1OGL0rJ7HaeLslT/S0bqlLBzYZcFLJ
 OGwYjJeoWZJ7AqztibD+lXr6HjI9YvJOsvmloMeLuRvyYUa19jJ3oYlVF/MIL0t+73Dk
 CildGpoXTOgE/L2muDx6oVVKlyBOviMlPixQx8g7Sd/MGpyn5SkZpDvX56/97D6a7NaH
 WQEv6YIIsrBGeRFOGImGOxVARL/eWY4TALwl8Rr4tCsw8uhOJYVEomWISVwK6w4dv0iH
 KRglyb0OqRPbpIw6Uvo9fBe54YjyxUrVtodPnS5l9XwfXEQF2jidO2sqm/8B0JErlfug
 02Sw==
X-Gm-Message-State: AOAM530dFgDsHaiPzwks8Z8Wy4Pe8idcd9z+5bRLuohaWzzT3MneLPQ4
 YfkinwrWy7Oht99TLPQEeweFaqA4/aELpQ==
X-Google-Smtp-Source: ABdhPJytlNFcq+rCD+YR7irtz3P50mISGKCFC8DrqCi/RKS1ZlCVzktXEiGjpuHd2XJNl7Vnl/HcTQ==
X-Received: by 2002:a17:902:6bca:b029:e2:c5d6:973e with SMTP id
 m10-20020a1709026bcab02900e2c5d6973emr565498plt.40.1614211588828; 
 Wed, 24 Feb 2021 16:06:28 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id j125sm4221220pfd.27.2021.02.24.16.06.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 16:06:28 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] hvf: Sign the code after installation
Date: Thu, 25 Feb 2021 09:06:14 +0900
Message-Id: <20210225000614.46919-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <419dbb9c-badd-25d8-1755-00978a592671@redhat.com>
References: <419dbb9c-badd-25d8-1755-00978a592671@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before this change, the code signed during the build was installed
directly.

However, the signature gets invalidated because meson modifies the code
to fix dynamic library install names during the install process.

It also prevents meson to strip the code because the pre-signed file is
not marked as an executable (although it is somehow able to perform the
modification described above).

With this change, the unsigned code will be installed and modified by
meson first, and a script signs it later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build                                      | 11 +++++++----
 scripts/{entitlement.sh => entitlement/build.sh} |  0
 scripts/entitlement/install.sh                   | 11 +++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)
 rename scripts/{entitlement.sh => entitlement/build.sh} (100%)
 create mode 100755 scripts/entitlement/install.sh

diff --git a/meson.build b/meson.build
index 05a67c20d93..76691023c2c 100644
--- a/meson.build
+++ b/meson.build
@@ -2224,7 +2224,7 @@ foreach target : target_dirs
     endif
 
     emulator = executable(exe_name, exe['sources'],
-               install: not exe_sign,
+               install: true,
                c_args: c_args,
                dependencies: arch_deps + deps + exe['dependencies'],
                objects: lib.extract_all_objects(recursive: true),
@@ -2235,17 +2235,20 @@ foreach target : target_dirs
 
     if exe_sign
       emulators += {exe['name'] : custom_target(exe['name'],
-                   install: true,
-                   install_dir: get_option('bindir'),
                    depends: emulator,
                    output: exe['name'],
                    command: [
-                     meson.current_source_dir() / 'scripts/entitlement.sh',
+                     meson.current_source_dir() / 'scripts/entitlement/build.sh',
                      meson.current_build_dir() / exe_name,
                      meson.current_build_dir() / exe['name'],
                      meson.current_source_dir() / 'accel/hvf/entitlements.plist'
                    ])
       }
+
+      meson.add_install_script('scripts/entitlement/install.sh',
+                               get_option('bindir') / exe_name,
+                               get_option('bindir') / exe['name'],
+                               meson.current_source_dir() / 'accel/hvf/entitlements.plist')
     else
       emulators += {exe['name']: emulator}
     endif
diff --git a/scripts/entitlement.sh b/scripts/entitlement/build.sh
similarity index 100%
rename from scripts/entitlement.sh
rename to scripts/entitlement/build.sh
diff --git a/scripts/entitlement/install.sh b/scripts/entitlement/install.sh
new file mode 100755
index 00000000000..0c88d48110d
--- /dev/null
+++ b/scripts/entitlement/install.sh
@@ -0,0 +1,11 @@
+#!/bin/sh -e
+#
+# Helper script for the install process to apply entitlements
+
+SRC="$1"
+DST="$2"
+ENTITLEMENT="$3"
+
+cd "$MESON_INSTALL_DESTDIR_PREFIX"
+mv -f "$SRC" "$DST"
+codesign --entitlements "$ENTITLEMENT" --force -s - "$DST"
-- 
2.24.3 (Apple Git-128)


